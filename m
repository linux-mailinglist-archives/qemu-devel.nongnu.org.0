Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78569669219
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 10:02:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFvk-00018h-Ru; Fri, 13 Jan 2023 04:00:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGFve-00018R-RO
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 04:00:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGFvc-0000H7-K7
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 04:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673600446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NsMRz8xxQtIv7CjqgxPmGxbo+R17HVzXGVWwlpqALQ=;
 b=Py2z6JAfsnqut8WHM5kXFDThg7+F2WzV0zcPl1OP4GYSABkFbdry1AHsfVjFp1YIApJ71N
 s2yVh/Vza9+4jK9m6dXt+4J9UAc2ZCUz0IireW8XtNbvBudTFwUN7BSuqOpA0R1oo0KCA4
 oKQqpHXn32CkkdabAebXZr+45Lts9Js=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-551-f4H8hlk9OUK3jySixN37CQ-1; Fri, 13 Jan 2023 04:00:45 -0500
X-MC-Unique: f4H8hlk9OUK3jySixN37CQ-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-4d952e13250so51951417b3.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 01:00:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NsMRz8xxQtIv7CjqgxPmGxbo+R17HVzXGVWwlpqALQ=;
 b=r1PMCy6AdpxgEwwJZPZaKwGW5bpY8Fx7g+K6mTvg/xjmyfC7Og27P89zi32tQblSFp
 ap1Y8Gt253xHhiAkEfzS7n8CVVZoJqa1SGwgPjsxhmw3+TCnTZOhxZor72lC0DtbvinE
 iJHHetW2CcHp9JiIR+XotrOteEn2YnuO0b0jJQ8YMvObryflczymQYOebcF0ac+G9w80
 USF1+ViQ0LXO+Le6rGWgep86rEw2rwrWGNhKRFoXbxEsTR8KQyFAuKm0oVY/FSzV79LY
 rPEdTFrDN9MtlAAcLT6kbBkZi9AQ7npkh1QWhqK9mMGv3n+J7nFn2BJ/o+VhjoycZ6UQ
 FXyg==
X-Gm-Message-State: AFqh2koZTr3LFXyfA8BKl2vihNyHI3rDuS7uzb2hutSU3fY3hs9shZro
 xoAgHY97RUlK5/zk3vy4LFaWo5zEyneiSDxTzD0ff8GBWtr2gV8x30erxf53IcF/j7LWs8rOG6f
 nh26nJrifAeU7VNxmrnDRt362GNWymQc=
X-Received: by 2002:a25:af0a:0:b0:6fb:5983:d192 with SMTP id
 a10-20020a25af0a000000b006fb5983d192mr8774526ybh.163.1673600445003; 
 Fri, 13 Jan 2023 01:00:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXut0vDmT2MOZcyY1fefOOLczMY0dlDDK22rgg7PFFCKvNhinko8IQd+9DIXpFC8HHfFphhvxAdxMg6y9r8Z27s=
X-Received: by 2002:a25:af0a:0:b0:6fb:5983:d192 with SMTP id
 a10-20020a25af0a000000b006fb5983d192mr8774509ybh.163.1673600444635; Fri, 13
 Jan 2023 01:00:44 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-12-eperezma@redhat.com>
 <CACGkMEuZjN+6sWiuZnMP7J-mBiwxnkO1VUW-AHz9izW4QkYvUw@mail.gmail.com>
In-Reply-To: <CACGkMEuZjN+6sWiuZnMP7J-mBiwxnkO1VUW-AHz9izW4QkYvUw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 13 Jan 2023 10:00:08 +0100
Message-ID: <CAJaqyWdbWACJdJfECjLu4x2nK82MJOsS8BTBdi7QQDZM-tg-OQ@mail.gmail.com>
Subject: Re: [RFC v2 11/13] vdpa: add vdpa net migration state notifier
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Juan Quintela <quintela@redhat.com>, David Gilbert <dgilbert@redhat.com>, 
 Maxime Coquelin <maxime.coquelin@redhat.com>
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

