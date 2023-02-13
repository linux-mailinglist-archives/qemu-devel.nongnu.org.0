Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E0C694BC1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:53:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRb7U-0005DJ-3I; Mon, 13 Feb 2023 10:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pRb7S-0005Cv-3L
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:51:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pRb7P-0001Ve-Ua
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676303510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mpdbX9IcRrxSuodhZTzRZ9mlGYdcvD5xn/wQaelflIk=;
 b=Qwx5UClZHRawTFpm0+tqS0ND1cqf9GmWnt7M/9aUxS772ceNM0IRsoWi7zcbPIpDj7g57l
 ZgPCM0yEQzRgpTxf4Bv7Gis3+xhJ5tuWdsillkB1gQMOj3mWo613+WZNh/YMFuVJp0exAJ
 GyPASBWfLVZ24i9dGlGhbqulosl0sGk=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-vyrp1SUUOpirr3OLwCHIjQ-1; Mon, 13 Feb 2023 10:51:49 -0500
X-MC-Unique: vyrp1SUUOpirr3OLwCHIjQ-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-4fa63c84621so131086677b3.20
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 07:51:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mpdbX9IcRrxSuodhZTzRZ9mlGYdcvD5xn/wQaelflIk=;
 b=VVpQ9qX0vCGlwq5alXXUg/Tkt1OXJW/0B8PE5pWd/JkqZFWQsB8UxY6FFbxrEUTt/C
 sgyqGSpIHRO1tZ7H4iuWmxGKmCFYrVIJWAVlhje4xn1X/y+OuyuE1UyTl+hFA2z2MOKw
 VV1CLJMfbM+CQQkEAiMDG4A5nYEQl6EvGn8mg/dkAPV1JicMubOIYZC+9Q/I1tj6SJJ/
 4O8Ns3LA2JEfxDKu0TTirsIiAyUXdYC0PwzE+s6N7atrNwylJlCJEPDL9n5mghLGCgxm
 RwkmO6OMO6DJkLqBrCdRSP4L8P/JOQJbWqeo6wPv1h4kNNxJQcOPzut/bmSfA5Vu4i9g
 Zjqw==
X-Gm-Message-State: AO0yUKUvAlfbzmpEj5+FZ55WKM9ttO5Id+D0W7OJ1wN0qB75ixo0pdmX
 Hv19Aa3FUJ9+PQapKt7hBSTixWTGJ6BI8RQtE8Scf4ZqtFqMHV28Qbps5k4cJg70udNHTSiTp6c
 PQ+1Gh0DrXBjcm6JyL+gw0u7M3F1WUYQ=
X-Received: by 2002:a25:8c8b:0:b0:802:4849:af69 with SMTP id
 m11-20020a258c8b000000b008024849af69mr2782604ybl.13.1676303509005; 
 Mon, 13 Feb 2023 07:51:49 -0800 (PST)
X-Google-Smtp-Source: AK7set89ejhr2S12WZ6dKg9x6WCx2kTgfebYD0br+VnSPMZFLXscSkpDE4Sfq/ZQYFu4sSbfbPFSddXMOqpZTuvj8ck=
X-Received: by 2002:a25:8c8b:0:b0:802:4849:af69 with SMTP id
 m11-20020a258c8b000000b008024849af69mr2782596ybl.13.1676303508745; Mon, 13
 Feb 2023 07:51:48 -0800 (PST)
MIME-Version: 1.0
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-8-eperezma@redhat.com>
 <2901fd82-5c0e-c830-5288-a72b8c08d628@oracle.com>
In-Reply-To: <2901fd82-5c0e-c830-5288-a72b8c08d628@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 13 Feb 2023 16:51:11 +0100
Message-ID: <CAJaqyWdUvPjd--i3DmuyP+pGTxE9gDNnqCwLu73bNmCYoKrLJA@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] vdpa: add vdpa net migration state notifier
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Lei Yang <leiyang@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Shannon Nelson <snelson@pensando.io>, 
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefano Garzarella <sgarzare@redhat.com>
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

On Mon, Feb 13, 2023 at 7:51 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
> On 2/8/2023 1:42 AM, Eugenio P=C3=A9rez wrote:
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
> > v3:
> > * Add TODO to use the resume operation in the future.
> > * Use migration_in_setup and migration_has_failed instead of a
> >    complicated switch case.
> > ---
> >   net/vhost-vdpa.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 76 insertions(+)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index dd686b4514..bca13f97fd 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -26,12 +26,14 @@
> >   #include <err.h>
> >   #include "standard-headers/linux/virtio_net.h"
> >   #include "monitor/monitor.h"
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
> > @@ -241,10 +243,79 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_vd=
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
> > +    NetClientState *peer;
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
> What if vhost gets started after migration is started, will svq still be
> (dynamically) enabled during vhost_dev_start()? I don't see relevant
> code to deal with it?
>

Good catch. v->shadow_vqs_enabled must change even if
!n->vhost_started. That should be the only code needed.

Also, migration listener must be registered from qemu startup, not on
device start.

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
> > +    peer =3D s->nc.peer;
> > +    for (int i =3D 0; i < data_queue_pairs + cvq; i++) {
> > +        VhostVDPAState *vdpa_state;
> > +        NetClientState *nc;
> > +
> > +        if (i < data_queue_pairs) {
> > +            nc =3D qemu_get_peer(peer, i);
> > +        } else {
> > +            nc =3D qemu_get_peer(peer, n->max_queue_pairs);
> > +        }
> > +
> > +        vdpa_state =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +        vdpa_state->vhost_vdpa.shadow_data =3D enable;
> Don't get why shadow_data is set on cvq's vhost_vdpa? This may result in
> address space collision: data vq's iova getting improperly allocated on
> cvq's address space in vhost_vdpa_listener_region_{add,del}(). Noted
> currently there's an issue where guest VM's memory listener registration
> is always hooked to the last vq, which could be on the cvq in a
> different iova address space VHOST_VDPA_NET_CVQ_ASID.
>

Let me answer in reverse. guest VM's memory listener registration is
effectively always hooked to the last vq, that's why shadow_data is
needed.

In the past it was enough with v->shadow_vqs_enabled. However, since
the introduction of ASID support & CVQ tracking through it, The
listener (hooked at CVQ) needs to know if it should use iova tree or
not. That's why a separated variable shadow_data is needed.

That way, it may happen that cvq vhost_vdpa->shadow_vqs_enabled =3D true
but cvq vhost_vdpa->shadow_vqs_enabledshadow_data =3D false.

Is that clearer?

Thanks!

> Thanks,
> -Siwei
>
> > +
> > +        if (i < data_queue_pairs) {
> > +            /* Do not override CVQ shadow_vqs_enabled */
> > +            vdpa_state->vhost_vdpa.shadow_vqs_enabled =3D enable;
> > +        }
> > +    }
> > +
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
> > @@ -278,6 +349,10 @@ static void vhost_vdpa_net_client_stop(NetClientSt=
ate *nc)
> >
> >       assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >
> > +    if (s->vhost_vdpa.index =3D=3D 0) {
> > +        remove_migration_state_change_notifier(&s->migration_state);
> > +    }
> > +
> >       dev =3D s->vhost_vdpa.dev;
> >       if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> >           g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_del=
ete);
> > @@ -741,6 +816,7 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >       s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >       s->vhost_vdpa.index =3D queue_pair_index;
> >       s->always_svq =3D svq;
> > +    s->migration_state.notify =3D vdpa_net_migration_state_notifier;
> >       s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >       s->vhost_vdpa.iova_range =3D iova_range;
> >       s->vhost_vdpa.shadow_data =3D svq;
>


