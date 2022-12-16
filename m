Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C51664E7D5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 08:37:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p65GF-0001ij-Kd; Fri, 16 Dec 2022 02:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p65GD-0001fI-CU
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 02:36:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p65GA-0007hW-Fh
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 02:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671176155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xjf7Uw2lvRn/Y4N/EbhXgyq4369fmFcLv50akapfEMo=;
 b=Ug6+dH/vNsToWt9gDLTshYE7WgVHb2S2xRL+eGg0dfypjxEoLgVHWqQc1hhXqC3ZW/Kj6m
 /9LoKG3c0FEcDUPDTldw1AtIDb/K23XB6iEVwjaABIfdub0UDyZTZhjNndlG2LkRrV8Ltd
 GgxlItM+u5rdMMzWZzxgl6z/gOjGR3w=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-guGYtdO9ODeKuUG_8CXTEQ-1; Fri, 16 Dec 2022 02:35:54 -0500
X-MC-Unique: guGYtdO9ODeKuUG_8CXTEQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 p27-20020a4a3c5b000000b004a3f1e7cc1fso827868oof.23
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 23:35:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xjf7Uw2lvRn/Y4N/EbhXgyq4369fmFcLv50akapfEMo=;
 b=vuhEOwpxDlfTRI9Krb4jelI4sVExMCvQIemhYbt2udM9WJDCYGEGFEIAT5jfWXn1TP
 RtdzxomO68YRAfDAWJ72xs938KeQNGhZJsVfnXrLy4xO3CCNfWy7pgg58R2k0uN2po/V
 YOf4BHJDqW0eJf4mfAAl8RXKk7AWY9ohN6brTLdpsIjgVrJqY2wdfyzg44BQBIkG2YZi
 ocF6BHn5/S+M7VJd0kGbckGp61nwV9rXjkgWoORx1kS4zz3TkZBypha5s6tTxuOkRPbu
 DoXThPlZRsg9N0oMyC+3z+Wg5TghVwyR8UX9W0KBcF18LIorwNtMA2Vu9amipUqn1xDr
 onbw==
X-Gm-Message-State: ANoB5pkGodhNtJ/WPbgU8lBjR2hTtDM2j8tWaMch0O4penthlPLB+LOS
 w2db9f0SRFZtjlg2uAFCMnEhHCTvMzFqT+cvQaFULIa80mSgZweyTOA9sAwlhFOE1GWmdRqAUa0
 D6r5jlHuWNFpM//SVzA5JWZla7ocCXDk=
X-Received: by 2002:a05:6808:114c:b0:35e:7a42:7ab5 with SMTP id
 u12-20020a056808114c00b0035e7a427ab5mr515112oiu.280.1671176153579; 
 Thu, 15 Dec 2022 23:35:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf69qICvyQuu7IvaCwoLsD676kBKVhLY8/0qmG45U9xXvA/Fp61q/5TrlWXWeo6Dww8IYDzxXLHPI8I1HjWLkzs=
X-Received: by 2002:a05:6808:114c:b0:35e:7a42:7ab5 with SMTP id
 u12-20020a056808114c00b0035e7a427ab5mr515101oiu.280.1671176153334; Thu, 15
 Dec 2022 23:35:53 -0800 (PST)
MIME-Version: 1.0
References: <20221215113144.322011-1-eperezma@redhat.com>
 <20221215113144.322011-13-eperezma@redhat.com>
In-Reply-To: <20221215113144.322011-13-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 16 Dec 2022 15:35:42 +0800
Message-ID: <CACGkMEsjbkMvB9=9JbHq1gPbm5OZdBuGoGt7tRm2vAXH8yr79A@mail.gmail.com>
Subject: Re: [PATCH v9 12/12] vdpa: always start CVQ in SVQ mode if possible
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, 
 Eli Cohen <eli@mellanox.com>, Cornelia Huck <cohuck@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Longpeng <longpeng2@huawei.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Parav Pandit <parav@mellanox.com>,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Thu, Dec 15, 2022 at 7:32 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Isolate control virtqueue in its own group, allowing to intercept control
