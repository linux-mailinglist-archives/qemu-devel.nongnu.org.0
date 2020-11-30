Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD452C8A77
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 18:09:24 +0100 (CET)
Received: from localhost ([::1]:46670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmfz-0006WL-8V
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 12:09:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1kjmeJ-0005Sy-K0
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:07:39 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:36424
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1kjmeH-0007qP-Ul
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:07:39 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id 8820E122C68; Mon, 30 Nov 2020 09:07:35 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 060F3122C3F;
 Mon, 30 Nov 2020 09:07:31 -0800 (PST)
Date: Mon, 30 Nov 2020 09:07:30 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH 18/25] hw/cxl/device: Add a memory device (8.2.8.5)
Message-ID: <20201130170730.o5fkrpaubwcroz4y@mail.bwidawsk.net>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-19-ben.widawsky@intel.com>
 <b2d95e72-51d9-72d2-b340-aefb00928a76@redhat.com>
 <87d00hk89c.fsf@dusky.pond.sub.org>
 <20201125165333.zn5tpwfjnwmjmcdu@intel.com>
 <87360w39qw.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87360w39qw.fsf@dusky.pond.sub.org>
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.398,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20-11-26 07:36:23, Markus Armbruster wrote:
> Ben Widawsky <ben.widawsky@intel.com> writes:
> 
> > On 20-11-13 08:47:59, Markus Armbruster wrote:
> >> Eric Blake <eblake@redhat.com> writes:
> >> 
> >> > On 11/10/20 11:47 PM, Ben Widawsky wrote:
> >> >> A CXL memory device (AKA Type 3) is a CXL component that contains some
> >> >> combination of volatile and persistent memory. It also implements the
> >> >> previously defined mailbox interface as well as the memory device
> >> >> firmware interface.
> >> >> 
> >> >> The following example will create a 256M device in a 512M window:
> >> >> 
> >> >> -object "memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M"
> >> >> -device "cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M"
> >> >> 
> >> >> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> >> >> ---
> >> >
> >> >> +++ b/qapi/machine.json
> >> >> @@ -1394,6 +1394,7 @@
> >> >>  { 'union': 'MemoryDeviceInfo',
> >> >>    'data': { 'dimm': 'PCDIMMDeviceInfo',
> >> >>              'nvdimm': 'PCDIMMDeviceInfo',
> >> >> +            'cxl': 'PCDIMMDeviceInfo',
> >> >>              'virtio-pmem': 'VirtioPMEMDeviceInfo',
> >> >>              'virtio-mem': 'VirtioMEMDeviceInfo'
> >> >>            }
> >> >
> >> > Missing documentation of the new data type, and the fact that it will be
> >> > introduced in 6.0.
> >> 
> >> Old wish list item: improve the QAPI schema frontend to flag this.
> >> 
> >
> > "Introduced in 6.0" - quite the optimist. Kidding aside, this is the area where
> > I could use some feedback. CXL Type 3 memory devices can contain both volatile
> > and persistent memory at the same time. As such, I think I'll need a new type to
> > represent that, but I'd love to know how best to accomplish that.
> 
> We can help.  Tell us what information you want to provide in variant
> 'cxl'.  If it's a superset of an existing variant, give us just the
> delta.
> 

I'm not exactly sure what the best way to do this is in QEMU, so I'm not really
sure what to specify as the delta. A CXL memory device can have both volatile
and persistent memory. Currently when a CXL memory device implements the
TYPE_MEMORY_DEVICE interface. So I believe the shortest path is a
MemoryDeviceInfo that can have two memory devices associated with it, but I
don't know if that's the best path.


> >> >                     Also, Markus has been trying to get rid of so-called
> >> > "simple unions" in favor of "flat unions" - every time we modify an
> >> > existing simple union, it is worth asking if it is time to first flatten
> >> > this.
> >> 
> >> 0. Simple unions can be transformed into flat unions.  The
> >> transformation can either preserve the nested wire format, or flatten
> >> it.  See docs/devel/qapi-code-gen.txt "A simple union can always be
> >> re-written as a flat union ..."
> >> 
> >> 1. No new simple unions.
> >> 
> >> 2. Existing simple unions that can be flattened without breaking
> >> backward compatibility have long been flattened.
> >> 
> >> 3. The remaining simple unions are part of QMP, where we need to
> >> preserve the wire format.  We could turn them into flat union preserving
> >> the wire format.  Only worthwhile if we kill simple unions and simplify
> >> scripts/qapi/.  Opportunity to make the flat union syntax less
> >> cumbersome.  Not done due to lack of time.
> >> 
> >> 4. Kevin and I have been experimenting with ways to provide both flat
> >> and nested wire format.  This would pave the way for orderly deprecation
> >> of the nested wire format.  May not be practical for QMP output.
> >> 
> >
> > So is there anything for me to do here?
> 
> No.  Extending an existing simple union is okay.
> 
> We should not add news ones.  We should think twice before we add new
> uses of existing ones.
> 
> 

