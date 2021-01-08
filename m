Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06262EF28C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 13:29:48 +0100 (CET)
Received: from localhost ([::1]:59776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxqtn-0000qc-JH
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 07:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxqsL-0000M4-8y
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:28:17 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:42638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxqsJ-0003hX-80
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:28:16 -0500
Received: by mail-ed1-x530.google.com with SMTP id g24so10974801edw.9
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5XHQqivxDs/6s1jlanaOzU7VamMFIfBRt6GG+nPlRjM=;
 b=P2EBIAppFJZWNfq5Nkqkz8l2LW/nyF78KvYMaBe8g8lD5m7NLTp5rWdJTKFDdrGAn7
 GyccQB+HjZbiWAclJbMZPc5rgh9cMWLsIiCLbiNFZi/YxLuL7H/nfLmqo6OgR/Cw1jbo
 hiPeKjKUMx0WZQk+9QY1dIcy6XanRoR6joTnHcfjhz6iLSQ/QZZqFSpyAfALuvH5l+0a
 JTb7948JF4yienaaLRsBySoOyiV8cZipEjeqFNFfT9XE1ExwXHy4WH4A1KyCBeTsn7KX
 tSRFsydbR3TU4YU0eg1jYmmdOZmsQI+CeK63j38cvoCrQVPhgWgiwqjRpjddB01f+wXI
 xF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5XHQqivxDs/6s1jlanaOzU7VamMFIfBRt6GG+nPlRjM=;
 b=HRJ12g/daJ72aUGk2E3KXs0u/Wxb5rJkC3VkbXLWxqMzsH48DJdNdD2OPrvfQzUXwj
 9snUffI9VndZRa+9eL/gQKAiQEki4FPGoKRFMUEBuHec61F3bCnmShXhb+c7VTOG3s9c
 YfsjydpjW92RjeG9XpFQuMgnX8EsnDnCamkOIy+KQoY4y7xQAJwQ0TTtFmYJygYmTc9c
 TgkB+k/1t+8OFPenxpDW2sMdweV8zHIoUhiv9O4TIacNQXKaRAkzZyAYlwtvMLn76UcL
 AKs5Gn0/ZsDMN6wd2RNluaH/jdbawXZCT073hq9QVImClwh9o4pCzzQW1PP2NOm92TUA
 o/Hg==
X-Gm-Message-State: AOAM5334rldyNZs0usbjYaIU3F556UjEFI7jXFbbTZ7qweA9B/EjNKy8
 LjmRm+TojWINmlTOOhqj7yAUrUc5i/6SX9gqlr3/kw==
X-Google-Smtp-Source: ABdhPJzMuqIosjvbA+hTw9goC6ftOo258gt6j1xoor0IahrCi/VCvsbfyHmlREel23GeO0MlS1I55kOOezSG6QECunk=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr5016879edr.251.1610108893362; 
 Fri, 08 Jan 2021 04:28:13 -0800 (PST)
MIME-Version: 1.0
References: <1608295996-8464-1-git-send-email-mihai.carabas@oracle.com>
 <1608295996-8464-3-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1608295996-8464-3-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 12:28:02 +0000
Message-ID: <CAFEAcA9K4XEqv1XQ8HfQO9w8jsiwvz+6KMie5_NDQX+uO=8K+g@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/misc/pvpanic: add PCI interface support
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Dec 2020 at 13:36, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> Add PCI interface support for PVPANIC device. Create a new file pvpanic-pci.c
> where the PCI specific routines reside and update the build system with the new
> files and config structure.
>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> ---
>  docs/specs/pci-ids.txt    |  2 ++
>  hw/misc/Kconfig           |  6 ++++
>  hw/misc/meson.build       |  1 +
>  hw/misc/pvpanic-pci.c     | 87 +++++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/misc/pvpanic.h |  1 +
>  include/hw/pci/pci.h      |  1 +
>  6 files changed, 98 insertions(+)
>  create mode 100644 hw/misc/pvpanic-pci.c
>
> diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
> index abbdbca..191681d 100644
> --- a/docs/specs/pci-ids.txt
> +++ b/docs/specs/pci-ids.txt
> @@ -68,3 +68,5 @@ PCI devices (other than virtio):
>  All these devices are documented in docs/specs.
>
>  The 0100 device ID is used for the QXL video card device.
> +
> +The 0101 device ID is used for the PVPanic device.
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index b58e6fd..aca7ffb 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -124,6 +124,12 @@ config IOTKIT_SYSINFO
>  config PVPANIC_COMMON
>      bool
>
> +config PVPANIC_PCI
> +    bool
> +    default y if PCI_DEVICES
> +    depends on PCI
> +    select PVPANIC_COMMON
> +
>  config PVPANIC_ISA
>      bool
>      default y
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 8c828ad..f686019 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -99,6 +99,7 @@ softmmu_ss.add(when: 'CONFIG_ARMSSE_CPUID', if_true: files('armsse-cpuid.c'))
>  softmmu_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
>
>  softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
> +softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
>  softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
>  softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_scu.c', 'aspeed_sdmc.c', 'aspeed_xdma.c'))
>  softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
> diff --git a/hw/misc/pvpanic-pci.c b/hw/misc/pvpanic-pci.c
> new file mode 100644
> index 0000000..173909a
> --- /dev/null
> +++ b/hw/misc/pvpanic-pci.c
> @@ -0,0 +1,87 @@
> +/*
> + * QEMU simulated PCI pvpanic device.
> + *
> + * Copyright (C) 2020 Oracle
> + *
> + * Authors:
> + *     Mihai Carabas <mihai.carabas@oracle.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "sysemu/runstate.h"
> +
> +#include "hw/nvram/fw_cfg.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/misc/pvpanic.h"
> +#include "qom/object.h"
> +#include "hw/pci/pci.h"
> +
> +typedef struct PVPanicPCIState PVPanicPCIState;
> +DECLARE_INSTANCE_CHECKER(PVPanicPCIState, PVPANIC_PCI_DEVICE,
> +                         TYPE_PVPANIC_PCI)

The doc comment for the DECLARE_INSTANCE_CHECKER() macro
says "Direct usage of this macro should be avoided, and
the complete OBJECT_DECLARE_TYPE macro is recommended instead."

> +
> +/*
> + * PVPanicPCIState for PCI device
> + */
> +typedef struct PVPanicPCIState {
> +    PCIDevice dev;
> +    PVPanicState pvpanic;
> +} PVPanicPCIState;
> +
> +/* pvpanic pci device*/

Missing space before '*/', but the comment isn't really telling
the reader anything, so you could just delete it.

> +
> +static void pvpanic_pci_realizefn(PCIDevice *dev, Error **errp)
> +{
> +    PVPanicPCIState *s = DO_UPCAST(PVPanicPCIState, dev, dev);

Since this is a QOM device, better to use the QOM cast rather
than DO_UPCAST():

   PVPanicPCIState *s = PVPANIC_PCI_DEVICE(dev);

> +    PVPanicState *ps = &s->pvpanic;
> +
> +    pvpanic_setup_io(&s->pvpanic, DEVICE(s), 2);

Why 2 bytes?

> +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &ps->mr);
> +}

