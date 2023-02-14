Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AF1696D5C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:52:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS0PN-0001gR-Iv; Tue, 14 Feb 2023 13:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pS0PL-0001gJ-GE
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:52:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pS0PF-0002Ol-CJ
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:52:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676400715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32jBJgW0mKT0R2jOGBqaZOFLogl/KpNAI3hFUYW6yzQ=;
 b=XXB0XYJ78AG02hCnbfo3MZo0AWuilH/z8bSk+2qkdQO+fi6RtGcp/yNaeJDzDd8TLvJe5Y
 1Bs6qIlkCGDefdAn87lX3KYVY5GJ4bpKpGnFUmgf3zBw8dg+2maW4FN1HSRrGKSGbwFsa4
 F9L3OfKachJwCqPBG+PnpYej8moYx/M=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-74-ll0IwqkNP9WL4TDeI8hU9w-1; Tue, 14 Feb 2023 13:51:54 -0500
X-MC-Unique: ll0IwqkNP9WL4TDeI8hU9w-1
Received: by mail-yb1-f198.google.com with SMTP id
 191-20020a2504c8000000b008e2fd9e34e6so14912214ybe.9
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 10:51:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=32jBJgW0mKT0R2jOGBqaZOFLogl/KpNAI3hFUYW6yzQ=;
 b=BlTZ66oP/Qm/D8tFaZPkkx+hsK7LFM4UWMb10QZ7CXpnYCVKRC4k0y5/pqjxtk/lAG
 NisiM+EPd4iwggwUt/Hd3d6o9xD3mwgyQztAYV6h+fsKfd9rivtkM30ou64CIxwnuqAq
 A/1Pbty8D83XZryF7Cn04XcXR1G4AhlHfgWleGJYKj0kRTn+HlpO9jqe/2Mom8xVnhKs
 2UJScln/2KdufCc4+TvWMQaecE2AKwqGzE3/80q8lGuvr6DHmXfsS6tJA/W4fr879Lal
 o2i866NUb1NUsP4EcqjShzojww7w0GYlwZ6OKjKCrpnWwtQCSOoOnV/cmfPImmUuI5W8
 keYw==
X-Gm-Message-State: AO0yUKWp1zv0p26fseJCxEMUH8PswtgRO4R3pHSuYX+pmJpfiaY6W6eg
 oBFOY56zcroVyOyx/VIG4jcanNUtPFT9UuomnWoq3pJdGNPdQoe4rmxzQrAsfoUvuHiTxyThR15
 TF+NyvM0u9ylAgMAFAXq5RALWFkyl21c=
X-Received: by 2002:a5b:24f:0:b0:802:4849:af69 with SMTP id
 g15-20020a5b024f000000b008024849af69mr460691ybp.13.1676400714149; 
 Tue, 14 Feb 2023 10:51:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+Ioe0OI+TFTbcDB9cfzMDzU9pf5Hs9HaAFQpKJxImdgXtBCsnIEYk6KJXjI2Rf63GccepSfLYkOCpV9yrRDSs=
X-Received: by 2002:a5b:24f:0:b0:802:4849:af69 with SMTP id
 g15-20020a5b024f000000b008024849af69mr460679ybp.13.1676400713665; Tue, 14 Feb
 2023 10:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-12-eperezma@redhat.com>
 <d434e204-6847-f34f-258a-9ae1cf6328ce@oracle.com>
 <CAJaqyWf5mNxjeAskVjLTFu08LpPxiHffhrtknKB75aUAEayEcQ@mail.gmail.com>
 <ab75ec37-763b-2055-01e9-10e87ef6e956@oracle.com>
 <CAJaqyWfvCFHjTu72YtVbrzprBx+=Ywuxgtgbv6rAEpQddj5z_g@mail.gmail.com>
 <ae993c38-4f6c-7ea0-d5c3-445921bdbd08@oracle.com>
In-Reply-To: <ae993c38-4f6c-7ea0-d5c3-445921bdbd08@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 14 Feb 2023 19:51:17 +0100
Message-ID: <CAJaqyWeGp=R3V4PHT86v6fi_gQZ_+uLNnRVBxWv67cA9SQrRvQ@mail.gmail.com>
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

