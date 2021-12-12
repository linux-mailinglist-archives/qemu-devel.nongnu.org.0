Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C17847197E
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 10:32:29 +0100 (CET)
Received: from localhost ([::1]:44702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwLDY-0005S5-5V
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 04:32:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mwLBQ-0004ex-Vg
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 04:30:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mwLBN-0004E1-Fg
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 04:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639301411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VUmb45py6+HTpMysAKqR20XMjJGe4qZH3w+fu6xhyBQ=;
 b=bcdOzAntJCZHrq7usKoX1xWh74VG9QMLc/gUN16AdBRQi9QmMGy/Kh5HZY9dNq92lFN2xA
 9PrMKl6+xzyOScuyfP5CjSPO+lSL6Q7Be0KzMOW6snU/mZCieffobf9w9+yL/dN3rSEuxp
 x+buNLKE4i6Ip7QkhQ6+ugdhV9JfiQA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-sVoamlK3MUi-ie2AGERMNA-1; Sun, 12 Dec 2021 04:30:08 -0500
X-MC-Unique: sVoamlK3MUi-ie2AGERMNA-1
Received: by mail-wm1-f70.google.com with SMTP id
 g81-20020a1c9d54000000b003330e488323so4943969wme.0
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 01:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VUmb45py6+HTpMysAKqR20XMjJGe4qZH3w+fu6xhyBQ=;
 b=fFFkEgNEKpBbfj+h5KuMEp0VPVphuVdV18D2/tQkRF4NkEH8STFG9P1BjQ561vRRYs
 +zRK7D9lu0onnigOWNPxFWT0R2PvRPMM2Ag4cCdT7Yy8uyFC0WWGi625jzgvtN0ASy90
 NhD7cuxstvt2EEyX6dXc4U99pteIUTDrZztAXC4zMsknLKtIRTxH0moWU94bDckHxt7O
 CeVoH//8Jcu3CqSfaYNASrnRU06nrAMgl8k3J/20FK7LrH0DPMUbPA79LEwTbjlPIFq7
 WIQJWn1PCfhmNbE3qVKZ05jAbaG1aZQh+BhiNRszsrBe81oq9W+gbRoVCg7F50EFl4ev
 RxWg==
X-Gm-Message-State: AOAM531Q4m3UWGuOm8Ze330sO0i/xTAyXTJQtb2CLjPlsdJmp7s192gS
 uPLQ+5DkQhnKhuqQv3NqtuZ7LuyzhOl7xd0U/cpuztiEiqj2v9tP7oyNHoeeM5EKu73T9rRKOcf
 46CwLJr1lCBNO9fs=
X-Received: by 2002:a1c:1fcf:: with SMTP id f198mr28826870wmf.66.1639301407231; 
 Sun, 12 Dec 2021 01:30:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwq1qVfAGrfuvcOVoaqKje6wYi+s4c+3NCmFfO3HoP/c7EQSA4O3FaWtHE198Q1PI6q2CkBZg==
X-Received: by 2002:a1c:1fcf:: with SMTP id f198mr28826843wmf.66.1639301407017; 
 Sun, 12 Dec 2021 01:30:07 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:eefb:294:6ac8:eff6:22df])
 by smtp.gmail.com with ESMTPSA id l4sm7069118wrv.94.2021.12.12.01.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 01:30:06 -0800 (PST)
Date: Sun, 12 Dec 2021 04:30:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Message-ID: <20211212042818-mutt-send-email-mst@kernel.org>
References: <20211208052010.1719-1-longpeng2@huawei.com>
 <YbHJivhCDvKo4eB0@stefanha-x1.localdomain>
 <721bbc1c27f545babdfbd17e1461e9f2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <721bbc1c27f545babdfbd17e1461e9f2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "xieyongji@bytedance.com" <xieyongji@bytedance.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "parav@nvidia.com" <parav@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Dec 11, 2021 at 03:00:27AM +0000, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
