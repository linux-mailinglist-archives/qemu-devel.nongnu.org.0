Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCF86133D8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 11:42:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opSEX-0007DT-Tg; Mon, 31 Oct 2022 06:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1opSEW-0007DJ-BQ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:41:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1opSES-00050j-RR
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667212887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jg34LqUFq9kapneHl8gAo0S9bhs12rrReRlScpgS/yc=;
 b=Msx8pcUNTNcFANmV6SJJDU2Jddpq2C2l6pzSFnCpCnp6KDvnlcHay4NEsAtPCSpqwDOs92
 CJUE/2QFxJP2S1/tfIvqyKzbDZlrzHTPZjcOVitLd/8cqmKfnEeBLzSqq+4/3AZjIW+goM
 tt9lA3m8GGEsNcJvIvOVtJ4aiqjYgho=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-K3o4JpqHOnGfvkO8wwyhlQ-1; Mon, 31 Oct 2022 06:41:26 -0400
X-MC-Unique: K3o4JpqHOnGfvkO8wwyhlQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 nl16-20020a17090b385000b002138288fd51so6821953pjb.6
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 03:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jg34LqUFq9kapneHl8gAo0S9bhs12rrReRlScpgS/yc=;
 b=Q9fneOciAt61LRTTPHbiwJYsxyF6OKxHk3QrOfqp31EkKuapMGUks1mVhnqRFU6Ccs
 BysyQJQ61K1x/TE2LaCc8W3WJsEVTRFdIE5rz7NynXhffqxaRmmmwIljncYkVX1O9rrz
 Fh9qVJ5WzMlQ1521RAEQgIl311k6CIlbp/T2eTWk8saqDMFBmPbzjU+xTq50F6R5/1+U
 hevSaqF1CPYVyd+OOet0NAAzaz5m0nm9epVbVQN2foqI7NW/xUuCm76mEsLW6MCj8dXV
 WSQtSQ1usEYzPw4U5VU6HWgGQwUwuZqoIIosEZ4e3v9ahTMc8NpnUpKZCHU8AD3lk9UE
 R/Vg==
X-Gm-Message-State: ACrzQf03EIx4Yj69rxhPC0abipNXcIZpbXAZm9/snX8wVrH9hsP1l0iq
 STkNjCWRx1w3KByiDc8No4R9ROR42/HvfQLDNO6XmsFJXuBGbzFxNq8Wj0yiv8qTMxBLT3CawD5
 xn8JfMGVCQiD825WLO4YTxoA+cnjIpFs=
X-Received: by 2002:a05:6a00:170b:b0:56d:4b31:c4cf with SMTP id
 h11-20020a056a00170b00b0056d4b31c4cfmr7367859pfc.68.1667212884995; 
 Mon, 31 Oct 2022 03:41:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5gXKVkhk9oEKr0v8jRDpRWowu8I9+BcHP9jg2RaNQ//MdQeP6EIwqtOTZ9+Nypmb1XNOQJT+mS3kYaqMaLQ4A=
X-Received: by 2002:a05:6a00:170b:b0:56d:4b31:c4cf with SMTP id
 h11-20020a056a00170b00b0056d4b31c4cfmr7367822pfc.68.1667212884618; Mon, 31
 Oct 2022 03:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221011104154.1209338-1-eperezma@redhat.com>
 <20221011104154.1209338-7-eperezma@redhat.com>
 <20221031042356-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221031042356-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Oct 2022 11:40:48 +0100
Message-ID: <CAJaqyWdmvASZfj5rZLZjUxEnZB2AJWQFKEj30g_w2_0z9vqjow@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] vdpa: Always start CVQ in SVQ mode
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Gautam Dawar <gdawar@xilinx.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Jason Wang <jasowang@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org, 
 Harpreet Singh Anand <hanand@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 9:25 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Oct 11, 2022 at 12:41:54PM +0200, Eugenio P=C3=A9rez wrote:
> > Isolate control virtqueue in its own group, allowing to intercept contr=
ol
> > commands but letting dataplane run totally passthrough to the guest.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> I guess we need svq for this. Not a reason to allocate it for
> all queues.

I'll document this part better.

> Also if vdpa does not support pasid then I guess
> we should not bother with svq.
>

Yes, if the device does not support ASID or it does not support all
conditions (like to be able to isolate precisely CVQ in its own AS),
svq is not enabled.

This is not documented properly in the patch description.


