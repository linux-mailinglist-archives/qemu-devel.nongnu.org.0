Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078EA6CFB71
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 08:21:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phleT-0002qi-0G; Thu, 30 Mar 2023 02:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1phleD-0002qJ-Hu
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 02:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1phleB-0001kQ-9Z
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 02:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680157230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=khSZRuJiZSF6VErZgtPMHbdzwb1mf/+1MJsPyu4Bnvw=;
 b=d8H5tFbiNeOm8SymRU8QSDeMDm7RK/fODjnWSqaJrnAhUVrnMjjvukXHuWMQfo9HCYohF7
 8BY1LfiIJiiWTRRussVNvePZ86pVixe/+XY253sMCFOx2r6eR4/XClNdtyZ9OAkW9YCZP1
 0jDiITA1f42o1nZ7JE/JyvKaWdxconk=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-T5T_zhwhPXO_j96YdQKy7g-1; Thu, 30 Mar 2023 02:20:28 -0400
X-MC-Unique: T5T_zhwhPXO_j96YdQKy7g-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-177bf70751bso9426470fac.16
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 23:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680157227; x=1682749227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=khSZRuJiZSF6VErZgtPMHbdzwb1mf/+1MJsPyu4Bnvw=;
 b=eU4yvgDdcfItwlTw6DA//qsfwq0+b3nZHFhrJzCVYccMqMYnHKbpx4FFZIaWgfpB+m
 4UwYOn/QO9CnVignCNrYkrKATrY0VBIdez/eMPrIJ7gbT8DAuRKKHAuzGoPc72yphXuI
 CAHN9yOPgZIxUPKzQqsR9B/wTo03l0OBVR1LpaG3bF4IGSFpKbullMJ76H/Ner6xSvaY
 L+Rf2jwPNSDfTIVljHhhdHEqTEXkE3CNHCM1zcNMdraoLYW4rZ0bR4R/k2UFV8b4iCdA
 mI17kt1QB1Pu0DW68kcDHRLlIHzvN9OuOJmyHq8+H10vOaSoXxQtNpZjsBdwpBeZG0Kj
 2JUw==
X-Gm-Message-State: AAQBX9dTLHIz2wZh6Frjjm/WUmW27J9mBhAC2V71N35nAcO217RVz/re
 F56uuysIokgg0J9bZS1uqsYHzrLWwNY72W5VSRUJ5+Yn/0+aVOQWigrEffA5QgjwAzOOSF1kHcw
 m1veecHYspixJbE8M/pVLydaHynWWj5c=
X-Received: by 2002:a05:6870:96a2:b0:17e:d94f:90d9 with SMTP id
 o34-20020a05687096a200b0017ed94f90d9mr1899773oaq.3.1680157227343; 
 Wed, 29 Mar 2023 23:20:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZMj5mqMM2CzlP3JFDbbV+V/B5WYdVXSEXh3gYODckc/03BU0MJFMJFwhij7sDW70PcV67zT0+9lVtUXFo60QQ=
X-Received: by 2002:a05:6870:96a2:b0:17e:d94f:90d9 with SMTP id
 o34-20020a05687096a200b0017ed94f90d9mr1899746oaq.3.1680157226955; Wed, 29 Mar
 2023 23:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-6-eperezma@redhat.com>
In-Reply-To: <20230323195404.1247326-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 30 Mar 2023 14:20:16 +0800
Message-ID: <CACGkMEu=8tx-5kDh5HRt2bHtL9W=cPODgUeOXXAyRxoOusW5jw@mail.gmail.com>
Subject: Re: [PATCH for 8.1 v2 5/6] vdpa: move CVQ isolation check to
 net_init_vhost_vdpa
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Gautam Dawar <gdawar@xilinx.com>, alvaro.karsz@solid-run.com, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>,
 si-wei.liu@oracle.com, 
 Eli Cohen <eli@mellanox.com>, Shannon Nelson <snelson@pensando.io>, 
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, Harpreet Singh Anand <hanand@xilinx.com>
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

