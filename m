Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842786A743A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 20:27:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXS6p-0003f4-Rl; Wed, 01 Mar 2023 14:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXS6n-0003ew-UA
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:27:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXS6l-0001ZF-CF
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677698842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yU3rZ029Q+rLmU4yhYKSsHxQMSSerlr681ZzCmSTcBc=;
 b=itz2ScdlgUumunsn20ZHaKXgUixteHMiegcIcwvmtwccJdjKp1vN5yzdzLr07+dGcNGu9/
 dXH1yBC+nCrAjK20max+9yQKbD8JLuch4dtLY5CpCfTmeamj7NtXNDE4zjAopabHzHjINi
 XQxVZNJB+P5bACgqOIWbftrRAHdFfjo=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-6yKEHYxyNgmr5V6sul01WA-1; Wed, 01 Mar 2023 14:27:21 -0500
X-MC-Unique: 6yKEHYxyNgmr5V6sul01WA-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-536a545bfbaso292181187b3.20
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 11:27:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677698840;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yU3rZ029Q+rLmU4yhYKSsHxQMSSerlr681ZzCmSTcBc=;
 b=nrDDuQZvbFBtLadhy8emL163LTLNCHh9fzjaksvbg5QNHPRQvHVnp/Gvu638ifSnUG
 6YHzcrgkC+4uwZbyFPiq2vAcTKl6bzkExEk+VTlV0WGW+JUqHlsRpVsDGYqf6fN7L2BX
 aPwta8Ag7UvUFzMqe4XtKR5Gw/g8ZGBOlwmtGlASIQ5HiZtY3oUGVNgVSWeJiyBJCkFN
 FxHLHP4sGY89bAIJZM8FVZoDgA7INchtJidoQrP851sk/VAy6HuCuUu6Xa6f7J/xSHn1
 miMTIBYbQ4TEzVXjCkudFlzDBtPAX8myDtQm+vWo1Tx0SL/peAc7ICliuB3Jt+Cq3nzP
 amOA==
X-Gm-Message-State: AO0yUKUxhhrQO0FEn7EPwH2OFJJWqyXa/uTg3iOtGs+BGk30vcnELljx
 fJOju2nIvogH8piRYU/wMrndt1WVWeivPbzF4+w7myt8VBfi36aFdr0LA/BKBhU0WCOPb4R6n4Q
 zJI/ZuRpXO4RtEYgzknJ2vWPdfgybtGU=
X-Received: by 2002:a05:6902:18c2:b0:8ed:3426:8a69 with SMTP id
 ck2-20020a05690218c200b008ed34268a69mr14532640ybb.1.1677698840282; 
 Wed, 01 Mar 2023 11:27:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+OIimwJ5dlyOqsSFE67Mjmnw8HO1zyhL3oMdxllaRAEXRDano5p1bplbgRi5sQgQYu57KgR0G/YS5RVl8Apnk=
X-Received: by 2002:a05:6902:18c2:b0:8ed:3426:8a69 with SMTP id
 ck2-20020a05690218c200b008ed34268a69mr14532610ybb.1.1677698839966; Wed, 01
 Mar 2023 11:27:19 -0800 (PST)
MIME-Version: 1.0
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-10-eperezma@redhat.com>
 <afad31de-8109-36b7-b7ea-aa2e1a24f254@redhat.com>
