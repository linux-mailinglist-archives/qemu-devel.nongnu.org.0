Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50C03423A4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 18:48:27 +0100 (CET)
Received: from localhost ([::1]:60696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNJEY-0006Lt-EG
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 13:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1lNJDY-0005vl-Ah
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 13:47:24 -0400
Received: from zangief.bwidawsk.net ([107.170.211.233]:57168
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1lNJDW-0005Ln-3M
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 13:47:24 -0400
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id BF760122C5B; Fri, 19 Mar 2021 10:47:20 -0700 (PDT)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 5C532120011;
 Fri, 19 Mar 2021 10:47:12 -0700 (PDT)
Date: Fri, 19 Mar 2021 10:47:11 -0700
From: Ben Widawsky <ben@bwidawsk.net>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: CXL 2.0 memory device design
Message-ID: <20210319174513.zenql3qcboftahhk@mail.bwidawsk.net>
X-TUID: XkU2yTk1kNVz
References: <20210317214045.4xrwlhfvyczhxvc5@mail.bwidawsk.net>
 <20210319180705.6ede9091@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319180705.6ede9091@redhat.com>
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-03-19 18:07:05, Igor Mammedov wrote:
> On Wed, 17 Mar 2021 14:40:58 -0700
> Ben Widawsky <ben@bwidawsk.net> wrote:
> 
> > Phil, Igor, Markus
> > 
> > TL;DR: What to do about multiple capacities in a single device, and what to do
> > about interleave?
> > 
> > I've hacked together a basic CXL 2.0 implementation which exposes a CXL "Type 3"
> > memory device (CXL 2.0 Chapter 2.3). For what we were trying to do this was
> > sufficient. There are two main capabilities that CXL spec exposes which I've not
> > implemented that I'd like to start working toward and am realizing that I what I
> > have so far might not be able to carry forward to that next milestone.
> > 
> > Capability 1. A CXL memory device may have both a volatile, and a persistent
> > 	      capacity. https://bwidawsk.net/HDM_decoders.svg (lower right
> > 	      side). The current work only supports a single persistent
> > 	      capacity.
> > Capability 2. CXL topologies can be interleaved. Basic example:
> >               https://bwidawsk.net/HDM_decoders.svg (lower left side)
> > 
> > Memory regions are configured via a CXL spec defined HDM decoder. The HDM
> > decoder which is minimally implemented supports all the functionality mentioned
> > above (base, size, interleave, type, etc.). A CXL component may have up to 10
> > HDMs.
> > 
> > What I have today: https://bwidawsk.net/QEMU_objects.svg
> > There's a single memory backend device for each host bridge. That backend is
> > passed to any CXL component that is part of the hierarchy underneath that
> > hostbridge. In the case of a Type 3 device memory capacity a subregion is
> > created for that capacity from within the main backend. The device itself
> > implements the TYPE_MEMORY_DEVICE interface. This allows me to utilize the
> > existing memory region code to determine the next free address, and warn on
> > overlaps. It hopefully will help when I'm ready to support hotplug.
> 
> As was mentioned on IRC (and maybe on my first attempt to review your patches)
> 
> Backends are for managing host resource (RAM/file/fd) and its properties.
> A backend should match a corresponding device model (frontend/emulated hw, i.e. CXL type 3 device),
> the later should manage how it looks to guest.
> 
> i.e. in CXL case I'd imagine CLI adding memory look like:
> 
> -machine cxl=on \
> -device cxl-host-bridge,id=foo \
> -device cxl-rp,id=rp0,bus="foo" ]
> -object memory-backend-file,mem-path=somefile,id=mem1 \
> -device cxl-mem,backend=mem1[,bus=rp0]
> 
> if you need to add CXL memory you add pair memory-backend-file + cxl-mem
> (which practically reflects what would happen on real hw)

Conceptually this is fine with me and I agree it more accurately reflects real
hardware. The issue has been more around how to implement that model.

> 
> Sharing a single backend between several CXL devices as a means to implement
> interleaving, looks to me as abusing backend concept.
> (that's not how it's done on real hw, memory chips (backend) that belong to a CXL memory
> card are not shared with other CXL devices). It's probably address space
> that gets partitioned in small chunks to map them to one or another CXL memory dev.

Yes, it is an address space that gets partitioned. Is the recommendation then to
create a new address space for each of these regions?

> 
> I'd suggest to forget about interleaving for now and implement
> a simplified variant without it.

That's fine for me, I'm just hoping if we ever get to the point of implementing
interleave, we don't have to start entirely over.

> 
> > Where I've gotten stuck: A Memory Device expects only to have one region of
> > memory. Trying to add a second breaks pretty much everything.
> 
> Memory device has very simplistic rules to map devices in address space
> (we basically open-coded part of 'memory controller' into machine code
> to do address allocation/mapping, due to PC machine historically not having
> it implemented properly).
> 
> > I'm hoping to start the discussion about what the right way to emulate this in
> > QEMU. Ideally something upstreamable would be great. I think adding a secondary
> > (or more) capacity to a memory class device is doable, but probably not the
> > right approach.
> 
> Also earlier you mentioned that it's guest who programs where CXL memory is mapped,
> that isn't compatible with simplistic Memory device interface where guest
> has no say where memory is mapped, in Memory Device case, machine code picks
> the next free gap in fixed hotplug region and maps it there.

Right so this works currently exactly because of the design I've used so far.
The "address space" as you describe above is fixed and cannot move, only the
device addresses within that window can move. As a result, mdc->set_addr does
work for this.

I'm not proposing this is the right solution, I'm just explaining that I believe
it does work the way it's currently implemented.

> 
> So I would not use Memory Device interface in CXL case, but rather implement CXL
> own interfaces that work as spec declares. Somewhere in hierarchy there will
> be a device that manages mapping memory into address space (maybe host-bridge
> or a dedicated memory controller above it). And BIOS will program window for mapping
> as it's done on real hw.
> PS:
> I don't we hardcode in QEMU PCI device initialization, usually it's done by BIOS,
> probably the same should apply to CXL.

BIOS will not program persistent memory device capacity. It is expected to do
volatile capacity. I am doing this in QEMU as a workaround for not having a BIOS
that comprehends CXL available yet. Eventually, I'd like to not to this.

I'm fine to add a new CXL interface, but I don't have enough knowledge to figure
out how to utilize the interfaces at the highest levels. Should I just be wiring
it in to memory-device.c, if it's mdc, do old thing, if it's cdc, do new thing?
Any advice on where I need to begin hooking in the new interface would be great.

> 
> In case of secondary volatile region, I'd add the second backend to cxl device.
> 
> > For context, I've posted v3 previously. Here's a link to v4 which has some minor
> > changes as well as moving back to using subregions instead of aliases:
> > https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v4
> > 
> > Thanks.
> > Ben
> > 
> 



