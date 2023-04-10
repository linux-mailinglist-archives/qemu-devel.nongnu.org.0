Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7A6DC410
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 09:57:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plmNb-0005js-Kf; Mon, 10 Apr 2023 03:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1plmNY-0005jc-Bf
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 03:55:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1plmNW-00062N-H9
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 03:55:56 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 470EF400F6;
 Mon, 10 Apr 2023 10:55:50 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C3070DD;
 Mon, 10 Apr 2023 10:55:49 +0300 (MSK)
Message-ID: <943227b5-a9e2-3f7c-1111-382a08f2391d@msgid.tls.msk.ru>
Date: Mon, 10 Apr 2023 10:55:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: qemu-user: avoid allocations to convert stuff when not necessary
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: Laurent Vivier <laurent@vivier.eu>
References: <cd93a0e0-6047-c511-9b96-35bf4e0adce0@msgid.tls.msk.ru>
 <056da0a5-5437-0cac-a2a0-c992386bf4c2@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <056da0a5-5437-0cac-a2a0-c992386bf4c2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -97
X-Spam_score: -9.8
X-Spam_bar: ---------
X-Spam_report: (-9.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.888,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

09.04.2023 19:27, Richard Henderson пишет:
> On 4/9/23 01:52, Michael Tokarev wrote:
>> Hi!
>>
>> In the qemu-user case, we allocate various structures and arrays
>> for conversion of data between host and guest byte orders and sizes.
>> But it is actually not necessary to do such allocation when the
>> *size* is the same, and only byte order is different, because the
>> conversion can be done in-place.  Does it make any sense to avoid'
>> allocations in such cases?
> 
> Alignment can also change.  This is especially visible with m68k guest, where even 'int' is 2-byte aligned.

I didn't think about the alignment. So such optimization has less and
less chances to happen. I see.

> So, no.  It's best to just allocate and convert always.

Yes, this makes good sense.

Thanks!

/mjt


