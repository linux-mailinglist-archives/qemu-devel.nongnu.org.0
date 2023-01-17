Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E171366DAE6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:25:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHj9n-00036w-2r; Tue, 17 Jan 2023 05:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pHj8x-0002wl-0B
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:24:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pHj8u-0004OO-F9
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:24:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673951075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKEqcicsCcOI0gCS2yJzj9lhbnjNsG7QbIq79s2WWqU=;
 b=C/GRImQCWnKbSpoZgxK66zM/I/XF/EUiD3p4p0jxYJfLO0ERGRu1awvWcxl4RG27Usoa1v
 7/RwAD3l5KH11xJq6k3KG0ZJqd6PNtD3eizSCDl5QL+Jmw/Gdma0Wif4ZVBefL1L1L0mr4
 dWG8SZjcRcoZhLhycP1Tehy97tTWJ6s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-pK-wW8IUMT6mTXbe1lcZTw-1; Tue, 17 Jan 2023 05:24:28 -0500
X-MC-Unique: pK-wW8IUMT6mTXbe1lcZTw-1
Received: by mail-ed1-f70.google.com with SMTP id
 l17-20020a056402255100b00472d2ff0e59so20923243edb.19
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 02:24:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iKEqcicsCcOI0gCS2yJzj9lhbnjNsG7QbIq79s2WWqU=;
 b=2VY7b8UoVPU7uyf1JJmNdxmu4lpZE8Jaso5HgzuQfDtX3bBRLc2euX4BEt8QvF32lA
 tu9qi5agOteTrX71n1kmsaW0Abq1OTWnnHfnKMlwCOfFJ/JWIYuCls+6CR3awXCvilR3
 liOVI67Gf7Zwplwh7j/doWJ+pAKCT3NA6v4/Pr4yeBGiqGpcrsmsgPPOwDTs4A0xbW5a
 Ktl48CH7mw2nzS9PLCZb0fPnG1Bxdpf+R5v8HS2/z8p1bAE3D4DqqU5phs6+JZNTvU5x
 rSafEbUz0lxUEG2ZPtp/ztqZ66WdM5zGoobpNhqdkC2bt+e9w9nk/OldufEGOl+DXauN
 M93Q==
X-Gm-Message-State: AFqh2kqT9TJ5Ofeldm+CWt7xRd8BzsiiI6I2RbADaRbvoRXSKvrtNznA
 panbzOIAXollL7rGGqR+Y+p8dhopoVLc/4EEgkNnKYHqWxWGOGBkbxixS3l515Hf1go6kkXNeZY
 92MUSogT5IUhDb313VnXCMvGVqHFn49I=
X-Received: by 2002:a05:6402:4019:b0:499:e665:867a with SMTP id
 d25-20020a056402401900b00499e665867amr321088eda.20.1673951066987; 
 Tue, 17 Jan 2023 02:24:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsuMQpX50vxzLbyMw3+4V7nFZHWWC+wOQ4vyhHW5Uh0Ky407xnObGZmX7Y7W2k/DLwwcMD9iylTr607kchHE+A=
X-Received: by 2002:a05:6402:4019:b0:499:e665:867a with SMTP id
 d25-20020a056402401900b00499e665867amr321066eda.20.1673951066748; Tue, 17 Jan
 2023 02:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-12-eperezma@redhat.com>
 <CACGkMEuZjN+6sWiuZnMP7J-mBiwxnkO1VUW-AHz9izW4QkYvUw@mail.gmail.com>
 <CAJaqyWdbWACJdJfECjLu4x2nK82MJOsS8BTBdi7QQDZM-tg-OQ@mail.gmail.com>
 <Y8ZxKSvVJpWgiaXr@work-vm>
In-Reply-To: <Y8ZxKSvVJpWgiaXr@work-vm>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 17 Jan 2023 11:23:49 +0100
Message-ID: <CAJaqyWd5uyCZwVPWb=1wk1uc0mX2hOpcj2qDNtA7WxHrGGvMgQ@mail.gmail.com>
Subject: Re: [RFC v2 11/13] vdpa: add vdpa net migration state notifier
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
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

