Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81BD6DBFAA
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 13:33:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plTGz-0004BV-11; Sun, 09 Apr 2023 07:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1plTGv-00049B-Rq
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 07:31:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1plTGt-0002jc-LP
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 07:31:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 579D84000C;
 Sun,  9 Apr 2023 14:31:43 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 840B0DD;
 Sun,  9 Apr 2023 14:31:42 +0300 (MSK)
Message-ID: <ddeaf5a3-1d3d-d6ef-a523-29a67716fbc1@msgid.tls.msk.ru>
Date: Sun, 9 Apr 2023 14:31:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] linux-user: ppoll: eliminate large alloca
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20221216192220.2881898-1-mjt@msgid.tls.msk.ru>
 <6b04aaaf-75a1-6578-c975-148508656382@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <6b04aaaf-75a1-6578-c975-148508656382@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

(Replying to an old(ish) email... original thread:
https://patchwork.ozlabs.org/project/qemu-devel/patch/20221216192220.2881898-1-mjt@msgid.tls.msk.ru/ )

16.12.2022 23:44, Richard Henderson wrote:
> On 12/16/22 11:22, Michael Tokarev wrote:
>> do_ppoll() in linux-user/syscall.c uses alloca() to
>> allocate an array of struct pullfds on the stack.
>> The only upper boundary for number of entries for this
>> array is so that whole thing fits in INT_MAX. But this
>> is definitely too much for a stack allocation.
>>
>> Use heap allocation when large number of entries
>> is requested (currently 128, arbitrary), and continue
>> to use alloca() for smaller allocations, to optimize
>> small operations for small sizes.
> 
> I think it would be cleaner to always use heap allocation, and use g_autofree for the pointer.

Yes it is cleaner to always use the same type of allocation.
Does it really unnecessary to try to avoid heap allocations
for small things? It costs not that much, but might speed
some things up. Dunno how much it saves though.  Maybe it
is from the "premature optimization" field :)

Speaking of g_autofree, we already have to unlock_user anyway
(which we forgot to call), - so it makes no difference
between marking it as g_autofree or explicitly freeing it.

Thanks,

/mjt