> commands but letting dataplane run totally passthrough to the guest.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
> v9:
> * Reuse iova_range fetched from the device at initialization, instead of
>   fetch it again at vhost_vdpa_net_cvq_start.
> * Add comment about how migration is blocked in case ASID does not met
>   our expectations.
> * Delete warning about CVQ group not being independent.
>
> v8:
> * Do not allocate iova_tree on net_init_vhost_vdpa if only CVQ is
>   shadowed. Move the iova_tree handling in this case to
>   vhost_vdpa_net_cvq_start and vhost_vdpa_net_cvq_stop.
>
> v7:
> * Never ask for number of address spaces, just react if isolation is not
>   possible.
> * Return ASID ioctl errors instead of masking them as if the device has
>   no asid.
> * Simplify net_init_vhost_vdpa logic
> * Add "if possible" suffix
>
> v6:
> * Disable control SVQ if the device does not support it because of
> features.
>
> v5:
> * Fixing the not adding cvq buffers when x-svq=3Don is specified.
> * Move vring state in vhost_vdpa_get_vring_group instead of using a
>   parameter.
> * Rename VHOST_VDPA_NET_CVQ_PASSTHROUGH to VHOST_VDPA_NET_DATA_ASID
>
> v4:
> * Squash vhost_vdpa_cvq_group_is_independent.
> * Rebased on last CVQ start series, that allocated CVQ cmd bufs at load
> * Do not check for cvq index on vhost_vdpa_net_prepare, we only have one
>   that callback registered in that NetClientInfo.
>
> v3:
> * Make asid related queries print a warning instead of returning an
>   error and stop the start of qemu.
> ---
>  hw/virtio/vhost-vdpa.c |   3 +-
>  net/vhost-vdpa.c       | 110 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 111 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 48d8c60e76..8cd00f5a96 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -638,7 +638,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_de=
v *dev)
>  {
>      uint64_t features;
>      uint64_t f =3D 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
> -        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
> +        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
> +        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
>      int r;
>
>      if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 710c5efe96..d36664f33a 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -102,6 +102,8 @@ static const uint64_t vdpa_svq_device_features =3D
>      BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
>      BIT_ULL(VIRTIO_NET_F_STANDBY);
>
> +#define VHOST_VDPA_NET_CVQ_ASID 1
> +
>  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
>  {
>      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> @@ -243,6 +245,40 @@ static NetClientInfo net_vhost_vdpa_info =3D {
>          .check_peer_type =3D vhost_vdpa_check_peer_type,
>  };
>
> +static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_ind=
ex)
> +{
> +    struct vhost_vring_state state =3D {
> +        .index =3D vq_index,
> +    };
> +    int r =3D ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP, &state);
> +
> +    if (unlikely(r < 0)) {
> +        error_report("Cannot get VQ %u group: %s", vq_index,
> +                     g_strerror(errno));
> +        return r;
> +    }
> +
> +    return state.num;
> +}
> +
> +static int vhost_vdpa_set_address_space_id(struct vhost_vdpa *v,
> +                                           unsigned vq_group,
> +                                           unsigned asid_num)
> +{
> +    struct vhost_vring_state asid =3D {
> +        .index =3D vq_group,
> +        .num =3D asid_num,
> +    };
> +    int r;
> +
> +    r =3D ioctl(v->device_fd, VHOST_VDPA_SET_GROUP_ASID, &asid);
> +    if (unlikely(r < 0)) {
> +        error_report("Can't set vq group %u asid %u, errno=3D%d (%s)",
> +                     asid.index, asid.num, errno, g_strerror(errno));
> +    }
> +    return r;
> +}
> +
>  static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
>  {
>      VhostIOVATree *tree =3D v->iova_tree;
> @@ -317,11 +353,75 @@ dma_map_err:
>  static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>  {
>      VhostVDPAState *s;
> -    int r;
> +    struct vhost_vdpa *v;
> +    uint64_t backend_features;
> +    int64_t cvq_group;
> +    int cvq_index, r;
>
>      assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
>
>      s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> +    v =3D &s->vhost_vdpa;
> +
> +    v->shadow_data =3D s->always_svq;
> +    v->shadow_vqs_enabled =3D s->always_svq;
> +    s->vhost_vdpa.address_space_id =3D VHOST_VDPA_GUEST_PA_ASID;
> +
> +    if (s->always_svq) {
> +        /* SVQ is already configured for all virtqueues */
> +        goto out;
> +    }
> +
> +    /*
> +     * If we early return in these cases SVQ will not be enabled. The mi=
gration
> +     * will be blocked as long as vhost-vdpa backends will not offer _F_=
LOG.
> +     *
> +     * Calling VHOST_GET_BACKEND_FEATURES as they are not available in v=
->dev
> +     * yet.
> +     */
> +    r =3D ioctl(v->device_fd, VHOST_GET_BACKEND_FEATURES, &backend_featu=
res);
> +    if (unlikely(r < 0)) {
> +        error_report("Cannot get vdpa backend_features: %s(%d)",
> +            g_strerror(errno), errno);
> +        return -1;
> +    }
> +    if (!(backend_features & VHOST_BACKEND_F_IOTLB_ASID) ||
> +        !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
> +        return 0;
> +    }
> +
> +    /*
> +     * Check if all the virtqueues of the virtio device are in a differe=
nt vq
> +     * than the last vq. VQ group of last group passed in cvq_group.
> +     */
> +    cvq_index =3D v->dev->vq_index_end - 1;
> +    cvq_group =3D vhost_vdpa_get_vring_group(v->device_fd, cvq_index);
> +    if (unlikely(cvq_group < 0)) {
> +        return cvq_group;
> +    }
> +    for (int i =3D 0; i < cvq_index; ++i) {
> +        int64_t group =3D vhost_vdpa_get_vring_group(v->device_fd, i);
> +
> +        if (unlikely(group < 0)) {
> +            return group;
> +        }
> +
> +        if (group =3D=3D cvq_group) {
> +            return 0;
> +        }
> +    }
> +
> +    r =3D vhost_vdpa_set_address_space_id(v, cvq_group, VHOST_VDPA_NET_C=
VQ_ASID);
> +    if (unlikely(r < 0)) {
> +        return r;
> +    }
> +
> +    v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> +                                       v->iova_range.last);
> +    v->shadow_vqs_enabled =3D true;
> +    s->vhost_vdpa.address_space_id =3D VHOST_VDPA_NET_CVQ_ASID;
> +
> +out:
>      if (!s->vhost_vdpa.shadow_vqs_enabled) {
>          return 0;
>      }
> @@ -350,6 +450,14 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *=
nc)
>      if (s->vhost_vdpa.shadow_vqs_enabled) {
>          vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
>          vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
> +        if (!s->always_svq) {
> +            /*
> +             * If only the CVQ is shadowed we can delete this safely.
> +             * If all the VQs are shadows this will be needed by the tim=
e the
> +             * device is started again to register SVQ vrings and simila=
r.
> +             */
> +            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_de=
lete);
> +        }
>      }
>  }
>
> --
> 2.31.1
>


