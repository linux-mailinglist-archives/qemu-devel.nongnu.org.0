Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF880A3CFA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Aug 2019 19:25:19 +0200 (CEST)
Received: from localhost ([::1]:38164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3keE-0003U0-Ag
	for lists+qemu-devel@lfdr.de; Fri, 30 Aug 2019 13:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50047)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1i3kc4-0002my-PB
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 13:23:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1i3kc0-000840-8v
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 13:23:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52298)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1i3kbu-0007lI-7a; Fri, 30 Aug 2019 13:22:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9BA31309BDA2;
 Fri, 30 Aug 2019 17:22:52 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 407EE60852;
 Fri, 30 Aug 2019 17:22:46 +0000 (UTC)
Date: Fri, 30 Aug 2019 11:22:45 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190830112245.7e98d32d@x1.home>
In-Reply-To: <979ca496-3401-0d53-e42d-8e04922ece52@redhat.com>
References: <20190829090141.21821-1-eric.auger@redhat.com>
 <20190829090141.21821-3-eric.auger@redhat.com>
 <20190829121449.5c42073e@x1.home>
 <979ca496-3401-0d53-e42d-8e04922ece52@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 30 Aug 2019 17:22:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 2/2] hw/vfio/common: Fail on VFIO/HW
 nested paging detection
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
Cc: peter.maydell@linaro.org, aik@ozlabs.ru, qemu-devel@nongnu.org,
 peterx@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Aug 2019 10:06:56 +0200
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Alex,
> 
> On 8/29/19 8:14 PM, Alex Williamson wrote:
> > On Thu, 29 Aug 2019 11:01:41 +0200
> > Eric Auger <eric.auger@redhat.com> wrote:
> >   
> >> As of today, VFIO only works along with vIOMMU supporting
> >> caching mode. The SMMUv3 does not support this mode and
> >> requires HW nested paging to work properly with VFIO.
> >>
> >> So any attempt to run a VFIO device protected by such IOMMU
> >> would prevent the assigned device from working and at the
> >> moment the guest does not even boot as the default
> >> memory_region_iommu_replay() implementation attempts to
> >> translate the whole address space and completely stalls
> >> the guest.  
> > 
> > Why doesn't this stall an x86 guest?  
> it does not stall on x86 since intel_iommu implements a custom replay
> (see vtd_iommu_replay) and you do not execute the dummy default one.
> This function performs a full page table walk, scanning all the valid
> entries and calling the MAP notifier on those. Although this operation
> is tedious it has nothing to compare against the dummy default replay
> function which calls translate() on the whole address range (on a page
> basis).

Ah right.  OTOH, what are the arguments against smmuv3 providing a
replay function?

> > I'm a bit confused about what this provides versus the flag_changed
> > notifier looking for IOMMU_NOTIFIER_MAP, which AIUI is the common
> > deficiency between VT-d w/o caching-mode and SMMUv3 w/o nested mode.
> > The iommu notifier is registered prior to calling iommu_replay, so it
> > seems we already have an opportunity to do something there.  Help me
> > understand why this is needed.  Thanks,  
> 
> At the moment the smmuv3 notify_flag_changed callback implementation
> (smmuv3_notify_flag_changed) emits a warning when it detects a MAP
> notifier gets registered:
> 
> warn_report("SMMUv3 does not support notification on MAP: "
>             "device %s will not function properly", pcidev->name);
> 
> and then the replay gets executed, looping forever.
> 
> I could exit instead of emitting a warning but the drawback is that on
> vfio hotplug, it will also exit whereas we would rather simply reject
> the hotplug.

There are solutions to the above by modifying the existing framework
rather than creating a parallel solution though.  For instance, could
memory_region_register_iommu_notifier() reject the notifier if the flag
change is incompatible, allowing the fault to propagate back to vfio
and taking a similar exit path as provided here.
 
> I think the solution based on the IOMMU MR attribute handles both the
> static and hotplug solutions. Also looking further, I will need this
> IOMMU MR attribute for 2stage SMMU integration (see [RFC v5 14/29]
> vfio: Force nested if iommu requires it). I know that it is standing
> for a while and it is still hypothetical but setting up 2stage will
> require specific treatments in the vfio common.c code, opt-in the
> 2stage mode, register specific iommu mr notifiers. Using the IOMMU MR
> attribute allows me to detect which kind of VFIO/IOMMU integration I
> need to setup.

Hmm, I'm certainly more on board with that use case.  I guess the
question is whether the problem statement presented here justifies what
seems to be a parallel solution to what we have today, or could have
with some enhancements.  Thanks,

Alex

> >>
> >> So let's fail on that case.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>
> >> ---
> >>
> >> v3 -> v4:
> >> - use IOMMU_ATTR_HW_NESTED_PAGING
> >> - do not abort anymore but jump to fail
> >> ---
> >>  hw/vfio/common.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >> index 3e03c495d8..e8c009d019 100644
> >> --- a/hw/vfio/common.c
> >> +++ b/hw/vfio/common.c
> >> @@ -606,9 +606,19 @@ static void
> >> vfio_listener_region_add(MemoryListener *listener, if
> >> (memory_region_is_iommu(section->mr)) { VFIOGuestIOMMU *giommu;
> >>          IOMMUMemoryRegion *iommu_mr =
> >> IOMMU_MEMORY_REGION(section->mr);
> >> +        bool nested;
> >>          int iommu_idx;
> >>  
> >>          trace_vfio_listener_region_add_iommu(iova, end);
> >> +
> >> +        if (!memory_region_iommu_get_attr(iommu_mr,
> >> +
> >> IOMMU_ATTR_NEED_HW_NESTED_PAGING,
> >> +                                          (void *)&nested) &&
> >> nested) {
> >> +            error_report("VFIO/vIOMMU integration based on HW
> >> nested paging "
> >> +                         "is not yet supported");
> >> +            ret = -EINVAL;
> >> +            goto fail;
> >> +        }
> >>          /*
> >>           * FIXME: For VFIO iommu types which have KVM
> >> acceleration to
> >>           * avoid bouncing all map/unmaps through qemu this way,
> >> this  
> > 
> >   


