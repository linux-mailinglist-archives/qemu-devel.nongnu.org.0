Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582CA423BD1
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 12:56:02 +0200 (CEST)
Received: from localhost ([::1]:34450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4ae-0005yA-5k
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 06:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4Yp-0005A0-HQ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:54:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4Yk-0001LW-V7
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633517641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5b3KDQ2Yr5S8DV03+TvtWBHZWI26GtXioE4XO0gXHxs=;
 b=YYmClT4g6PD7zSQ61DNmJlRCxiOnGvy0ydE6/Ha2Q6VlX7KBpaumAkS8Jffm2M3FpqMzwG
 PO/zdWTCv6XLh/E7GwNSdzWy4B+FiXg/R8Cvs17asmBkuHv8Gu++8ZfIJtwhBzS6dQSC8I
 GsCfoYLTbOGwXsmQdu3qVmgnDA2eNfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-pUq80F_tPOuijWBOlzubzQ-1; Wed, 06 Oct 2021 06:53:59 -0400
X-MC-Unique: pUq80F_tPOuijWBOlzubzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F7A9362FA;
 Wed,  6 Oct 2021 10:53:58 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9898560BE5;
 Wed,  6 Oct 2021 10:53:46 +0000 (UTC)
Date: Wed, 6 Oct 2021 12:53:45 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 09/11] qdev: Avoid QemuOpts in QMP device_add
Message-ID: <YV2AOX6NSGwy1pDO@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-10-kwolf@redhat.com>
 <89bbeed4-dec6-007a-175e-38a12e5bbfa1@greensocs.com>
 <YVGtXMq+JGKIIUrQ@redhat.com> <YVxjLf9vJlBqeKKh@redhat.com>
 <ea36ef56-4892-5b29-e660-964e6018e154@greensocs.com>
 <YVyMf7HCXGBXZQxI@redhat.com> <87v92ak1hb.fsf@secure.mitica>
 <09d60929-4669-e3ac-2292-bff5c83ebe24@redhat.com>
MIME-Version: 1.0
In-Reply-To: <09d60929-4669-e3ac-2292-bff5c83ebe24@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 quintela@redhat.com, libvir-list@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, its@irrelevant.dk,
 pbonzini@redhat.com, jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.10.2021 um 11:20 hat Laurent Vivier geschrieben:
> On 06/10/2021 10:21, Juan Quintela wrote:
> > Kevin Wolf <kwolf@redhat.com> wrote:
> > > Am 05.10.2021 um 17:52 hat Damien Hedde geschrieben:
> > 
> > Hi
> > 
> > > > > Usage
> > > > > -----
> > > > > 
> > > > > The primary device can be hotplugged or be part of the startup
> > > > > configuration
> > > > > 
> > > > >    -device virtio-net-pci,netdev=hostnet1,id=net1,
> > > > >            mac=52:54:00:6f:55:cc,bus=root2,failover=on
> > > > > 
> > > > > With the parameter failover=on the VIRTIO_NET_F_STANDBY feature
> > > > > will be enabled.
> > > > > 
> > > > > -device vfio-pci,host=5e:00.2,id=hostdev0,bus=root1,
> > > > >          failover_pair_id=net1
> > > > > 
> > > > > failover_pair_id references the id of the virtio-net standby device.
> > > > > This is only for pairing the devices within QEMU. The guest kernel
> > > > > module net_failover will match devices with identical MAC addresses.
> > > > > 
> > > > > Hotplug
> > > > > -------
> > > > > 
> > > > > Both primary and standby device can be hotplugged via the QEMU
> > > > > monitor.  Note that if the virtio-net device is plugged first a
> > > > > warning will be issued that it couldn't find the primary device.
> > > > 
> > > > So maybe this whole primary device lookup can happen during the -device CLI
> > > > option creation loop. And we can indeed have un-created devices still in the
> > > > list ?
> > > 
> > > Yes, that's the only case for which I could imagine for an inconsistency
> > > between the qdev tree and QemuOpts, but failover_add_primary() is only
> > > called after feature negotiation with the guest driver, so we can be
> > > sure that the -device loop has completed long ago.
> > > 
> > > And even if it hadn't completed yet, the paragraph also says that even
> > > hotplugging the device later is supported, so creating devices in the
> > > wrong order should still succeed.
> > > 
> > > I hope that some of the people I added to CC have some more hints.
> > 
> > Failover is ... interesting.
> > 
> > You have two devices: primary and seconday.
> > seconday is virtio-net, primary can be vfio and some other emulated
> > devices.
> > 
> > In the command line, devices can appear on any order, primary then
> > secondary, secondary then primary, or only one of them.
> > You can add (any of them) later in the toplevel.
> > 
> > And now, what all this mess is about.  We only enable the primary if the
> > guest knows about failover.  Otherwise we use only the virtio device
> > (*).  The important bit here is that we need to wait until the guest is
> > booted, and the virtio-net driver is loaded, and then it tells us if it
> > understands failover (or not).  At that point we decide if we want to
> > "really" create the primary.
> > 
> > I know that it abuses device_add() as much as it can be, but I can't see
> > any better way to handle it.  We need to be able to "create" a device
> > without showing it to the guest.  And later, when we create a different
> > device, and depending of driver support on the guest, we "finish" the
> > creation of the primary device.
> > 
> > Any good idea?

Hm, the naive idea would be creating the device without attaching it to
any bus. But I suppose qdev doesn't let you do that.

Anyway, the part that I missed yesterday is that qdev_device_add()
already skips creating the device if qdev_should_hide_device(), which
explains how the inconsistency is created.

(As an aside, it then returns NULL without setting an error to
indicate success, which is an awkward interface, and sure enough,
qmp_device_add() gets it wrong and deletes the QemuOpts again. So
hotplugging the virtio-net standby device doesn't even seem to work?)

Could we just save the configuration in the .hide_device callback (i.e.
failover_hide_primary_device() in virtio-net) to a new field in
VirtIONet and then use that when actually creating the device instead of
accessing the command line state in the QemuOptsList?

It seems that we can currently add two primary devices that are then
both hidden. failover_add_primary() adds only one of them, leaving the
other one hidden. Is this a bug and we should reject such a
configuration or do we need to support keeping configurations for
multiple primary devices in a single standby device?

This would still be ugly because the configuration is only really
validated when the primary device is actually added instead of
immediately on -device/device_add, but at least it would keep the
ugliness more local and wouldn't block the move away from QemuOpts (the
config would just be stored as a QDict after my patches).

> I don't know if it can help the discussion, but I'm reformatting the
> failover code to move all the PCI stuff to pci files.
> 
> And there is a lot of inconsistencies regarding the device_add and --device
> option so I've been in the end to add a list of of hidden devices rather
> than relying on the command line.
> 
> See PATCH 8 of series "[RFC PATCH v2 0/8] virtio-net failover cleanup and new features"
> 
> https://patchew.org/QEMU/20210820142002.152994-1-lvivier@redhat.com/

While it's certainly an improvement over the current state, we really
should move away from QemuOpts and I think using global state for this
is wrong anyway. So it feels like it's not the change we need here, but
more a step sideways.

But thanks for mentioning this series here, we might get some merge
conflicts there. I'll try to remember to CC you for v2 of this series.

Kevin


