Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02229422F80
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:58:44 +0200 (CEST)
Received: from localhost ([::1]:57356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoiB-0007Rr-1Q
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mXoKX-0004T8-D3
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 13:34:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mXoKT-0003Cb-FO
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 13:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633455252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jrDNSNU2nFg/Ma5skYUzLExrt97Xcn72cuFEJOUo46o=;
 b=SLbdcT/mdwTnkkoBvAB/hST3p3QjonXfPJA0P3XEv9xQTZiZbCnWxDyLcvU201yAxeqZ6B
 kKEdqCkBNngKBm1GLhdZHv5qSW8OU9ANS3ypYrZNKBxemY7+iEMUsNY4kSfbv/af2MYhUb
 AKwHPrXqXbgDcZRUi0k0fj4gxfTXg/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-fFPMKahLO8GT_v4V9PA6_g-1; Tue, 05 Oct 2021 13:34:11 -0400
X-MC-Unique: fFPMKahLO8GT_v4V9PA6_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1295802C8A;
 Tue,  5 Oct 2021 17:34:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B5805F4E7;
 Tue,  5 Oct 2021 17:33:52 +0000 (UTC)
Date: Tue, 5 Oct 2021 19:33:51 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH 09/11] qdev: Avoid QemuOpts in QMP device_add
Message-ID: <YVyMf7HCXGBXZQxI@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-10-kwolf@redhat.com>
 <89bbeed4-dec6-007a-175e-38a12e5bbfa1@greensocs.com>
 <YVGtXMq+JGKIIUrQ@redhat.com> <YVxjLf9vJlBqeKKh@redhat.com>
 <ea36ef56-4892-5b29-e660-964e6018e154@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <ea36ef56-4892-5b29-e660-964e6018e154@greensocs.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: lvivier@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 libvir-list@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com,
 jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.10.2021 um 17:52 hat Damien Hedde geschrieben:
