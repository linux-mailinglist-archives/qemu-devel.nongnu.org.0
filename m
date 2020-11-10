Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBEC2AD227
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 10:11:40 +0100 (CET)
Received: from localhost ([::1]:56130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcPgi-0005nM-1u
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 04:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcPfv-0005Mq-Dp
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:10:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcPft-0003lR-7A
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604999448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rK0MUXq6Dtt1nuLrklZfRi2vT7uZ4oFftHQ9pE7j84o=;
 b=QtwDu+SCHdTQTabe3fNQ93loooxkNRe4NwwPaDe/S5v00ZqShRbvHikkwOCFM9XjRRQZ/F
 CSzELyQe2gCDHhf3f3iA9C3uXhGotWIQv6z//A4osZzl3tbOKlobAFo918u+M6GVb0q3c9
 kRrSho0Y+W8QtfxEtBthk/KHB6NDbfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-jYFDmTYgOLW8XWCuPXqZhw-1; Tue, 10 Nov 2020 04:10:45 -0500
X-MC-Unique: jYFDmTYgOLW8XWCuPXqZhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D82218CB720;
 Tue, 10 Nov 2020 09:10:44 +0000 (UTC)
Received: from work-vm (ovpn-115-49.ams2.redhat.com [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D003875135;
 Tue, 10 Nov 2020 09:10:39 +0000 (UTC)
Date: Tue, 10 Nov 2020 09:10:37 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC PATCH for-QEMU-5.2] vfio: Make migration support experimental
Message-ID: <20201110091037.GA3108@work-vm>
References: <160494787833.1473.10514376876696596117.stgit@gimli.home>
 <20201109194417.GR3024@work-vm> <20201109132950.6c2dfe02@w520.home>
MIME-Version: 1.0
In-Reply-To: <20201109132950.6c2dfe02@w520.home>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Neo Jia <cjia@nvidia.com>, Juan Quintela <quintela@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alex Williamson (alex.williamson@redhat.com) wrote:
> On Mon, 9 Nov 2020 19:44:17 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Alex Williamson (alex.williamson@redhat.com) wrote:
> > > Per the proposed documentation for vfio device migration:
> > > 
> > >   Dirty pages are tracked when device is in stop-and-copy phase
> > >   because if pages are marked dirty during pre-copy phase and
> > >   content is transfered from source to destination, there is no
> > >   way to know newly dirtied pages from the point they were copied
> > >   earlier until device stops. To avoid repeated copy of same
> > >   content, pinned pages are marked dirty only during
> > >   stop-and-copy phase.
> > > 
> > > Essentially, since we don't have hardware dirty page tracking for
> > > assigned devices at this point, we consider any page that is pinned
> > > by an mdev vendor driver or pinned and mapped through the IOMMU to
> > > be perpetually dirty.  In the worst case, this may result in all of
> > > guest memory being considered dirty during every iteration of live
> > > migration.  The current vfio implementation of migration has chosen
> > > to mask device dirtied pages until the final stages of migration in
> > > order to avoid this worst case scenario.
> > > 
> > > Allowing the device to implement a policy decision to prioritize
> > > reduced migration data like this jeopardizes QEMU's overall ability
> > > to implement any degree of service level guarantees during migration.
> > > For example, any estimates towards achieving acceptable downtime
> > > margins cannot be trusted when such a device is present.  The vfio
> > > device should participate in dirty page tracking to the best of its
> > > ability throughout migration, even if that means the dirty footprint
> > > of the device impedes migration progress, allowing both QEMU and
> > > higher level management tools to decide whether to continue the
> > > migration or abort due to failure to achieve the desired behavior.  
> > 
> > I don't feel particularly badly about the decision to squash it in
> > during the stop-and-copy phase; for devices where the pinned memory
> > is large, I don't think doing it during the main phase makes much sense;
> > especially if you then have to deal with tracking changes in pinning.
> 
> 
> AFAIK the kernel support for tracking changes in page pinning already
> exists, this is largely the vfio device in QEMU that decides when to
> start exposing the device dirty footprint to QEMU.  I'm a bit surprised
> by this answer though, we don't really know what the device memory
> footprint is.  It might be large, it might be nothing, but by not
> participating in dirty page tracking until the VM is stopped, we can't
> know what the footprint is and how it will affect downtime.  Is it
> really the place of a QEMU device driver to impose this sort of policy?

If it could actually track changes then I'd agree we shouldn't impose
any policy; but if it's just marking the whole area as dirty we're going
to need a bodge somewhere; this bodge doesn't look any worse than the
others to me.

> 
> > Having said that, I agree with marking it as experimental, because
> > I'm dubious how useful it will be for the same reason, I worry
> > about whether the downtime will be so large to make it pointless.
> 
> 
> TBH I think that's the wrong reason to mark it experimental.  There's
> clearly demand for vfio device migration and even if the practical use
> cases are initially small, they will expand over time and hardware will
> get better.  My objection is that the current behavior masks the
> hardware and device limitations, leading to unrealistic expectations.
> If the user expects minimal downtime, configures convergence to account
> for that, QEMU thinks it can achieve it, and then the device marks
> everything dirty, that's not supportable. 

Yes, agreed.

> OTOH if the vfio device
> participates in dirty tracking through pre-copy, then the practical use
> cases will find themselves as migrations will either be aborted because
> downtime tolerances cannot be achieved or downtimes will be configured
> to match reality.  Thanks,

Without a way to prioritise the unpinned memory during that period,
we're going to be repeatedly sending the pinned memory which is going to
lead to a much larger bandwidth usage that required; so that's going in
completely the wrong direction and also wrong from the point of view of
the user.

Dave

> 
> Alex
> 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > > Link: https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg00807.html
> > > Cc: Kirti Wankhede <kwankhede@nvidia.com>
> > > Cc: Neo Jia <cjia@nvidia.com>
> > > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > Cc: Juan Quintela <quintela@redhat.com>
> > > Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > Cc: Cornelia Huck <cohuck@redhat.com>
> > > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> > > ---
> > > 
> > > Given that our discussion in the link above seems to be going in
> > > circles, I'm afraid it seems necessary to both have a contigency
> > > plan and to raise the visibility of the current behavior to
> > > determine whether others agree that this is a sufficiently
> > > troubling behavior to consider migration support experimental
> > > at this stage.  Please voice your opinion or contribute patches
> > > to resolve this before QEMU 5.2.  Thanks,
> > > 
> > > Alex
> > > 
> > >  hw/vfio/migration.c           |    2 +-
> > >  hw/vfio/pci.c                 |    2 ++
> > >  include/hw/vfio/vfio-common.h |    1 +
> > >  3 files changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> > > index 3ce285ea395d..cd44d465a50b 100644
> > > --- a/hw/vfio/migration.c
> > > +++ b/hw/vfio/migration.c
> > > @@ -882,7 +882,7 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
> > >      Error *local_err = NULL;
> > >      int ret = -ENOTSUP;
> > >  
> > > -    if (!container->dirty_pages_supported) {
> > > +    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
> > >          goto add_blocker;
> > >      }
> > >  
> > > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > > index 58c0ce8971e3..1349b900e513 100644
> > > --- a/hw/vfio/pci.c
> > > +++ b/hw/vfio/pci.c
> > > @@ -3194,6 +3194,8 @@ static Property vfio_pci_dev_properties[] = {
> > >                      VFIO_FEATURE_ENABLE_REQ_BIT, true),
> > >      DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
> > >                      VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
> > > +    DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
> > > +                     vbasedev.enable_migration, false),
> > >      DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap, false),
> > >      DEFINE_PROP_BOOL("x-balloon-allowed", VFIOPCIDevice,
> > >                       vbasedev.ram_block_discard_allowed, false),
> > > diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> > > index baeb4dcff102..2119872c8af1 100644
> > > --- a/include/hw/vfio/vfio-common.h
> > > +++ b/include/hw/vfio/vfio-common.h
> > > @@ -123,6 +123,7 @@ typedef struct VFIODevice {
> > >      bool needs_reset;
> > >      bool no_mmap;
> > >      bool ram_block_discard_allowed;
> > > +    bool enable_migration;
> > >      VFIODeviceOps *ops;
> > >      unsigned int num_irqs;
> > >      unsigned int num_regions;
> > >   
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


