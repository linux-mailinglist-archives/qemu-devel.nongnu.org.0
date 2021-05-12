Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1344B37BC34
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 14:05:39 +0200 (CEST)
Received: from localhost ([::1]:42420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgncP-0006gN-LA
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 08:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lgnZr-0005kW-9E
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lgnZo-0005tQ-Ov
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620820975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cCSROoI9mHdAXkLaXDg3z0ZlhNfMnip4pgfYPJTgM7I=;
 b=ZuMjkxDbTFqfP2hFUZSP6Y0iIxM6Pniwvb4Q1FdtoGe+GTTby9UigeLu21m+xENH3lx0Se
 S/GL9zRvlSeHvj8c41m2/f9bGuSP7tVzCjgBtckZSM7BqJlNf8UFgyahAw/ns0GeGUtyUi
 MyA/UHPeBByrykgK4oGxo6o3ttDpMco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-eF2kuAKBN6-RsDcOrNgv4Q-1; Wed, 12 May 2021 08:02:54 -0400
X-MC-Unique: eF2kuAKBN6-RsDcOrNgv4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E529D107ACF7;
 Wed, 12 May 2021 12:02:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92B125D9C0;
 Wed, 12 May 2021 12:02:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C1095113865F; Wed, 12 May 2021 14:02:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: making a qdev bus available from a (non-qtree?) device
References: <YJrKRsF4/38QheKn@apples.localdomain>
Date: Wed, 12 May 2021 14:02:50 +0200
In-Reply-To: <YJrKRsF4/38QheKn@apples.localdomain> (Klaus Jensen's message of
 "Tue, 11 May 2021 20:17:42 +0200")
Message-ID: <87im3o2m8l.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Klaus Jensen <its@irrelevant.dk> writes:

> Hi all,
>
> I need some help with grok'ing qdev busses. Stefan, Michael - David
> suggested on IRC that I CC'ed you guys since you might have solved a 
> similar issue with virtio devices. I've tried to study how that works,
> but I'm not exactly sure how to apply it to the issue I'm having.
>
> Currently, to support multiple namespaces on the emulated nvme device,
> one can do something like this:
>
>   -device nvme,id=nvme-ctrl-0,serial=foo,...
>   -device nvme-ns,id=nvme-ns-0,bus=nvme-ctrl-0,...
>   -device nvme-ns,id-nvme-ns-1,bus=nvme-ctrl-0,...
>
> The nvme device creates an 'nvme-bus' and the nvme-ns devices has
> dc->bus_type = TYPE_NVME_BUS. This all works very well and provides a 
> nice overview in `info qtree`:
>
>   bus: main-system-bus
>   type System
>     ...
>     dev: q35-pcihost, id ""
>       ..
>       bus: pcie.0
> 	type PCIE
> 	..
> 	dev: nvme, id "nvme-ctrl-0"
> 	  ..
> 	  bus: nvme-ctrl-0
> 	    type nvme-bus
> 	    dev: nvme-ns, id "nvme-ns-0"
> 	      ..
> 	    dev: nvme-ns, id "nvme-ns-1"
> 	      ..
>
>
> Nice and qdevy.
>
> We have since introduced support for NVM Subsystems through an
> nvme-subsys device. The nvme-subsys device is just a TYPE_DEVICE and 
> does not show in `info qtree`

Yes.

Most devices plug into a bus.  DeviceClass member @bus_type specifies
the type of bus they plug into, and DeviceState member @parent_bus
points to the actual BusState.  Example: PCI devices plug into a PCI
bus, and have ->bus_type = TYPE_PCI_BUS.

Some devices don't.  @bus_type and @parent_bus are NULL then.

Most buses are provided by a device.  BusState member @parent points to
the device.

The main-system-bus isn't.  Its @parent is null.

"info qtree" only shows the qtree rooted at main-system-bus.  It doesn't
show qtrees rooted at bus-less devices or device-less buses other than
main-system-bus.  I doubt such buses exist.

>                               (I wonder if this should actually just
> have been an -object?).

Does nvme-subsys expose virtual hardware to the guest?  Memory, IRQs,
...

If yes, it needs to be a device.

If no, object may be more appropriate.  Tell us more about what it does.


>                         Anyway. The nvme device has a 'subsys' link 
> parameter and we use this to manage the namespaces across the
> subsystem that may contain several nvme devices (controllers). The
> problem is that this doesnt work too well with unplugging since if the
> nvme device is `device_del`'ed, the nvme-ns devices on the nvme-bus
> are unrealized which is not what we want. We really want the
> namespaces to linger, preferably on an nvme-bus of the nvme-subsys
> device so they can be attached to other nvme devices that may show up
> (or already exist) in the subsystem.
>
> The core problem I'm having is that I can't seem to create an nvme-bus
> from the nvme-subsys device and make it available to the nvme-ns
> device on the command line:
>
>   -device nvme-subsys,id=nvme-subsys-0,...
>   -device nvme-ns,bus=nvme-subsys-0
>
> The above results in 'No 'nvme-bus' bus found for device 'nvme-ns',
> even though I do `qbus_create_inplace()` just like the nvme
> device. However, I *can* reparent the nvme-ns device in its realize()
> method, so if I instead define it like so:
>
>   -device nvme-subsys,id=nvme-subsys-0,...
>   -device nvme,id=nvme-ctrl-0,subsys=nvme-subsys-0
>   -device nvme-ns,bus=nvme-ctrl-0
>
> I can then call `qdev_set_parent_bus()` and set the parent bus to the
> bus creates in the nvme-subsys device. This solves the problem since
> the namespaces are not "garbage collected" when the nvme device is
> removed, but it just feels wrong you know? Also, if possible, I'd of
> course really like to retain the nice entries in `info qtree`.

I'm afraid I'm too ignorant on NVME to give useful advice.

Can you give us a brief primer on the aspects of physical NVME devices
you'd like to model in QEMU?  What are "controllers", "namespaces", and
"subsystems", and how do they work together?

Once we understand the relevant aspects of physical devices, we can
discuss how to best model them in QEMU.