In-Reply-To: <afad31de-8109-36b7-b7ea-aa2e1a24f254@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 1 Mar 2023 20:26:43 +0100
Message-ID: <CAJaqyWdyM6i6-GVNUbEkQ_Bo+AhbAQRDx3wZxRu-jwtc1mZT2g@mail.gmail.com>
Subject: Re: [PATCH v4 09/15] vdpa: add vdpa net migration state notifier
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>, 
 Shannon Nelson <snelson@pensando.io>, Gautam Dawar <gdawar@xilinx.com>, 
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Mon, Feb 27, 2023 at 9:08 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/2/24 23:54, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > This allows net to restart the device backend to configure SVQ on it.
> >
> > Ideally, these changes should not be net specific. However, the vdpa ne=
t
> > backend is the one with enough knowledge to configure everything becaus=
e
> > of some reasons:
> > * Queues might need to be shadowed or not depending on its kind (contro=
l
> >    vs data).
> > * Queues need to share the same map translations (iova tree).
> >
> > Because of that it is cleaner to restart the whole net backend and
> > configure again as expected, similar to how vhost-kernel moves between
> > userspace and passthrough.
> >
> > If more kinds of devices need dynamic switching to SVQ we can create a
> > callback struct like VhostOps and move most of the code there.
> > VhostOps cannot be reused since all vdpa backend share them, and to
> > personalize just for networking would be too heavy.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> > v4:
> > * Delete duplication of set shadow_data and shadow_vqs_enabled moving i=
t
> >    to data / cvq net start functions.
> >
> > v3:
> > * Check for migration state at vdpa device start to enable SVQ in data
> >    vqs.
> >
> > v1 from RFC:
> > * Add TODO to use the resume operation in the future.
> > * Use migration_in_setup and migration_has_failed instead of a
> >    complicated switch case.
> > ---
> >   net/vhost-vdpa.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++-=
-
> >   1 file changed, 69 insertions(+), 3 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index b89c99066a..c5512ddf10 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -26,12 +26,15 @@
> >   #include <err.h>
> >   #include "standard-headers/linux/virtio_net.h"
> >   #include "monitor/monitor.h"
> > +#include "migration/migration.h"
> > +#include "migration/misc.h"
> >   #include "hw/virtio/vhost.h"
> >
> >   /* Todo:need to add the multiqueue support here */
> >   typedef struct VhostVDPAState {
> >       NetClientState nc;
> >       struct vhost_vdpa vhost_vdpa;
> > +    Notifier migration_state;
> >       VHostNetState *vhost_net;
> >
> >       /* Control commands shadow buffers */
> > @@ -239,10 +242,59 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_vd=
pa(VhostVDPAState *s)
> >       return DO_UPCAST(VhostVDPAState, nc, nc0);
> >   }
> >
> > +static void vhost_vdpa_net_log_global_enable(VhostVDPAState *s, bool e=
nable)
> > +{
> > +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > +    VirtIONet *n;
> > +    VirtIODevice *vdev;
> > +    int data_queue_pairs, cvq, r;
> > +
> > +    /* We are only called on the first data vqs and only if x-svq is n=
ot set */
> > +    if (s->vhost_vdpa.shadow_vqs_enabled =3D=3D enable) {
> > +        return;
> > +    }
> > +
> > +    vdev =3D v->dev->vdev;
> > +    n =3D VIRTIO_NET(vdev);
> > +    if (!n->vhost_started) {
> > +        return;
> > +    }
> > +
> > +    data_queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;
> > +    cvq =3D virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> > +                                  n->max_ncs - n->max_queue_pairs : 0;
> > +    /*
> > +     * TODO: vhost_net_stop does suspend, get_base and reset. We can b=
e smarter
> > +     * in the future and resume the device if read-only operations bet=
ween
> > +     * suspend and reset goes wrong.
> > +     */
> > +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
> > +
> > +    /* Start will check migration setup_or_active to configure or not =
SVQ */
> > +    r =3D vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
> > +    if (unlikely(r < 0)) {
> > +        error_report("unable to start vhost net: %s(%d)", g_strerror(-=
r), -r);
> > +    }
> > +}
> > +
> > +static void vdpa_net_migration_state_notifier(Notifier *notifier, void=
 *data)
