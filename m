Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3726DBF4D
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 11:07:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plR03-0007Lv-J1; Sun, 09 Apr 2023 05:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1plQzy-0007Lk-BW
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 05:06:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1plQzt-00084q-65
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 05:06:09 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2CD3A4000C;
 Sun,  9 Apr 2023 12:06:01 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 8F397DD;
 Sun,  9 Apr 2023 12:06:00 +0300 (MSK)
Message-ID: <7a3beebe-5593-8fda-f8ec-7e08789da12f@msgid.tls.msk.ru>
Date: Sun, 9 Apr 2023 12:06:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] linux-user: fix getgroups/setgroups allocations
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20221217093127.3085329-1-mjt@msgid.tls.msk.ru>
 <8ce38f3c-1f24-c3fb-bf49-deb265418163@vivier.eu>
 <3027627c-e8ce-c2fc-1ffe-85850968b131@vivier.eu>
 <128e1f17-b069-b45d-5b2a-1a2fceeabe27@linaro.org>
 <ab6d983a-1ff1-6555-2f28-e765277150c1@vivier.eu>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <ab6d983a-1ff1-6555-2f28-e765277150c1@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.113,
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

04.02.2023 01:23, Laurent Vivier wrote:
> Le 03/02/2023 à 22:57, Richard Henderson a écrit :
>> On 2/3/23 11:49, Laurent Vivier wrote:

..
>>> I'm going to remove this patch from my branch because it breaks something.
>>>
>>> When I execute LTP test suite (20200930), I have:
>>>
>>> getgroups01    1  TPASS  :  getgroups failed as expected with EINVAL
>>> **
>>> ERROR:../../../Projects/qemu/accel/tcg/cpu-exec.c:998:cpu_exec_setjmp: assertion failed: (cpu == current_cpu)
>>> Bail out! ERROR:../../../Projects/qemu/accel/tcg/cpu-exec.c:998:cpu_exec_setjmp: assertion failed: (cpu == current_cpu)
>>
>> Which host+guest?
> 
> host is x86_64 + Fedora 37 (QEMU needs to be patched to detect missing libdw static library)
> guest is all, replicated with m68k/sid
> 
> Note that the error is generated with the test case that expects EINVAL.

Hm. I missed this one at its time.  The patch's in debian qemu for quite some time
without any issues so far.

Laurent, can you describe what you're doing there in a bit more details please?
I'd love to fix this one.  Do you know which test is/was failing?

Thanks,

/mjt

