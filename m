Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B70433CED
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:03:14 +0200 (CEST)
Received: from localhost ([::1]:42750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsW9-0003Nl-Le
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcrqC-0007K1-8i
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:19:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcrq8-00012e-Ny
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634660387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jPYBaUZgWdRPQq0u55lFW1Y8QYrTKsRmufrNch/ufF4=;
 b=iP5GhohlXKIqrUEYE5zqs/+Pxsj7AcXPPgIrWT4++1UMsVuuA7tBgxEp5huU6W4JOx9r+A
 yvmQsO6ISw50R0xTew38vpgNpqc2P2p6VeflVyT9H1kCY6OcNkTs4xnv4fRcIhbVY3dQJy
 Gft3GOL+EYbkxHMuJlLUSyraSPNUiOo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-XK1_gMEqMHafHSxXLDPabw-1; Tue, 19 Oct 2021 12:19:45 -0400
X-MC-Unique: XK1_gMEqMHafHSxXLDPabw-1
Received: by mail-wm1-f72.google.com with SMTP id
 128-20020a1c0486000000b0030dcd45476aso2737301wme.0
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jPYBaUZgWdRPQq0u55lFW1Y8QYrTKsRmufrNch/ufF4=;
 b=wwoBuxyhCCpXvxCd8hNvZtu6yaCqaP+KgkgvTU9zAZmJ9m3lBts3q6kpsFr+QuIsNv
 LJb8h/9DmfABI1F+MYeorSXkDep9IN2xHEMOY+hfXWi7cfyR5CgzPEuIO4/O3FwCOUhm
 IUiAVESolFaHLYDGjD1H0mhGPEEp0tG7fnoSb5gsalqu33jpFAwBOaSaHzIhUZR8RC6a
 yZ39xGjKLqt4zBSdHisTgRauYXKZcwGCGN7x/1QEIkuB4aqHDTEbDEwUusMA0E15uOIk
 mgBS/rIry+9KstTtOu6dcU69s1yFJhPDvLpE0BDMfTbiNRI4J5f4JhDiusNcrEMlmKvb
 Yuxw==
X-Gm-Message-State: AOAM5337JpR0OZUeE489ED9tJk+LxJaRD91rEaNT5A9QrFIwFp3SHPuN
 m+gcbmVrxq1d/0uMskR2+H1okyMLl7KPKyQQrVFojcLXbHP+QQ59IB9P06Gfw6uihtyHHDcnbeg
 kjbGDlRGpNTXnf74=
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr7356098wmr.48.1634660383502;
 Tue, 19 Oct 2021 09:19:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9KFnYiG1TYRXh50dGk06iw6pbEWPvfIdPKj4K/RCD5NY+dZEvYNeLUxQE3ggvta7dMsWoOA==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr7356048wmr.48.1634660383204;
 Tue, 19 Oct 2021 09:19:43 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id b190sm2481248wmd.25.2021.10.19.09.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:19:42 -0700 (PDT)
Date: Tue, 19 Oct 2021 12:19:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: Re: [PATCH 23/31] hw/loongarch: Add default bios startup support.
Message-ID: <20211019121700-mutt-send-email-mst@kernel.org>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-24-git-send-email-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
In-Reply-To: <1634628917-10031-24-git-send-email-yangxiaojuan@loongson.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: gaosong@loongson.cn, peter.maydell@linaro.org, thuth@redhat.com,
 chenhuacai@loongson.cn, philmd@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, laurent@vivier.eu,
 alistair.francis@wdc.com, maobibo@loongson.cn, david@gibson.dropbear.id.au,
 pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk, bmeng.cn@gmail.com,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 03:35:09PM +0800, Xiaojuan Yang wrote:
> This patch add default bios startup.
> The bios source code will be opened int the near future.

That pretty much rules out including this patchset for now ...
Does not mean people won't review, but please tag the subject RFC
until it's all open source and can be merged.
And I would really appreciate not getting CC'd until it is.

Thanks!

> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  hw/loongarch/Kconfig             |   4 +++
>  hw/loongarch/fw_cfg.c            |  34 ++++++++++++++++++
>  hw/loongarch/fw_cfg.h            |  16 +++++++++
>  hw/loongarch/ls3a5000_virt.c     |  60 ++++++++++++++++++++++++-------
>  hw/loongarch/meson.build         |   1 +
>  include/hw/loongarch/loongarch.h |   5 +++
>  pc-bios/loongarch_bios.bin       | Bin 0 -> 4128768 bytes
>  7 files changed, 108 insertions(+), 12 deletions(-)
>  create mode 100644 hw/loongarch/fw_cfg.c
>  create mode 100644 hw/loongarch/fw_cfg.h
>  create mode 100644 pc-bios/loongarch_bios.bin
> 
> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> index fe100b01eb..b59cd98a7a 100644
> --- a/hw/loongarch/Kconfig
> +++ b/hw/loongarch/Kconfig
> @@ -13,3 +13,7 @@ config LOONGSON_3A5000
>      select LOONGARCH_PCH_MSI
>      select LOONGARCH_EXTIOI
>      select LS7A_RTC
> +    select FW_CFG_LOONGARCH
> +
> +config FW_CFG_LOONGARCH
> +    bool
> diff --git a/hw/loongarch/fw_cfg.c b/hw/loongarch/fw_cfg.c
> new file mode 100644
> index 0000000000..42229c5c91
> --- /dev/null
> +++ b/hw/loongarch/fw_cfg.c
> @@ -0,0 +1,34 @@
> +/*
> + * QEMU fw_cfg helpers (LOONGARCH specific)
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/loongarch/fw_cfg.h"
> +#include "hw/loongarch/loongarch.h"
> +#include "hw/nvram/fw_cfg.h"
> +#include "sysemu/sysemu.h"
> +
> +static void fw_cfg_boot_set(void *opaque, const char *boot_device,
> +                            Error **errp)
> +{
> +    fw_cfg_modify_i16(opaque, FW_CFG_BOOT_DEVICE, boot_device[0]);
> +}
> +
> +FWCfgState *loongarch_fw_cfg_init(ram_addr_t ram_size, MachineState *ms)
> +{
> +    FWCfgState *fw_cfg;
> +    int max_cpus = ms->smp.max_cpus;
> +    int smp_cpus = ms->smp.cpus;
> +
> +    fw_cfg = fw_cfg_init_mem_wide(FW_CFG_ADDR, FW_CFG_ADDR + 8, 8, 0, NULL);
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)max_cpus);
> +    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
> +
> +    qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
> +    return fw_cfg;
> +}
> diff --git a/hw/loongarch/fw_cfg.h b/hw/loongarch/fw_cfg.h
> new file mode 100644
> index 0000000000..d51dfb241a
> --- /dev/null
> +++ b/hw/loongarch/fw_cfg.h
> @@ -0,0 +1,16 @@
> +/*
> + * QEMU fw_cfg helpers (Loongarch specific)
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + *
> + * SPDX-License-Identifier: MIT
> + */
> +
> +#ifndef HW_LOONGARCH_FW_CFG_H
> +#define HW_LOONGARCH_FW_CFG_H
> +
> +#include "hw/boards.h"
> +#include "hw/nvram/fw_cfg.h"
> +
> +FWCfgState *loongarch_fw_cfg_init(ram_addr_t ram_size, MachineState *ms);
> +#endif
> diff --git a/hw/loongarch/ls3a5000_virt.c b/hw/loongarch/ls3a5000_virt.c
> index 79e6605cd8..e8057f7772 100644
> --- a/hw/loongarch/ls3a5000_virt.c
> +++ b/hw/loongarch/ls3a5000_virt.c
> @@ -14,6 +14,8 @@
>  #include "hw/char/serial.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/qtest.h"
> +#include "hw/loader.h"
> +#include "elf.h"
>  #include "hw/irq.h"
>  #include "net/net.h"
>  #include "sysemu/runstate.h"
> @@ -24,6 +26,9 @@
>  #include "hw/intc/loongarch_pch_msi.h"
>  #include "hw/pci-host/ls7a.h"
>  #include "hw/misc/unimp.h"
> +#include "hw/loongarch/fw_cfg.h"
> +
> +#define LOONGSON3_BIOSNAME "loongarch_bios.bin"
>  
>  CPULoongArchState *cpu_states[LOONGARCH_MAX_VCPUS];
>  
> @@ -181,8 +186,9 @@ static void ls3a5000_virt_init(MachineState *machine)
>      const char *cpu_model = machine->cpu_type;
>      LoongArchCPU *cpu;
>      CPULoongArchState *env;
> -    uint64_t lowram_size = 0, highram_size = 0;
> +    uint64_t highram_size = 0;
>      MemoryRegion *lowmem = g_new(MemoryRegion, 1);
> +    MemoryRegion *highmem = g_new(MemoryRegion, 1);
>      char *ramName = NULL;
>      ram_addr_t ram_size = machine->ram_size;
>      MemoryRegion *address_space_mem = get_system_memory();
> @@ -190,6 +196,10 @@ static void ls3a5000_virt_init(MachineState *machine)
>      int i;
>      MemoryRegion *iomem = NULL;
>      PCIBus *pci_bus = NULL;
> +    int bios_size;
> +    char *filename;
> +    MemoryRegion *bios = g_new(MemoryRegion, 1);
> +    ram_addr_t offset = 0;
>  
>      if (!cpu_model) {
>          cpu_model = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
> @@ -227,21 +237,46 @@ static void ls3a5000_virt_init(MachineState *machine)
>          qemu_register_reset(main_cpu_reset, cpu);
>      }
>  
> +    if (ram_size < 1 * GiB) {
> +        error_report("ram_size must be greater than 1G due to the bios memory layout");
> +        exit(1);
> +    }
> +
>      ramName = g_strdup_printf("loongarch.lowram");
> -    lowram_size = MIN(ram_size, 256 * 0x100000);
>      memory_region_init_alias(lowmem, NULL, ramName, machine->ram,
> -                             0, lowram_size);
> -    memory_region_add_subregion(address_space_mem, 0, lowmem);
> -
> -    highram_size = ram_size > lowram_size ? ram_size - 256 * 0x100000 : 0;
> -    if (highram_size > 0) {
> -        MemoryRegion *highmem = g_new(MemoryRegion, 1);
> -        ramName = g_strdup_printf("loongarch.highram");
> -        memory_region_init_alias(highmem, NULL, ramName, machine->ram,
> -                                 lowram_size, highram_size);
> -        memory_region_add_subregion(address_space_mem, 0x90000000, highmem);
> +                             0, 256 * MiB);
> +    memory_region_add_subregion(address_space_mem, offset, lowmem);
> +    offset += 256 * MiB;
> +
> +    highram_size = ram_size - 256 * MiB;
> +    ramName = g_strdup_printf("loongarch.highram");
> +    memory_region_init_alias(highmem, NULL, ramName, machine->ram,
> +                             offset, highram_size);
> +    memory_region_add_subregion(address_space_mem, 0x90000000, highmem);
> +    offset += highram_size;
> +
> +    /* load the BIOS image. */
> +    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
> +                              machine->firmware ?: LOONGSON3_BIOSNAME);
> +    if (filename) {
> +        bios_size = load_image_targphys(filename, LA_BIOS_BASE, LA_BIOS_SIZE);
> +        lsms->fw_cfg = loongarch_fw_cfg_init(ram_size, machine);
> +        rom_set_fw(lsms->fw_cfg);
> +        g_free(filename);
> +    } else {
> +        bios_size = -1;
>      }
>  
> +    if ((bios_size < 0 || bios_size > LA_BIOS_SIZE) && !qtest_enabled()) {
> +        error_report("Could not load LOONGARCH bios '%s'", machine->firmware);
> +        exit(1);
> +    }
> +
> +    memory_region_init_ram(bios, NULL, "loongarch.bios",
> +                           LA_BIOS_SIZE, &error_fatal);
> +    memory_region_set_readonly(bios, true);
> +    memory_region_add_subregion(get_system_memory(), LA_BIOS_BASE, bios);
> +
>      /*Add PM mmio memory for reboot and shutdown*/
>      iomem = g_new(MemoryRegion, 1);
>      memory_region_init_io(iomem, NULL, &loongarch_pm_ops, NULL,
> @@ -293,6 +328,7 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
>      mc->default_ram_id = "loongarch.ram";
>      mc->max_cpus = LOONGARCH_MAX_VCPUS;
>      mc->is_default = 1;
> +    mc->default_machine_opts = "firmware=loongarch_bios.bin";
>      mc->default_kernel_irqchip_split = false;
>      mc->block_default_type = IF_VIRTIO;
>      mc->default_boot_order = "c";
> diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
> index 1bd209c9eb..3fabfa72dc 100644
> --- a/hw/loongarch/meson.build
> +++ b/hw/loongarch/meson.build
> @@ -1,5 +1,6 @@
>  loongarch_ss = ss.source_set()
>  loongarch_ss.add(files('loongarch_int.c'))
>  loongarch_ss.add(when: 'CONFIG_LOONGSON_3A5000', if_true: files('ls3a5000_virt.c', 'ipi.c'))
> +loongarch_ss.add(when: 'CONFIG_FW_CFG_LOONGARCH', if_true: files('fw_cfg.c'))
>  
>  hw_arch += {'loongarch': loongarch_ss}
> diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
> index 210173471d..1316707f49 100644
> --- a/include/hw/loongarch/loongarch.h
> +++ b/include/hw/loongarch/loongarch.h
> @@ -35,6 +35,10 @@
>  #define CPUNAME_REG             0x1fe00020
>  #define MISC_FUNC_REG           0x1fe00420
>  #define FREQ_REG                0x1fe001d0
> +#define FW_CFG_ADDR             0x1e020000
> +
> +#define LA_BIOS_BASE            0x1c000000
> +#define LA_BIOS_SIZE            (4 * 1024 * 1024)
>  
>  typedef struct LoongarchMachineState {
>      /*< private >*/
> @@ -42,6 +46,7 @@ typedef struct LoongarchMachineState {
>  
>      gipiState   *gipi;
>      qemu_irq    *pch_irq;
> +    FWCfgState  *fw_cfg;
>  } LoongarchMachineState;
>  
>  #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson7a")

> new file mode 100644
> index 0000000000000000000000000000000000000000..ac6a691b00ac4fec9a5f4c32aad3865ac24efbb2
> GIT binary patch
> literal 4128768
> zcmeFaeSB5bmH)qTZUU$YBpL)1^`ZgKNkOsI7FumjAQU@;6`PrcY8-A%fLMccI<`Eh
> z^#F-&r#C#PE#MOuB~;r4@mXsfP6C3Rl7QoPs`iPig0{bg2ggo>59EA5YoFYk+-ssv
> 


snipped a ton of binary

> literal 0
> HcmV?d00001
> 
> -- 
> 2.27.0


