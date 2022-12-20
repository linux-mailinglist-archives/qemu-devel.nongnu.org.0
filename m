Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6A7652370
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:06:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7eBS-0001WC-EZ; Tue, 20 Dec 2022 10:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eBI-0001P2-Hv
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:05:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eB9-0006Iw-C6
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671548714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8QDh49IRyYfrHi90+Kj1D3jlYaLMwB7NbVjKGlJ0jZM=;
 b=iVwVGvAJe/fYnJ8iXysZP2tWLpIAZwZIMp/RfBLvrGT+KQ+kO/+L3Hcg1X74MkNc302vjW
 5LdNNHiUvKARu8h2GUz6DMkJTcOP53rEw/sfoT+4O2tNDG0UzrmE5wy1QUXx5skBNpJHjI
 /K4GEcWBi9K+kejfgPXc5U8SwXnEbk8=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-383-NFW8G8owPdSOgzDJqYdTMQ-1; Tue, 20 Dec 2022 10:05:12 -0500
X-MC-Unique: NFW8G8owPdSOgzDJqYdTMQ-1
Received: by mail-yb1-f200.google.com with SMTP id
 a5-20020a25af05000000b006e450a5e507so14609275ybh.22
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:05:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8QDh49IRyYfrHi90+Kj1D3jlYaLMwB7NbVjKGlJ0jZM=;
 b=rpvCCcuun+w84wCe0+SGFrq9c4AQRjmMuhALqSg7vSSnSTw3TB7RpyhhyejpZhRdie
 plsGARzVTGOuUyEo0vhZfBaJscUCUm4dvOD7zaDFcpc9lEvzgx4tSURvuj4t6jOywwms
 xx4o9E4I1w6jagV/8tCOkRvTKAOkoO/s1G87I8w0Qb7+OwRugu81vUmyblha2u86ah0Y
 O7WYJB8Vq8s+aPTk+QT20tIDVHsdFS3bEoGhNxdG4ZzAXGYYqvdkbny9JZ0q6Uzt4HeL
 GGKO95Y6JJ/OvYN2AhNL2W8THV3tKjmOqrNHupCOEc+sNK1aL/JqmRTYw7s8C/Fc8jq8
 P2uA==
X-Gm-Message-State: AFqh2ko2SN/BAisdW5GnvMQiegNrZKRFqtlIiBoMjQMDxzIREW81zLF5
 KiS6vlj2NeNa8WKeZtkJEeZvnPbRfj7AB35jSEqcIBdtjJxwOrRFxB7cY6sr+dskPgOrD02GtSo
 Hc/MRpdXykSODwBg=
X-Received: by 2002:a05:7500:411e:b0:ee:992:fcc9 with SMTP id
 bs30-20020a057500411e00b000ee0992fcc9mr1862707gab.15.1671548711568; 
 Tue, 20 Dec 2022 07:05:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsim29FYDR1lwDVkOY9SI/nZ8XSMWhmWzIFroKvx8bL4TdxCRh0qGhEuzJOX1aiOEdyrdc4mA==
X-Received: by 2002:a05:7500:411e:b0:ee:992:fcc9 with SMTP id
 bs30-20020a057500411e00b000ee0992fcc9mr1862660gab.15.1671548711020; 
 Tue, 20 Dec 2022 07:05:11 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 x20-20020a05620a449400b006eef13ef4c8sm9246699qkp.94.2022.12.20.07.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 07:05:09 -0800 (PST)
Date: Tue, 20 Dec 2022 10:04:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, laurent@vivier.eu,
 edgar.iglesias@gmail.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn,
 gaosong@loongson.cn, richard.henderson@linaro.org, deller@gmx.de,
 jasowang@redhat.com, vikram.garhwal@amd.com,
 francisco.iglesias@amd.com, clg@kaod.org, kraxel@redhat.com,
 marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 crwulff@gmail.com, marex@denx.de
Subject: Re: [PATCH 2/2] include: Include headers where needed
Message-ID: <20221220100432-mutt-send-email-mst@kernel.org>
References: <20221210133915.4104305-1-armbru@redhat.com>
 <20221210133915.4104305-3-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221210133915.4104305-3-armbru@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, Dec 10, 2022 at 02:39:15PM +0100, Markus Armbruster wrote:
