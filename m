Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAFA1CAEA2
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 15:13:58 +0200 (CEST)
Received: from localhost ([::1]:42554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX2pB-0006xc-Tj
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 09:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miaoyubo@huawei.com>)
 id 1jX2o3-000643-KV
 for qemu-devel@nongnu.org; Fri, 08 May 2020 09:12:47 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:36928 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miaoyubo@huawei.com>)
 id 1jX2o1-00015T-FK
 for qemu-devel@nongnu.org; Fri, 08 May 2020 09:12:47 -0400
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 6F76D7BDB36C489EA122;
 Fri,  8 May 2020 21:12:37 +0800 (CST)
Received: from dggeme706-chm.china.huawei.com (10.1.199.102) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 8 May 2020 21:12:37 +0800
Received: from dggeme756-chm.china.huawei.com (10.3.19.102) by
 dggeme706-chm.china.huawei.com (10.1.199.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Fri, 8 May 2020 21:12:36 +0800
Received: from dggeme756-chm.china.huawei.com ([10.6.80.68]) by
 dggeme756-chm.china.huawei.com ([10.6.80.68]) with mapi id 15.01.1913.007;
 Fri, 8 May 2020 21:12:36 +0800
From: miaoyubo <miaoyubo@huawei.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH v6 4/8] acpi: Refactor the source of host bridge and build
 tables for pxb
Thread-Topic: [PATCH v6 4/8] acpi: Refactor the source of host bridge and
 build tables for pxb
Thread-Index: AQHWDaWUgk8XPHd7pEW80FwYFoj5+6iXl1yAgAa8SUA=
Date: Fri, 8 May 2020 13:12:36 +0000
Message-ID: <21a5fb02602242d0ade3cf3621a44b59@huawei.com>
References: <20200408125816.955-1-miaoyubo@huawei.com>
 <20200408125816.955-5-miaoyubo@huawei.com>
 <20200504095329-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200504095329-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.173.221.29]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=miaoyubo@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 09:12:38
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Xiexiangyou <xiexiangyou@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks so much for such a careful review!!

> -----Original Message-----
> From: Michael S. Tsirkin [mailto:mst@redhat.com]
> Sent: Monday, May 4, 2020 10:01 PM
> To: miaoyubo <miaoyubo@huawei.com>
> Cc: peter.maydell@linaro.org; shannon.zhaosl@gmail.com;
> lersek@redhat.com; imammedo@redhat.com; qemu-devel@nongnu.org;
> berrange@redhat.com; Xiexiangyou <xiexiangyou@huawei.com>
> Subject: Re: [PATCH v6 4/8] acpi: Refactor the source of host bridge and =
build
> tables for pxb
>=20
> On Wed, Apr 08, 2020 at 08:58:12PM +0800, Yubo Miao wrote:
> > From: miaoyubo <miaoyubo@huawei.com>
> >
> > The resources of pxbs and obtained by crs_build and the resources used
> > by pxbs would be moved form the resources defined for host-bridge.
> >
> > The resources for pxb are composed of the bar space of the
> > pci-bridge/pcie-root-port behined it and the config space of devices
> > behind it.
> >
> > Signed-off-by: miaoyubo <miaoyubo@huawei.com>
>=20
> A bunch of spelling/syntax mistakes in the log, pls spellcheck.
>=20
> Pls use the format
>  Yubo Miao <miaoyubo@huawei.com>
>=20
>=20
>=20

Thanks for pointing out the mistakes!

