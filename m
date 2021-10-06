Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF724239B0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 10:24:06 +0200 (CEST)
Received: from localhost ([::1]:52418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY2Dd-0001hS-27
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 04:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY27X-0003T4-AD
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:17:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY27T-0002ru-HD
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633508262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i+LxHM1Kzt57tZpe7bn0z0d+W+14uk/NPjwx0x9tpmo=;
 b=PTvMDwZ+nNXwppcDjJv/eh1OEKNAWmt6oPkFuYOwxBEK7R7UR6Cwjl+N1KhAAOnvdL2a4m
 j6g1nUQF4VySM36Y7Vo+1rKWA4kmn55AvLJ8clpIpUEY5+Tmt79z0351AZ9mbNfMp0Q9RT
 t25h4W9KeGsS9+c8ZmERsR1D9wcb9LY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-UpCH4-zsNhe0dTZg0dA0tA-1; Wed, 06 Oct 2021 04:17:41 -0400
X-MC-Unique: UpCH4-zsNhe0dTZg0dA0tA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k16-20020a5d6290000000b00160753b430fso1370751wru.11
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 01:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i+LxHM1Kzt57tZpe7bn0z0d+W+14uk/NPjwx0x9tpmo=;
 b=dx6QubzPJQvVIUgdv67+O6w73XgsNjfmcryuF+YJ4RPXMYqeaMgYfQra/XjZ31kmmc
 LdGYz5ijS6I7HjMOYeY7/V7Po7k//U8HYcU7gP5YiOBKWSNgOsp6AiS1WP5xQmAlOlAz
 C6wnNLZMqjPKzCstJFXr7kiCJ9OI7AFIQia1QsTWKDSmH9VAlAfIzbmuji98bHI339ns
 7fl1Ig3YteMHpL9WCkr8dv4809rrOruOtXF+GbwWFspLAvGZAL4lVV09svmE90EBQoRa
 ARVJ3OY+qD36GhaR4ZvncFi4UmJDny2lf0ywwUpXQEw9+qDg9hS7eM04ykIUYLBkytMD
 LfKw==
X-Gm-Message-State: AOAM533mgRaHcM2/2iVWx1P6b3uLWs5TaqF/VPPe+z0mEVpP8lmDLjqF
 LkrX5hqT/z4NFCFIepORbkWUnmyZhuhz7mCv1xxWvLgaB9RYuMQoD9ipbcg/bED7lx4j5DfjANu
 XBF8XWNh8td3xO5Y=
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr26945910wrd.24.1633508260415; 
 Wed, 06 Oct 2021 01:17:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYBEWOSPZusZpFEGoA9BPV1u58RQ2UNpnFLjyeNUfnQJHXydmlvLOivGwp7BN+wRkiAE3EdQ==
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr26945892wrd.24.1633508260189; 
 Wed, 06 Oct 2021 01:17:40 -0700 (PDT)
Received: from redhat.com ([2a02:ed0:53a2:ce00:a3d7:784f:9060:9de4])
 by smtp.gmail.com with ESMTPSA id o19sm21133383wrg.60.2021.10.06.01.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 01:17:39 -0700 (PDT)
Date: Wed, 6 Oct 2021 04:17:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v0 0/2] virtio-blk and vhost-user-blk cross-device
 migration
Message-ID: <20211006041419-mutt-send-email-mst@kernel.org>
References: <20211004150731.191270-1-den-plotnikov@yandex-team.ru>
 <20211004110855-mutt-send-email-mst@kernel.org>
 <YVuL0FRN5ilRN2Pd@rvkaganb.lan>
 <20211005024754-mutt-send-email-mst@kernel.org>
 <YVxaodahFBOvANL0@work-vm>
 <20211005161008.iq5ao7t2sdqeo6kc@habkost.net>
 <20211005175503-mutt-send-email-mst@kernel.org>
 <YV1ZuizhQ5gO9nd6@work-vm>
