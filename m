Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14AE6F7159
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:43:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucof-0007B3-4A; Thu, 04 May 2023 13:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1puZHu-0004Rz-AI
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:46:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1puZHs-0003XN-HU
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:46:26 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 23694400F1;
 Thu,  4 May 2023 16:46:19 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1ED899E;
 Thu,  4 May 2023 16:46:18 +0300 (MSK)
Message-ID: <56612784-83f6-6487-9861-43fec5742ac6@msgid.tls.msk.ru>
Date: Thu, 4 May 2023 16:46:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4] linux-user: fix getgroups/setgroups allocations
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230409105327.1273372-1-mjt@msgid.tls.msk.ru>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230409105327.1273372-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -111
X-Spam_score: -11.2
X-Spam_bar: -----------
X-Spam_report: (-11.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

09.04.2023 13:53, Michael Tokarev wrote:
> linux-user getgroups(), setgroups(), getgroups32() and setgroups32()
> used alloca() to allocate grouplist arrays, with unchecked gidsetsize
> coming from the "guest".  With NGROUPS_MAX being 65536 (linux, and it
> is common for an application to allocate NGROUPS_MAX for getgroups()),
> this means a typical allocation is half the megabyte on the stack.
> Which just overflows stack, which leads to immediate SIGSEGV in actual
> system getgroups() implementation.

Ping?

Thanks,

/mjt