> > ---
> > v5:
> > * Fixing the not adding cvq buffers when x-svq=3Don is specified.
> > * Move vring state in vhost_vdpa_get_vring_group instead of using a
> >   parameter.
> > * Rename VHOST_VDPA_NET_CVQ_PASSTHROUGH to VHOST_VDPA_NET_DATA_ASID
> >
> > v4:
> > * Squash vhost_vdpa_cvq_group_is_independent.
> > * Rebased on last CVQ start series, that allocated CVQ cmd bufs at load
> > * Do not check for cvq index on vhost_vdpa_net_prepare, we only have on=
e
> >   that callback registered in that NetClientInfo.
> >
> > v3:
> > * Make asid related queries print a warning instead of returning an
> >   error and stop the start of qemu.
> > ---
> >  hw/virtio/vhost-vdpa.c |   3 +-
> >  net/vhost-vdpa.c       | 118 +++++++++++++++++++++++++++++++++++++++--
> >  2 files changed, 115 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 29d009c02b..fd4de06eab 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -682,7 +682,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_=
dev *dev)
> >  {
> >      uint64_t features;
> >      uint64_t f =3D 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
> > -        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
> > +        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
> > +        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
> >      int r;
> >
> >      if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index f7831aeb8d..6f6ef59ea3 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -38,6 +38,9 @@ typedef struct VhostVDPAState {
> >      void *cvq_cmd_out_buffer;
> >      virtio_net_ctrl_ack *status;
> >
> > +    /* Number of address spaces supported by the device */
> > +    unsigned address_space_num;
> > +
> >      /* The device always have SVQ enabled */
> >      bool always_svq;
> >      bool started;
> > @@ -102,6 +105,9 @@ static const uint64_t vdpa_svq_device_features =3D
> >      BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> >      BIT_ULL(VIRTIO_NET_F_STANDBY);
> >
> > +#define VHOST_VDPA_NET_DATA_ASID 0
> > +#define VHOST_VDPA_NET_CVQ_ASID 1
> > +
> >  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> >  {
> >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > @@ -226,6 +232,34 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> >          .check_peer_type =3D vhost_vdpa_check_peer_type,
> >  };
> >
> > +static uint32_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_=
index)
> > +{
> > +    struct vhost_vring_state state =3D {
> > +        .index =3D vq_index,
> > +    };
> > +    int r =3D ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP, &state);
> > +
> > +    return r < 0 ? 0 : state.num;
> > +}
> > +
> > +static int vhost_vdpa_set_address_space_id(struct vhost_vdpa *v,
> > +                                           unsigned vq_group,
> > +                                           unsigned asid_num)
> > +{
> > +    struct vhost_vring_state asid =3D {
> > +        .index =3D vq_group,
> > +        .num =3D asid_num,
> > +    };
> > +    int ret;
> > +
> > +    ret =3D ioctl(v->device_fd, VHOST_VDPA_SET_GROUP_ASID, &asid);
> > +    if (unlikely(ret < 0)) {
> > +        warn_report("Can't set vq group %u asid %u, errno=3D%d (%s)",
> > +            asid.index, asid.num, errno, g_strerror(errno));
> > +    }
> > +    return ret;
> > +}
> > +
> >  static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
> >  {
> >      VhostIOVATree *tree =3D v->iova_tree;
> > @@ -300,11 +334,50 @@ dma_map_err:
> >  static int vhost_vdpa_net_cvq_start(NetClientState *nc)
> >  {
> >      VhostVDPAState *s;
> > -    int r;
> > +    struct vhost_vdpa *v;
> > +    uint32_t cvq_group;
> > +    int cvq_index, r;
> >
> >      assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >
> >      s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +    v =3D &s->vhost_vdpa;
> > +
> > +    v->listener_shadow_vq =3D s->always_svq;
> > +    v->shadow_vqs_enabled =3D s->always_svq;
> > +    s->vhost_vdpa.address_space_id =3D VHOST_VDPA_NET_DATA_ASID;
> > +
> > +    if (s->always_svq) {
> > +        goto out;
> > +    }
> > +
> > +    if (s->address_space_num < 2) {
> > +        return 0;
> > +    }
> > +
> > +    /**
> > +     * Check if all the virtqueues of the virtio device are in a diffe=
rent vq
> > +     * than the last vq. VQ group of last group passed in cvq_group.
> > +     */
> > +    cvq_index =3D v->dev->vq_index_end - 1;
> > +    cvq_group =3D vhost_vdpa_get_vring_group(v->device_fd, cvq_index);
> > +    for (int i =3D 0; i < cvq_index; ++i) {
> > +        uint32_t group =3D vhost_vdpa_get_vring_group(v->device_fd, i)=
;
> > +
> > +        if (unlikely(group =3D=3D cvq_group)) {
> > +            warn_report("CVQ %u group is the same as VQ %u one (%u)", =
cvq_group,
> > +                        i, group);
> > +            return 0;
> > +        }
> > +    }
> > +
> > +    r =3D vhost_vdpa_set_address_space_id(v, cvq_group, VHOST_VDPA_NET=
_CVQ_ASID);
> > +    if (r =3D=3D 0) {
> > +        v->shadow_vqs_enabled =3D true;
> > +        s->vhost_vdpa.address_space_id =3D VHOST_VDPA_NET_CVQ_ASID;
> > +    }
> > +
> > +out:
> >      if (!s->vhost_vdpa.shadow_vqs_enabled) {
> >          return 0;
> >      }
> > @@ -576,12 +649,38 @@ static const VhostShadowVirtqueueOps vhost_vdpa_n=
et_svq_ops =3D {
> >      .avail_handler =3D vhost_vdpa_net_handle_ctrl_avail,
> >  };
> >
> > +static uint32_t vhost_vdpa_get_as_num(int vdpa_device_fd)
> > +{
> > +    uint64_t features;
> > +    unsigned num_as;
> > +    int r;
> > +
> > +    r =3D ioctl(vdpa_device_fd, VHOST_GET_BACKEND_FEATURES, &features)=
;
> > +    if (unlikely(r < 0)) {
> > +        warn_report("Cannot get backend features");
> > +        return 1;
> > +    }
> > +
> > +    if (!(features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID))) {
> > +        return 1;
> > +    }
> > +
> > +    r =3D ioctl(vdpa_device_fd, VHOST_VDPA_GET_AS_NUM, &num_as);
> > +    if (unlikely(r < 0)) {
> > +        warn_report("Cannot retrieve number of supported ASs");
> > +        return 1;
> > +    }
> > +
> > +    return num_as;
> > +}
> > +
> >  static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> >                                             const char *device,
> >                                             const char *name,
> >                                             int vdpa_device_fd,
> >                                             int queue_pair_index,
> >                                             int nvqs,
> > +                                           unsigned nas,
> >                                             bool is_datapath,
> >                                             bool svq,
> >                                             VhostIOVATree *iova_tree)
> > @@ -600,6 +699,7 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >      snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
> >      s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >
> > +    s->address_space_num =3D nas;
> >      s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >      s->vhost_vdpa.index =3D queue_pair_index;
> >      s->always_svq =3D svq;
> > @@ -686,6 +786,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >      g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> >      NetClientState *nc;
> >      int queue_pairs, r, i =3D 0, has_cvq =3D 0;
> > +    unsigned num_as =3D 1;
> > +    bool svq_cvq;
> >
> >      assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >      opts =3D &netdev->u.vhost_vdpa;
> > @@ -711,7 +813,13 @@ int net_init_vhost_vdpa(const Netdev *netdev, cons=
t char *name,
> >          return queue_pairs;
> >      }
> >
> > -    if (opts->x_svq) {
> > +    svq_cvq =3D opts->x_svq;
> > +    if (has_cvq && !opts->x_svq) {
> > +        num_as =3D vhost_vdpa_get_as_num(vdpa_device_fd);
> > +        svq_cvq =3D num_as > 1;
> > +    }
> > +
> > +    if (opts->x_svq || svq_cvq) {
> >          struct vhost_vdpa_iova_range iova_range;
> >
> >          uint64_t invalid_dev_features =3D
> > @@ -734,15 +842,15 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >
> >      for (i =3D 0; i < queue_pairs; i++) {
> >          ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > -                                     vdpa_device_fd, i, 2, true, opts-=
>x_svq,
> > -                                     iova_tree);
> > +                                     vdpa_device_fd, i, 2, num_as, tru=
e,
> > +                                     opts->x_svq, iova_tree);
> >          if (!ncs[i])
> >              goto err;
> >      }
> >
> >      if (has_cvq) {
> >          nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > -                                 vdpa_device_fd, i, 1, false,
> > +                                 vdpa_device_fd, i, 1, num_as, false,
> >                                   opts->x_svq, iova_tree);
> >          if (!nc)
> >              goto err;
> > --
> > 2.31.1
>