On Mon, Feb 13, 2023 at 11:37 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 2/13/2023 1:47 AM, Eugenio Perez Martin wrote:
> > On Sat, Feb 4, 2023 at 3:04 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote=
:
> >>
> >>
> >> On 2/2/2023 7:28 AM, Eugenio Perez Martin wrote:
> >>> On Thu, Feb 2, 2023 at 2:53 AM Si-Wei Liu <si-wei.liu@oracle.com> wro=
te:
> >>>>
> >>>> On 1/12/2023 9:24 AM, Eugenio P=C3=A9rez wrote:
> >>>>> This allows net to restart the device backend to configure SVQ on i=
t.
> >>>>>
> >>>>> Ideally, these changes should not be net specific. However, the vdp=
a net
> >>>>> backend is the one with enough knowledge to configure everything be=
cause
> >>>>> of some reasons:
> >>>>> * Queues might need to be shadowed or not depending on its kind (co=
ntrol
> >>>>>      vs data).
> >>>>> * Queues need to share the same map translations (iova tree).
> >>>>>
> >>>>> Because of that it is cleaner to restart the whole net backend and
> >>>>> configure again as expected, similar to how vhost-kernel moves betw=
een
> >>>>> userspace and passthrough.
> >>>>>
> >>>>> If more kinds of devices need dynamic switching to SVQ we can creat=
e a
> >>>>> callback struct like VhostOps and move most of the code there.
> >>>>> VhostOps cannot be reused since all vdpa backend share them, and to
> >>>>> personalize just for networking would be too heavy.
> >>>>>
> >>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>>> ---
> >>>>>     net/vhost-vdpa.c | 84 +++++++++++++++++++++++++++++++++++++++++=
+++++++
> >>>>>     1 file changed, 84 insertions(+)
> >>>>>
> >>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>>>> index 5d7ad6e4d7..f38532b1df 100644
> >>>>> --- a/net/vhost-vdpa.c
> >>>>> +++ b/net/vhost-vdpa.c
> >>>>> @@ -26,6 +26,8 @@
> >>>>>     #include <err.h>
> >>>>>     #include "standard-headers/linux/virtio_net.h"
> >>>>>     #include "monitor/monitor.h"
> >>>>> +#include "migration/migration.h"
> >>>>> +#include "migration/misc.h"
> >>>>>     #include "migration/blocker.h"
> >>>>>     #include "hw/virtio/vhost.h"
> >>>>>
> >>>>> @@ -33,6 +35,7 @@
> >>>>>     typedef struct VhostVDPAState {
> >>>>>         NetClientState nc;
> >>>>>         struct vhost_vdpa vhost_vdpa;
> >>>>> +    Notifier migration_state;
> >>>>>         Error *migration_blocker;
> >>>>>         VHostNetState *vhost_net;
> >>>>>
> >>>>> @@ -243,10 +246,86 @@ static VhostVDPAState *vhost_vdpa_net_first_n=
c_vdpa(VhostVDPAState *s)
> >>>>>         return DO_UPCAST(VhostVDPAState, nc, nc0);
> >>>>>     }
> >>>>>
> >>>>> +static void vhost_vdpa_net_log_global_enable(VhostVDPAState *s, bo=
ol enable)
> >>>>> +{
> >>>>> +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> >>>>> +    VirtIONet *n;
> >>>>> +    VirtIODevice *vdev;
> >>>>> +    int data_queue_pairs, cvq, r;
> >>>>> +    NetClientState *peer;
> >>>>> +
> >>>>> +    /* We are only called on the first data vqs and only if x-svq =
is not set */
> >>>>> +    if (s->vhost_vdpa.shadow_vqs_enabled =3D=3D enable) {
> >>>>> +        return;
> >>>>> +    }
> >>>>> +
> >>>>> +    vdev =3D v->dev->vdev;
> >>>>> +    n =3D VIRTIO_NET(vdev);
> >>>>> +    if (!n->vhost_started) {
> >>>>> +        return;
> >>>>> +    }
> >>>>> +
> >>>>> +    if (enable) {
> >>>>> +        ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
> >>>>> +    }
> >>>>> +    data_queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;
> >>>>> +    cvq =3D virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> >>>>> +                                  n->max_ncs - n->max_queue_pairs =
: 0;
> >>>>> +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
> >>>>> +
> >>>>> +    peer =3D s->nc.peer;
> >>>>> +    for (int i =3D 0; i < data_queue_pairs + cvq; i++) {
> >>>>> +        VhostVDPAState *vdpa_state;
> >>>>> +        NetClientState *nc;
> >>>>> +
> >>>>> +        if (i < data_queue_pairs) {
> >>>>> +            nc =3D qemu_get_peer(peer, i);
> >>>>> +        } else {
> >>>>> +            nc =3D qemu_get_peer(peer, n->max_queue_pairs);
> >>>>> +        }
> >>>>> +
> >>>>> +        vdpa_state =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>>>> +        vdpa_state->vhost_vdpa.shadow_data =3D enable;
> >>>>> +
> >>>>> +        if (i < data_queue_pairs) {
> >>>>> +            /* Do not override CVQ shadow_vqs_enabled */
> >>>>> +            vdpa_state->vhost_vdpa.shadow_vqs_enabled =3D enable;
> >>>>> +        }
> >>>>> +    }
> >>>>> +
> >>>>> +    r =3D vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq=
);
> >>>> As the first revision, this method (vhost_net_stop followed by
> >>>> vhost_net_start) should be fine for software vhost-vdpa backend for =
e.g.
> >>>> vp_vdpa and vdpa_sim_net. However, I would like to get your attentio=
n
> >>>> that this method implies substantial blackout time for mode switchin=
g on
> >>>> real hardware - get a full cycle of device reset of getting memory
> >>>> mappings torn down, unpin & repin same set of pages, and set up new
> >>>> mapping would take very significant amount of time, especially for a
> >>>> large VM. Maybe we can do:
> >>>>
> >>> Right, I think this is something that deserves optimization in the fu=
ture.
> >>>
> >>> Note that we must replace the mappings anyway, with all passthrough
> >>> queues stopped.
> >> Yes, unmap and remap is needed indeed. I haven't checked, does shadow =
vq
> >> keep mapping to the same GPA where passthrough data virtqueues were
> >> associated with across switch (so that the mode switch is transparent =
to
> >> the guest)?
> > I don't get this question, SVQ switching is already transparent to the =
guest.
> Never mind, you seem to have answered the question in the reply here and
> below. I was thinking of possibility to do incremental in-place update
> for a given IOVA range with one single call (for the on-chip IOMMU
> case), instead of separate unmap() and map() calls. Things like
> .set_map_replace(vdpa, asid, iova_start, size, iotlb_new_maps) as I ever
> mentioned.
>
> >
> >> For platform IOMMU the mapping and remapping cost is
> >> inevitable, though I wonder for the on-chip IOMMU case could it take
> >> some fast path to just replace IOVA in place without destroying and
> >> setting up all mapping entries, if the same GPA is going to be used fo=
r
> >> the data rings (copy Eli for his input).
> >>
> >>>    This is because SVQ vrings are not in the guest space.
> >>> The pin can be skipped though, I think that's a low hand fruit here.
> >> Yes, that's right. For a large VM pining overhead usually overweighs t=
he
> >> mapping cost. It would be a great amount of time saving if pin can be
> >> skipped.
> >>
> > That is doable using dma_map/unmap apis instead of set_map (or
> > comparing in set_map) and allocation GPA translations in advance.
> Is there a way for a driver to use both dma_map()/unmap() and set_map()
> APIs at the same time? Seems not possible for the moment. And batching
> is currently unsupported on dma_map()/unmap().
>