> A number of headers neglect to include everything they need.  They
> compile only if the headers they need are already included from
> elsewhere.  Fix that.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  include/exec/plugin-gen.h                   | 1 +
>  include/hw/acpi/erst.h                      | 3 +++
>  include/hw/char/cmsdk-apb-uart.h            | 1 +
>  include/hw/char/goldfish_tty.h              | 1 +
>  include/hw/char/xilinx_uartlite.h           | 1 +
>  include/hw/cris/etraxfs.h                   | 1 +
>  include/hw/display/macfb.h                  | 3 ++-
>  include/hw/dma/sifive_pdma.h                | 2 ++
>  include/hw/i386/ioapic_internal.h           | 1 +
>  include/hw/i386/sgx-epc.h                   | 1 +
>  include/hw/intc/goldfish_pic.h              | 2 ++
>  include/hw/intc/loongarch_pch_msi.h         | 2 ++
>  include/hw/intc/loongarch_pch_pic.h         | 2 ++
>  include/hw/intc/nios2_vic.h                 | 2 ++
>  include/hw/misc/mchp_pfsoc_dmc.h            | 2 ++
>  include/hw/misc/mchp_pfsoc_ioscb.h          | 2 ++
>  include/hw/misc/mchp_pfsoc_sysreg.h         | 2 ++
>  include/hw/misc/pvpanic.h                   | 1 +
>  include/hw/misc/sifive_e_prci.h             | 3 ++-
>  include/hw/misc/sifive_u_otp.h              | 3 ++-
>  include/hw/misc/sifive_u_prci.h             | 3 ++-
>  include/hw/misc/virt_ctrl.h                 | 2 ++
>  include/hw/misc/xlnx-versal-pmc-iou-slcr.h  | 1 +
>  include/hw/net/lasi_82596.h                 | 2 +-
>  include/hw/net/xlnx-zynqmp-can.h            | 1 +
>  include/hw/ppc/pnv_psi.h                    | 2 +-
>  include/hw/riscv/boot_opensbi.h             | 2 ++
>  include/hw/riscv/microchip_pfsoc.h          | 3 +++
>  include/hw/riscv/numa.h                     | 1 +
>  include/hw/riscv/sifive_u.h                 | 2 ++
>  include/hw/riscv/spike.h                    | 2 +-
>  include/hw/riscv/virt.h                     | 2 +-
>  include/hw/ssi/sifive_spi.h                 | 3 +++
>  include/hw/timer/sse-timer.h                | 1 +
>  include/hw/usb/hcd-dwc3.h                   | 1 +
>  include/hw/usb/hcd-musb.h                   | 2 ++
>  include/hw/usb/xlnx-usb-subsystem.h         | 2 ++
>  include/hw/usb/xlnx-versal-usb2-ctrl-regs.h | 3 +++
>  include/hw/virtio/virtio-mmio.h             | 2 +-
>  include/qemu/plugin-memory.h                | 3 +++
>  include/sysemu/dirtyrate.h                  | 2 ++
>  include/sysemu/dump.h                       | 1 +
>  include/user/syscall-trace.h                | 1 +
>  43 files changed, 71 insertions(+), 9 deletions(-)
> 
> diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
> index 5004728c61..5f5506f1cc 100644
> --- a/include/exec/plugin-gen.h
> +++ b/include/exec/plugin-gen.h
> @@ -12,6 +12,7 @@
>  #ifndef QEMU_PLUGIN_GEN_H
>  #define QEMU_PLUGIN_GEN_H
>  
> +#include "exec/cpu_ldst.h"
>  #include "qemu/plugin.h"
>  #include "tcg/tcg.h"
>  
> diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
> index b747fe7739..b2ff663ddc 100644
> --- a/include/hw/acpi/erst.h
> +++ b/include/hw/acpi/erst.h
> @@ -11,6 +11,9 @@
>  #ifndef HW_ACPI_ERST_H
>  #define HW_ACPI_ERST_H
>  
> +#include "hw/acpi/bios-linker-loader.h"
> +#include "qom/object.h"
> +
>  void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>                  const char *oem_id, const char *oem_table_id);
>  
> diff --git a/include/hw/char/cmsdk-apb-uart.h b/include/hw/char/cmsdk-apb-uart.h
> index 9daff0eeee..64b0a3d534 100644
> --- a/include/hw/char/cmsdk-apb-uart.h
> +++ b/include/hw/char/cmsdk-apb-uart.h
> @@ -15,6 +15,7 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
>  #include "chardev/char-fe.h"
> +#include "qapi/error.h"
>  #include "qom/object.h"
>  
>  #define TYPE_CMSDK_APB_UART "cmsdk-apb-uart"
> diff --git a/include/hw/char/goldfish_tty.h b/include/hw/char/goldfish_tty.h
> index 7503d2fa1e..d59733e5ae 100644
> --- a/include/hw/char/goldfish_tty.h
> +++ b/include/hw/char/goldfish_tty.h
> @@ -12,6 +12,7 @@
>  
>  #include "qemu/fifo8.h"
>  #include "chardev/char-fe.h"
> +#include "hw/sysbus.h"
>  
>  #define TYPE_GOLDFISH_TTY "goldfish_tty"
>  OBJECT_DECLARE_SIMPLE_TYPE(GoldfishTTYState, GOLDFISH_TTY)
> diff --git a/include/hw/char/xilinx_uartlite.h b/include/hw/char/xilinx_uartlite.h
> index bb32d0fcb3..dd09c06801 100644
> --- a/include/hw/char/xilinx_uartlite.h
> +++ b/include/hw/char/xilinx_uartlite.h
> @@ -17,6 +17,7 @@
>  
>  #include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
> +#include "qapi/error.h"
>  
>  static inline DeviceState *xilinx_uartlite_create(hwaddr addr,
>                                          qemu_irq irq,
> diff --git a/include/hw/cris/etraxfs.h b/include/hw/cris/etraxfs.h
> index 8b01ed67d3..467b529dc0 100644
> --- a/include/hw/cris/etraxfs.h
> +++ b/include/hw/cris/etraxfs.h
> @@ -29,6 +29,7 @@
>  #include "hw/cris/etraxfs_dma.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
> +#include "qapi/error.h"
>  
>  DeviceState *etraxfs_eth_init(NICInfo *nd, hwaddr base, int phyaddr,
>                                struct etraxfs_dma_client *dma_out,
> diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
> index 55a50d3fb0..27cebefc9e 100644
> --- a/include/hw/display/macfb.h
> +++ b/include/hw/display/macfb.h
> @@ -15,9 +15,10 @@
>  
>  #include "exec/memory.h"
>  #include "hw/irq.h"
> +#include "hw/nubus/nubus.h"
> +#include "hw/sysbus.h"
>  #include "ui/console.h"
>  #include "qemu/timer.h"
> -#include "qom/object.h"
>  
>  typedef enum  {
>      MACFB_DISPLAY_APPLE_21_COLOR = 0,
> diff --git a/include/hw/dma/sifive_pdma.h b/include/hw/dma/sifive_pdma.h
> index e319bbd6c4..8c6cfa7f32 100644
> --- a/include/hw/dma/sifive_pdma.h
> +++ b/include/hw/dma/sifive_pdma.h
> @@ -23,6 +23,8 @@
>  #ifndef SIFIVE_PDMA_H
>  #define SIFIVE_PDMA_H
>  
> +#include "hw/sysbus.h"
> +
>  struct sifive_pdma_chan {
>      uint32_t control;
>      uint32_t next_config;
> diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
> index 9880443cc7..e8ff338d7f 100644
> --- a/include/hw/i386/ioapic_internal.h
> +++ b/include/hw/i386/ioapic_internal.h
> @@ -23,6 +23,7 @@
>  #define QEMU_IOAPIC_INTERNAL_H
>  
>  #include "exec/memory.h"
> +#include "hw/i386/ioapic.h"
>  #include "hw/sysbus.h"
>  #include "qemu/notify.h"
>  #include "qom/object.h"
> diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
> index 581fac389a..3e00efd870 100644
> --- a/include/hw/i386/sgx-epc.h
> +++ b/include/hw/i386/sgx-epc.h
> @@ -12,6 +12,7 @@
>  #ifndef QEMU_SGX_EPC_H
>  #define QEMU_SGX_EPC_H
>  
> +#include "hw/qdev-core.h"
>  #include "hw/i386/hostmem-epc.h"
>  
>  #define TYPE_SGX_EPC "sgx-epc"
> diff --git a/include/hw/intc/goldfish_pic.h b/include/hw/intc/goldfish_pic.h
> index e9d552f796..3e79580367 100644
> --- a/include/hw/intc/goldfish_pic.h
> +++ b/include/hw/intc/goldfish_pic.h
> @@ -10,6 +10,8 @@
>  #ifndef HW_INTC_GOLDFISH_PIC_H
>  #define HW_INTC_GOLDFISH_PIC_H
>  
> +#include "hw/sysbus.h"
> +
>  #define TYPE_GOLDFISH_PIC "goldfish_pic"
>  OBJECT_DECLARE_SIMPLE_TYPE(GoldfishPICState, GOLDFISH_PIC)
>  
> diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
> index 6d67560dea..2810665ef7 100644
> --- a/include/hw/intc/loongarch_pch_msi.h
> +++ b/include/hw/intc/loongarch_pch_msi.h
> @@ -5,6 +5,8 @@
>   * Copyright (C) 2021 Loongson Technology Corporation Limited
>   */
>  
> +#include "hw/sysbus.h"
> +
>  #define TYPE_LOONGARCH_PCH_MSI "loongarch_pch_msi"
>  OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHMSI, LOONGARCH_PCH_MSI)
>  
> diff --git a/include/hw/intc/loongarch_pch_pic.h b/include/hw/intc/loongarch_pch_pic.h
> index 2d4aa9ed6f..5d5dee9280 100644
> --- a/include/hw/intc/loongarch_pch_pic.h
> +++ b/include/hw/intc/loongarch_pch_pic.h
> @@ -5,6 +5,8 @@
>   * Copyright (c) 2021 Loongson Technology Corporation Limited
>   */
>  
> +#include "hw/sysbus.h"
> +
>  #define TYPE_LOONGARCH_PCH_PIC "loongarch_pch_pic"
>  #define PCH_PIC_NAME(name) TYPE_LOONGARCH_PCH_PIC#name
>  OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHPIC, LOONGARCH_PCH_PIC)
> diff --git a/include/hw/intc/nios2_vic.h b/include/hw/intc/nios2_vic.h
> index ac507b9d74..5c975a2ac4 100644
> --- a/include/hw/intc/nios2_vic.h
> +++ b/include/hw/intc/nios2_vic.h
> @@ -35,6 +35,8 @@
>  #ifndef HW_INTC_NIOS2_VIC_H
>  #define HW_INTC_NIOS2_VIC_H
>  
> +#include "hw/sysbus.h"
> +
>  #define TYPE_NIOS2_VIC "nios2-vic"
>  OBJECT_DECLARE_SIMPLE_TYPE(Nios2VIC, NIOS2_VIC)
>  
> diff --git a/include/hw/misc/mchp_pfsoc_dmc.h b/include/hw/misc/mchp_pfsoc_dmc.h
> index 2baa1413b0..3bc1581e0f 100644
> --- a/include/hw/misc/mchp_pfsoc_dmc.h
> +++ b/include/hw/misc/mchp_pfsoc_dmc.h
> @@ -23,6 +23,8 @@
>  #ifndef MCHP_PFSOC_DMC_H
>  #define MCHP_PFSOC_DMC_H
>  
> +#include "hw/sysbus.h"
> +
>  /* DDR SGMII PHY module */
>  
>  #define MCHP_PFSOC_DDR_SGMII_PHY_REG_SIZE   0x1000
> diff --git a/include/hw/misc/mchp_pfsoc_ioscb.h b/include/hw/misc/mchp_pfsoc_ioscb.h
> index 9235523e33..bab83a96a6 100644
> --- a/include/hw/misc/mchp_pfsoc_ioscb.h
> +++ b/include/hw/misc/mchp_pfsoc_ioscb.h
> @@ -23,6 +23,8 @@
>  #ifndef MCHP_PFSOC_IOSCB_H
>  #define MCHP_PFSOC_IOSCB_H
>  
> +#include "hw/sysbus.h"
> +
>  typedef struct MchpPfSoCIoscbState {
>      SysBusDevice parent;
>      MemoryRegion container;
> diff --git a/include/hw/misc/mchp_pfsoc_sysreg.h b/include/hw/misc/mchp_pfsoc_sysreg.h
> index 546ba68f6a..a2fd1c9f07 100644
> --- a/include/hw/misc/mchp_pfsoc_sysreg.h
> +++ b/include/hw/misc/mchp_pfsoc_sysreg.h
> @@ -23,6 +23,8 @@
>  #ifndef MCHP_PFSOC_SYSREG_H
>  #define MCHP_PFSOC_SYSREG_H
>  
> +#include "hw/sysbus.h"
> +
>  #define MCHP_PFSOC_SYSREG_REG_SIZE  0x2000
>  
>  typedef struct MchpPfSoCSysregState {
> diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
> index e520566ab0..fab94165d0 100644
> --- a/include/hw/misc/pvpanic.h
> +++ b/include/hw/misc/pvpanic.h
> @@ -15,6 +15,7 @@
>  #ifndef HW_MISC_PVPANIC_H
>  #define HW_MISC_PVPANIC_H
>  
> +#include "exec/memory.h"
>  #include "qom/object.h"
>  
>  #define TYPE_PVPANIC_ISA_DEVICE "pvpanic"
> diff --git a/include/hw/misc/sifive_e_prci.h b/include/hw/misc/sifive_e_prci.h
> index 262ca16181..6aa949e910 100644
> --- a/include/hw/misc/sifive_e_prci.h
> +++ b/include/hw/misc/sifive_e_prci.h
> @@ -18,7 +18,8 @@
>  
>  #ifndef HW_SIFIVE_E_PRCI_H
>  #define HW_SIFIVE_E_PRCI_H
> -#include "qom/object.h"
> +
> +#include "hw/sysbus.h"
>  
>  enum {
>      SIFIVE_E_PRCI_HFROSCCFG = 0x0,
> diff --git a/include/hw/misc/sifive_u_otp.h b/include/hw/misc/sifive_u_otp.h
> index 5d0d7df455..170d2148f2 100644
> --- a/include/hw/misc/sifive_u_otp.h
> +++ b/include/hw/misc/sifive_u_otp.h
> @@ -18,7 +18,8 @@
>  
>  #ifndef HW_SIFIVE_U_OTP_H
>  #define HW_SIFIVE_U_OTP_H
> -#include "qom/object.h"
> +
> +#include "hw/sysbus.h"
>  
>  #define SIFIVE_U_OTP_PA         0x00
>  #define SIFIVE_U_OTP_PAIO       0x04
> diff --git a/include/hw/misc/sifive_u_prci.h b/include/hw/misc/sifive_u_prci.h
> index d9ebf40b7f..4d2491ad46 100644
> --- a/include/hw/misc/sifive_u_prci.h
> +++ b/include/hw/misc/sifive_u_prci.h
> @@ -18,7 +18,8 @@
>  
>  #ifndef HW_SIFIVE_U_PRCI_H
>  #define HW_SIFIVE_U_PRCI_H
> -#include "qom/object.h"
> +
> +#include "hw/sysbus.h"
>  
>  #define SIFIVE_U_PRCI_HFXOSCCFG     0x00
>  #define SIFIVE_U_PRCI_COREPLLCFG0   0x04
> diff --git a/include/hw/misc/virt_ctrl.h b/include/hw/misc/virt_ctrl.h
> index 25a237e518..81346cf017 100644
> --- a/include/hw/misc/virt_ctrl.h
> +++ b/include/hw/misc/virt_ctrl.h
> @@ -7,6 +7,8 @@
>  #ifndef VIRT_CTRL_H
>  #define VIRT_CTRL_H
>  
> +#include "hw/sysbus.h"
> +
>  #define TYPE_VIRT_CTRL "virt-ctrl"
>  OBJECT_DECLARE_SIMPLE_TYPE(VirtCtrlState, VIRT_CTRL)
>  
> diff --git a/include/hw/misc/xlnx-versal-pmc-iou-slcr.h b/include/hw/misc/xlnx-versal-pmc-iou-slcr.h
> index 2170420f01..f7d24c93c4 100644
> --- a/include/hw/misc/xlnx-versal-pmc-iou-slcr.h
> +++ b/include/hw/misc/xlnx-versal-pmc-iou-slcr.h
> @@ -54,6 +54,7 @@
>  #ifndef XLNX_VERSAL_PMC_IOU_SLCR_H
>  #define XLNX_VERSAL_PMC_IOU_SLCR_H
>  
> +#include "hw/sysbus.h"
>  #include "hw/register.h"
>  
>  #define TYPE_XILINX_VERSAL_PMC_IOU_SLCR "xlnx.versal-pmc-iou-slcr"
> diff --git a/include/hw/net/lasi_82596.h b/include/hw/net/lasi_82596.h
> index 7b62b04833..3ef2f47ba2 100644
> --- a/include/hw/net/lasi_82596.h
> +++ b/include/hw/net/lasi_82596.h
> @@ -10,7 +10,7 @@
>  
>  #include "net/net.h"
>  #include "hw/net/i82596.h"
> -#include "qom/object.h"
> +#include "hw/sysbus.h"
>  
>  #define TYPE_LASI_82596 "lasi_82596"
>  typedef struct SysBusI82596State SysBusI82596State;
> diff --git a/include/hw/net/xlnx-zynqmp-can.h b/include/hw/net/xlnx-zynqmp-can.h
> index eb1558708b..fd2aa77760 100644
> --- a/include/hw/net/xlnx-zynqmp-can.h
> +++ b/include/hw/net/xlnx-zynqmp-can.h
> @@ -30,6 +30,7 @@
>  #ifndef XLNX_ZYNQMP_CAN_H
>  #define XLNX_ZYNQMP_CAN_H
>  
> +#include "hw/sysbus.h"
>  #include "hw/register.h"
>  #include "net/can_emu.h"
>  #include "net/can_host.h"
> diff --git a/include/hw/ppc/pnv_psi.h b/include/hw/ppc/pnv_psi.h
> index 8253469b8f..2a6f715350 100644
> --- a/include/hw/ppc/pnv_psi.h
> +++ b/include/hw/ppc/pnv_psi.h
> @@ -23,7 +23,7 @@
>  #include "hw/sysbus.h"
>  #include "hw/ppc/xics.h"
>  #include "hw/ppc/xive.h"
> -#include "qom/object.h"
> +#include "hw/qdev-core.h"
>  
>  #define TYPE_PNV_PSI "pnv-psi"
>  OBJECT_DECLARE_TYPE(PnvPsi, PnvPsiClass,
> diff --git a/include/hw/riscv/boot_opensbi.h b/include/hw/riscv/boot_opensbi.h
> index c19cad4818..1b749663dc 100644
> --- a/include/hw/riscv/boot_opensbi.h
> +++ b/include/hw/riscv/boot_opensbi.h
> @@ -8,6 +8,8 @@
>  #ifndef RISCV_BOOT_OPENSBI_H
>  #define RISCV_BOOT_OPENSBI_H
>  
> +#include "exec/cpu-defs.h"
> +
>  /** Expected value of info magic ('OSBI' ascii string in hex) */
>  #define FW_DYNAMIC_INFO_MAGIC_VALUE     0x4942534f
>  
> diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
> index a757b240e0..9e806b09b1 100644
> --- a/include/hw/riscv/microchip_pfsoc.h
> +++ b/include/hw/riscv/microchip_pfsoc.h
> @@ -22,13 +22,16 @@
>  #ifndef HW_MICROCHIP_PFSOC_H
>  #define HW_MICROCHIP_PFSOC_H
>  
> +#include "hw/boards.h"
>  #include "hw/char/mchp_pfsoc_mmuart.h"
> +#include "hw/cpu/cluster.h"
>  #include "hw/dma/sifive_pdma.h"
>  #include "hw/misc/mchp_pfsoc_dmc.h"
>  #include "hw/misc/mchp_pfsoc_ioscb.h"
>  #include "hw/misc/mchp_pfsoc_sysreg.h"
>  #include "hw/net/cadence_gem.h"
>  #include "hw/sd/cadence_sdhci.h"
> +#include "hw/riscv/riscv_hart.h"
>  
>  typedef struct MicrochipPFSoCState {
>      /*< private >*/
> diff --git a/include/hw/riscv/numa.h b/include/hw/riscv/numa.h
> index fcce942cee..1a9cce3344 100644
> --- a/include/hw/riscv/numa.h
> +++ b/include/hw/riscv/numa.h
> @@ -19,6 +19,7 @@
>  #ifndef RISCV_NUMA_H
>  #define RISCV_NUMA_H
>  
> +#include "hw/boards.h"
>  #include "hw/sysbus.h"
>  #include "sysemu/numa.h"
>  
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 8f63a183c4..a43304292c 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -19,6 +19,8 @@
>  #ifndef HW_SIFIVE_U_H
>  #define HW_SIFIVE_U_H
>  
> +#include "hw/boards.h"
> +#include "hw/cpu/cluster.h"
>  #include "hw/dma/sifive_pdma.h"
>  #include "hw/net/cadence_gem.h"
>  #include "hw/riscv/riscv_hart.h"
> diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
> index 73d69234de..73bf2a9aad 100644
> --- a/include/hw/riscv/spike.h
> +++ b/include/hw/riscv/spike.h
> @@ -19,9 +19,9 @@
>  #ifndef HW_RISCV_SPIKE_H
>  #define HW_RISCV_SPIKE_H
>  
> +#include "hw/boards.h"
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/sysbus.h"
> -#include "qom/object.h"
>  
>  #define SPIKE_CPUS_MAX 8
>  #define SPIKE_SOCKETS_MAX 8
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index be4ab8fe7f..3007bb3646 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -19,10 +19,10 @@
>  #ifndef HW_RISCV_VIRT_H
>  #define HW_RISCV_VIRT_H
>  
> +#include "hw/boards.h"
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/sysbus.h"
>  #include "hw/block/flash.h"
> -#include "qom/object.h"
>  
>  #define VIRT_CPUS_MAX_BITS             9
>  #define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
> diff --git a/include/hw/ssi/sifive_spi.h b/include/hw/ssi/sifive_spi.h
> index 47d0d6a47c..d0c40cdb11 100644
> --- a/include/hw/ssi/sifive_spi.h
> +++ b/include/hw/ssi/sifive_spi.h
> @@ -22,6 +22,9 @@
>  #ifndef HW_SIFIVE_SPI_H
>  #define HW_SIFIVE_SPI_H
>  
> +#include "qemu/fifo8.h"
> +#include "hw/sysbus.h"
> +
>  #define SIFIVE_SPI_REG_NUM  (0x78 / 4)
>  
>  #define TYPE_SIFIVE_SPI "sifive.spi"
> diff --git a/include/hw/timer/sse-timer.h b/include/hw/timer/sse-timer.h
> index b4ee8e7f6c..265ad32400 100644
> --- a/include/hw/timer/sse-timer.h
> +++ b/include/hw/timer/sse-timer.h
> @@ -25,6 +25,7 @@
>  #define SSE_TIMER_H
>  
>  #include "hw/sysbus.h"
> +#include "qemu/timer.h"
>  #include "qom/object.h"
>  #include "hw/timer/sse-counter.h"
>  
> diff --git a/include/hw/usb/hcd-dwc3.h b/include/hw/usb/hcd-dwc3.h
> index 7c804d536d..f752a27e94 100644
> --- a/include/hw/usb/hcd-dwc3.h
> +++ b/include/hw/usb/hcd-dwc3.h
> @@ -26,6 +26,7 @@
>  #ifndef HCD_DWC3_H
>  #define HCD_DWC3_H
>  
> +#include "hw/register.h"
>  #include "hw/usb/hcd-xhci.h"
>  #include "hw/usb/hcd-xhci-sysbus.h"
>  
> diff --git a/include/hw/usb/hcd-musb.h b/include/hw/usb/hcd-musb.h
> index f30a26f7f4..4d4b1ec0fc 100644
> --- a/include/hw/usb/hcd-musb.h
> +++ b/include/hw/usb/hcd-musb.h
> @@ -13,6 +13,8 @@
>  #ifndef HW_USB_HCD_MUSB_H
>  #define HW_USB_HCD_MUSB_H
>  
> +#include "exec/hwaddr.h"
> +
>  enum musb_irq_source_e {
>      musb_irq_suspend = 0,
>      musb_irq_resume,
> diff --git a/include/hw/usb/xlnx-usb-subsystem.h b/include/hw/usb/xlnx-usb-subsystem.h
> index 5b730abd84..40f9e97e09 100644
> --- a/include/hw/usb/xlnx-usb-subsystem.h
> +++ b/include/hw/usb/xlnx-usb-subsystem.h
> @@ -25,6 +25,8 @@
>  #ifndef XLNX_USB_SUBSYSTEM_H
>  #define XLNX_USB_SUBSYSTEM_H
>  
> +#include "hw/register.h"
> +#include "hw/sysbus.h"
>  #include "hw/usb/xlnx-versal-usb2-ctrl-regs.h"
>  #include "hw/usb/hcd-dwc3.h"
>  
> diff --git a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
> index 633bf3013a..6a502006b0 100644
> --- a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
> +++ b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
> @@ -26,6 +26,9 @@
>  #ifndef XLNX_VERSAL_USB2_CTRL_REGS_H
>  #define XLNX_VERSAL_USB2_CTRL_REGS_H
>  
> +#include "hw/register.h"
> +#include "hw/sysbus.h"
> +
>  #define TYPE_XILINX_VERSAL_USB2_CTRL_REGS "xlnx.versal-usb2-ctrl-regs"
>  
>  #define XILINX_VERSAL_USB2_CTRL_REGS(obj) \
> diff --git a/include/hw/virtio/virtio-mmio.h b/include/hw/virtio/virtio-mmio.h
> index 090f7730e7..aa49262022 100644
> --- a/include/hw/virtio/virtio-mmio.h
> +++ b/include/hw/virtio/virtio-mmio.h
> @@ -22,8 +22,8 @@
>  #ifndef HW_VIRTIO_MMIO_H
>  #define HW_VIRTIO_MMIO_H
>  
> +#include "hw/sysbus.h"
>  #include "hw/virtio/virtio-bus.h"
> -#include "qom/object.h"
>  
>  /* QOM macros */
>  /* virtio-mmio-bus */
> diff --git a/include/qemu/plugin-memory.h b/include/qemu/plugin-memory.h
> index 8ad13c110c..6fd539022a 100644
> --- a/include/qemu/plugin-memory.h
> +++ b/include/qemu/plugin-memory.h
> @@ -9,6 +9,9 @@
>  #ifndef PLUGIN_MEMORY_H
>  #define PLUGIN_MEMORY_H
>  
> +#include "exec/cpu-defs.h"
> +#include "exec/hwaddr.h"
> +
>  struct qemu_plugin_hwaddr {
>      bool is_io;
>      bool is_store;
> diff --git a/include/sysemu/dirtyrate.h b/include/sysemu/dirtyrate.h
> index 4d3b9a4902..20813f303f 100644
> --- a/include/sysemu/dirtyrate.h
> +++ b/include/sysemu/dirtyrate.h
> @@ -13,6 +13,8 @@
>  #ifndef QEMU_DIRTYRATE_H
>  #define QEMU_DIRTYRATE_H
>  
> +#include "qapi/qapi-types-migration.h"
> +
>  typedef struct VcpuStat {
>      int nvcpu; /* number of vcpu */
>      DirtyRateVcpu *rates; /* array of dirty rate for each vcpu */
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 4ffed0b659..7008d43d04 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -15,6 +15,7 @@
>  #define DUMP_H
>  
>  #include "qapi/qapi-types-dump.h"
> +#include "qemu/thread.h"
>  
>  #define MAKEDUMPFILE_SIGNATURE      "makedumpfile"
>  #define MAX_SIZE_MDF_HEADER         (4096) /* max size of makedumpfile_header */
> diff --git a/include/user/syscall-trace.h b/include/user/syscall-trace.h
> index b4e53d3870..c5a220da34 100644
> --- a/include/user/syscall-trace.h
> +++ b/include/user/syscall-trace.h
> @@ -10,6 +10,7 @@
>  #ifndef SYSCALL_TRACE_H
>  #define SYSCALL_TRACE_H
>  
> +#include "exec/user/abitypes.h"
>  #include "trace/trace-root.h"
>  
>  /*
> -- 
> 2.37.3
> 
> 
> 


