Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B3F63CF64
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 07:55:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Gzi-0001fK-VW; Wed, 30 Nov 2022 01:54:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0Gzg-0001f4-0I
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:54:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0Gze-0000pm-8B
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669791292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ecl8LQsyO2ksqNQX7pvB2RF+2Qk0ZSp6qSb4aI7vF+Y=;
 b=EBpTjqjZR2EF/pJWNv5z4Fcer9gx5zTZs+WOH/C1dy4UFjfYsnvofIdF7OJZyTimQDMsLb
 cy87jRZ3itksCZKHs86IfbZ8MO5Bisq8BKTt1ntP0814gzHi4XUdbW4OXqtZsCjwEHC/qU
 1aVGZz+InngnWSfpIZZdzfNaWg22a0o=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-TZRcHUuiNMS5B92sYV8OiQ-1; Wed, 30 Nov 2022 01:54:50 -0500
X-MC-Unique: TZRcHUuiNMS5B92sYV8OiQ-1
Received: by mail-oi1-f198.google.com with SMTP id
 bk1-20020a0568081a0100b0035a0eaa5ff6so6431130oib.23
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 22:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ecl8LQsyO2ksqNQX7pvB2RF+2Qk0ZSp6qSb4aI7vF+Y=;
 b=ZpJqf0px7YV8+7hcp8mZeovV7XIesC/i9/suMpnHZBw2KjerMUhldAah7UMMywl1wN
 RSMUZYirBVTMlMEDbf5YKbuvUZG0aLsWImYbQPJgN8PnJbeNy7D6ckjwWCTKMnXEzc2y
 5jMqHJ30XAW9PlDd4diFbaPsDgNlTcVs4t44dKTASkevbWHriNx6RZ+NxxcY2UI+qoHR
 QQJYUDYU/PwAORBqsMv+d6Rj7yhf+1jYaGC7LcwdCIvCJC6UN234148Wziky7Pgi1rCh
 Vr8eWepfkhDfLPW8q199oWj/HkKyZp4Uad11OZPTojlPGTDaCZHgRJvZLf9Ex14/1f/o
 Ivpg==
X-Gm-Message-State: ANoB5pldsOprXy2l8ggfbY++OlnuxboinMcJqfYLwz58wphOkfbL9eAK
 CnbGlwQ54Gz7JOMzqxXbQDeCRjRtH2IlYSDEHARkmJAjKEQcp+DSZZxUh7EMFknMdk8fxhfooKX
 pGO0yo+4GCWqsqVHsLkBafPmVd7KUHnk=
X-Received: by 2002:a05:6830:6505:b0:66c:fb5b:4904 with SMTP id
 cm5-20020a056830650500b0066cfb5b4904mr29939218otb.237.1669791289951; 
 Tue, 29 Nov 2022 22:54:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6KZISwRvJcJr/4/dW8OxzzuZ4G8/KFGAEAtjFhTQejpyJWpM3BUY1Mfdi9oJkapx1lUiM13xjofk2q+ki40G8=
X-Received: by 2002:a05:6830:6505:b0:66c:fb5b:4904 with SMTP id
 cm5-20020a056830650500b0066cfb5b4904mr29939199otb.237.1669791289682; Tue, 29
 Nov 2022 22:54:49 -0800 (PST)
MIME-Version: 1.0
References: <20221124155158.2109884-1-eperezma@redhat.com>
 <20221124155158.2109884-13-eperezma@redhat.com>
In-Reply-To: <20221124155158.2109884-13-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Nov 2022 14:54:38 +0800
Message-ID: <CACGkMEua-vwx+Q3JNDcd8tFZA-eYKNgy0BBkXxE3m0zv2DykLg@mail.gmail.com>
Subject: Re: [PATCH for 8.0 v8 12/12] vdpa: always start CVQ in SVQ mode if
 possible
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Cornelia Huck <cohuck@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>
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

On Thu, Nov 24, 2022 at 11:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> Isolate control virtqueue in its own group, allowing to intercept control
> commands but letting dataplane run totally passthrough to the guest.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
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
>  net/vhost-vdpa.c       | 106 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 107 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 8e54c5c0fc..45bb72d359 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -652,7 +652,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_de=
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
> index a1f1e29b7c..bce57fa724 100644
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
> @@ -259,6 +261,40 @@ static VhostIOVATree *vhost_vdpa_svq_allocate_iova_t=
ree(int vdpa_device_fd)
>      return vhost_iova_tree_new(iova_range.first, iova_range.last);
>  }
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
> @@ -333,11 +369,71 @@ dma_map_err:
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
> +    /* Backend features are not available in v->dev yet. */
> +    r =3D ioctl(v->device_fd, VHOST_GET_BACKEND_FEATURES, &backend_featu=
res);
> +    if (unlikely(r < 0)) {
> +        error_report("Cannot get vdpa backend_features: %s(%d)",
> +            g_strerror(errno), errno);
> +        return -1;
> +    }
> +    if (!(backend_features & VHOST_BACKEND_F_IOTLB_ASID) ||
> +        !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {

As discussed in v7, it would be better to add comment to explain how
migration is blocked in this case.

> +        return 0;
> +    }
> +
> +    /**
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
> +        if (unlikely(group =3D=3D cvq_group)) {
> +            warn_report(
> +                "CVQ %"PRId64" group is the same as VQ %d one (%"PRId64"=
)",
> +                cvq_group, i, group);

Any reason we need a warning here? It's pretty common for the parent
that only has a single as.

Others look good.

Thanks

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
> +    v->iova_tree =3D vhost_vdpa_svq_allocate_iova_tree(v->device_fd);
> +    v->shadow_vqs_enabled =3D true;
> +    s->vhost_vdpa.address_space_id =3D VHOST_VDPA_NET_CVQ_ASID;
> +
> +out:
>      if (!s->vhost_vdpa.shadow_vqs_enabled) {
>          return 0;
>      }
> @@ -366,6 +462,14 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *=
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


