Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EFA47840E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 05:29:53 +0100 (CET)
Received: from localhost ([::1]:37036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my4sS-0000qX-8Y
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 23:29:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1my4q2-0006pU-3Q
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 23:27:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1my4pr-0008G1-QR
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 23:27:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639715229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+6jHys24AujX9Cu0zusEvwj4ypDsp/iCcTk5hzWnWd0=;
 b=hv1kojcbUPWmOgXM95HowrxbUEa8Y61P74+MoJTbItLn0WvLWgJcxFqtPIK2oFIlDR93vT
 HAOarRZvdsgGbf4/aSIgkZwz7N6g+tdE7EGuALkS2jHTh2HGHlpvErHKb69q8k62V7HoP2
 2iVhWU/u1i9wC4yKMjNLTzzI2gZKSAY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-WtKOUpuRMxyTnCspq7U9vg-1; Thu, 16 Dec 2021 23:27:06 -0500
X-MC-Unique: WtKOUpuRMxyTnCspq7U9vg-1
Received: by mail-lj1-f197.google.com with SMTP id
 q19-20020a05651c055300b0021a259ae8bbso216223ljp.4
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 20:27:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+6jHys24AujX9Cu0zusEvwj4ypDsp/iCcTk5hzWnWd0=;
 b=G4c/A6dBWaBJSj/BLg1DGhCubwYtNwOhW01XBKkQD1ZuEU3el2f9xxov+I6hP2nLsF
 RUZdFIKEn6uuMig4OdrZ1qTIsG5uZ9I3sLVF9jO55Rm6PgIZTTB960/c735F2Xf+bflX
 uPP7I9zHpY08fNtl+qpFF7tW4GvHMnCCFyjk6z2cYHC1bqlP6hlrMmA3S3lb1O1ueIR8
 kVfLddRDX7Is2ynoT9MlhojWVx+uvwCNPTQjMMsP8TQzmVES8tfuefnv9nmPGs+V0bIK
 hDhnrIkI17oi6F2LJMr7JtQUSAr8AHcbEewhGkVdLeLspWYVWPEQ/ryMUvdyFYRzEcUY
 e9JQ==
X-Gm-Message-State: AOAM533VrkelMPMtg+H+w0rQt4ie/94KccAwupbpuqnLHf8njfYDa1u3
 ML+Is8H6JBzasLe0IL96JwoTN9Ho6GqEMNIlYyCcTnbqhokQF25vLPCh4Lo/Q8D84jeYQPgkAFW
 Iw98q2PXK01sgnW5J80P7ebz97rlXwWg=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr1199586ljp.362.1639715225019; 
 Thu, 16 Dec 2021 20:27:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2GN/LQGcOODUxSHmsGhqufNJNUA0Lz0P+6fauyuzR5Gr891mztCFKehKQPRAnMoMEJRUcNZRUQTRlf5u4R4w=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr1199566ljp.362.1639715224731; 
 Thu, 16 Dec 2021 20:27:04 -0800 (PST)
MIME-Version: 1.0
References: <YbHJivhCDvKo4eB0@stefanha-x1.localdomain>
 <721bbc1c27f545babdfbd17e1461e9f2@huawei.com>
 <20211212042818-mutt-send-email-mst@kernel.org>
 <CACGkMEs_99AsAfxCJurJtBOQELD7pnc6RAqJDoO9yseVJDy9tA@mail.gmail.com>
 <YbdjRRcfrNjHjfko@stefanha-x1.localdomain>
 <CACGkMEt9UF2eVB6692aGoKBD2v0zPwopZG1jaG_O=mg3-cwwSA@mail.gmail.com>
 <YbiYAKIkLAgosXEH@stefanha-x1.localdomain>
 <CACGkMEsZfgDriSx1e=JOU4E8QyB5KoU+i2M2F8N12BrMbu5suQ@mail.gmail.com>
 <Ybm+YVQS1l73nnuU@stefanha-x1.localdomain>
 <CACGkMEtqujKwU=3P1VQ-PgAQPvzrpAf_huVzVZHAi11vyn8xPA@mail.gmail.com>
 <YbsClFXLq3kz7tJS@stefanha-x1.localdomain>
In-Reply-To: <YbsClFXLq3kz7tJS@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 17 Dec 2021 12:26:53 +0800
Message-ID: <CACGkMEtwHj-y9nVvtszOYKYd1ohd-cdNe8xry-rYkD1Jk9U4Ow@mail.gmail.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "xieyongji@bytedance.com" <xieyongji@bytedance.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "parav@nvidia.com" <parav@nvidia.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 5:10 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Thu, Dec 16, 2021 at 11:01:40AM +0800, Jason Wang wrote:
> > On Wed, Dec 15, 2021 at 6:07 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > On Wed, Dec 15, 2021 at 11:18:05AM +0800, Jason Wang wrote:
> > > > On Tue, Dec 14, 2021 at 9:11 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > > >
> > > > > On Tue, Dec 14, 2021 at 10:22:53AM +0800, Jason Wang wrote:
> > > > > > On Mon, Dec 13, 2021 at 11:14 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > > > > >
> > > > > > > On Mon, Dec 13, 2021 at 10:47:00AM +0800, Jason Wang wrote:
> > > > > > > > On Sun, Dec 12, 2021 at 5:30 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Sat, Dec 11, 2021 at 03:00:27AM +0000, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> > > > > > > > > > > Sent: Thursday, December 9, 2021 5:17 PM
> > > > > > > > > > > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > > > > > > > > > > <longpeng2@huawei.com>
> > > > > > > > > > > Cc: jasowang@redhat.com; mst@redhat.com; parav@nvidia.com;
> > > > > > > > > > > xieyongji@bytedance.com; sgarzare@redhat.com; Yechuan <yechuan@huawei.com>;
> > > > > > > > > > > Gonglei (Arei) <arei.gonglei@huawei.com>; qemu-devel@nongnu.org
> > > > > > > > > > > Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
> > > > > > > > > > >
> > > > > > > > > > > On Wed, Dec 08, 2021 at 01:20:10PM +0800, Longpeng(Mike) wrote:
> > > > > > > > > > > > From: Longpeng <longpeng2@huawei.com>
> > > > > > > > > > > >
> > > > > > > > > > > > Hi guys,
> > > > > > > > > > > >
> > > > > > > > > > > > This patch introduces vhost-vdpa-net device, which is inspired
> > > > > > > > > > > > by vhost-user-blk and the proposal of vhost-vdpa-blk device [1].
> > > > > > > > > > > >
> > > > > > > > > > > > I've tested this patch on Huawei's offload card:
> > > > > > > > > > > > ./x86_64-softmmu/qemu-system-x86_64 \
> > > > > > > > > > > >     -device vhost-vdpa-net-pci,vdpa-dev=/dev/vhost-vdpa-0
> > > > > > > > > > > >
> > > > > > > > > > > > For virtio hardware offloading, the most important requirement for us
> > > > > > > > > > > > is to support live migration between offloading cards from different
> > > > > > > > > > > > vendors, the combination of netdev and virtio-net seems too heavy, we
> > > > > > > > > > > > prefer a lightweight way.
> > > > > > > > > > > >
> > > > > > > > > > > > Maybe we could support both in the future ? Such as:
> > > > > > > > > > > >
> > > > > > > > > > > > * Lightweight
> > > > > > > > > > > >  Net: vhost-vdpa-net
> > > > > > > > > > > >  Storage: vhost-vdpa-blk
> > > > > > > > > > > >
> > > > > > > > > > > > * Heavy but more powerful
> > > > > > > > > > > >  Net: netdev + virtio-net + vhost-vdpa
> > > > > > > > > > > >  Storage: bdrv + virtio-blk + vhost-vdpa
> > > > > > > > > > > >
> > > > > > > > > > > > [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
> > > > > > > > > > >
> > > > > > > > > > > Stefano presented a plan for vdpa-blk at KVM Forum 2021:
> > > > > > > > > > > https://kvmforum2021.sched.com/event/ke3a/vdpa-blk-unified-hardware-and-sof
> > > > > > > > > > > tware-offload-for-virtio-blk-stefano-garzarella-red-hat
> > > > > > > > > > >
> > > > > > > > > > > It's closer to today's virtio-net + vhost-net approach than the
> > > > > > > > > > > vhost-vdpa-blk device you have mentioned. The idea is to treat vDPA as
> > > > > > > > > > > an offload feature rather than a completely separate code path that
> > > > > > > > > > > needs to be maintained and tested. That way QEMU's block layer features
> > > > > > > > > > > and live migration work with vDPA devices and re-use the virtio-blk
> > > > > > > > > > > code. The key functionality that has not been implemented yet is a "fast
> > > > > > > > > > > path" mechanism that allows the QEMU virtio-blk device's virtqueue to be
> > > > > > > > > > > offloaded to vDPA.
> > > > > > > > > > >
> > > > > > > > > > > The unified vdpa-blk architecture should deliver the same performance
> > > > > > > > > > > as the vhost-vdpa-blk device you mentioned but with more features, so I
> > > > > > > > > > > wonder what aspects of the vhost-vdpa-blk idea are important to you?
> > > > > > > > > > >
> > > > > > > > > > > QEMU already has vhost-user-blk, which takes a similar approach as the
> > > > > > > > > > > vhost-vdpa-blk device you are proposing. I'm not against the
> > > > > > > > > > > vhost-vdpa-blk approach in priciple, but would like to understand your
> > > > > > > > > > > requirements and see if there is a way to collaborate on one vdpa-blk
> > > > > > > > > > > implementation instead of dividing our efforts between two.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > We prefer a simple way in the virtio hardware offloading case, it could reduce
> > > > > > > > > > our maintenance workload, we no need to maintain the virtio-net, netdev,
> > > > > > > > > > virtio-blk, bdrv and ... any more. If we need to support other vdpa devices
> > > > > > > > > > (such as virtio-crypto, virtio-fs) in the future, then we also need to maintain
> > > > > > > > > > the corresponding device emulation code?
> > > > > > > > > >
> > > > > > > > > > For the virtio hardware offloading case, we usually use the vfio-pci framework,
> > > > > > > > > > it saves a lot of our maintenance work in QEMU, we don't need to touch the device
> > > > > > > > > > types. Inspired by Jason, what we really prefer is "vhost-vdpa-pci/mmio", use it to
> > > > > > > > > > instead of the vfio-pci, it could provide the same performance as vfio-pci, but it's
> > > > > > > > > > *possible* to support live migrate between offloading cards from different vendors.
> > > > > > > > >
> > > > > > > > > OK, so the features you are dropping would be migration between
> > > > > > > > > a vdpa, vhost and virtio backends. I think given vhost-vdpa-blk is seems
> > > > > > > > > fair enough... What do others think?
> > > > > > > >
> > > > > > > > I think it should be fine, and it would be even better to make it not
> > > > > > > > specific to device type.
> > > > > > >
> > > > > > > That's an interesting idea. A generic vDPA VirtIODevice could exposed as
> > > > > > >
> > > > > > >   --device vhost-vdpa-pci,
> > > > > > >            [vhostfd=FD,|
> > > > > > >             vhostpath=/dev/vhost-vdpa-N]
> > > > > > >
> > > > > > > (and for virtio-mmio and virtio-ccw too).
> > > > > > >
> > > > > > > I don't think this is possible yet because the vhost_vdpa ioctls are
> > > > > > > missing some introspection functionality. Here is what I found:
> > > > > > > - Device ID: ok, use VHOST_VDPA_GET_DEVICE_ID
> > > > > > > - Device feature bits: ok, use VHOST_GET_BACKEND_FEATURES
> > > > > > > - Configuration space size: missing, need ioctl for ops->get_config_size()
> > > > > >
> > > > > > Any specific reason that we need this considering we've already had
> > > > > > VHOST_VDPA_GET_CONFIG and we do the size validation there?
> > > > >
> > > > > QEMU's virtio_init() takes a size_t config_size argument. We need to
> > > > > determine the size of the vhost_vdpa's configuration space in order to
> > > > > create the VirtIODevice in QEMU.
> > > > >
> > > > > Do you mean probing by checking for the VHOST_VDPA_GET_CONFIG -E2BIG
> > > > > return value? It's hacky but I guess it's possible to do a binary search
> > > > > that calls VHOST_VDPA_GET_CONFIG each iteration and reduces the size if
> > > > > -E2BIG is returned or increases the size otherwise.
> > > > >
> > > > > Or do you mean re-writing QEMU's hw/virtio/virtio.c to allow the
> > > > > VirtIODevice to override the size and we pass accesses through to
> > > > > vhost_vdpa. That way it might be possible to avoid fetching the
> > > > > configuration space size at startup, but I'm not sure this will work
> > > > > because QEMU might depend on knowing the exact size (e.g. live
> > > > > migration).
> > > >
> > > > Good point, so looking at virtio-blk it has:
> > > >
> > > >     virtio_blk_set_config_size(s, s->host_features);
> > > >     virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->config_size);
> > > >
> > > > I think here virtio-blk/net should check the vhost-vdpa features here
> > > > and fail if they are not the same?
> > >
> > > The vhost feature bit code in QEMU is complicated and I can't respond
> > > without investing too much time studying it :).
> > >
> > > > This looks better than overriding the config_size with what vhost-vdpa
> > > > provides since it can override the features that the cli tries to
> > > > enable.
> > >
> > > I'm thinking about the generic --device vhost-vdpa idea. QEMU should not
> > > require knowledge of the device feature bits in that case, so it cannot
> > > calculate the configuration space size.
> >
> > In this case, it looks to me the config size could be deduced from
> > VHOST_VDPA_GET_FEATURES?
>
> I think we're talking about different things, see below...
>
> > >
> > > > >
> > > > > > > - Max virtqueue size: ok, VHOST_VDPA_GET_VRING_NUM
> > > > > > > - Number of virtqueues: probe using VHOST_GET_VRING_BASE?
> > > > > >
> > > > > > I'm not sure whether or not we need this and it seems not necessary
> > > > > > since it can be deduced from the config space and features.
> > > > >
> > > > > It can only be deduced in a device-specific way (net, blk, etc). I can't
> > > > > think of a way to detect the number of virtqueues for an arbitrary
> > > > > VIRTIO device from the features bits and configuration space contents.
> > > >
> > > > Yes, I'm not against this idea but it looks to me it works even without this.
> > > >
> > > > Modern PCI has num_queues but we don't have things like this in MMIO
> > > > and legacy PCI.
> > >
> > > Even if the VIRTIO hardware interface doesn't expose this information to
> > > the guest, QEMU's VirtIODevice API needs it. Device emulation code must
> > > call virtio_add_queue() to expose virtqueues to the guest.
> >
> > We don't need this for current multiqueue virtio-net with vhost-vdpa
> > since the queue num were deduced from the VHOST_VDPA_GET_CONFIG during
> > the initialization of vhost-vdpa backend.
> >
> > If we are talking about generic vhost-vdpa-pci, we don't need
> > virtio_add_queue() in this case.
>
> When I say --device vhost-vdpa I mean a VirtIODevice in QEMU that takes
> any /dev/vhost-vdpa-N and exposes the device to the guest (over
> virtio-pci, virtio-mmio, or virtio-ccw). It's generic because it has no
> knowledge of specific device types. This means new device types can be
> added without modifying QEMU.
>
> I think the model you are describing is not generic because it relies on
> knowledge of specific device types (net, blk, scsi, etc) so it can
> interpret feature bits and configuration space fields.

Yes, but what I meant is that in this case qemu can simply relay the
set/get config to vhost-vdpa. And the guest driver can enumerate the
number of queues correctly depending on his own knowledge.

>
> When you originally said "it would be even better to make it not
> specific to device type" I thought you meant a generic --device
> vhost-vdpa and that's what I've been describing, but in your recent
> replies I guess you have a different model in mind.
>
> Are there reasons why the generic model won't work?

I think not.

One thing comes to my mind is that since we provide num_queues via
modern virtio-pci, this is probably another call for having the API
you described.

For the general vhost-vdpa backend, the only thing that may block us
is the migration. If we want to make vhost-vdpa type independent, we
need first investigate the independent migration facility in virtio
spec which is still suspicious.

Thanks

>
> Stefan


