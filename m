Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903033F5FA3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 15:59:04 +0200 (CEST)
Received: from localhost ([::1]:44750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIWxD-0006YR-I2
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 09:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIWwG-0005tf-SV
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:58:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIWwE-0004CP-9d
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629813481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bBVlcwG4z+aayIo6G69iRqgTfaPARecNS6/d5XrRYwg=;
 b=EN9UWcT9iC9O7KkHqPdgCShf4hxERwNigo8SKFH9c/V2xXOcnEpVflTqcOP1l/S24jpmEl
 WoZdssxochnYFEBxlBO1tFKGZJhnd/gCoWj2DvQpfnd2hyUMtdY5vAG4vGL5p3VtmVEBIu
 dDypaQlQKYf8Bp3DmccEEQDVuM1jed4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-TA2ufuWVPwCzf94XEtgkuw-1; Tue, 24 Aug 2021 09:57:59 -0400
X-MC-Unique: TA2ufuWVPwCzf94XEtgkuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D7201018F70;
 Tue, 24 Aug 2021 13:57:57 +0000 (UTC)
Received: from localhost (unknown [10.22.32.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FCB060C0F;
 Tue, 24 Aug 2021 13:57:42 +0000 (UTC)
Date: Tue, 24 Aug 2021 09:57:42 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 2/3] hw/usb/hcd-xhci-pci: Abort if setting link
 property failed
Message-ID: <20210824135742.auvxsilpjtlruwyc@habkost.net>
References: <20210819171547.2879725-1-philmd@redhat.com>
 <20210819171547.2879725-3-philmd@redhat.com>
 <20210823183414.hmu4ly2y5zkbw3mg@habkost.net>
 <87ilzvntu1.fsf@dusky.pond.sub.org>
 <CAFEAcA-2ShxjS6YAb_xBk=v5YJ5nLaaKtOLVEn7Vjfe6rkpp2A@mail.gmail.com>
 <87tujfdp4c.fsf@dusky.pond.sub.org>
 <CAFEAcA9_HGCVYX8smuAWhUDJ8NbfQ76XgJjOLd2EoyiS2gKC0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9_HGCVYX8smuAWhUDJ8NbfQ76XgJjOLd2EoyiS2gKC0A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 24, 2021 at 01:16:40PM +0100, Peter Maydell wrote:
> On Tue, 24 Aug 2021 at 13:05, Markus Armbruster <armbru@redhat.com> wrote:
> > When you know that all callers handle errors like &error_fatal does, use
> > of &error_fatal doesn't produce wrong behavior.  It's still kind of
> > wrong, because relying on such a non-local argument without a genuine
> > need is.
> 
> Not using error_fatal results in quite a bit of extra boilerplate
> for all those extra explicit "check for failure, print the error
> message and exit" points.

I don't get it.  There's no need for extra boilerplate if the
caller is using &error_fatal.

> If the MachineState init function took
> an Error** that might be a mild encouragement to "pass an Error
> upward rather than exiting"; but it doesn't.

Agreed.

> 
> Right now we have nearly a thousand instances of error_fatal
> in the codebase, incidentally.

It looks like 73 of them are in functions that take an Error**
argument.

Coccinelle patch for finding them:

@@
typedef Error;
type T;
identifier errp, fn;
@@
 T fn(..., Error **errp)
 {
 ...
*&error_fatal
 ...
 }


Coccinelle output:

  diff -u -p ./hw/pci-host/pnv_phb3.c /tmp/nothing/hw/pci-host/pnv_phb3.c
  --- ./hw/pci-host/pnv_phb3.c
  +++ /tmp/nothing/hw/pci-host/pnv_phb3.c
  @@ -1054,7 +1054,6 @@ static void pnv_phb3_realize(DeviceState
       /* Add a single Root port */
       qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
       qdev_prop_set_uint16(DEVICE(&phb->root), "slot", phb->phb_id);
  -    qdev_realize(DEVICE(&phb->root), BUS(pci->bus), &error_fatal);
   }
   
   void pnv_phb3_update_regions(PnvPHB3 *phb)
  diff -u -p ./hw/pci-host/q35.c /tmp/nothing/hw/pci-host/q35.c
  --- ./hw/pci-host/q35.c
  +++ /tmp/nothing/hw/pci-host/q35.c
  @@ -67,7 +67,6 @@ static void q35_host_realize(DeviceState
       PC_MACHINE(qdev_get_machine())->bus = pci->bus;
       pci->bypass_iommu =
           PC_MACHINE(qdev_get_machine())->default_bus_bypass_iommu;
  -    qdev_realize(DEVICE(&s->mch), BUS(pci->bus), &error_fatal);
   }
   
   static const char *q35_host_root_bus_path(PCIHostState *host_bridge,
  diff -u -p ./hw/pci-host/mv64361.c /tmp/nothing/hw/pci-host/mv64361.c
  --- ./hw/pci-host/mv64361.c
  +++ /tmp/nothing/hw/pci-host/mv64361.c
  @@ -875,7 +875,6 @@ static void mv64361_realize(DeviceState
                                   TYPE_MV64361_PCI);
           DeviceState *pci = DEVICE(&s->pci[i]);
           qdev_prop_set_uint8(pci, "index", i);
  -        sysbus_realize_and_unref(SYS_BUS_DEVICE(pci), &error_fatal);
       }
       sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cpu_irq);
       qdev_init_gpio_in_named(dev, mv64361_gpp_irq, "gpp", 32);
  diff -u -p ./hw/pci-host/designware.c /tmp/nothing/hw/pci-host/designware.c
  --- ./hw/pci-host/designware.c
  +++ /tmp/nothing/hw/pci-host/designware.c
  @@ -707,7 +707,6 @@ static void designware_pcie_host_realize
                          "pcie-bus-address-space");
       pci_setup_iommu(pci->bus, designware_pcie_host_set_iommu, s);
   
  -    qdev_realize(DEVICE(&s->root), BUS(pci->bus), &error_fatal);
   }
   
   static const VMStateDescription vmstate_designware_pcie_host = {
  diff -u -p ./hw/pci-host/raven.c /tmp/nothing/hw/pci-host/raven.c
  --- ./hw/pci-host/raven.c
  +++ /tmp/nothing/hw/pci-host/raven.c
  @@ -335,7 +335,6 @@ static void raven_realize(PCIDevice *d,
       d->config[0x34] = 0x00; // capabilities_pointer
   
       memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_SIZE,
  -                                     &error_fatal);
       memory_region_add_subregion(get_system_memory(), (uint32_t)(-BIOS_SIZE),
                                   &s->bios);
       if (s->bios_name) {
  diff -u -p ./hw/pci-host/gpex.c /tmp/nothing/hw/pci-host/gpex.c
  --- ./hw/pci-host/gpex.c
  +++ /tmp/nothing/hw/pci-host/gpex.c
  @@ -138,7 +138,6 @@ static void gpex_host_realize(DeviceStat
                                        &s->io_ioport, 0, 4, TYPE_PCIE_BUS);
   
       pci_bus_set_route_irq_fn(pci->bus, gpex_route_intx_pin_to_irq);
  -    qdev_realize(DEVICE(&s->gpex_root), BUS(pci->bus), &error_fatal);
   }
   
   static const char *gpex_host_root_bus_path(PCIHostState *host_bridge,
  diff -u -p ./hw/pci-host/xilinx-pcie.c /tmp/nothing/hw/pci-host/xilinx-pcie.c
  --- ./hw/pci-host/xilinx-pcie.c
  +++ /tmp/nothing/hw/pci-host/xilinx-pcie.c
  @@ -137,7 +137,6 @@ static void xilinx_pcie_host_realize(Dev
                                        pci_swizzle_map_irq_fn, s, &s->mmio,
                                        &s->io, 0, 4, TYPE_PCIE_BUS);
   
  -    qdev_realize(DEVICE(&s->root), BUS(pci->bus), &error_fatal);
   }
   
   static const char *xilinx_pcie_host_root_bus_path(PCIHostState *host_bridge,
  diff -u -p ./hw/ppc/spapr_irq.c /tmp/nothing/hw/ppc/spapr_irq.c
  --- ./hw/ppc/spapr_irq.c
  +++ /tmp/nothing/hw/ppc/spapr_irq.c
  @@ -337,7 +337,6 @@ void spapr_irq_init(SpaprMachineState *s
           qdev_prop_set_uint32(dev, "nr-ends", nr_servers << 3);
           object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(spapr),
                                    &error_abort);
  -        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
   
           spapr->xive = SPAPR_XIVE(dev);
   
  diff -u -p ./hw/ppc/pnv.c /tmp/nothing/hw/ppc/pnv.c
  --- ./hw/ppc/pnv.c
  +++ /tmp/nothing/hw/ppc/pnv.c
  @@ -1144,7 +1144,6 @@ static void pnv_chip_power8_realize(Devi
   
       /* Processor Service Interface (PSI) Host Bridge */
       object_property_set_int(OBJECT(&chip8->psi), "bar", PNV_PSIHB_BASE(chip),
  -                            &error_fatal);
       object_property_set_link(OBJECT(&chip8->psi), ICS_PROP_XICS,
                                OBJECT(chip8->xics), &error_abort);
       if (!qdev_realize(DEVICE(&chip8->psi), NULL, errp)) {
  @@ -1587,7 +1586,6 @@ static void pnv_chip_power10_realize(Dev
   
       /* Processor Service Interface (PSI) Host Bridge */
       object_property_set_int(OBJECT(&chip10->psi), "bar",
  -                            PNV10_PSIHB_BASE(chip), &error_fatal);
       if (!qdev_realize(DEVICE(&chip10->psi), NULL, errp)) {
           return;
       }
  diff -u -p ./hw/intc/exynos4210_gic.c /tmp/nothing/hw/intc/exynos4210_gic.c
  --- ./hw/intc/exynos4210_gic.c
  +++ /tmp/nothing/hw/intc/exynos4210_gic.c
  @@ -301,7 +301,6 @@ static void exynos4210_gic_realize(Devic
       qdev_prop_set_uint32(s->gic, "num-cpu", s->num_cpu);
       qdev_prop_set_uint32(s->gic, "num-irq", EXYNOS4210_GIC_NIRQ);
       gicbusdev = SYS_BUS_DEVICE(s->gic);
  -    sysbus_realize_and_unref(gicbusdev, &error_fatal);
   
       /* Pass through outbound IRQ lines from the GIC */
       sysbus_pass_irq(sbd, gicbusdev);
  diff -u -p ./hw/intc/spapr_xive.c /tmp/nothing/hw/intc/spapr_xive.c
  --- ./hw/intc/spapr_xive.c
  +++ /tmp/nothing/hw/intc/spapr_xive.c
  @@ -311,7 +311,6 @@ static void spapr_xive_realize(DeviceSta
        * Initialize the internal sources, for IPIs and virtual devices.
        */
       object_property_set_int(OBJECT(xsrc), "nr-irqs", xive->nr_irqs,
  -                            &error_fatal);
       object_property_set_link(OBJECT(xsrc), "xive", OBJECT(xive), &error_abort);
       if (!qdev_realize(DEVICE(xsrc), NULL, errp)) {
           return;
  diff -u -p ./hw/intc/pnv_xive.c /tmp/nothing/hw/intc/pnv_xive.c
  --- ./hw/intc/pnv_xive.c
  +++ /tmp/nothing/hw/intc/pnv_xive.c
  @@ -1833,7 +1833,6 @@ static void pnv_xive_realize(DeviceState
        * to limit accesses to resources not provisioned.
        */
       object_property_set_int(OBJECT(xsrc), "nr-irqs", PNV_XIVE_NR_IRQS,
  -                            &error_fatal);
       object_property_set_link(OBJECT(xsrc), "xive", OBJECT(xive), &error_abort);
       if (!qdev_realize(DEVICE(xsrc), NULL, errp)) {
           return;
  diff -u -p ./hw/riscv/shakti_c.c /tmp/nothing/hw/riscv/shakti_c.c
  --- ./hw/riscv/shakti_c.c
  +++ /tmp/nothing/hw/riscv/shakti_c.c
  @@ -137,7 +137,6 @@ static void shakti_c_soc_state_realize(D
   
       /* ROM */
       memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom",
  -                           shakti_c_memmap[SHAKTI_C_ROM].size, &error_fatal);
       memory_region_add_subregion(system_memory,
           shakti_c_memmap[SHAKTI_C_ROM].base, &sss->rom);
   }
  diff -u -p ./hw/riscv/sifive_e.c /tmp/nothing/hw/riscv/sifive_e.c
  --- ./hw/riscv/sifive_e.c
  +++ /tmp/nothing/hw/riscv/sifive_e.c
  @@ -192,7 +192,6 @@ static void sifive_e_soc_realize(DeviceS
   
       /* Mask ROM */
       memory_region_init_rom(&s->mask_rom, OBJECT(dev), "riscv.sifive.e.mrom",
  -                           memmap[SIFIVE_E_DEV_MROM].size, &error_fatal);
       memory_region_add_subregion(sys_mem,
           memmap[SIFIVE_E_DEV_MROM].base, &s->mask_rom);
   
  diff -u -p ./hw/display/bochs-display.c /tmp/nothing/hw/display/bochs-display.c
  --- ./hw/display/bochs-display.c
  +++ /tmp/nothing/hw/display/bochs-display.c
  @@ -280,7 +280,6 @@ static void bochs_display_realize(PCIDev
       s->con = graphic_console_init(DEVICE(dev), 0, &bochs_display_gfx_ops, s);
   
       memory_region_init_ram(&s->vram, obj, "bochs-display-vram", s->vgamem,
  -                           &error_fatal);
       memory_region_init_io(&s->vbe, obj, &bochs_display_vbe_ops, s,
                             "bochs dispi interface", PCI_VGA_BOCHS_SIZE);
       memory_region_init_io(&s->qext, obj, &bochs_display_qext_ops, s,
  diff -u -p ./hw/display/tcx.c /tmp/nothing/hw/display/tcx.c
  --- ./hw/display/tcx.c
  +++ /tmp/nothing/hw/display/tcx.c
  @@ -818,7 +818,6 @@ static void tcx_realizefn(DeviceState *d
       char *fcode_filename;
   
       memory_region_init_ram_nomigrate(&s->vram_mem, OBJECT(s), "tcx.vram",
  -                           s->vram_size * (1 + 4 + 4), &error_fatal);
       vmstate_register_ram_global(&s->vram_mem);
       memory_region_set_log(&s->vram_mem, true, DIRTY_MEMORY_VGA);
       vram_base = memory_region_get_ram_ptr(&s->vram_mem);
  diff -u -p ./hw/display/next-fb.c /tmp/nothing/hw/display/next-fb.c
  --- ./hw/display/next-fb.c
  +++ /tmp/nothing/hw/display/next-fb.c
  @@ -108,7 +108,6 @@ static void nextfb_realize(DeviceState *
       NeXTFbState *s = NEXTFB(dev);
   
       memory_region_init_ram(&s->fb_mr, OBJECT(dev), "next-video", 0x1CB100,
  -                           &error_fatal);
       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->fb_mr);
   
       s->invalidate = 1;
  diff -u -p ./hw/display/qxl.c /tmp/nothing/hw/display/qxl.c
  --- ./hw/display/qxl.c
  +++ /tmp/nothing/hw/display/qxl.c
  @@ -2232,7 +2232,6 @@ static void qxl_realize_secondary(PCIDev
   
       qxl_init_ramsize(qxl);
       memory_region_init_ram(&qxl->vga.vram, OBJECT(dev), "qxl.vgavram",
  -                           qxl->vga.vram_size, &error_fatal);
       qxl->vga.vram_ptr = memory_region_get_ram_ptr(&qxl->vga.vram);
       qxl->vga.con = graphic_console_init(DEVICE(dev), 0, &qxl_ops, qxl);
       qxl->ssd.dcl.con = qxl->vga.con;
  diff -u -p ./hw/display/cg3.c /tmp/nothing/hw/display/cg3.c
  --- ./hw/display/cg3.c
  +++ /tmp/nothing/hw/display/cg3.c
  @@ -311,7 +311,6 @@ static void cg3_realizefn(DeviceState *d
       }
   
       memory_region_init_ram(&s->vram_mem, NULL, "cg3.vram", s->vram_size,
  -                           &error_fatal);
       memory_region_set_log(&s->vram_mem, true, DIRTY_MEMORY_VGA);
       sysbus_init_mmio(sbd, &s->vram_mem);
   
  diff -u -p ./hw/dma/sparc32_dma.c /tmp/nothing/hw/dma/sparc32_dma.c
  --- ./hw/dma/sparc32_dma.c
  +++ /tmp/nothing/hw/dma/sparc32_dma.c
  @@ -309,7 +309,6 @@ static void sparc32_espdma_device_realiz
       esp->dma_opaque = SPARC32_DMA_DEVICE(dev);
       sysbus->it_shift = 2;
       esp->dma_enabled = 1;
  -    sysbus_realize(SYS_BUS_DEVICE(sysbus), &error_fatal);
   }
   
   static void sparc32_espdma_device_class_init(ObjectClass *klass, void *data)
  @@ -344,7 +343,6 @@ static void sparc32_ledma_device_realize
       SysBusPCNetState *lance = SYSBUS_PCNET(&s->lance);
   
       object_property_set_link(OBJECT(lance), "dma", OBJECT(dev), &error_abort);
  -    sysbus_realize(SYS_BUS_DEVICE(lance), &error_fatal);
   }
   
   static void sparc32_ledma_device_class_init(ObjectClass *klass, void *data)
  diff -u -p ./hw/block/onenand.c /tmp/nothing/hw/block/onenand.c
  --- ./hw/block/onenand.c
  +++ /tmp/nothing/hw/block/onenand.c
  @@ -812,7 +812,6 @@ static void onenand_realize(DeviceState
       s->otp = memset(g_malloc((64 + 2) << PAGE_SHIFT),
                       0xff, (64 + 2) << PAGE_SHIFT);
       memory_region_init_ram_nomigrate(&s->ram, OBJECT(s), "onenand.ram",
  -                           0xc000 << s->shift, &error_fatal);
       vmstate_register_ram_global(&s->ram);
       ram = memory_region_get_ram_ptr(&s->ram);
       s->boot[0] = ram + (0x0000 << s->shift);
  diff -u -p ./hw/isa/vt82c686.c /tmp/nothing/hw/isa/vt82c686.c
  --- ./hw/isa/vt82c686.c
  +++ /tmp/nothing/hw/isa/vt82c686.c
  @@ -618,7 +618,6 @@ static void vt82c686b_realize(PCIDevice
       qdev_init_gpio_out(dev, &s->cpu_intr, 1);
       isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
       isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
  -                          &error_fatal);
       isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
       i8254_pit_init(isa_bus, 0x40, 0, NULL);
       i8257_dma_init(isa_bus, 0);
  @@ -699,7 +698,6 @@ static void vt8231_realize(PCIDevice *d,
       qdev_init_gpio_out(dev, &s->cpu_intr, 1);
       isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
       isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
  -                          &error_fatal);
       isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
       i8254_pit_init(isa_bus, 0x40, 0, NULL);
       i8257_dma_init(isa_bus, 0);
  diff -u -p ./hw/isa/isa-superio.c /tmp/nothing/hw/isa/isa-superio.c
  --- ./hw/isa/isa-superio.c
  +++ /tmp/nothing/hw/isa/isa-superio.c
  @@ -141,7 +141,6 @@ static void isa_superio_realize(DeviceSt
       /* Keyboard, mouse */
       isa = isa_new(TYPE_I8042);
       object_property_add_child(OBJECT(sio), TYPE_I8042, OBJECT(isa));
  -    isa_realize_and_unref(isa, bus, &error_fatal);
       sio->kbc = isa;
   
       /* IDE */
  diff -u -p ./hw/isa/isa-bus.c /tmp/nothing/hw/isa/isa-bus.c
  --- ./hw/isa/isa-bus.c
  +++ /tmp/nothing/hw/isa/isa-bus.c
  @@ -61,7 +61,6 @@ ISABus *isa_bus_new(DeviceState *dev, Me
       }
       if (!dev) {
           dev = qdev_new("isabus-bridge");
  -        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
       }
   
       isabus = ISA_BUS(qbus_create(TYPE_ISA_BUS, dev, NULL));
  diff -u -p ./hw/misc/macio/macio.c /tmp/nothing/hw/misc/macio/macio.c
  --- ./hw/misc/macio/macio.c
  +++ /tmp/nothing/hw/misc/macio/macio.c
  @@ -286,7 +286,6 @@ static void macio_newworld_realize(PCIDe
       /* OpenPIC */
       qdev_prop_set_uint32(pic_dev, "model", OPENPIC_MODEL_KEYLARGO);
       sysbus_dev = SYS_BUS_DEVICE(&ns->pic);
  -    sysbus_realize_and_unref(sysbus_dev, &error_fatal);
       memory_region_add_subregion(&s->bar, 0x40000,
                                   sysbus_mmio_get_region(sysbus_dev, 0));
   
  diff -u -p ./hw/misc/xlnx-versal-xramc.c /tmp/nothing/hw/misc/xlnx-versal-xramc.c
  --- ./hw/misc/xlnx-versal-xramc.c
  +++ /tmp/nothing/hw/misc/xlnx-versal-xramc.c
  @@ -182,7 +182,6 @@ static void xram_ctrl_realize(DeviceStat
   
       memory_region_init_ram(&s->ram, OBJECT(s),
                              object_get_canonical_path_component(OBJECT(s)),
  -                           s->cfg.size, &error_fatal);
       sysbus_init_mmio(sbd, &s->ram);
   }
   
  diff -u -p ./hw/sparc64/sun4u.c /tmp/nothing/hw/sparc64/sun4u.c
  --- ./hw/sparc64/sun4u.c
  +++ /tmp/nothing/hw/sparc64/sun4u.c
  @@ -509,7 +509,6 @@ static void ram_realize(DeviceState *dev
       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
   
       memory_region_init_ram_nomigrate(&d->ram, OBJECT(d), "sun4u.ram", d->size,
  -                           &error_fatal);
       vmstate_register_ram_global(&d->ram);
       sysbus_init_mmio(sbd, &d->ram);
   }
  diff -u -p ./hw/nvram/eeprom_at24c.c /tmp/nothing/hw/nvram/eeprom_at24c.c
  --- ./hw/nvram/eeprom_at24c.c
  +++ /tmp/nothing/hw/nvram/eeprom_at24c.c
  @@ -135,7 +135,6 @@ static void at24c_eeprom_realize(DeviceS
           }
   
           if (blk_set_perm(ee->blk, BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
  -                         BLK_PERM_ALL, &error_fatal) < 0)
           {
               error_setg(errp, "%s: Backing file incorrect permission",
                          TYPE_AT24C_EE);
  diff -u -p ./hw/arm/xlnx-zynqmp.c /tmp/nothing/hw/arm/xlnx-zynqmp.c
  --- ./hw/arm/xlnx-zynqmp.c
  +++ /tmp/nothing/hw/arm/xlnx-zynqmp.c
  @@ -219,7 +219,6 @@ static void xlnx_zynqmp_create_rpu(Machi
           }
       }
   
  -    qdev_realize(DEVICE(&s->rpu_cluster), NULL, &error_fatal);
   }
   
   static void xlnx_zynqmp_init(Object *obj)
  @@ -352,7 +351,6 @@ static void xlnx_zynqmp_realize(DeviceSt
       qdev_prop_set_bit(DEVICE(&s->gic),
                         "has-virtualization-extensions", s->virt);
   
  -    qdev_realize(DEVICE(&s->apu_cluster), NULL, &error_fatal);
   
       /* Realize APUs before realizing the GIC. KVM requires this.  */
       for (i = 0; i < num_apus; i++) {
  diff -u -p ./hw/arm/allwinner-a10.c /tmp/nothing/hw/arm/allwinner-a10.c
  --- ./hw/arm/allwinner-a10.c
  +++ /tmp/nothing/hw/arm/allwinner-a10.c
  @@ -99,7 +99,6 @@ static void aw_a10_realize(DeviceState *
       sysbus_connect_irq(sysbusdev, 5, qdev_get_gpio_in(dev, 68));
   
       memory_region_init_ram(&s->sram_a, OBJECT(dev), "sram A", 48 * KiB,
  -                           &error_fatal);
       memory_region_add_subregion(get_system_memory(), 0x00000000, &s->sram_a);
       create_unimplemented_device("a10-sram-ctrl", 0x01c00000, 4 * KiB);
   
  diff -u -p ./hw/arm/xlnx-versal.c /tmp/nothing/hw/arm/xlnx-versal.c
  --- ./hw/arm/xlnx-versal.c
  +++ /tmp/nothing/hw/arm/xlnx-versal.c
  @@ -403,7 +403,6 @@ static void versal_realize(DeviceState *
   
       /* Create the On Chip Memory (OCM).  */
       memory_region_init_ram(&s->lpd.mr_ocm, OBJECT(s), "ocm",
  -                           MM_OCM_SIZE, &error_fatal);
   
       memory_region_add_subregion_overlap(&s->mr_ps, MM_OCM, &s->lpd.mr_ocm, 0);
       memory_region_add_subregion_overlap(&s->fpd.apu.mr, 0, &s->mr_ps, 0);
  diff -u -p ./hw/pci/pci.c /tmp/nothing/hw/pci/pci.c
  --- ./hw/pci/pci.c
  +++ /tmp/nothing/hw/pci/pci.c
  @@ -2412,7 +2412,6 @@ static void pci_add_option_rom(PCIDevice
           snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
       }
       pdev->has_rom = true;
  -    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
       ptr = memory_region_get_ram_ptr(&pdev->rom);
       if (load_image_size(path, ptr, size) < 0) {
           error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
  diff -u -p ./hw/pci-bridge/pci_expander_bridge.c /tmp/nothing/hw/pci-bridge/pci_expander_bridge.c
  --- ./hw/pci-bridge/pci_expander_bridge.c
  +++ /tmp/nothing/hw/pci-bridge/pci_expander_bridge.c
  @@ -264,7 +264,6 @@ static void pxb_dev_realize_common(PCIDe
           goto err_register_bus;
       }
   
  -    sysbus_realize_and_unref(SYS_BUS_DEVICE(ds), &error_fatal);
       if (bds) {
           qdev_realize_and_unref(bds, &bus->qbus, &error_fatal);
       }
  diff -u -p ./softmmu/vl.c /tmp/nothing/softmmu/vl.c
  --- ./softmmu/vl.c
  +++ /tmp/nothing/softmmu/vl.c
  @@ -2189,7 +2189,6 @@ static void qemu_record_config_group(con
           assert(!from_json);
           keyval_merge(machine_opts_dict, dict, errp);
       } else if (g_str_equal(group, "smp-opts")) {
  -        machine_merge_property("smp", dict, &error_fatal);
       } else {
           abort();
       }
  @@ -2309,7 +2308,6 @@ static int do_configure_accelerator(void
       object_apply_compat_props(OBJECT(accel));
       qemu_opt_foreach(opts, accelerator_set_property,
                        accel,
  -                     &error_fatal);
   
       ret = accel_init_machine(accel, current_machine);
       if (ret < 0) {

-- 
Eduardo


