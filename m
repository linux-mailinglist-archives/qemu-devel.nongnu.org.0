Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9FB3F8379
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 10:03:34 +0200 (CEST)
Received: from localhost ([::1]:37172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJAM7-0006M0-Fj
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 04:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJAKN-0005FM-3y
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 04:01:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJAK9-0005Ln-Bx
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 04:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629964877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wq6hNRAliKgP0F+g/kwqdlrA8w7e8YeFAUjZB+UB0a8=;
 b=J4cb0Wzes8PeV73yUb60yNJAvQU3bVoaHsEUb+kqtvrfQOC80mvsDIuJ6CJBGjmMX/AL5N
 86bTbHrR9ma2YE0gTo/xxZNHkkFv+uca3+ixG5WA5/H725czNdvfC+VyP+jd7mcLiuZMV9
 h//3D7bgCyKQQxngpCTahT/SUHESQq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-NDT04wWgNeKsjYZOTdhl4g-1; Thu, 26 Aug 2021 04:01:16 -0400
X-MC-Unique: NDT04wWgNeKsjYZOTdhl4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CA61801A92
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 08:01:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85D7460C13;
 Thu, 26 Aug 2021 08:01:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E28FD11380A9; Thu, 26 Aug 2021 10:01:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
References: <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net> <YSP0m83roQytqvDr@t490s>
 <20210823210703.cikdkhvyeqqypaqa@habkost.net> <YSQTwth0elaz4T8W@t490s>
 <20210823215623.bagyo3oojdpk3byj@habkost.net> <YSQp0Nh6Gs5equAG@t490s>
 <8735qxhnhn.fsf@dusky.pond.sub.org>
 <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
 <YScPg0cYYGxxTz+b@xz-m1.local>
Date: Thu, 26 Aug 2021 10:01:01 +0200
In-Reply-To: <YScPg0cYYGxxTz+b@xz-m1.local> (Peter Xu's message of "Wed, 25
 Aug 2021 23:50:27 -0400")
Message-ID: <87y28oy6rm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
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
Cc: "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> writes:

> On Wed, Aug 25, 2021 at 05:50:23PM -0400, Peter Xu wrote:
>> On Wed, Aug 25, 2021 at 02:28:55PM +0200, Markus Armbruster wrote:
>> > Having thought about this a bit more...
>> > 
>> > Constraints on realize order are nothing new.  For instance, when a
>> > device plugs into a bus, it needs to be realized after the device
>> > providing the bus.
>> > 
>> > We ensure this by having the device refer to the bus, e.g. bus=pci.0.
>> > The reference may be implicit, but it's there.  It must resolve for
>> > device creation to succeed, and if it resolves, the device providing the
>> > bus will be realized in time.
>> > 
>> > I believe what's getting us into trouble with IOMMU is not having such a
>> > reference.  Or in other words, keeping the dependence between the IOMMU
>> > and the devices relying on it *implicit*, and thus hidden from the
>> > existing realize-ordering machinery.
>
> [1]
>
>> > 
>> > Instead of inventing another such machinery, let's try to use the one we
>> > already have.
>> 
>> Hmm... I just found that we don't have such machinery, do we?
>> 
>> This does not really work:
>> 
>> $ ./qemu-system-x86_64 -M q35 -device virtio-net-pci,bus=pcie.1 \
>>                        -device pcie-root-port,id=pcie.1,bus=pcie.0
>> qemu-system-x86_64: -device virtio-net-pci,bus=pcie.1: Bus 'pcie.1' not found
>> 
>> While this will:
>> 
>> $ ./qemu-system-x86_64 -M q35 -device pcie-root-port,id=pcie.1,bus=pcie.0 \
>>                        -device virtio-net-pci,bus=pcie.1
>
> I think I fully agree at [1], the iommu is special in that it's not only
> implicit, but also does not have a default value.  Pci buses have default
> values (the root pci bus; e.g. pcie.0 on q35), so it's actually easier.

To be precise: when device property "bus" is absent, and the device
plugs into a bus, QEMU picks a suitable bus.  If it can't, device
creation fails.

It can't when no bus of the required type exists, or the existing buses
are all full.

Sometimes, the board provides a bus of the required type.  If not, you
have to plug one, and you have to do it before you refer to it, whether
the reference is explicit (bus=...) or implicit (bus absent).

Example 1: no bus of the required type

    $ qemu-system-x86_64 -S -display none -device usb-mouse
    qemu-system-x86_64: -device usb-mouse: No 'usb-bus' bus found for device 'usb-mouse'

Example 2: no bus of the required type, yet

    $ qemu-system-x86_64 -S -display none -device usb-mouse -device qemu-xhci
    qemu-system-x86_64: -device usb-mouse: No 'usb-bus' bus found for device 'usb-mouse'

Example 3: reordered to the bus is there in time

    $ qemu-system-x86_64 -S -display none -device qemu-xhci -device usb-mouse

Example 4: got a bus, but it's full

    $ qemu-system-x86_64 -S -display none -monitor stdio -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000 -device e1000,id=noslot
    QEMU 6.1.0 monitor - type 'help' for more information
    (qemu) qemu-system-x86_64: -device e1000,id=noslot: PCI: no slot/function available for e1000, all in use or reserved

> When parsing the "-device" entry for a pci device, we'll 100% sure what's the
> pci bus for the device, either specified or it's just the default.  We don't
> look at the rest of "-device"s to be sure of it.  We just try to look up the
> pci bus, if it's there we continue, otherwise we abort.

Yes.  It's a mandatory dependency, optionally explicit.

> But IOMMU is different, the device can run without a vIOMMU (in which case
> there's no dependency), but when vIOMMU is specified there's the dependency.
>
> That's why I am not sure whether the old machinery and "early failure" solution
> would work trivially for IOMMUs.

Yes.  It's an optional, implicit dependency.

> We can add an "-iommu" parameter, then we simply parse it before "-device".
> However I forgot why Marcel (IIRC) made it a "-device" parameter, also "-iommu"
> is not ideal in that the IOMMU unit is indeed implemented as a device for the
> archs I'm aware of, so it's kind of some extra glue that seems to just work
> around the ordering problem we have right now.  Meanwhile that solution won't
> help the ordering issue of pci bus/device.

The "device providing bus before device plugging into bus" dependency is
not actually a problem: -device and device_add ensure by design it's
satisfied.

As discussed before, there are two workable ways to process the command
line: strictly left to right (leave ordering to the user), and "do the
right thing" (order of options doesn't matter).

Of course, we do neither.  We kind of try to do the right thing, by
adding special cases whenever we get bitten.  Order doesn't matter,
except when it does, and things work, except when they don't.
Reordering your command line may or may not get it to work.

Fails the basic interface taste test: would explaining it in plain
English be impractical and/or embarrassing?

How to best get out of this self-dug hole isn't obvious.  Switching to
strictly left to right will break some command lines.  Making order
truly not matter looks hard, because the dependencies are complex and
not well understood.  But this isn't the problem at hand here.  It's
whether to add more magic, or do without.

I'm wary about piling more magic onto a heap of magic that's already
wobbling under its weight.

So, can we do without?

The issue, as I understand it, is that certain devices need to know at
realize time whether the machine has an IOMMU.  When you add an IOMMU
with -device, you morph the machine from one that doesn't have one into
one that does.  Therefore, it needs to be added before any of the
devices that need to know whether the machine has one.

> That's why I still think the idea of having a global priority for device
> realization (or describe the dependency of devices) makes sense.

The proposed solution is to magically reorder -device so that IOMMU get
created before devices that need to know.

This solution falls apart when we use QMP device_add instead of -device,
because we can't reorder QMP commands.

Right now we can't use device_add for everything, but that's fixable.
Maybe it's been fixed already.

To keep the proposed solution working, we'd need even more magic.

>                                                                   We can
> actually fix both IOMMU and pci bus so we can allow pci bus to be put latter
> than the pci device that belongs to the bus alongside of fixing the IOMMU.

To "fix" the bus issue, we'd need to delay resolution of property bus
until realize time.  This might break .instance_init() methods.  Of
which we have several hundred.

> IMHO a list of global priority (maybe a realize_priority field in the class of
> devices) is just a simpler version of device dependencies.  Say, at least we
> don't need to worry about cycle-dependency issues.  So far the ordering
> requirement is still simple, so globally define them should fix most of the
> issues already and in a straightforward way, also less LOCs.  If it goes
> complicated one day, we can always switch the global priority list into device
> dependency easily, because that's not guest ABI.
>
> Any further thoughts will be greatly welcomed.

I'd like to propose a more modest solution: detect the problem and fail.

A simple state machine can track "has IOMMU" state.  It has three states
"no so far", "yes", and "no", and two events "add IOMMU" and "add device
that needs to know".  State diagram:

                          no so far
                   +--- (start state) ---+
                   |                     |
         add IOMMU |                     | add device that
                   |                     |  needs to know
                   v                     v
             +--> yes                    no <--+
             |     |   add device that   |     |
             +-----+    needs to know    +-----+

"Add IOMMU" in state "no" is an error.

"Add IOMMU" in state "yes" stays in state "yes" if multiple IOMMU make
sense.  Else it's an error.

The state machine could be owned by the machine type.