I meant not ignoring the batch calls, yes.

> Not sure how mapping could be decoupled from pinning as the current uAPI
> (VHOST_IOTLB_UPDATE and VHOST_IOTLB_INVALIDATE) have both, i.e. it's not
> easy to tear them apart.

If we add a reverse tree, I'd say it should be possible to transverse
the new and the old IOVA -> iotlb tree and only map / unmap the
differences. All the guest memory will stay pinned this way, only SVQ
will be pinned and unpinned.

I'm not sure if this is cheap or comparable to the pin / unpin
operations but maybe we can even build that tree at set_map? Does the
pin operation get cheaper when using hugepages and similar?

> If we agree pinning is not needed, perhaps we
> could add a new uAPI to just remap the IOVA ranges for data VQ
> addresses, and get around any code path involving page pinning. Under
> the hood at the driver API level, in case of general platform IOMMU,
> iommu_unmap() and iommu_map() can be used; in case of on-chip IOMMU,
> vdpa kernel would just call the new driver API .set_map_replace() to
> update the relevant IOVA mappings in place, without having to rebuild
> the entire iova tree.
>

That's a more efficient way to do it for sure, although it requires
additions to uAPI.

> >
> >>> If any, we can track guest's IOVA and add SVQ vrings in a hole. If
> >>> guest's IOVA layout changes, we can translate it then to a new
> >>> location. That way we only need one map operation in the worst case.
> >>> I'm omitting the lookup time here, but I still should be worth it.
> >>>
> >>> But as you mention I think it is not worth complicating this series
> >>> and we can think about it on top.
> >> Yes, agreed. I'll just let you aware of the need of this optimization
> >> for real hardware device.
> >>
> >>>    We can start building it on top of
> >>> your suggestions for sure.
> >>>
> >>>> 1) replace reset with the RESUME feature that was just added to the
> >>>> vhost-vdpa ioctls in kernel
> >>> We cannot change vring addresses just with a SUSPEND / RESUME.
> >> I wonder if we can make SUSPEND (via some flag or new backend feature =
is
> >> fine) accept updating internal state like the vring addresses, while
> >> defer applying it to the device until RESUME? That way we don't lose a
> >> lot of other states that otherwise would need to re-instantiate at lar=
ge
> >> with _F_RING_RESET or device reset.
> >>
> > If that helps, that can be done for sure.
> >
> > As another idea, we could do the reverse and allow _F_RING_RESET to
> > not to forget the parameters unless they're explicitly overriden.
> Hmmm, this might need spec extension as that's not the current
> expectation for _F_RING_RESET so far as I understand. Once ring is
> reset, all parameters associated with the ring are forgotten.
>
> > I think I prefer your idea in  SUSPEND / RESUME cycle, but just wanted
> > to put that possibility on the table if that makes more sense.
> Yea may be via a new per-vq suspend feature: _F_RING_STOP.
>
> >
> >>> We could do it with the VIRTIO_F_RING_RESET feature though. Would it
> >>> be advantageous to the device?
> >>>
> >>>> 2) add new vdpa ioctls to allow iova range rebound to new virtual
> >>>> address for QEMU's shadow vq or back to device's vq
> >>> Actually, if the device supports ASID we can allocate ASID 1 to that
> >>> purpose. At this moment only CVQ vrings and control buffers are there
> >>> when the device is passthrough.
> >> Yep, we can get SVQ mapping pre-cooked in another ASID before dismantl=
e
> >> the mapping for the passthrough VQ. This will help the general IOMMU c=
ase.
> >>
> >>> But this doesn't solve the problem if we need to send all SVQ
> >>> translation to the device on-chip IOMMU, doesn't it? We must clear al=
l
> >>> of it and send the new one to the device anyway.
> >>>
> >>>> 3) use a light-weighted sequence of suspend+rebind+resume to switch =
mode
> >>>> on the fly instead of getting through the whole reset+restart cycle
> >>>>
> >>> I think this is the same as 1, isn't it?
> >> I mean do all three together: 1,2 in kernel and 3 in QEMU.
> >>
> > Ok I missed that in my first read, thanks!
> >
> > But I feel 2 should be easier to do in qemu.
> >
> > I don't really know how this helps in the general IOMMU case, I'm
> > assuming the IOMMU does not support PASID or similar tricks. Is that
> > because of the vhost_iotlb population or is there anything else I'm
> > missing?
> A new uAPI (more precisely, iotlb message) is needed to get around of
> page pinning at least. Or if not specifically tied to onchip IOMMU, we
> can make it two separate uAPIs for UNMAP and MAP, respectively.
>