> > ---
> >  hw/arm/virt-acpi-build.c | 131
> > +++++++++++++++++++++++++++++++++------
> >  1 file changed, 111 insertions(+), 20 deletions(-)
> >
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c index
> > e8ba09855c..7bcd04dfb7 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -49,6 +49,9 @@
> >  #include "kvm_arm.h"
> >  #include "migration/vmstate.h"
> >
> > +#include "hw/arm/virt.h"
> > +#include "hw/pci/pci_bus.h"
> > +#include "hw/pci/pci_bridge.h"
> >  #define ARM_SPI_BASE 32
> >
> >  static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus) @@ -266,19
> > +269,81 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, Aml *scope)  }
> >
> >  static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry
> *memmap,
> > -                              uint32_t irq, bool use_highmem, bool hig=
hmem_ecam)
> > +                              uint32_t irq, bool use_highmem, bool hig=
hmem_ecam,
> > +                              VirtMachineState *vms)
> >  {
> >      int ecam_id =3D VIRT_ECAM_ID(highmem_ecam);
> > -    Aml *method, *crs;
> > +    int i;
> > +    Aml *method, *crs, *dev;
> >      hwaddr base_mmio =3D memmap[VIRT_PCIE_MMIO].base;
> >      hwaddr size_mmio =3D memmap[VIRT_PCIE_MMIO].size;
> >      hwaddr base_pio =3D memmap[VIRT_PCIE_PIO].base;
> >      hwaddr size_pio =3D memmap[VIRT_PCIE_PIO].size;
> >      hwaddr base_ecam =3D memmap[ecam_id].base;
> >      hwaddr size_ecam =3D memmap[ecam_id].size;
> > +    CrsRangeEntry *entry;
> > +    CrsRangeSet crs_range_set;
> > +
> > +    crs_range_set_init(&crs_range_set);
> >      int nr_pcie_buses =3D size_ecam / PCIE_MMCFG_SIZE_MIN;
> > +    PCIHostState *s =3D OBJECT_CHECK(PCIHostState,
> > +                                   object_resolve_path_type("",
> > +                                   "pcie-host-bridge", NULL),
> > +                                   TYPE_PCI_HOST_BRIDGE);
>=20
> Not TYPE_PCIE_HOST_BRIDGE? And what if it's ambiguous?
>=20
>=20

Yes, TYPE_PCI_HOST_BRIDGE is ambiguous, I would fix it. =20

> > +
> > +    PCIBus *bus =3D s->bus;
> > +    /* start to construct the tables for pxb*/
>=20
>=20
> coding style violation. weird that ehckpatch didn't notice it.
>=20

Thanks for such a careful review!

> > +    if (bus) {
> > +        QLIST_FOREACH(bus, &bus->child, sibling) {
> > +            uint8_t bus_num =3D pci_bus_num(bus);
> > +            uint8_t numa_node =3D pci_bus_numa_node(bus);
> > +
> > +            if (!pci_bus_is_root(bus)) {
> > +                continue;
> > +            }
> > +            /*
> > +             * Coded up the MIN of the busNr defined for pxb-pcie,
> > +             * the MIN - 1 would be the MAX bus number for the main
> > +             * host bridge.
>=20
>=20
> Couldn't figure out this comment. Pls rephrase in some way so it's
> understandable.
>=20

How about=20
/* 0 - (nr_pcie_buses - 1) is the bus range for the main
  * host-bridge and it equals the MIN of the
  * busNr defined for pxb-pcie*/

> > +             */
> > +            if (bus_num < nr_pcie_buses) {
> > +                nr_pcie_buses =3D bus_num;
> > +            }
> > +
> > +            }
> > +
> > +            acpi_dsdt_add_pci_route_table(dev, scope, irq);
> > +
> > +            /*
> > +             * Resources deined for PXBs are composed by the folling p=
arts:
> > +             * 1. The resources the pci-brige/pcie-root-port need.
> > +             * 2. The resources the devices behind pxb need.
> > +             */
>=20
>=20
> syntax/grammar errors here too.
>=20

Sorry for the syntax error!

> > +            crs =3D build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent),
> &crs_range_set);
> > +            aml_append(dev, aml_name_decl("_CRS", crs));
> > +
> > +            acpi_dsdt_add_pci_osc(dev, scope);
> > +
> > +            aml_append(scope, dev);
> > +
> > +        }
> > +    }
> >
> > -    Aml *dev =3D aml_device("%s", "PCI0");
> > +    /* start to construct the tables for main host bridge */
>=20
> tables for the main.
>=20
>
=20
Yes, tables for the main is better.

>=20
> > +    dev =3D aml_device("%s", "PCI0");
>=20
>=20
> Make dev above local in scope, then this can stay unchanged.
>=20

Sure.

> >      aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
> >      aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
> >      aml_append(dev, aml_name_decl("_SEG", aml_int(0))); @@ -299,25
> > +364,51 @@ static void acpi_dsdt_add_pci(Aml *scope, const
> MemMapEntry *memmap,
> >          aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED,
> AML_POS_DECODE,
> >                              0x0000, 0x0000, nr_pcie_buses - 1, 0x0000,
> >                              nr_pcie_buses));
> > -    aml_append(rbuf,
> > -        aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED,
> AML_MAX_FIXED,
> >      unsigned dsdt, xsdt;
> >      GArray *tables_blob =3D tables->table_data;
> >      MachineState *ms =3D MACHINE(vms);
> > -
> >      table_offsets =3D g_array_new(false, true /* clear */,
> >                                          sizeof(uint32_t));
> >
>=20
> this empty line didn't hurt
>=20

I would keep it.

> > @@ -952,7 +1044,6 @@ void virt_acpi_setup(VirtMachineState *vms)
> >      build_state->rsdp_mr =3D acpi_add_rom_blob(virt_acpi_build_update,
> >                                               build_state, tables.rsdp,
> >                                               ACPI_BUILD_RSDP_FILE,
> > 0);
> > -
> >      qemu_register_reset(virt_acpi_build_reset, build_state);
> >      virt_acpi_build_reset(build_state);
> >      vmstate_register(NULL, 0, &vmstate_virt_acpi_build, build_state);
>=20
>=20
> this line didn't hurt either.
>=20

I would keep it

> > --
> > 2.19.1
> >

Regards,
Miao

