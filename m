Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3414F341127
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 00:43:48 +0100 (CET)
Received: from localhost ([::1]:49112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN2It-0006TB-9j
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 19:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1lN2H8-0005cV-UQ
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 19:41:58 -0400
Received: from zangief.bwidawsk.net ([107.170.211.233]:51754
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1lN2H6-0006O0-V5
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 19:41:58 -0400
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id 22785122DF1; Thu, 18 Mar 2021 16:41:54 -0700 (PDT)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 50314120011;
 Thu, 18 Mar 2021 16:41:48 -0700 (PDT)
Date: Thu, 18 Mar 2021 16:41:47 -0700
From: Ben Widawsky <ben@bwidawsk.net>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Subject: Re: CXL 2.0 memory device design
Message-ID: <20210318233903.btckyz4e6b7srj3g@mail.bwidawsk.net>
X-TUID: DXEZgoo3vqCe
References: <20210317214045.4xrwlhfvyczhxvc5@mail.bwidawsk.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317214045.4xrwlhfvyczhxvc5@mail.bwidawsk.net>
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
Cc: Dan Williams <dan.j.williams@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-03-17 14:40:58, Ben Widawsky wrote:
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
> 
> Where I've gotten stuck: A Memory Device expects only to have one region of
> memory. Trying to add a second breaks pretty much everything.
> 
> I'm hoping to start the discussion about what the right way to emulate this in
> QEMU. Ideally something upstreamable would be great. I think adding a secondary
> (or more) capacity to a memory class device is doable, but probably not the
> right approach.
> 
> For context, I've posted v3 previously. Here's a link to v4 which has some minor
> changes as well as moving back to using subregions instead of aliases:
> https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v4
> 
> Thanks.
> Ben
> 

Hello.

I spent some time thinking a bit about this. Right now a have a CXL type 3
memory device which implements TYPE_MEMORY_DEVICE interface. Perhaps the easiest
solution would be to have that same device which doesn't implement
TYPE_MEMORY_DEVICE, but does object_initialize_child_with_props() a TYPE_PC_DIMM
and a TYPE_NVDIMM kind of thing. In the current design, those would be
subclassed (or simply rewritten) to not have their own memory backend, and carve
out from the main memory backend as I describe above.

Thanks. I'm looking forward to hearing some feedback or other suggestions.
Ben

