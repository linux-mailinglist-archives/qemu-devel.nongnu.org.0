Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0E1585676
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 23:22:45 +0200 (CEST)
Received: from localhost ([::1]:42328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHXRU-0007BB-8t
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 17:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raimue@codingfarm.de>)
 id 1oHXOI-00059q-HG
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 17:19:26 -0400
Received: from donkey.codingfarm.de ([2a01:4f8:190:12cf::d:1]:39994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raimue@codingfarm.de>)
 id 1oHXOE-0004P7-Hh
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 17:19:24 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by donkey.codingfarm.de (Postfix) with ESMTPSA id C7C4C8F267;
 Fri, 29 Jul 2022 23:19:17 +0200 (CEST)
Message-ID: <dd5df8a5-c406-43a0-7557-0c1653f70de6@codingfarm.de>
Date: Fri, 29 Jul 2022 23:19:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.23)
 Gecko/20090925 Thunderbird/2.0.0.23 Mnenhy/0.7.5.0
Subject: Re: [PATCH v2] linux-user: Use memfd for open syscall emulation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20220725162811.87985-1-raimue@codingfarm.de>
 <20220729154951.76268-1-raimue@codingfarm.de>
 <d03974ec-4b8b-2ba2-cfe8-5c235d937b76@linaro.org>
From: =?UTF-8?Q?Rainer_M=c3=bcller?= <raimue@codingfarm.de>
In-Reply-To: <d03974ec-4b8b-2ba2-cfe8-5c235d937b76@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:190:12cf::d:1;
 envelope-from=raimue@codingfarm.de; helo=donkey.codingfarm.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/07/2022 18.01, Richard Henderson wrote:
> On 7/29/22 08:49, Rainer Müller wrote:
>> +            /* create temporary file to map stat to */
>> +            tmpdir = getenv("TMPDIR");
>> +            if (!tmpdir)
>> +                tmpdir = "/tmp";
>> +            snprintf(filename, sizeof(filename),
>> "%s/qemu-open.XXXXXX", tmpdir);
>> +            fd = mkstemp(filename);
>> +            if (fd < 0) {
>> +                return fd;
>> +            }
> 
> We've been using g_file_open_tmp elsewhere; probably good to follow suit
> here.

That seemed reasonable at first, but with regards to error handling it
gets a bit complicated.

The suggested g_file_open_tmp() would leave us with a GError only, but
to return something meaningful to the caller we must set errno in this
context. As far as I can see, there is no way to convert back to an
errno from GError.

With g_file_open_tmp() we could always set the same generic errno, but
that would hide the real cause completely. I debugged this problem with
this message that was confusing, but at least it gave away a hint:
  cat: can't open '/proc/self/stat': Read-only file system

The other option would be to g_assert_true(fd >= 0) and kill the process
in case opening the temporary file failed. This also feels wrong, as the
caller could still recover from this state and continue.

Rainer