On Tue, Jan 17, 2023 at 10:58 AM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Eugenio Perez Martin (eperezma@redhat.com) wrote:
> > On Fri, Jan 13, 2023 at 5:55 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Fri, Jan 13, 2023 at 1:25 AM Eugenio P=C3=A9rez <eperezma@redhat.c=
om> wrote:
> > > >
> > > > This allows net to restart the device backend to configure SVQ on i=
t.
> > > >
> > > > Ideally, these changes should not be net specific. However, the vdp=
a net
> > > > backend is the one with enough knowledge to configure everything be=
cause
> > > > of some reasons:
> > > > * Queues might need to be shadowed or not depending on its kind (co=
ntrol
> > > >   vs data).
> > > > * Queues need to share the same map translations (iova tree).
> > > >
> > > > Because of that it is cleaner to restart the whole net backend and
> > > > configure again as expected, similar to how vhost-kernel moves betw=
een
> > > > userspace and passthrough.
> > > >
> > > > If more kinds of devices need dynamic switching to SVQ we can creat=
e a
> > > > callback struct like VhostOps and move most of the code there.
> > > > VhostOps cannot be reused since all vdpa backend share them, and to
> > > > personalize just for networking would be too heavy.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > >  net/vhost-vdpa.c | 84 ++++++++++++++++++++++++++++++++++++++++++++=
++++
> > > >  1 file changed, 84 insertions(+)
> > > >
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index 5d7ad6e4d7..f38532b1df 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -26,6 +26,8 @@
> > > >  #include <err.h>
> > > >  #include "standard-headers/linux/virtio_net.h"
> > > >  #include "monitor/monitor.h"
> > > > +#include "migration/migration.h"
> > > > +#include "migration/misc.h"
> > > >  #include "migration/blocker.h"
> > > >  #include "hw/virtio/vhost.h"
> > > >
> > > > @@ -33,6 +35,7 @@
> > > >  typedef struct VhostVDPAState {
> > > >      NetClientState nc;
> > > >      struct vhost_vdpa vhost_vdpa;
> > > > +    Notifier migration_state;
> > > >      Error *migration_blocker;
> > > >      VHostNetState *vhost_net;
> > > >
> > > > @@ -243,10 +246,86 @@ static VhostVDPAState *vhost_vdpa_net_first_n=
c_vdpa(VhostVDPAState *s)
> > > >      return DO_UPCAST(VhostVDPAState, nc, nc0);
> > > >  }
> > > >
> > > > +static void vhost_vdpa_net_log_global_enable(VhostVDPAState *s, bo=
ol enable)
> > > > +{
> > > > +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > > > +    VirtIONet *n;
> > > > +    VirtIODevice *vdev;
> > > > +    int data_queue_pairs, cvq, r;
> > > > +    NetClientState *peer;
> > > > +
> > > > +    /* We are only called on the first data vqs and only if x-svq =
is not set */
> > > > +    if (s->vhost_vdpa.shadow_vqs_enabled =3D=3D enable) {
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    vdev =3D v->dev->vdev;
> > > > +    n =3D VIRTIO_NET(vdev);
> > > > +    if (!n->vhost_started) {
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    if (enable) {
> > > > +        ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
> > >
> > > Do we need to check if the device is started or not here?
> > >
> >
> > v->vhost_started is checked right above, right?
> >
> > > > +    }
> > >
> > > I'm not sure I understand the reason for vhost_net_stop() after a
> > > VHOST_VDPA_SUSPEND. It looks to me those functions are duplicated.
> > >
> >
> > I think this is really worth exploring, and it would have been clearer
> > if I didn't squash the vhost_reset_status commit by mistake :).
> >
> > Looking at qemu master vhost.c:vhost_dev_stop:
> >     if (hdev->vhost_ops->vhost_dev_start) {
> >         hdev->vhost_ops->vhost_dev_start(hdev, false);
> >     }
> >     if (vrings) {
> >         vhost_dev_set_vring_enable(hdev, false);
> >     }
> >     for (i =3D 0; i < hdev->nvqs; ++i) {
> >         vhost_virtqueue_stop(hdev,
> >                              vdev,
> >                              hdev->vqs + i,
> >                              hdev->vq_index + i);
> >     }
> >
> > Both vhost-used and vhost-vdpa set_status(0) at
> > ->vhost_dev_start(hdev, false). It cleans virtqueue state in vdpa so
> > they are not recoverable at vhost_virtqueue_stop->get_vring_base, and
> > I think it is too late for vdpa devices to change it. I guess
> > vhost-user devices do not lose the state there, but I did not test.
> >
> > I call VHOST_VDPA_SUSPEND here so vhost_vdpa_dev_start looks more
> > similar to vhost_user_dev_start. We can make
> > vhost_vdpa_dev_start(false) to suspend the device instead. But then we
> > need to reset it after getting the indexes. That's why I added
> > vhost_vdpa_reset_status, but I admit it is neither the cleanest
> > approach nor the best name to it.
> >
> > Adding Maxime, RFC here so we can make -vdpa and -user not to divert to=
o much.
> >
> > > > +    data_queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;
> > > > +    cvq =3D virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> > > > +                                  n->max_ncs - n->max_queue_pairs =
: 0;
> > > > +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
> > > > +
> > > > +    peer =3D s->nc.peer;
> > > > +    for (int i =3D 0; i < data_queue_pairs + cvq; i++) {
> > > > +        VhostVDPAState *vdpa_state;
> > > > +        NetClientState *nc;
> > > > +
> > > > +        if (i < data_queue_pairs) {
> > > > +            nc =3D qemu_get_peer(peer, i);
> > > > +        } else {
> > > > +            nc =3D qemu_get_peer(peer, n->max_queue_pairs);
> > > > +        }
> > > > +
> > > > +        vdpa_state =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > > +        vdpa_state->vhost_vdpa.shadow_data =3D enable;
> > > > +
> > > > +        if (i < data_queue_pairs) {
> > > > +            /* Do not override CVQ shadow_vqs_enabled */
> > > > +            vdpa_state->vhost_vdpa.shadow_vqs_enabled =3D enable;
> > > > +        }
> > > > +    }
> > > > +
> > > > +    r =3D vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq=
);
> > > > +    if (unlikely(r < 0)) {
> > > > +        error_report("unable to start vhost net: %s(%d)", g_strerr=
or(-r), -r);
> > > > +    }
> > > > +}
> > > > +
> > > > +static void vdpa_net_migration_state_notifier(Notifier *notifier, =
void *data)
> > > > +{
> > > > +    MigrationState *migration =3D data;
> > > > +    VhostVDPAState *s =3D container_of(notifier, VhostVDPAState,
> > > > +                                     migration_state);
> > > > +
> > > > +    switch (migration->state) {
> > > > +    case MIGRATION_STATUS_SETUP:
> > > > +        vhost_vdpa_net_log_global_enable(s, true);
> > > > +        return;
> > > > +
> > > > +    case MIGRATION_STATUS_CANCELLING:
> > > > +    case MIGRATION_STATUS_CANCELLED:
> > > > +    case MIGRATION_STATUS_FAILED:
> > > > +        vhost_vdpa_net_log_global_enable(s, false);
> > >
> > > Do we need to recover here?
> > >
> >
> > I may be missing something, but the device is fully reset and restored
> > in these cases.
> >
> > CCing Juan and D. Gilbert, a review would be appreciated to check if
> > this covers all the cases.
>
> I'm surprised I'm not seeing an entry for MIGRATION_STATUS_COMPLETED
> there.
>
> You might consider:
>    if (migration_in_setup(s)) {
>      vhost_vdpa_net_log_global_enable(s, true);
>    } else if (migration_has_finished(s) || migration_has_failed(s)) {
>      vhost_vdpa_net_log_global_enable(s, false);
>    }
>

Thank you very much for the input, I see this is definitely cleaner
than my proposal.

Just for completion here I need to handle differently has_finished vs
has_failed because of recovery. This is easily achievable from your
snippet so thank you very much.

> I'm not too sure what will happen in your world with postcopy;  it's
> worth testing, just remember on the source you don't want to be changing
> guest memory when you're in the postcopy phase.
>

If I'm not wrong postcopy is forbidden as long as there exists a vdpa
device but I can check it for sure.

Thanks!


> Dave
>
> > Thanks!
> >
> >
> > > Thanks
> > >
> > > > +        return;
> > > > +    };
> > > > +}
> > > > +
> > > >  static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
> > > >  {
> > > >      struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > > >
> > > > +    if (v->feature_log) {
> > > > +        add_migration_state_change_notifier(&s->migration_state);
> > > > +    }
> > > > +
> > > >      if (v->shadow_vqs_enabled) {
> > > >          v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> > > >                                             v->iova_range.last);
> > > > @@ -280,6 +359,10 @@ static void vhost_vdpa_net_client_stop(NetClie=
ntState *nc)
> > > >
> > > >      assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > > >
> > > > +    if (s->vhost_vdpa.index =3D=3D 0 && s->vhost_vdpa.feature_log)=
 {
> > > > +        remove_migration_state_change_notifier(&s->migration_state=
);
> > > > +    }
> > > > +
> > > >      dev =3D s->vhost_vdpa.dev;
> > > >      if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> > > >          g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_=
delete);
> > > > @@ -767,6 +850,7 @@ static NetClientState *net_vhost_vdpa_init(NetC=
lientState *peer,
> > > >      s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> > > >      s->vhost_vdpa.index =3D queue_pair_index;
> > > >      s->always_svq =3D svq;
> > > > +    s->migration_state.notify =3D vdpa_net_migration_state_notifie=
r;
> > > >      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > > >      s->vhost_vdpa.iova_range =3D iova_range;
> > > >      s->vhost_vdpa.shadow_data =3D svq;
> > > > --
> > > > 2.31.1
> > > >
> > >
> > >
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>