MIME-Version: 1.0
In-Reply-To: <YV1ZuizhQ5gO9nd6@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Oct 06, 2021 at 09:09:30AM +0100, Dr. David Alan Gilbert wrote:
> * Michael S. Tsirkin (mst@redhat.com) wrote:
> > On Tue, Oct 05, 2021 at 12:10:08PM -0400, Eduardo Habkost wrote:
> > > On Tue, Oct 05, 2021 at 03:01:05PM +0100, Dr. David Alan Gilbert wrote:
> > > > * Michael S. Tsirkin (mst@redhat.com) wrote:
> > > > > On Tue, Oct 05, 2021 at 02:18:40AM +0300, Roman Kagan wrote:
> > > > > > On Mon, Oct 04, 2021 at 11:11:00AM -0400, Michael S. Tsirkin wrote:
> > > > > > > On Mon, Oct 04, 2021 at 06:07:29PM +0300, Denis Plotnikov wrote:
> > > > > > > > It might be useful for the cases when a slow block layer should be replaced
> > > > > > > > with a more performant one on running VM without stopping, i.e. with very low
> > > > > > > > downtime comparable with the one on migration.
> > > > > > > > 
> > > > > > > > It's possible to achive that for two reasons:
> > > > > > > > 
> > > > > > > > 1.The VMStates of "virtio-blk" and "vhost-user-blk" are almost the same.
> > > > > > > >   They consist of the identical VMSTATE_VIRTIO_DEVICE and differs from
> > > > > > > >   each other in the values of migration service fields only.
> > > > > > > > 2.The device driver used in the guest is the same: virtio-blk
> > > > > > > > 
> > > > > > > > In the series cross-migration is achieved by adding a new type.
> > > > > > > > The new type uses virtio-blk VMState instead of vhost-user-blk specific
> > > > > > > > VMstate, also it implements migration save/load callbacks to be compatible
> > > > > > > > with migration stream produced by "virtio-blk" device.
> > > > > > > > 
> > > > > > > > Adding the new type instead of modifying the existing one is convenent.
> > > > > > > > It ease to differ the new virtio-blk-compatible vhost-user-blk
> > > > > > > > device from the existing non-compatible one using qemu machinery without any
> > > > > > > > other modifiactions. That gives all the variety of qemu device related
> > > > > > > > constraints out of box.
> > > > > > > 
> > > > > > > Hmm I'm not sure I understand. What is the advantage for the user?
> > > > > > > What if vhost-user-blk became an alias for vhost-user-virtio-blk?
> > > > > > > We could add some hacks to make it compatible for old machine types.
> > > > > > 
> > > > > > The point is that virtio-blk and vhost-user-blk are not
> > > > > > migration-compatible ATM.  OTOH they are the same device from the guest
> > > > > > POV so there's nothing fundamentally preventing the migration between
> > > > > > the two.  In particular, we see it as a means to switch between the
> > > > > > storage backend transports via live migration without disrupting the
> > > > > > guest.
> > > > > > 
> > > > > > Migration-wise virtio-blk and vhost-user-blk have in common
> > > > > > 
> > > > > > - the content of the VMState -- VMSTATE_VIRTIO_DEVICE
> > > > > > 
> > > > > > The two differ in
> > > > > > 
> > > > > > - the name and the version of the VMStateDescription
> > > > > > 
> > > > > > - virtio-blk has an extra migration section (via .save/.load callbacks
> > > > > >   on VirtioDeviceClass) containing requests in flight
> > > > > > 
> > > > > > It looks like to become migration-compatible with virtio-blk,
> > > > > > vhost-user-blk has to start using VMStateDescription of virtio-blk and
> > > > > > provide compatible .save/.load callbacks.  It isn't entirely obvious how
> > > > > > to make this machine-type-dependent, so we came up with a simpler idea
> > > > > > of defining a new device that shares most of the implementation with the
> > > > > > original vhost-user-blk except for the migration stuff.  We're certainly
> > > > > > open to suggestions on how to reconcile this under a single
> > > > > > vhost-user-blk device, as this would be more user-friendly indeed.
> > > > > > 
> > > > > > We considered using a class property for this and defining the
> > > > > > respective compat clause, but IIUC the class constructors (where .vmsd
> > > > > > and .save/.load are defined) are not supposed to depend on class
> > > > > > properties.
> > > > > > 
> > > > > > Thanks,
> > > > > > Roman.
> > > > > 
> > > > > So the question is how to make vmsd depend on machine type.
> > > > > CC Eduardo who poked at this kind of compat stuff recently,
> > > > > paolo who looked at qom things most recently and dgilbert
> > > > > for advice on migration.
> > > > 
> > > > I don't think I've seen anyone change vmsd name dependent on machine
> > > > type; making fields appear/disappear is easy - that just ends up as a
> > > > property on the device that's checked;  I guess if that property is
> > > > global (rather than per instance) then you can check it in
> > > > vhost_user_blk_class_init and swing the dc->vmsd pointer?
> > > 
> > > class_init can be called very early during QEMU initialization,
> > > so it's too early to make decisions based on machine type.
> > > 
> > > Making a specific vmsd appear/disappear based on machine
> > > configuration or state is "easy", by implementing
> > > VMStateDescription.needed.  But this would require registering
> > > both vmsds (one of them would need to be registered manually
> > > instead of using DeviceClass.vmsd).
> > > 
> > > I don't remember what are the consequences of not using
> > > DeviceClass.vmsd to register a vmsd, I only remember it was
> > > subtle.  See commit b170fce3dd06 ("cpu: Register
> > > VMStateDescription through CPUState") and related threads.  CCing
> > > Philippe, who might remember the details here.
> > > 
> > > If that's an important use case, I would suggest allowing devices
> > > to implement a DeviceClass.get_vmsd method, which would override
> > > DeviceClass.vmsd if necessary.  Is the problem we're trying to
> > > address worth the additional complexity?
> > 
> > The tricky part is that we generally dont support migration when
> > command line is different on source and destination ...
> 
> The reality has always been a bit more subtle than that.
> For example, it's fine if the path to a block device is different on the
> source and destination; or if it's accessed by iSCSI on the destination
> say.  As long as what the guest sees, and the migration stream carries
> are the same, then in principal it's OK - but that does start getting
> trickier; also it would prboably get interesting to let libvirt know
> that this combo is OK.

I agree, but that's not the same as specifying a different
device. Yes we internally they are compatible, but
this is a detail users/tools generally won't be able to
figure out.

> > So maybe the actual answer is that vhost-user-blk should really
> > be a drive supplied to a virtio blk device, not a device
> > itself?
> > This way it's sane, and also matches what we do e.g. for net.
> 
> Hmm a bit of a fudge; it's not quite the same as a drive is it; there's
> almost another layer split in there.
> 
> Dave

We can make it something else, not "drive=". Maybe simply "vhost-user=" ?
Point is if we promise it looks the same to guest it should be the
same -device.


> > -- 
> > MST
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


