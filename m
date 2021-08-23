Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAE53F5319
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 23:57:48 +0200 (CEST)
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIHwx-0006Cr-QI
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 17:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIHwF-0005YT-JT
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 17:57:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIHwE-0002ux-2l
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 17:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629755821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NUMDRcpQBFc9zVlWLALkhn88+VbIC6BLOhglU+lFK5A=;
 b=GoKfxsprlE8xa/BvJSWlipq5ezXArW+t3Fr7uzI5sqPApCQMhJuS/7pamCIofHMum8payk
 TiRV+JmOG8hRtelYu3roe9UgBMRFQQmhJN9Vjis6sMMv1lIeuciWnQvett9qJPnCFmRoiD
 9S7eLJ3lwM9xcOm3W73zrd5RKqlVCd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-9039II9tMfOsIggoeBA1kg-1; Mon, 23 Aug 2021 17:56:59 -0400
X-MC-Unique: 9039II9tMfOsIggoeBA1kg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AC3E8799EC
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 21:56:59 +0000 (UTC)
Received: from localhost (unknown [10.22.32.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC55A60854;
 Mon, 23 Aug 2021 21:56:23 +0000 (UTC)
Date: Mon, 23 Aug 2021 17:56:23 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <20210823215623.bagyo3oojdpk3byj@habkost.net>
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net>
 <YSP0m83roQytqvDr@t490s>
 <20210823210703.cikdkhvyeqqypaqa@habkost.net>
 <YSQTwth0elaz4T8W@t490s>
MIME-Version: 1.0
In-Reply-To: <YSQTwth0elaz4T8W@t490s>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
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

On Mon, Aug 23, 2021 at 05:31:46PM -0400, Peter Xu wrote:
> On Mon, Aug 23, 2021 at 05:07:03PM -0400, Eduardo Habkost wrote:
> > To give just one example:
> > 
> > $ (echo 'info pci';echo quit;) | qemu-system-x86_64 -device virtio-net-pci -device e1000e -monitor stdio | tail -n 20
> >   Bus  0, device   4, function 0:
> >     Ethernet controller: PCI device 1af4:1000
> >       PCI subsystem 1af4:0001
> >       IRQ 0, pin A
> >       BAR0: I/O at 0xffffffffffffffff [0x001e].
> >       BAR1: 32 bit memory at 0xffffffffffffffff [0x00000ffe].
> >       BAR4: 64 bit prefetchable memory at 0xffffffffffffffff [0x00003ffe].
> >       BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
> >       id ""
> >   Bus  0, device   5, function 0:
> >     Ethernet controller: PCI device 8086:10d3
> >       PCI subsystem 8086:0000
> >       IRQ 0, pin A
> >       BAR0: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
> >       BAR1: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
> >       BAR2: I/O at 0xffffffffffffffff [0x001e].
> >       BAR3: 32 bit memory at 0xffffffffffffffff [0x00003ffe].
> >       BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
> >       id ""
> > (qemu) quit
> > $ (echo 'info pci';echo quit;) | qemu-system-x86_64 -device e1000e -device virtio-net-pci -monitor stdio | tail -n 20
> >   Bus  0, device   4, function 0:
> >     Ethernet controller: PCI device 8086:10d3
> >       PCI subsystem 8086:0000
> >       IRQ 0, pin A
> >       BAR0: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
> >       BAR1: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
> >       BAR2: I/O at 0xffffffffffffffff [0x001e].
> >       BAR3: 32 bit memory at 0xffffffffffffffff [0x00003ffe].
> >       BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
> >       id ""
> >   Bus  0, device   5, function 0:
> >     Ethernet controller: PCI device 1af4:1000
> >       PCI subsystem 1af4:0001
> >       IRQ 0, pin A
> >       BAR0: I/O at 0xffffffffffffffff [0x001e].
> >       BAR1: 32 bit memory at 0xffffffffffffffff [0x00000ffe].
> >       BAR4: 64 bit prefetchable memory at 0xffffffffffffffff [0x00003ffe].
> >       BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
> >       id ""
> > (qemu) quit
> > 
> > 
> > If the order of the -device arguments changes, the devices are assigned to
> > different PCI slots.
> 
> Thanks for the example.
> 
> Initially I thought about this and didn't think it an issue (because serious
> users will always specify addr=XXX for -device; I thought libvirt always does
> that), but I do remember that guest OS could identify its hardware config with
> devfn number, so nmcli may mess up its config with before/after this change
> indeed..
> 
> I can use a custom sort to replace qsort() to guarantee that.
> 
> Do you have other examples in mind that I may have overlooked, especially I may
> not be able to fix by a custom sort with only moving priority>=1 devices?

I don't have any other example, but I assume address assignment
based on ordering is a common pattern in device code.

I would take a very close and careful look at the devices with
non-default vmsd priority.  If you can prove that the 13 device
types with non-default priority are all order-insensitive, a
custom sort function as you describe might be safe.

-- 
Eduardo


