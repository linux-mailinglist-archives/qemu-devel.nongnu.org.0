Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7BC51B699
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 05:31:43 +0200 (CEST)
Received: from localhost ([::1]:52606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmSDO-0001yY-KQ
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 23:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nmSBi-00017L-8I
 for qemu-devel@nongnu.org; Wed, 04 May 2022 23:29:58 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nmSBf-0002Kz-ON
 for qemu-devel@nongnu.org; Wed, 04 May 2022 23:29:57 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso2984879pjj.2
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 20:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=n+g9mOIzTSSwkbMvapTI5njl1UaTGSINDA7UK3nP/qM=;
 b=mVYtnnHJVLEJq83YiHweAWuuUKYUnTkhdPFcY7szguqLA/1zdT6MifkFow4q4yzPqr
 aQboL2ivE9gk+MSVccVTqcQltqG8vMpNLH3C1nEieT0p4+oIPLeXU6A5DTe1LeLOZ608
 XjmPDaOlyt89i0E0pNHRM7juDq6yAU1yt6sBQjS7vzliEJ/mlW0o1AbfCD0GNaSVFrUe
 NZl80OcD8L7VP4PD8n7b7t/P1MCtNMsGw+VbIK9gfESbSw2hjBcLGEYRWFCzenkIf8Gz
 NURE5OvCv3j7bXc7EHddLb1YKcLXYO/tMDQaYDhsqqKwD7mQhvGEbzWYuJqFKoISASoM
 Zgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n+g9mOIzTSSwkbMvapTI5njl1UaTGSINDA7UK3nP/qM=;
 b=Y6pL8ovQiuX6A7Q3EFJcCAf71ZctQT83TtTNO6cK5G8cDtRYFHFpZPmD+D8pVHMzCU
 ArG/r9Fo8GZfygCptw4g4SUc5IwAu/sLaqCmDwDAzbifJyti7TGyl/nvjR2TKgCmydhL
 xzIg+LWwjPir3/AeDXZ0fTHcS1rY8xCrzErNDymPt9+azvM9GyKmDHvY3AtCKbiFi+9l
 fWkx3qTB+e5px6Z8iRqz+pHgm4kNHDMRJQpS1S2Z4A/cV7CyP+feXdAYrWaOoshsOklt
 W4hKdQAqawt7hVknTSsZiQmCWgeNmERnNxnCGjL7k4shlgudwg36IXWXfZ3/3xz9ngzK
 3hgA==
X-Gm-Message-State: AOAM531x3rdK+idA3MmGjmohHYnS1Ob+TgN+iukA33pPkYwYjrfAkrzL
 Y3rfOqEO00Xg0+cbT096PNblpw==
X-Google-Smtp-Source: ABdhPJxh4PBRgXupPGAE+a0zNU3dkI197ImjvpFFRpefyzE4vJ8cwbw+8fb4mZlR8V+5xwHCcxU9Cw==
X-Received: by 2002:a17:90b:3ecc:b0:1dc:9471:31a1 with SMTP id
 rm12-20020a17090b3ecc00b001dc947131a1mr3556598pjb.220.1651721393103; 
 Wed, 04 May 2022 20:29:53 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 12-20020a170902e9cc00b0015e8d4eb2e5sm235018plk.303.2022.05.04.20.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 20:29:52 -0700 (PDT)
Message-ID: <365ad8a7-bfa4-45d5-0fb4-46e295ea75b8@ozlabs.ru>
Date: Thu, 5 May 2022 13:29:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH qemu] spapr: Use address from elf parser for kernel address
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20220504065536.3534488-1-aik@ozlabs.ru>
 <87fslp9khd.fsf@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <87fslp9khd.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x102e.google.com
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



On 5/5/22 05:16, Fabiano Rosas wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> 
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
> 
> I think we can fix this without needing a different command line for BE
> zImage (apart from x-vof, which is a separate matter).
> 
> If you look at translate_kernel_address, it cannot really work when the
> ELF PhysAddr is != 0. We would always hit this sort of 0x4400000 issue,
> so if we fix that function like this...
> 
> static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
> {
>      SpaprMachineState *spapr = opaque;
> 
>      return addr ? addr : spapr->kernel_addr;
> }


The qemu elf loader is supposed to handle relocations which should be 
calling this hook more than once, now I wonder why it is not doing so.


> ...then we could always use the ELF PhysAddr if it is different from 0
> and only use the default load addr if the ELF PhysAddr is 0. If the user
> gives kernel_addr on the cmdline, we honor that, even if puts the kernel
> over the firmware (we have code to detect that).


ELF address is 0 for LE zImage only, vmlinux BE/LE uses 
0xc000000000000000. And we are already chopping all these tops bits off 
in translate_kernel_address() and I do not really know why _exactly_ it 
is 0x0fffffff and not let's say 0x7fffffff.


> 
>> @@ -2988,6 +2990,12 @@ static void spapr_machine_init(MachineState *machine)
>>               exit(1);
>>           }
>>   
>> +        if (spapr->kernel_addr != loaded_addr) {
> 
> This could be:
> 
>          if (spapr->kernel_addr == KERNEL_LOAD_ADDR &&
> 	    spapr->kernel_addr != loaded_addr) {
> 
> So the precedence would be:
> 
> 1- ELF PhysAddr, if != 0. After all, that is what it's for. BE zImage
>     falls here;
>      
> 2- KERNEL_LOAD_ADDR. Via translate_kernel_address, LE/BE vmlinux fall
>     here;
> 
> 3- kernel_addr. The user is probably hacking something, just use what
>     they gave us. QEMU will yell if they load the kernel over the fw.


imho too complicated.

What if the user runs QEMU with kernel-addr=0x400000? (0x400000 is 
KERNEL_LOAD_ADDR noooow but not necessarily forever). Is it 2) or 3)?

I am basically fixing a bug when we ignore where load_elf() loaded the 
ELF and just assume it is KERNEL_LOAD_ADDR. Now the code checks if the 
ELF was loaded where we want it to be. Everything else can be done but 
on top of this.


>> +            warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
>> +                        spapr->kernel_addr, loaded_addr);
>> +            spapr->kernel_addr = loaded_addr;
>> +        }
>> +
>>           /* load initrd */
>>           if (initrd_filename) {
>>               /* Try to locate the initrd in the gap between the kernel