On Fri, Jan 13, 2023 at 5:55 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jan 13, 2023 at 1:25 AM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > This allows net to restart the device backend to configure SVQ on it.
> >
> > Ideally, these changes should not be net specific. However, the vdpa ne=
t
> > backend is the one with enough knowledge to configure everything becaus=
e
> > of some reasons:
> > * Queues might need to be shadowed or not depending on its kind (contro=
l
> >   vs data).
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
> >  net/vhost-vdpa.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 5d7ad6e4d7..f38532b1df 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -26,6 +26,8 @@
> >  #include <err.h>
> >  #include "standard-headers/linux/virtio_net.h"
> >  #include "monitor/monitor.h"
> > +#include "migration/migration.h"
> > +#include "migration/misc.h"
> >  #include "migration/blocker.h"
> >  #include "hw/virtio/vhost.h"
> >
> > @@ -33,6 +35,7 @@
> >  typedef struct VhostVDPAState {
> >      NetClientState nc;
> >      struct vhost_vdpa vhost_vdpa;
> > +    Notifier migration_state;
> >      Error *migration_blocker;
> >      VHostNetState *vhost_net;
> >
> > @@ -243,10 +246,86 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_vd=
pa(VhostVDPAState *s)
> >      return DO_UPCAST(VhostVDPAState, nc, nc0);
> >  }
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
> > +    }
> > +
> > +    if (enable) {
> > +        ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
>
> Do we need to check if the device is started or not here?
>

v->vhost_started is checked right above, right?

> > +    }
>
> I'm not sure I understand the reason for vhost_net_stop() after a
> VHOST_VDPA_SUSPEND. It looks to me those functions are duplicated.
>

I think this is really worth exploring, and it would have been clearer
if I didn't squash the vhost_reset_status commit by mistake :).

Looking at qemu master vhost.c:vhost_dev_stop:
    if (hdev->vhost_ops->vhost_dev_start) {
        hdev->vhost_ops->vhost_dev_start(hdev, false);
    }
    if (vrings) {
        vhost_dev_set_vring_enable(hdev, false);
    }
    for (i =3D 0; i < hdev->nvqs; ++i) {
        vhost_virtqueue_stop(hdev,
                             vdev,
                             hdev->vqs + i,
                             hdev->vq_index + i);
    }

Both vhost-used and vhost-vdpa set_status(0) at
->vhost_dev_start(hdev, false). It cleans virtqueue state in vdpa so
they are not recoverable at vhost_virtqueue_stop->get_vring_base, and
I think it is too late for vdpa devices to change it. I guess
vhost-user devices do not lose the state there, but I did not test.

I call VHOST_VDPA_SUSPEND here so vhost_vdpa_dev_start looks more
similar to vhost_user_dev_start. We can make
vhost_vdpa_dev_start(false) to suspend the device instead. But then we
need to reset it after getting the indexes. That's why I added
vhost_vdpa_reset_status, but I admit it is neither the cleanest
approach nor the best name to it.

Adding Maxime, RFC here so we can make -vdpa and -user not to divert too mu=
ch.

> > +    data_queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;
> > +    cvq =3D virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> > +                                  n->max_ncs - n->max_queue_pairs : 0;
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
> > +    switch (migration->state) {
> > +    case MIGRATION_STATUS_SETUP:
> > +        vhost_vdpa_net_log_global_enable(s, true);
> > +        return;
> > +
> > +    case MIGRATION_STATUS_CANCELLING:
> > +    case MIGRATION_STATUS_CANCELLED:
> > +    case MIGRATION_STATUS_FAILED:
> > +        vhost_vdpa_net_log_global_enable(s, false);
>
> Do we need to recover here?
>

I may be missing something, but the device is fully reset and restored
in these cases.

CCing Juan and D. Gilbert, a review would be appreciated to check if
this covers all the cases.

Thanks!


> Thanks
>
> > +        return;
> > +    };
> > +}
> > +
> >  static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
> >  {
> >      struct vhost_vdpa *v =3D &s->vhost_vdpa;
> >
> > +    if (v->feature_log) {
> > +        add_migration_state_change_notifier(&s->migration_state);
> > +    }
> > +
> >      if (v->shadow_vqs_enabled) {
> >          v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> >                                             v->iova_range.last);
> > @@ -280,6 +359,10 @@ static void vhost_vdpa_net_client_stop(NetClientSt=
ate *nc)
> >
> >      assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >
> > +    if (s->vhost_vdpa.index =3D=3D 0 && s->vhost_vdpa.feature_log) {
> > +        remove_migration_state_change_notifier(&s->migration_state);
> > +    }
> > +
> >      dev =3D s->vhost_vdpa.dev;
> >      if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> >          g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_dele=
te);
> > @@ -767,6 +850,7 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >      s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >      s->vhost_vdpa.index =3D queue_pair_index;
> >      s->always_svq =3D svq;
> > +    s->migration_state.notify =3D vdpa_net_migration_state_notifier;
> >      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >      s->vhost_vdpa.iova_range =3D iova_range;
> >      s->vhost_vdpa.shadow_data =3D svq;
> > --
> > 2.31.1
> >
>
>


