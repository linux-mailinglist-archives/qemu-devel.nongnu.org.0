Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3591C6469C0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 08:33:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3BNx-0000e9-6c; Thu, 08 Dec 2022 02:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p3BNs-0000e0-Qx
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:31:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p3BNq-0006NS-Da
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670484712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pX8u87NuWjuYEqEMOm2+fjVMgozbg7SdhiqPIEZ5pb4=;
 b=MlEHke2jkvRBWEqAW37bZdJJOndQGxisp77sze26UV6P08DhrgZHosQo/gn/t3xXRbDuVI
 PpysJTemUkjjhqZR+ViiBO/7DsuAQmP8HBR4Ui4O6iBljGKLguH0skRvD2VzDHHNUDnuBi
 6mVhM0VvBTiAoqv9wJqOg2cxt2sanEs=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-362-FzsgFvvUPJKQwG4EcHYzGg-1; Thu, 08 Dec 2022 02:31:51 -0500
X-MC-Unique: FzsgFvvUPJKQwG4EcHYzGg-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-144870e8fe8so384075fac.13
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 23:31:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pX8u87NuWjuYEqEMOm2+fjVMgozbg7SdhiqPIEZ5pb4=;
 b=dVMhzeS7OM+1eE2Jl8DnLLRXJY8vgfd/5J2BjAm+hdRDBsJm+pLSLqCyXHG7dj/EFq
 NZhPjEGyVluZx2xSKRiDGJI3Obf2ZsJ/ktmx9jjFU9CcH/XZRvcOUQldkvb4waZuUArL
 yGdGvOVqpYwf5ClSkF1qwpDBpBZOYCKuVfS1u1SSAJHseaCpUqN89h6F3zGll6f9K0iq
 +fVeFqP4cGhZfYTvx2uBtwGFxhSKMbu0Q6+VCYp2mpZYe7u1H40FAfk1OzQ3lJUUXqEK
 ekyr8qKtBHSNts1rth5gV9Kv5GwjTzc5Z9kNXCVfwABEg5XjFUdn+RK7EZoYNl1rZYrP
 uxRA==
X-Gm-Message-State: ANoB5pkb7OETTTYp1zZy9jKq9zICx3MuQCVnQRs993VCekIkAuzhpDI3
 tqmgzi4RFFbLB6GoDJGQubRGcgx22usadYcuE2KGBgtecgz0MyQT8DFG5y/owNqJCQ1uhJ2eYXB
 t5OfhY+xkEAmIHKRfPjqMAa5GJkokM0I=
X-Received: by 2002:a05:6870:b9b:b0:144:b22a:38d3 with SMTP id
 lg27-20020a0568700b9b00b00144b22a38d3mr7086110oab.280.1670484710584; 
 Wed, 07 Dec 2022 23:31:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf762ptFgleVQIGMXOUL6iQRiYL9/AB61imGlSY98c8QPFJAGjAnq6n3xAbD9+/wwmwx+bKLHY+WBT0hGi25hVc=
X-Received: by 2002:a05:6870:b9b:b0:144:b22a:38d3 with SMTP id
 lg27-20020a0568700b9b00b00144b22a38d3mr7086105oab.280.1670484710376; Wed, 07
 Dec 2022 23:31:50 -0800 (PST)
MIME-Version: 1.0
References: <20221205170436.2977336-1-eperezma@redhat.com>
 <CACGkMEvQov+eGr8D7FAG5FYOvj8VQ=gEvomrnU5_2R0d55gSLQ@mail.gmail.com>
 <CAJaqyWecmWWRUwfm8D2TTsOR=kybwQ5BpyZXjSDLouWwWutXVQ@mail.gmail.com>
In-Reply-To: <CAJaqyWecmWWRUwfm8D2TTsOR=kybwQ5BpyZXjSDLouWwWutXVQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 8 Dec 2022 15:31:39 +0800
Message-ID: <CACGkMEtRvjUafVLaDG=zzAEe+5-HZpijYQHoNY4uPfWwR-08yg@mail.gmail.com>
Subject: Re: [RFC PATCH for 8.0 00/13] vDPA-net inflight descriptors migration
 with SVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Wed, Dec 7, 2022 at 5:00 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Tue, Dec 6, 2022 at 8:08 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Tue, Dec 6, 2022 at 1:04 AM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> > >
