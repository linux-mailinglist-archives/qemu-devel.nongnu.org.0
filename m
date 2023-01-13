Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AAB668B08
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 05:56:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGC5Q-0002r6-BG; Thu, 12 Jan 2023 23:54:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGC5O-0002qv-Du
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 23:54:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGC5M-00084R-Ez
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 23:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673585675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RhIwhse2WKnv71GVCusOMUeBUtv6+vPIKnJsvQ4DzuY=;
 b=dDRss/Pu+zPZ3Tjt91BpJkuFEW59OudGmdvMhHfRqacDwiPy1uVga/fBQLxROGMjehxaJS
 KXunS6kzguYYluUUp3rlOlhp633cojcVHnpM67EFLz/RRJa0Mz/AQ17JGm4hLlr/gaEz12
 ZHM/0oYQ4+Bi/zFYwbWCDPHs7n9slpY=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-507-BZq5Z1sfNUqcG18fldkD5g-1; Thu, 12 Jan 2023 23:54:34 -0500
X-MC-Unique: BZq5Z1sfNUqcG18fldkD5g-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-144799384a5so7538872fac.12
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 20:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RhIwhse2WKnv71GVCusOMUeBUtv6+vPIKnJsvQ4DzuY=;
 b=Pm0749HBVGY8m4BCjJBppJIKuDvj1PPzWicVpAkKntEuJe9t2CLIMTUTGE0GpAR1xa
 N1Gvgc7yvIyGli74ANR862NmhWXs+KhkDIpdhAOgzGxjJHe/ERzkJeJiQEH8awzz+RqK
 RkbUzGTZjkBOP2Eo9LSMiSNolHr0+QnCTosWSdK2gLJjeGdsiFiK6Q5HFbt+FWjovWA3
 834CJ4mtN2erQgD2g/yzkMwyYFF4Ue8/EwFBtR/MXvFWE6IJRtPXR0IN+2KKhe0LWiaC
 vtpasRZCb1ogUIpv3FFEiB/MMvUqB1AhKp3oGmSIf712GprGJ1lRmgRCDBAWGagFQOXo
 H6aA==
X-Gm-Message-State: AFqh2kp89BK/2bW7mMZsVbTIZfjrQRB/rXAp0i7friUshGiUxYr5d/hK
 Wr70dbkgzB8UYOu3xWSLYV23qnaJ7YuR0wV4CnY6t/AnmJ/jVjiDPNWSDBRy32nnUYX0IdjbcCV
 Vr0z1xm/G5eZKyERsqJXGMSqo4IEkF/g=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr1334506oab.280.1673585673657; 
 Thu, 12 Jan 2023 20:54:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtCygNtV2rSAtmNmBtpj7UOBYm+ZiG/QsJSpdTUhV6a1whUYKq0U6PLN4K0Sxp3WTbPGVsBeBkO3x7tRmvJQiw=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr1334486oab.280.1673585673371; Thu, 12
 Jan 2023 20:54:33 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-12-eperezma@redhat.com>
