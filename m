Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299B862D4DB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 09:13:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ova0y-00052S-Jt; Thu, 17 Nov 2022 03:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ova0w-00052J-0O
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:12:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ova0t-0006Bc-PM
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668672766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MfPYtVSB6cIa8juSj1mGPDS9yTAQ9Zmv6K/nL8ei8M=;
 b=Y/suuBHWF/AyATFq9dYX6JOhCZkPYnNsMPLMdTaXadIqUDB7hTJU4Y6A8C0sJSTwEjtARz
 NZorTZwvSwo94dd58emUMBU/z/yftWzEZRWZnmCLBE6LRhuZFdwntGiESxSazLECm7G+be
 z11vgW+GhMbgcKH94w5tWXcaiPI0Lxw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-NSrLDNoQPfeQUaY55W50bg-1; Thu, 17 Nov 2022 03:12:44 -0500
X-MC-Unique: NSrLDNoQPfeQUaY55W50bg-1
Received: by mail-qt1-f199.google.com with SMTP id
 f4-20020a05622a114400b003a57f828277so1015764qty.22
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 00:12:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7MfPYtVSB6cIa8juSj1mGPDS9yTAQ9Zmv6K/nL8ei8M=;
 b=gzwXiRjJMWgf4z4VWMauzztmoFtJfau+U6E2N4iMlwHPDWmRRRuXEifE4ecr7qF9UU
 MZVM8MGle2QwGzmh0IRQPrdrLzp2//SzGzzSX8bnEoUp6g3CKM4woWIT8hexySV+NFmp
 /e2lnqQndmc+qty5CXfG79m97LQRJLc9io8VPsOERCDFPzi6QWMxEN1UYtirDO9OPOci
 /A0496rRDrR+Sb6nUg+LpvdaoNxPZK9rYJ7IMVb4UG3VNnAIz+HWz4NuJm6f2zS2lCgg
 +cnIt6TfL8Hoazf50cTel131lSlpyu9UzlGudfh/cQhyEgoVV9Upx/sCJmQC+caQhW+e
 Bjrw==
X-Gm-Message-State: ANoB5plJwbcf8HqjqstuA+N+ThSnK2jmxY8qfa4yxgKTTztgGHfSPH84
 KT/cEIx6Mkw6IJ3YuQSvRvya7+bcdZW+0MNMP11WuQL3mwSTIyVWR+1tH16YdV++80yHP7b3gGl
 DlVpFtx0US6IRd+kHkMm53HLc3zKOnsc=
X-Received: by 2002:a37:34a:0:b0:6fa:1972:8cc6 with SMTP id
 71-20020a37034a000000b006fa19728cc6mr751395qkd.577.1668672764019; 
 Thu, 17 Nov 2022 00:12:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7PIo5aZg/VzA5KBEBcnnksAAb2QGALeIf8clZbvXgbt4Jj5TqPRYp36pJt8LVLCa7vQn9/NUnGnV3b982Wxyk=
X-Received: by 2002:a37:34a:0:b0:6fa:1972:8cc6 with SMTP id
 71-20020a37034a000000b006fa19728cc6mr751370qkd.577.1668672763732; Thu, 17 Nov
 2022 00:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20221116150556.1294049-1-eperezma@redhat.com>
 <20221116150556.1294049-11-eperezma@redhat.com>
 <f22d530b-3c5e-5b94-948d-594608668687@redhat.com>
 <CAJaqyWfj0dAnto_S003ei28Y9Ei+8JJApcGN4K+P-7yH683VGA@mail.gmail.com>
In-Reply-To: <CAJaqyWfj0dAnto_S003ei28Y9Ei+8JJApcGN4K+P-7yH683VGA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 17 Nov 2022 09:12:07 +0100
Message-ID: <CAJaqyWcrQMPGsxUKsbYyNUVX0q-_gFdxQ3yuGZ+oFaSZ-f0LPg@mail.gmail.com>
Subject: Re: [PATCH for 8.0 v7 10/10] vdpa: Always start CVQ in SVQ mode if
 possible
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Parav Pandit <parav@mellanox.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org
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

