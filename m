Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A472752B094
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 04:52:32 +0200 (CEST)
Received: from localhost ([::1]:49054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr9nb-0005KX-74
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 22:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nr9mR-0004TO-FW
 for qemu-devel@nongnu.org; Tue, 17 May 2022 22:51:19 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:45578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nr9mO-00021R-Uz
 for qemu-devel@nongnu.org; Tue, 17 May 2022 22:51:19 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so700434pjh.4
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 19:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Bwyhzmtjj3kJEHJL+76I91nYiTMNAC0CXEfYNCvSPcg=;
 b=VSbfFS1wkB81N28vApUKpv/N7MxtudCpqrCaRBQkX7agVwKR/eBqAC/hlv06ZY5MLs
 1+fpMC0rjBadNH0JK1HYcP0wY+HYq+BpqUv4Cydubu/tTunS/CfPJvAYxWGqJ/m+n7RK
 m/okW3KAui4/Y5cLSiBuGp5AJvOxbTARQERyVMySQxzX02LPB+YmeP8qILwrjKOyr1ZY
 Eh0yvf6QQo9bqghqmhBrIJAozxUj1zD0Bms2slmTGuOydL8Eia+JZn5Jm3v77okO0gDb
 6xgf0h8PnxDHIoEdLgdl/+AT6eLeBAgRcdrARZH8+fSnd8JxAG8Sv/7LNfx2LtfGho3q
 Vukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bwyhzmtjj3kJEHJL+76I91nYiTMNAC0CXEfYNCvSPcg=;
 b=OKl9NTfQLlKtYe0iXBLA986Xr4UiUv2TgUyoQjxTYNqOan9Lugp5bQw2JsfyBBK48I
 3wStR8f9ke4/2SfLaVrdelv6veZ6m2AigYXmpiz4UpwaDgk6z63JD1JgCqxFkTpLrNAi
 hVpe3Qo5apTl41LgEo7G1WSB5Y+D1LamrSowlDxsUI9kY82bGjpw4sQH6sUMOf6cVOmQ
 rgO5UK+weTRMstFwOIScDvet+1bHH4mBo86ROPAZL9y+oc3cZyha+znZg9rgeETkK+lE
 a0EEkKgHXldVBHiwFQd8Xe2ObrdHlD6fbEJ9ao0gLGIoZyXLs37pZnLcI4i3/KCGLpGv
 RmIQ==
X-Gm-Message-State: AOAM53316x7z1EbU7HGCsyHEAkB95LchBfnMZwPDBd81xtp1J9j1eqZz
 PHomDaPXYCkfgEVeRQDFPU9A8A==
X-Google-Smtp-Source: ABdhPJwOFA7QTdwWhKgSgDu7s/lli1lsvAuZiEU5lxGr4Xt4nvN8SvrhKzEgWD8LfMO1wJIZ4u37mQ==
X-Received: by 2002:a17:90a:4587:b0:1de:c6ee:80f with SMTP id
 v7-20020a17090a458700b001dec6ee080fmr37131280pjg.196.1652842273427; 
 Tue, 17 May 2022 19:51:13 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 t128-20020a628186000000b0050dc7628179sm470573pfd.83.2022.05.17.19.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 19:51:12 -0700 (PDT)
Message-ID: <ba5ee018-82a6-db88-ad09-a79b1671493c@ozlabs.ru>
Date: Wed, 18 May 2022 12:51:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH qemu] spapr: Use address from elf parser for kernel address
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
References: <20220504065536.3534488-1-aik@ozlabs.ru>
 <a9ac6ca4-d404-485c-f4a7-7712e81864ec@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <a9ac6ca4-d404-485c-f4a7-7712e81864ec@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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



