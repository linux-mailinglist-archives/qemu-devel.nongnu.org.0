Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461E241C88B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 17:35:53 +0200 (CEST)
Received: from localhost ([::1]:41236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVbce-0006MM-9i
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 11:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mVbZr-0003zn-He
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:32:59 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:51381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mVbZm-0006gj-KN
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:32:57 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0B1AC746333;
 Wed, 29 Sep 2021 17:32:50 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C54BC745953; Wed, 29 Sep 2021 17:32:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C329B7457EE;
 Wed, 29 Sep 2021 17:32:49 +0200 (CEST)
Date: Wed, 29 Sep 2021 17:32:49 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 1/3] hw/mips/boston: Massage memory map information
In-Reply-To: <20210929151211.108-2-jiaxun.yang@flygoat.com>
Message-ID: <b1c25fe-c4af-264c-7a8e-fedeb272e845@eik.bme.hu>
References: <20210929151211.108-1-jiaxun.yang@flygoat.com>
 <20210929151211.108-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1686618801-1632929569=:36041"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: aleksandar.rikalo@syrmia.com, qemu-devel@nongnu.org, paulburton@kernel.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1686618801-1632929569=:36041
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 29 Sep 2021, Jiaxun Yang wrote:
> Use memmap array to uinfy address of memory map.
> That would allow us reuse address information for FDT generation.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> --
> v2: Fix minor style issue, fix uart map size
> ---
> hw/mips/boston.c | 95 ++++++++++++++++++++++++++++++++++++------------
> 1 file changed, 71 insertions(+), 24 deletions(-)
>
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index 20b06865b2..5c720440fb 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -64,6 +64,44 @@ struct BostonState {
>     hwaddr fdt_base;
> };
>
> +enum {
> +    BOSTON_LOWDDR,
> +    BOSTON_PCIE0,
> +    BOSTON_PCIE1,
> +    BOSTON_PCIE2,
> +    BOSTON_PCIE2_MMIO,
> +    BOSTON_CM,
> +    BOSTON_GIC,
> +    BOSTON_CDMM,
> +    BOSTON_CPC,
> +    BOSTON_PLATREG,
> +    BOSTON_UART,
> +    BOSTON_LCD,
> +    BOSTON_FLASH,
> +    BOSTON_PCIE1_MMIO,
> +    BOSTON_PCIE0_MMIO,
> +    BOSTON_HIGHDDR,
> +};
> +
> +static const MemMapEntry boston_memmap[] = {
> +    [BOSTON_LOWDDR] =     {        0x0,    0x10000000 },

What's the advantage of having it in an array as opposed to just have 
simple defines for these? I did not see a case where you go through these 
as array elements so it seems it's just an unnecessarily complex way to 
write boston_memmap[BOSTON_LOWADDR] insted of BOSTON_LOWADDR. Did I miss 
something where having an array helps?

Regards,
BALATON Zoltan

> +    [BOSTON_PCIE0] =      { 0x10000000,     0x2000000 },
> +    [BOSTON_PCIE1] =      { 0x12000000,     0x2000000 },
> +    [BOSTON_PCIE2] =      { 0x14000000,     0x2000000 },
> +    [BOSTON_PCIE2_MMIO] = { 0x16000000,      0x100000 },
> +    [BOSTON_CM] =         { 0x16100000,       0x20000 },
> +    [BOSTON_GIC] =        { 0x16120000,       0x20000 },
> +    [BOSTON_CDMM] =       { 0x16140000,        0x8000 },
> +    [BOSTON_CPC] =        { 0x16200000,        0x8000 },
> +    [BOSTON_PLATREG] =    { 0x17ffd000,        0x1000 },
> +    [BOSTON_UART] =       { 0x17ffe000,          0x20 },
> +    [BOSTON_LCD] =        { 0x17fff000,           0x8 },
> +    [BOSTON_FLASH] =      { 0x18000000,     0x8000000 },
> +    [BOSTON_PCIE1_MMIO] = { 0x20000000,    0x20000000 },
> +    [BOSTON_PCIE0_MMIO] = { 0x40000000,    0x40000000 },
> +    [BOSTON_HIGHDDR] =    { 0x80000000,           0x0 },
> +};
> +
> enum boston_plat_reg {
>     PLAT_FPGA_BUILD     = 0x00,
>     PLAT_CORE_CL        = 0x04,
> @@ -275,24 +313,22 @@ type_init(boston_register_types)
>
> static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr)
> {
> -    const uint32_t cm_base = 0x16100000;
> -    const uint32_t gic_base = 0x16120000;
> -    const uint32_t cpc_base = 0x16200000;
> -
>     /* Move CM GCRs */
>     bl_gen_write_ulong(&p,
>                        cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_BASE_OFS),
> -                       cm_base);
> +                       boston_memmap[BOSTON_CM].base);
>
>     /* Move & enable GIC GCRs */
>     bl_gen_write_ulong(&p,
> -                       cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_GIC_BASE_OFS),
> -                       gic_base | GCR_GIC_BASE_GICEN_MSK);
> +                       cpu_mips_phys_to_kseg1(NULL,
> +                            boston_memmap[BOSTON_CM].base + GCR_GIC_BASE_OFS),
> +                       boston_memmap[BOSTON_GIC].base | GCR_GIC_BASE_GICEN_MSK);
>
>     /* Move & enable CPC GCRs */
>     bl_gen_write_ulong(&p,
> -                       cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_CPC_BASE_OFS),
> -                       cpc_base | GCR_CPC_BASE_CPCEN_MSK);
> +                       cpu_mips_phys_to_kseg1(NULL,
> +                            boston_memmap[BOSTON_CM].base + GCR_CPC_BASE_OFS),
> +                       boston_memmap[BOSTON_CPC].base | GCR_CPC_BASE_CPCEN_MSK);
>
>     /*
>      * Setup argument registers to follow the UHI boot protocol:
> @@ -333,8 +369,9 @@ static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
>     ram_low_sz = MIN(256 * MiB, machine->ram_size);
>     ram_high_sz = machine->ram_size - ram_low_sz;
>     qemu_fdt_setprop_sized_cells(fdt, "/memory@0", "reg",
> -                                 1, 0x00000000, 1, ram_low_sz,
> -                                 1, 0x90000000, 1, ram_high_sz);
> +                                 1, boston_memmap[BOSTON_LOWDDR].base, 1, ram_low_sz,
> +                                 1, boston_memmap[BOSTON_HIGHDDR].base + ram_low_sz,
> +                                 1, ram_high_sz);
>
>     fdt = g_realloc(fdt, fdt_totalsize(fdt));
>     qemu_fdt_dumpdtb(fdt, fdt_sz);
> @@ -438,11 +475,13 @@ static void boston_mach_init(MachineState *machine)
>     sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->cps), 0, 0, 1);
>
>     flash =  g_new(MemoryRegion, 1);
> -    memory_region_init_rom(flash, NULL, "boston.flash", 128 * MiB,
> +    memory_region_init_rom(flash, NULL, "boston.flash", boston_memmap[BOSTON_FLASH].size,
>                            &error_fatal);
> -    memory_region_add_subregion_overlap(sys_mem, 0x18000000, flash, 0);
> +    memory_region_add_subregion_overlap(sys_mem, boston_memmap[BOSTON_FLASH].base,
> +                                        flash, 0);
>
> -    memory_region_add_subregion_overlap(sys_mem, 0x80000000, machine->ram, 0);
> +    memory_region_add_subregion_overlap(sys_mem, boston_memmap[BOSTON_HIGHDDR].base,
> +                                        machine->ram, 0);
>
>     ddr_low_alias = g_new(MemoryRegion, 1);
>     memory_region_init_alias(ddr_low_alias, NULL, "boston_low.ddr",
> @@ -451,32 +490,40 @@ static void boston_mach_init(MachineState *machine)
>     memory_region_add_subregion_overlap(sys_mem, 0, ddr_low_alias, 0);
>
>     xilinx_pcie_init(sys_mem, 0,
> -                     0x10000000, 32 * MiB,
> -                     0x40000000, 1 * GiB,
> +                     boston_memmap[BOSTON_PCIE0].base,
> +                     boston_memmap[BOSTON_PCIE0].size,
> +                     boston_memmap[BOSTON_PCIE0_MMIO].base,
> +                     boston_memmap[BOSTON_PCIE0_MMIO].size,
>                      get_cps_irq(&s->cps, 2), false);
>
>     xilinx_pcie_init(sys_mem, 1,
> -                     0x12000000, 32 * MiB,
> -                     0x20000000, 512 * MiB,
> +                     boston_memmap[BOSTON_PCIE1].base,
> +                     boston_memmap[BOSTON_PCIE1].size,
> +                     boston_memmap[BOSTON_PCIE1_MMIO].base,
> +                     boston_memmap[BOSTON_PCIE1_MMIO].size,
>                      get_cps_irq(&s->cps, 1), false);
>
>     pcie2 = xilinx_pcie_init(sys_mem, 2,
> -                             0x14000000, 32 * MiB,
> -                             0x16000000, 1 * MiB,
> +                             boston_memmap[BOSTON_PCIE2].base,
> +                             boston_memmap[BOSTON_PCIE2].size,
> +                             boston_memmap[BOSTON_PCIE2_MMIO].base,
> +                             boston_memmap[BOSTON_PCIE2_MMIO].size,
>                              get_cps_irq(&s->cps, 0), true);
>
>     platreg = g_new(MemoryRegion, 1);
>     memory_region_init_io(platreg, NULL, &boston_platreg_ops, s,
> -                          "boston-platregs", 0x1000);
> -    memory_region_add_subregion_overlap(sys_mem, 0x17ffd000, platreg, 0);
> +                          "boston-platregs",
> +                          boston_memmap[BOSTON_PLATREG].size);
> +    memory_region_add_subregion_overlap(sys_mem,
> +                          boston_memmap[BOSTON_PLATREG].base, platreg, 0);
>
> -    s->uart = serial_mm_init(sys_mem, 0x17ffe000, 2,
> +    s->uart = serial_mm_init(sys_mem, boston_memmap[BOSTON_UART].base, 2,
>                              get_cps_irq(&s->cps, 3), 10000000,
>                              serial_hd(0), DEVICE_NATIVE_ENDIAN);
>
>     lcd = g_new(MemoryRegion, 1);
>     memory_region_init_io(lcd, NULL, &boston_lcd_ops, s, "boston-lcd", 0x8);
> -    memory_region_add_subregion_overlap(sys_mem, 0x17fff000, lcd, 0);
> +    memory_region_add_subregion_overlap(sys_mem, boston_memmap[BOSTON_LCD].base, lcd, 0);
>
>     chr = qemu_chr_new("lcd", "vc:320x240", NULL);
>     qemu_chr_fe_init(&s->lcd_display, chr, NULL);
>
--3866299591-1686618801-1632929569=:36041--