In-Reply-To: <20230112172434.760850-12-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Jan 2023 12:54:22 +0800
Message-ID: <CACGkMEuZjN+6sWiuZnMP7J-mBiwxnkO1VUW-AHz9izW4QkYvUw@mail.gmail.com>
Subject: Re: [RFC v2 11/13] vdpa: add vdpa net migration state notifier
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Fri, Jan 13, 2023 at 1:25 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> This allows net to restart the device backend to configure SVQ on it.
>
> Ideally, these changes should not be net specific. However, the vdpa net
> backend is the one with enough knowledge to configure everything because
> of some reasons:
> * Queues might need to be shadowed or not depending on its kind (control
>   vs data).
> * Queues need to share the same map translations (iova tree).
>
> Because of that it is cleaner to restart the whole net backend and
> configure again as expected, similar to how vhost-kernel moves between
> userspace and passthrough.
>
> If more kinds of devices need dynamic switching to SVQ we can create a
> callback struct like VhostOps and move most of the code there.
> VhostOps cannot be reused since all vdpa backend share them, and to
> personalize just for networking would be too heavy.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  net/vhost-vdpa.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 5d7ad6e4d7..f38532b1df 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -26,6 +26,8 @@
>  #include <err.h>
>  #include "standard-headers/linux/virtio_net.h"
>  #include "monitor/monitor.h"
> +#include "migration/migration.h"
> +#include "migration/misc.h"
>  #include "migration/blocker.h"
>  #include "hw/virtio/vhost.h"
>
> @@ -33,6 +35,7 @@
>  typedef struct VhostVDPAState {
>      NetClientState nc;
>      struct vhost_vdpa vhost_vdpa;
> +    Notifier migration_state;
>      Error *migration_blocker;
>      VHostNetState *vhost_net;
>
> @@ -243,10 +246,86 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa=
(VhostVDPAState *s)
>      return DO_UPCAST(VhostVDPAState, nc, nc0);
>  }
>
> +static void vhost_vdpa_net_log_global_enable(VhostVDPAState *s, bool ena=
ble)
> +{
> +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> +    VirtIONet *n;
> +    VirtIODevice *vdev;
> +    int data_queue_pairs, cvq, r;
> +    NetClientState *peer;
> +
> +    /* We are only called on the first data vqs and only if x-svq is not=
 set */
> +    if (s->vhost_vdpa.shadow_vqs_enabled =3D=3D enable) {
> +        return;
> +    }
> +
> +    vdev =3D v->dev->vdev;
> +    n =3D VIRTIO_NET(vdev);
> +    if (!n->vhost_started) {
> +        return;
> +    }
> +
> +    if (enable) {
> +        ioctl(v->device_fd, VHOST_VDPA_SUSPEND);

Do we need to check if the device is started or not here?

> +    }

I'm not sure I understand the reason for vhost_net_stop() after a
VHOST_VDPA_SUSPEND. It looks to me those functions are duplicated.

> +    data_queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;
> +    cvq =3D virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> +                                  n->max_ncs - n->max_queue_pairs : 0;
> +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
> +
> +    peer =3D s->nc.peer;
> +    for (int i =3D 0; i < data_queue_pairs + cvq; i++) {
> +        VhostVDPAState *vdpa_state;
> +        NetClientState *nc;
> +
> +        if (i < data_queue_pairs) {
> +            nc =3D qemu_get_peer(peer, i);
> +        } else {
> +            nc =3D qemu_get_peer(peer, n->max_queue_pairs);
> +        }
> +
> +        vdpa_state =3D DO_UPCAST(VhostVDPAState, nc, nc);
> +        vdpa_state->vhost_vdpa.shadow_data =3D enable;
> +
> +        if (i < data_queue_pairs) {
> +            /* Do not override CVQ shadow_vqs_enabled */
> +            vdpa_state->vhost_vdpa.shadow_vqs_enabled =3D enable;
> +        }
> +    }
> +
> +    r =3D vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
> +    if (unlikely(r < 0)) {
> +        error_report("unable to start vhost net: %s(%d)", g_strerror(-r)=
, -r);
> +    }
> +}
> +
> +static void vdpa_net_migration_state_notifier(Notifier *notifier, void *=
data)
> +{
> +    MigrationState *migration =3D data;
> +    VhostVDPAState *s =3D container_of(notifier, VhostVDPAState,
> +                                     migration_state);
> +
> +    switch (migration->state) {
> +    case MIGRATION_STATUS_SETUP:
> +        vhost_vdpa_net_log_global_enable(s, true);
> +        return;
> +
> +    case MIGRATION_STATUS_CANCELLING:
> +    case MIGRATION_STATUS_CANCELLED:
> +    case MIGRATION_STATUS_FAILED:
> +        vhost_vdpa_net_log_global_enable(s, false);

Do we need to recover here?

Thanks

> +        return;
> +    };
> +}
> +
>  static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
>  {
>      struct vhost_vdpa *v =3D &s->vhost_vdpa;
>
> +    if (v->feature_log) {
> +        add_migration_state_change_notifier(&s->migration_state);
> +    }
> +
>      if (v->shadow_vqs_enabled) {
>          v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
>                                             v->iova_range.last);
> @@ -280,6 +359,10 @@ static void vhost_vdpa_net_client_stop(NetClientStat=
e *nc)
>
>      assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
>
> +    if (s->vhost_vdpa.index =3D=3D 0 && s->vhost_vdpa.feature_log) {
> +        remove_migration_state_change_notifier(&s->migration_state);
> +    }
> +
>      dev =3D s->vhost_vdpa.dev;
>      if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
>          g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete=
);
> @@ -767,6 +850,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientS=
tate *peer,
>      s->vhost_vdpa.device_fd =3D vdpa_device_fd;
>      s->vhost_vdpa.index =3D queue_pair_index;
>      s->always_svq =3D svq;
> +    s->migration_state.notify =3D vdpa_net_migration_state_notifier;
>      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
>      s->vhost_vdpa.iova_range =3D iova_range;
>      s->vhost_vdpa.shadow_data =3D svq;
> --
> 2.31.1
>


