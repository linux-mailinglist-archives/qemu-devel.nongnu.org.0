Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ED938C0CF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 09:35:20 +0200 (CEST)
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljzgl-0006jU-JZ
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 03:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljzfZ-0005uP-L6
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:34:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljzfS-00025W-QF
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621582437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MyMXJOORGvU6R+Qf0gvwVeCqIZi/t9wJOHJ1ercKz/o=;
 b=D+bR4kxL/Y21RFwqVSB0klHpaWtdNPODZik4/ZlYYYZqlLdbOaLEFIX8V7iySBNFeuHg0v
 OC6CM6xLMZjPApk/hU27+i3OQw4KMDYDxrTC/QaqVClcZAwUwsTZbyzwrD5ROFzLPLNyha
 PaETIx96Lhn0okzlZ8BydCMNM9V8kJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-FW7uZtpYNLu4CWhplw9pNQ-1; Fri, 21 May 2021 03:33:55 -0400
X-MC-Unique: FW7uZtpYNLu4CWhplw9pNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADA57106BB2A;
 Fri, 21 May 2021 07:33:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D56291349A;
 Fri, 21 May 2021 07:33:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 51D90113865F; Fri, 21 May 2021 09:33:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: making a qdev bus available from a (non-qtree?) device
References: <YJrKRsF4/38QheKn@apples.localdomain>
 <87im3o2m8l.fsf@dusky.pond.sub.org>
 <YKIQsI4F49R4hEmd@apples.localdomain>
Date: Fri, 21 May 2021 09:33:46 +0200
In-Reply-To: <YKIQsI4F49R4hEmd@apples.localdomain> (Klaus Jensen's message of
 "Mon, 17 May 2021 08:44:00 +0200")
Message-ID: <878s48pmlh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, stefanha@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm about to drop off for two weeks of much-needed vacation.  I meant to
study your explanation and give design advice before I leave, but I'm
out of time.  Regrettable.  I hope Stefan can help you.  Or perhaps
Paolo.  If you still have questions when I'm back, feel free to contact
me again.

Klaus Jensen <its@irrelevant.dk> writes:

