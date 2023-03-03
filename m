Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B206A92EF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:46:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY10w-0005Qp-HH; Fri, 03 Mar 2023 03:43:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY10u-0005Kz-TD
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:43:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY10s-0008HI-0J
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677833016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JiiE9+VHrTC10woa+nBeZOFLlo1Ng+mUt4o5OLBsij8=;
 b=ajje8D22mUiulrvzMq0MRHDpbX/OWIudcKHoOOLoq2Jwi0fmaoWEdIGODWs5rdWZYSBf1j
 I37gFQhK5i1Wf30laHMxU/beYlLn1Ulgm1coQ92kGxhtyL3yGKwEvH4BDDXZgfSnbCEuQm
 a5+rxAHncngJoVtHKsoesY8ipVivMps=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-482-rU09sPbvOwOrpzSw9ToiFg-1; Fri, 03 Mar 2023 03:43:35 -0500
X-MC-Unique: rU09sPbvOwOrpzSw9ToiFg-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-538116920c3so17530247b3.15
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:43:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677833015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JiiE9+VHrTC10woa+nBeZOFLlo1Ng+mUt4o5OLBsij8=;
 b=qB8pQTLhir569yCqb9X9VM72Atf+sQYGe5NdvLOhb6MRh/povvdqGt4WSPC0Fkf5iy
 U8NURJERgzhAi9fEENcEMpyyRyYW9obPC4tXxEJYK8MS7dufQrpm0Awi79Vv6ilXjnyY
 xrdQDmpfLQJI4jK/K2eysjTZcnP6wo3chEmBOjstvYLThV7XcKMbzriuq+qol/3dVCzt
 5uXQI68qPHoSIB0N/hCllMELbl15Zz0oOHaFuIA9BT5D6HEy7lC1fvFuLUkBusrPgM+J
 V6tSR7MzoaR6ZFMfHRqNq3Ri9XNE+XSUo3yMkTfHlzeqOhCXP9UFabR0WgkPTFwXZsah
 K88A==
X-Gm-Message-State: AO0yUKVex/00N8xds2SWWNfUEEylUBt6jvZFuq7ZAd+mydpe2Snatoxq
 Q0IXRdH4TPHMiXSz9VPzBkjmVsy3E6zHVm5ZD9Dwok9zTqT7HsTdWLs7qW+HWlml2V7K9sS3fgR
 99VVTM1pZ7c82GNuFWZWqSntp3joeDAs=
X-Received: by 2002:a81:af59:0:b0:535:5e8c:65ef with SMTP id
 x25-20020a81af59000000b005355e8c65efmr407945ywj.6.1677833014461; 
 Fri, 03 Mar 2023 00:43:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9Fa3e8B4UyL2RK0Us/+kVqQIAYNsprRuQQOpkuljmy8qd+Snd6lDpjCingGt/jhQkjBZSndGDVHWkNtLPkH5A=
X-Received: by 2002:a81:af59:0:b0:535:5e8c:65ef with SMTP id
 x25-20020a81af59000000b005355e8c65efmr407928ywj.6.1677833014043; Fri, 03 Mar
 2023 00:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-10-eperezma@redhat.com>
 <afad31de-8109-36b7-b7ea-aa2e1a24f254@redhat.com>
 <CAJaqyWdyM6i6-GVNUbEkQ_Bo+AhbAQRDx3wZxRu-jwtc1mZT2g@mail.gmail.com>
 <3ab19235-bdd7-73a8-052a-a365b0582275@redhat.com>
In-Reply-To: <3ab19235-bdd7-73a8-052a-a365b0582275@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 3 Mar 2023 09:42:58 +0100
Message-ID: <CAJaqyWeiey8qmJtV9y-5PyaPXDNLH5eTEPfNUsxT0VD0y2oQLw@mail.gmail.com>
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

