Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371304239CC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 10:32:04 +0200 (CEST)
Received: from localhost ([::1]:34296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY2LK-0000IB-M7
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 04:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mY2IN-0007k0-3B
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:28:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mY2IK-0003VL-0f
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:28:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633508935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=keWdqgCr++4q0d3NY2Vp3iOaIA67uuFVxDtiUdumux0=;
 b=Ld4BwErpzjRSI86DNIjKGqMLDRJZVv+cPtIWvygvEHq9XdRv58Ywb+tqI9lG6FQJxs2jFv
 IV5CN1bOQcAlYh6GAIaHWzHp2gSqoUOaqfwMO/nOrPCKggwPfe2C//1g0QLik9ldOWCz6s
 whzKSWWOBLUSwDsBWgXePB/BS5h5mnM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-GrjLDMOZPYmNEFb-d-W_jQ-1; Wed, 06 Oct 2021 04:28:54 -0400
X-MC-Unique: GrjLDMOZPYmNEFb-d-W_jQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so1407360wrh.0
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 01:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=keWdqgCr++4q0d3NY2Vp3iOaIA67uuFVxDtiUdumux0=;
 b=o+bnBrdSomtlNQPUP4fhJwJjoxEa3cOCRx6ih2uYpolBzppzvMXpV7KQPHeZ1qOS3T
 1l96j684lxzlPhWmcMnmFz+r390z4UYhOGxiM8qi2BmLejDrOwmqWQjm19Y+YkAPkEYu
 kYCcZF+2X9kti+e3g7hDODbf8NrEUX0gonnIvhFRX8WE/Pwo216xdPj/omQYmfGrZXXw
 DC8gyDen2Kcao8DaNwL9kTzMy74x4I+7AW8bwAAjAlOMBmzo/SZAPY5mfcGjqKShRmSN
 L+NxIC4oYX25UFr4uK78ayZhzDOitqgua8iLpItfQt2KpsliNvf+SjyiKxLAfngxOeAk
 RWJw==
X-Gm-Message-State: AOAM532Vo3nIOBa5V7gFDghbiewr8//g0BqwusHIdfz8eyqxMCRWXJfU
 VnGvjCli8v8mk0SR5NAHEqjvE0duGY8pgsBTV6pLY4BjcLPBkid1TD2CyQGNe6FUblJ+5J7LUNO
 ajl6j1LAVhs4Bw5U=
X-Received: by 2002:a05:600c:1907:: with SMTP id
 j7mr8403949wmq.184.1633508933115; 
 Wed, 06 Oct 2021 01:28:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjmPMj2jYd2Cdg/5NXyj93Z2/Ifpl6+DnbQNaznwU59/RVdda6/9qrVr0dx/eL6RUOZgEHVw==
X-Received: by 2002:a05:600c:1907:: with SMTP id
 j7mr8403926wmq.184.1633508932816; 
 Wed, 06 Oct 2021 01:28:52 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id v191sm4663225wme.36.2021.10.06.01.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 01:28:52 -0700 (PDT)
Date: Wed, 6 Oct 2021 09:28:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v0 0/2] virtio-blk and vhost-user-blk cross-device
 migration
Message-ID: <YV1eQmM/+HXZy06C@work-vm>
References: <20211004150731.191270-1-den-plotnikov@yandex-team.ru>
 <20211004110855-mutt-send-email-mst@kernel.org>
 <YVuL0FRN5ilRN2Pd@rvkaganb.lan>
 <20211005024754-mutt-send-email-mst@kernel.org>
 <YVxaodahFBOvANL0@work-vm>
 <20211005161008.iq5ao7t2sdqeo6kc@habkost.net>
 <20211005175503-mutt-send-email-mst@kernel.org>
 <YV1ZuizhQ5gO9nd6@work-vm>
 <20211006041419-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211006041419-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: kwolf@redhat.com, Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, raphael.norwitz@nutanix.com,
 Roman Kagan <rvkagan@yandex-team.ru>, yc-core@yandex-team.ru,
 pbonzini@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael S. Tsirkin (mst@redhat.com) wrote:
> On Wed, Oct 06, 2021 at 09:09:30AM +0100, Dr. David Alan Gilbert wrote:
> > * Michael S. Tsirkin (mst@redhat.com) wrote:
> > > On Tue, Oct 05, 2021 at 12:10:08PM -0400, Eduardo Habkost wrote:
> > > > On Tue, Oct 05, 2021 at 03:01:05PM +0100, Dr. David Alan Gilbert wrote:
> > > > > * Michael S. Tsirkin (mst@redhat.com) wrote:
> > > > > > On Tue, Oct 05, 2021 at 02:18:40AM +0300, Roman Kagan wrote:
> > > > > > > On Mon, Oct 04, 2021 at 11:11:00AM -0400, Michael S. Tsirkin wrote:
> > > > > > > > On Mon, Oct 04, 2021 at 06:07:29PM +0300, Denis Plotnikov wrote:
> > > > > > > > > It might be useful for the cases when a slow block layer should be replaced
> > > > > > > > > with a more performant one on running VM without stopping, i.e. with very low
> > > > > > > > > downtime comparable with the one on migration.
> > > > > > > > > 
> > > > > > > > > It's possible to achive that for two reasons:
> > > > > > > > > 
> > > > > > > > > 1.The VMStates of "virtio-blk" and "vhost-user-blk" are almost the same.
> > > > > > > > >   They consist of the identical VMSTATE_VIRTIO_DEVICE and differs from
> > > > > > > > >   each other in the values of migration service fields only.
> > > > > > > > > 2.The device driver used in the guest is the same: virtio-blk
> > > > > > > > > 
> > > > > > > > > In the series cross-migration is achieved by adding a new type.
> > > > > > > > > The new type uses virtio-blk VMState instead of vhost-user-blk specific
> > > > > > > > > VMstate, also it implements migration save/load callbacks to be compatible
> > > > > > > > > with migration stream produced by "virtio-blk" device.
> > > > > > > > > 
> > > > > > > > > Adding the new type instead of modifying the existing one is convenent.
> > > > > > > > > It ease to differ the new virtio-blk-compatible vhost-user-blk
> > > > > > > > > device from the existing non-compatible one using qemu machinery without any
> > > > > > > > > other modifiactions. That gives all the variety of qemu device related
> > > > > > > > > constraints out of box.
> > > > > > > > 
> > > > > > > > Hmm I'm not sure I understand. What is the advantage for the user?
> > > > > > > > What if vhost-user-blk became an alias for vhost-user-virtio-blk?
> > > > > > > > We could add some hacks to make it compatible for old machine types.
> > > > > > > 
> > > > > > > The point is that virtio-blk and vhost-user-blk are not
> > > > > > > migration-compatible ATM.  OTOH they are the same device from the guest
> > > > > > > POV so there's nothing fundamentally preventing the migration between
> > > > > > > the two.  In particular, we see it as a means to switch between the
> > > > > > > storage backend transports via live migration without disrupting the
> > > > > > > guest.
> > > > > > > 
> > > > > > > Migration-wise virtio-blk and vhost-user-blk have in common
> > > > > > > 
> > > > > > > - the content of the VMState -- VMSTATE_VIRTIO_DEVICE
> > > > > > > 
> > > > > > > The two differ in
> > > > > > > 
> > > > > > > - the name and the version of the VMStateDescription
> > > > > > > 
> > > > > > > - virtio-blk has an extra migration section (via .save/.load callbacks
> > > > > > >   on VirtioDeviceClass) containing requests in flight
> > > > > > > 
> > > > > > > It looks like to become migration-compatible with virtio-blk,
> > > > > > > vhost-user-blk has to start using VMStateDescription of virtio-blk and
> > > > > > > provide compatible .save/.load callbacks.  It isn't entirely obvious how
> > > > > > > to make this machine-type-dependent, so we came up with a simpler idea
> > > > > > > of defining a new device that shares most of the implementation with the
> > > > > > > original vhost-user-blk except for the migration stuff.  We're certainly
> > > > > > > open to suggestions on how to reconcile this under a single
> > > > > > > vhost-user-blk device, as this would be more user-friendly indeed.
> > > > > > > 
> > > > > > > We considered using a class property for this and defining the
> > > > > > > respective compat clause, but IIUC the class constructors (where .vmsd
> > > > > > > and .save/.load are defined) are not supposed to depend on class
> > > > > > > properties.
> > > > > > > 
> > > > > > > Thanks,
> > > > > > > Roman.
> > > > > > 
> > > > > > So the question is how to make vmsd depend on machine type.
> > > > > > CC Eduardo who poked at this kind of compat stuff recently,
> > > > > > paolo who looked at qom things most recently and dgilbert
> > > > > > for advice on migration.
> > > > > 
> > > > > I don't think I've seen anyone change vmsd name dependent on machine
> > > > > type; making fields appear/disappear is easy - that just ends up as a
> > > > > property on the device that's checked;  I guess if that property is
> > > > > global (rather than per instance) then you can check it in
> > > > > vhost_user_blk_class_init and swing the dc->vmsd pointer?
> > > > 
> > > > class_init can be called very early during QEMU initialization,
> > > > so it's too early to make decisions based on machine type.
> > > > 
> > > > Making a specific vmsd appear/disappear based on machine
> > > > configuration or state is "easy", by implementing
> > > > VMStateDescription.needed.  But this would require registering
> > > > both vmsds (one of them would need to be registered manually
> > > > instead of using DeviceClass.vmsd).
> > > > 
> > > > I don't remember what are the consequences of not using
> > > > DeviceClass.vmsd to register a vmsd, I only remember it was
> > > > subtle.  See commit b170fce3dd06 ("cpu: Register
> > > > VMStateDescription through CPUState") and related threads.  CCing
> > > > Philippe, who might remember the details here.
> > > > 
> > > > If that's an important use case, I would suggest allowing devices
> > > > to implement a DeviceClass.get_vmsd method, which would override
> > > > DeviceClass.vmsd if necessary.  Is the problem we're trying to
> > > > address worth the additional complexity?
> > > 
> > > The tricky part is that we generally dont support migration when
> > > command line is different on source and destination ...
> > 
> > The reality has always been a bit more subtle than that.
> > For example, it's fine if the path to a block device is different on the
> > source and destination; or if it's accessed by iSCSI on the destination
> > say.  As long as what the guest sees, and the migration stream carries
> > are the same, then in principal it's OK - but that does start getting
> > trickier; also it would prboably get interesting to let libvirt know
> > that this combo is OK.
> 
> I agree, but that's not the same as specifying a different
> device. Yes we internally they are compatible, but
> this is a detail users/tools generally won't be able to
> figure out.

Yeh.

> > > So maybe the actual answer is that vhost-user-blk should really
> > > be a drive supplied to a virtio blk device, not a device
> > > itself?
> > > This way it's sane, and also matches what we do e.g. for net.
> > 
> > Hmm a bit of a fudge; it's not quite the same as a drive is it; there's
> > almost another layer split in there.
> > 
> > Dave
> 
> We can make it something else, not "drive=". Maybe simply "vhost-user=" ?
> Point is if we promise it looks the same to guest it should be the
> same -device.

To me it feels the same as the distinction between vhost-kernel and qemu
backended virtio that we get in net and others - in principal it's just 
another implementation.
A tricky part is guaranteeing the set of visible virtio features between
implementations; we have that problem when we use vhost-kernel and run
on a newer/older kernel and gain virtio features; the same will be true
with vhost-user implementations.

But this would make the structure of a vhost-user implementation quite
different.

Dave

> 
> > > -- 
> > > MST
> > > 
> > -- 
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


