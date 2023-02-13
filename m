Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABA4694202
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:54:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVRy-0006L8-LW; Mon, 13 Feb 2023 04:48:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pRVRi-0006FP-T5
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:48:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pRVRg-0004OF-4T
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676281702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYzLvvJmcRrQRTZfYm368XxZ+2d1ya41ncVpAqcaq04=;
 b=P71Km1sEFvdx+LxJFDUWAbaYqGpQ+q4lRqsvlPwLWVFqopx/KmPNGIIrIxQJpCo5bkZAsZ
 h1tqeKSxKrTBrPWML0FBkOYrvpRwzOD9XkRKO06r3EgdLtVK86Dzbnsq3CAo6bqXbk+4UB
 12lBklll0NwQuqUZ3YEFXGRAMVXx5uY=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-253-MzO6U5VjPiO00e57Vav01w-1; Mon, 13 Feb 2023 04:48:19 -0500
X-MC-Unique: MzO6U5VjPiO00e57Vav01w-1
Received: by mail-yb1-f199.google.com with SMTP id
 v63-20020a254842000000b008f257b16d71so8276486yba.15
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 01:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FYzLvvJmcRrQRTZfYm368XxZ+2d1ya41ncVpAqcaq04=;
 b=SlspP9HhypLzNaHphtwi3xQJo6gS2PS3gxSmXsqDsZPFbOM/KUwSIKmQfyWKKEWNBP
 m3kPwOlFqsFxuMRFM5jo+mrKwCeFaolqUXG/r09ceTce3WZw5t9hFGql9FbrLxePSdd0
 1RuDJlU24OgwYpgW63fvcFdFY3KcpL8JTzRd2XgduscyMa5nVzQl6r1WXUS5gGycxZLF
 oREqJiaCR3ImgjM+xerLgYsGajaCIyd1bDLQpZD78dgxyK9q4Odsi0m5kENiFiArseN8
 d/je2PHuF1L0Sl28oewaxO3FdvIRrLnda0lrHtRhqjpkrLgHpKNdTNfKCldyCRrVSRnZ
 SJuA==
X-Gm-Message-State: AO0yUKVuhR6FiPw8aOZpzSkaKASz70cHUHhQ3Jj7T39yHlysFExT5LJy
 g5MBIQ+noIf8T0LUuiFX5JkCIgqfEeyx7sPKFZxuop03goWZGyw/qf9vr2yA8NBiFSjHYyH/yzY
 zdAg5WU7EWefctznLnoZC4M5ecAHBruc=
X-Received: by 2002:a81:8982:0:b0:52a:9161:f533 with SMTP id
 z124-20020a818982000000b0052a9161f533mr2995640ywf.64.1676281698846; 
 Mon, 13 Feb 2023 01:48:18 -0800 (PST)
X-Google-Smtp-Source: AK7set8yGaNULLIe0jAYxMfG8cC7fi28lvtV7k9MecPm8zXEmGF5fGoje1SYeWp2OsNIBQtpOBs2EU3DCX2Vk4ErOeg=
X-Received: by 2002:a81:8982:0:b0:52a:9161:f533 with SMTP id
 z124-20020a818982000000b0052a9161f533mr2995630ywf.64.1676281698503; Mon, 13
 Feb 2023 01:48:18 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-12-eperezma@redhat.com>
 <d434e204-6847-f34f-258a-9ae1cf6328ce@oracle.com>
 <CAJaqyWf5mNxjeAskVjLTFu08LpPxiHffhrtknKB75aUAEayEcQ@mail.gmail.com>
 <ab75ec37-763b-2055-01e9-10e87ef6e956@oracle.com>
In-Reply-To: <ab75ec37-763b-2055-01e9-10e87ef6e956@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 13 Feb 2023 10:47:42 +0100
Message-ID: <CAJaqyWfvCFHjTu72YtVbrzprBx+=Ywuxgtgbv6rAEpQddj5z_g@mail.gmail.com>
Subject: Re: [RFC v2 11/13] vdpa: add vdpa net migration state notifier
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Eli Cohen <eli@mellanox.com>, qemu-devel@nongnu.org, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
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

