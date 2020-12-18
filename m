Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E705C2DEBA7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 23:35:09 +0100 (CET)
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqOL6-0004cy-U7
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 17:35:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kqOJ3-0003lj-7q
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 17:33:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kqOJ0-0003qZ-On
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 17:33:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608330776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cWX0DxakktYfXQcT+Dsihrb20Gm67Mdl849fCe7x7d4=;
 b=R8RElC5fIRs/9ey0ZLYn/DF1ME37xZb0B01XyepqpX2zX/6TQIhb1kSCmwlwkkdK28USLt
 Us9crY5MsN9+q8pzq3r1qiQG6//LIU2GpTrHL0+d9Vn/vBqhY2/dBnBep1rvIzgjw/nTbI
 RRqKCdgBNZ/VxTnhPdO/eV4OHEtSYb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-md0eACusOXWpk2iwLZEWbg-1; Fri, 18 Dec 2020 17:32:54 -0500
X-MC-Unique: md0eACusOXWpk2iwLZEWbg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17333BBEE0;
 Fri, 18 Dec 2020 22:32:53 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACCB42C8FF;
 Fri, 18 Dec 2020 22:32:52 +0000 (UTC)
Date: Fri, 18 Dec 2020 17:32:50 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: QOM address space handling
Message-ID: <20201218223250.GW3140057@habkost.net>
References: <0ad53d69-ce4a-c5ea-fba4-fa19daada11c@ilande.co.uk>
 <4d4b1f60-98b6-6a41-42e7-685b2059da4c@redhat.com>
 <e3932dd6-545b-f329-f88f-e8c9694fc35e@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <e3932dd6-545b-f329-f88f-e8c9694fc35e@ilande.co.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 18, 2020 at 07:49:24AM +0000, Mark Cave-Ayland wrote:
> On 10/11/2020 11:40, Paolo Bonzini wrote:
> 
> > On 10/11/20 12:14, Mark Cave-Ayland wrote:
> > > There are 2 possible solutions here: 1) ensure QOM objects that add
> > > address spaces during instance init have a corresponding instance
> > > finalize function to remove them or 2) move the creation of address
> > > spaces from instance init to realize.
> > > 
> > > Does anyone have any arguments for which solution is preferred?
> > 
> > I slightly prefer (1) because there could be cases where you also create
> > subdevices using that address space, and in order to set properties of
> > subdevices before realize, you would have to create the subdevices in
> > instance_init as well.
> 
> As discussed on IRC, I've been testing this approach but curiously found
> that if a device init function contains address_space_init() then the
> corresponding finalize function is never called during
> device-introspect-test.
> 
> Following on from Markus' comment about there being a refcounting issue, I
> spent a few hours yesterday poking this and indeed that seems to be the
> problem here: the generation of the flatview leaks references to the address
> space MemoryRegion.
> 
> Adding a bit of debugging to object.c's init and finalize paths in this
> particular case shows that the call to address_space_init() in
> sun4u_iommu.c's iommu_init() generates 3 references between the
> IOMMUMemoryRegion (iommu-sun4u) and its device owner (sun4u-iommu) during
> flatview construction:
> 
> #0  memory_region_ref (mr=0x5555565f43b0) at ../softmmu/memory.c:1792
> #1  0x0000555555a7050d in flatview_new (mr_root=0x5555565f43b0) at
> ../softmmu/memory.c:264
> #2  0x0000555555a71d7d in generate_memory_topology (mr=0x5555565f43b0) at
> ../softmmu/memory.c:729
> #3  0x0000555555a73290 in address_space_update_topology (as=0x5555565f4358)
> at ../softmmu/memory.c:1078
> #4  0x0000555555a77f01 in address_space_init (as=0x5555565f4358,
> root=0x5555565f43b0, name=0x555555e05eb1 "iommu-as") at
> ../softmmu/memory.c:2848
> 

This one is owned by the FlatView, and should be undone by
flatview_destroy().

> #0  memory_region_ref (mr=0x55555664ffb0) at ../softmmu/memory.c:1792
> #1  0x0000555555a7063d in flatview_insert (view=0x555556609350, pos=0,
> range=0x7fffffffe0d0) at ../softmmu/memory.c:283
> #2  0x0000555555a71aad in render_memory_region (view=0x555556609350,
> mr=0x55555664ffb0, base=0, clip=..., readonly=false, nonvolatile=false) at
> ../softmmu/memory.c:662
> #3  0x0000555555a71e02 in generate_memory_topology (mr=0x55555664ffb0) at
> ../softmmu/memory.c:732
> #4  0x0000555555a73284 in address_space_update_topology (as=0x55555664ff58)
> at ../softmmu/memory.c:1078
> #5  0x0000555555a77ef5 in address_space_init (as=0x55555664ff58,
> root=0x55555664ffb0, name=0x555555e05eb1 "iommu-as") at
> ../softmmu/memory.c:284
> 

This one should also be undone by flatview_destroy().

> #0  memory_region_ref (mr=0x55555664ffb0) at ../softmmu/memory.c:1792
> #1  0x0000555555b2479b in phys_section_add (map=0x5555565f6bd0,
> section=0x7fffffffe100) at ../softmmu/physmem.c:1095
> #2  0x0000555555b24b21 in register_multipage (fv=0x555556609350,
> section=0x7fffffffe100) at ../softmmu/physmem.c:1158
> #3  0x0000555555b24eea in flatview_add_to_dispatch (fv=0x555556609350,
> section=0x7fffffffe1c0) at ../softmmu/physmem.c:1198
> #4  0x0000555555a71e86 in generate_memory_topology (mr=0x55555664ffb0) at
> ../softmmu/memory.c:742
> #5  0x0000555555a73284 in address_space_update_topology (as=0x55555664ff58)
> at ../softmmu/memory.c:1078
> #6  0x0000555555a77ef5 in address_space_init (as=0x55555664ff58,
> root=0x55555664ffb0, name=0x555555e05eb1 "iommu-as") at
> ../softmmu/memory.c:2848
> 

This one is owned by the AddressSpaceDispatch, which is owned by
the FlatView.  It should be undone by flatview_destroy() ->
address_space_dispatch_free() -> phys_sections_free() ->
phys_section_destroy().

Now, who owns the FlatView reference, exactly?

If the FlatView reference is owned by the MemoryRegion, we have a
reference loop: the device holds a reference to the MemoryRegion,
which owns the FlatView, which holds a reference to the device.
In this case, who owns the reference loop and is responsible for
breaking it?

If the FlatView reference is not owned by the MemoryRegion, who
owns it?

> Seemingly it is these references that prevent sun4u-iommu's finalize
> function from being called by the final object_unref() once
> device-introspect-test for the sun4u-iommu device is finished.
> 
> Any thoughts as to the best way to resolve this? Certainly one solution is
> to simply move address_space_init()/address_space_destroy() from
> init/finalize to realize/unrealize if Paolo's comment about needing to set
> up address spaces is no longer valid, but then in this case is it possible
> to add an assert() to prevent developers calling address_space_init() from
> an init function accidentally?

-- 
Eduardo


