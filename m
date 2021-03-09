Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0923330BD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:17:30 +0100 (CET)
Received: from localhost ([::1]:41144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjjN-0006KJ-Dj
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vfazio@xes-inc.com>)
 id 1lJjXJ-0005iZ-J6; Tue, 09 Mar 2021 16:05:01 -0500
Received: from mail.xes-mad.com ([162.248.234.2]:17586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vfazio@xes-inc.com>)
 id 1lJjXG-00081T-VY; Tue, 09 Mar 2021 16:05:01 -0500
Received: from [10.52.16.140] (vfazio1.xes-mad.com [10.52.16.140])
 by mail.xes-mad.com (Postfix) with ESMTP id D416B2C552;
 Tue,  9 Mar 2021 15:04:57 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
 t=1615323897; bh=EFPPWro3/yCkL2d+hX0pX4Rt3gmxrlJSyX6XFFjMD44=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iUTrAVSIFQwB2rOPmDa7avfF8EyB5JaiU5fShZoxxvjTveTastD+L+13unSDysnXd
 ni7zSX676NPxaeKdm6L7zsEowerUz+U4FJuriG1XeGFrUEMgcRt9u4GOKl+qVjGSI2
 gkOg6XB1a7FMyOwyPHUG8RsYO9gpwCrmkjMqRObc=
Subject: Re: [PATCH] linux-user/elfload: fix address calculation in fallback
 scenario
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210131061948.15990-1-vfazio@xes-inc.com>
 <9a208031-b46f-9a28-067b-e2f622784a63@vivier.eu>
From: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <cbc43733-8639-c1b0-fc5e-916d05a448be@xes-inc.com>
Date: Tue, 9 Mar 2021 15:04:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9a208031-b46f-9a28-067b-e2f622784a63@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=162.248.234.2; envelope-from=vfazio@xes-inc.com;
 helo=mail.xes-mad.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Vincent Fazio <vfazio@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pinging per Laurent.

On 2/13/21 3:48 PM, Laurent Vivier wrote:
> Le 31/01/2021 à 07:19, Vincent Fazio a écrit :
>> From: Vincent Fazio <vfazio@gmail.com>
>>
>> Previously, guest_loaddr was not taken into account when returning an
>> address from pgb_find_hole when /proc/self/maps was unavailable which
>> caused an improper guest_base address to be calculated.
>>
>> This could cause a SIGSEGV later in load_elf_image -> target_mmap for
>> ET_EXEC type images since the mmap MAP_FIXED flag is specified which
>> could clobber existing mappings at the address returnd by g2h().
>>
>>    mmap(0xd87000, 16846912, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESERVE|0x100000, -1, 0) = 0xd87000
>>    munmap(0xd87000, 16846912)              = 0
>>    write(2, "Locating guest address space @ 0"..., 40Locating guest address space @ 0xd87000) = 40
>>    mmap(0x1187000, 16850944, PROT_NONE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS|MAP_NORESERVE, -1, 0) = 0x1187000
>>    --- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_ACCERR, si_addr=0x2188310} ---
>>    +++ killed by SIGSEGV +++
>>
>> Now, pgd_find_hole accounts for guest_loaddr in this scenario.
>>
>> Fixes: ad592e37dfcc ("linux-user: provide fallback pgd_find_hole for bare chroots")
>> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
>> ---
>>   linux-user/elfload.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
>> index 8d425f9ed0..6d606b9442 100644
>> --- a/linux-user/elfload.c
>> +++ b/linux-user/elfload.c
>> @@ -2242,7 +2242,8 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
>>       brk = (uintptr_t)sbrk(0);
>>   
>>       if (!maps) {
>> -        return pgd_find_hole_fallback(guest_size, brk, align, offset);
>> +        ret = pgd_find_hole_fallback(guest_size, brk, align, offset);
>> +        return ret - guest_loaddr;
>>       }
>>   
>>       /* The first hole is before the first map entry. */
>>
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> 
> CC: Alex
> 

