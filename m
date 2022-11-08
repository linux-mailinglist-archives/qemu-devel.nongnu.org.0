Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4077A620E1B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 12:05:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osMOU-0001VN-92; Tue, 08 Nov 2022 06:03:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osMOR-0001VA-Jf
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:03:47 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osMOO-0004Me-8U
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:03:47 -0500
Received: by mail-pl1-x62a.google.com with SMTP id io19so13848497plb.8
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 03:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8LX549Pdkac58vBJNEchAIRgJm0xPNvTerD59CCZrFA=;
 b=kpEsQQQlu8na1AnMaOJhAg8AzQzP2iXsmuU38A6eZVFmhozOdyEWUyCRoypWyB4/Vk
 xqkvHoITbgO7WFnfwLxEjQgIzGplYxdsdJ9vApdq6mxUcF1lEH3JXM/r3M+t0A10/CLp
 YuPhD+uhfDqZ51HEyCcbXvXEPJRWMR8xTvHPPAHKAsb/v6aif5S2Sj0FgGSlsZIXqfWw
 z6Ursm037Fmx37IwQuCCzpvytXkcOjgthHeoeGt9VKDBX3TqrokfU1WboV9DduBA53cc
 una5NlKe8DAJZn0b0ostixnczU9LGhQvCJszf9G/a3wDZzoIlZ5OQ1extPQ8neANDkI0
 mZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8LX549Pdkac58vBJNEchAIRgJm0xPNvTerD59CCZrFA=;
 b=yK66dMHGUzxxYvI5kiSroeqikEMMiWSs+M9WbjlHuS+zfHfPYtcHp+JCSfLyQP6P9G
 yAHkam8MZQWB3UvHHwT+yDmtZMEgDcQgIO2ae5wlO8yPpy4KpYo7XQ2uE5LxalCSMDxU
 45zoYd8RCIcmaWNmjjxqxS8sqBYQDfq2WIMugrtmrsPtXahVBaOo8Led514pOrQtf3np
 0CfnqrTltnwXIUlw5/LIwKh4DP7kw04taDnvWFDNd5AzOioIwj4O54KKWY6MDTWe2GFz
 fqEsMlM/Z7v8O5s8jLLCqpu2yCksc1qHIsZqzUrl+9kdXCXBLhjVZ07JA3niFjbU0BHj
 mRgQ==
X-Gm-Message-State: ACrzQf3odswzusHTbjluIkV9tPixtRr8LylOk7g8lwQLuHKYyb2s5DDf
 LSCwkr0P3BDgt+kDhC+ea4OCfQ==
X-Google-Smtp-Source: AMsMyM4vxp+k0A+M6fhZsS6+jkOszM/pEUuZ29MnAYhaYkz40zVUZJV6CGfgxMFuc9DhrtWARCpPRQ==
X-Received: by 2002:a17:90a:12c4:b0:213:fbf0:319a with SMTP id
 b4-20020a17090a12c400b00213fbf0319amr42744140pjg.65.1667905422133; 
 Tue, 08 Nov 2022 03:03:42 -0800 (PST)
Received: from ?IPV6:2001:8003:d918:7a00:147b:b19a:2ea9:e6f8?
 ([2001:8003:d918:7a00:147b:b19a:2ea9:e6f8])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a170903230100b00178b9c997e5sm6664859plh.138.2022.11.08.03.03.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 03:03:41 -0800 (PST)
Message-ID: <ab34973e-c045-7e5c-164a-9992ca078307@linaro.org>
Date: Tue, 8 Nov 2022 21:41:57 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PULL v3 3/7] hw/loongarch: Load FDT table into dram memory space
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: stefanha@gmail.com, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20221105032857.3789472-1-gaosong@loongson.cn>
 <20221105032857.3789472-4-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221105032857.3789472-4-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

