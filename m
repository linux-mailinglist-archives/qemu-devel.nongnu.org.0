Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F562FCF3D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 13:02:01 +0100 (CET)
Received: from localhost ([::1]:51890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2CBU-0005zc-FW
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 07:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1l2C9d-0005Yu-QG
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:00:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1l2C9a-000747-QR
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:00:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611144001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0f2BcGqwVSINtGtOqG3DaSae0WQwa7zzE2bwha8M25E=;
 b=f3wUoMXbKUCLkmdWcmDJ6SSxkB+0c3yiFBEJNpHa0kjQ1h5VI3eQtA0cdY2K2tmQ/CSBIZ
 ffWD5Re7w6iLWU58XB+CsnShSmpTXDgiRay+SKGKvxsFdG6YsKrHGSuWpZSwsRoLmfluG5
 4Qt4FXwxWWhG7duRQ3e5zIwei2dGtWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-RFcoXI6BN3OmelxbLKGTew-1; Wed, 20 Jan 2021 06:58:49 -0500
X-MC-Unique: RFcoXI6BN3OmelxbLKGTew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A200B100C664;
 Wed, 20 Jan 2021 11:58:01 +0000 (UTC)
Received: from [10.35.206.46] (unknown [10.35.206.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2279D5D96F;
 Wed, 20 Jan 2021 11:57:59 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH 2/4] hw/misc/pvpanic: add PCI interface support
From: Yan Vugenfirer <yvugenfi@redhat.com>
In-Reply-To: <1610735646-13313-3-git-send-email-mihai.carabas@oracle.com>
Date: Wed, 20 Jan 2021 13:57:57 +0200
Message-Id: <FC7156A5-361B-4009-983A-91118F29995A@redhat.com>
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
 <1610735646-13313-3-git-send-email-mihai.carabas@oracle.com>
To: Mihai Carabas <mihai.carabas@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=yvugenfi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=yvugenfi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 15 Jan 2021, at 8:34 PM, Mihai Carabas <mihai.carabas@oracle.com> wrot=
e:
>=20
> Add PCI interface support for PVPANIC device. Create a new file pvpanic-p=
ci.c
> where the PCI specific routines reside and update the build system with t=
he new
> files and config structure.
>=20
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> ---
> docs/specs/pci-ids.txt    |  1 +
> hw/misc/Kconfig           |  6 +++
> hw/misc/meson.build       |  1 +
> hw/misc/pvpanic-pci.c     | 94 ++++++++++++++++++++++++++++++++++++++++++=
+++++
> include/hw/misc/pvpanic.h |  1 +
> include/hw/pci/pci.h      |  1 +
> 6 files changed, 104 insertions(+)
> create mode 100644 hw/misc/pvpanic-pci.c
>=20
> diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
> index abbdbca..5e407a6 100644
> --- a/docs/specs/pci-ids.txt
> +++ b/docs/specs/pci-ids.txt
> @@ -64,6 +64,7 @@ PCI devices (other than virtio):
> 1b36:000d  PCI xhci usb host adapter
> 1b36:000f  mdpy (mdev sample device), linux/samples/vfio-mdev/mdpy.c
> 1b36:0010  PCIe NVMe device (-device nvme)
> +1b36:0011  PCI PVPanic device (-device pvpanic-pci)
>=20
> All these devices are documented in docs/specs.
>=20
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 23bc978..19c216f 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -124,6 +124,12 @@ config IOTKIT_SYSINFO
> config PVPANIC_COMMON
>    bool
>=20
> +config PVPANIC_PCI
> +    bool
> +    default y if PCI_DEVICES
> +    depends on PCI
> +    select PVPANIC_COMMON
> +
> config PVPANIC_ISA
>    bool
>    depends on ISA_BUS
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 8c828ad..f686019 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -99,6 +99,7 @@ softmmu_ss.add(when: 'CONFIG_ARMSSE_CPUID', if_true: fi=
les('armsse-cpuid.c'))
> softmmu_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
>=20
> softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'=
))
> +softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c=
'))
> softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
> softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_scu.c', =
'aspeed_sdmc.c', 'aspeed_xdma.c'))
> softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
> diff --git a/hw/misc/pvpanic-pci.c b/hw/misc/pvpanic-pci.c
> new file mode 100644
> index 0000000..d629639
> --- /dev/null
> +++ b/hw/misc/pvpanic-pci.c
> @@ -0,0 +1,94 @@
> +/*
> + * QEMU simulated PCI pvpanic device.
> + *
> + * Copyright (C) 2020 Oracle
> + *
> + * Authors:
> + *     Mihai Carabas <mihai.carabas@oracle.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
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
> +#include "migration/vmstate.h"
> +#include "hw/misc/pvpanic.h"
> +#include "qom/object.h"
> +#include "hw/pci/pci.h"
> +
> +OBJECT_DECLARE_SIMPLE_TYPE(PVPanicPCIState, PVPANIC_PCI_DEVICE)
> +
> +/*
> + * PVPanicPCIState for PCI device
> + */
> +typedef struct PVPanicPCIState {
> +    PCIDevice dev;
> +    PVPanicState pvpanic;
> +} PVPanicPCIState;
> +
> +static const VMStateDescription vmstate_pvpanic_pci =3D {
> +    .name =3D "pvpanic-pci",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_PCI_DEVICE(dev, PVPanicPCIState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void pvpanic_pci_realizefn(PCIDevice *dev, Error **errp)
> +{
> +    PVPanicPCIState *s =3D PVPANIC_PCI_DEVICE(dev);
> +    PVPanicState *ps =3D &s->pvpanic;
> +
> +    pvpanic_setup_io(&s->pvpanic, DEVICE(s), 2);
> +
> +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &ps->mr);
> +}
> +
> +static Property pvpanic_pci_properties[] =3D {
> +    DEFINE_PROP_UINT8("events", PVPanicPCIState, pvpanic.events, PVPANIC=
_PANICKED | PVPANIC_CRASHLOADED),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void pvpanic_pci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    PCIDeviceClass *pc =3D PCI_DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, pvpanic_pci_properties);
> +
> +    pc->realize =3D pvpanic_pci_realizefn;
> +    pc->vendor_id =3D PCI_VENDOR_ID_REDHAT;
> +    pc->device_id =3D PCI_DEVICE_ID_REDHAT_PVPANIC;

Please fill out subsystem and subsystem vendor IDs as well:
pc->subsystem_vendor_id
pc->subsystem_id=20

It is needed in order to pass MS WHQL tests. Requirement name =E2=80=9CDevi=
ce.Connectivity.PciConnected.SubsystemIdsRequired=E2=80=9D in "Windows Hard=
ware Compatibility Specifications =E2=80=93 Components and Peripherals=E2=
=80=9D document.
https://docs.microsoft.com/en-us/windows-hardware/design/compatibility/whcp=
-specifications-policies

Thanks,
Yan.

> +    pc->revision =3D 1;
> +    pc->class_id =3D PCI_CLASS_SYSTEM_OTHER;
> +    dc->vmsd =3D &vmstate_pvpanic_pci;
> +
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +}
> +
> +static TypeInfo pvpanic_pci_info =3D {
> +    .name          =3D TYPE_PVPANIC_PCI_DEVICE,
> +    .parent        =3D TYPE_PCI_DEVICE,
> +    .instance_size =3D sizeof(PVPanicPCIState),
> +    .class_init    =3D pvpanic_pci_class_init,
> +    .interfaces =3D (InterfaceInfo[]) {
> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
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
> diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
> index abc9dde..ca3c5bb 100644
> --- a/include/hw/misc/pvpanic.h
> +++ b/include/hw/misc/pvpanic.h
> @@ -18,6 +18,7 @@
> #include "qom/object.h"
>=20
> #define TYPE_PVPANIC_ISA_DEVICE "pvpanic"
> +#define TYPE_PVPANIC_PCI_DEVICE "pvpanic-pci"
>=20
> #define PVPANIC_IOPORT_PROP "ioport"
>=20
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 259f9c9..66db084 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -107,6 +107,7 @@ extern bool pci_available;
> #define PCI_DEVICE_ID_REDHAT_PCIE_BRIDGE 0x000e
> #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
> #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
> +#define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
> #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
>=20
> #define FMT_PCIBUS                      PRIx64
> --=20
> 1.8.3.1
>=20
>=20


