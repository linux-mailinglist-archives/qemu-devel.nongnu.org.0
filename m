Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977FD2ADA4C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:23:42 +0100 (CET)
Received: from localhost ([::1]:51274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVUj-0001Hu-KT
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kcVSB-0007R5-Tb
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:21:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kcVS6-0005kK-ML
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605021656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BaFJxJU0QPMLxx2ykuBQwQBI1n9Y+JErL+jjOkQe/vc=;
 b=LhC2/MJKT7gvfjCajXAjnvA2oHjE36KaZY4kqpfwyowqPc48BLtJousQhXcz337i6h3PN2
 /WAOG8UxLqf0cZpM+ax8MYANruh7fRuDMUEBrC7ESwG4+zx+nbyUI+UIy9itbpDtNk0lrO
 zACjwsJ1hcy/ypAjUgc5aZUYfm2S/KE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-hOEQ49uSN5GG8C1RRF7GxQ-1; Tue, 10 Nov 2020 10:20:52 -0500
X-MC-Unique: hOEQ49uSN5GG8C1RRF7GxQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 393471084C92;
 Tue, 10 Nov 2020 15:20:51 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F5E421E98;
 Tue, 10 Nov 2020 15:20:50 +0000 (UTC)
Date: Tue, 10 Nov 2020 08:20:50 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [RFC PATCH for-QEMU-5.2] vfio: Make migration support experimental
Message-ID: <20201110082050.10ca74d4@w520.home>
In-Reply-To: <898ba98f-9967-f3b3-737c-2d18b0281b51@nvidia.com>
References: <160494787833.1473.10514376876696596117.stgit@gimli.home>
 <20201109194417.GR3024@work-vm> <20201109132950.6c2dfe02@w520.home>
 <20201110091037.GA3108@work-vm>
 <898ba98f-9967-f3b3-737c-2d18b0281b51@nvidia.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
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
Cc: Malcolm Crossley <mcrossley@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Dheeraj Nigam <dnigam@nvidia.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 19:46:20 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> On 11/10/2020 2:40 PM, Dr. David Alan Gilbert wrote:
> > * Alex Williamson (alex.williamson@redhat.com) wrote:  
> >> On Mon, 9 Nov 2020 19:44:17 +0000
> >> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> >>  
> >>> * Alex Williamson (alex.williamson@redhat.com) wrote:  
> >>>> Per the proposed documentation for vfio device migration:
> >>>>
> >>>>    Dirty pages are tracked when device is in stop-and-copy phase
> >>>>    because if pages are marked dirty during pre-copy phase and
> >>>>    content is transfered from source to destination, there is no
> >>>>    way to know newly dirtied pages from the point they were copied
> >>>>    earlier until device stops. To avoid repeated copy of same
> >>>>    content, pinned pages are marked dirty only during
> >>>>    stop-and-copy phase.
> >>>>
> >>>> Essentially, since we don't have hardware dirty page tracking for
> >>>> assigned devices at this point, we consider any page that is pinned
> >>>> by an mdev vendor driver or pinned and mapped through the IOMMU to
> >>>> be perpetually dirty.  In the worst case, this may result in all of
> >>>> guest memory being considered dirty during every iteration of live
> >>>> migration.  The current vfio implementation of migration has chosen
> >>>> to mask device dirtied pages until the final stages of migration in
> >>>> order to avoid this worst case scenario.
> >>>>
> >>>> Allowing the device to implement a policy decision to prioritize
> >>>> reduced migration data like this jeopardizes QEMU's overall ability
> >>>> to implement any degree of service level guarantees during migration.
> >>>> For example, any estimates towards achieving acceptable downtime
> >>>> margins cannot be trusted when such a device is present.  The vfio
> >>>> device should participate in dirty page tracking to the best of its
> >>>> ability throughout migration, even if that means the dirty footprint
> >>>> of the device impedes migration progress, allowing both QEMU and
> >>>> higher level management tools to decide whether to continue the
> >>>> migration or abort due to failure to achieve the desired behavior.  
> >>>
> >>> I don't feel particularly badly about the decision to squash it in
> >>> during the stop-and-copy phase; for devices where the pinned memory
> >>> is large, I don't think doing it during the main phase makes much sense;
> >>> especially if you then have to deal with tracking changes in pinning.  
> >>
> >>
> >> AFAIK the kernel support for tracking changes in page pinning already
> >> exists, this is largely the vfio device in QEMU that decides when to
> >> start exposing the device dirty footprint to QEMU.  I'm a bit surprised
> >> by this answer though, we don't really know what the device memory
> >> footprint is.  It might be large, it might be nothing, but by not
> >> participating in dirty page tracking until the VM is stopped, we can't
> >> know what the footprint is and how it will affect downtime.  Is it
> >> really the place of a QEMU device driver to impose this sort of policy?  
> > 
> > If it could actually track changes then I'd agree we shouldn't impose
> > any policy; but if it's just marking the whole area as dirty we're going
> > to need a bodge somewhere; this bodge doesn't look any worse than the
> > others to me.
> >   
> >>  
> >>> Having said that, I agree with marking it as experimental, because
> >>> I'm dubious how useful it will be for the same reason, I worry
> >>> about whether the downtime will be so large to make it pointless.  
> >>  
> 
> Not all device state is large, for example NIC might only report 
> currently mapped RX buffers which usually not more than a 1GB and could 
> be as low as 10's of MB. GPU might or might not have large data, that 
> depends on its use cases.


Right, it's only if we have a vendor driver that doesn't pin any memory
when dirty tracking is enabled and we're running without a viommu that
we would expect all of guest memory to be continuously dirty.


> >> TBH I think that's the wrong reason to mark it experimental.  There's
> >> clearly demand for vfio device migration and even if the practical use
> >> cases are initially small, they will expand over time and hardware will
> >> get better.  My objection is that the current behavior masks the
> >> hardware and device limitations, leading to unrealistic expectations.
> >> If the user expects minimal downtime, configures convergence to account
> >> for that, QEMU thinks it can achieve it, and then the device marks
> >> everything dirty, that's not supportable.  
> > 
> > Yes, agreed.  
> 
> Yes, there is demand for vfio device migration and many devices owners 
> started scoping and development for migration support.
> Instead of making whole migration support as experimental, we can have 
> opt-in option to decide to mark sys mem pages dirty during iterative 
> phase (pre-copy phase) of migration.


Per my previous suggestion, I'd think an opt-out would be more
appropriate, ie. implementing pre-copy dirty page tracking by default.


> >> OTOH if the vfio device
> >> participates in dirty tracking through pre-copy, then the practical use
> >> cases will find themselves as migrations will either be aborted because
> >> downtime tolerances cannot be achieved or downtimes will be configured
> >> to match reality.  Thanks,  
> > 
> > Without a way to prioritise the unpinned memory during that period,
> > we're going to be repeatedly sending the pinned memory which is going to
> > lead to a much larger bandwidth usage that required; so that's going in
> > completely the wrong direction and also wrong from the point of view of
> > the user.


Who decides which is the wrong direction for the user?  If the user
wants minimal bandwidth regardless of downtime, can't they create a
procedure to pause the VM, do the migration, then resume?  Are there
already migration tunables to effectively achieve this?  If a user
attempts to do a "live" migration, isn't our priority then shifted to
managing the downtime constraints over the bandwidth?  IOW the policy
decision is implied by the user actions and configuration of the
migration, I don't think that at the device level we should be guessing
which feature to prioritize, just like a vCPU doesn't to stop marking
dirty pages during pre-copy because it's touching too much memory.
Higher level policies and configurations should determine inflection
points... imo.  Thanks,

Alex