On Fri, Mar 24, 2023 at 3:54=E2=80=AFAM Eugenio P=C3=A9rez <eperezma@redhat=
.com> wrote:
>
> Evaluating it at start time instead of initialization time may make the
> guest capable of dynamically adding or removing migration blockers.
>
> Also, moving to initialization reduces the number of ioctls in the
> migration, reducing failure possibilities.
>
> As a drawback we need to check for CVQ isolation twice: one time with no
> MQ negotiated and another one acking it, as long as the device supports
> it.  This is because Vring ASID / group management is based on vq
> indexes, but we don't know the index of CVQ before negotiating MQ.

We need to fail if we see a device that can isolate cvq without MQ but
not with MQ.

>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
> v2: Take out the reset of the device from vhost_vdpa_cvq_is_isolated
> ---
>  net/vhost-vdpa.c | 194 ++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 151 insertions(+), 43 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 4397c0d4b3..db2c9afcb3 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -43,6 +43,13 @@ typedef struct VhostVDPAState {
>
>      /* The device always have SVQ enabled */
>      bool always_svq;
> +
> +    /* The device can isolate CVQ in its own ASID if MQ is negotiated */
> +    bool cvq_isolated_mq;
> +
> +    /* The device can isolate CVQ in its own ASID if MQ is not negotiate=
d */
> +    bool cvq_isolated;

As stated above, if we need a device that cvq_isolated_mq^cvq_isolated
=3D=3D true, we need to fail. This may reduce the complexity of the code?

Thanks

> +
>      bool started;
>  } VhostVDPAState;
>
> @@ -361,15 +368,8 @@ static NetClientInfo net_vhost_vdpa_info =3D {
>          .check_peer_type =3D vhost_vdpa_check_peer_type,
>  };
>
> -/**
> - * Get vring virtqueue group
> - *
> - * @device_fd  vdpa device fd
> - * @vq_index   Virtqueue index
> - *
> - * Return -errno in case of error, or vq group if success.
> - */
> -static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_ind=
ex)
> +static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_ind=
ex,
> +                                          Error **errp)
>  {
>      struct vhost_vring_state state =3D {
>          .index =3D vq_index,
> @@ -378,8 +378,7 @@ static int64_t vhost_vdpa_get_vring_group(int device_=
fd, unsigned vq_index)
>
>      if (unlikely(r < 0)) {
>          r =3D -errno;
> -        error_report("Cannot get VQ %u group: %s", vq_index,
> -                     g_strerror(errno));
> +        error_setg_errno(errp, errno, "Cannot get VQ %u group", vq_index=
);
>          return r;
>      }
>
> @@ -479,9 +478,9 @@ static int vhost_vdpa_net_cvq_start(NetClientState *n=
c)
>  {
>      VhostVDPAState *s, *s0;
>      struct vhost_vdpa *v;
> -    uint64_t backend_features;
>      int64_t cvq_group;
> -    int cvq_index, r;
> +    int r;
> +    Error *err =3D NULL;
>
>      assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
>
> @@ -501,42 +500,29 @@ static int vhost_vdpa_net_cvq_start(NetClientState =
*nc)
>      /*
>       * If we early return in these cases SVQ will not be enabled. The mi=
gration
>       * will be blocked as long as vhost-vdpa backends will not offer _F_=
LOG.
> -     *
> -     * Calling VHOST_GET_BACKEND_FEATURES as they are not available in v=
->dev
> -     * yet.
>       */
> -    r =3D ioctl(v->device_fd, VHOST_GET_BACKEND_FEATURES, &backend_featu=
res);
> -    if (unlikely(r < 0)) {
> -        error_report("Cannot get vdpa backend_features: %s(%d)",
> -            g_strerror(errno), errno);
> -        return -1;
> -    }
> -    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) ||
> -        !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
> +    if (!vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
>          return 0;
>      }
>
> -    /*
> -     * Check if all the virtqueues of the virtio device are in a differe=
nt vq
> -     * than the last vq. VQ group of last group passed in cvq_group.
> -     */
> -    cvq_index =3D v->dev->vq_index_end - 1;
> -    cvq_group =3D vhost_vdpa_get_vring_group(v->device_fd, cvq_index);
> -    if (unlikely(cvq_group < 0)) {
> -        return cvq_group;
> -    }
> -    for (int i =3D 0; i < cvq_index; ++i) {
> -        int64_t group =3D vhost_vdpa_get_vring_group(v->device_fd, i);
> -
> -        if (unlikely(group < 0)) {
> -            return group;
> +    if (v->dev->features & BIT_ULL(VIRTIO_NET_F_MQ)) {
> +        if (!s->cvq_isolated_mq) {
> +            return 0;
>          }
> -
> -        if (group =3D=3D cvq_group) {
> +    } else {
> +        if (!s->cvq_isolated) {
>              return 0;
>          }
>      }
>
> +    cvq_group =3D vhost_vdpa_get_vring_group(v->device_fd,
> +                                           v->dev->vq_index_end - 1,
> +                                           &err);
> +    if (unlikely(cvq_group < 0)) {
> +        error_report_err(err);
> +        return cvq_group;
> +    }
> +
>      r =3D vhost_vdpa_set_address_space_id(v, cvq_group, VHOST_VDPA_NET_C=
VQ_ASID);
>      if (unlikely(r < 0)) {
>          return r;
> @@ -798,6 +784,116 @@ static const VhostShadowVirtqueueOps vhost_vdpa_net=
_svq_ops =3D {
>      .avail_handler =3D vhost_vdpa_net_handle_ctrl_avail,
>  };
>
> +/**
> + * Probe the device to check control virtqueue is isolated.
> + *
> + * @device_fd vhost-vdpa file descriptor
> + * @features features to negotiate
> + * @cvq_index Control vq index
> + *
> + * Returns -1 in case of error, 0 if false and 1 if true
> + */
> +static int vhost_vdpa_cvq_is_isolated(int device_fd, uint64_t features,
> +                                      unsigned cvq_index, Error **errp)
> +{
> +    int64_t cvq_group;
> +    int r;
> +
> +    r =3D vhost_vdpa_set_dev_features_fd(device_fd, features);
> +    if (unlikely(r < 0)) {
> +        error_setg_errno(errp, -r, "Cannot set device features");
> +        return r;
> +    }
> +
> +    cvq_group =3D vhost_vdpa_get_vring_group(device_fd, cvq_index, errp)=
;
> +    if (unlikely(cvq_group < 0)) {
> +        return cvq_group;
> +    }
> +
> +    for (int i =3D 0; i < cvq_index; ++i) {
> +        int64_t group =3D vhost_vdpa_get_vring_group(device_fd, i, errp)=
;
> +
> +        if (unlikely(group < 0)) {
> +            return group;
> +        }
> +
> +        if (group =3D=3D (int64_t)cvq_group) {
> +            return 0;
> +        }
> +    }
> +
> +    return 1;
> +}
> +
> +/**
> + * Probe if CVQ is isolated when the device is MQ and when it is not MQ
> + *
> + * @device_fd         The vdpa device fd
> + * @features          Features offered by the device.
> + * @cvq_index         The control vq index if mq is negotiated. Ignored
> + *                    otherwise.
> + * @cvq_isolated      It'll be set to true if cvq is isolated if mq is n=
ot
> + *                    negotiated.
> + * @cvq_isolated_mq   It'll be set to true if cvq is isolated if mq is
> + *                    negotiated.
> + *
> + * Returns -1 in case of failure
> + */
> +static int vhost_vdpa_probe_cvq_isolation(int device_fd, uint64_t featur=
es,
> +                                          int cvq_index, bool *cvq_isola=
ted,
> +                                          bool *cvq_isolated_mq, Error *=
*errp)
> +{
> +    uint64_t backend_features;
> +    int r;
> +
> +    ERRP_GUARD();
> +
> +    *cvq_isolated =3D false;
> +    *cvq_isolated_mq =3D false;
> +    r =3D ioctl(device_fd, VHOST_GET_BACKEND_FEATURES, &backend_features=
);
> +    if (unlikely(r < 0)) {
> +        error_setg_errno(errp, errno, "Cannot get vdpa backend_features"=
);
> +        return r;
> +    }
> +
> +    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID))) {
> +        return 0;
> +    }
> +
> +    r =3D vhost_vdpa_cvq_is_isolated(device_fd,
> +                                   features & ~BIT_ULL(VIRTIO_NET_F_MQ),=
 2,
> +                                   errp);
> +    if (unlikely(r < 0)) {
> +        if (r =3D=3D -ENOTSUP) {
> +            /*
> +             * The kernel report VHOST_BACKEND_F_IOTLB_ASID if the vdpa
> +             * frontend support ASID but the parent driver does not.  Th=
e CVQ
> +             * cannot be isolated in this case.
> +             */
> +            error_free(*errp);
> +            *errp =3D NULL;
> +            return 0;
> +        }
> +
> +        return r;
> +    }
> +
> +    *cvq_isolated =3D r =3D=3D 1;
> +    vhost_vdpa_reset_status_fd(device_fd);
> +    if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
> +        return 0;
> +    }
> +
> +    r =3D vhost_vdpa_cvq_is_isolated(device_fd, features, cvq_index * 2,=
 errp);
> +    if (unlikely(r < 0)) {
> +        return r;
> +    }
> +
> +    *cvq_isolated_mq =3D r =3D=3D 1;
> +    vhost_vdpa_reset_status_fd(device_fd);
> +    return 0;
> +}
> +
>  static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>                                         const char *device,
>                                         const char *name,
> @@ -807,16 +903,26 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
>                                         bool is_datapath,
>                                         bool svq,
>                                         struct vhost_vdpa_iova_range iova=
_range,
> -                                       uint64_t features)
> +                                       uint64_t features,
> +                                       Error **errp)
>  {
>      NetClientState *nc =3D NULL;
>      VhostVDPAState *s;
>      int ret =3D 0;
>      assert(name);
> +    bool cvq_isolated, cvq_isolated_mq;
> +
>      if (is_datapath) {
>          nc =3D qemu_new_net_client(&net_vhost_vdpa_info, peer, device,
>                                   name);
>      } else {
> +        ret =3D vhost_vdpa_probe_cvq_isolation(vdpa_device_fd, features,
> +                                             queue_pair_index, &cvq_isol=
ated,
> +                                             &cvq_isolated_mq, errp);
> +        if (unlikely(ret)) {
> +            return NULL;
> +        }
> +
>          nc =3D qemu_new_net_control_client(&net_vhost_vdpa_cvq_info, pee=
r,
>                                           device, name);
>      }
> @@ -843,6 +949,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientS=
tate *peer,
>
>          s->vhost_vdpa.shadow_vq_ops =3D &vhost_vdpa_net_svq_ops;
>          s->vhost_vdpa.shadow_vq_ops_opaque =3D s;
> +        s->cvq_isolated =3D cvq_isolated;
> +        s->cvq_isolated_mq =3D cvq_isolated_mq;
>
>          /*
>           * TODO: We cannot migrate devices with CVQ as there is no way t=
o set
> @@ -971,7 +1079,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const =
char *name,
>      for (i =3D 0; i < queue_pairs; i++) {
>          ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>                                       vdpa_device_fd, i, 2, true, opts->x=
_svq,
> -                                     iova_range, features);
> +                                     iova_range, features, errp);
>          if (!ncs[i])
>              goto err;
>      }
> @@ -979,7 +1087,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const =
char *name,
>      if (has_cvq) {
>          nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>                                   vdpa_device_fd, i, 1, false,
> -                                 opts->x_svq, iova_range, features);
> +                                 opts->x_svq, iova_range, features, errp=
);
>          if (!nc)
>              goto err;
>      }
> --
> 2.31.1
>


