Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBA650096D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 11:13:09 +0200 (CEST)
Received: from localhost ([::1]:49376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nevXI-0005ft-VO
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 05:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nevUZ-0003YA-45
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 05:10:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nevUV-00060U-LG
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 05:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649927415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Kk8c77B2i5QQdpxIAiTYa//hl4jH6ZoU7vJ+kMDyqg=;
 b=NAALZpC1u+S/GHdYQ65TVboGyPONhVudMhZzYQ0AT7IT7u/fxhypd8i5bHcbx1e5ff+lSo
 yRLb3uuFSczs7UwmyFkU2gkCXefetPn9JMellzWfrkSzUhhNuh/UoQKUs/FAoGQPlt2fQp
 ae5PmnYVtK0w5B3nw84DmIp2lYKO444=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-Okx4bADTM9aO3gZREhI-eA-1; Thu, 14 Apr 2022 05:10:12 -0400
X-MC-Unique: Okx4bADTM9aO3gZREhI-eA-1
Received: by mail-lj1-f199.google.com with SMTP id
 e12-20020a2ea54c000000b0024b016c795eso943904ljn.1
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 02:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5Kk8c77B2i5QQdpxIAiTYa//hl4jH6ZoU7vJ+kMDyqg=;
 b=AAQp2m6e4AfnrvhH9k9ydomcnhHV/N2oWbjMI6IBEMfOofbr6/P5i+7Kt03kS9KzMF
 03NrSoLeMPIzvp9QEdN97ejF9Kjf3NdV3UMnD+7UvNuZ0gZ6va2o7QDQV5/UXNSnY+4T
 yklX/N3O9vUik2qgodA1sfQU1E5bj6k47kuK9cpJDvcPnlrxlsWpLNgCcVT9AOlaX5ql
 Q/C4tekYciazr95HTDlPk9laVIYbkVHIRhM8Xpeq6n5nCAG0hpw+ng0XDofbnTPPxubm
 Nbx9NwkkyDD/QFnlj8iljHXe1NEnQSYNaPWdiHz4NMH2IHL4vixC5g3afKNZD0KPru6P
 +//w==
X-Gm-Message-State: AOAM532wkVA5bRpfm105yXxhGW4tpZu7KR4fb7W7R9sL1JIZbZxX9oAS
 SXFEdL984Rbit09ynKsq2xJTq+LeEBqopt3sBwgMAHECpSnaFkVN4Yt49904ln4DxCCMl7M+UzM
 qHu+335kyW5NBKTX8rqP2VXcjzlDRUSA=
X-Received: by 2002:a05:6512:1395:b0:446:d382:79a5 with SMTP id
 p21-20020a056512139500b00446d38279a5mr1313625lfa.210.1649927410427; 
 Thu, 14 Apr 2022 02:10:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeOLlzg9RqhkmvxiOd/OLl55bvt2uyBVQ4U3nG6iN2xhJyY1pUCDUEN6fkeVk1xRZhBrR9gK1K/7YSNP+6Vgo=
X-Received: by 2002:a05:6512:1395:b0:446:d382:79a5 with SMTP id
 p21-20020a056512139500b00446d38279a5mr1313599lfa.210.1649927409942; Thu, 14
 Apr 2022 02:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-20-eperezma@redhat.com>
In-Reply-To: <20220413163206.1958254-20-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 14 Apr 2022 17:09:58 +0800
Message-ID: <CACGkMEsRSXTmuyoH4sgKLm+Tj4=veQdz-PAzC+xRAPbMwWCUeA@mail.gmail.com>
Subject: Re: [RFC PATCH v7 19/25] vhost: Add vhost_svq_inject
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> This allows qemu to inject packets to the device without guest's notice.

Does it mean it can support guests without _F_ANNOUNCE?

>
> This will be use to inject net CVQ messages to restore status in the dest=
ination

I guess for restoring, we should set cvq.ready =3D true but all other
(TX/RX) as false before we complete the restoring? If yes, I don't see
codes to do that.

>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-shadow-virtqueue.h |   5 +
>  hw/virtio/vhost-shadow-virtqueue.c | 179 +++++++++++++++++++++++++----
>  2 files changed, 160 insertions(+), 24 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-=
virtqueue.h
> index e06ac52158..2a5229e77f 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -17,6 +17,9 @@
>
>  typedef struct SVQElement {
>      VirtQueueElement elem;
> +    hwaddr in_iova;
> +    hwaddr out_iova;
> +    bool not_from_guest;

Let's add a comment for those fields.

>  } SVQElement;
>
>  typedef void (*VirtQueueElementCallback)(VirtIODevice *vdev,
> @@ -106,6 +109,8 @@ typedef struct VhostShadowVirtqueue {
>
>  bool vhost_svq_valid_features(uint64_t features, Error **errp);
>
> +bool vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov=
,
> +                      size_t out_num, size_t in_num);
>  void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_f=
d);
>  void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
>  void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index 87980e2a9c..f3600df133 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -16,6 +16,7 @@
>  #include "qemu/log.h"
>  #include "qemu/memalign.h"
>  #include "linux-headers/linux/vhost.h"
> +#include "qemu/iov.h"
>
>  /**
>   * Validate the transport device features that both guests can use with =
the SVQ
> @@ -122,7 +123,8 @@ static bool vhost_svq_translate_addr(const VhostShado=
wVirtqueue *svq,
>      return true;
>  }
>
> -static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwadd=
r *sg,
> +static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq,
> +                                        SVQElement *svq_elem, hwaddr *sg=
,
>                                          const struct iovec *iovec, size_=
t num,
>                                          bool more_descs, bool write)
>  {
> @@ -130,15 +132,39 @@ static bool vhost_svq_vring_write_descs(VhostShadow=
Virtqueue *svq, hwaddr *sg,
>      unsigned n;
>      uint16_t flags =3D write ? cpu_to_le16(VRING_DESC_F_WRITE) : 0;
>      vring_desc_t *descs =3D svq->vring.desc;
> -    bool ok;
>
>      if (num =3D=3D 0) {
>          return true;
>      }
>
> -    ok =3D vhost_svq_translate_addr(svq, sg, iovec, num);
> -    if (unlikely(!ok)) {
> -        return false;
> +    if (svq_elem->not_from_guest) {
> +        DMAMap map =3D {
> +            .translated_addr =3D (hwaddr)iovec->iov_base,
> +            .size =3D ROUND_UP(iovec->iov_len, 4096) - 1,
> +            .perm =3D write ? IOMMU_RW : IOMMU_RO,
> +        };
> +        int r;
> +
> +        if (unlikely(num !=3D 1)) {
> +            error_report("Unexpected chain of element injected");
> +            return false;
> +        }
> +        r =3D vhost_iova_tree_map_alloc(svq->iova_tree, &map);
> +        if (unlikely(r !=3D IOVA_OK)) {
> +            error_report("Cannot map injected element");
> +            return false;
> +        }
> +
> +        r =3D svq->map_ops->map(map.iova, map.size + 1,
> +                              (void *)map.translated_addr, !write,
> +                              svq->map_ops_opaque);
> +        assert(r =3D=3D 0);
> +        sg[0] =3D map.iova;
> +    } else {
> +        bool ok =3D vhost_svq_translate_addr(svq, sg, iovec, num);
> +        if (unlikely(!ok)) {
> +            return false;
> +        }
>      }
>
>      for (n =3D 0; n < num; n++) {
> @@ -166,7 +192,8 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue =
*svq, SVQElement *svq_elem,
>      unsigned avail_idx;
>      vring_avail_t *avail =3D svq->vring.avail;
>      bool ok;
> -    g_autofree hwaddr *sgs =3D g_new(hwaddr, MAX(elem->out_num, elem->in=
_num));
> +    g_autofree hwaddr *sgs =3D NULL;
> +    hwaddr *in_sgs, *out_sgs;
>
>      *head =3D svq->free_head;
>
> @@ -177,15 +204,23 @@ static bool vhost_svq_add_split(VhostShadowVirtqueu=
e *svq, SVQElement *svq_elem,
>          return false;
>      }
>
> -    ok =3D vhost_svq_vring_write_descs(svq, sgs, elem->out_sg, elem->out=
_num,
> -                                     elem->in_num > 0, false);
> +    if (!svq_elem->not_from_guest) {
> +        sgs =3D g_new(hwaddr, MAX(elem->out_num, elem->in_num));
> +        in_sgs =3D out_sgs =3D sgs;
> +    } else {
> +        in_sgs =3D &svq_elem->in_iova;
> +        out_sgs =3D &svq_elem->out_iova;
> +    }
> +    ok =3D vhost_svq_vring_write_descs(svq, svq_elem, out_sgs, elem->out=
_sg,
> +                                     elem->out_num, elem->in_num > 0, fa=
lse);
>      if (unlikely(!ok)) {
>          return false;
>      }
>
> -    ok =3D vhost_svq_vring_write_descs(svq, sgs, elem->in_sg, elem->in_n=
um, false,
> -                                     true);
> +    ok =3D vhost_svq_vring_write_descs(svq, svq_elem, in_sgs, elem->in_s=
g,
> +                                     elem->in_num, false, true);
>      if (unlikely(!ok)) {
> +        /* TODO unwind out_sg */
>          return false;
>      }
>
> @@ -230,6 +265,43 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq=
)
>      event_notifier_set(&svq->hdev_kick);
>  }
>
> +bool vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov=
,
> +                      size_t out_num, size_t in_num)
> +{
> +    size_t out_size =3D iov_size(iov, out_num);
> +    size_t out_buf_size =3D ROUND_UP(out_size, 4096);
> +    size_t in_size =3D iov_size(iov + out_num, in_num);
> +    size_t in_buf_size =3D ROUND_UP(in_size, 4096);
> +    SVQElement *svq_elem;
> +    uint16_t num_slots =3D (in_num ? 1 : 0) + (out_num ? 1 : 0);
> +
> +    if (unlikely(num_slots =3D=3D 0 || svq->next_guest_avail_elem ||
> +                 vhost_svq_available_slots(svq) < num_slots)) {
> +        return false;
> +    }
> +
> +    svq_elem =3D virtqueue_alloc_element(sizeof(SVQElement), 1, 1);
> +    if (out_num) {
> +        void *out =3D qemu_memalign(4096, out_buf_size);
> +        svq_elem->elem.out_sg[0].iov_base =3D out;
> +        svq_elem->elem.out_sg[0].iov_len =3D out_size;
> +        iov_to_buf(iov, out_num, 0, out, out_size);
> +        memset(out + out_size, 0, out_buf_size - out_size);
> +    }
> +    if (in_num) {
> +        void *in =3D qemu_memalign(4096, in_buf_size);
> +        svq_elem->elem.in_sg[0].iov_base =3D in;
> +        svq_elem->elem.in_sg[0].iov_len =3D in_size;
> +        memset(in, 0, in_buf_size);
> +    }
> +
> +    svq_elem->not_from_guest =3D true;
> +    vhost_svq_add(svq, svq_elem);
> +    vhost_svq_kick(svq);
> +

Should we wait for the completion before moving forward? Otherwise we
will have a race.

And if we wait for the completion (e.g doing busy polling), I think we
can avoid the auxiliary structures like
in_iova/out_iova/not_from_guest by doing mapping before
vhost_svq_add() to keep it clean.

Thanks

> +    return true;
> +}
> +
>  /**
>   * Forward available buffers.
>   *
> @@ -267,6 +339,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtqu=
eue *svq)
>                  break;
>              }
>
> +            svq_elem->not_from_guest =3D false;
>              elem =3D &svq_elem->elem;
>              if (elem->out_num + elem->in_num > vhost_svq_available_slots=
(svq)) {
>                  /*
> @@ -391,6 +464,31 @@ static SVQElement *vhost_svq_get_buf(VhostShadowVirt=
queue *svq, uint32_t *len)
>      return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
>  }
>
> +static int vhost_svq_unmap(VhostShadowVirtqueue *svq, hwaddr iova, size_=
t size)
> +{
> +    DMAMap needle =3D {
> +        .iova =3D iova,
> +        .size =3D size,
> +    };
> +    const DMAMap *overlap;
> +
> +    while ((overlap =3D vhost_iova_tree_find(svq->iova_tree, &needle))) =
{
> +        DMAMap needle =3D *overlap;
> +
> +        if (svq->map_ops->unmap) {
> +            int r =3D svq->map_ops->unmap(overlap->iova, overlap->size +=
 1,
> +                                        svq->map_ops_opaque);
> +            if (unlikely(r !=3D 0)) {
> +                return r;
> +            }
> +        }
> +        qemu_vfree((void *)overlap->translated_addr);
> +        vhost_iova_tree_remove(svq->iova_tree, &needle);
> +    }
> +
> +    return 0;
> +}
> +
>  static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>                              bool check_for_avail_queue)
>  {
> @@ -410,23 +508,56 @@ static void vhost_svq_flush(VhostShadowVirtqueue *s=
vq,
>              }
>
>              elem =3D &svq_elem->elem;
> -            if (unlikely(i >=3D svq->vring.num)) {
> -                qemu_log_mask(LOG_GUEST_ERROR,
> -                         "More than %u used buffers obtained in a %u siz=
e SVQ",
> -                         i, svq->vring.num);
> -                virtqueue_fill(vq, elem, len, i);
> -                virtqueue_flush(vq, i);
> -                return;
> -            }
> -            virtqueue_fill(vq, elem, len, i++);
> -
>              if (svq->ops && svq->ops->used_elem_handler) {
>                  svq->ops->used_elem_handler(svq->vdev, elem);
>              }
> +
> +            if (svq_elem->not_from_guest) {
> +                if (unlikely(!elem->out_num && elem->out_num !=3D 1)) {
> +                    error_report("Unexpected out_num > 1");
> +                    return;
> +                }
> +
> +                if (elem->out_num) {
> +                    int r =3D vhost_svq_unmap(svq, svq_elem->out_iova,
> +                                            elem->out_sg[0].iov_len);
> +                    if (unlikely(r !=3D 0)) {
> +                        error_report("Cannot unmap out buffer");
> +                        return;
> +                    }
> +                }
> +
> +                if (unlikely(!elem->in_num && elem->in_num !=3D 1)) {
> +                    error_report("Unexpected in_num > 1");
> +                    return;
> +                }
> +
> +                if (elem->in_num) {
> +                    int r =3D vhost_svq_unmap(svq, svq_elem->in_iova,
> +                                            elem->in_sg[0].iov_len);
> +                    if (unlikely(r !=3D 0)) {
> +                        error_report("Cannot unmap out buffer");
> +                        return;
> +                    }
> +                }
> +            } else {
> +                if (unlikely(i >=3D svq->vring.num)) {
> +                    qemu_log_mask(
> +                        LOG_GUEST_ERROR,
> +                        "More than %u used buffers obtained in a %u size=
 SVQ",
> +                        i, svq->vring.num);
> +                    virtqueue_fill(vq, elem, len, i);
> +                    virtqueue_flush(vq, i);
> +                    return;
> +                }
> +                virtqueue_fill(vq, elem, len, i++);
> +            }
>          }
>
> -        virtqueue_flush(vq, i);
> -        event_notifier_set(&svq->svq_call);
> +        if (i > 0) {
> +            virtqueue_flush(vq, i);
> +            event_notifier_set(&svq->svq_call);
> +        }
>
>          if (check_for_avail_queue && svq->next_guest_avail_elem) {
>              /*
> @@ -590,13 +721,13 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>      for (unsigned i =3D 0; i < svq->vring.num; ++i) {
>          g_autofree SVQElement *svq_elem =3D NULL;
>          svq_elem =3D g_steal_pointer(&svq->ring_id_maps[i]);
> -        if (svq_elem) {
> +        if (svq_elem && !svq_elem->not_from_guest) {
>              virtqueue_detach_element(svq->vq, &svq_elem->elem, 0);
>          }
>      }
>
>      next_avail_elem =3D g_steal_pointer(&svq->next_guest_avail_elem);
> -    if (next_avail_elem) {
> +    if (next_avail_elem && !next_avail_elem->not_from_guest) {
>          virtqueue_detach_element(svq->vq, &next_avail_elem->elem, 0);
>      }
>      svq->vq =3D NULL;
> --
> 2.27.0
>


