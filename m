Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6911D6455F4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 10:01:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2qIK-0006Uu-Mf; Wed, 07 Dec 2022 04:00:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2qI4-0006TA-8r
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 04:00:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2qI2-0006n3-Jh
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 04:00:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670403629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NzInKG+XjavVSFcFYW5xl85lIY5bHbsGI/9xDX8HeTU=;
 b=EGM3Ks2Df139AoLpmxPKPR70jZLkkGXbiZxjfYldQxJwLG9R7BNKwQYUBGhM9vadRk6Dex
 /fHwXL7D519VNeReFNu71OmWzbwYvhYnsKrWKJ0K9VikanEHaseEesm+yFRatAQb66/vIN
 df5V+a+ZitenAqHm6hi3trJOlpcY8KQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-280-kdaD-q_rM8i8VCu9rVQqeg-1; Wed, 07 Dec 2022 04:00:27 -0500
X-MC-Unique: kdaD-q_rM8i8VCu9rVQqeg-1
Received: by mail-ej1-f70.google.com with SMTP id
 qf25-20020a1709077f1900b0078c02a23da3so2991727ejc.0
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 01:00:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NzInKG+XjavVSFcFYW5xl85lIY5bHbsGI/9xDX8HeTU=;
 b=sJGAH8adCz9Xs1uORySzqyjMIphTK0SIMJSUlnXy8L8jAqpg88d3N0Ac1cvOu87BZR
 MzoDrtphWv0LXerYNT/9hIs6gjy0s9ZyETq6EIob3HGLAgbPMFd1/oyqHIRL6xc5wLqw
 u1M4SIsSTxNPpMmQ38CSAQ18DD6YV5bqvdaZf1wu8h244nXR9KYYtblyb5zfSJeuc0Ex
 /7Ye/LUciNNiruo4CMNz7MPyBdVQS2r6F+5HBRvaCF04fVzqgBdFkDjz9RemH2ROlYQb
 YPC/Q5AHXrH3NL/lQs7qWMV+Ot+8gnXPprTUyiNNYRG3zSiHg1CEAD5yEE+4a9hz6sqH
 5Ccg==
X-Gm-Message-State: ANoB5pkszl41Qv00pXd1bU4DUXVuslGmhTfCpQcCWQlL/CPF+sUbSjEo
 7Nkd4wxECBXEhboo/G4dxu0kZNhf/3Mel20xg/Cc5p/C1V7Q1GNuj0d5oo65FqiETbsrzeWdaJI
 vwLOXL3RzOHHGxvB0uC1OTvgilR9sZ+8=
X-Received: by 2002:a17:907:cf84:b0:78d:4795:ff1f with SMTP id
 ux4-20020a170907cf8400b0078d4795ff1fmr30684071ejc.331.1670403625993; 
 Wed, 07 Dec 2022 01:00:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4ThAAoJqVwEhTP7aWEEenDl0V2m3WCPwjbLYu0P1+6fx4YgMjjfu6BRwN7P127AgZgpDl+K/HSy+T6VFvdyQI=
X-Received: by 2002:a17:907:cf84:b0:78d:4795:ff1f with SMTP id
 ux4-20020a170907cf8400b0078d4795ff1fmr30684046ejc.331.1670403625779; Wed, 07
 Dec 2022 01:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20221205170436.2977336-1-eperezma@redhat.com>
 <CACGkMEvQov+eGr8D7FAG5FYOvj8VQ=gEvomrnU5_2R0d55gSLQ@mail.gmail.com>
In-Reply-To: <CACGkMEvQov+eGr8D7FAG5FYOvj8VQ=gEvomrnU5_2R0d55gSLQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 7 Dec 2022 09:59:48 +0100
Message-ID: <CAJaqyWecmWWRUwfm8D2TTsOR=kybwQ5BpyZXjSDLouWwWutXVQ@mail.gmail.com>
Subject: Re: [RFC PATCH for 8.0 00/13] vDPA-net inflight descriptors migration
 with SVQ
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Gautam Dawar <gdawar@xilinx.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Tue, Dec 6, 2022 at 8:08 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Dec 6, 2022 at 1:04 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
> >
> > The state of the descriptors (avail or used) may not be recoverable jus=
t
> > looking at the guest memory.  Out of order used descriptor may override
> > previous avail ones in the descriptor table or avail vring.
> >
> > Currently we're not migrating this status in net devices because virtio=
-net,
> > vhost-kernel etc use the descriptors in order,
>
> Note that this might not be the truth (when zerocopy is enabled).
>

Good point. So will virtio-net wait for those to complete then? How
does qemu handle if there are still inflight descriptors?

> > so the information always
> > recoverable from guest's memory.  However, vDPA devices may use them ou=
t of
> > order, and other kind of devices like block need this support.
> >
> > Shadow virtqueue is able to track these and resend them at the destinat=
ion.
>
> As discussed, there's a bootstrap issue here:
>
> When SVQ needs to be enabled on demand, do we still need another way
> to get inflight ones without the help of SVQ?
>

To send and retrieve the descriptor without SVQ needs to be developed
on top of this. I should have made that more clear here in the cover
letter.

Thanks!

> Thanks
>
> > Add them to the virtio-net migration description so they are not lose i=
n the
> > process.
> >
> > This is a very early RFC just to validate the first draft so expect lef=
tovers.
> > To fetch and request the descriptors from a device without SVQ need to =
be
> > implemented on top. Some other notable pending items are:
> > * Do not send the descriptors actually recoverable from the guest memor=
y.
> > * Properly version the migrate data.
> > * Properly abstract the descriptors access from virtio-net to SVQ.
> > * Do not use VirtQueueElementOld but migrate directly VirtQueueElement.
> > * Replace lots of assertions with runtime conditionals.
> > * Other TODOs in the patch message or code changes.
> >
> > Thanks.
> >
> > Eugenio P=C3=A9rez (13):
> >   vhost: add available descriptor list in SVQ
> >   vhost: iterate only available descriptors at SVQ stop
> >   vhost: merge avail list and next avail descriptors detach
> >   vhost: add vhost_svq_save_inflight
> >   virtio: Specify uint32_t as VirtQueueElementOld members type
> >   virtio: refactor qemu_get_virtqueue_element
> >   virtio: refactor qemu_put_virtqueue_element
> >   virtio: expose VirtQueueElementOld
> >   virtio: add vmstate_virtqueue_element_old
> >   virtio-net: Migrate vhost inflight descriptors
> >   virtio-net: save inflight descriptors at vhost shutdown
> >   vhost: expose vhost_svq_add_element
> >   vdpa: Recover inflight descriptors
> >
> >  hw/virtio/vhost-shadow-virtqueue.h |   9 ++
> >  include/hw/virtio/virtio-net.h     |   2 +
> >  include/hw/virtio/virtio.h         |  32 ++++++
> >  include/migration/vmstate.h        |  22 ++++
> >  hw/net/vhost_net.c                 |  56 ++++++++++
> >  hw/net/virtio-net.c                | 129 +++++++++++++++++++++++
> >  hw/virtio/vhost-shadow-virtqueue.c |  52 +++++++--
> >  hw/virtio/vhost-vdpa.c             |  11 --
> >  hw/virtio/virtio.c                 | 162 ++++++++++++++++++-----------
> >  9 files changed, 392 insertions(+), 83 deletions(-)
> >
> > --
> > 2.31.1
> >
> >
>


