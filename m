Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C477636CB69
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 21:02:53 +0200 (CEST)
Received: from localhost ([::1]:45688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbSyy-0005nT-Aq
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 15:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbSx3-0004Qw-7H
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:00:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbSx0-0000p4-JL
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619550049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pV0KUM/ofRHBSaAqTWs+59GgtKE/FeBXY4mIoOsF7CI=;
 b=SNXvmTNYB0gdLLptR9Z/Bae/A9mF55x8IDx09jPUCxLLInCeyA/u39NhKTNi9ZiNCyaRSn
 Szh+vRjlcJomqfugW/NkWRkNr7dIopwtizZmMt+X+KWaoVUGpSkT8xqaWy8RYDOsOFYb7s
 d+d1+L+xTo+WdC5KlUr0KONyQZj7Ujo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-3g5eBVl0PU6YHRNaZKHCrg-1; Tue, 27 Apr 2021 15:00:47 -0400
X-MC-Unique: 3g5eBVl0PU6YHRNaZKHCrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B96781840E;
 Tue, 27 Apr 2021 19:00:46 +0000 (UTC)
Received: from work-vm (ovpn-114-253.ams2.redhat.com [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DF9719714;
 Tue, 27 Apr 2021 19:00:45 +0000 (UTC)
Date: Tue, 27 Apr 2021 20:00:42 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] make vfio and DAX cache work together
Message-ID: <YIhfWoRgJtaKZhh8@work-vm>
References: <CANsN3OTN5Q1DfhC01UGwh4nBEDXxb6=gLtWozh_oFUcc=Fd8DA@mail.gmail.com>
 <20210426152203.379dab00@redhat.com>
 <CANsN3OQ4nr=CKXd_DFUAE7CeeOsgEkBBNb5n5vmNMM3P2+t-Cg@mail.gmail.com>
 <20210427121850.68d2a8dd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210427121850.68d2a8dd@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Dev Audsin <dev.devaqemu@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alex Williamson (alex.williamson@redhat.com) wrote:
> On Tue, 27 Apr 2021 17:29:37 +0100
> Dev Audsin <dev.devaqemu@gmail.com> wrote:
> 
> > Hi Alex
> > 
> > Based on your comments and thinking a bit, wonder if it makes sense to
> > allow DMA map for the DAX cache but make unexpected mappings to be not
> > fatal. Please let me know your thoughts.
> 
> I think you're still working on the assumption that simply making the
> VM boot is an improvement, it's not.  If there's a risk that a possible
> DMA target for the device cannot be mapped, it's better that the VM
> fail to boot than to expose that risk.  Performance cannot compromise
> correctness.
> 
> We do allow DMA mappings to other device memory regions to fail
> non-fatally with the logic that peer-to-peer DMA is often not trusted
> to work by drivers and therefore support would be probed before
> assuming that it works.  I don't think that same logic applies here.
> 
> Is there something about the definition of this particular region that
> precludes it from being a DMA target for an assigned devices?

It's never really the ram that's used.
This area is really a chunk of VMA that's mmap'd over by (chunks of)
normal files in the underlying exported filesystem.  The actual RAM
block itself is just a placeholder for the VMA, and is normally mapped
PROT_NONE until an actual file is mapped on top of it.
That cache bar is a mapping containing multiple separate file chunk
mappings.

So I guess the problems for VFIO are:
  a) At the start it's unmapped, unaccessible, unallocated ram.
  b) Later it's arbitrary chunks of ondisk files.

[on a bad day, and it's bad even without vfio, someone truncates the
file mapping]

Dave

> Otherwise if it's initially unpopulated, maybe something like the
> RamDiscardManager could be used to insert DMA mappings as the region
> becomes populated.
> 
> Simply disabling mapping to boot with both features together, without
> analyzing how that missing mapping affects their interaction is not
> acceptable.  Thanks,
> 
> Alex
> 
> > On Mon, Apr 26, 2021 at 10:22 PM Alex Williamson
> > <alex.williamson@redhat.com> wrote:
> > >
> > > On Mon, 26 Apr 2021 21:50:38 +0100
> > > Dev Audsin <dev.devaqemu@gmail.com> wrote:
> > >  
> > > > Hi Alex and David
> > > >
> > > > @Alex:
> > > >
> > > > Justification on why this region cannot be a DMA target for the device,
> > > >
> > > > virtio-fs with DAX is currently not compatible with NIC Pass through.
> > > > When a SR-IOV VF attaches to a qemu process, vfio will try to pin the
> > > > entire DAX Window but it is empty when the guest boots and will fail.
> > > > A method to make VFIO and DAX to work together is to make vfio skip
> > > > DAX cache.
> > > >
> > > > Currently DAX cache need to be set to 0, for the SR-IOV VF to be
> > > > attached to Kata containers. Enabling both SR-IOV VF and DAX work
> > > > together will potentially improve performance for workloads which are
> > > > I/O and network intensive.  
> > >
> > > Sorry, there's no actual justification described here.  You're enabling
> > > a VM with both features, virtio-fs DAX and VFIO, but there's no
> > > evidence that they "work together" or that your use case is simply
> > > avoiding a scenario where the device might attempt to DMA into the area
> > > with this designation.  With this change, if the device were to attempt
> > > to DMA into this region, it would be blocked by the IOMMU, which might
> > > result in a data loss within the VM.  Justification of this change
> > > needs to prove that this region can never be a DMA target for the
> > > device, not simply that both features can be enabled and we hope that
> > > they don't interact.  Thanks,
> > >
> > > Alex
> > >  
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