On Fri, Mar 3, 2023 at 4:34 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/3/2 03:26, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Mon, Feb 27, 2023 at 9:08 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2023/2/24 23:54, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> >>> This allows net to restart the device backend to configure SVQ on it.
> >>>
> >>> Ideally, these changes should not be net specific. However, the vdpa =
net
> >>> backend is the one with enough knowledge to configure everything beca=
use
> >>> of some reasons:
> >>> * Queues might need to be shadowed or not depending on its kind (cont=
rol
> >>>     vs data).
> >>> * Queues need to share the same map translations (iova tree).
> >>>
> >>> Because of that it is cleaner to restart the whole net backend and
> >>> configure again as expected, similar to how vhost-kernel moves betwee=
n
> >>> userspace and passthrough.
> >>>
> >>> If more kinds of devices need dynamic switching to SVQ we can create =
a
> >>> callback struct like VhostOps and move most of the code there.
> >>> VhostOps cannot be reused since all vdpa backend share them, and to
> >>> personalize just for networking would be too heavy.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>> v4:
> >>> * Delete duplication of set shadow_data and shadow_vqs_enabled moving=
 it
> >>>     to data / cvq net start functions.
> >>>
> >>> v3:
> >>> * Check for migration state at vdpa device start to enable SVQ in dat=
a
> >>>     vqs.
> >>>
> >>> v1 from RFC:
> >>> * Add TODO to use the resume operation in the future.
> >>> * Use migration_in_setup and migration_has_failed instead of a
> >>>     complicated switch case.
> >>> ---
> >>>    net/vhost-vdpa.c | 72 ++++++++++++++++++++++++++++++++++++++++++++=
++--
> >>>    1 file changed, 69 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>> index b89c99066a..c5512ddf10 100644
> >>> --- a/net/vhost-vdpa.c
> >>> +++ b/net/vhost-vdpa.c
> >>> @@ -26,12 +26,15 @@
> >>>    #include <err.h>
> >>>    #include "standard-headers/linux/virtio_net.h"
> >>>    #include "monitor/monitor.h"
> >>> +#include "migration/migration.h"
> >>> +#include "migration/misc.h"
> >>>    #include "hw/virtio/vhost.h"
> >>>
> >>>    /* Todo:need to add the multiqueue support here */
> >>>    typedef struct VhostVDPAState {
> >>>        NetClientState nc;
> >>>        struct vhost_vdpa vhost_vdpa;
> >>> +    Notifier migration_state;
> >>>        VHostNetState *vhost_net;
> >>>
> >>>        /* Control commands shadow buffers */
> >>> @@ -239,10 +242,59 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_=
vdpa(VhostVDPAState *s)
> >>>        return DO_UPCAST(VhostVDPAState, nc, nc0);
> >>>    }
> >>>
> >>> +static void vhost_vdpa_net_log_global_enable(VhostVDPAState *s, bool=
 enable)
