Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0F72E0198
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 21:37:03 +0100 (CET)
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krRvS-0000Gu-4m
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 15:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krRtU-0006w2-JS
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:35:00 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krRtS-0003Pu-Lu
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:35:00 -0500
Received: by mail-wm1-x32a.google.com with SMTP id k10so131608wmi.3
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 12:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=85kj926BUr+8jj+wicWA/5n1BvJrqKgBK5HE+QQ4GQI=;
 b=nMiwNnaHkARDJbI84JtUasMuPLPtDckRKt1QAGZamNM4Tv6Va6x09YMaHkOsipMcHa
 HDZ7zLT6+KYrBnvJYyXGHxUMmaWSN74JD9gXAR0RE10TuC5b3SbbnV7YvtJ87yJ89f7j
 HIRQznsvQsYWtUBnnNVqU6q5rGzLo7WGPkkV0hnnIKlmMSXQg9gCuWB0dJgZAwMpZK8J
 qPDWCPnmdzOxWlhnbXStbIOi5zAxJnyO9nxDbHA++jguHoW3kAUVfdG7GJ0uU8El2PoA
 yY7zXuEzGt1l42vtWGh41RUlYPfAcmjcRo9mbaflzQb5idhBPo+4TE809177WQS6IuIk
 Obog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=85kj926BUr+8jj+wicWA/5n1BvJrqKgBK5HE+QQ4GQI=;
 b=g+efuSfsJiWiBoizQp8Q/fVJzmvJ96qLSzHzRogH6UmCeLIr/8mjYCCTXzrJIa3Qyt
 GpA/+CwITrvMrt1XwQ9Ahu3EjKpO3CjpJsHu9ZlQpP87MHWKc//0Vjr5x/Qi5e/9KP5G
 QSLTdH//b3mDBDH2F/tSYtAxETDZ72Zk0CV530aJPGFTXhWj0/ILExcwFVmlzWGVOW6c
 iM5VMFHxJdXu3/iP+aStjPea5MnNHFL//O+HZGpfFvvN+2+okGz6m2x8V7re3COfVDKA
 kGb+Tl+RH/5yu0FLjoA31ECRvfYy8IL2ZuFHe72EX1guV3Sl8ro0UefxZ3JYKC/4KmaJ
 l8OA==
X-Gm-Message-State: AOAM532NDZlCc2aCD8/Fcb1D3ROBtd22n0ZFlu+GF1OEsbys4iSOsrRb
 Ka2aas74FzUzX4FoaGJJWxI=
X-Google-Smtp-Source: ABdhPJzU5t46YauN35Er6tgDA3UWn+SUCMObScYuBtlQGk4JFiXksMqnafkjthiudycR41RuCs111A==
X-Received: by 2002:a1c:790f:: with SMTP id l15mr18510942wme.188.1608582896746; 
 Mon, 21 Dec 2020 12:34:56 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id g191sm26483859wmg.39.2020.12.21.12.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 12:34:55 -0800 (PST)
Subject: Re: [PATCH v2 7/8] hw/mips/fuloong2e: Add highmem support
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219072326.40157-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b8418bf5-e7c5-0ae0-9470-7715642bb100@amsat.org>
Date: Mon, 21 Dec 2020 21:34:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201219072326.40157-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.233,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: chenhuacai@kernel.org, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/20 8:23 AM, Jiaxun Yang wrote:
> highmem started from 0x20000000.

"started from" -> "starts at"?

