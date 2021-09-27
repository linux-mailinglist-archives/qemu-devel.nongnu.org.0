Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A239419386
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 13:44:47 +0200 (CEST)
Received: from localhost ([::1]:53856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUp3s-0005Ow-RO
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 07:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mUoyh-0003UI-SQ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 07:39:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mUoyc-0002pY-VC
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 07:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632742757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VR7mQf2XmpyT+M+gfByQT6tO4umA9XLmqkjLyttQJxs=;
 b=QLt5h0WK+kRXy3jdZhHqqxKaRnxX/E/BTvr7nvxS1tM9ucd+m7KkEKzS422IyF7ctS6Ow4
 Fi6yRhS1dwMzVNsgidWxuP0hFQSncVHpkr6To4fTFdooErzZ7YqnGxvdOz3gsy8bmtZjpk
 kBBQ0YNxiMn5peoewljfwmPGzg6/G7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-CHNplWz7MMWh4DP9s0D1ug-1; Mon, 27 Sep 2021 07:39:16 -0400
X-MC-Unique: CHNplWz7MMWh4DP9s0D1ug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E34E2881279;
 Mon, 27 Sep 2021 11:39:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C00F60936;
 Mon, 27 Sep 2021 11:39:09 +0000 (UTC)
Date: Mon, 27 Sep 2021 13:39:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH 09/11] qdev: Avoid QemuOpts in QMP device_add
Message-ID: <YVGtXMq+JGKIIUrQ@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-10-kwolf@redhat.com>
 <89bbeed4-dec6-007a-175e-38a12e5bbfa1@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <89bbeed4-dec6-007a-175e-38a12e5bbfa1@greensocs.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.09.2021 um 13:06 hat Damien Hedde geschrieben:
> On 9/24/21 11:04, Kevin Wolf wrote:
> > Directly call qdev_device_add_from_qdict() for QMP device_add instead of
> > first going through QemuOpts and converting back to QDict.
> > 
> > Note that this changes the behaviour of device_add, though in ways that
> > should be considered bug fixes:
> > 
> > QemuOpts ignores differences between data types, so you could
> > successfully pass a string "123" for an integer property, or a string
> > "on" for a boolean property (and vice versa).  After this change, the
> > correct data type for the property must be used in the JSON input.
> > 
> > qemu_opts_from_qdict() also silently ignores any options whose value is
> > a QDict, QList or QNull.
> > 
> > To illustrate, the following QMP command was accepted before and is now
> > rejected for both reasons:
> > 
> > { "execute": "device_add",
> >    "arguments": { "driver": "scsi-cd",
> >                   "drive": { "completely": "invalid" },
> >                   "physical_block_size": "4096" } }
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >   softmmu/qdev-monitor.c | 18 +++++++++++-------
> >   1 file changed, 11 insertions(+), 7 deletions(-)
> > 
> > diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> > index c09b7430eb..8622ccade6 100644
> > --- a/softmmu/qdev-monitor.c
> > +++ b/softmmu/qdev-monitor.c
> > @@ -812,7 +812,8 @@ void hmp_info_qdm(Monitor *mon, const QDict *qdict)
> >       qdev_print_devinfos(true);
> >   }
> > -void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
> > +static void monitor_device_add(QDict *qdict, QObject **ret_data,
> > +                               bool from_json, Error **errp)
> >   {
> >       QemuOpts *opts;
> >       DeviceState *dev;
> > @@ -825,7 +826,9 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
> >           qemu_opts_del(opts);
> >           return;
> >       }
> > -    dev = qdev_device_add(opts, errp);
> > +    qemu_opts_del(opts);
> > +
> > +    dev = qdev_device_add_from_qdict(qdict, from_json, errp);
> 
> Hi Kevin,
> 
> I'm wandering if deleting the opts (which remove it from the "device" opts
> list) is really a no-op ?

It's not exactly a no-op. Previously, the QemuOpts would only be freed
when the device is destroying, now we delete it immediately after
creating the device. This could matter in some cases.

The one case I was aware of is that QemuOpts used to be responsible for
checking for duplicate IDs. Obviously, it can't do this job any more
when we call qemu_opts_del() right after creating the device. This is
the reason for patch 6.

> The opts list is, eg, traversed in hw/net/virtio-net.c in the function
> failover_find_primary_device_id() which may be called during the
> virtio_net_set_features() (a TYPE_VIRTIO_NET method).
> I do not have the knowledge to tell when this method is called. But If this
> is after we create the devices. Then the list will be empty at this point
> now.
> 
> It seems, there are 2 other calling sites of
> "qemu_opts_foreach(qemu_find_opts("device"), [...]" in net/vhost-user.c and
> net/vhost-vdpa.c

Yes, you are right. These callers probably need to be changed. Going
through the command line options rather than looking at the actual
device objects that exist doesn't feel entirely clean anyway.

Kevin


