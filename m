Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8301ED458
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 18:28:43 +0200 (CEST)
Received: from localhost ([::1]:55576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgWFt-0007hx-8Z
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 12:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1jgWE4-000625-Ab
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 12:26:48 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20860
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1jgWE1-00073Z-Fk
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 12:26:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591201603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VR/lyH3hAkWvRnOyKOpFpQoG/xQdES4IuBlxKzO6BYk=;
 b=V+P9jvSg7WKvDedgBtpsEasQjEZyNfHV828TKmGqJuQgRo0PQgBczFTvXXAywZsqIAfobu
 +mfp0PeUkttepf5kmmu5jsmmgrwBkwU0OnDlzMZfxwf1yVPLVVCl83FdkeGFvqVoA1riPv
 cdg90gUxf5/DQPOi6m9RiIYFEmsUJJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-547l-tO0P2Kz3PgqDO75yA-1; Wed, 03 Jun 2020 12:26:41 -0400
X-MC-Unique: 547l-tO0P2Kz3PgqDO75yA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5708461;
 Wed,  3 Jun 2020 16:26:37 +0000 (UTC)
Received: from x1.home (ovpn-112-195.phx2.redhat.com [10.3.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E179F98FE5;
 Wed,  3 Jun 2020 16:26:28 +0000 (UTC)
Date: Wed, 3 Jun 2020 10:26:28 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v5 0/4] introduction of migration_version attribute for
 VFIO live migration
Message-ID: <20200603102628.017e2896@x1.home>
In-Reply-To: <20200603052443.GC12300@joy-OptiPlex-7040>
References: <20200428005429.GJ12879@joy-OptiPlex-7040>
 <20200428141437.GG2794@work-vm>
 <20200429072616.GL12879@joy-OptiPlex-7040>
 <20200429082201.GA2834@work-vm>
 <20200429093555.GM12879@joy-OptiPlex-7040>
 <20200429094844.GE2834@work-vm>
 <20200430003949.GN12879@joy-OptiPlex-7040>
 <20200602165527.34137955@x1.home>
 <20200603031948.GB12300@joy-OptiPlex-7040>
 <20200602215528.7a1008f0@x1.home>
 <20200603052443.GC12300@joy-OptiPlex-7040>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=alex.williamson@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:04:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
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
Cc: Cornelia Huck <cohuck@redhat.com>, "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "Yang, Ziye" <ziye.yang@intel.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "dinechin@redhat.com" <dinechin@redhat.com>,
 "He, Shaopeng" <shaopeng.he@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Jun 2020 01:24:43 -0400
Yan Zhao <yan.y.zhao@intel.com> wrote:

> On Tue, Jun 02, 2020 at 09:55:28PM -0600, Alex Williamson wrote:
> > On Tue, 2 Jun 2020 23:19:48 -0400
> > Yan Zhao <yan.y.zhao@intel.com> wrote:
> >   
> > > On Tue, Jun 02, 2020 at 04:55:27PM -0600, Alex Williamson wrote:  
> > > > On Wed, 29 Apr 2020 20:39:50 -0400
> > > > Yan Zhao <yan.y.zhao@intel.com> wrote:
> > > >     
> > > > > On Wed, Apr 29, 2020 at 05:48:44PM +0800, Dr. David Alan Gilbert wrote:
> > > > > <snip>    
> > > > > > > > > > > > > > > > > > An mdev type is meant to define a software compatible interface, so in
> > > > > > > > > > > > > > > > > > the case of mdev->mdev migration, doesn't migrating to a different type
> > > > > > > > > > > > > > > > > > fail the most basic of compatibility tests that we expect userspace to
> > > > > > > > > > > > > > > > > > perform?  IOW, if two mdev types are migration compatible, it seems a
> > > > > > > > > > > > > > > > > > prerequisite to that is that they provide the same software interface,
> > > > > > > > > > > > > > > > > > which means they should be the same mdev type.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > In the hybrid cases of mdev->phys or phys->mdev, how does a      
> > > > > > > > > > > > > > > > > management      
> > > > > > > > > > > > > > > > > > tool begin to even guess what might be compatible?  Are we expecting
> > > > > > > > > > > > > > > > > > libvirt to probe ever device with this attribute in the system?  Is
> > > > > > > > > > > > > > > > > > there going to be a new class hierarchy created to enumerate all
> > > > > > > > > > > > > > > > > > possible migrate-able devices?
> > > > > > > > > > > > > > > > > >      
> > > > > > > > > > > > > > > > > yes, management tool needs to guess and test migration compatible
> > > > > > > > > > > > > > > > > between two devices. But I think it's not the problem only for
> > > > > > > > > > > > > > > > > mdev->phys or phys->mdev. even for mdev->mdev, management tool needs
> > > > > > > > > > > > > > > > > to
> > > > > > > > > > > > > > > > > first assume that the two mdevs have the same type of parent devices
> > > > > > > > > > > > > > > > > (e.g.their pciids are equal). otherwise, it's still enumerating
> > > > > > > > > > > > > > > > > possibilities.
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > on the other hand, for two mdevs,
> > > > > > > > > > > > > > > > > mdev1 from pdev1, its mdev_type is 1/2 of pdev1;
> > > > > > > > > > > > > > > > > mdev2 from pdev2, its mdev_type is 1/4 of pdev2;
> > > > > > > > > > > > > > > > > if pdev2 is exactly 2 times of pdev1, why not allow migration between
> > > > > > > > > > > > > > > > > mdev1 <-> mdev2.      
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > How could the manage tool figure out that 1/2 of pdev1 is equivalent 
> > > > > > > > > > > > > > > > to 1/4 of pdev2? If we really want to allow such thing happen, the best
> > > > > > > > > > > > > > > > choice is to report the same mdev type on both pdev1 and pdev2.      
> > > > > > > > > > > > > > > I think that's exactly the value of this migration_version interface.
> > > > > > > > > > > > > > > the management tool can take advantage of this interface to know if two
> > > > > > > > > > > > > > > devices are migration compatible, no matter they are mdevs, non-mdevs,
> > > > > > > > > > > > > > > or mix.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > as I know, (please correct me if not right), current libvirt still
> > > > > > > > > > > > > > > requires manually generating mdev devices, and it just duplicates src vm
> > > > > > > > > > > > > > > configuration to the target vm.
> > > > > > > > > > > > > > > for libvirt, currently it's always phys->phys and mdev->mdev (and of the
> > > > > > > > > > > > > > > same mdev type).
> > > > > > > > > > > > > > > But it does not justify that hybrid cases should not be allowed. otherwise,
> > > > > > > > > > > > > > > why do we need to introduce this migration_version interface and leave
> > > > > > > > > > > > > > > the judgement of migration compatibility to vendor driver? why not simply
> > > > > > > > > > > > > > > set the criteria to something like "pciids of parent devices are equal,
> > > > > > > > > > > > > > > and mdev types are equal" ?
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > >       
> > > > > > > > > > > > > > > > btw mdev<->phys just brings trouble to upper stack as Alex pointed out.       
> > > > > > > > > > > > > > > could you help me understand why it will bring trouble to upper stack?
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > I think it just needs to read src migration_version under src dev node,
> > > > > > > > > > > > > > > and test it in target migration version under target dev node. 
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > after all, through this interface we just help the upper layer
> > > > > > > > > > > > > > > knowing available options through reading and testing, and they decide
> > > > > > > > > > > > > > > to use it or not.
> > > > > > > > > > > > > > >       
> > > > > > > > > > > > > > > > Can we simplify the requirement by allowing only mdev<->mdev and 
> > > > > > > > > > > > > > > > phys<->phys migration? If an customer does want to migrate between a 
> > > > > > > > > > > > > > > > mdev and phys, he could wrap physical device into a wrapped mdev 
> > > > > > > > > > > > > > > > instance (with the same type as the source mdev) instead of using vendor 
> > > > > > > > > > > > > > > > ops. Doing so does add some burden but if mdev<->phys is not dominant 
> > > > > > > > > > > > > > > > usage then such tradeoff might be worthywhile...
> > > > > > > > > > > > > > > >      
> > > > > > > > > > > > > > > If the interfaces for phys<->phys and mdev<->mdev are consistent, it makes no
> > > > > > > > > > > > > > > difference to phys<->mdev, right?
> > > > > > > > > > > > > > > I think the vendor string for a mdev device is something like:
> > > > > > > > > > > > > > > "Parent PCIID + mdev type + software version", and
> > > > > > > > > > > > > > > that for a phys device is something like:
> > > > > > > > > > > > > > > "PCIID + software version".
> > > > > > > > > > > > > > > as long as we don't migrate between devices from different vendors, it's
> > > > > > > > > > > > > > > easy for vendor driver to tell if a phys device is migration compatible
> > > > > > > > > > > > > > > to a mdev device according it supports it or not.      
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > It surprises me that the PCIID matching is a requirement; I'd assumed
> > > > > > > > > > > > > > with this clever mdev name setup that you could migrate between two
> > > > > > > > > > > > > > different models in a series, or to a newer model, as long as they
> > > > > > > > > > > > > > both supported the same mdev view.
> > > > > > > > > > > > > >       
> > > > > > > > > > > > > hi Dave
> > > > > > > > > > > > > the migration_version string is transparent to userspace, and is
> > > > > > > > > > > > > completely defined by vendor driver.
> > > > > > > > > > > > > I put it there just as an example of how vendor driver may implement it.
> > > > > > > > > > > > > e.g.
> > > > > > > > > > > > > the src migration_version string is "src PCIID + src software version", 
> > > > > > > > > > > > > then when this string is write to target migration_version node,
> > > > > > > > > > > > > the vendor driver in the target device will compare it with its own
> > > > > > > > > > > > > device info and software version.
> > > > > > > > > > > > > If different models are allowed, the write just succeeds even
> > > > > > > > > > > > > PCIIDs in src and target are different.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > so, it is the vendor driver to define whether two devices are able to
> > > > > > > > > > > > > migrate, no matter their PCIIDs, mdev types, software versions..., which
> > > > > > > > > > > > > provides vendor driver full flexibility.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > do you think it's good?      
> > > > > > > > > > > > 
> > > > > > > > > > > > Yeh that's OK; I guess it's going to need to have a big table in their
> > > > > > > > > > > > with all the PCIIDs in.
> > > > > > > > > > > > The alternative would be to abstract it a little; e.g. to say it's
> > > > > > > > > > > > an Intel-gpu-core-v4  and then it would be less worried about the exact
> > > > > > > > > > > > clock speed etc - but yes you might be right htat PCIIDs might be best
> > > > > > > > > > > > for checking for quirks.
> > > > > > > > > > > >      
> > > > > > > > > > > glad that you are agreed with it:)
> > > > > > > > > > > I think the vendor driver still can choose a way to abstract a little
> > > > > > > > > > > (e.g. Intel-gpu-core-v4...) if they think it's better. In that case, the
> > > > > > > > > > > migration_string would be something like "Intel-gpu-core-v4 + instance
> > > > > > > > > > > number + software version".
> > > > > > > > > > > IOW, they can choose anything they think appropriate to identify migration
> > > > > > > > > > > compatibility of a device.
> > > > > > > > > > > But Alex is right, we have to prevent namespace overlapping. So I think
> > > > > > > > > > > we need to ensure src and target devices are from the same vendors.
> > > > > > > > > > > or, any other ideas?      
> > > > > > > > > > 
> > > > > > > > > > That's why I kept the 'Intel' in that example; or PCI vendor ID; I was      
> > > > > > > > > Yes, it's a good idea!
> > > > > > > > > could we add a line in the doc saying that
> > > > > > > > > it is the vendor driver to add a unique string to avoid namespace
> > > > > > > > > collision?      
> > > > > > > > 
> > > > > > > > So why don't we split the difference; lets say that it should start with
> > > > > > > > the hex PCI Vendor ID.
> > > > > > > >      
> > > > > > > The problem is for mdev devices, if the parent devices are not PCI devices, 
> > > > > > > they don't have PCI vendor IDs.      
> > > > > > 
> > > > > > Hmm it would be best not to invent a whole new way of giving unique
> > > > > > idenitifiers for vendors if we can.
> > > > > >       
> > > > > what about leveraging the flags in vfio device info ?
> > > > > 
> > > > > #define VFIO_DEVICE_FLAGS_RESET (1 << 0)        /* Device supports reset */
> > > > > #define VFIO_DEVICE_FLAGS_PCI   (1 << 1)        /* vfio-pci device */
> > > > > #define VFIO_DEVICE_FLAGS_PLATFORM (1 << 2)     /* vfio-platform device */
> > > > > #define VFIO_DEVICE_FLAGS_AMBA  (1 << 3)        /* vfio-amba device */
> > > > > #define VFIO_DEVICE_FLAGS_CCW   (1 << 4)        /* vfio-ccw device */
> > > > > #define VFIO_DEVICE_FLAGS_AP    (1 << 5)        /* vfio-ap device */
> > > > > 
> > > > > Then for migration_version string,
> > > > > The first 64 bits are for device type, the second 64 bits are for device id.
> > > > > e.g.
> > > > > for PCI devices, it could be
> > > > > VFIO_DEVICE_FLAGS_PCI + PCI ID.
> > > > > 
> > > > > Currently in the doc, we only define PCI devices to use PCI ID as the second
> > > > > 64 bits. In future, if other types of devices want to support migration,
> > > > > they can define their own parts of device id. e.g. use ACPI ID as the
> > > > > second 64-bit...
> > > > > 
> > > > > sounds good?    
> > > > 
> > > > [dead thread resurrection alert]
> > > > 
> > > > Not really.  We're deep into territory that we were trying to avoid.
> > > > We had previously defined the version string as opaque (not
> > > > transparent) specifically because we did not want userspace to make
> > > > assumptions about compatibility based on the content of the string.  It
> > > > was 100% left to the vendor driver to determine compatibility.  The
> > > > mdev type was the full extent of the first level filter that userspace
> > > > could use to narrow the set of potentially compatible devices.  If we
> > > > remove that due to physical device migration support, I'm not sure how
> > > > we simplify the problem for userspace.
> > > > 
> > > > We need to step away from PCI IDs and parent devices.  We're not
> > > > designing a solution that only works for PCI, there's no guarantee that
> > > > parent devices are similar or even from the same vendor.
> > > > 
> > > > Does the mdev type sufficiently solve the problem for mdev devices?  If
> > > > so, then what can we learn from it and how can we apply an equivalence
> > > > to physical devices?  For example, should a vfio bus driver (vfio-pci
> > > > or vfio-mdev) expose vfio_migration_type and vfio_migration_version
> > > > attributes under the device in sysfs where the _type provides the first
> > > > level, user transparent, matching string (ex. mdev type for mdev
> > > > devices) while the _version provides the user opaque, vendor known
> > > > compatibility test?
> > > > 
> > > > This pushes the problem out to the drivers where we can perhaps
> > > > incorporate the module name to avoid collisions.  For example Yan's
> > > > vendor extension proposal makes use of vfio-pci with extension modules
> > > > loaded via an alias incorporating the PCI vendor and device ID.  So
> > > > vfio-pci might use a type of "vfio-pci:$ALIAS".
> > > > 
> > > > It's still a bit messy that someone needs to go evaluate all these
> > > > types between devices that exist and mdev devices that might exist if
> > > > created, but I don't have any good ideas to resolve that (maybe a new
> > > > class hierarchy?).  Thanks,    
> > > 
> > > hi Alex
> > > 
> > > yes, with the same mdev_type, user still has to enumerate all parent
> > > devices and test between the supported mdev_types to know whether two mdev
> > > devices are compatible.
> > > maybe this is not a problem? in reality, it is the administrator that
> > > specifies two devices and the management tool feedbacks compatibility
> > > result. management tool is not required to pre-test and setup the
> > > compatibility map beforehand.  
> > 
> > That's exactly the purpose of this interface though is to give the
> > management tools some indication that a migration has a chance of
> > working.
> >    
> > > If so, then the only problem left is namespace collision. 
> > > given that the migration_version nodes is exported by vendor driver,
> > > maybe it can also embed its module name in the migration version string,
> > > like "i915" in "i915-GVTg_V5_8", as you suggested above.  
> > 
> > No, we've already decided that the version string is opaque, the user
> > is not to attempt to infer anything from it.  That's why I've suggested
> > another attribute in sysfs that does present type information that a
> > user can compare.  Thanks,
> > 
> > Alex
> >  
> ok. got it.
> one more thing I want to confirm is that do you think it's a necessary
> restriction that "The mdev devices are of the same type" ?
> could mdev and phys devices both expose "vfio_migration_type" and
> "vfio_migration_version" under device sysfs so that it may not be
> confined in mdev_type? (e.g. when aggregator is enabled, though two
> mdevs are of the same mdev_type, they are not actually compatible; and
> two mdevs are compatible though their mdev_type is not equal.) 
> 
> for mdev devices, we could still expose vfio_migration_version
> attribute under mdev_type for detection before mdev generated.

I tried to simplify the problem a bit, but we keep going backwards.  If
the requirement is that potentially any source device can migrate to any
target device and we cannot provide any means other than writing an
opaque source string into a version attribute on the target and
evaluating the result to determine compatibility, then we're requiring
userspace to do an exhaustive search to find a potential match.  That
sucks.  We don't have an agreed proposal for aggregation and even this
exhaustive search mechanism doesn't solve that problem, ex. the target
type may be able to support a compatible aggregation, but the user
might find after they've created the device that their aggregation was
wrong and the resulting device doesn't even match the version
compatibility of the parent type.  We're arguing our way into an
unsolvable problem and unless we can simplify it, I'm afraid there's no
solution, we're just going to have a bad interface for the user to test
compatibility, which is not really acceptable.  Thanks,

Alex


