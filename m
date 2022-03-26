Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DF24E7ECD
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 04:41:52 +0100 (CET)
Received: from localhost ([::1]:36358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXxJH-0006uz-Tb
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 23:41:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nXxHD-0005jq-8C
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 23:39:43 -0400
Received: from [2607:f8b0:4864:20::42a] (port=34366
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nXxHA-0006VH-7Y
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 23:39:42 -0400
Received: by mail-pf1-x42a.google.com with SMTP id h19so7116635pfv.1
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 20:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PULp0FnM4fQS4pmN/N3FYye8onbH0gmjOqGrgvI8G8w=;
 b=IFnH0utjv2EE91aPYatCbSqtv+QeC2M1K28n0OqY/m98wlDerQOwH4U+oDMkLcZJgh
 CnkCXd2FyxD4KMbo6kNxI2xz9uHx7IigumVnK5k7EDPRi8k0jR6DfmC4/6tv83GtcDeK
 CcLR9qY3l8PSC3ytZJK+cHZ6/4Ns9kond6/VoN+yHWfgAisX8sHsenONf+43uIFJMJeU
 gduUh9M1ny1GxgSsp/qD2xKyavNhNQ6EVhis00kiae9ajVPkGYX6XVPFPFSXBQsKnKYR
 h+qAN8JjtzmCylGVFIoD6fgZ2QapPJDKhr3d+ayB5OFVyj0VF46qn2yayC2FBPEWAtpX
 N9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PULp0FnM4fQS4pmN/N3FYye8onbH0gmjOqGrgvI8G8w=;
 b=FrcWzCH3oOmYM89q1unCTkRj2BwMkGO0h3Uq2LTHHAtMSBucBJ9YhAXNsuPbVIL1yg
 cRIkcxAC/3UxAW/KLiFi1PB3cCvVe+1xCXGo7xDgPxNhoGlRNfwrAzh7DUke+FVPSb8+
 k/yGhjp8gjdWi/WjGC5R1Xlo3eGzCzKAGm23f2E2olsDP8Jzj3v5tqpJxCJjherjrOGs
 ACNL/IA0InEGDmjazuUKVKyA5VGIXAG+IfasxDvP2cg/awm9l6xqK0dtjJ2fN9Oydr2T
 iwTHSk3blQKb5qoJUk1B+KWwaxKayp/xCD5Xkr2e83gKkdXGiKDOoy+Dyrf/ALG7kRdF
 azdA==
X-Gm-Message-State: AOAM532tEdea1Zf+Q6GKE0vH2hyzALrZ8/FOsxPfcnnUK5DPUrcLnoah
 GygbvKxh6vd9NumsMa/n5Qs9xWRowju7YAKw
X-Google-Smtp-Source: ABdhPJyTsfeKTFdnRst2FtQZed2Pwa9Z/TbWbGyRjPNBWCS1B3e4QiIm2Gs6KNWP/jMhJG7+sui8jw==
X-Received: by 2002:a05:6a00:e8e:b0:4fa:a52f:59cf with SMTP id
 bo14-20020a056a000e8e00b004faa52f59cfmr12813527pfb.84.1648265978179; 
 Fri, 25 Mar 2022 20:39:38 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com.
 [209.85.216.48]) by smtp.gmail.com with ESMTPSA id
 s18-20020a639e12000000b00381bd8604ecsm6491722pgd.40.2022.03.25.20.39.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 20:39:37 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id gb19so9239631pjb.1
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 20:39:36 -0700 (PDT)
X-Received: by 2002:a17:902:e88e:b0:154:7562:176d with SMTP id
 w14-20020a170902e88e00b001547562176dmr14835782plg.13.1648265976338; Fri, 25
 Mar 2022 20:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220316222116.2492777-1-tjeznach@rivosinc.com>
 <20220316222116.2492777-3-tjeznach@rivosinc.com>
In-Reply-To: <20220316222116.2492777-3-tjeznach@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 26 Mar 2022 11:39:25 +0800
X-Gmail-Original-Message-ID: <CANzO1D2046_-+BMMG3DPeK83eGbwJcvuH0aDLBuU8n=oDWTfCQ@mail.gmail.com>
Message-ID: <CANzO1D2046_-+BMMG3DPeK83eGbwJcvuH0aDLBuU8n=oDWTfCQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] hw/riscv: virt: Add rivos-iommu device to 'virt'
 machine.
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Content-Type: multipart/alternative; boundary="00000000000003dcb605db16d4d9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@rivosinc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000003dcb605db16d4d9
Content-Type: text/plain; charset="UTF-8"