> 
> 
> > -----Original Message-----
> > From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> > Sent: Thursday, December 9, 2021 5:17 PM
> > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > <longpeng2@huawei.com>
> > Cc: jasowang@redhat.com; mst@redhat.com; parav@nvidia.com;
> > xieyongji@bytedance.com; sgarzare@redhat.com; Yechuan <yechuan@huawei.com>;
> > Gonglei (Arei) <arei.gonglei@huawei.com>; qemu-devel@nongnu.org
> > Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
> > 
> > On Wed, Dec 08, 2021 at 01:20:10PM +0800, Longpeng(Mike) wrote:
> > > From: Longpeng <longpeng2@huawei.com>
> > >
> > > Hi guys,
> > >
> > > This patch introduces vhost-vdpa-net device, which is inspired
> > > by vhost-user-blk and the proposal of vhost-vdpa-blk device [1].
> > >
> > > I've tested this patch on Huawei's offload card:
> > > ./x86_64-softmmu/qemu-system-x86_64 \
> > >     -device vhost-vdpa-net-pci,vdpa-dev=/dev/vhost-vdpa-0
> > >
> > > For virtio hardware offloading, the most important requirement for us
> > > is to support live migration between offloading cards from different
> > > vendors, the combination of netdev and virtio-net seems too heavy, we
> > > prefer a lightweight way.
> > >
> > > Maybe we could support both in the future ? Such as:
> > >
> > > * Lightweight
> > >  Net: vhost-vdpa-net
> > >  Storage: vhost-vdpa-blk
> > >
> > > * Heavy but more powerful
> > >  Net: netdev + virtio-net + vhost-vdpa
> > >  Storage: bdrv + virtio-blk + vhost-vdpa
> > >
> > > [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
> > 
> > Stefano presented a plan for vdpa-blk at KVM Forum 2021:
> > https://kvmforum2021.sched.com/event/ke3a/vdpa-blk-unified-hardware-and-sof
> > tware-offload-for-virtio-blk-stefano-garzarella-red-hat
> > 
> > It's closer to today's virtio-net + vhost-net approach than the
> > vhost-vdpa-blk device you have mentioned. The idea is to treat vDPA as
> > an offload feature rather than a completely separate code path that
> > needs to be maintained and tested. That way QEMU's block layer features
> > and live migration work with vDPA devices and re-use the virtio-blk
> > code. The key functionality that has not been implemented yet is a "fast
> > path" mechanism that allows the QEMU virtio-blk device's virtqueue to be
> > offloaded to vDPA.
> > 
> > The unified vdpa-blk architecture should deliver the same performance
> > as the vhost-vdpa-blk device you mentioned but with more features, so I
> > wonder what aspects of the vhost-vdpa-blk idea are important to you?
> > 
> > QEMU already has vhost-user-blk, which takes a similar approach as the
> > vhost-vdpa-blk device you are proposing. I'm not against the
> > vhost-vdpa-blk approach in priciple, but would like to understand your
> > requirements and see if there is a way to collaborate on one vdpa-blk
> > implementation instead of dividing our efforts between two.
> > 
> 
> We prefer a simple way in the virtio hardware offloading case, it could reduce
> our maintenance workload, we no need to maintain the virtio-net, netdev,
> virtio-blk, bdrv and ... any more. If we need to support other vdpa devices
> (such as virtio-crypto, virtio-fs) in the future, then we also need to maintain
> the corresponding device emulation code?
> 
> For the virtio hardware offloading case, we usually use the vfio-pci framework,
> it saves a lot of our maintenance work in QEMU, we don't need to touch the device
> types. Inspired by Jason, what we really prefer is "vhost-vdpa-pci/mmio", use it to
> instead of the vfio-pci, it could provide the same performance as vfio-pci, but it's
> *possible* to support live migrate between offloading cards from different vendors.

OK, so the features you are dropping would be migration between
a vdpa, vhost and virtio backends. I think given vhost-vdpa-blk is seems
fair enough... What do others think?

> > Stefan