> 
> 
> On 10/5/21 16:37, Kevin Wolf wrote:
> > Am 27.09.2021 um 13:39 hat Kevin Wolf geschrieben:
> > > Am 27.09.2021 um 13:06 hat Damien Hedde geschrieben:
> > > > On 9/24/21 11:04, Kevin Wolf wrote:
> > > > > Directly call qdev_device_add_from_qdict() for QMP device_add instead of
> > > > > first going through QemuOpts and converting back to QDict.
> > > > > 
> > > > > Note that this changes the behaviour of device_add, though in ways that
> > > > > should be considered bug fixes:
> > > > > 
> > > > > QemuOpts ignores differences between data types, so you could
> > > > > successfully pass a string "123" for an integer property, or a string
> > > > > "on" for a boolean property (and vice versa).  After this change, the
> > > > > correct data type for the property must be used in the JSON input.
> > > > > 
> > > > > qemu_opts_from_qdict() also silently ignores any options whose value is
> > > > > a QDict, QList or QNull.
> > > > > 
> > > > > To illustrate, the following QMP command was accepted before and is now
> > > > > rejected for both reasons:
> > > > > 
> > > > > { "execute": "device_add",
> > > > >     "arguments": { "driver": "scsi-cd",
> > > > >                    "drive": { "completely": "invalid" },
> > > > >                    "physical_block_size": "4096" } }
> > > > > 
> > > > > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > > > > ---
> > > > >    softmmu/qdev-monitor.c | 18 +++++++++++-------
> > > > >    1 file changed, 11 insertions(+), 7 deletions(-)
> > > > > 
> > > > > diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> > > > > index c09b7430eb..8622ccade6 100644
> > > > > --- a/softmmu/qdev-monitor.c
> > > > > +++ b/softmmu/qdev-monitor.c
> > > > > @@ -812,7 +812,8 @@ void hmp_info_qdm(Monitor *mon, const QDict *qdict)
> > > > >        qdev_print_devinfos(true);
> > > > >    }
> > > > > -void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
> > > > > +static void monitor_device_add(QDict *qdict, QObject **ret_data,
> > > > > +                               bool from_json, Error **errp)
> > > > >    {
> > > > >        QemuOpts *opts;
> > > > >        DeviceState *dev;
> > > > > @@ -825,7 +826,9 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
> > > > >            qemu_opts_del(opts);
> > > > >            return;
> > > > >        }
> > > > > -    dev = qdev_device_add(opts, errp);
> > > > > +    qemu_opts_del(opts);
> > > > > +
> > > > > +    dev = qdev_device_add_from_qdict(qdict, from_json, errp);
> > > > 
> > > > Hi Kevin,
> > > > 
> > > > I'm wandering if deleting the opts (which remove it from the "device" opts
> > > > list) is really a no-op ?
> > > 
> > > It's not exactly a no-op. Previously, the QemuOpts would only be freed
> > > when the device is destroying, now we delete it immediately after
> > > creating the device. This could matter in some cases.
> > > 
> > > The one case I was aware of is that QemuOpts used to be responsible for
> > > checking for duplicate IDs. Obviously, it can't do this job any more
> > > when we call qemu_opts_del() right after creating the device. This is
> > > the reason for patch 6.
> > > 
> > > > The opts list is, eg, traversed in hw/net/virtio-net.c in the function
> > > > failover_find_primary_device_id() which may be called during the
> > > > virtio_net_set_features() (a TYPE_VIRTIO_NET method).
> > > > I do not have the knowledge to tell when this method is called. But If this
> > > > is after we create the devices. Then the list will be empty at this point
> > > > now.
> > > > 
> > > > It seems, there are 2 other calling sites of
> > > > "qemu_opts_foreach(qemu_find_opts("device"), [...]" in net/vhost-user.c and
> > > > net/vhost-vdpa.c
> > > 
> > > Yes, you are right. These callers probably need to be changed. Going
> > > through the command line options rather than looking at the actual
> > > device objects that exist doesn't feel entirely clean anyway.
> > 
> > So I tried to have a look at the virtio-net case, and ended up very
> > confused.
> > 
> > Obviously looking at command line options (even of a differrent device)
> > from within a device is very unclean. With a non-broken, i.e. type safe,
> > device-add (as well as with the JSON CLI option introduced by this
> > series), we can't have a QemuOpts any more that is by definition unsafe.
> > So this code needs a replacement.
> > 
> > My naive idea was that we just need to look at runtime state instead.
> > Don't search the options for a device with a matching 'failover_pair_id'
> > (which, by the way, would fail as soon as any other device introduces a
> > property with the same name), but search for actual PCIDevices in qdev
> > that have pci_dev->failover_pair_id set accordingly.
> > 
> > However, the logic in failover_add_primary() suggests that we can have a
> > state where QemuOpts for a device exist, but the device doesn't, and
> > then it hotplugs the device from the command line options. How would we
> > ever get into such an inconsistent state where QemuOpts contains a
> > device that doesn't exist? Normally devices get their QemuOpts when they
> > are created and device_finalize() deletes the QemuOpts again. >
> 
> Just read the following from docs/system/virtio-net-failover.rst
> 
> > Usage
> > -----
> >
> > The primary device can be hotplugged or be part of the startup
> > configuration
> >
> >   -device virtio-net-pci,netdev=hostnet1,id=net1,
> >           mac=52:54:00:6f:55:cc,bus=root2,failover=on
> >
> > With the parameter failover=on the VIRTIO_NET_F_STANDBY feature
> > will be enabled.
> >
> > -device vfio-pci,host=5e:00.2,id=hostdev0,bus=root1,
> >         failover_pair_id=net1
> >
> > failover_pair_id references the id of the virtio-net standby device.
> > This is only for pairing the devices within QEMU. The guest kernel
> > module net_failover will match devices with identical MAC addresses.
> >
> > Hotplug
> > -------
> >
> > Both primary and standby device can be hotplugged via the QEMU
> > monitor.  Note that if the virtio-net device is plugged first a
> > warning will be issued that it couldn't find the primary device.
> 
> So maybe this whole primary device lookup can happen during the -device CLI
> option creation loop. And we can indeed have un-created devices still in the
> list ?

Yes, that's the only case for which I could imagine for an inconsistency
between the qdev tree and QemuOpts, but failover_add_primary() is only
called after feature negotiation with the guest driver, so we can be
sure that the -device loop has completed long ago.

And even if it hadn't completed yet, the paragraph also says that even
hotplugging the device later is supported, so creating devices in the
wrong order should still succeed.

I hope that some of the people I added to CC have some more hints.

Kevin

> > Any suggestions how to get rid of the QemuOpts abuse in the failover
> > code?
> > 
> > If this is a device that we previously managed to rip out without
> > deleting its QemuOpts, can we store its dev->opts (which is a type safe
> > QDict after this series) somewhere locally instead of looking at global
> > state? Preferably I would even like to get rid of dev->opts because we
> > really should look at live state rather than command line options after
> > device creation, but I guess one step at a time.
> > 
> > (Actually, I'm half tempted to just break it because no test cases seem
> > to exist, so apparently nobody is really interested in it.)
> > 
> > Kevin
> > 
> 


