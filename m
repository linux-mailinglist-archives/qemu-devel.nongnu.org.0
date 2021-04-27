Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B29336CB09
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 20:20:13 +0200 (CEST)
Received: from localhost ([::1]:45994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbSJg-0000LD-7l
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 14:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lbSIU-0008L9-3v
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lbSIR-0002Ce-Sv
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619547534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XxAx4+Co4gpb6yc9/uCSKs+FhAWitsEsc+O1M+1QUig=;
 b=YZw4T6fOUYZ9SKWIIFeWB0hvHujfwlIo2pA7rAoE75pAMKDx/MC+nLQxIGoetOHe8z7Ia7
 YiWIUdne2wFT/Lf2ohIo2uVZdmH6YqqjK28gmpo9w6phUtNnk/6t0WPZjRW2NQx9qbN51+
 rJYquMR9bkhU8xe3r64cemkgmULfG7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-63UbI8_UOJ-6UaE-J9lFXA-1; Tue, 27 Apr 2021 14:18:52 -0400
X-MC-Unique: 63UbI8_UOJ-6UaE-J9lFXA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 866211898299;
 Tue, 27 Apr 2021 18:18:51 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 385DE6060F;
 Tue, 27 Apr 2021 18:18:51 +0000 (UTC)
Date: Tue, 27 Apr 2021 12:18:50 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Dev Audsin <dev.devaqemu@gmail.com>
Subject: Re: [PATCH] make vfio and DAX cache work together
Message-ID: <20210427121850.68d2a8dd@redhat.com>
In-Reply-To: <CANsN3OQ4nr=CKXd_DFUAE7CeeOsgEkBBNb5n5vmNMM3P2+t-Cg@mail.gmail.com>
References: <CANsN3OTN5Q1DfhC01UGwh4nBEDXxb6=gLtWozh_oFUcc=Fd8DA@mail.gmail.com>
 <20210426152203.379dab00@redhat.com>
 <CANsN3OQ4nr=CKXd_DFUAE7CeeOsgEkBBNb5n5vmNMM3P2+t-Cg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Apr 2021 17:29:37 +0100
Dev Audsin <dev.devaqemu@gmail.com> wrote:

> Hi Alex
> 
> Based on your comments and thinking a bit, wonder if it makes sense to
> allow DMA map for the DAX cache but make unexpected mappings to be not
> fatal. Please let me know your thoughts.

I think you're still working on the assumption that simply making the
VM boot is an improvement, it's not.  If there's a risk that a possible
DMA target for the device cannot be mapped, it's better that the VM
fail to boot than to expose that risk.  Performance cannot compromise
correctness.

We do allow DMA mappings to other device memory regions to fail
non-fatally with the logic that peer-to-peer DMA is often not trusted
to work by drivers and therefore support would be probed before
assuming that it works.  I don't think that same logic applies here.

Is there something about the definition of this particular region that
precludes it from being a DMA target for an assigned devices?

Otherwise if it's initially unpopulated, maybe something like the
RamDiscardManager could be used to insert DMA mappings as the region
becomes populated.

Simply disabling mapping to boot with both features together, without
analyzing how that missing mapping affects their interaction is not
acceptable.  Thanks,

Alex

> On Mon, Apr 26, 2021 at 10:22 PM Alex Williamson
> <alex.williamson@redhat.com> wrote:
> >
> > On Mon, 26 Apr 2021 21:50:38 +0100
> > Dev Audsin <dev.devaqemu@gmail.com> wrote:
> >  
> > > Hi Alex and David
> > >
> > > @Alex:
> > >
> > > Justification on why this region cannot be a DMA target for the device,
> > >
> > > virtio-fs with DAX is currently not compatible with NIC Pass through.
> > > When a SR-IOV VF attaches to a qemu process, vfio will try to pin the
> > > entire DAX Window but it is empty when the guest boots and will fail.
> > > A method to make VFIO and DAX to work together is to make vfio skip
> > > DAX cache.
> > >
> > > Currently DAX cache need to be set to 0, for the SR-IOV VF to be
> > > attached to Kata containers. Enabling both SR-IOV VF and DAX work
> > > together will potentially improve performance for workloads which are
> > > I/O and network intensive.  
> >
> > Sorry, there's no actual justification described here.  You're enabling
> > a VM with both features, virtio-fs DAX and VFIO, but there's no
> > evidence that they "work together" or that your use case is simply
> > avoiding a scenario where the device might attempt to DMA into the area
> > with this designation.  With this change, if the device were to attempt
> > to DMA into this region, it would be blocked by the IOMMU, which might
> > result in a data loss within the VM.  Justification of this change
> > needs to prove that this region can never be a DMA target for the
> > device, not simply that both features can be enabled and we hope that
> > they don't interact.  Thanks,
> >
> > Alex
> >  
> 