On 11/5/22 14:28, Song Gao wrote:
> From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> 
> Load FDT table into dram memory space, and the addr is 2 MiB.
> Since lowmem region starts from 0, FDT base address is located
> at 2 MiB to avoid NULL pointer access.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Acked-by: Song Gao <gaosong@loongson.cn>
> Message-Id: <20221028014007.2718352-2-yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/loongarch/virt.c         | 18 +++++++++++-------
>   include/hw/loongarch/virt.h |  3 ---
>   2 files changed, 11 insertions(+), 10 deletions(-)

This breaks make check-tcg:

   TEST    hello on loongarch64
qemu-system-loongarch64: Some ROM regions are overlapping
These ROM regions might have been loaded by direct user request or by default.
They could be BIOS/firmware images, a guest kernel, initrd or some other file loaded into 
guest memory.
Check whether you intended to load all this guest code, and whether it has been built to 
load to the correct addresses.

The following two regions overlap (in the memory address space):
   hello ELF program header segment 0 (addresses 0x0000000000200000 - 0x0000000000242000)
   fdt (addresses 0x0000000000200000 - 0x0000000000300000)
make[1]: *** [Makefile:177: run-hello] Error 1


r~


> 
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index 4b595a9ea4..50e9829a94 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -159,7 +159,6 @@ static void fdt_add_pcie_node(const LoongArchMachineState *lams)
>                                    1, FDT_PCI_RANGE_MMIO, 2, base_mmio,
>                                    2, base_mmio, 2, size_mmio);
>       g_free(nodename);
> -    qemu_fdt_dumpdtb(ms->fdt, lams->fdt_size);
>   }
>   
>   static void fdt_add_irqchip_node(LoongArchMachineState *lams)
> @@ -656,6 +655,7 @@ static void loongarch_init(MachineState *machine)
>       MemoryRegion *address_space_mem = get_system_memory();
>       LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
>       int i;
> +    hwaddr fdt_base;
>   
>       if (!cpu_model) {
>           cpu_model = LOONGARCH_CPU_TYPE_NAME("la464");
> @@ -760,12 +760,16 @@ static void loongarch_init(MachineState *machine)
>       lams->machine_done.notify = virt_machine_done;
>       qemu_add_machine_init_done_notifier(&lams->machine_done);
>       fdt_add_pcie_node(lams);
> -
> -    /* load fdt */
> -    MemoryRegion *fdt_rom = g_new(MemoryRegion, 1);
> -    memory_region_init_rom(fdt_rom, NULL, "fdt", VIRT_FDT_SIZE, &error_fatal);
> -    memory_region_add_subregion(get_system_memory(), VIRT_FDT_BASE, fdt_rom);
> -    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, VIRT_FDT_BASE);
> +    /*
> +     * Since lowmem region starts from 0, FDT base address is located
> +     * at 2 MiB to avoid NULL pointer access.
> +     *
> +     * Put the FDT into the memory map as a ROM image: this will ensure
> +     * the FDT is copied again upon reset, even if addr points into RAM.
> +     */
> +    fdt_base = 2 * MiB;
> +    qemu_fdt_dumpdtb(machine->fdt, lams->fdt_size);
> +    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, fdt_base);
>   }
>   
>   bool loongarch_is_acpi_enabled(LoongArchMachineState *lams)
> diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
> index 09f1c88ee5..45c383f5a7 100644
> --- a/include/hw/loongarch/virt.h
> +++ b/include/hw/loongarch/virt.h
> @@ -28,9 +28,6 @@
>   #define VIRT_GED_MEM_ADDR       (VIRT_GED_EVT_ADDR + ACPI_GED_EVT_SEL_LEN)
>   #define VIRT_GED_REG_ADDR       (VIRT_GED_MEM_ADDR + MEMORY_HOTPLUG_IO_LEN)
>   
> -#define VIRT_FDT_BASE           0x1c400000
> -#define VIRT_FDT_SIZE           0x100000
> -
>   struct LoongArchMachineState {
>       /*< private >*/
>       MachineState parent_obj;


