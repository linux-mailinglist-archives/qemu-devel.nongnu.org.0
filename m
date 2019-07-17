Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A16ED6B8F6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 11:10:37 +0200 (CEST)
Received: from localhost ([::1]:55228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnfxM-0007py-Qm
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 05:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58411)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hnfx8-0007JZ-IR
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 05:10:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hnfx7-0000sE-42
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 05:10:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34744)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hnfx6-0000qr-RN
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 05:10:21 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 77E5F30821AE;
 Wed, 17 Jul 2019 09:10:19 +0000 (UTC)
Received: from work-vm (ovpn-116-172.ams2.redhat.com [10.36.116.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DEB5600C8;
 Wed, 17 Jul 2019 09:10:12 +0000 (UTC)
Date: Wed, 17 Jul 2019 10:10:09 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Message-ID: <20190717091009.GB3627@work-vm>
References: <1562665760-26158-1-git-send-email-kwankhede@nvidia.com>
 <1562665760-26158-5-git-send-email-kwankhede@nvidia.com>
 <20190716151401.0eeabdb6@x1.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716151401.0eeabdb6@x1.home>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 17 Jul 2019 09:10:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v7 04/13] vfio: Add save and load functions
 for VFIO PCI devices
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
Cc: Zhengxiao.zx@alibaba-inc.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 cjia@nvidia.com, eskultet@redhat.com, ziye.yang@intel.com, cohuck@redhat.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org, zhi.a.wang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, felipe@nutanix.com,
 jonathan.davies@nutanix.com, yan.y.zhao@intel.com, changpeng.liu@intel.com,
 Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alex Williamson (alex.williamson@redhat.com) wrote:
> On Tue, 9 Jul 2019 15:19:11 +0530
> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> 
> > These functions save and restore PCI device specific data - config
> > space of PCI device.
> > Tested save and restore with MSI and MSIX type.
> > 
> > Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> > Reviewed-by: Neo Jia <cjia@nvidia.com>
> > ---
> >  hw/vfio/pci.c                 | 114 ++++++++++++++++++++++++++++++++++++++++++
> >  include/hw/vfio/vfio-common.h |   2 +
> >  2 files changed, 116 insertions(+)
> > 
> > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > index de0d286fc9dd..5fe4f8076cac 100644
> > --- a/hw/vfio/pci.c
> > +++ b/hw/vfio/pci.c
> > @@ -2395,11 +2395,125 @@ static Object *vfio_pci_get_object(VFIODevice *vbasedev)
> >      return OBJECT(vdev);
> >  }
> >  
> > +static void vfio_pci_save_config(VFIODevice *vbasedev, QEMUFile *f)
> > +{
> > +    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
> > +    PCIDevice *pdev = &vdev->pdev;
> > +    uint16_t pci_cmd;
> > +    int i;
> > +
> > +    for (i = 0; i < PCI_ROM_SLOT; i++) {
> > +        uint32_t bar;
> > +
> > +        bar = pci_default_read_config(pdev, PCI_BASE_ADDRESS_0 + i * 4, 4);
> > +        qemu_put_be32(f, bar);
> > +    }
> > +
> > +    qemu_put_be32(f, vdev->interrupt);
> > +    if (vdev->interrupt == VFIO_INT_MSI) {
> > +        uint32_t msi_flags, msi_addr_lo, msi_addr_hi = 0, msi_data;
> > +        bool msi_64bit;
> > +
> > +        msi_flags = pci_default_read_config(pdev, pdev->msi_cap + PCI_MSI_FLAGS,
> > +                                            2);
> > +        msi_64bit = (msi_flags & PCI_MSI_FLAGS_64BIT);
> > +
> > +        msi_addr_lo = pci_default_read_config(pdev,
> > +                                         pdev->msi_cap + PCI_MSI_ADDRESS_LO, 4);
> > +        qemu_put_be32(f, msi_addr_lo);
> > +
> > +        if (msi_64bit) {
> > +            msi_addr_hi = pci_default_read_config(pdev,
> > +                                             pdev->msi_cap + PCI_MSI_ADDRESS_HI,
> > +                                             4);
> > +        }
> > +        qemu_put_be32(f, msi_addr_hi);
> > +
> > +        msi_data = pci_default_read_config(pdev,
> > +                pdev->msi_cap + (msi_64bit ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32),
> > +                2);
> > +        qemu_put_be32(f, msi_data);
> > +    } else if (vdev->interrupt == VFIO_INT_MSIX) {
> > +        uint16_t offset;
> > +
> > +        /* save enable bit and maskall bit */
> > +        offset = pci_default_read_config(pdev,
> > +                                       pdev->msix_cap + PCI_MSIX_FLAGS + 1, 2);
> > +        qemu_put_be16(f, offset);
> > +        msix_save(pdev, f);
> > +    }
> > +    pci_cmd = pci_default_read_config(pdev, PCI_COMMAND, 2);
> > +    qemu_put_be16(f, pci_cmd);
> > +}
> > +
> > +static void vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
> > +{
> > +    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
> > +    PCIDevice *pdev = &vdev->pdev;
> > +    uint32_t interrupt_type;
> > +    uint32_t msi_flags, msi_addr_lo, msi_addr_hi = 0, msi_data;
> > +    uint16_t pci_cmd;
> > +    bool msi_64bit;
> > +    int i;
> > +
> > +    /* retore pci bar configuration */
> > +    pci_cmd = pci_default_read_config(pdev, PCI_COMMAND, 2);
> > +    vfio_pci_write_config(pdev, PCI_COMMAND,
> > +                        pci_cmd & (!(PCI_COMMAND_IO | PCI_COMMAND_MEMORY)), 2);
> > +    for (i = 0; i < PCI_ROM_SLOT; i++) {
> > +        uint32_t bar = qemu_get_be32(f);
> > +
> > +        vfio_pci_write_config(pdev, PCI_BASE_ADDRESS_0 + i * 4, bar, 4);
> > +    }
> > +    vfio_pci_write_config(pdev, PCI_COMMAND,
> > +                          pci_cmd | PCI_COMMAND_IO | PCI_COMMAND_MEMORY, 2);
> > +
> > +    interrupt_type = qemu_get_be32(f);
> > +
> > +    if (interrupt_type == VFIO_INT_MSI) {
> > +        /* restore msi configuration */
> > +        msi_flags = pci_default_read_config(pdev,
> > +                                            pdev->msi_cap + PCI_MSI_FLAGS, 2);
> > +        msi_64bit = (msi_flags & PCI_MSI_FLAGS_64BIT);
> > +
> > +        vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_FLAGS,
> > +                              msi_flags & (!PCI_MSI_FLAGS_ENABLE), 2);
> > +
> > +        msi_addr_lo = qemu_get_be32(f);
> > +        vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_ADDRESS_LO,
> > +                              msi_addr_lo, 4);
> > +
> > +        msi_addr_hi = qemu_get_be32(f);
> > +        if (msi_64bit) {
> > +            vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_ADDRESS_HI,
> > +                                  msi_addr_hi, 4);
> > +        }
> > +        msi_data = qemu_get_be32(f);
> > +        vfio_pci_write_config(pdev,
> > +                pdev->msi_cap + (msi_64bit ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32),
> > +                msi_data, 2);
> > +
> > +        vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_FLAGS,
> > +                              msi_flags | PCI_MSI_FLAGS_ENABLE, 2);
> > +    } else if (interrupt_type == VFIO_INT_MSIX) {
> > +        uint16_t offset = qemu_get_be16(f);
> > +
> > +        /* load enable bit and maskall bit */
> > +        vfio_pci_write_config(pdev, pdev->msix_cap + PCI_MSIX_FLAGS + 1,
> > +                              offset, 2);
> > +        msix_load(pdev, f);
> > +    }
> > +    pci_cmd = qemu_get_be16(f);
> > +    vfio_pci_write_config(pdev, PCI_COMMAND, pci_cmd, 2);
> > +}
> 
> Pardon my migration ignorance, but there are bound to be more fields
> and capabilities that get migrated over time.  How does this get
> extended to support that and maintain backwards compatibility?  Thanks,