On Sat, Feb 4, 2023 at 3:04 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 2/2/2023 7:28 AM, Eugenio Perez Martin wrote:
> > On Thu, Feb 2, 2023 at 2:53 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote=
:
> >>
> >>
> >> On 1/12/2023 9:24 AM, Eugenio P=C3=A9rez wrote:
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
> >>>    net/vhost-vdpa.c | 84 ++++++++++++++++++++++++++++++++++++++++++++=
++++
> >>>    1 file changed, 84 insertions(+)
> >>>
> >>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>> index 5d7ad6e4d7..f38532b1df 100644
> >>> --- a/net/vhost-vdpa.c
> >>> +++ b/net/vhost-vdpa.c
> >>> @@ -26,6 +26,8 @@
> >>>    #include <err.h>
> >>>    #include "standard-headers/linux/virtio_net.h"
> >>>    #include "monitor/monitor.h"
> >>> +#include "migration/migration.h"
> >>> +#include "migration/misc.h"
> >>>    #include "migration/blocker.h"
> >>>    #include "hw/virtio/vhost.h"
> >>>
> >>> @@ -33,6 +35,7 @@
> >>>    typedef struct VhostVDPAState {
> >>>        NetClientState nc;
> >>>        struct vhost_vdpa vhost_vdpa;
> >>> +    Notifier migration_state;
> >>>        Error *migration_blocker;
> >>>        VHostNetState *vhost_net;
> >>>
> >>> @@ -243,10 +246,86 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_=
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
> >>> +    NetClientState *peer;
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
> >>> +    if (enable) {
> >>> +        ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
> >>> +    }
> >>> +    data_queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;
> >>> +    cvq =3D virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> >>> +                                  n->max_ncs - n->max_queue_pairs : =
0;
> >>> +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
> >>> +
> >>> +    peer =3D s->nc.peer;
> >>> +    for (int i =3D 0; i < data_queue_pairs + cvq; i++) {
> >>> +        VhostVDPAState *vdpa_state;
> >>> +        NetClientState *nc;
> >>> +
> >>> +        if (i < data_queue_pairs) {
> >>> +            nc =3D qemu_get_peer(peer, i);
> >>> +        } else {
> >>> +            nc =3D qemu_get_peer(peer, n->max_queue_pairs);
> >>> +        }
> >>> +
> >>> +        vdpa_state =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>> +        vdpa_state->vhost_vdpa.shadow_data =3D enable;
> >>> +
> >>> +        if (i < data_queue_pairs) {
> >>> +            /* Do not override CVQ shadow_vqs_enabled */
> >>> +            vdpa_state->vhost_vdpa.shadow_vqs_enabled =3D enable;
> >>> +        }
> >>> +    }
> >>> +
> >>> +    r =3D vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
> >> As the first revision, this method (vhost_net_stop followed by
> >> vhost_net_start) should be fine for software vhost-vdpa backend for e.=
g.
> >> vp_vdpa and vdpa_sim_net. However, I would like to get your attention
> >> that this method implies substantial blackout time for mode switching =
on
> >> real hardware - get a full cycle of device reset of getting memory
> >> mappings torn down, unpin & repin same set of pages, and set up new
> >> mapping would take very significant amount of time, especially for a
> >> large VM. Maybe we can do:
> >>
> > Right, I think this is something that deserves optimization in the futu=
re.
> >
> > Note that we must replace the mappings anyway, with all passthrough
> > queues stopped.
> Yes, unmap and remap is needed indeed. I haven't checked, does shadow vq
> keep mapping to the same GPA where passthrough data virtqueues were
> associated with across switch (so that the mode switch is transparent to
> the guest)?

I don't get this question, SVQ switching is already transparent to the gues=
t.

> For platform IOMMU the mapping and remapping cost is
> inevitable, though I wonder for the on-chip IOMMU case could it take
> some fast path to just replace IOVA in place without destroying and
> setting up all mapping entries, if the same GPA is going to be used for
> the data rings (copy Eli for his input).
>
> >   This is because SVQ vrings are not in the guest space.
> > The pin can be skipped though, I think that's a low hand fruit here.
> Yes, that's right. For a large VM pining overhead usually overweighs the
> mapping cost. It would be a great amount of time saving if pin can be
> skipped.
>

That is doable using dma_map/unmap apis instead of set_map (or
comparing in set_map) and allocation GPA translations in advance.

> >
> > If any, we can track guest's IOVA and add SVQ vrings in a hole. If
> > guest's IOVA layout changes, we can translate it then to a new
> > location. That way we only need one map operation in the worst case.
> > I'm omitting the lookup time here, but I still should be worth it.
> >
> > But as you mention I think it is not worth complicating this series
> > and we can think about it on top.
> Yes, agreed. I'll just let you aware of the need of this optimization
> for real hardware device.
>
> >   We can start building it on top of
> > your suggestions for sure.
> >
> >> 1) replace reset with the RESUME feature that was just added to the
> >> vhost-vdpa ioctls in kernel
> > We cannot change vring addresses just with a SUSPEND / RESUME.
> I wonder if we can make SUSPEND (via some flag or new backend feature is
> fine) accept updating internal state like the vring addresses, while
> defer applying it to the device until RESUME? That way we don't lose a
> lot of other states that otherwise would need to re-instantiate at large
> with _F_RING_RESET or device reset.
>

If that helps, that can be done for sure.

As another idea, we could do the reverse and allow _F_RING_RESET to
not to forget the parameters unless they're explicitly overriden. I
think I prefer your idea in  SUSPEND / RESUME cycle, but just wanted
to put that possibility on the table if that makes more sense.

