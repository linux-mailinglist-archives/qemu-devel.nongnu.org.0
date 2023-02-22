Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE7669EF44
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 08:26:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUjUQ-0001Zc-Dt; Wed, 22 Feb 2023 02:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pUjUO-0001ZN-8m
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 02:24:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pUjUL-0007E2-Mr
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 02:24:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677050668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dt3JIZxwQ56FHYO/2mMt3h1+f1UXZ2MmXTurcnX2imE=;
 b=PRy+7C5wFfPUnfJm7VZ83P+y1Cgger8Rw1RlN7kxg/EZkbSdHz66OcJEH3A77I9dkYhtVk
 zvzKMx1JAr9uv0kJqlgDOWpCntpyVDbfrXvZGhKw2ylriZZYQHtOZxTbez0F0SzlSSlyMA
 HR7XsPEcxtw+SpCBhTLiD6HWCzJ9pNU=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-W_iwZxFiMdq3sEdXCai-mQ-1; Wed, 22 Feb 2023 02:24:27 -0500
X-MC-Unique: W_iwZxFiMdq3sEdXCai-mQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 g5-20020a25a485000000b009419f64f6afso5605325ybi.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 23:24:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dt3JIZxwQ56FHYO/2mMt3h1+f1UXZ2MmXTurcnX2imE=;
 b=5hh2APil51L3BXpLuOVFo7aBzzXIK0VpZ1aLys0GClYNgIXyIMIEaEMb44BjgoyAwj
 shwwkHx1NgsicuXUO7+hzW+K8MOkB620z1T7p3C0TUEA5joszYBs+UojCGGL9/ioZ3xv
 tT68vkQIzLKn0OafrwXun5N7mfm7spk7Mcmao08/GPLZq7VbUnojRVYKXIbfcAO9Tefp
 cBetuSnm+k27gCXDAd6qv4G3W+B5VBnmgddJ/syrZIDkzwDH45FX2EI99Khmvya5ITfx
 JfSnriJ4vWSkXKEJoDERu4YwLKcdcchvz7WYll7lZqfpEF2mRd3YjvuZBrl3UUmD38Zo
 /adg==
X-Gm-Message-State: AO0yUKXmNYRLMiX+iZx7PBImVko+xQByDNH5lz+Q4fTdoRKl69UgPotL
 L3oEoGQn6atcNMDrGTHP3S+52n1fXUkxBIcGoq4os0JMOVe9cslc3za8h3r3p5mqWkadntS9r7i
 1rEaEdC6IjXS0+fUlCpO1pHmltQFLNSU=
X-Received: by 2002:a81:6709:0:b0:536:e148:d9e8 with SMTP id
 b9-20020a816709000000b00536e148d9e8mr444659ywc.193.1677050666576; 
 Tue, 21 Feb 2023 23:24:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+jlo7/H0AaXq2RG62Q3XB77G6CBP2om+C9OyjyWrjVkQeQarE33cQSwfgAt3/GURlc9PCY4V8GDEvyBoXXdSY=
X-Received: by 2002:a81:6709:0:b0:536:e148:d9e8 with SMTP id
 b9-20020a816709000000b00536e148d9e8mr444646ywc.193.1677050666304; Tue, 21 Feb
 2023 23:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-8-eperezma@redhat.com>
 <17716bcb-9281-c5bb-f0c8-7715378569a2@redhat.com>
In-Reply-To: <17716bcb-9281-c5bb-f0c8-7715378569a2@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 22 Feb 2023 08:23:50 +0100
Message-ID: <CAJaqyWeCeHmnnAcivD4e8oeR5+3Et95PpKFKvudw4wy5xRz2Bw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] vdpa: add vdpa net migration state notifier
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
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

On Wed, Feb 22, 2023 at 4:56 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/2/8 17:42, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
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
>
>
> Let's tweak the code to move those initialization to the beginning of
> the function.
>

Sure.

>
> > +    if (!n->vhost_started) {
> > +        return;
> > +    }
>
>
> What happens if the vhost is started during the live migration?
>

This is solved at v3, checking the migrate state at
vhost_vdpa_net_data_start_first too [1]. However, this created another
few complications / complex code as Si-Wei points out.

Recent changes due to virtio reset makes it easier to move all this
code to hw/virtio/vhost-vdpa.c, where different kinds of vDPA devices
can share the code. I'll send a new version that way.

>
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
> > +
> > +        if (i < data_queue_pairs) {
> > +            /* Do not override CVQ shadow_vqs_enabled */
> > +            vdpa_state->vhost_vdpa.shadow_vqs_enabled =3D enable;
> > +        }
>
>
> I wonder what happens if the number of queue pairs is changed during
> live migration? Should we assign all qps in this case?
>

Migration is blocked if the device has CVQ feature in this series.

Thanks!

[1] https://patchwork.kernel.org/project/qemu-devel/patch/20230215173850.29=
8832-9-eperezma@redhat.com/

> Thanks
>
>
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