I'd say the right call is just a "replace", or we will just replicate
map / unmap, isn't it?

> >
> >>>> I suspect the same idea could even be used to address high live
> >>>> migration downtime seen on hardware vdpa device. What do you think?
> >>>>
> >>> I think this is a great start for sure! Some questions:
> >>> a) Is the time on reprogramming on-chip IOMMU comparable to program
> >>> regular IOMMU?
> >> I would think this largely depends on the hardware implementation of
> >> on-chip IOMMU, the performance characteristics of which is very device
> >> specific. Some times driver software implementation and API for on-chi=
p
> >> MMU also matters. Which would require vendor specific work to optimize
> >> based on the specific use case.
> >>
> > Got it.
> >
> >>>    If it is the case it should be easier to find vdpa
> >>> devices with support for _F_RESET soon.
> >>> b) Not to merge on master, but it is possible to add an artificial
> >>> delay on vdpa_sim that simulates the properties of the delay of IOMMU=
?
> >>> In that line, have you observed if it is linear with the size of the
> >>> memory, with the number of maps, other factors..?
> >> As I said this is very device specific and hard to quantify, but I agr=
ee
> >> it's a good idea to simulate the delay and measure the effect. For the
> >> on-chip MMU device I'm looking, large proportion of the time was spent
> >> on software side in allocating a range of memory for hosting mapping
> >> entries (don't know how to quantify this part but the allocation time =
is
> >> not a constant nor linear to the size of memory), walking all iotlb
> >> entries passed down from vdpa layer and building corresponding memory
> >> key objects for a range of pages. For each iotlb entry the time to bui=
ld
> >> memory mapping looks grow linearly with the size of memory. Not sure i=
f
> >> there's room to improve, I'll let the owner to clarify.
> >>
> > So I think all of these are great ideas.
> >
> > If we state the pin & unpin huts latency in the switching I think the
> > easiest way to start is:
> > * To start with qemu and send all the map / unmap in a batch
> By map / unmap, you are referring to the uAPIs (VHOST_IOTLB_UPDATE and
> VHOST_IOTLB_INVALIDATE), not the driver level .dma_map/unmap() kernel
> APIs, right? yes it's always good to commit all map / unmap transactions
> at once in a batch.
>

