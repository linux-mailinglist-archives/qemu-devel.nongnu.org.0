Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55BC3422D6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 18:09:00 +0100 (CET)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNIcO-0004Qp-0K
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 13:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lNIal-0003ND-8d
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 13:07:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lNIai-0006qL-GE
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 13:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616173634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFPLfspLySboLHEll0+K4sHaOAdRNI+16o74aVZRbuI=;
 b=dVvJJr1gdXTngTDZn/Np2Aj3CrTIlqym3FcnNOixzb/6sEujqVIJqS8qFf5WUDGeMYJyRB
 sGRN3AI2OYrUua5+P7WiIVKXpLTMe5pvigGg0b7UePU29x0ILeHmw+mnS9lZgRcdvaurvP
 Stc4dtymT/JSGPjn3LPEFdCR7Z35QcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-Uyqrbin5Ns6bcCbV8RL2FA-1; Fri, 19 Mar 2021 13:07:11 -0400
X-MC-Unique: Uyqrbin5Ns6bcCbV8RL2FA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16727801817;
 Fri, 19 Mar 2021 17:07:10 +0000 (UTC)
Received: from localhost (unknown [10.40.208.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54ECA5D6D5;
 Fri, 19 Mar 2021 17:07:08 +0000 (UTC)
Date: Fri, 19 Mar 2021 18:07:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ben Widawsky <ben@bwidawsk.net>
Subject: Re: CXL 2.0 memory device design
Message-ID: <20210319180705.6ede9091@redhat.com>
In-Reply-To: <20210317214045.4xrwlhfvyczhxvc5@mail.bwidawsk.net>
References: <20210317214045.4xrwlhfvyczhxvc5@mail.bwidawsk.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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

On Wed, 17 Mar 2021 14:40:58 -0700
Ben Widawsky <ben@bwidawsk.net> wrote:

> Phil, Igor, Markus
> 
> TL;DR: What to do about multiple capacities in a single device, and what to do
> about interleave?
> 
> I've hacked together a basic CXL 2.0 implementation which exposes a CXL "Type 3"
> memory device (CXL 2.0 Chapter 2.3). For what we were trying to do this was
> sufficient. There are two main capabilities that CXL spec exposes which I've not
> implemented that I'd like to start working toward and am realizing that I what I
> have so far might not be able to carry forward to that next milestone.
> 
> Capability 1. A CXL memory device may have both a volatile, and a persistent
> 	      capacity. https://bwidawsk.net/HDM_decoders.svg (lower right
> 	      side). The current work only supports a single persistent
> 	      capacity.
> Capability 2. CXL topologies can be interleaved. Basic example:
>               https://bwidawsk.net/HDM_decoders.svg (lower left side)
> 
> Memory regions are configured via a CXL spec defined HDM decoder. The HDM
> decoder which is minimally implemented supports all the functionality mentioned
> above (base, size, interleave, type, etc.). A CXL component may have up to 10
> HDMs.
> 
> What I have today: https://bwidawsk.net/QEMU_objects.svg
> There's a single memory backend device for each host bridge. That backend is
> passed to any CXL component that is part of the hierarchy underneath that
> hostbridge. In the case of a Type 3 device memory capacity a subregion is
> created for that capacity from within the main backend. The device itself
> implements the TYPE_MEMORY_DEVICE interface. This allows me to utilize the
> existing memory region code to determine the next free address, and warn on
> overlaps. It hopefully will help when I'm ready to support hotplug.

As was mentioned on IRC (and maybe on my first attempt to review your patches)

Backends are for managing host resource (RAM/file/fd) and its properties.
A backend should match a corresponding device model (frontend/emulated hw, i.e. CXL type 3 device),
the later should manage how it looks to guest.

i.e. in CXL case I'd imagine CLI adding memory look like:

-machine cxl=on \
-device cxl-host-bridge,id=foo \
-device cxl-rp,id=rp0,bus="foo" ]
-object memory-backend-file,mem-path=somefile,id=mem1 \
-device cxl-mem,backend=mem1[,bus=rp0]

if you need to add CXL memory you add pair memory-backend-file + cxl-mem
(which practically reflects what would happen on real hw)

Sharing a single backend between several CXL devices as a means to implement
interleaving, looks to me as abusing backend concept.
(that's not how it's done on real hw, memory chips (backend) that belong to a CXL memory
card are not shared with other CXL devices). It's probably address space
that gets partitioned in small chunks to map them to one or another CXL memory dev.

I'd suggest to forget about interleaving for now and implement
a simplified variant without it.

> Where I've gotten stuck: A Memory Device expects only to have one region of
> memory. Trying to add a second breaks pretty much everything.

Memory device has very simplistic rules to map devices in address space
(we basically open-coded part of 'memory controller' into machine code
to do address allocation/mapping, due to PC machine historically not having
it implemented properly).

> I'm hoping to start the discussion about what the right way to emulate this in
> QEMU. Ideally something upstreamable would be great. I think adding a secondary
> (or more) capacity to a memory class device is doable, but probably not the
> right approach.

Also earlier you mentioned that it's guest who programs where CXL memory is mapped,
that isn't compatible with simplistic Memory device interface where guest
has no say where memory is mapped, in Memory Device case, machine code picks
the next free gap in fixed hotplug region and maps it there.

So I would not use Memory Device interface in CXL case, but rather implement CXL
own interfaces that work as spec declares. Somewhere in hierarchy there will
be a device that manages mapping memory into address space (maybe host-bridge
or a dedicated memory controller above it). And BIOS will program window for mapping
as it's done on real hw.
PS:
I don't we hardcode in QEMU PCI device initialization, usually it's done by BIOS,
probably the same should apply to CXL.

In case of secondary volatile region, I'd add the second backend to cxl device.

> For context, I've posted v3 previously. Here's a link to v4 which has some minor
> changes as well as moving back to using subregions instead of aliases:
> https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v4
> 
> Thanks.
> Ben
> 