> +static void pvpanic_pci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *pc = PCI_DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, pvpanic_pci_properties);
> +
> +    pc->realize = pvpanic_pci_realizefn;
> +    pc->vendor_id = PCI_VENDOR_ID_REDHAT;
> +    pc->device_id = PCI_DEVICE_ID_REDHAT_PVPANIC;
> +    pc->revision = 1;
> +    pc->class_id = PCI_CLASS_SYSTEM_OTHER;
> +
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +}

You also need to set the dc->vmsd to a VMState for this
device. The ISA pvpanic didn't need one because the pvpanic
device itself has no variable state and an ISA device
doesn't either, but PCI devices do have guest-modifiable
state, so you need a VMState structure that uses a
VMSTATE_PCI_DEVICE() line to ensure it gets saved and
restored on migration.

> +static TypeInfo pvpanic_pci_info = {
> +    .name          = TYPE_PVPANIC_PCI,
> +    .parent        = TYPE_PCI_DEVICE,
> +    .instance_size = sizeof(PVPanicPCIState),
> +    .class_init    = pvpanic_pci_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +        { INTERFACE_PCIE_DEVICE },
> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },

I'm not very familiar with the PCI code, but are we definitely
doing enough to be able to claim to be a PCIe device ?

> +        { }
> +    }
> +};
> +
> +static void pvpanic_register_types(void)
> +{
> +    type_register_static(&pvpanic_pci_info);
> +}
> +
> +type_init(pvpanic_register_types);

thanks
-- PMM