Right, sorry for not being specific enough.

> > * Avoid the pin / unpin in the kernel using a smarter algorithm for
> > that, not unpinning regions that it is going to pin again.
> This seems to change the uAPI behavior underneath. Maybe cleaner to get
> it done with new uAPI.
>

I think there is no visible change from userspace, or do we expect an
effective unpin + pin for some reason?

Thanks!

> Regards,
> -Siwei
>
> >
> > What do you think?
> >
> > Thanks!
> >
> >> Thanks,
> >> -Siwei
> >>
> >>
> >>
> >>
> >>
> >>> Thanks!
> >>>
> >>>> Thanks,
> >>>> -Siwei
> >>>>
> >>>>> +    if (unlikely(r < 0)) {
> >>>>> +        error_report("unable to start vhost net: %s(%d)", g_strerr=
or(-r), -r);
> >>>>> +    }
> >>>>> +}
> >>>>> +
> >>>>> +static void vdpa_net_migration_state_notifier(Notifier *notifier, =
void *data)
> >>>>> +{
> >>>>> +    MigrationState *migration =3D data;
> >>>>> +    VhostVDPAState *s =3D container_of(notifier, VhostVDPAState,
> >>>>> +                                     migration_state);
> >>>>> +
> >>>>> +    switch (migration->state) {
> >>>>> +    case MIGRATION_STATUS_SETUP:
> >>>>> +        vhost_vdpa_net_log_global_enable(s, true);
> >>>>> +        return;
> >>>>> +
> >>>>> +    case MIGRATION_STATUS_CANCELLING:
> >>>>> +    case MIGRATION_STATUS_CANCELLED:
> >>>>> +    case MIGRATION_STATUS_FAILED:
> >>>>> +        vhost_vdpa_net_log_global_enable(s, false);
> >>>>> +        return;
> >>>>> +    };
> >>>>> +}
> >>>>> +
> >>>>>     static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
> >>>>>     {
> >>>>>         struct vhost_vdpa *v =3D &s->vhost_vdpa;
> >>>>>
> >>>>> +    if (v->feature_log) {
> >>>>> +        add_migration_state_change_notifier(&s->migration_state);
> >>>>> +    }
> >>>>> +
> >>>>>         if (v->shadow_vqs_enabled) {
> >>>>>             v->iova_tree =3D vhost_iova_tree_new(v->iova_range.firs=
t,
> >>>>>                                                v->iova_range.last);
> >>>>> @@ -280,6 +359,10 @@ static void vhost_vdpa_net_client_stop(NetClie=
ntState *nc)
> >>>>>
> >>>>>         assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >>>>>
> >>>>> +    if (s->vhost_vdpa.index =3D=3D 0 && s->vhost_vdpa.feature_log)=
 {
> >>>>> +        remove_migration_state_change_notifier(&s->migration_state=
);
> >>>>> +    }
> >>>>> +
> >>>>>         dev =3D s->vhost_vdpa.dev;
> >>>>>         if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> >>>>>             g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tr=
ee_delete);
> >>>>> @@ -767,6 +850,7 @@ static NetClientState *net_vhost_vdpa_init(NetC=
lientState *peer,
> >>>>>         s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >>>>>         s->vhost_vdpa.index =3D queue_pair_index;
> >>>>>         s->always_svq =3D svq;
> >>>>> +    s->migration_state.notify =3D vdpa_net_migration_state_notifie=
r;
> >>>>>         s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >>>>>         s->vhost_vdpa.iova_range =3D iova_range;
> >>>>>         s->vhost_vdpa.shadow_data =3D svq;
>