> > > The state of the descriptors (avail or used) may not be recoverable j=
ust
> > > looking at the guest memory.  Out of order used descriptor may overri=
de
> > > previous avail ones in the descriptor table or avail vring.
> > >
> > > Currently we're not migrating this status in net devices because virt=
io-net,
> > > vhost-kernel etc use the descriptors in order,
> >
> > Note that this might not be the truth (when zerocopy is enabled).
> >
>
> Good point. So will virtio-net wait for those to complete then?

Vhost-net will wait for all the inflight descriptors to be completed.

> How
> does qemu handle if there are still inflight descriptors?

It doesn't care right now. For networking devices, devices can choose
to flush inflight before suspending. But this won't work for other
type of device like block.

Thanks

>
> > > so the information always
> > > recoverable from guest's memory.  However, vDPA devices may use them =
out of
> > > order, and other kind of devices like block need this support.
> > >
> > > Shadow virtqueue is able to track these and resend them at the destin=
ation.
> >
> > As discussed, there's a bootstrap issue here:
> >
> > When SVQ needs to be enabled on demand, do we still need another way
> > to get inflight ones without the help of SVQ?
> >
>
> To send and retrieve the descriptor without SVQ needs to be developed
> on top of this. I should have made that more clear here in the cover
> letter.
>
> Thanks!
>
> > Thanks
> >
> > > Add them to the virtio-net migration description so they are not lose=
 in the
> > > process.
> > >
> > > This is a very early RFC just to validate the first draft so expect l=
eftovers.
> > > To fetch and request the descriptors from a device without SVQ need t=
o be
> > > implemented on top. Some other notable pending items are:
> > > * Do not send the descriptors actually recoverable from the guest mem=
ory.
> > > * Properly version the migrate data.
> > > * Properly abstract the descriptors access from virtio-net to SVQ.
> > > * Do not use VirtQueueElementOld but migrate directly VirtQueueElemen=
t.
> > > * Replace lots of assertions with runtime conditionals.
> > > * Other TODOs in the patch message or code changes.
> > >
> > > Thanks.
> > >
> > > Eugenio P=C3=A9rez (13):
> > >   vhost: add available descriptor list in SVQ
> > >   vhost: iterate only available descriptors at SVQ stop
> > >   vhost: merge avail list and next avail descriptors detach
> > >   vhost: add vhost_svq_save_inflight
> > >   virtio: Specify uint32_t as VirtQueueElementOld members type
> > >   virtio: refactor qemu_get_virtqueue_element
> > >   virtio: refactor qemu_put_virtqueue_element
> > >   virtio: expose VirtQueueElementOld
> > >   virtio: add vmstate_virtqueue_element_old
> > >   virtio-net: Migrate vhost inflight descriptors
> > >   virtio-net: save inflight descriptors at vhost shutdown
> > >   vhost: expose vhost_svq_add_element
> > >   vdpa: Recover inflight descriptors
> > >
> > >  hw/virtio/vhost-shadow-virtqueue.h |   9 ++
> > >  include/hw/virtio/virtio-net.h     |   2 +
> > >  include/hw/virtio/virtio.h         |  32 ++++++
> > >  include/migration/vmstate.h        |  22 ++++
> > >  hw/net/vhost_net.c                 |  56 ++++++++++
> > >  hw/net/virtio-net.c                | 129 +++++++++++++++++++++++
> > >  hw/virtio/vhost-shadow-virtqueue.c |  52 +++++++--
> > >  hw/virtio/vhost-vdpa.c             |  11 --
> > >  hw/virtio/virtio.c                 | 162 ++++++++++++++++++---------=
--
> > >  9 files changed, 392 insertions(+), 83 deletions(-)
> > >
> > > --
> > > 2.31.1
> > >
> > >
> >
>