> On May 12 14:02, Markus Armbruster wrote:
>>Klaus Jensen <its@irrelevant.dk> writes:
>>
>>> Hi all,
>>>
>>> I need some help with grok'ing qdev busses. Stefan, Michael - David
>>> suggested on IRC that I CC'ed you guys since you might have solved a
>>> similar issue with virtio devices. I've tried to study how that works,
>>> but I'm not exactly sure how to apply it to the issue I'm having.
>>>
>>> Currently, to support multiple namespaces on the emulated nvme device,
>>> one can do something like this:
>>>
>>>   -device nvme,id=nvme-ctrl-0,serial=foo,...
>>>   -device nvme-ns,id=nvme-ns-0,bus=nvme-ctrl-0,...
>>>   -device nvme-ns,id-nvme-ns-1,bus=nvme-ctrl-0,...
>>>
>>> The nvme device creates an 'nvme-bus' and the nvme-ns devices has
>>> dc->bus_type = TYPE_NVME_BUS. This all works very well and provides a
>>> nice overview in `info qtree`:
>>>
>>>   bus: main-system-bus
>>>   type System
>>>     ...
>>>     dev: q35-pcihost, id ""
>>>       ..
>>>       bus: pcie.0
>>> 	type PCIE
>>> 	..
>>> 	dev: nvme, id "nvme-ctrl-0"
>>> 	  ..
>>> 	  bus: nvme-ctrl-0
>>> 	    type nvme-bus
>>> 	    dev: nvme-ns, id "nvme-ns-0"
>>> 	      ..
>>> 	    dev: nvme-ns, id "nvme-ns-1"
>>> 	      ..
>>>
>>>
>>> Nice and qdevy.
>>>
>>> We have since introduced support for NVM Subsystems through an
>>> nvme-subsys device. The nvme-subsys device is just a TYPE_DEVICE and
>>> does not show in `info qtree`
>>
>>Yes.
>>
>>Most devices plug into a bus.  DeviceClass member @bus_type specifies
>>the type of bus they plug into, and DeviceState member @parent_bus
>>points to the actual BusState.  Example: PCI devices plug into a PCI
>>bus, and have ->bus_type = TYPE_PCI_BUS.
>>
>>Some devices don't.  @bus_type and @parent_bus are NULL then.
>>
>>Most buses are provided by a device.  BusState member @parent points to
>>the device.
>>
>>The main-system-bus isn't.  Its @parent is null.
>>
>>"info qtree" only shows the qtree rooted at main-system-bus.  It doesn't
>>show qtrees rooted at bus-less devices or device-less buses other than
>>main-system-bus.  I doubt such buses exist.
>>
>
> Makes sense.
>
>>>                               (I wonder if this should actually just
>>> have been an -object?).
>>
>>Does nvme-subsys expose virtual hardware to the guest?  Memory, IRQs,
>>...
>>
>>If yes, it needs to be a device.
>>
>>If no, object may be more appropriate.  Tell us more about what it does.
>>
>
> It does not expose any virtual hardware. See below.
>
>>
>>>                         Anyway. The nvme device has a 'subsys' link
>>> parameter and we use this to manage the namespaces across the
>>> subsystem that may contain several nvme devices (controllers). The
>>> problem is that this doesnt work too well with unplugging since if the
>>> nvme device is `device_del`'ed, the nvme-ns devices on the nvme-bus
>>> are unrealized which is not what we want. We really want the
>>> namespaces to linger, preferably on an nvme-bus of the nvme-subsys
>>> device so they can be attached to other nvme devices that may show up
>>> (or already exist) in the subsystem.
>>>
>>> The core problem I'm having is that I can't seem to create an nvme-bus
>>> from the nvme-subsys device and make it available to the nvme-ns
>>> device on the command line:
>>>
>>>   -device nvme-subsys,id=nvme-subsys-0,...
>>>   -device nvme-ns,bus=nvme-subsys-0
>>>
>>> The above results in 'No 'nvme-bus' bus found for device 'nvme-ns',
>>> even though I do `qbus_create_inplace()` just like the nvme
>>> device. However, I *can* reparent the nvme-ns device in its realize()
>>> method, so if I instead define it like so:
>>>
>>>   -device nvme-subsys,id=nvme-subsys-0,...
>>>   -device nvme,id=nvme-ctrl-0,subsys=nvme-subsys-0
>>>   -device nvme-ns,bus=nvme-ctrl-0
>>>
>>> I can then call `qdev_set_parent_bus()` and set the parent bus to the
>>> bus creates in the nvme-subsys device. This solves the problem since
>>> the namespaces are not "garbage collected" when the nvme device is
>>> removed, but it just feels wrong you know? Also, if possible, I'd of
>>> course really like to retain the nice entries in `info qtree`.
>>
>>I'm afraid I'm too ignorant on NVME to give useful advice.
>>
>>Can you give us a brief primer on the aspects of physical NVME devices
>>you'd like to model in QEMU?  What are "controllers", "namespaces", and
>>"subsystems", and how do they work together?
>>
>>Once we understand the relevant aspects of physical devices, we can
>>discuss how to best model them in QEMU.
>>
>
> An "NVM Subsystem" is basically just a term to talk about a collection
> of controllers and namespaces. A namespace is just a quantity of 
> non-volatile memory that the controller can use to store stuff on.
>
> Only the controller is a piece of virtual hardware. An example
> subsystem looks like this:
>
>
>           +------------------+     +-----------------+
>           |   controller A   |     |   controller B  |
>           +------------------+     +-----------------+
>           +--------++--------+     +--------++-------+
>           | NSID 1 || NSID 2 |     | NSID 3 | NSID 2 |
>           +--------++--------+     +--------++-------+
>           +--------+    |          +--------+    |
>           |  NS A  |    |          |  NS C  |    |
>           +--------+    |          +--------+    |
>                         |                        |
>                         +------------------------+
>                                      |
>                                  +--------+
>                                  |  NS B  |
>                                  +--------+
>
>
> This is the example in Figure 5 in the NVMe v1.4 specification. Here,
> we have two controllers (that we model with the 'nvme' pci-based
> device). Each controller has one "private" namespace (NS A and NS C)
> and shares one namespace (NS B). The namespace IDs are unique across
> the subsystem and are assigned by the controller when attached to a
> namespace.
>
> We use the 'nvme-ns' device (TYPE_DEVICE) to model the namespaces, and
> I guess this should could also just have been an -object, not sure if
> we can change that now. The 'nvme-ns' device mostly exist to hold the
> block backend configuration and related namespace only
> parameters. Prior to the introduction of subsystem, while we could
> have multiple controllers on the PCI bus, they could not share
> namespaces. To support this we introduced the 'nvme-subsys' device to
> allow the namespaces to be shared. This support is considered
> experimental, so I think we can get away with changing this to be an
> object.
>
> As I explained in my first mail, we attach namespaces to controllers
> through a bus. This means that even in the absence of an explicit 
> "bus=..." parameter on the nvme-ns device, it will "connect" on the
> most recently defined "nvme-bus" (of the most recently defined
> controller). With subsystems we would also like to model "unattached"
> namespaces that exists solely in the subsystem (i.e. NOT attached to
> any controllers). That is why I was trying to get the nvme-ns devices
> to attach to a bus created by the "non-bus-attached" subsystem
> device. And that is what I can't do. We could add a link property to
> the nvme-ns device instead, but then the bus magic in qemu would still
> happen and the namespace would end up "attached" (in qemu terms) to a
> controller anyway - and it would complain if we defined the namespace
> device prior to defining any controller devices since no usable bus
> exist.
>
> Thanks for helping out with this!