On Thu, Nov 17, 2022 at 8:43 AM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Thu, Nov 17, 2022 at 7:52 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/11/16 23:05, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > Isolate control virtqueue in its own group, allowing to intercept con=
trol
> > > commands but letting dataplane run totally passthrough to the guest.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > > v7:
> > > * Never ask for number of address spaces, just react if isolation is =
not
> > >    possible.
> > > * Return ASID ioctl errors instead of masking them as if the device h=
as
> > >    no asid.
> > > * Simplify net_init_vhost_vdpa logic
> > > * Add "if possible" suffix
> > >
> > > v6:
> > > * Disable control SVQ if the device does not support it because of
> > > features.
> > >
> > > v5:
> > > * Fixing the not adding cvq buffers when x-svq=3Don is specified.
> > > * Move vring state in vhost_vdpa_get_vring_group instead of using a
> > >    parameter.
> > > * Rename VHOST_VDPA_NET_CVQ_PASSTHROUGH to VHOST_VDPA_NET_DATA_ASID
> > >
> > > v4:
> > > * Squash vhost_vdpa_cvq_group_is_independent.
> > > * Rebased on last CVQ start series, that allocated CVQ cmd bufs at lo=
ad
> > > * Do not check for cvq index on vhost_vdpa_net_prepare, we only have =
one
> > >    that callback registered in that NetClientInfo.
> > >
> > > v3:
> > > * Make asid related queries print a warning instead of returning an
> > >    error and stop the start of qemu.
> > > ---
> > >   hw/virtio/vhost-vdpa.c |   3 +-
> > >   net/vhost-vdpa.c       | 117 ++++++++++++++++++++++++++++++++++++++=
+--
> > >   2 files changed, 114 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index 852baf8b2c..a29a18a6a9 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -653,7 +653,8 @@ static int vhost_vdpa_set_backend_cap(struct vhos=
t_dev *dev)
> > >   {
> > >       uint64_t features;
> > >       uint64_t f =3D 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
> > > -        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
> > > +        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
> > > +        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
> > >       int r;
> > >
> > >       if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)=
) {
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index a9c864741a..dc13a49311 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -101,6 +101,8 @@ static const uint64_t vdpa_svq_device_features =
=3D
> > >       BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > >       BIT_ULL(VIRTIO_NET_F_STANDBY);
> > >
> > > +#define VHOST_VDPA_NET_CVQ_ASID 1
> > > +
> > >   VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> > >   {
> > >       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > @@ -242,6 +244,40 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> > >           .check_peer_type =3D vhost_vdpa_check_peer_type,
> > >   };
> > >
> > > +static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq=
_index)
> > > +{
> > > +    struct vhost_vring_state state =3D {
> > > +        .index =3D vq_index,
> > > +    };
> > > +    int r =3D ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP, &state);
> > > +
> > > +    if (unlikely(r < 0)) {
> > > +        error_report("Cannot get VQ %u group: %s", vq_index,
> > > +                     g_strerror(errno));
> > > +        return r;
> > > +    }
> > > +
> > > +    return state.num;
> > > +}
> > > +
> > > +static int vhost_vdpa_set_address_space_id(struct vhost_vdpa *v,
> > > +                                           unsigned vq_group,
> > > +                                           unsigned asid_num)
> > > +{
> > > +    struct vhost_vring_state asid =3D {
> > > +        .index =3D vq_group,
> > > +        .num =3D asid_num,
> > > +    };
> > > +    int r;
> > > +
> > > +    r =3D ioctl(v->device_fd, VHOST_VDPA_SET_GROUP_ASID, &asid);
> > > +    if (unlikely(r < 0)) {
> > > +        error_report("Can't set vq group %u asid %u, errno=3D%d (%s)=
",
> > > +                     asid.index, asid.num, errno, g_strerror(errno))=
;
> > > +    }
> > > +    return r;
> > > +}
> > > +
> > >   static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *ad=
dr)
> > >   {
> > >       VhostIOVATree *tree =3D v->iova_tree;
> > > @@ -316,11 +352,69 @@ dma_map_err:
> > >   static int vhost_vdpa_net_cvq_start(NetClientState *nc)
> > >   {
> > >       VhostVDPAState *s;
> > > -    int r;
> > > +    struct vhost_vdpa *v;
> > > +    uint64_t backend_features;
> > > +    int64_t cvq_group;
> > > +    int cvq_index, r;
> > >
> > >       assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > >
> > >       s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > +    v =3D &s->vhost_vdpa;
> > > +
> > > +    v->shadow_data =3D s->always_svq;
> > > +    v->shadow_vqs_enabled =3D s->always_svq;
> > > +    s->vhost_vdpa.address_space_id =3D VHOST_VDPA_GUEST_PA_ASID;
> > > +
> > > +    if (s->always_svq) {
> > > +        goto out;
> > > +    }
> > > +
> > > +    /* Backend features are not available in v->dev yet. */
> > > +    r =3D ioctl(v->device_fd, VHOST_GET_BACKEND_FEATURES, &backend_f=
eatures);
> > > +    if (unlikely(r < 0)) {
> > > +        error_report("Cannot get vdpa backend_features: %s(%d)",
> > > +            g_strerror(errno), errno);
> > > +        return -1;
> > > +    }
> > > +    if (!(backend_features & VHOST_BACKEND_F_IOTLB_ASID) ||
> > > +        !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) =
{
> >
> >
> > I think there should be some logic to block migration in this case?
> >
>
> Since vhost_vdpa are not shadowed they don't expose _F_LOG, so
> migration is blocked that way.
>
> We can override it to make its message a little bit clearer.
>
> >
> > > +        return 0;
> > > +    }
> > > +
> > > +    /**
> > > +     * Check if all the virtqueues of the virtio device are in a dif=
ferent vq
> > > +     * than the last vq. VQ group of last group passed in cvq_group.
> > > +     */
> > > +    cvq_index =3D v->dev->vq_index_end - 1;
> > > +    cvq_group =3D vhost_vdpa_get_vring_group(v->device_fd, cvq_index=
);
> > > +    if (unlikely(cvq_group < 0)) {
> > > +        return cvq_group;x
> > > +    }
> > > +    for (int i =3D 0; i < cvq_index; ++i) {
> > > +        int64_t group =3D vhost_vdpa_get_vring_group(v->device_fd, i=
);
> > > +
> > > +        if (unlikely(group < 0)) {
> > > +            return group;
> > > +        }
> > > +
> > > +        if (unlikely(group =3D=3D cvq_group)) {
> > > +            warn_report(
> > > +                "CVQ %"PRId64" group is the same as VQ %d one (%"PRI=
d64")",
> > > +                cvq_group, i, group);
> > > +            return 0;
> >
> >
> > Ditto.
> >
> >
> > > +        }
> > > +    }
> > > +
> > > +    r =3D vhost_vdpa_set_address_space_id(v, cvq_group, VHOST_VDPA_N=
ET_CVQ_ASID);
> > > +    if (unlikely(r < 0)) {
> > > +        return r;
> > > +    } else {
> > > +        v->shadow_vqs_enabled =3D true;
> > > +        s->vhost_vdpa.address_space_id =3D VHOST_VDPA_NET_CVQ_ASID;
> > > +    }
> > > +
> > > +out:
> > >       if (!s->vhost_vdpa.shadow_vqs_enabled) {
> > >           return 0;
> > >       }
> > > @@ -652,6 +746,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> > >       g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> > >       NetClientState *nc;
> > >       int queue_pairs, r, i =3D 0, has_cvq =3D 0;
> > > +    bool svq_cvq;
> > >
> > >       assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > >       opts =3D &netdev->u.vhost_vdpa;
> > > @@ -693,12 +788,24 @@ int net_init_vhost_vdpa(const Netdev *netdev, c=
onst char *name,
> > >           return queue_pairs;
> > >       }
> > >
> > > -    if (opts->x_svq) {
> > > -        struct vhost_vdpa_iova_range iova_range;
> > > +    svq_cvq =3D opts->x_svq || has_cvq;
> > > +    if (svq_cvq) {
> > > +        Error *warn =3D NULL;
> > >
> > > -        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
> > > -            goto err_svq;
> > > +        svq_cvq =3D vhost_vdpa_net_valid_svq_features(features,
> > > +                                                   opts->x_svq ? err=
p : &warn);
> > > +        if (!svq_cvq) {
> > > +            if (opts->x_svq) {
> > > +                goto err_svq;
> > > +            } else {
> > > +                warn_reportf_err(warn, "Cannot shadow CVQ: ");
> >
> >
> > This seems suspicious, we reach here we we can't just use svq for cvq.
> >
>
> Right, but what is the suspicious part?
>
> >
> >
> > > +            }
> > >           }
> >
> >
> > The above logic is not easy to follow. I guess the root cause is the
> > variable name. It looks to me svq_cvq is better to be renamed as "svq"?
> >
>
> Yes, we can rename it. I'll send a newer version with the rename.
>

Another possibility is to get rid of the variable and allocate the
iova_tree unconditionally. We could send the log in
vhost_vdpa_net_cvq_start, or make that message the vhost migration
blocker.

Thanks!

> Thanks!
>
> > Thanks
> >
> >
> > > +    }
> > > +
> > > +    if (svq_cvq) {
> > > +        /* Allocate a common iova tree if there is a possibility of =
SVQ */
> > > +        struct vhost_vdpa_iova_range iova_range;
> > >
> > >           vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > >           iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_ra=
nge.last);
> >


