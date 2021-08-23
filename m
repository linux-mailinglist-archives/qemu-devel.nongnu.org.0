Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21633F5290
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 23:08:48 +0200 (CEST)
Received: from localhost ([::1]:38980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIHBS-0004Pf-GY
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 17:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIHAB-0003jY-DX
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 17:07:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIHA8-0003Of-Ke
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 17:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629752839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7IBb07NriOGq6JzvpIGVRx3aPA/MhN/PnS+soZCiBE0=;
 b=K4rj2v7pFh2worpByYs7Gu9Jz8cn+bCwY1dIsj1XVNyaoQPozdLW40LNmMCJgSRtu3r33N
 n98U1zeFN92Lri992TOb+W/teqZZtrozWstNAYuP7WwiAbN8yXEWmrU7TnE6oaOdqlLa1i
 erKVa8bLcGkt1MyLw+ajauOvIhUUSo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-qETqTHveNV6turS4-d242Q-1; Mon, 23 Aug 2021 17:07:18 -0400
X-MC-Unique: qETqTHveNV6turS4-d242Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 824B687180C
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 21:07:17 +0000 (UTC)
Received: from localhost (unknown [10.22.32.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74F6C18436;
 Mon, 23 Aug 2021 21:07:04 +0000 (UTC)
Date: Mon, 23 Aug 2021 17:07:03 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <20210823210703.cikdkhvyeqqypaqa@habkost.net>
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net>
 <YSP0m83roQytqvDr@t490s>
MIME-Version: 1.0
In-Reply-To: <YSP0m83roQytqvDr@t490s>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 03:18:51PM -0400, Peter Xu wrote:
> On Mon, Aug 23, 2021 at 02:49:12PM -0400, Eduardo Habkost wrote:
> > On Wed, Aug 18, 2021 at 03:43:18PM -0400, Peter Xu wrote:
> > > QEMU creates -device objects in order as specified by the user's cmdline.
> > > However that ordering may not be the ideal order.  For example, some platform
> > > devices (vIOMMUs) may want to be created earlier than most of the rest
> > > devices (e.g., vfio-pci, virtio).
> > > 
> > > This patch orders the QemuOptsList of '-device's so they'll be sorted first
> > > before kicking off the device realizations.  This will allow the device
> > > realization code to be able to use APIs like pci_device_iommu_address_space()
> > > correctly, because those functions rely on the platfrom devices being realized.
> > > 
> > > Now we rely on vmsd->priority which is defined as MigrationPriority to provide
> > > the ordering, as either VM init and migration completes will need such an
> > > ordering.  In the future we can move that priority information out of vmsd.
> > > 
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > 
> > Can we be 100% sure that changing the ordering of every single
> > device being created won't affect guest ABI?  (I don't think we can)
> 
> That's a good question, however I doubt whether there's any real-world guest
> ABI for that.  As a developer, I normally specify cmdline parameter in an adhoc
> way, so that I assume most parameters are not sensitive to ordering and I can
> tune the ordering as wish.  I'm not sure whether that's common for qemu users,
> I would expect so, but I may have missed something that I'm not aware of.

To give just one example:

$ (echo 'info pci';echo quit;) | qemu-system-x86_64 -device virtio-net-pci -device e1000e -monitor stdio | tail -n 20
  Bus  0, device   4, function 0:
    Ethernet controller: PCI device 1af4:1000
      PCI subsystem 1af4:0001
      IRQ 0, pin A
      BAR0: I/O at 0xffffffffffffffff [0x001e].
      BAR1: 32 bit memory at 0xffffffffffffffff [0x00000ffe].
      BAR4: 64 bit prefetchable memory at 0xffffffffffffffff [0x00003ffe].
      BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
      id ""
  Bus  0, device   5, function 0:
    Ethernet controller: PCI device 8086:10d3
      PCI subsystem 8086:0000
      IRQ 0, pin A
      BAR0: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
      BAR1: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
      BAR2: I/O at 0xffffffffffffffff [0x001e].
      BAR3: 32 bit memory at 0xffffffffffffffff [0x00003ffe].
      BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
      id ""
(qemu) quit
$ (echo 'info pci';echo quit;) | qemu-system-x86_64 -device e1000e -device virtio-net-pci -monitor stdio | tail -n 20
  Bus  0, device   4, function 0:
    Ethernet controller: PCI device 8086:10d3
      PCI subsystem 8086:0000
      IRQ 0, pin A
      BAR0: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
      BAR1: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
      BAR2: I/O at 0xffffffffffffffff [0x001e].
      BAR3: 32 bit memory at 0xffffffffffffffff [0x00003ffe].
      BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
      id ""
  Bus  0, device   5, function 0:
    Ethernet controller: PCI device 1af4:1000
      PCI subsystem 1af4:0001
      IRQ 0, pin A
      BAR0: I/O at 0xffffffffffffffff [0x001e].
      BAR1: 32 bit memory at 0xffffffffffffffff [0x00000ffe].
      BAR4: 64 bit prefetchable memory at 0xffffffffffffffff [0x00003ffe].
      BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
      id ""
(qemu) quit


If the order of the -device arguments changes, the devices are assigned to
different PCI slots.


> 
> Per my knowledge the only "guest ABI" change is e.g. when we specify "vfio-pci"
> to be before "intel-iommu": it'll be constantly broken before this patchset,
> while after this series it'll be working.  It's just that I don't think those
> "guest ABI" is necessary to be kept, and that's exactly what I want to fix with
> the patchset..

If the only ordering changes caused by this patch were intentional and affected
only configurations that are known to be broken (like vfio-pci vs intel-iommu),
I would agree.

However, if we are reordering every single -device option in an unspecified way
(like qsort() does when elements compare as equal), we are probably breaking
guest ABI and creating a completely different machine (like in the PCI example above).


> 
> > 
> > How many device types in QEMU have non-default vmsd priority?
> 
> Not so much; here's the list of priorities and the devices using it:
> 
>        |--------------------+---------|
>        | priority           | devices |
>        |--------------------+---------|
>        | MIG_PRI_IOMMU      |       3 |
>        | MIG_PRI_PCI_BUS    |       7 |
>        | MIG_PRI_VIRTIO_MEM |       1 |
>        | MIG_PRI_GICV3_ITS  |       1 |
>        | MIG_PRI_GICV3      |       1 |
>        |--------------------+---------|
> 
> All the rest devices are using the default (0) priority.
> 
> > 
> > Can we at least ensure devices with the same priority won't be
> > reordered, just to be safe?  (qsort() doesn't guarantee that)
> > 
> > If very few device types have non-default vmsd priority and
> > devices with the same priority aren't reordered, the risk of
> > compatibility breakage would be much smaller.
> 
> I'm also wondering whether it's a good thing to break some guest ABI due to
> this change, if possible.
> 
> Let's imagine something breaks after applied, then the only reason should be
> that qsort() changed the order of some same-priority devices and it's not the
> same as user specified any more.  Then, does it also means there's yet another
> ordering requirement that we didn't even notice?

Does the PCI slot assignment example above demonstrate a ordering requirement?
I don't think it does.  It just demonstrates that different orderings are
expected to give different results, but both orderings are valid.


> 
> I doubt whether that'll even happen (or I think there'll be report already, as
> in qemu man page there's no requirement on parameter ordering).  In all cases,
> instead of "keeping the same priority devices in the same order as the user has
> specified", IMHO we should make the broken devices to have different priorities
> so the ordering will be guaranteed by qemu internal, rather than how user
> specified it.
> 
> From that pov, maybe this patchset would be great if it can be accepted and
> applied in early stage of a release? So we can figure out what's missing and
> fix them within the same release.  However again I still doubt whether there's
> any user that will break in a bad way.
> 
> Thanks,
> 
> -- 
> Peter Xu
> 

-- 
Eduardo