> >>> +{
> >>> +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> >>> +    VirtIONet *n;
> >>> +    VirtIODevice *vdev;
> >>> +    int data_queue_pairs, cvq, r;
> >>> +
> >>> +    /* We are only called on the first data vqs and only if x-svq is=
 not set */
> >>> +    if (s->vhost_vdpa.shadow_vqs_enabled =3D=3D enable) {
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    vdev =3D v->dev->vdev;
> >>> +    n =3D VIRTIO_NET(vdev);
> >>> +    if (!n->vhost_started) {
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    data_queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;
> >>> +    cvq =3D virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> >>> +                                  n->max_ncs - n->max_queue_pairs : =
0;
> >>> +    /*
> >>> +     * TODO: vhost_net_stop does suspend, get_base and reset. We can=
 be smarter
> >>> +     * in the future and resume the device if read-only operations b=
etween
> >>> +     * suspend and reset goes wrong.
> >>> +     */
> >>> +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
> >>> +
> >>> +    /* Start will check migration setup_or_active to configure or no=
t SVQ */
> >>> +    r =3D vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
> >>> +    if (unlikely(r < 0)) {
> >>> +        error_report("unable to start vhost net: %s(%d)", g_strerror=
(-r), -r);
> >>> +    }
> >>> +}
> >>> +
> >>> +static void vdpa_net_migration_state_notifier(Notifier *notifier, vo=
id *data)
> >>> +{
> >>> +    MigrationState *migration =3D data;
> >>> +    VhostVDPAState *s =3D container_of(notifier, VhostVDPAState,
> >>> +                                     migration_state);
> >>> +
> >>> +    if (migration_in_setup(migration)) {
> >>> +        vhost_vdpa_net_log_global_enable(s, true);
> >>> +    } else if (migration_has_failed(migration)) {
> >>> +        vhost_vdpa_net_log_global_enable(s, false);
> >>> +    }
> >>> +}
> >>> +
> >>>    static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
> >>>    {
> >>>        struct vhost_vdpa *v =3D &s->vhost_vdpa;
> >>>
> >>> +    add_migration_state_change_notifier(&s->migration_state);
> >>>        if (v->shadow_vqs_enabled) {
> >>>            v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> >>>                                               v->iova_range.last);
> >>> @@ -256,6 +308,15 @@ static int vhost_vdpa_net_data_start(NetClientSt=
ate *nc)
> >>>
> >>>        assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >>>
> >>> +    if (s->always_svq ||
> >>> +        migration_is_setup_or_active(migrate_get_current()->state)) =
{
> >>> +        v->shadow_vqs_enabled =3D true;
> >>> +        v->shadow_data =3D true;
> >>> +    } else {
> >>> +        v->shadow_vqs_enabled =3D false;
> >>> +        v->shadow_data =3D false;
> >>> +    }
> >>> +
> >>>        if (v->index =3D=3D 0) {
> >>>            vhost_vdpa_net_data_start_first(s);
> >>>            return 0;
> >>> @@ -276,6 +337,10 @@ static void vhost_vdpa_net_client_stop(NetClient=
State *nc)
> >>>
> >>>        assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >>>
> >>> +    if (s->vhost_vdpa.index =3D=3D 0) {
> >>> +        remove_migration_state_change_notifier(&s->migration_state);
> >>> +    }
> >>
> >> This should work but I just realize that vhost support
> >> vhost_dev_set_log(), I wonder if it would be simpler to go with that w=
ay.
> >>
> >> Using vhost_virtqueue_set_addr(, enable_log =3D true)?
> >>
> > We can do that but it has the same problem as with checking _F_LOG_ALL
> > in set_features:
> >
> > 1. We're tearing down a vhost device using a listener registered
> > against that device, at start / stop.
> > 2. We need to traverse all the devices many times to first get all the
> > vqs state and then transverse them again to set them up properly.
> >
> > My two ideas to solve the recursiveness of 1 are:
> > a. Duplicating vhost_dev_start / vhost_dev_stop at
> > vhost_vdpa_set_features / vhost_vdpa_set_vring_addr.
> >
> > This has the same problem as all duplications: It will get out of sync
> > eventually. For example, the latest changes about configure interrupt
> > would need to be duplicated in this new call.
> >
> > b. Add a new parameter to vhost_dev_start/stop to skip the
> > set_features / set_vring_address step.
> > Now that the virtio queue reset changes have exposed these functions
> > it is also possible to call them from vhost-vdpa.
> >
> > Maybe we can store that parameter in vhost_vdpa so we don't call
> > vhost_dev_start / stop there instead of affecting all backends, but
> > the idea is the same.
> >
> > For problem 2 I still do not have a solution. CVQ / MQ Is out of the
> > scope for this series but I think it will bite us when we add it
> > (hopefully soon).
>
>
> Thanks for the clarification, I'd suggest to document the above in the
> changlog.
>

Please let me know if you agree on the next message for this patch:

vdpa: add vdpa net migration state notifier

This allows net to restart the device backend to configure SVQ on it.

Ideally, these changes should not be net specific and they could be done
in:
* vhost_vdpa_set_features (with VHOST_F_LOG_ALL)
* vhost_vdpa_set_vring_addr (with .enable_log)
* vhost_vdpa_set_log_base.

However, the vdpa net backend is the one with enough knowledge to
configure everything because of some reasons:
* Queues might need to be shadowed or not depending on its kind (control
  vs data).
* Queues need to share the same map translations (iova tree).

Also, there are other problems that may have solutions but complicates
the implementation at this stage:
* We're basically duplicating vhost_dev_start and vhost_dev_stop, and
  they could go out of sync.  If we want to reuse them, we need a way to
  skip some function calls to avoid recursiveness (either vhost_ops ->
  vhost_set_features, vhost_set_vring_addr, ...).
* We need to traverse all vhost_dev of a given net device twice: one to
  stop and get the vq state and another one after the reset to
  configure properties like address, fd, etc.

Because of that it is cleaner to restart the whole net backend and
configure again as expected, similar to how vhost-kernel moves between
userspace and passthrough.

If more kinds of devices need dynamic switching to SVQ we can:
* Create a callback struct like VhostOps and move most of the code
  there.  VhostOps cannot be reused since all vdpa backend share them,
  and to personalize just for networking would be too heavy.
* Add a parent struct or link all the vhost_vdpa or vhost_dev structs so
  we can traverse them.
---

Thanks!

>
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>
> >>> +
> >>>        dev =3D s->vhost_vdpa.dev;
> >>>        if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> >>>            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_=
delete);
> >>> @@ -412,11 +477,12 @@ static int vhost_vdpa_net_cvq_start(NetClientSt=
ate *nc)
> >>>        s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>>        v =3D &s->vhost_vdpa;
> >>>
> >>> -    v->shadow_data =3D s->always_svq;
> >>> +    s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> >>> +    v->shadow_data =3D s0->vhost_vdpa.shadow_vqs_enabled;
> >>>        v->shadow_vqs_enabled =3D s->always_svq;
> >>>        s->vhost_vdpa.address_space_id =3D VHOST_VDPA_GUEST_PA_ASID;
> >>>
> >>> -    if (s->always_svq) {
> >>> +    if (s->vhost_vdpa.shadow_data) {
> >>>            /* SVQ is already configured for all virtqueues */
> >>>            goto out;
> >>>        }
> >>> @@ -473,7 +539,6 @@ out:
> >>>            return 0;
> >>>        }
> >>>
> >>> -    s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> >>>        if (s0->vhost_vdpa.iova_tree) {
> >>>            /*
> >>>             * SVQ is already configured for all virtqueues.  Reuse IO=
VA tree for
> >>> @@ -749,6 +814,7 @@ static NetClientState *net_vhost_vdpa_init(NetCli=
entState *peer,
> >>>        s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >>>        s->vhost_vdpa.index =3D queue_pair_index;
> >>>        s->always_svq =3D svq;
> >>> +    s->migration_state.notify =3D vdpa_net_migration_state_notifier;
> >>>        s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >>>        s->vhost_vdpa.iova_range =3D iova_range;
> >>>        s->vhost_vdpa.shadow_data =3D svq;
>
vdpa: add vdpa net migration state notifier

This allows net to restart the device backend to configure SVQ on it.

Ideally, these changes should not be net specific and they could be done
in:
* vhost_vdpa_set_features (with VHOST_F_LOG_ALL)
* vhost_vdpa_set_vring_addr (with .enable_log)
* vhost_vdpa_set_log_base.

However, the vdpa net backend is the one with enough knowledge to
configure everything because of some reasons:
* Queues might need to be shadowed or not depending on its kind (control
  vs data).
* Queues need to share the same map translations (iova tree).

Also, there are other problems that may have solutions but complicates
the implementation at this stage:
* We're basically duplicating vhost_dev_start and vhost_dev_stop, and
  they could go out of sync.  If we want to reuse them, we need a way to
  skip some function call to avoid recursiveness (either vhost_ops ->
  vhost_set_features, vhost_set_vring_addr, ...).
* We need to traverse all vhost_dev of a given net device twice: one to
  stop and get the vq state and another one after the reset to
  configure properties like address, fd, etc.

Because of that it is cleaner to restart the whole net backend and
configure again as expected, similar to how vhost-kernel moves between
userspace and passthrough.

If more kinds of devices need dynamic switching to SVQ we can:
* Create a callback struct like VhostOps and move most of the code
  there.  VhostOps cannot be reused since all vdpa backend share them,
  and to personalize just for networking would be too heavy.
* Add a parent struct or link all the vhost_vdpa or vhost_dev structs so
  we can traverse them.


