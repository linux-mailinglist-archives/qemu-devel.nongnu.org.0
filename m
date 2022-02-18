Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130384BB6D4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 11:26:26 +0100 (CET)
Received: from localhost ([::1]:48268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL0T3-0000UW-1H
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 05:26:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nL0Ph-00072r-1K
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 05:22:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nL0Pc-0003Im-HB
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 05:22:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645179770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DrJeRrgzxUzUPEKAJlwooPLMXAGHvrsltckv8jxtisA=;
 b=dUPxe5EDQV5Ev+UMayVjj8LpqDUNKg+kNR6rx4DqTUMRIuKmdiZJevm02h4T5sq9khsjWW
 2Nu9MaJJl86VckkXHSh38fApvao13PZZtSjmfR1xy12NHFfFEl161u3S0l1O9Gn7IsarF1
 cQx1b/4Ni8tnMdAguvGdXPhmo3QLOH8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-HplNZrJDPrGC5zf6yXLP3Q-1; Fri, 18 Feb 2022 05:22:49 -0500
X-MC-Unique: HplNZrJDPrGC5zf6yXLP3Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 e9-20020a0cf749000000b0042bf697ff6bso8367078qvo.5
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 02:22:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DrJeRrgzxUzUPEKAJlwooPLMXAGHvrsltckv8jxtisA=;
 b=h79u9gEEvGDX26LuFpcZMeOxPb4IWeMJnkMc3gTNeLiOt+7Wxd3ZkZffK3ByTOxGBv
 eRJaHedpG8Atbx3NoY2a8ItQUi/MI+2baKpDek4wRXG+3JhGKcd1mw01b36fo114cWjs
 kmUU5RyTMok4DgWtCx7SmG1Qx2iVgTB+lwUdUTigbs3mIDvhUCAsTxm5nb4u1FvccVOR
 dae2sOLZqEFVXGiQl4fpEuuWV/E4WcZovN5JK1NvSqBBIRh0W87v1ZVbZfIzSiQtf0px
 ZWwnzL3HsFEq5xqPBLoOP3yn6j0+pyfdIoxPW9LVOmpan5SIfLUTNYqQnp9G+iKj/ri9
 nG/A==
X-Gm-Message-State: AOAM530BdSLQqda4oQ/HKkIimluovaK7Eo0Hqz7hsIEK0blUULdzoeZE
 WCxkPGK96bIMKz2wOa0QwZ0kzF39Tyq0uO03EDfXeBW2t1yqtIUCE1rYV5nB1YK20mdpImMX/KI
 fZEI8q1mdFkYhlql6ailJAjMk4Q+RDDw=
X-Received: by 2002:a37:8786:0:b0:49b:8082:22b9 with SMTP id
 j128-20020a378786000000b0049b808222b9mr4064827qkd.308.1645179768914; 
 Fri, 18 Feb 2022 02:22:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4a2l1DKVOEOnfXV/OKQxVFLakBY+7P0Rv4Pvk1aNh2cwNVBx+UOgysBCulPPsPSLahddLDUWX+sbByPaYmbU=
X-Received: by 2002:a37:8786:0:b0:49b:8082:22b9 with SMTP id
 j128-20020a378786000000b0049b808222b9mr4064821qkd.308.1645179768685; Fri, 18
 Feb 2022 02:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20220215072231.2498-1-gdawar@xilinx.com>
 <20220215072231.2498-3-gdawar@xilinx.com>
 <20220217023150-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220217023150-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 18 Feb 2022 11:22:12 +0100
Message-ID: <CAJaqyWcdv3jTP7FzZ9NP29K1YYFp8GYOQEt3s-ySz3bHQDfucQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Gautam Dawar <gdawar@xilinx.com>,
 Martin Petrus Hubertus Habets <martinh@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, tanujk@xilinx.com, pabloc@xilinx.com,
 Gautam Dawar <gautam.dawar@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 8:32 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Feb 15, 2022 at 12:52:31PM +0530, Gautam Dawar wrote:
> > This patch adds the ability to negotiate VIRTIO_F_IN_ORDER bit
> > for vhost-vdpa backend when the underlying device supports this
> > feature.
> > This would aid in reaping performance benefits with HW devices
> > that implement this feature. At the same time, it shouldn't have
> > any negative impact as vhost-vdpa backend doesn't involve any
> > userspace virtqueue operations.
> >
> > Signed-off-by: Gautam Dawar <gdawar@xilinx.com>
>
> Having features that hardware implements but qemu does not
> means we can't migrate between them.
> So I'd rather see a userspace implementation.
>

While I totally agree the userspace implementation is a better option,
would it be a problem if we implement it as a cmdline option as Jason
proposed?

I see other backends have similar issues with migration. For example
it's possible to run qemu with
-device=virtio-net-pci,...,indirect_desc=on and use a vhost-kernel
backend without indirect support in their features. I also understand
qemu emulated backend as "the base" somehow, but it should work
similarly to my example if cmdline parameter is off by default.

On the other hand, It may be worth thinking if it's worth waiting for
GSoC though, so we avoid this problem entirely at the moment. But I
feel that is going to come back with a different feature set with the
advent of more out of qemu devices and the fast adding of features of
VirtIO.

Thoughts?

Thanks!

> > ---
> >  hw/net/virtio-net.c | 10 ++++++++++
> >  net/vhost-vdpa.c    |  1 +
> >  2 files changed, 11 insertions(+)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index cf8ab0f8af..a1089d06f6 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -3507,11 +3507,21 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> >      nc->rxfilter_notify_enabled = 1;
> >
> >     if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
> > +        uint64_t features = BIT_ULL(VIRTIO_F_IN_ORDER);
> >          struct virtio_net_config netcfg = {};
> > +
> >          memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
> >          vhost_net_set_config(get_vhost_net(nc->peer),
> >              (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE_MASTER);
> > +
> > +     /*
> > +         * For vhost-vdpa, if underlying device supports IN_ORDER feature,
> > +         * make it available for negotiation.
> > +         */
> > +     features = vhost_net_get_features(get_vhost_net(nc->peer), features);
> > +     n->host_features |= features;
> >      }
> > +
> >      QTAILQ_INIT(&n->rsc_chains);
> >      n->qdev = dev;
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 25dd6dd975..2886cba5ec 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -62,6 +62,7 @@ const int vdpa_feature_bits[] = {
> >      VIRTIO_NET_F_CTRL_VQ,
> >      VIRTIO_F_IOMMU_PLATFORM,
> >      VIRTIO_F_RING_PACKED,
> > +    VIRTIO_F_IN_ORDER,
> >      VIRTIO_NET_F_RSS,
> >      VIRTIO_NET_F_HASH_REPORT,
> >      VIRTIO_NET_F_GUEST_ANNOUNCE,
> > --
> > 2.30.1
>