> >
> > We could do it with the VIRTIO_F_RING_RESET feature though. Would it
> > be advantageous to the device?
> >
> >> 2) add new vdpa ioctls to allow iova range rebound to new virtual
> >> address for QEMU's shadow vq or back to device's vq
> > Actually, if the device supports ASID we can allocate ASID 1 to that
> > purpose. At this moment only CVQ vrings and control buffers are there
> > when the device is passthrough.
> Yep, we can get SVQ mapping pre-cooked in another ASID before dismantle
> the mapping for the passthrough VQ. This will help the general IOMMU case=
.
>
> >
> > But this doesn't solve the problem if we need to send all SVQ
> > translation to the device on-chip IOMMU, doesn't it? We must clear all
> > of it and send the new one to the device anyway.
> >
> >> 3) use a light-weighted sequence of suspend+rebind+resume to switch mo=
de
> >> on the fly instead of getting through the whole reset+restart cycle
> >>
> > I think this is the same as 1, isn't it?
> I mean do all three together: 1,2 in kernel and 3 in QEMU.
>

Ok I missed that in my first read, thanks!

But I feel 2 should be easier to do in qemu.

I don't really know how this helps in the general IOMMU case, I'm
assuming the IOMMU does not support PASID or similar tricks. Is that
because of the vhost_iotlb population or is there anything else I'm
missing?

> >
> >> I suspect the same idea could even be used to address high live
> >> migration downtime seen on hardware vdpa device. What do you think?
> >>
> > I think this is a great start for sure! Some questions:
> > a) Is the time on reprogramming on-chip IOMMU comparable to program
> > regular IOMMU?
> I would think this largely depends on the hardware implementation of
> on-chip IOMMU, the performance characteristics of which is very device
> specific. Some times driver software implementation and API for on-chip
> MMU also matters. Which would require vendor specific work to optimize
> based on the specific use case.
>

Got it.

> >   If it is the case it should be easier to find vdpa
> > devices with support for _F_RESET soon.
> > b) Not to merge on master, but it is possible to add an artificial
> > delay on vdpa_sim that simulates the properties of the delay of IOMMU?
> > In that line, have you observed if it is linear with the size of the
> > memory, with the number of maps, other factors..?
> As I said this is very device specific and hard to quantify, but I agree
> it's a good idea to simulate the delay and measure the effect. For the
> on-chip MMU device I'm looking, large proportion of the time was spent
> on software side in allocating a range of memory for hosting mapping
> entries (don't know how to quantify this part but the allocation time is
> not a constant nor linear to the size of memory), walking all iotlb
> entries passed down from vdpa layer and building corresponding memory
> key objects for a range of pages. For each iotlb entry the time to build
> memory mapping looks grow linearly with the size of memory. Not sure if
> there's room to improve, I'll let the owner to clarify.
>

So I think all of these are great ideas.

If we state the pin & unpin huts latency in the switching I think the
easiest way to start is:
* To start with qemu and send all the map / unmap in a batch
* Avoid the pin / unpin in the kernel using a smarter algorithm for
that, not unpinning regions that it is going to pin again.

What do you think?

Thanks!

> Thanks,
> -Siwei
>
>
>
>
>
> >
> > Thanks!
> >
> >> Thanks,
> >> -Siwei
> >>
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
> >>> +    switch (migration->state) {
> >>> +    case MIGRATION_STATUS_SETUP:
> >>> +        vhost_vdpa_net_log_global_enable(s, true);
> >>> +        return;
> >>> +
> >>> +    case MIGRATION_STATUS_CANCELLING:
> >>> +    case MIGRATION_STATUS_CANCELLED:
> >>> +    case MIGRATION_STATUS_FAILED:
> >>> +        vhost_vdpa_net_log_global_enable(s, false);
> >>> +        return;
> >>> +    };
> >>> +}
> >>> +
> >>>    static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
> >>>    {
> >>>        struct vhost_vdpa *v =3D &s->vhost_vdpa;
> >>>
> >>> +    if (v->feature_log) {
> >>> +        add_migration_state_change_notifier(&s->migration_state);
> >>> +    }
> >>> +
> >>>        if (v->shadow_vqs_enabled) {
> >>>            v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> >>>                                               v->iova_range.last);
> >>> @@ -280,6 +359,10 @@ static void vhost_vdpa_net_client_stop(NetClient=
State *nc)
> >>>
> >>>        assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >>>
> >>> +    if (s->vhost_vdpa.index =3D=3D 0 && s->vhost_vdpa.feature_log) {
> >>> +        remove_migration_state_change_notifier(&s->migration_state);
> >>> +    }
> >>> +
> >>>        dev =3D s->vhost_vdpa.dev;
> >>>        if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> >>>            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_=
delete);
> >>> @@ -767,6 +850,7 @@ static NetClientState *net_vhost_vdpa_init(NetCli=
entState *peer,
> >>>        s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >>>        s->vhost_vdpa.index =3D queue_pair_index;
> >>>        s->always_svq =3D svq;
> >>> +    s->migration_state.notify =3D vdpa_net_migration_state_notifier;
> >>>        s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >>>        s->vhost_vdpa.iova_range =3D iova_range;
> >>>        s->vhost_vdpa.shadow_data =3D svq;
>


