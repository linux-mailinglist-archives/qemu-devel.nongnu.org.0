Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653CF19BE2A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 10:53:46 +0200 (CEST)
Received: from localhost ([::1]:35494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJvbd-0007Sr-GE
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 04:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46217)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yi.l.liu@intel.com>) id 1jJvao-00073n-Dj
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 04:52:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yi.l.liu@intel.com>) id 1jJval-0001RK-CP
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 04:52:53 -0400
Received: from mga09.intel.com ([134.134.136.24]:15732)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yi.l.liu@intel.com>) id 1jJval-0001MX-1R
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 04:52:51 -0400
IronPort-SDR: LuBO87/7oqOBZKHI4lBJ5hHYT0UzIjAgCAHi8mxJurmQafBLY7EDPoSiRQbW48U2H3/Tug3cV/
 mYffXC3rKAYA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 01:52:46 -0700
IronPort-SDR: 8EJljdY07VLZBap2wMNzqJqdfLLEwonCRWdERy/w+euvtrUmQLEdQXHaLqafFGFPf9+H3YhqJw
 zYTtxcnrHaqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,335,1580803200"; d="scan'208";a="240768732"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga007.fm.intel.com with ESMTP; 02 Apr 2020 01:52:46 -0700
Received: from fmsmsx161.amr.corp.intel.com (10.18.125.9) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 2 Apr 2020 01:52:46 -0700
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 FMSMSX161.amr.corp.intel.com (10.18.125.9) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 2 Apr 2020 01:52:46 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.213]) with mapi id 14.03.0439.000;
 Thu, 2 Apr 2020 16:52:42 +0800
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "peterx@redhat.com" <peterx@redhat.com>
Subject: RE: [PATCH v2 05/22] hw/pci: modify pci_setup_iommu() to set
 PCIIOMMUOps
Thread-Topic: [PATCH v2 05/22] hw/pci: modify pci_setup_iommu() to set
 PCIIOMMUOps
Thread-Index: AQHWBkplYx1wDloSfEiqLsnvUo9sNqhgcquAgAUOJcA=
Date: Thu, 2 Apr 2020 08:52:41 +0000
Message-ID: <A2975661238FB949B60364EF0F2C25743A21EDF9@SHSMSX104.ccr.corp.intel.com>
References: <1585542301-84087-1-git-send-email-yi.l.liu@intel.com>
 <1585542301-84087-6-git-send-email-yi.l.liu@intel.com>
 <d7185758-701e-03f0-b804-f71587d65e65@redhat.com>
In-Reply-To: <d7185758-701e-03f0-b804-f71587d65e65@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 134.134.136.24
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
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Yi Sun <yi.y.sun@linux.intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mst@redhat.com" <mst@redhat.com>, "Tian, Jun J" <jun.j.tian@intel.com>, "Sun,
 Yi Y" <yi.y.sun@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>, "Wu,
 Hao" <hao.wu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Auger Eric < eric.auger@redhat.com>
