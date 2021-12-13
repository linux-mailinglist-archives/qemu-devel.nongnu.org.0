Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF0C472AC0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:00:15 +0100 (CET)
Received: from localhost ([::1]:44740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwj43-0006lY-08
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:00:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mwj2B-00052b-My
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:58:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mwj24-00034Y-7n
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:58:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639393091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hQuw/bMjdbk6rZLRih6uUkRZK5suf4zO3kp0veP/jOM=;
 b=FMQHm7Rko1Gto8HUyBVFQEJuIEoKeAQDQZTUn07RBc1wGJTIqCHvW90c5hgcPJF2nPFxjO
 8eNhz8v+1u0M5w5VX+wbC3tp/LdI/y+YiaBHzTs6qlRPOGdC1jMQQKpvkMrw12YN5dz7k/
 RWObwTiMha8AwWOh25X1PVogJChEdrc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-7VUYuzR8NayP_-KQ-E8c5Q-1; Mon, 13 Dec 2021 05:58:08 -0500
X-MC-Unique: 7VUYuzR8NayP_-KQ-E8c5Q-1
Received: by mail-qt1-f197.google.com with SMTP id
 u14-20020a05622a198e00b002b2f35a6dcfso22703555qtc.21
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 02:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hQuw/bMjdbk6rZLRih6uUkRZK5suf4zO3kp0veP/jOM=;
 b=EcWvdVvDQlCj12IxD3mPr5wIaYTJ7F92Wbw12NaS95nX991w2nJBBDhQ/TAAOgI0At
 nU9MzYUjo+vH/LZcdE2+Mcc38ZfS3iJ9wm7TANZCCSdhryrha2GIuDLWHgDnBQibkgG6
 hVIW25PkhBsqQ4NjTDcqpY7ARX2V95Lc2G3wH3XArD4fq9u93BwPPl5YETnCxI+yk9f0
 MDgtTL3+WXDl+k3YC+x/Ulvx0bgHkpa2tsW1YvWMQTPiCPtxzV/he3mfFgS7zCtCQRqE
 GwVHlnNppumZ6++UeyiUQqIf0GXVphhXLKr/vf02Xd7WvRgSW1RRMJLsjbI3/4dfg07h
 6GJg==
X-Gm-Message-State: AOAM533QOizhJPqcEp8jjLrAnOVM1lDmqHL6Vu/GRPyZKECViE9KPpDM
 YKmajunCWPAfA33cLKsVMydEeoxwXhAeWy9g2BdBp89n0QReY3jFCEYvrCDw4EHSM8mmNoCIRyF
 xoLiKjL8uqTuNM54=
X-Received: by 2002:a05:622a:f:: with SMTP id
 x15mr43963188qtw.481.1639393088118; 
 Mon, 13 Dec 2021 02:58:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4f8zKRMs/jp82zoiI1yZYuDpClOlBNhTFLKE6KipmpFuO2TstWmPkrjYI7MK2CofHTTfJmA==
X-Received: by 2002:a05:622a:f:: with SMTP id
 x15mr43963157qtw.481.1639393087894; 
 Mon, 13 Dec 2021 02:58:07 -0800 (PST)
Received: from steredhat (host-87-21-203-138.retail.telecomitalia.it.
 [87.21.203.138])
 by smtp.gmail.com with ESMTPSA id x13sm6044243qkp.102.2021.12.13.02.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 02:58:07 -0800 (PST)
Date: Mon, 13 Dec 2021 11:58:00 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Message-ID: <20211213105800.zhnu5kdsxultgcix@steredhat>
References: <20211208052010.1719-1-longpeng2@huawei.com>
 <YbHJivhCDvKo4eB0@stefanha-x1.localdomain>
 <721bbc1c27f545babdfbd17e1461e9f2@huawei.com>
 <20211212042818-mutt-send-email-mst@kernel.org>
 <CACGkMEs_99AsAfxCJurJtBOQELD7pnc6RAqJDoO9yseVJDy9tA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEs_99AsAfxCJurJtBOQELD7pnc6RAqJDoO9yseVJDy9tA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
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
 "parav@nvidia.com" <parav@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 13, 2021 at 10:47:00AM +0800, Jason Wang wrote:
>On Sun, Dec 12, 2021 at 5:30 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> On Sat, Dec 11, 2021 at 03:00:27AM +0000, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
>> >
>> >
>> > > -----Original Message-----
>> > > From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
>> > > Sent: Thursday, December 9, 2021 5:17 PM
>> > > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> > > <longpeng2@huawei.com>
>> > > Cc: jasowang@redhat.com; mst@redhat.com; parav@nvidia.com;
>> > > xieyongji@bytedance.com; sgarzare@redhat.com; Yechuan <yechuan@huawei.com>;
>> > > Gonglei (Arei) <arei.gonglei@huawei.com>; qemu-devel@nongnu.org
>> > > Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
>> > >
>> > > On Wed, Dec 08, 2021 at 01:20:10PM +0800, Longpeng(Mike) wrote:
>> > > > From: Longpeng <longpeng2@huawei.com>
>> > > >
>> > > > Hi guys,
>> > > >
>> > > > This patch introduces vhost-vdpa-net device, which is inspired
>> > > > by vhost-user-blk and the proposal of vhost-vdpa-blk device [1].
>> > > >
>> > > > I've tested this patch on Huawei's offload card:
>> > > > ./x86_64-softmmu/qemu-system-x86_64 \
>> > > >     -device vhost-vdpa-net-pci,vdpa-dev=/dev/vhost-vdpa-0
>> > > >
>> > > > For virtio hardware offloading, the most important requirement for us
>> > > > is to support live migration between offloading cards from different
>> > > > vendors, the combination of netdev and virtio-net seems too heavy, we
>> > > > prefer a lightweight way.
>> > > >
>> > > > Maybe we could support both in the future ? Such as:
>> > > >
>> > > > * Lightweight
>> > > >  Net: vhost-vdpa-net
>> > > >  Storage: vhost-vdpa-blk
>> > > >
>> > > > * Heavy but more powerful
>> > > >  Net: netdev + virtio-net + vhost-vdpa
>> > > >  Storage: bdrv + virtio-blk + vhost-vdpa
>> > > >
>> > > > [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
>> > >
>> > > Stefano presented a plan for vdpa-blk at KVM Forum 2021:
>> > > https://kvmforum2021.sched.com/event/ke3a/vdpa-blk-unified-hardware-and-sof
>> > > tware-offload-for-virtio-blk-stefano-garzarella-red-hat
>> > >
>> > > It's closer to today's virtio-net + vhost-net approach than the
>> > > vhost-vdpa-blk device you have mentioned. The idea is to treat vDPA as
>> > > an offload feature rather than a completely separate code path that
>> > > needs to be maintained and tested. That way QEMU's block layer features
>> > > and live migration work with vDPA devices and re-use the virtio-blk
>> > > code. The key functionality that has not been implemented yet is a "fast
>> > > path" mechanism that allows the QEMU virtio-blk device's virtqueue to be
>> > > offloaded to vDPA.
>> > >
>> > > The unified vdpa-blk architecture should deliver the same performance
>> > > as the vhost-vdpa-blk device you mentioned but with more features, so I
>> > > wonder what aspects of the vhost-vdpa-blk idea are important to you?
>> > >
>> > > QEMU already has vhost-user-blk, which takes a similar approach as the
>> > > vhost-vdpa-blk device you are proposing. I'm not against the
>> > > vhost-vdpa-blk approach in priciple, but would like to understand your
>> > > requirements and see if there is a way to collaborate on one vdpa-blk
>> > > implementation instead of dividing our efforts between two.
>> > >
>> >
>> > We prefer a simple way in the virtio hardware offloading case, it could reduce
>> > our maintenance workload, we no need to maintain the virtio-net, netdev,
>> > virtio-blk, bdrv and ... any more. If we need to support other vdpa devices
>> > (such as virtio-crypto, virtio-fs) in the future, then we also need to maintain
>> > the corresponding device emulation code?
>> >
>> > For the virtio hardware offloading case, we usually use the 
>> > vfio-pci framework,
>> > it saves a lot of our maintenance work in QEMU, we don't need to touch the device
>> > types. Inspired by Jason, what we really prefer is "vhost-vdpa-pci/mmio", use it to
>> > instead of the vfio-pci, it could provide the same performance as vfio-pci, but it's
>> > *possible* to support live migrate between offloading cards from different vendors.
>>
>> OK, so the features you are dropping would be migration between
>> a vdpa, vhost and virtio backends. I think given vhost-vdpa-blk is seems
>> fair enough... What do others think?
>
>I think it should be fine, and it would be even better to make it not
>specific to device type.

Yep, I agree with Jason.

A generic vhost-vdpa device would be the best if the features are not 
needed. In this way we would have this generic device and then the 
specialized devices that will offer more features.

Stefano