> Now we can have up to 2G RAM.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2: Handle SPD for dual DIMM correctly.
> ---
>  hw/mips/fuloong2e.c | 61 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 49 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 2744b211fd..8a4bebe066 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -56,6 +56,7 @@
>  /* Fuloong 2e has a 512k flash: Winbond W39L040AP70Z */
>  #define BIOS_SIZE               (512 * KiB)
>  #define MAX_IDE_BUS             2
> +#define HIGHMEM_START           0x20000000
>  
>  /*
>   * PMON is not part of qemu and released with BSD license, anyone
> @@ -71,7 +72,8 @@
>  #define FULOONG2E_RTL8139_SLOT    7
>  
>  static struct _loaderparams {
> -    int ram_size;
> +    int ram_low_size;
> +    int ram_high_size;
>      const char *kernel_filename;
>      const char *kernel_cmdline;
>      const char *initrd_filename;
> @@ -128,14 +130,14 @@ static uint64_t load_kernel(MIPSCPU *cpu)
>          initrd_size = get_image_size(loaderparams.initrd_filename);
>          if (initrd_size > 0) {
>              initrd_offset = ROUND_UP(kernel_high, INITRD_PAGE_SIZE);
> -            if (initrd_offset + initrd_size > loaderparams.ram_size) {
> +            if (initrd_offset + initrd_size > loaderparams.ram_low_size) {
>                  error_report("memory too small for initial ram disk '%s'",
>                               loaderparams.initrd_filename);
>                  exit(1);
>              }
>              initrd_size = load_image_targphys(loaderparams.initrd_filename,
>                                                initrd_offset,
> -                                              loaderparams.ram_size - initrd_offset);
> +                                              loaderparams.ram_low_size - initrd_offset);
>          }
>          if (initrd_size == (target_ulong) -1) {
>              error_report("could not load initial ram disk '%s'",
> @@ -160,7 +162,11 @@ static uint64_t load_kernel(MIPSCPU *cpu)
>  
>      /* Setup minimum environment variables */
>      prom_set(prom_buf, index++, "cpuclock=%u", clock_get_hz(cpu->clock));
> -    prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
> +    prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_low_size / MiB);
> +    if (loaderparams.ram_high_size > 0) {
> +            prom_set(prom_buf, index++, "highmemsize=%"PRIi64,
> +                    loaderparams.ram_high_size / MiB);
> +    }
>      prom_set(prom_buf, index++, NULL);
>  
>      rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
> @@ -186,7 +192,7 @@ static void write_bootloader(CPUMIPSState *env, uint8_t *base,
>      p = (uint32_t *)(base + 0x040);
>  
>      bl_gen_jump_kernel(&p, ENVP_VADDR - 64, 2, ENVP_VADDR,
> -                       ENVP_VADDR + 8, loaderparams.ram_size,
> +                       ENVP_VADDR + 8, loaderparams.ram_low_size,
>                         kernel_addr);
>  }
>  
> @@ -258,8 +264,11 @@ static void mips_fuloong2e_init(MachineState *machine)
>      const char *kernel_filename = machine->kernel_filename;
>      const char *kernel_cmdline = machine->kernel_cmdline;
>      const char *initrd_filename = machine->initrd_filename;
> +    ram_addr_t ram_low_size, ram_high_size = 0;
>      char *filename;
>      MemoryRegion *address_space_mem = get_system_memory();
> +    MemoryRegion *ram_low_alias = g_new(MemoryRegion, 1);
> +    MemoryRegion *ram_high_alias;
>      MemoryRegion *bios = g_new(MemoryRegion, 1);
>      long bios_size;
>      uint8_t *spd_data;
> @@ -282,12 +291,31 @@ static void mips_fuloong2e_init(MachineState *machine)
>  
>      qemu_register_reset(main_cpu_reset, cpu);
>  
> -    /* TODO: support more than 256M RAM as highmem */
> -    if (machine->ram_size != 256 * MiB) {
> -        error_report("Invalid RAM size, should be 256MB");
> +    if (machine->ram_size > 2 * GiB) {
> +        error_report("Too much memory for this machine: %" PRId64 "MB,"
> +                     " maximum 2048MB", machine->ram_size / MiB);
>          exit(EXIT_FAILURE);
>      }
> -    memory_region_add_subregion(address_space_mem, 0, machine->ram);
> +
> +    ram_low_size = MIN(machine->ram_size, 256 * MiB);
> +
> +    memory_region_init_alias(ram_low_alias, NULL,
> +                            "ram_low_alias",
> +                            machine->ram, 0,
> +                            ram_low_size);
> +    memory_region_add_subregion(address_space_mem, 0,
> +                                ram_low_alias);
> +
> +    if (machine->ram_size > 256 * MiB) {
> +        ram_high_alias = g_new(MemoryRegion, 1);
> +        ram_high_size = machine->ram_size - ram_low_size;
> +        memory_region_init_alias(ram_high_alias, NULL,
> +                                "ram_high_alias",
> +                                machine->ram, ram_low_size,
> +                                ram_high_size);
> +        memory_region_add_subregion(address_space_mem, HIGHMEM_START,
> +                                    ram_high_alias);

Cool, I've been using the same patch for one year. It works fine with
a Linux kernel which doesn't change the northbridge mapping. As there
is no plan for using another bootloader than PMON with this machine,
that is fine.

> +    }
>  
>      /* Boot ROM */
>      memory_region_init_rom(bios, NULL, "fuloong2e.bios", BIOS_SIZE,
> @@ -300,7 +328,8 @@ static void mips_fuloong2e_init(MachineState *machine)
>       */
>  
>      if (kernel_filename) {
> -        loaderparams.ram_size = machine->ram_size;
> +        loaderparams.ram_low_size = ram_low_size;
> +        loaderparams.ram_high_size = ram_high_size;
>          loaderparams.kernel_filename = kernel_filename;
>          loaderparams.kernel_cmdline = kernel_cmdline;
>          loaderparams.initrd_filename = initrd_filename;
> @@ -345,8 +374,16 @@ static void mips_fuloong2e_init(MachineState *machine)
>      }
>  
>      /* Populate SPD eeprom data */
> -    spd_data = spd_data_generate(DDR, machine->ram_size);
> -    smbus_eeprom_init_one(smbus, 0x50, spd_data);
> +    if (machine->ram_size <= 1 * GiB) {
> +        /* It supports maxium of 1 GiB per DIMM */

Typo "maximum".

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +        spd_data = spd_data_generate(DDR, machine->ram_size);
> +        smbus_eeprom_init_one(smbus, 0x50, spd_data);
> +    } else {
> +        /* Split to dual DIMM for more than 1 GiB  */
> +        spd_data = spd_data_generate(DDR, machine->ram_size / 2);
> +        smbus_eeprom_init_one(smbus, 0x50, spd_data);
> +        smbus_eeprom_init_one(smbus, 0x51, spd_data);
> +    }
>  
>      mc146818_rtc_init(isa_bus, 2000, NULL);
>  
> 