Hi Tomasz,

I think this patch is trying to do two things:
1. Split riscv_load_kernel() and riscv_load_fdt() +
riscv_setup_rom_reset_vec()
    to allow the devices to be added with -device or device_add(), which
DTB should
    reflect the changes.
2. Allow IOMMU to be hotplugable to riscv vrit machine.

So, I think this patch could be split into two patches as described above.
And also add more comments in the commit message to describe why the changes
are required.

The following two commits are good examples for you,
which helps me understand why we need to move load_dtb() to machine done
notifier:
4576704: arm/boot: split load_dtb() from arm_load_kernel()
ac9d32e: hw/arm/boot: arm_load_kernel implemented as a machine init done
notifier

Regards,
Frank Chang

On Thu, Mar 17, 2022 at 6:24 AM Tomasz Jeznach <tjeznach@rivosinc.com>
wrote:

> Enable rivos-iommu device support in riscv:virt machine emulation.
>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> ---
>  hw/riscv/Kconfig        |   1 +
>  hw/riscv/virt.c         | 115 +++++++++++++++++++++++++++++++---------
>  include/hw/riscv/virt.h |   2 +
>  3 files changed, 94 insertions(+), 24 deletions(-)
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index c6cbd7b42c..3b1528e560 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -51,6 +51,7 @@ config RISCV_VIRT
>      select SIFIVE_TEST
>      select VIRTIO_MMIO
>      select FW_CFG_DMA
> +    select RIVOS_IOMMU
>
>  config SIFIVE_E
>      bool
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index da50cbed43..13e6f03400 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -32,6 +32,7 @@
>  #include "hw/riscv/virt.h"
>  #include "hw/riscv/boot.h"
>  #include "hw/riscv/numa.h"
> +#include "hw/riscv/rivos_iommu.h"
>  #include "hw/intc/riscv_aclint.h"
>  #include "hw/intc/riscv_aplic.h"
>  #include "hw/intc/riscv_imsic.h"
> @@ -948,6 +949,33 @@ static void create_fdt_flash(RISCVVirtState *s, const
> MemMapEntry *memmap)
>      g_free(name);
>  }
>
> +static void create_rivos_iommu_dt_binding(RISCVVirtState *s, uint16_t bdf)
> +{
> +    const char compat[] = "rivos,pci-iommu";
> +    MachineState *mc = MACHINE(s);
> +    uint32_t iommu_phandle;
> +    char *iommu_node;
> +    char *pci_node;
> +
> +    pci_node = g_strdup_printf("/soc/pci@%lx",
> +            (long) virt_memmap[VIRT_PCIE_ECAM].base);
> +    iommu_node = g_strdup_printf("%s/iommu@%x", pci_node, bdf);
> +
> +    iommu_phandle = qemu_fdt_alloc_phandle(mc->fdt);
> +    qemu_fdt_add_subnode(mc->fdt, iommu_node);
> +    qemu_fdt_setprop(mc->fdt, iommu_node, "compatible", compat,
> sizeof(compat));
> +    qemu_fdt_setprop_sized_cells(mc->fdt, iommu_node, "reg",
> +            1, bdf << 8, 1, 0, 1, 0, 1, 0, 1, 0);
> +    qemu_fdt_setprop_cell(mc->fdt, iommu_node, "#iommu-cells", 1);
> +    qemu_fdt_setprop_cell(mc->fdt, iommu_node, "phandle", iommu_phandle);
> +    g_free(iommu_node);
> +
> +    qemu_fdt_setprop_cells(mc->fdt, pci_node, "iommu-map",
> +            0x0, iommu_phandle, 0x0, bdf,
> +            bdf + 1, iommu_phandle, bdf + 1, 0xffff - bdf);
> +    g_free(pci_node);
> +}
> +
>  static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>                         uint64_t mem_size, const char *cmdline, bool
> is_32_bit)
>  {
> @@ -1156,6 +1184,34 @@ static DeviceState
> *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
>      return aplic_m;
>  }
>
> +static void virt_machine_done(Notifier *notifier, void *data)
> +{
> +    const MemMapEntry *memmap = virt_memmap;
> +    uint32_t fdt_load_addr;
> +    target_ulong start_addr = memmap[VIRT_DRAM].base;
> +    RISCVVirtState *s = container_of(notifier, RISCVVirtState,
> machine_done);
> +    MachineState *machine = MACHINE(s);
> +
> +    /* Compute the fdt load address in dram */
> +    fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
> +                                   machine->ram_size, machine->fdt);
> +    /* load the reset vector */
> +    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
> +                              virt_memmap[VIRT_MROM].base,
> +                              virt_memmap[VIRT_MROM].size,
> +                              s->kernel_entry,
> +                              fdt_load_addr, machine->fdt);
> +
> +    /*
> +     * Only direct boot kernel is currently supported for KVM VM,
> +     * So here setup kernel start address and fdt address.
> +     * TODO:Support firmware loading and integrate to TCG start
> +     */
> +    if (kvm_enabled()) {
> +        riscv_setup_direct_kernel(s->kernel_entry, fdt_load_addr);
> +    }
> +}
> +
>  static void virt_machine_init(MachineState *machine)
>  {
>      const MemMapEntry *memmap = virt_memmap;
> @@ -1165,8 +1221,6 @@ static void virt_machine_init(MachineState *machine)
>      char *soc_name;
>      target_ulong start_addr = memmap[VIRT_DRAM].base;
>      target_ulong firmware_end_addr, kernel_start_addr;
> -    uint32_t fdt_load_addr;
> -    uint64_t kernel_entry;
>      DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
>      int i, base_hartid, hart_count;
>
> @@ -1328,13 +1382,13 @@ static void virt_machine_init(MachineState
> *machine)
>          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>
> firmware_end_addr);
>
> -        kernel_entry = riscv_load_kernel(machine->kernel_filename,
> -                                         kernel_start_addr, NULL);
> +        s->kernel_entry = riscv_load_kernel(machine->kernel_filename,
> +                                            kernel_start_addr, NULL);
>
>          if (machine->initrd_filename) {
>              hwaddr start;
>              hwaddr end = riscv_load_initrd(machine->initrd_filename,
> -                                           machine->ram_size,
> kernel_entry,
> +                                           machine->ram_size,
> s->kernel_entry,
>                                             &start);
>              qemu_fdt_setprop_cell(machine->fdt, "/chosen",
>                                    "linux,initrd-start", start);
> @@ -1346,7 +1400,7 @@ static void virt_machine_init(MachineState *machine)
>          * If dynamic firmware is used, it doesn't know where is the next
> mode
>          * if kernel argument is not set.
>          */
> -        kernel_entry = 0;
> +        s->kernel_entry = 0;
>      }
>
>      if (drive_get(IF_PFLASH, 0, 0)) {
> @@ -1364,24 +1418,6 @@ static void virt_machine_init(MachineState *machine)
>      s->fw_cfg = create_fw_cfg(machine);
>      rom_set_fw(s->fw_cfg);
>
> -    /* Compute the fdt load address in dram */
> -    fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
> -                                   machine->ram_size, machine->fdt);
> -    /* load the reset vector */
> -    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
> -                              virt_memmap[VIRT_MROM].base,
> -                              virt_memmap[VIRT_MROM].size, kernel_entry,
> -                              fdt_load_addr, machine->fdt);
> -
> -    /*
> -     * Only direct boot kernel is currently supported for KVM VM,
> -     * So here setup kernel start address and fdt address.
> -     * TODO:Support firmware loading and integrate to TCG start
> -     */
> -    if (kvm_enabled()) {
> -        riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
> -    }
> -
>      /* SiFive Test MMIO device */
>      sifive_test_create(memmap[VIRT_TEST].base);
>
> @@ -1417,6 +1453,29 @@ static void virt_machine_init(MachineState *machine)
>                                    drive_get(IF_PFLASH, 0, i));
>      }
>      virt_flash_map(s, system_memory);
> +
> +    s->machine_done.notify = virt_machine_done;
> +    qemu_add_machine_init_done_notifier(&s->machine_done);
> +}
> +
> +static void virt_machine_device_plug_cb(HotplugHandler *machine,
> +                                        DeviceState *dev, Error **errp)
> +{
> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
> +
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_RIVOS_IOMMU_PCI)) {
> +        PCIDevice *pdev = PCI_DEVICE(dev);
> +        create_rivos_iommu_dt_binding(s, pci_get_bdf(pdev));
> +    }
> +}
> +
> +static HotplugHandler *virt_machine_get_hotplug_handler(MachineState
> *machine,
> +                                                        DeviceState *dev)
> +{
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_RIVOS_IOMMU_PCI)) {
> +        return HOTPLUG_HANDLER(machine);
> +    }
> +    return NULL;
>  }
>
>  static void virt_machine_instance_init(Object *obj)
> @@ -1501,6 +1560,7 @@ static void virt_machine_class_init(ObjectClass *oc,
> void *data)
>  {
>      char str[128];
>      MachineClass *mc = MACHINE_CLASS(oc);
> +    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
>
>      mc->desc = "RISC-V VirtIO board";
>      mc->init = virt_machine_init;
> @@ -1512,6 +1572,9 @@ static void virt_machine_class_init(ObjectClass *oc,
> void *data)
>      mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
>      mc->numa_mem_supported = true;
>      mc->default_ram_id = "riscv_virt_board.ram";
> +    assert(!mc->get_hotplug_handler);
> +    mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
> +    hc->plug = virt_machine_device_plug_cb;
>
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>
> @@ -1542,6 +1605,10 @@ static const TypeInfo virt_machine_typeinfo = {
>      .class_init = virt_machine_class_init,
>      .instance_init = virt_machine_instance_init,
>      .instance_size = sizeof(RISCVVirtState),
> +    .interfaces = (InterfaceInfo[]) {
> +         { TYPE_HOTPLUG_HANDLER },
> +         { }
> +    },
>  };
>
>  static void virt_machine_init_register_types(void)
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 78b058ec86..daef7e88a5 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -49,7 +49,9 @@ struct RISCVVirtState {
>      DeviceState *irqchip[VIRT_SOCKETS_MAX];
>      PFlashCFI01 *flash[2];
>      FWCfgState *fw_cfg;
> +    Notifier machine_done;
>
> +    uint64_t kernel_entry;
>      int fdt_size;
>      bool have_aclint;
>      RISCVVirtAIAType aia_type;
> --
> 2.25.1
>
>
>

--00000000000003dcb605db16d4d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Tomasz,<div><br></div><div>I think this patch is t=
rying to do two things:</div><div>1. Split riscv_load_kernel() and riscv_lo=
ad_fdt()=C2=A0+ riscv_setup_rom_reset_vec()</div><div>=C2=A0 =C2=A0 to allo=
w the devices to be added with -device or device_add(), which DTB should</d=
iv><div>=C2=A0 =C2=A0 reflect the changes.</div><div>2. Allow IOMMU to be h=
otplugable=C2=A0to riscv vrit machine.</div><div><br></div><div>So, I think=
 this patch could be split into two patches as described above.</div><div>A=
nd also add more comments in the commit message to describe=C2=A0why the ch=
anges</div><div>are required.</div><div><br></div><div>The following two co=
mmits are good examples for you,</div><div>which helps me understand why we=
 need to move load_dtb() to machine done notifier:</div><div>4576704:=C2=A0=
arm/boot: split load_dtb() from arm_load_kernel()</div><div>ac9d32e: hw/arm=
/boot: arm_load_kernel implemented as a machine init done notifier</div><di=
v><br></div><div>Regards,</div><div>Frank Chang</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 17, 2022=
 at 6:24 AM Tomasz Jeznach &lt;<a href=3D"mailto:tjeznach@rivosinc.com">tje=
znach@rivosinc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Enable rivos-iommu device support in riscv:virt machine e=
mulation.<br>
<br>
Signed-off-by: Tomasz Jeznach &lt;<a href=3D"mailto:tjeznach@rivosinc.com" =
target=3D"_blank">tjeznach@rivosinc.com</a>&gt;<br>
---<br>
=C2=A0hw/riscv/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0hw/riscv/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 115 ++++++++++++++=
+++++++++++++++++---------<br>
=C2=A0include/hw/riscv/virt.h |=C2=A0 =C2=A02 +<br>
=C2=A03 files changed, 94 insertions(+), 24 deletions(-)<br>
<br>
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig<br>
index c6cbd7b42c..3b1528e560 100644<br>
--- a/hw/riscv/Kconfig<br>
+++ b/hw/riscv/Kconfig<br>
@@ -51,6 +51,7 @@ config RISCV_VIRT<br>
=C2=A0 =C2=A0 =C2=A0select SIFIVE_TEST<br>
=C2=A0 =C2=A0 =C2=A0select VIRTIO_MMIO<br>
=C2=A0 =C2=A0 =C2=A0select FW_CFG_DMA<br>
+=C2=A0 =C2=A0 select RIVOS_IOMMU<br>
<br>
=C2=A0config SIFIVE_E<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c<br>
index da50cbed43..13e6f03400 100644<br>
--- a/hw/riscv/virt.c<br>
+++ b/hw/riscv/virt.c<br>
@@ -32,6 +32,7 @@<br>
=C2=A0#include &quot;hw/riscv/virt.h&quot;<br>
=C2=A0#include &quot;hw/riscv/boot.h&quot;<br>
=C2=A0#include &quot;hw/riscv/numa.h&quot;<br>
+#include &quot;hw/riscv/rivos_iommu.h&quot;<br>
=C2=A0#include &quot;hw/intc/riscv_aclint.h&quot;<br>
=C2=A0#include &quot;hw/intc/riscv_aplic.h&quot;<br>
=C2=A0#include &quot;hw/intc/riscv_imsic.h&quot;<br>
@@ -948,6 +949,33 @@ static void create_fdt_flash(RISCVVirtState *s, const =
MemMapEntry *memmap)<br>
=C2=A0 =C2=A0 =C2=A0g_free(name);<br>
=C2=A0}<br>
<br>
+static void create_rivos_iommu_dt_binding(RISCVVirtState *s, uint16_t bdf)=
<br>
+{<br>
+=C2=A0 =C2=A0 const char compat[] =3D &quot;rivos,pci-iommu&quot;;<br>
+=C2=A0 =C2=A0 MachineState *mc =3D MACHINE(s);<br>
+=C2=A0 =C2=A0 uint32_t iommu_phandle;<br>
+=C2=A0 =C2=A0 char *iommu_node;<br>
+=C2=A0 =C2=A0 char *pci_node;<br>
+<br>
+=C2=A0 =C2=A0 pci_node =3D g_strdup_printf(&quot;/soc/pci@%lx&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (long) virt_memmap[VIRT_PCIE_ECA=
M].base);<br>
+=C2=A0 =C2=A0 iommu_node =3D g_strdup_printf(&quot;%s/iommu@%x&quot;, pci_=
node, bdf);<br>
+<br>
+=C2=A0 =C2=A0 iommu_phandle =3D qemu_fdt_alloc_phandle(mc-&gt;fdt);<br>
+=C2=A0 =C2=A0 qemu_fdt_add_subnode(mc-&gt;fdt, iommu_node);<br>
+=C2=A0 =C2=A0 qemu_fdt_setprop(mc-&gt;fdt, iommu_node, &quot;compatible&qu=
ot;, compat, sizeof(compat));<br>
+=C2=A0 =C2=A0 qemu_fdt_setprop_sized_cells(mc-&gt;fdt, iommu_node, &quot;r=
eg&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1, bdf &lt;&lt; 8, 1, 0, 1, 0, 1=
, 0, 1, 0);<br>
+=C2=A0 =C2=A0 qemu_fdt_setprop_cell(mc-&gt;fdt, iommu_node, &quot;#iommu-c=
ells&quot;, 1);<br>
+=C2=A0 =C2=A0 qemu_fdt_setprop_cell(mc-&gt;fdt, iommu_node, &quot;phandle&=
quot;, iommu_phandle);<br>
+=C2=A0 =C2=A0 g_free(iommu_node);<br>
+<br>
+=C2=A0 =C2=A0 qemu_fdt_setprop_cells(mc-&gt;fdt, pci_node, &quot;iommu-map=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0, iommu_phandle, 0x0, bdf,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bdf + 1, iommu_phandle, bdf + 1,=
 0xffff - bdf);<br>
+=C2=A0 =C2=A0 g_free(pci_node);<br>
+}<br>
+<br>
=C2=A0static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint64_t mem_size, const char *cmdline, bool is_32_bit)<br>
=C2=A0{<br>
@@ -1156,6 +1184,34 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType=
 aia_type, int aia_guests,<br>
=C2=A0 =C2=A0 =C2=A0return aplic_m;<br>
=C2=A0}<br>
<br>
+static void virt_machine_done(Notifier *notifier, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 const MemMapEntry *memmap =3D virt_memmap;<br>
+=C2=A0 =C2=A0 uint32_t fdt_load_addr;<br>
+=C2=A0 =C2=A0 target_ulong start_addr =3D memmap[VIRT_DRAM].base;<br>
+=C2=A0 =C2=A0 RISCVVirtState *s =3D container_of(notifier, RISCVVirtState,=
 machine_done);<br>
+=C2=A0 =C2=A0 MachineState *machine =3D MACHINE(s);<br>
+<br>
+=C2=A0 =C2=A0 /* Compute the fdt load address in dram */<br>
+=C2=A0 =C2=A0 fdt_load_addr =3D riscv_load_fdt(memmap[VIRT_DRAM].base,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0machine-&gt;ram_size, m=
achine-&gt;fdt);<br>
+=C2=A0 =C2=A0 /* load the reset vector */<br>
+=C2=A0 =C2=A0 riscv_setup_rom_reset_vec(machine, &amp;s-&gt;soc[0], start_=
addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virt_memmap[VIRT_MROM].base,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virt_memmap[VIRT_MROM].size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;kernel_entry,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt_load_addr, machine-&gt;fdt);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Only direct boot kernel is currently supported for K=
VM VM,<br>
+=C2=A0 =C2=A0 =C2=A0* So here setup kernel start address and fdt address.<=
br>
+=C2=A0 =C2=A0 =C2=A0* TODO:Support firmware loading and integrate to TCG s=
tart<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (kvm_enabled()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_setup_direct_kernel(s-&gt;kernel_entry, =
fdt_load_addr);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0static void virt_machine_init(MachineState *machine)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const MemMapEntry *memmap =3D virt_memmap;<br>
@@ -1165,8 +1221,6 @@ static void virt_machine_init(MachineState *machine)<=
br>
=C2=A0 =C2=A0 =C2=A0char *soc_name;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong start_addr =3D memmap[VIRT_DRAM].base;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong firmware_end_addr, kernel_start_addr;<br>
-=C2=A0 =C2=A0 uint32_t fdt_load_addr;<br>
-=C2=A0 =C2=A0 uint64_t kernel_entry;<br>
=C2=A0 =C2=A0 =C2=A0DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqch=
ip;<br>
=C2=A0 =C2=A0 =C2=A0int i, base_hartid, hart_count;<br>
<br>
@@ -1328,13 +1382,13 @@ static void virt_machine_init(MachineState *machine=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_start_addr =3D riscv_calc_kernel_s=
tart_addr(&amp;s-&gt;soc[0],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 firmware_end_addr);=
<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_entry =3D riscv_load_kernel(machine-&gt=
;kernel_filename,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ke=
rnel_start_addr, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;kernel_entry =3D riscv_load_kernel(machi=
ne-&gt;kernel_filename,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 kernel_start_addr, NULL);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (machine-&gt;initrd_filename) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr start;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr end =3D riscv_load_i=
nitrd(machine-&gt;initrd_filename,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0machine-&gt;ram_size, kernel_entry,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0machine-&gt;ram_size, s-&gt;kernel_entry,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;start);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fdt_setprop_cell(machi=
ne-&gt;fdt, &quot;/chosen&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;linux,initrd-star=
t&quot;, start);<br>
@@ -1346,7 +1400,7 @@ static void virt_machine_init(MachineState *machine)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If dynamic firmware is used, it doesn&#=
39;t know where is the next mode<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* if kernel argument is not set.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_entry =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;kernel_entry =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (drive_get(IF_PFLASH, 0, 0)) {<br>
@@ -1364,24 +1418,6 @@ static void virt_machine_init(MachineState *machine)=
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;fw_cfg =3D create_fw_cfg(machine);<br>
=C2=A0 =C2=A0 =C2=A0rom_set_fw(s-&gt;fw_cfg);<br>
<br>
-=C2=A0 =C2=A0 /* Compute the fdt load address in dram */<br>
-=C2=A0 =C2=A0 fdt_load_addr =3D riscv_load_fdt(memmap[VIRT_DRAM].base,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0machine-&gt;ram_size, m=
achine-&gt;fdt);<br>
-=C2=A0 =C2=A0 /* load the reset vector */<br>
-=C2=A0 =C2=A0 riscv_setup_rom_reset_vec(machine, &amp;s-&gt;soc[0], start_=
addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virt_memmap[VIRT_MROM].base,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virt_memmap[VIRT_MROM].size, kernel_entry,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt_load_addr, machine-&gt;fdt);<br>
-<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* Only direct boot kernel is currently supported for K=
VM VM,<br>
-=C2=A0 =C2=A0 =C2=A0* So here setup kernel start address and fdt address.<=
br>
-=C2=A0 =C2=A0 =C2=A0* TODO:Support firmware loading and integrate to TCG s=
tart<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 if (kvm_enabled()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_setup_direct_kernel(kernel_entry, fdt_lo=
ad_addr);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0/* SiFive Test MMIO device */<br>
=C2=A0 =C2=A0 =C2=A0sifive_test_create(memmap[VIRT_TEST].base);<br>
<br>
@@ -1417,6 +1453,29 @@ static void virt_machine_init(MachineState *machine)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drive_get(IF_PFLASH, 0,=
 i));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0virt_flash_map(s, system_memory);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;machine_done.notify =3D virt_machine_done;<br>
+=C2=A0 =C2=A0 qemu_add_machine_init_done_notifier(&amp;s-&gt;machine_done)=
;<br>
+}<br>
+<br>
+static void virt_machine_device_plug_cb(HotplugHandler *machine,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DeviceSt=
ate *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVVirtState *s =3D RISCV_VIRT_MACHINE(machine);<br>
+<br>
+=C2=A0 =C2=A0 if (object_dynamic_cast(OBJECT(dev), TYPE_RIVOS_IOMMU_PCI)) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PCIDevice *pdev =3D PCI_DEVICE(dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_rivos_iommu_dt_binding(s, pci_get_bdf(p=
dev));<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *mach=
ine,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DeviceState *dev)<br>
+{<br>
+=C2=A0 =C2=A0 if (object_dynamic_cast(OBJECT(dev), TYPE_RIVOS_IOMMU_PCI)) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return HOTPLUG_HANDLER(machine);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return NULL;<br>
=C2=A0}<br>
<br>
=C2=A0static void virt_machine_instance_init(Object *obj)<br>
@@ -1501,6 +1560,7 @@ static void virt_machine_class_init(ObjectClass *oc, =
void *data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0char str[128];<br>
=C2=A0 =C2=A0 =C2=A0MachineClass *mc =3D MACHINE_CLASS(oc);<br>
+=C2=A0 =C2=A0 HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(oc);<br>
<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;desc =3D &quot;RISC-V VirtIO board&quot;;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;init =3D virt_machine_init;<br>
@@ -1512,6 +1572,9 @@ static void virt_machine_class_init(ObjectClass *oc, =
void *data)<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;get_default_cpu_node_id =3D riscv_numa_get_defau=
lt_cpu_node_id;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;numa_mem_supported =3D true;<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;default_ram_id =3D &quot;riscv_virt_board.ram&qu=
ot;;<br>
+=C2=A0 =C2=A0 assert(!mc-&gt;get_hotplug_handler);<br>
+=C2=A0 =C2=A0 mc-&gt;get_hotplug_handler =3D virt_machine_get_hotplug_hand=
ler;<br>
+=C2=A0 =C2=A0 hc-&gt;plug =3D virt_machine_device_plug_cb;<br>
<br>
=C2=A0 =C2=A0 =C2=A0machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_D=
EVICE);<br>
<br>
@@ -1542,6 +1605,10 @@ static const TypeInfo virt_machine_typeinfo =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0.class_init =3D virt_machine_class_init,<br>
=C2=A0 =C2=A0 =C2=A0.instance_init =3D virt_machine_instance_init,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(RISCVVirtState),<br>
+=C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ TYPE_HOTPLUG_HANDLER },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ }<br>
+=C2=A0 =C2=A0 },<br>
=C2=A0};<br>
<br>
=C2=A0static void virt_machine_init_register_types(void)<br>
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h<br>
index 78b058ec86..daef7e88a5 100644<br>
--- a/include/hw/riscv/virt.h<br>
+++ b/include/hw/riscv/virt.h<br>
@@ -49,7 +49,9 @@ struct RISCVVirtState {<br>
=C2=A0 =C2=A0 =C2=A0DeviceState *irqchip[VIRT_SOCKETS_MAX];<br>
=C2=A0 =C2=A0 =C2=A0PFlashCFI01 *flash[2];<br>
=C2=A0 =C2=A0 =C2=A0FWCfgState *fw_cfg;<br>
+=C2=A0 =C2=A0 Notifier machine_done;<br>
<br>
+=C2=A0 =C2=A0 uint64_t kernel_entry;<br>
=C2=A0 =C2=A0 =C2=A0int fdt_size;<br>
=C2=A0 =C2=A0 =C2=A0bool have_aclint;<br>
=C2=A0 =C2=A0 =C2=A0RISCVVirtAIAType aia_type;<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div>

--00000000000003dcb605db16d4d9--