On 5/18/22 04:58, Daniel Henrique Barboza wrote:
> Alexey,
> 
> I had to amend your commit due to Gitlab CI complaining about ...
> 
> On 5/4/22 03:55, Alexey Kardashevskiy wrote:
>> tl;dr: This allows Big Endian zImage booting via -kernel + x-vof=on.
>>
>> QEMU loads the kernel at 0x400000 by default which works most of
>> the time as Linux kernels are relocatable, 64bit and compiled with "-pie"
>> (position independent code). This works for a little endian zImage too.
>>
>> However a big endian zImage is compiled without -pie, is 32bit, linked to
>> 0x4000000 so current QEMU ends up loading it at
>> 0x4400000 but keeps spapr->kernel_addr unchanged so booting fails.
>>
>> This uses the kernel address returned from load_elf().
>> If the default kernel_addr is used, there is no change in behavior (as
>> translate_kernel_address() takes care of this), which is:
>> LE/BE vmlinux and LE zImage boot, BE zImage does not.
>> If the VM created with "-machine kernel-addr=0,x-vof=on", then QEMU
>> prints a warning and BE zImage boots.
>>
>> Note #1: SLOF (x-vof=off) still cannot boot a big endian zImage as
>> SLOF enables MSR_SF for everything loaded by QEMU and this leads to early
>> crash of 32bit zImage.
>>
>> Note #2: BE/LE vmlinux images set MSR_SF in early boot so these just 
>> work;
>> a LE zImage restores MSR_SF after every CI call and we are lucky enough
>> not to crash before the first CI call.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>
>> We could probably change SLOF to always clear MSR_SF before jumping to
>> the kernel but this is 1) SLOF fix 2) not quite sure if it brings
>> lots of value.
>>
>>
>> I really wish I had this when tested this fix:
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220406070038.3704604-1-aik@ozlabs.ru/
>>
>> ---
>>   hw/ppc/spapr.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index a4372ba1891e..89f18f6564bd 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -2971,14 +2971,16 @@ static void spapr_machine_init(MachineState 
>> *machine)
>>       }
>>       if (kernel_filename) {
>> +        uint64_t loaded_addr = 0;
>> +
>>           spapr->kernel_size = load_elf(kernel_filename, NULL,
>>                                         translate_kernel_address, spapr,
>> -                                      NULL, NULL, NULL, NULL, 1,
>> +                                      NULL, &loaded_addr, NULL, NULL, 1,
>>                                         PPC_ELF_MACHINE, 0, 0);
>>           if (spapr->kernel_size == ELF_LOAD_WRONG_ENDIAN) {
>>               spapr->kernel_size = load_elf(kernel_filename, NULL,
>>                                             translate_kernel_address, 
>> spapr,
>> -                                          NULL, NULL, NULL, NULL, 0,
>> +                                          NULL, &loaded_addr, NULL, 
>> NULL, 0,
>>                                             PPC_ELF_MACHINE, 0, 0);
>>               spapr->kernel_le = spapr->kernel_size > 0;
>>           }
>> @@ -2988,6 +2990,12 @@ static void spapr_machine_init(MachineState 
>> *machine)
>>               exit(1);
>>           }
>> +        if (spapr->kernel_addr != loaded_addr) {
>> +            warn_report("spapr: kernel_addr changed from 0x%lx to 
>> 0x%lx",
>> +                        spapr->kernel_addr, loaded_addr);
> 
> 
> ... this code. This is problematic when compiling in a 32 bit 
> environment because
> the definition of long (long) unsigned differs from the usual 64 bit env 
> we use:
> 
> 
> 
> ../hw/ppc/spapr.c: In function 'spapr_machine_init':
> ../hw/ppc/spapr.c:2998:25: error: format '%lx' expects argument of type 
> 'long unsigned int', but argument 2 has type 'uint64_t' {aka 'long long 
> unsigned int'} [-Werror=format=]
>   2998 |             warn_report("spapr: kernel_addr changed from 0x%lx 
> to 0x%lx",
>        |                         
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   2999 |                         spapr->kernel_addr, loaded_addr);
>        |                         ~~~~~~~~~~~~~~~~~~
>        |                              |
>        |                              uint64_t {aka long long unsigned int}
> ../hw/ppc/spapr.c:2998:25: error: format '%lx' expects argument of type 
> 'long unsigned int', but argument 3 has type 'uint64_t' {aka 'long long 
> unsigned int'} [-Werror=format=]
>   2998 |             warn_report("spapr: kernel_addr changed from 0x%lx 
> to 0x%lx",
>        |                         
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   2999 |                         spapr->kernel_addr, loaded_addr);
>        |                                             ~~~~~~~~~~~
>        |                                             |
>        |                                             uint64_t {aka long 
> long unsigned int}
> cc1: all warnings being treated as errors
> 
> 
> I've fixed it by doing the following:
> 
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 156e799ae9..8d5bdfc20f 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2995,7 +2995,7 @@ static void spapr_machine_init(MachineState *machine)
>           }
> 
>           if (spapr->kernel_addr != loaded_addr) {
> -            warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
> +            warn_report("spapr: kernel_addr changed from 0x%"PRIx64
> +                        " to 0x%"PRIx64,
>                           spapr->kernel_addr, loaded_addr);
>               spapr->kernel_addr = loaded_addr;
>           }
> 
> 
> 
> If you're ok with this fixup we can keep it as is. Otherwise feel free 
> to send
> another version.


I am totally fine with this change, sorry I have not compile tested it, 
just assumed this cannot fail :-/


> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
> 
> 
> 
>> +            spapr->kernel_addr = loaded_addr;
>> +        }
>> +
>>           /* load initrd */
>>           if (initrd_filename) {
>>               /* Try to locate the initrd in the gap between the kernel

-- 
Alexey

