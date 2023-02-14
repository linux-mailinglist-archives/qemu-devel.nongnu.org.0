Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7003695B17
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 08:51:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRq5o-0002YZ-FA; Tue, 14 Feb 2023 02:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pRq5l-0002Y4-PN
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:51:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pRq5j-0008Mk-Tu
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676361067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6t/ID2NgaSnoUtHJxef8rum49YC2wMiQm0SMS0qgKLQ=;
 b=ZnoKPJ5Tu1YscKlaT+EsQVtMYo0Ivj3cexkBwRV/LJ4F1lLPCv9YXMesuEfpezfVi5zSVy
 +bJ25lUsDujLNGIKV0v8xIrnLq8KXNUWnS0Bc4YAhO8ndqzTOsYpwkxi+Ho3uEGp6aECjA
 ooJ3DLcPVEr5Jl/Eh006J37yyRCGpbM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-255-vjuKSaHkO7SQjcLHlPUFag-1; Tue, 14 Feb 2023 02:51:05 -0500
X-MC-Unique: vjuKSaHkO7SQjcLHlPUFag-1
Received: by mail-wm1-f71.google.com with SMTP id
 o8-20020a05600c510800b003dfdf09ffc2so7390810wms.5
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 23:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6t/ID2NgaSnoUtHJxef8rum49YC2wMiQm0SMS0qgKLQ=;
 b=tqflpxzykcnU9Wi5dSv2OdZnvWlE0LiZvfz0EeLYFmRyEMYM/WmCOlAWZvVMBT17wP
 QlcFwVhRtLqoFREXORz8N1OmFEr4REEuQ0PpPNMtUJi/2oYZR1R8SP5H0Csvq2qWFY3Q
 HPRJPpGmsM1VaANTM1tyCMWeHN1DRy0YJchCqMb9h1ZdQJBcTna0PwekifdqbJnLgQ9Y
 Wzkf8h+ueMJXTtpPlJzXlQRStMYx8Uv17JgWfnXjed0fl4EIXM1zrYxN+Kig0827xzZK
 jB7tI8wvlSFaavUb6YjMNA/t5cRnhN0XhJUtYG88aO52sa4NEXANF/FHJ94xFkwy0hxT
 l/4g==
X-Gm-Message-State: AO0yUKUvMVzUwzHZ2694OeBHsrYHhSVkIITkEfwISgRZLZoQk/P4kkL3
 ZMWEhUHwvLsEWFEgvjmmWcdi8lKu9ZuAnrDM17cC/SCVrsIlV1MZd3TqnT5d/xJJNqgU0WcT24w
 SjynkQmDzMomZlXM=
X-Received: by 2002:a5d:6652:0:b0:2c5:56f7:51ec with SMTP id
 f18-20020a5d6652000000b002c556f751ecmr1196749wrw.1.1676361061714; 
 Mon, 13 Feb 2023 23:51:01 -0800 (PST)
X-Google-Smtp-Source: AK7set+SiUM1IL1u9s918j0V34fD89N1/ld+ZBCTyKu6BEKmt8/cRwzHeCr/QiKdwgDF2OYepURcJg==
X-Received: by 2002:a5d:6652:0:b0:2c5:56f7:51ec with SMTP id
 f18-20020a5d6652000000b002c556f751ecmr1196731wrw.1.1676361061482; 
 Mon, 13 Feb 2023 23:51:01 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 f26-20020a5d58fa000000b002c5526680cbsm6656000wrd.92.2023.02.13.23.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 23:51:00 -0800 (PST)
Date: Tue, 14 Feb 2023 02:50:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Gautam Dawar <gdawar@xilinx.com>, Parav Pandit <parav@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, Eli Cohen <eli@mellanox.com>,
 alvaro.karsz@solid-run.com, Lei Yang <leiyang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] vhost: accept VIRTIO_F_ORDER_PLATFORM as a valid SVQ
 feature
Message-ID: <20230214024736-mutt-send-email-mst@kernel.org>
References: <20230213191929.1547497-1-eperezma@redhat.com>
 <CACGkMEsQe=zcfmK=rMH=u6RgHkkBFs+tJO7gT0v_bWwJ_N+z6Q@mail.gmail.com>
 <CAJaqyWfsBLvsJNF=RvhbirwNypzjfaO7thyK22s-nCjdaNs4yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWfsBLvsJNF=RvhbirwNypzjfaO7thyK22s-nCjdaNs4yQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 14, 2023 at 08:02:08AM +0100, Eugenio Perez Martin wrote:
> On Tue, Feb 14, 2023 at 7:31 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Tue, Feb 14, 2023 at 3:19 AM Eugenio Pérez <eperezma@redhat.com> wrote:
> > >
> > > VIRTIO_F_ORDER_PLATFORM indicates that memory accesses by the driver and
> > > the device are ordered in a way described by the platform.  Since vDPA
> > > devices may be backed by a hardware devices, let's allow
> > > VIRTIO_F_ORDER_PLATFORM.
> > >
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > ---
> > >  hw/virtio/vhost-shadow-virtqueue.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> > > index 4307296358..6bb1998f12 100644
> > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > @@ -34,6 +34,7 @@ bool vhost_svq_valid_features(uint64_t features, Error **errp)
> > >          switch (b) {
> > >          case VIRTIO_F_ANY_LAYOUT:
> > >          case VIRTIO_RING_F_EVENT_IDX:
> > > +        case VIRTIO_F_ORDER_PLATFORM:
> >
> > Do we need to add this bit to vdpa_feature_bits[] as well?
> >
> 
> If we want to pass it to the guest, yes we should. I'll send another
> patch for it.
> 
> But I think that should be done on top / in parallel actually.
> 
> Open question: Should all vdpa hardware devices offer it? Or this is
> only needed on specific archs?
> 
> Thanks!

I don't get what this is doing at all frankly. vdpa has to
pass VIRTIO_F_ORDER_PLATFORM to guest at all times - unless
- it's a x86 host where it kind of works anyway
- it's vduse which frankly is so slow we can do VIRTIO_F_ORDER_PLATFORM anyway.
In short VIRTIO_F_ORDER_PLATFORM has nothing to do with the device
and everything with qemu itself.

Yea we can allow VIRTIO_F_ORDER_PLATFORM from kernel but given
we never did at this point it will need a protocol feature bit.
I don't think it's worth it ..


-- 
MST