You normally tie those fields to a property on your device and set the
property in the machine type so that newer machine types send the extra
fields.

Dave

> Alex
> 
> > +
> >  static VFIODeviceOps vfio_pci_ops = {
> >      .vfio_compute_needs_reset = vfio_pci_compute_needs_reset,
> >      .vfio_hot_reset_multi = vfio_pci_hot_reset_multi,
> >      .vfio_eoi = vfio_intx_eoi,
> >      .vfio_get_object = vfio_pci_get_object,
> > +    .vfio_save_config = vfio_pci_save_config,
> > +    .vfio_load_config = vfio_pci_load_config,
> >  };
> >  
> >  int vfio_populate_vga(VFIOPCIDevice *vdev, Error **errp)
> > diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> > index 771b6d59a3db..ee72bd984a36 100644
> > --- a/include/hw/vfio/vfio-common.h
> > +++ b/include/hw/vfio/vfio-common.h
> > @@ -120,6 +120,8 @@ struct VFIODeviceOps {
> >      int (*vfio_hot_reset_multi)(VFIODevice *vdev);
> >      void (*vfio_eoi)(VFIODevice *vdev);
> >      Object *(*vfio_get_object)(VFIODevice *vdev);
> > +    void (*vfio_save_config)(VFIODevice *vdev, QEMUFile *f);
> > +    void (*vfio_load_config)(VFIODevice *vdev, QEMUFile *f);
> >  };
> >  
> >  typedef struct VFIOGroup {
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

