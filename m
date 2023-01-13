Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3636693F4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 11:22:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGHBm-0008PT-3p; Fri, 13 Jan 2023 05:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGHBj-0008N7-7U
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 05:21:31 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGHBh-0005ku-KO
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 05:21:30 -0500
Received: by mail-oi1-x22c.google.com with SMTP id r9so6605985oie.13
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 02:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/QjALvLmossEhKT/lFtmq9q4aFTAAfWiOsIVEH6r/Ps=;
 b=HLrRWxu6eHyvXo4CV1qc8d436Jfwj1CUuLC8rHHDOt4T5igUkSB3uEcG86xTZQ9Zuq
 dMGV8N0rXM7w5AZXgm0aoGQb5WVja97eNTmqSbodF8A82VlLj98YsyNX/7RIU4TH7zGJ
 izJa+oFa8jNeQnq9xAjiq2ces+51q7fIqu4yDIKt6maBBHT6ZctmQm9Y6RyhPtlsfNOG
 h63Nwi0ALPzos7yTLiz+NY51oMn80cSXA3lE+xq93ndRpwqPwdMcuEWuIZenXvNOh2bH
 tx+TiVeoYdY1DFhqnlPVrgvqLngSOdLufZJ3aQKmkzVTfAeOceM1Ix04yfANaoC0YYW2
 GRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/QjALvLmossEhKT/lFtmq9q4aFTAAfWiOsIVEH6r/Ps=;
 b=ZrZcVb2/7Y01oZvMuAxIIjIRNeTmiA6QK3yBkufs9Uk9vSJjzs/FnP28oE6wcPJS/P
 9Csr3FF3fxvW150vxRtrxTWUXoLOuG2Bqh8ohM2HmXS0Ufos2KGUyO73Kt0+gzioCDjB
 gKUBRzIzXkxzsjgKBLw5/u6Fd8yMDJYg9jfHHc1/Wd0wlJt4yq/mFeei5URmJpSxX+s0
 XKeZMhHfQjsV1VYpW8W0HnkhR3l3N9qNAL9X/3l61uvcLRngq7SPS1Ug+MiIXo1Cyd6W
 i4fkl1dWgZJYC8hlq7zBafmVPWH062+sNADTaiKX6jwh02gvrx8beMPZRRSw9e18DxE/
 YIYQ==
X-Gm-Message-State: AFqh2kpK+NEGLDqxe0B7Ir1MsJ/cIWnzYdQpoaealkvxDRhGqalY6zrv
 RYojgKKTow7lxPXjNG9Os3KTVg==
X-Google-Smtp-Source: AMrXdXvU6DpwS8+MJcFGs+uTsRwuWB2+2O4NRKqHPO7DBuyVXeozReQ5bVYNPbn/J47AJgmlFn3pLg==
X-Received: by 2002:a05:6808:2391:b0:364:5a39:ec53 with SMTP id
 bp17-20020a056808239100b003645a39ec53mr8891098oib.22.1673605288515; 
 Fri, 13 Jan 2023 02:21:28 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 dp6-20020a056808424600b003458d346a60sm8996156oib.25.2023.01.13.02.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 02:21:27 -0800 (PST)
Message-ID: <0ba72b27-0c3d-2d3d-adec-899717f40594@ventanamicro.com>
Date: Fri, 13 Jan 2023 07:21:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 10/11] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-11-dbarboza@ventanamicro.com>
 <CAKmqyKPri7asvqZ8wN4Bd-wjH+gwwMJJhiUd+=QZFV4RhWnyUQ@mail.gmail.com>
 <b5cab84f-4bb9-694b-80e9-0b5aeac9de6c@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <b5cab84f-4bb9-694b-80e9-0b5aeac9de6c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



On 1/13/23 04:16, Philippe Mathieu-Daudé wrote:
> On 12/1/23 01:34, Alistair Francis wrote:
>> On Mon, Jan 2, 2023 at 9:55 PM Daniel Henrique Barboza
>> <dbarboza@ventanamicro.com> wrote:
>>>
>>> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
>>> the same steps when '-kernel' is used:
>>>
>>> - execute load_kernel()
>>> - load init_rd()
>>> - write kernel_cmdline
>>>
>>> Let's fold everything inside riscv_load_kernel() to avoid code
>>> repetition. To not change the behavior of boards that aren't calling
>>> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
>>> allow these boards to opt out from initrd loading.
>>>
>>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> ---
>>>   hw/riscv/boot.c            | 22 +++++++++++++++++++---
>>>   hw/riscv/microchip_pfsoc.c | 12 ++----------
>>>   hw/riscv/opentitan.c       |  2 +-
>>>   hw/riscv/sifive_e.c        |  3 ++-
>>>   hw/riscv/sifive_u.c        | 12 ++----------
>>>   hw/riscv/spike.c           | 11 +----------
>>>   hw/riscv/virt.c            | 12 ++----------
>>>   include/hw/riscv/boot.h    |  1 +
>>>   8 files changed, 30 insertions(+), 45 deletions(-)
>
>>> @@ -192,21 +194,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>>       if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>>>                            NULL, &kernel_load_base, NULL, NULL, 0,
>>>                            EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
>>> -        return kernel_load_base;
>>> +        kernel_entry = kernel_load_base;
>>
>> This breaks 32-bit Xvisor loading. It seems that for the 32-bit guest
>> we get a value of 0xffffffff80000000.
>>
>> Previously the top bits would be lost as we return a target_ulong from
>> this function, but with this change we pass the value
>> 0xffffffff80000000 to riscv_load_initrd() which causes failures.
>>
>> This diff fixes the failure for me
>>
>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>> index 4888d5c1e0..f08ed44b97 100644
>> --- a/hw/riscv/boot.c
>> +++ b/hw/riscv/boot.c
>> @@ -194,7 +194,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>      if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>>                           NULL, &kernel_load_base, NULL, NULL, 0,
>>                           EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
>> -        kernel_entry = kernel_load_base;
>> +        kernel_entry = (target_ulong) kernel_load_base;
>>          goto out;
>>      }
>>
>>
>> but I don't think that's the right fix. We should instead look at the
>> CPU XLEN and drop the high bits if required.
>
> Ah, that is what should be done in load_elf_ram_sym()'s missing
> translate_fn() handler.

Interesting. I'll try it again and re-send.


Daniel



