Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F6220CDBF
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 12:01:40 +0200 (CEST)
Received: from localhost ([::1]:33326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpqbb-0007FA-7L
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 06:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jpqZf-00067Y-JI
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 05:59:39 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26338
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jpqZd-0003yD-2W
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 05:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593424776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hgrTySFYj9XMPXTPeD4Djn3FsrSNK8cVmJ+tn5GEytI=;
 b=b6/5KaYiMsXBAPeJTV0GnHHx5aRRjgSjkeLBGr39K29mjr4dKUU0U/uXrV39+TRGRvkvKT
 vD7R2dzQ9afL1vn3Tx6tyfTRogzZbW5enWEt55WnXf6PwuBaz+dusFG13gTrdNgBNATqqk
 Fw097X168BKncVsUEeSQFqON6x5iD74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-Jc3bJY7JNSOVjwxupRrMkw-1; Mon, 29 Jun 2020 05:59:34 -0400
X-MC-Unique: Jc3bJY7JNSOVjwxupRrMkw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 785EF800C64;
 Mon, 29 Jun 2020 09:59:31 +0000 (UTC)
Received: from work-vm (ovpn-114-210.ams2.redhat.com [10.36.114.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B88B121B79;
 Mon, 29 Jun 2020 09:59:20 +0000 (UTC)
Date: Mon, 29 Jun 2020 10:59:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH QEMU v25 03/17] vfio: Add save and load functions for
 VFIO PCI devices
Message-ID: <20200629095918.GE2908@work-vm>
References: <1592684486-18511-1-git-send-email-kwankhede@nvidia.com>
 <1592684486-18511-4-git-send-email-kwankhede@nvidia.com>
 <20200622142803.109565e3@x1.home>
 <88ace5f6-09ee-4d82-f304-bc2d4cdc17cf@nvidia.com>
 <20200624134958.692a4c90@x1.home> <20200626121613.GH3087@work-vm>
 <20200626164416.0a4d986a@w520.home>
MIME-Version: 1.0
In-Reply-To: <20200626164416.0a4d986a@w520.home>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:06:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

* Alex Williamson (alex.williamson@redhat.com) wrote:
> On Fri, 26 Jun 2020 13:16:13 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Alex Williamson (alex.williamson@redhat.com) wrote:
> > > On Wed, 24 Jun 2020 19:59:39 +0530
> > > Kirti Wankhede <kwankhede@nvidia.com> wrote:
> > >   
> > > > On 6/23/2020 1:58 AM, Alex Williamson wrote:  
> > > > > On Sun, 21 Jun 2020 01:51:12 +0530
> > > > > Kirti Wankhede <kwankhede@nvidia.com> wrote:
> > > > >     
> > > > >> These functions save and restore PCI device specific data - config
> > > > >> space of PCI device.
> > > > >> Tested save and restore with MSI and MSIX type.
> > > > >>
> > > > >> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> > > > >> Reviewed-by: Neo Jia <cjia@nvidia.com>
> > > > >> ---
> > > > >>   hw/vfio/pci.c                 | 95 +++++++++++++++++++++++++++++++++++++++++++
> > > > >>   include/hw/vfio/vfio-common.h |  2 +
> > > > >>   2 files changed, 97 insertions(+)
> > > > >>
> > > > >> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > > > >> index 27f8872db2b1..5ba340aee1d4 100644
> > > > >> --- a/hw/vfio/pci.c
> > > > >> +++ b/hw/vfio/pci.c
> > > > >> @@ -41,6 +41,7 @@
> > > > >>   #include "trace.h"
> > > > >>   #include "qapi/error.h"
> > > > >>   #include "migration/blocker.h"
> > > > >> +#include "migration/qemu-file.h"
> > > > >>   
> > > > >>   #define TYPE_VFIO_PCI "vfio-pci"
> > > > >>   #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
> > > > >> @@ -2407,11 +2408,105 @@ static Object *vfio_pci_get_object(VFIODevice *vbasedev)
> > > > >>       return OBJECT(vdev);
> > > > >>   }
> > > > >>   
> > > > >> +static void vfio_pci_save_config(VFIODevice *vbasedev, QEMUFile *f)
> > > > >> +{
> > > > >> +    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
> > > > >> +    PCIDevice *pdev = &vdev->pdev;
> > > > >> +
> > > > >> +    qemu_put_buffer(f, vdev->emulated_config_bits, vdev->config_size);
> > > > >> +    qemu_put_buffer(f, vdev->pdev.wmask, vdev->config_size);
> > > > >> +    pci_device_save(pdev, f);
> > > > >> +
> > > > >> +    qemu_put_be32(f, vdev->interrupt);
> > > > >> +    if (vdev->interrupt == VFIO_INT_MSIX) {
> > > > >> +        msix_save(pdev, f);    
> > > > > 
> > > > > msix_save() checks msix_present() so shouldn't we include this
> > > > > unconditionally?  Can't there also be state in the vector table
> > > > > regardless of whether we're currently running in MSI-X mode?
> > > > >     
> > > > >> +    }
> > > > >> +}
> > > > >> +
> > > > >> +static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
> > > > >> +{
> > > > >> +    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
> > > > >> +    PCIDevice *pdev = &vdev->pdev;
> > > > >> +    uint32_t interrupt_type;
> > > > >> +    uint16_t pci_cmd;
> > > > >> +    int i, ret;
> > > > >> +
> > > > >> +    qemu_get_buffer(f, vdev->emulated_config_bits, vdev->config_size);
> > > > >> +    qemu_get_buffer(f, vdev->pdev.wmask, vdev->config_size);    
> > > > > 
> > > > > This doesn't seem safe, why is it ok to indiscriminately copy these
> > > > > arrays that are configured via support or masking of various device
> > > > > features from the source to the target?
> > > > >     
> > > > 
> > > > Ideally, software state at host should be restrored at destination - 
> > > > this is the attempt to do that.  
> > > 
> > > Or is it the case that both source and target should initialize these
> > > and come up with the same result and they should be used for
> > > validation, not just overwriting the target with the source?  
> > 
> > Is the request to have something similar to get_pci_config_device's
> > check where it compares the configs and c/w/w1c masks (see
> > hw/pci/pci.c:520 ish) - we get errors like:
> >    Bad config data: i=0x.... read: ... device: ... cmask...
> > 
> > this is pretty good at spotting things where the source and destination
> > device are configured differently, but to allow other dynamic
> > configuration values to be passed through OK.
> 
> Yeah, except instead of validating we're just overwriting the
> destination currently.  Maybe we should make use of that directly.
> 
> I'm also not sure what the current best practice is for including
> device/feature specific information into the migration stream.  For
> example, if a new feature that's potentially only present on some
> devices includes emulation state that needs to be migrated we'd need a
> way to include that in the migration stream such that a target can fail
> if it doesn't understand that data or fail if it requires that data and
> it's not present.  What we have here seems very rigid, I don't see how
> we iterate on it with any chance of maintaining compatibility.  Any
> specific pointers to relevant examples?  Thanks,

That's what the 'subsection' mechanism in vmsd's allows.
It's a named part of a devices migration stream; if the destination
finds it receiving it without knowing what it is, it fails and errors
giving the name of the subsection it was surprised by.
(You can also set a flag at the start of a migration, and clear it when
you recieve the subsection, and that allows you to do the check that
you've received the subsection).

Note, one thing I'd initially missed, in this v25, it actually uses
pci_device_load and pci_device_save; so it should already be doing that
'bad config data' check above - so if the c/w/w1c masks are set
correctly, maybe this actually solves your problem?

Dave

> Alex
> 
> > > > > I think this still fails basic feature support negotiation.  For
> > > > > instance, Intel IGD assignment modifies emulated_config_bits and wmask
> > > > > to allow the VM BIOS to allocate fake stolen memory for the GPU and
> > > > > store this value in config space.  This support can be controlled via a
> > > > > QEMU build-time option, therefore the feature support on the target can
> > > > > be different from the source.  If this sort of feature set doesn't
> > > > > match between source and target, I think we'd want to abort the
> > > > > migration, but we don't have any provisions for that here (a physical
> > > > > IGD device is obviously just an example as it doesn't support migration
> > > > > currently).
> > > > >     
> > > > 
> > > > Then is it ok not to include vdev->pdev.wmask? If yes, I'll remove it.
> > > > But we need vdev->emulated_config_bits to be restored.  
> > > 
> > > It's not clear why we need emulated_config_bits copied or how we'd
> > > handle the example I set forth above.  The existence of emulation
> > > provided by QEMU is also emulation state.
> > > 
> > >   
> > > > >> +
> > > > >> +    ret = pci_device_load(pdev, f);
> > > > >> +    if (ret) {
> > > > >> +        return ret;
> > > > >> +    }
> > > > >> +
> > > > >> +    /* retore pci bar configuration */
> > > > >> +    pci_cmd = pci_default_read_config(pdev, PCI_COMMAND, 2);
> > > > >> +    vfio_pci_write_config(pdev, PCI_COMMAND,
> > > > >> +                        pci_cmd & (!(PCI_COMMAND_IO | PCI_COMMAND_MEMORY)), 2);    
> > > > > 
> > > > > s/!/~/?  Extra parenthesis too
> > > > >     
> > > > >> +    for (i = 0; i < PCI_ROM_SLOT; i++) {
> > > > >> +        uint32_t bar = pci_default_read_config(pdev,
> > > > >> +                                               PCI_BASE_ADDRESS_0 + i * 4, 4);
> > > > >> +
> > > > >> +        vfio_pci_write_config(pdev, PCI_BASE_ADDRESS_0 + i * 4, bar, 4);
> > > > >> +    }
> > > > >> +
> > > > >> +    interrupt_type = qemu_get_be32(f);
> > > > >> +
> > > > >> +    if (interrupt_type == VFIO_INT_MSI) {
> > > > >> +        uint32_t msi_flags, msi_addr_lo, msi_addr_hi = 0, msi_data;
> > > > >> +        bool msi_64bit;
> > > > >> +
> > > > >> +        /* restore msi configuration */
> > > > >> +        msi_flags = pci_default_read_config(pdev,
> > > > >> +                                            pdev->msi_cap + PCI_MSI_FLAGS, 2);
> > > > >> +        msi_64bit = (msi_flags & PCI_MSI_FLAGS_64BIT);
> > > > >> +
> > > > >> +        vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_FLAGS,
> > > > >> +                              msi_flags & (!PCI_MSI_FLAGS_ENABLE), 2);
> > > > >> +    
> > > > > 
> > > > > What if I migrate from a device with MSI support to a device without
> > > > > MSI support, or to a device with MSI support at a different offset, who
> > > > > is responsible for triggering a migration fault?
> > > > >     
> > > > 
> > > > Migration compatibility check should take care of that. If there is such 
> > > > a big difference in hardware then other things would also fail.  
> > > 
> > > 
> > > The division between what is our responsibility in QEMU and what we
> > > hope the vendor driver handles is not very clear imo.  How do we avoid
> > > finger pointing when things break?
> > > 
> > >   
> > > > >> +        msi_addr_lo = pci_default_read_config(pdev,
> > > > >> +                                        pdev->msi_cap + PCI_MSI_ADDRESS_LO, 4);
> > > > >> +        vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_ADDRESS_LO,
> > > > >> +                              msi_addr_lo, 4);
> > > > >> +
> > > > >> +        if (msi_64bit) {
> > > > >> +            msi_addr_hi = pci_default_read_config(pdev,
> > > > >> +                                        pdev->msi_cap + PCI_MSI_ADDRESS_HI, 4);
> > > > >> +            vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_ADDRESS_HI,
> > > > >> +                                  msi_addr_hi, 4);
> > > > >> +        }
> > > > >> +
> > > > >> +        msi_data = pci_default_read_config(pdev,
> > > > >> +                pdev->msi_cap + (msi_64bit ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32),
> > > > >> +                2);
> > > > >> +
> > > > >> +        vfio_pci_write_config(pdev,
> > > > >> +                pdev->msi_cap + (msi_64bit ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32),
> > > > >> +                msi_data, 2);
> > > > >> +
> > > > >> +        vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_FLAGS,
> > > > >> +                              msi_flags | PCI_MSI_FLAGS_ENABLE, 2);
> > > > >> +    } else if (interrupt_type == VFIO_INT_MSIX) {
> > > > >> +        uint16_t offset;
> > > > >> +
> > > > >> +        offset = pci_default_read_config(pdev,
> > > > >> +                                       pdev->msix_cap + PCI_MSIX_FLAGS + 1, 2);
> > > > >> +        /* load enable bit and maskall bit */
> > > > >> +        vfio_pci_write_config(pdev, pdev->msix_cap + PCI_MSIX_FLAGS + 1,
> > > > >> +                              offset, 2);
> > > > >> +        msix_load(pdev, f);    
> > > > > 
> > > > > Isn't this ordering backwards, or at least less efficient?  The config
> > > > > write will cause us to enable MSI-X; presumably we'd have nothing in
> > > > > the vector table though.  Then msix_load() will write the vector
> > > > > and pba tables and trigger a use notifier for each vector.  It seems
> > > > > like that would trigger a bunch of SET_IRQS ioctls as if the guest
> > > > > wrote individual unmasked vectors to the vector table, whereas if we
> > > > > setup the vector table and then enable MSI-X, we do it with one ioctl.
> > > > >     
> > > > 
> > > > Makes sense. Changing the order here.
> > > >   
> > > > > Also same question as above, I'm not sure who is responsible for making
> > > > > sure both devices support MSI-X and that the capability exists at the
> > > > > same place on each.  Repeat for essentially every capability.  Are we
> > > > > leaning on the migration regions to fail these migrations before we get
> > > > > here?  If so, should we be?
> > > > >     
> > > > As I mentioned about it should be vendor drivers responsibility to have 
> > > > compatibility check in that case.  
> > > 
> > > 
> > > And we'd rather blindly assume the vendor driver included that
> > > requirement than to check for ourselves?
> > > 
> > >   
> > > > > Also, besides BARs, the command register, and MSI & MSI-X, there must
> > > > > be other places where the guest can write config data through to the
> > > > > device.  pci_device_{save,load}() only sets QEMU's config space.
> > > > >     
> > > > 
> > > >  From QEMU we can restore QEMU's software state. For mediated device, 
> > > > emulated state at vendor driver should be maintained by vendor driver, 
> > > > right?  
> > > 
> > > In this proposal we've determined that emulated_config_bits, wmask,
> > > emulated config space, and MSI/X state are part of QEMU's state that
> > > need to be transmitted to the target.  It therefore shouldn't be
> > > difficult to imagine that adding support for another capability might
> > > involve QEMU emulation as well.  How does the migration stream we've
> > > constructed here allow such emulation state to be included?  For example
> > > we might have a feature like IGD where we can discern the
> > > incompatibility via differences in the emulated_config_bits and wmask,
> > > but that's not guaranteed.
> > >   
> > > > > A couple more theoretical (probably not too distant) examples related
> > > > > to that; there's a resizable BAR capability that at some point we'll
> > > > > probably need to allow the guest to interact with (ie. manipulation of
> > > > > capability changes the reported region size for a BAR).  How would we
> > > > > support that with this save/load scheme?    
> > > > 
> > > > Config space is saved at the start of stop-and-copy phase, that means 
> > > > vCPUs are stopped. So QEMU's config space saved at this phase should 
> > > > include the change. Will there be any other software state that would be 
> > > > required to save/load?  
> > > 
> > > 
> > > There might be, it seems inevitable that there would eventually be
> > > something that needs emulation state beyond this initial draft.  Is
> > > this resizable BAR example another that we simply hand wave as the
> > > responsibility of the vendor driver?
> > >  
> > >   
> > > > >  We'll likely also have SR-IOV
> > > > > PFs assigned where we'll perhaps have support for emulating the SR-IOV
> > > > > capability to call out to a privileged userspace helper to enable VFs,
> > > > > how does this get extended to support that type of emulation?
> > > > > 
> > > > > I'm afraid that making carbon copies of emulated_config_bits, wmask,
> > > > > and invoking pci_device_save/load() doesn't address my concerns that
> > > > > saving and restoring config space between source and target really
> > > > > seems like a much more important task than outlined here.  Thanks,
> > > > >     
> > > > 
> > > > Are you suggesting to load config space using vfio_pci_write_config() 
> > > > from PCI_CONFIG_HEADER_SIZE to 
> > > > PCI_CONFIG_SPACE_SIZE/PCIE_CONFIG_SPACE_SIZE? I was kind of avoiding it.  
> > > 
> > > I don't think we can do that, even the save/restore functions in the
> > > kernel only blindly overwrite the standard header and then use
> > > capability specific functions elsewhere.  But I think what is missing
> > > here is the ability to hook in support for manipulating specific
> > > capabilities on save and restore, which might include QEMU emulation
> > > state data outside of what's provided here.  Thanks,
> > > 
> > > Alex  
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


