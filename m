Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E311DA148
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 21:48:14 +0200 (CEST)
Received: from localhost ([::1]:54314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb8Dl-0005X9-Cw
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 15:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1jb8Ct-000542-Fx
 for qemu-devel@nongnu.org; Tue, 19 May 2020 15:47:19 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54858
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1jb8Cr-0002eb-Dm
 for qemu-devel@nongnu.org; Tue, 19 May 2020 15:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589917635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ob56RoXS14bcK8oGI9uUV3tq3fhXMu/UzCvR9tEVGf4=;
 b=Vp/x6MOJl9GC6bLnO3kxUdKUI2asEEt0cr1XklxQ0kPVNi/CEqrdKtVWD+XaWqVSe1izQc
 K9ub0D0pY8VAN79lanShr2vJHHwmjRMBJkNeVMcmb8L1j3QYhBb/XacOaFSi0d0hpV0Fi5
 2ARWIbslIz+JFCX+EEYjyU8cicly6l0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-Aeaopg5wOeWPC_hBnjQyEg-1; Tue, 19 May 2020 15:47:10 -0400
X-MC-Unique: Aeaopg5wOeWPC_hBnjQyEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D91A107ACCA;
 Tue, 19 May 2020 19:47:08 +0000 (UTC)
Received: from x1.home (ovpn-112-50.phx2.redhat.com [10.3.112.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA5595D9C5;
 Tue, 19 May 2020 19:47:00 +0000 (UTC)
Date: Tue, 19 May 2020 13:47:00 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH QEMU v22 04/18] vfio: Add save and load functions for
 VFIO PCI devices
Message-ID: <20200519134700.7394bf84@x1.home>
In-Reply-To: <20200519192813.GA2799@work-vm>
References: <1589782398-24406-1-git-send-email-kwankhede@nvidia.com>
 <1589782398-24406-5-git-send-email-kwankhede@nvidia.com>
 <20200519191507.GM2798@work-vm> <20200519192813.GA2799@work-vm>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81;
 envelope-from=alex.williamson@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 00:34:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: cohuck@redhat.com, cjia@nvidia.com, aik@ozlabs.ru,
 Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, yi.l.liu@intel.com,
 quintela@redhat.com, ziye.yang@intel.com, armbru@redhat.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, felipe@nutanix.com,
 zhi.a.wang@intel.com, kevin.tian@intel.com, yan.y.zhao@intel.com,
 changpeng.liu@intel.com, eskultet@redhat.com, Ken.Xue@amd.com,
 jonathan.davies@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 May 2020 20:28:13 +0100
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> > * Kirti Wankhede (kwankhede@nvidia.com) wrote:  
> > > These functions save and restore PCI device specific data - config
> > > space of PCI device.
> > > Tested save and restore with MSI and MSIX type.  
> > 
> > I don't think my comments from v16 on 26th March were addressed/replied
> > to:  
> 
> 
> Oops, I've just spotted your reply from earlier this month; so:
> 
> > > Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> > > Reviewed-by: Neo Jia <cjia@nvidia.com>
> > > ---
> > >  hw/vfio/pci.c                 | 163 ++++++++++++++++++++++++++++++++++++++++++
> > >  include/hw/vfio/vfio-common.h |   2 +
> > >  2 files changed, 165 insertions(+)
> > > 
> > > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > > index 6c77c12e44b9..36b1e08f84d8 100644
> > > --- a/hw/vfio/pci.c
> > > +++ b/hw/vfio/pci.c
> > > @@ -41,6 +41,7 @@
> > >  #include "trace.h"
> > >  #include "qapi/error.h"
> > >  #include "migration/blocker.h"
> > > +#include "migration/qemu-file.h"
> > >  
> > >  #define TYPE_VFIO_PCI "vfio-pci"
> > >  #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
> > > @@ -1632,6 +1633,50 @@ static void vfio_bars_prepare(VFIOPCIDevice *vdev)
> > >      }
> > >  }
> > >  
> > > +static int vfio_bar_validate(VFIOPCIDevice *vdev, int nr)
> > > +{
> > > +    PCIDevice *pdev = &vdev->pdev;
> > > +    VFIOBAR *bar = &vdev->bars[nr];
> > > +    uint64_t addr;
> > > +    uint32_t addr_lo, addr_hi = 0;
> > > +
> > > +    /* Skip unimplemented BARs and the upper half of 64bit BARS. */
> > > +    if (!bar->size) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    addr_lo = pci_default_read_config(pdev, PCI_BASE_ADDRESS_0 + nr * 4, 4);
> > > +
> > > +    addr_lo &= (bar->ioport ? PCI_BASE_ADDRESS_IO_MASK :
> > > +                              PCI_BASE_ADDRESS_MEM_MASK);
> > > +    if (bar->type == PCI_BASE_ADDRESS_MEM_TYPE_64) {
> > > +        addr_hi = pci_default_read_config(pdev,
> > > +                                         PCI_BASE_ADDRESS_0 + (nr + 1) * 4, 4);
> > > +    }
> > > +
> > > +    addr = ((uint64_t)addr_hi << 32) | addr_lo;
> > > +
> > > +    if (!QEMU_IS_ALIGNED(addr, bar->size)) {
> > > +        return -EINVAL;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static int vfio_bars_validate(VFIOPCIDevice *vdev)
> > > +{
> > > +    int i, ret;
> > > +
> > > +    for (i = 0; i < PCI_ROM_SLOT; i++) {
> > > +        ret = vfio_bar_validate(vdev, i);
> > > +        if (ret) {
> > > +            error_report("vfio: BAR address %d validation failed", i);
> > > +            return ret;
> > > +        }
> > > +    }
> > > +    return 0;
> > > +}
> > > +
> > >  static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
> > >  {
> > >      VFIOBAR *bar = &vdev->bars[nr];
> > > @@ -2414,11 +2459,129 @@ static Object *vfio_pci_get_object(VFIODevice *vbasedev)
> > >      return OBJECT(vdev);
> > >  }
> > >  
> > > +static void vfio_pci_save_config(VFIODevice *vbasedev, QEMUFile *f)
> > > +{
> > > +    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
> > > +    PCIDevice *pdev = &vdev->pdev;
> > > +    uint16_t pci_cmd;
> > > +    int i;
> > > +
> > > +    for (i = 0; i < PCI_ROM_SLOT; i++) {
> > > +        uint32_t bar;
> > > +
> > > +        bar = pci_default_read_config(pdev, PCI_BASE_ADDRESS_0 + i * 4, 4);
> > > +        qemu_put_be32(f, bar);
> > > +    }
> > > +
> > > +    qemu_put_be32(f, vdev->interrupt);
> > > +    if (vdev->interrupt == VFIO_INT_MSI) {
> > > +        uint32_t msi_flags, msi_addr_lo, msi_addr_hi = 0, msi_data;
> > > +        bool msi_64bit;
> > > +
> > > +        msi_flags = pci_default_read_config(pdev, pdev->msi_cap + PCI_MSI_FLAGS,
> > > +                                            2);
> > > +        msi_64bit = (msi_flags & PCI_MSI_FLAGS_64BIT);
> > > +
> > > +        msi_addr_lo = pci_default_read_config(pdev,
> > > +                                         pdev->msi_cap + PCI_MSI_ADDRESS_LO, 4);
> > > +        qemu_put_be32(f, msi_addr_lo);
> > > +
> > > +        if (msi_64bit) {
> > > +            msi_addr_hi = pci_default_read_config(pdev,
> > > +                                             pdev->msi_cap + PCI_MSI_ADDRESS_HI,
> > > +                                             4);
> > > +        }
> > > +        qemu_put_be32(f, msi_addr_hi);
> > > +
> > > +        msi_data = pci_default_read_config(pdev,
> > > +                pdev->msi_cap + (msi_64bit ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32),
> > > +                2);
> > > +        qemu_put_be16(f, msi_data);
> > > +    } else if (vdev->interrupt == VFIO_INT_MSIX) {
> > > +        uint16_t offset;
> > > +
> > > +        /* save enable bit and maskall bit */
> > > +        offset = pci_default_read_config(pdev,
> > > +                                       pdev->msix_cap + PCI_MSIX_FLAGS + 1, 2);
> > > +        qemu_put_be16(f, offset);
> > > +        msix_save(pdev, f);
> > > +    }
> > > +    pci_cmd = pci_default_read_config(pdev, PCI_COMMAND, 2);
> > > +    qemu_put_be16(f, pci_cmd);
> > > +}
> > > +
> > > +static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
> > > +{
> > > +    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
> > > +    PCIDevice *pdev = &vdev->pdev;
> > > +    uint32_t interrupt_type;
> > > +    uint32_t msi_flags, msi_addr_lo, msi_addr_hi = 0, msi_data;
> > > +    uint16_t pci_cmd;
> > > +    bool msi_64bit;
> > > +    int i, ret;
> > > +
> > > +    /* retore pci bar configuration */
> > > +    pci_cmd = pci_default_read_config(pdev, PCI_COMMAND, 2);
> > > +    vfio_pci_write_config(pdev, PCI_COMMAND,
> > > +                        pci_cmd & (!(PCI_COMMAND_IO | PCI_COMMAND_MEMORY)), 2);
> > > +    for (i = 0; i < PCI_ROM_SLOT; i++) {
> > > +        uint32_t bar = qemu_get_be32(f);
> > > +
> > > +        vfio_pci_write_config(pdev, PCI_BASE_ADDRESS_0 + i * 4, bar, 4);
> > > +    }
> > > +
> > > +    ret = vfio_bars_validate(vdev);
> > > +    if (ret) {
> > > +        return ret;
> > > +    }  
> > 
> > I wrote:
> >   This isn't quite what I'd expected, since that validate is reading what
> >   you read back; I'd have thought you'd validate the bar value before
> >   writing it to the device.
> >   (I'm also surprised you're only reading 32bit here?)  
> 
> OK, so you said actually there's not much to veriy; OK.

I still fail to see the value of the bar validation at all, my question
relative to vfio_bar_validate()[1] was never actually addressed:

  What specifically are we validating here?  This should be true no
  matter what we wrote to the BAR or else BAR emulation is broken.  The
  bits that could make this unaligned are not implemented in the BAR.

Writing something into a BAR, reading it back, and verifying that the
value is aligned to the BAR size is nothing more than a 'does this BAR
behave like BARs are supposed to behave' test.  The logic within the
BAR emulation would mask off the unaligned bits regardless of what was
written to them.  Thanks,

Alex

> > > +    interrupt_type = qemu_get_be32(f);
> > > +
> > > +    if (interrupt_type == VFIO_INT_MSI) {
> > > +        /* restore msi configuration */
> > > +        msi_flags = pci_default_read_config(pdev,
> > > +                                            pdev->msi_cap + PCI_MSI_FLAGS, 2);
> > > +        msi_64bit = (msi_flags & PCI_MSI_FLAGS_64BIT);
> > > +
> > > +        vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_FLAGS,
> > > +                              msi_flags & (!PCI_MSI_FLAGS_ENABLE), 2);
> > > +
> > > +        msi_addr_lo = qemu_get_be32(f);
> > > +        vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_ADDRESS_LO,
> > > +                              msi_addr_lo, 4);
> > > +
> > > +        msi_addr_hi = qemu_get_be32(f);
> > > +        if (msi_64bit) {
> > > +            vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_ADDRESS_HI,
> > > +                                  msi_addr_hi, 4);
> > > +        }
> > > +        msi_data = qemu_get_be16(f);
> > > +        vfio_pci_write_config(pdev,
> > > +                pdev->msi_cap + (msi_64bit ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32),
> > > +                msi_data, 2);
> > > +
> > > +        vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_FLAGS,
> > > +                              msi_flags | PCI_MSI_FLAGS_ENABLE, 2);
> > > +    } else if (interrupt_type == VFIO_INT_MSIX) {
> > > +        uint16_t offset = qemu_get_be16(f);
> > > +
> > > +        /* load enable bit and maskall bit */
> > > +        vfio_pci_write_config(pdev, pdev->msix_cap + PCI_MSIX_FLAGS + 1,
> > > +                              offset, 2);
> > > +        msix_load(pdev, f);
> > > +    }
> > > +    pci_cmd = qemu_get_be16(f);
> > > +    vfio_pci_write_config(pdev, PCI_COMMAND, pci_cmd, 2);
> > > +    return 0;
> > > +}
> > > +  
> > 
> > I wrote:
> >   While I don't know PCI as well as Alex, I share the worry about what
> >   happens when you decide to want to save more information about the
> >   device; you've not got any place holders where you can add anything; and
> >   since it's all hand-coded (rather than using vmstate) it's only going to
> >   get hairier.
> >   
> > >  static VFIODeviceOps vfio_pci_ops = {
> > >      .vfio_compute_needs_reset = vfio_pci_compute_needs_reset,
> > >      .vfio_hot_reset_multi = vfio_pci_hot_reset_multi,
> > >      .vfio_eoi = vfio_intx_eoi,
> > >      .vfio_get_object = vfio_pci_get_object,
> > > +    .vfio_save_config = vfio_pci_save_config,
> > > +    .vfio_load_config = vfio_pci_load_config,
> > >  };
> > >  
> > >  int vfio_populate_vga(VFIOPCIDevice *vdev, Error **errp)
> > > diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> > > index 74261feaeac9..d69a7f3ae31e 100644
> > > --- a/include/hw/vfio/vfio-common.h
> > > +++ b/include/hw/vfio/vfio-common.h
> > > @@ -120,6 +120,8 @@ struct VFIODeviceOps {
> > >      int (*vfio_hot_reset_multi)(VFIODevice *vdev);
> > >      void (*vfio_eoi)(VFIODevice *vdev);
> > >      Object *(*vfio_get_object)(VFIODevice *vdev);
> > > +    void (*vfio_save_config)(VFIODevice *vdev, QEMUFile *f);
> > > +    int (*vfio_load_config)(VFIODevice *vdev, QEMUFile *f);
> > >  };
> > >  
> > >  typedef struct VFIOGroup {
> > > -- 
> > > 2.7.0
> > >   
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK  
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