> Sent: Monday, March 30, 2020 7:02 PM
> To: Liu, Yi L <yi.l.liu@intel.com>; qemu-devel@nongnu.org;
> Subject: Re: [PATCH v2 05/22] hw/pci: modify pci_setup_iommu() to set
> PCIIOMMUOps
>=20
>=20
>=20
> On 3/30/20 6:24 AM, Liu Yi L wrote:
> > This patch modifies pci_setup_iommu() to set PCIIOMMUOps instead of
> > setting PCIIOMMUFunc. PCIIOMMUFunc is used to get an address space for
> > a PCI device in vendor specific way. The PCIIOMMUOps still offers this
> > functionality. But using PCIIOMMUOps leaves space to add more iommu
> > related vendor specific operations.
> >
> > Cc: Kevin Tian <kevin.tian@intel.com>
> > Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Cc: Peter Xu <peterx@redhat.com>
> > Cc: Eric Auger <eric.auger@redhat.com>
> > Cc: Yi Sun <yi.y.sun@linux.intel.com>
> > Cc: David Gibson <david@gibson.dropbear.id.au>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> > ---
> >  hw/alpha/typhoon.c       |  6 +++++-
> >  hw/arm/smmu-common.c     |  6 +++++-
> >  hw/hppa/dino.c           |  6 +++++-
> >  hw/i386/amd_iommu.c      |  6 +++++-
> >  hw/i386/intel_iommu.c    |  6 +++++-
> >  hw/pci-host/designware.c |  6 +++++-
> >  hw/pci-host/pnv_phb3.c   |  6 +++++-
> >  hw/pci-host/pnv_phb4.c   |  6 +++++-
> >  hw/pci-host/ppce500.c    |  6 +++++-
> >  hw/pci-host/prep.c       |  6 +++++-
> >  hw/pci-host/sabre.c      |  6 +++++-
> >  hw/pci/pci.c             | 12 +++++++-----
> >  hw/ppc/ppc440_pcix.c     |  6 +++++-
> >  hw/ppc/spapr_pci.c       |  6 +++++-
> >  hw/s390x/s390-pci-bus.c  |  8 ++++++--  hw/virtio/virtio-iommu.c |  6
> > +++++-
> >  include/hw/pci/pci.h     |  8 ++++++--
> >  include/hw/pci/pci_bus.h |  2 +-
> >  18 files changed, 90 insertions(+), 24 deletions(-)
> >
> > diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c index
> > 1795e2f..f271de1 100644
> > --- a/hw/alpha/typhoon.c
> > +++ b/hw/alpha/typhoon.c
> > @@ -740,6 +740,10 @@ static AddressSpace *typhoon_pci_dma_iommu(PCIBus
> *bus, void *opaque, int devfn)
> >      return &s->pchip.iommu_as;
> >  }
> >
> > +static const PCIIOMMUOps typhoon_iommu_ops =3D {
> > +    .get_address_space =3D typhoon_pci_dma_iommu, };
> > +
> >  static void typhoon_set_irq(void *opaque, int irq, int level)  {
> >      TyphoonState *s =3D opaque;
> > @@ -897,7 +901,7 @@ PCIBus *typhoon_init(MemoryRegion *ram, ISABus
> **isa_bus, qemu_irq *p_rtc_irq,
> >                               "iommu-typhoon", UINT64_MAX);
> >      address_space_init(&s->pchip.iommu_as, MEMORY_REGION(&s-
> >pchip.iommu),
> >                         "pchip0-pci");
> > -    pci_setup_iommu(b, typhoon_pci_dma_iommu, s);
> > +    pci_setup_iommu(b, &typhoon_iommu_ops, s);
> >
> >      /* Pchip0 PCI special/interrupt acknowledge, 0x801.F800.0000, 64MB=
.  */
> >      memory_region_init_io(&s->pchip.reg_iack, OBJECT(s),
> > &alpha_pci_iack_ops, diff --git a/hw/arm/smmu-common.c
> > b/hw/arm/smmu-common.c index e13a5f4..447146e 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -343,6 +343,10 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus,
> void *opaque, int devfn)
> >      return &sdev->as;
> >  }
> >
> > +static const PCIIOMMUOps smmu_ops =3D {
> > +    .get_address_space =3D smmu_find_add_as, };
> > +
> >  IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)  {
> >      uint8_t bus_n, devfn;
> > @@ -437,7 +441,7 @@ static void smmu_base_realize(DeviceState *dev, Err=
or
> **errp)
> >      s->smmu_pcibus_by_busptr =3D g_hash_table_new(NULL, NULL);
> >
> >      if (s->primary_bus) {
> > -        pci_setup_iommu(s->primary_bus, smmu_find_add_as, s);
> > +        pci_setup_iommu(s->primary_bus, &smmu_ops, s);
> >      } else {
> >          error_setg(errp, "SMMU is not attached to any PCI bus!");
> >      }
> > diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c index 2b1b38c..3da4f84
> > 100644
> > --- a/hw/hppa/dino.c
> > +++ b/hw/hppa/dino.c
> > @@ -459,6 +459,10 @@ static AddressSpace *dino_pcihost_set_iommu(PCIBus
> *bus, void *opaque,
> >      return &s->bm_as;
> >  }
> >
> > +static const PCIIOMMUOps dino_iommu_ops =3D {
> > +    .get_address_space =3D dino_pcihost_set_iommu, };
> > +
> >  /*
> >   * Dino interrupts are connected as shown on Page 78, Table 23
> >   * (Little-endian bit numbers)
> > @@ -580,7 +584,7 @@ PCIBus *dino_init(MemoryRegion *addr_space,
> >      memory_region_add_subregion(&s->bm, 0xfff00000,
> >                                  &s->bm_cpu_alias);
> >      address_space_init(&s->bm_as, &s->bm, "pci-bm");
> > -    pci_setup_iommu(b, dino_pcihost_set_iommu, s);
> > +    pci_setup_iommu(b, &dino_iommu_ops, s);
> >
> >      *p_rtc_irq =3D qemu_allocate_irq(dino_set_timer_irq, s, 0);
> >      *p_ser_irq =3D qemu_allocate_irq(dino_set_serial_irq, s, 0); diff
> > --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c index
> > b1175e5..5fec30e 100644
> > --- a/hw/i386/amd_iommu.c
> > +++ b/hw/i386/amd_iommu.c
> > @@ -1451,6 +1451,10 @@ static AddressSpace
> *amdvi_host_dma_iommu(PCIBus *bus, void *opaque, int devfn)
> >      return &iommu_as[devfn]->as;
> >  }
> >
> > +static const PCIIOMMUOps amdvi_iommu_ops =3D {
> > +    .get_address_space =3D amdvi_host_dma_iommu, };
> > +
> >  static const MemoryRegionOps mmio_mem_ops =3D {
> >      .read =3D amdvi_mmio_read,
> >      .write =3D amdvi_mmio_write,
> > @@ -1577,7 +1581,7 @@ static void amdvi_realize(DeviceState *dev,
> > Error **errp)
> >
> >      sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mmio);
> >      sysbus_mmio_map(SYS_BUS_DEVICE(s), 0, AMDVI_BASE_ADDR);
> > -    pci_setup_iommu(bus, amdvi_host_dma_iommu, s);
> > +    pci_setup_iommu(bus, &amdvi_iommu_ops, s);
> >      s->devid =3D object_property_get_int(OBJECT(&s->pci), "addr", errp=
);
> >      msi_init(&s->pci.dev, 0, 1, true, false, errp);
> >      amdvi_init(s);
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c index
> > df7ad25..4b22910 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -3729,6 +3729,10 @@ static AddressSpace *vtd_host_dma_iommu(PCIBus
> *bus, void *opaque, int devfn)
> >      return &vtd_as->as;
> >  }
> >
> > +static PCIIOMMUOps vtd_iommu_ops =3D {
> static const

got it.

> > +    .get_address_space =3D vtd_host_dma_iommu, };
> > +
> >  static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)  {
> >      X86IOMMUState *x86_iommu =3D X86_IOMMU_DEVICE(s); @@ -3840,7
> > +3844,7 @@ static void vtd_realize(DeviceState *dev, Error **errp)
> >                                                g_free, g_free);
> >      vtd_init(s);
> >      sysbus_mmio_map(SYS_BUS_DEVICE(s), 0,
> Q35_HOST_BRIDGE_IOMMU_ADDR);
> > -    pci_setup_iommu(bus, vtd_host_dma_iommu, dev);
> > +    pci_setup_iommu(bus, &vtd_iommu_ops, dev);
> >      /* Pseudo address space under root PCI bus. */
> >      x86ms->ioapic_as =3D vtd_host_dma_iommu(bus, s,
> Q35_PSEUDO_DEVFN_IOAPIC);
> >      qemu_add_machine_init_done_notifier(&vtd_machine_done_notify);
> > diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c index
> > dd24551..4c6338a 100644
> > --- a/hw/pci-host/designware.c
> > +++ b/hw/pci-host/designware.c
> > @@ -645,6 +645,10 @@ static AddressSpace
> *designware_pcie_host_set_iommu(PCIBus *bus, void *opaque,
> >      return &s->pci.address_space;
> >  }
> >
> > +static const PCIIOMMUOps designware_iommu_ops =3D {
> > +    .get_address_space =3D designware_pcie_host_set_iommu, };
> > +
> >  static void designware_pcie_host_realize(DeviceState *dev, Error
> > **errp)  {
> >      PCIHostState *pci =3D PCI_HOST_BRIDGE(dev); @@ -686,7 +690,7 @@
> > static void designware_pcie_host_realize(DeviceState *dev, Error **errp=
)
> >      address_space_init(&s->pci.address_space,
> >                         &s->pci.address_space_root,
> >                         "pcie-bus-address-space");
> > -    pci_setup_iommu(pci->bus, designware_pcie_host_set_iommu, s);
> > +    pci_setup_iommu(pci->bus, &designware_iommu_ops, s);
> >
> >      qdev_set_parent_bus(DEVICE(&s->root), BUS(pci->bus));
> >      qdev_init_nofail(DEVICE(&s->root));
> > diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c index
> > 74618fa..ecfe627 100644
> > --- a/hw/pci-host/pnv_phb3.c
> > +++ b/hw/pci-host/pnv_phb3.c
> > @@ -961,6 +961,10 @@ static AddressSpace *pnv_phb3_dma_iommu(PCIBus
> *bus, void *opaque, int devfn)
> >      return &ds->dma_as;
> >  }
> >
> > +static PCIIOMMUOps pnv_phb3_iommu_ops =3D {
> static const
got it. :-)

> > +    .get_address_space =3D pnv_phb3_dma_iommu, };
> > +
> >  static void pnv_phb3_instance_init(Object *obj)  {
> >      PnvPHB3 *phb =3D PNV_PHB3(obj);
> > @@ -1059,7 +1063,7 @@ static void pnv_phb3_realize(DeviceState *dev, Er=
ror
> **errp)
> >                                       &phb->pci_mmio, &phb->pci_io,
> >                                       0, 4, TYPE_PNV_PHB3_ROOT_BUS);
> >
> > -    pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
> > +    pci_setup_iommu(pci->bus, &pnv_phb3_iommu_ops, phb);
> >
> >      /* Add a single Root port */
> >      qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
> > diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c index
> > 23cf093..04e95e3 100644
> > --- a/hw/pci-host/pnv_phb4.c
> > +++ b/hw/pci-host/pnv_phb4.c
> > @@ -1148,6 +1148,10 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus
> *bus, void *opaque, int devfn)
> >      return &ds->dma_as;
> >  }
> >
> > +static PCIIOMMUOps pnv_phb4_iommu_ops =3D {
> idem
will add const.

> > +    .get_address_space =3D pnv_phb4_dma_iommu, };
> > +
> >  static void pnv_phb4_instance_init(Object *obj)  {
> >      PnvPHB4 *phb =3D PNV_PHB4(obj);
> > @@ -1205,7 +1209,7 @@ static void pnv_phb4_realize(DeviceState *dev, Er=
ror
> **errp)
> >                                       pnv_phb4_set_irq, pnv_phb4_map_ir=
q, phb,
> >                                       &phb->pci_mmio, &phb->pci_io,
> >                                       0, 4, TYPE_PNV_PHB4_ROOT_BUS);
> > -    pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
> > +    pci_setup_iommu(pci->bus, &pnv_phb4_iommu_ops, phb);
> >
> >      /* Add a single Root port */
> >      qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
> > diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c index
> > d710727..5baf5db 100644
> > --- a/hw/pci-host/ppce500.c
> > +++ b/hw/pci-host/ppce500.c
> > @@ -439,6 +439,10 @@ static AddressSpace *e500_pcihost_set_iommu(PCIBus
> *bus, void *opaque,
> >      return &s->bm_as;
> >  }
> >
> > +static const PCIIOMMUOps ppce500_iommu_ops =3D {
> > +    .get_address_space =3D e500_pcihost_set_iommu, };
> > +
> >  static void e500_pcihost_realize(DeviceState *dev, Error **errp)  {
> >      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev); @@ -473,7 +477,7 @@
> > static void e500_pcihost_realize(DeviceState *dev, Error **errp)
> >      memory_region_init(&s->bm, OBJECT(s), "bm-e500", UINT64_MAX);
> >      memory_region_add_subregion(&s->bm, 0x0, &s->busmem);
> >      address_space_init(&s->bm_as, &s->bm, "pci-bm");
> > -    pci_setup_iommu(b, e500_pcihost_set_iommu, s);
> > +    pci_setup_iommu(b, &ppce500_iommu_ops, s);
> >
> >      pci_create_simple(b, 0, "e500-host-bridge");
> >
> > diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c index
> > 1a02e9a..7c57311 100644
> > --- a/hw/pci-host/prep.c
> > +++ b/hw/pci-host/prep.c
> > @@ -213,6 +213,10 @@ static AddressSpace *raven_pcihost_set_iommu(PCIBu=
s
> *bus, void *opaque,
> >      return &s->bm_as;
> >  }
> >
> > +static const PCIIOMMUOps raven_iommu_ops =3D {
> > +    .get_address_space =3D raven_pcihost_set_iommu, };
> > +
> >  static void raven_change_gpio(void *opaque, int n, int level)  {
> >      PREPPCIState *s =3D opaque;
> > @@ -303,7 +307,7 @@ static void raven_pcihost_initfn(Object *obj)
> >      memory_region_add_subregion(&s->bm, 0         , &s->bm_pci_memory_=
alias);
> >      memory_region_add_subregion(&s->bm, 0x80000000, &s->bm_ram_alias);
> >      address_space_init(&s->bm_as, &s->bm, "raven-bm");
> > -    pci_setup_iommu(&s->pci_bus, raven_pcihost_set_iommu, s);
> > +    pci_setup_iommu(&s->pci_bus, &raven_iommu_ops, s);
> >
> >      h->bus =3D &s->pci_bus;
> >
> > diff --git a/hw/pci-host/sabre.c b/hw/pci-host/sabre.c index
> > 2b8503b..251549b 100644
> > --- a/hw/pci-host/sabre.c
> > +++ b/hw/pci-host/sabre.c
> > @@ -112,6 +112,10 @@ static AddressSpace *sabre_pci_dma_iommu(PCIBus
> *bus, void *opaque, int devfn)
> >      return &is->iommu_as;
> >  }
> >
> > +static const PCIIOMMUOps sabre_iommu_ops =3D {
> > +    .get_address_space =3D sabre_pci_dma_iommu, };
> > +
> >  static void sabre_config_write(void *opaque, hwaddr addr,
> >                                 uint64_t val, unsigned size)  { @@
> > -402,7 +406,7 @@ static void sabre_realize(DeviceState *dev, Error **er=
rp)
> >      /* IOMMU */
> >      memory_region_add_subregion_overlap(&s->sabre_config, 0x200,
> >                      sysbus_mmio_get_region(SYS_BUS_DEVICE(s->iommu), 0=
), 1);
> > -    pci_setup_iommu(phb->bus, sabre_pci_dma_iommu, s->iommu);
> > +    pci_setup_iommu(phb->bus, &sabre_iommu_ops, s->iommu);
> >
> >      /* APB secondary busses */
> >      pci_dev =3D pci_create_multifunction(phb->bus, PCI_DEVFN(1, 0),
> > true, diff --git a/hw/pci/pci.c b/hw/pci/pci.c index e1ed667..aa9025c
> > 100644
> > --- a/hw/pci/pci.c
> > +++ b/hw/pci/pci.c
> > @@ -2644,7 +2644,7 @@ AddressSpace
> *pci_device_iommu_address_space(PCIDevice *dev)
> >      PCIBus *iommu_bus =3D bus;
> >      uint8_t devfn =3D dev->devfn;
> >
> > -    while (iommu_bus && !iommu_bus->iommu_fn && iommu_bus->parent_dev)
> {
> > +    while (iommu_bus && !iommu_bus->iommu_ops &&
> > + iommu_bus->parent_dev) {
> Depending on future usage, this is not strictly identical to the original
> code. You exit
> the loop as soon as a iommu_bus->iommu_ops is set whatever the presence o=
f
> get_address_space().

To be identical with original code, may adding the get_address_space()
presence check. Then the loop exits when the iommu_bus->iommu_ops is
set and meanwhile iommu_bus->iommu_ops->get_address_space() is set.
But is it possible that there is an intermediate iommu_bus which has
iommu_ops set but the get_address_space() is clear. I guess not as
iommu_ops is set by vIOMMU and vIOMMU won't differentiate buses?

Also the get_address_space() presence will be checked when trying to
use it. right?

Regards,
Yi Liu

