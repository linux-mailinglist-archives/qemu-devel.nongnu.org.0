Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779A7355B0A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 20:13:44 +0200 (CEST)
Received: from localhost ([::1]:41790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTqCt-0008EG-4O
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 14:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lTqBJ-0007Xy-M1
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 14:12:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lTqB9-0006GK-Lf
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 14:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617732713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3eoCtf/rZMCSv/gP01seOWgAV4/lNvLbaGvufNf6sjc=;
 b=SVtnPWlncNV9cAQ4+pArFGoq6GWY1AO64fOp2BWZWTbzgQ/K+NXxSRTU/L+j0sUQ3IXnLL
 3SYP425MLMu32AuXJ82iPxTXEh9NUWdFlVSaggPrAv/SYUVEQ7lgfpqTqroge4TY+KXjZJ
 npx5hKIhGROEFXkwI9WqEss1mmAmnlE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-2TaKlarQOEK1v_1ahfO44g-1; Tue, 06 Apr 2021 14:11:49 -0400
X-MC-Unique: 2TaKlarQOEK1v_1ahfO44g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E262107ACCA;
 Tue,  6 Apr 2021 18:11:47 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94EAB5D743;
 Tue,  6 Apr 2021 18:11:45 +0000 (UTC)
Date: Tue, 6 Apr 2021 20:11:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ben Widawsky <ben@bwidawsk.net>
Subject: Re: CXL 2.0 memory device design
Message-ID: <20210406201143.667e1b63@redhat.com>
In-Reply-To: <20210319174513.zenql3qcboftahhk@mail.bwidawsk.net>
References: <20210317214045.4xrwlhfvyczhxvc5@mail.bwidawsk.net>
 <20210319180705.6ede9091@redhat.com>
 <20210319174513.zenql3qcboftahhk@mail.bwidawsk.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, Dan Williams <dan.j.williams@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Mar 2021 10:47:11 -0700
Ben Widawsky <ben@bwidawsk.net> wrote:

> On 21-03-19 18:07:05, Igor Mammedov wrote:
> > On Wed, 17 Mar 2021 14:40:58 -0700
> > Ben Widawsky <ben@bwidawsk.net> wrote:
> >   
> > > Phil, Igor, Markus
> > > 
> > > TL;DR: What to do about multiple capacities in a single device, and what to do
> > > about interleave?
> > > 
> > > I've hacked together a basic CXL 2.0 implementation which exposes a CXL "Type 3"
> > > memory device (CXL 2.0 Chapter 2.3). For what we were trying to do this was
> > > sufficient. There are two main capabilities that CXL spec exposes which I've not
> > > implemented that I'd like to start working toward and am realizing that I what I
> > > have so far might not be able to carry forward to that next milestone.
> > > 
> > > Capability 1. A CXL memory device may have both a volatile, and a persistent
> > > 	      capacity. https://bwidawsk.net/HDM_decoders.svg (lower right
> > > 	      side). The current work only supports a single persistent
> > > 	      capacity.
> > > Capability 2. CXL topologies can be interleaved. Basic example:
> > >               https://bwidawsk.net/HDM_decoders.svg (lower left side)
> > > 
> > > Memory regions are configured via a CXL spec defined HDM decoder. The HDM
> > > decoder which is minimally implemented supports all the functionality mentioned
> > > above (base, size, interleave, type, etc.). A CXL component may have up to 10
> > > HDMs.
> > > 
> > > What I have today: https://bwidawsk.net/QEMU_objects.svg
> > > There's a single memory backend device for each host bridge. That backend is
> > > passed to any CXL component that is part of the hierarchy underneath that
> > > hostbridge. In the case of a Type 3 device memory capacity a subregion is
> > > created for that capacity from within the main backend. The device itself
> > > implements the TYPE_MEMORY_DEVICE interface. This allows me to utilize the
> > > existing memory region code to determine the next free address, and warn on
> > > overlaps. It hopefully will help when I'm ready to support hotplug.  
> > 
> > As was mentioned on IRC (and maybe on my first attempt to review your patches)
> > 
> > Backends are for managing host resource (RAM/file/fd) and its properties.
> > A backend should match a corresponding device model (frontend/emulated hw, i.e. CXL type 3 device),
> > the later should manage how it looks to guest.
> > 
> > i.e. in CXL case I'd imagine CLI adding memory look like:
> > 
> > -machine cxl=on \
> > -device cxl-host-bridge,id=foo \
> > -device cxl-rp,id=rp0,bus="foo" ]
> > -object memory-backend-file,mem-path=somefile,id=mem1 \
> > -device cxl-mem,backend=mem1[,bus=rp0]
> > 
> > if you need to add CXL memory you add pair memory-backend-file + cxl-mem
> > (which practically reflects what would happen on real hw)  
> 
> Conceptually this is fine with me and I agree it more accurately reflects real
> hardware. The issue has been more around how to implement that model.
> 
> > 
> > Sharing a single backend between several CXL devices as a means to implement
> > interleaving, looks to me as abusing backend concept.
> > (that's not how it's done on real hw, memory chips (backend) that belong to a CXL memory
> > card are not shared with other CXL devices). It's probably address space
> > that gets partitioned in small chunks to map them to one or another CXL memory dev.  
> 
> Yes, it is an address space that gets partitioned. Is the recommendation then to
> create a new address space for each of these regions?
> 
> > 
> > I'd suggest to forget about interleaving for now and implement
> > a simplified variant without it.  
> 
> That's fine for me, I'm just hoping if we ever get to the point of implementing
> interleave, we don't have to start entirely over.
> 
> >   
> > > Where I've gotten stuck: A Memory Device expects only to have one region of
> > > memory. Trying to add a second breaks pretty much everything.  
> > 
> > Memory device has very simplistic rules to map devices in address space
> > (we basically open-coded part of 'memory controller' into machine code
> > to do address allocation/mapping, due to PC machine historically not having
> > it implemented properly).
> >   
> > > I'm hoping to start the discussion about what the right way to emulate this in
> > > QEMU. Ideally something upstreamable would be great. I think adding a secondary
> > > (or more) capacity to a memory class device is doable, but probably not the
> > > right approach.  
> > 
> > Also earlier you mentioned that it's guest who programs where CXL memory is mapped,
> > that isn't compatible with simplistic Memory device interface where guest
> > has no say where memory is mapped, in Memory Device case, machine code picks
> > the next free gap in fixed hotplug region and maps it there.  
> 
> Right so this works currently exactly because of the design I've used so far.
> The "address space" as you describe above is fixed and cannot move, only the
> device addresses within that window can move. As a result, mdc->set_addr does
> work for this.
> 
> I'm not proposing this is the right solution, I'm just explaining that I believe
> it does work the way it's currently implemented.
> 
> > 
> > So I would not use Memory Device interface in CXL case, but rather implement CXL
> > own interfaces that work as spec declares. Somewhere in hierarchy there will
> > be a device that manages mapping memory into address space (maybe host-bridge
> > or a dedicated memory controller above it). And BIOS will program window for mapping
> > as it's done on real hw.
> > PS:
> > I don't we hardcode in QEMU PCI device initialization, usually it's done by BIOS,
> > probably the same should apply to CXL.  
> 
> BIOS will not program persistent memory device capacity. It is expected to do
> volatile capacity. I am doing this in QEMU as a workaround for not having a BIOS
> that comprehends CXL available yet. Eventually, I'd like to not to this.
> 
> I'm fine to add a new CXL interface, but I don't have enough knowledge to figure
> out how to utilize the interfaces at the highest levels. Should I just be wiring
> it in to memory-device.c, if it's mdc, do old thing, if it's cdc, do new thing?
> Any advice on where I need to begin hooking in the new interface would be great.

I'd try to mimic what we do for PCI devices.
More exactly, make BIOS enumerate and assign GPA to CXL devices
SeaBIOS could be used for POC, basically mimic what it does for PCI devices
enumeration and BAR assignment, just use CXL provided interfaces (guest visible side)
to map CXL memory at some free addresses.

In that case you probably won't need to worry about implementing some kind of
memory controller on QEMU side (guest will decide where memory should be mapped).
And on QEMU side you should be able reuse PCI BAR interfaces to map memory.

For reference see: 
SeaBIOS: src/fw/pciinit.c 
QEMU: pci_update_mappings() - place where QEMU maps BARs into address space


> 
> > 
> > In case of secondary volatile region, I'd add the second backend to cxl device.
> >   
> > > For context, I've posted v3 previously. Here's a link to v4 which has some minor
> > > changes as well as moving back to using subregions instead of aliases:
> > > https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v4
> > > 
> > > Thanks.
> > > Ben
> > >   
> >   
> 
> 