> > +{
> > +    MigrationState *migration =3D data;
> > +    VhostVDPAState *s =3D container_of(notifier, VhostVDPAState,
> > +                                     migration_state);
> > +
> > +    if (migration_in_setup(migration)) {
> > +        vhost_vdpa_net_log_global_enable(s, true);
> > +    } else if (migration_has_failed(migration)) {
> > +        vhost_vdpa_net_log_global_enable(s, false);
> > +    }
> > +}
> > +
> >   static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
> >   {
> >       struct vhost_vdpa *v =3D &s->vhost_vdpa;
> >
> > +    add_migration_state_change_notifier(&s->migration_state);
> >       if (v->shadow_vqs_enabled) {
> >           v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> >                                              v->iova_range.last);
> > @@ -256,6 +308,15 @@ static int vhost_vdpa_net_data_start(NetClientStat=
e *nc)
> >
> >       assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >
> > +    if (s->always_svq ||
> > +        migration_is_setup_or_active(migrate_get_current()->state)) {
> > +        v->shadow_vqs_enabled =3D true;
> > +        v->shadow_data =3D true;
> > +    } else {
> > +        v->shadow_vqs_enabled =3D false;
> > +        v->shadow_data =3D false;
> > +    }
> > +
> >       if (v->index =3D=3D 0) {
> >           vhost_vdpa_net_data_start_first(s);
> >           return 0;
> > @@ -276,6 +337,10 @@ static void vhost_vdpa_net_client_stop(NetClientSt=
ate *nc)
> >
> >       assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >
> > +    if (s->vhost_vdpa.index =3D=3D 0) {
> > +        remove_migration_state_change_notifier(&s->migration_state);
> > +    }
>
>
> This should work but I just realize that vhost support
> vhost_dev_set_log(), I wonder if it would be simpler to go with that way.
>
> Using vhost_virtqueue_set_addr(, enable_log =3D true)?
>

We can do that but it has the same problem as with checking _F_LOG_ALL
in set_features:

1. We're tearing down a vhost device using a listener registered
against that device, at start / stop.
2. We need to traverse all the devices many times to first get all the
vqs state and then transverse them again to set them up properly.

My two ideas to solve the recursiveness of 1 are:
a. Duplicating vhost_dev_start / vhost_dev_stop at
vhost_vdpa_set_features / vhost_vdpa_set_vring_addr.

This has the same problem as all duplications: It will get out of sync
eventually. For example, the latest changes about configure interrupt
would need to be duplicated in this new call.

b. Add a new parameter to vhost_dev_start/stop to skip the
set_features / set_vring_address step.
Now that the virtio queue reset changes have exposed these functions
it is also possible to call them from vhost-vdpa.

Maybe we can store that parameter in vhost_vdpa so we don't call
vhost_dev_start / stop there instead of affecting all backends, but
the idea is the same.

For problem 2 I still do not have a solution. CVQ / MQ Is out of the
scope for this series but I think it will bite us when we add it
(hopefully soon).

Thanks!

> Thanks
>
>
> > +
> >       dev =3D s->vhost_vdpa.dev;
> >       if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> >           g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_del=
ete);
> > @@ -412,11 +477,12 @@ static int vhost_vdpa_net_cvq_start(NetClientStat=
e *nc)
> >       s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >       v =3D &s->vhost_vdpa;
> >
> > -    v->shadow_data =3D s->always_svq;
> > +    s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> > +    v->shadow_data =3D s0->vhost_vdpa.shadow_vqs_enabled;
> >       v->shadow_vqs_enabled =3D s->always_svq;
> >       s->vhost_vdpa.address_space_id =3D VHOST_VDPA_GUEST_PA_ASID;
> >
> > -    if (s->always_svq) {
> > +    if (s->vhost_vdpa.shadow_data) {
> >           /* SVQ is already configured for all virtqueues */
> >           goto out;
> >       }
> > @@ -473,7 +539,6 @@ out:
> >           return 0;
> >       }
> >
> > -    s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> >       if (s0->vhost_vdpa.iova_tree) {
> >           /*
> >            * SVQ is already configured for all virtqueues.  Reuse IOVA =
tree for
> > @@ -749,6 +814,7 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >       s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >       s->vhost_vdpa.index =3D queue_pair_index;
> >       s->always_svq =3D svq;
> > +    s->migration_state.notify =3D vdpa_net_migration_state_notifier;
> >       s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >       s->vhost_vdpa.iova_range =3D iova_range;
> >       s->vhost_vdpa.shadow_data =3D svq;
>


