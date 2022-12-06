Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E820643BDC
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 04:25:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2OZm-0004B3-S1; Mon, 05 Dec 2022 22:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p2OZk-0004Av-Ui
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 22:24:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p2OZi-0005OG-RB
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 22:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670297093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sw5ffdQWl28exKR9r7tqmeLjxZGSTq0RnfAMpcVzdbo=;
 b=TdxrpTOyYwKjaBf0+D+UpF6AbnS2i0jVD2b/4LXYZ/fkP/LjReRupNIxXi2Gj8Po31XpRI
 dvZEbdijfwqDNDp6UJf0mAvMeVhiDgqZ5INnZ9D/tZ5lHd22vnxtU2qAFZiP2TIORRn7MA
 AfO8K7+8ApEckFW164NVFwYt/4xdIqg=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-x3Hs0vvBPYC2BuhdTID_qg-1; Mon, 05 Dec 2022 22:24:52 -0500
X-MC-Unique: x3Hs0vvBPYC2BuhdTID_qg-1
Received: by mail-oo1-f71.google.com with SMTP id
 a9-20020a4a9b09000000b004a0bc0614fdso2222430ook.11
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 19:24:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sw5ffdQWl28exKR9r7tqmeLjxZGSTq0RnfAMpcVzdbo=;
 b=Um6SayDq6TNXxZzY4HXePMz6qAHLe/O4WobN6Qwd9bb3hR8uAp9vAskFUFFjbcF0xa
 qiPP0fI/iVHpVl5sch89U6azb72k0BN53BwJGuWe7QlbiQl0w1ISfRsNH38oBVAg0CmA
 toajn2QzldE12Hdeo30U4KqxiYi04SGUsCI3IomTGmLLjMTg6wWvjqVVNEwRF212ld0R
 aQQ3DisO7HHdcqn2dutsHDp3e/mdURMA7JQDffJ8LpgPqlyB8yEgO2/5jmX0Ui2h8ovi
 7xon7bfFl48ko9lTxxJ4ojSau7ceedVr6KlwGqYJhVqb1Kjvdnlgs2W2b3x7Vzj5ONBG
 t6Iw==
X-Gm-Message-State: ANoB5pmrLsAxcJospufnAMf0Zz/jbkW6uEIfNSSsdcuPTMcQhrV3PHNs
 rn4W9SNDLP0coJ1anfdkBCyHCPPz89r7ZunOq7HLj432TmRM+fk70GuycZRIADWyYXdZsMYVyXv
 otJzXVgjykLiAuFdZfw2ch2Aw/OqmAzg=
X-Received: by 2002:a05:6870:55a9:b0:144:a97b:1ae2 with SMTP id
 n41-20020a05687055a900b00144a97b1ae2mr3073851oao.35.1670297091695; 
 Mon, 05 Dec 2022 19:24:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5bHknGKKM7k9MRaczYAMEtPwh2WP2g6m6mbk+by9h4wXPB/R0Zp68EhvujmdM977zhVdGU71szvtG2UnxcSnA=
X-Received: by 2002:a05:6870:55a9:b0:144:a97b:1ae2 with SMTP id
 n41-20020a05687055a900b00144a97b1ae2mr3073830oao.35.1670297091371; Mon, 05
 Dec 2022 19:24:51 -0800 (PST)
MIME-Version: 1.0
References: <20221205170436.2977336-1-eperezma@redhat.com>
 <20221205170436.2977336-11-eperezma@redhat.com>
In-Reply-To: <20221205170436.2977336-11-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 6 Dec 2022 11:24:40 +0800
Message-ID: <CACGkMEtcQztTdRbX3xyFvNYSRsu58tRppoyTUh94vXwSGLPH=A@mail.gmail.com>
Subject: Re: [RFC PATCH for 8.0 10/13] virtio-net: Migrate vhost inflight
 descriptors
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Gautam Dawar <gdawar@xilinx.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 Parav Pandit <parav@mellanox.com>
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

On Tue, Dec 6, 2022 at 1:05 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> There is currently no data to be migrated, since nothing populates or
> read the fields on virtio-net.
>
> The migration of in-flight descriptors is modelled after the migration
> of requests in virtio-blk. With some differences:
> * virtio-blk migrates queue number on each request. Here we only add a
>   vq if it has descriptors to migrate, and then we make all descriptors
>   in an array.
> * Use of QTAILQ since it works similar to signal the end of the inflight
>   descriptors: 1 for more data, 0 if end. But do it for each vq instead
>   of for each descriptor.
> * Usage of VMState macros.
>
> The fields of descriptors would be way more complicated if we use the
> VirtQueueElements directly, since there would be a few levels of
> indirections. Using VirtQueueElementOld for the moment, and migrate to
> VirtQueueElement for the final patch.
>
> TODO: Proper migration versioning
> TODO: Do not embed vhost-vdpa structs
> TODO: Migrate the VirtQueueElement, not VirtQueueElementOld.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/hw/virtio/virtio-net.h |   2 +
>  include/migration/vmstate.h    |  11 +++
>  hw/net/virtio-net.c            | 129 +++++++++++++++++++++++++++++++++
>  3 files changed, 142 insertions(+)
>
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-ne=
t.h
> index ef234ffe7e..ae7c017ef0 100644
> --- a/include/hw/virtio/virtio-net.h
> +++ b/include/hw/virtio/virtio-net.h
> @@ -151,9 +151,11 @@ typedef struct VirtIONetQueue {
>      QEMUTimer *tx_timer;
>      QEMUBH *tx_bh;
>      uint32_t tx_waiting;
> +    uint32_t tx_inflight_num, rx_inflight_num;
>      struct {
>          VirtQueueElement *elem;
>      } async_tx;
> +    VirtQueueElement **tx_inflight, **rx_inflight;
>      struct VirtIONet *n;
>  } VirtIONetQueue;
>
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 9726d2d09e..9e0dfef9ee 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -626,6 +626,17 @@ extern const VMStateInfo vmstate_info_qlist;
>      .offset     =3D vmstate_offset_varray(_state, _field, _type),      \
>  }
>
> +#define VMSTATE_STRUCT_VARRAY_ALLOC_UINT16(_field, _state, _field_num,  =
      \
> +                                           _version, _vmsd, _type) {    =
      \
> +    .name       =3D (stringify(_field)),                                =
        \
> +    .version_id =3D (_version),                                         =
        \
> +    .vmsd       =3D &(_vmsd),                                           =
        \
> +    .num_offset =3D vmstate_offset_value(_state, _field_num, uint16_t), =
        \
> +    .size       =3D sizeof(_type),                                      =
        \
> +    .flags      =3D VMS_STRUCT | VMS_VARRAY_UINT16 | VMS_ALLOC | VMS_POI=
NTER,   \
> +    .offset     =3D vmstate_offset_pointer(_state, _field, _type),      =
        \
> +}
> +
>  #define VMSTATE_STRUCT_VARRAY_ALLOC(_field, _state, _field_num, _version=
, _vmsd, _type) {\
>      .name       =3D (stringify(_field)),                               \
>      .version_id =3D (_version),                                        \
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index aba12759d5..ffd7bf1fc7 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3077,6 +3077,13 @@ static bool mac_table_doesnt_fit(void *opaque, int=
 version_id)
>      return !mac_table_fits(opaque, version_id);
>  }
>
> +typedef struct VirtIONetInflightQueue {
> +    uint16_t idx;
> +    uint16_t num;
> +    QTAILQ_ENTRY(VirtIONetInflightQueue) entry;
> +    VirtQueueElementOld *elems;
> +} VirtIONetInflightQueue;
> +
>  /* This temporary type is shared by all the WITH_TMP methods
>   * although only some fields are used by each.
>   */
> @@ -3086,6 +3093,7 @@ struct VirtIONetMigTmp {
>      uint16_t        curr_queue_pairs_1;
>      uint8_t         has_ufo;
>      uint32_t        has_vnet_hdr;
> +    QTAILQ_HEAD(, VirtIONetInflightQueue) queues_inflight;
>  };
>
>  /* The 2nd and subsequent tx_waiting flags are loaded later than
> @@ -3231,6 +3239,124 @@ static const VMStateDescription vmstate_virtio_ne=
t_rss =3D {
>      },
>  };
>
> +static const VMStateDescription vmstate_virtio_net_inflight_queue =3D {
> +    .name      =3D "virtio-net-device/inflight/queue",
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT16(idx, VirtIONetInflightQueue),
> +        VMSTATE_UINT16(num, VirtIONetInflightQueue),
> +
> +        VMSTATE_STRUCT_VARRAY_ALLOC_UINT16(elems, VirtIONetInflightQueue=
, num,
> +                                           0, vmstate_virtqueue_element_=
old,
> +                                           VirtQueueElementOld),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};

A dumb question, any reason we need bother with virtio-net? It looks
to me it's not a must and would complicate migration compatibility.

I guess virtio-blk is the better place.

Thanks

> +
> +static int virtio_net_inflight_init(void *opaque)
> +{
> +    struct VirtIONetMigTmp *tmp =3D opaque;
> +
> +    QTAILQ_INIT(&tmp->queues_inflight);
> +    return 0;
> +}
> +
> +static int virtio_net_inflight_pre_save(void *opaque)
> +{
> +    struct VirtIONetMigTmp *tmp =3D opaque;
> +    VirtIONet *net =3D tmp->parent;
> +    uint16_t curr_queue_pairs =3D net->multiqueue ? net->curr_queue_pair=
s : 1;
> +    VirtIONetInflightQueue *qi =3D g_new0(VirtIONetInflightQueue,
> +                                        curr_queue_pairs * 2);
> +
> +    virtio_net_inflight_init(opaque);
> +    for (uint16_t i =3D 0; i < curr_queue_pairs * 2; ++i) {
> +        VirtIONetQueue *q =3D &net->vqs[vq2q(i)];
> +        size_t n =3D i % 2 ? q->tx_inflight_num : q->rx_inflight_num;
> +        VirtQueueElement **inflight =3D i % 2 ? q->tx_inflight : q->rx_i=
nflight;
> +
> +        if (n =3D=3D 0) {
> +            continue;
> +        }
> +
> +        qi[i].idx =3D i;
> +        qi[i].num =3D n;
> +        qi[i].elems =3D g_new0(VirtQueueElementOld, n);
> +        for (uint16_t j =3D 0; j < n; ++j) {
> +            qemu_put_virtqueue_element_old(inflight[j], &qi[i].elems[j])=
;
> +        }
> +        QTAILQ_INSERT_TAIL(&tmp->queues_inflight, &qi[i], entry);
> +    }
> +
> +    return 0;
> +}
> +
> +static int virtio_net_inflight_post_save(void *opaque)
> +{
> +    struct VirtIONetMigTmp *tmp =3D opaque;
> +    VirtIONetInflightQueue *qi;
> +
> +    while ((qi =3D QTAILQ_FIRST(&tmp->queues_inflight))) {
> +        QTAILQ_REMOVE(&tmp->queues_inflight, qi, entry);
> +        g_free(qi->elems);
> +        g_free(qi);
> +    }
> +
> +    return 0;
> +}
> +
> +static int virtio_net_inflight_post_load(void *opaque, int version_id)
> +{
> +    struct VirtIONetMigTmp *tmp =3D opaque;
> +    VirtIONet *net =3D tmp->parent;
> +    uint16_t curr_queue_pairs =3D net->multiqueue ? net->curr_queue_pair=
s : 1;
> +    VirtIONetInflightQueue *qi;
> +
> +    while ((qi =3D QTAILQ_FIRST(&tmp->queues_inflight))) {
> +        VirtIONetQueue *q =3D &net->vqs[vq2q(qi->idx)];
> +        uint32_t *n =3D qi->idx % 2 ? &q->tx_inflight_num : &q->rx_infli=
ght_num;
> +        VirtQueueElement ***inflight =3D qi->idx % 2 ?
> +                                       &q->tx_inflight : &q->rx_inflight=
;
> +        if (unlikely(qi->num =3D=3D 0)) {
> +            /* TODO: error message */
> +            return -1;
> +        }
> +
> +        if (unlikely(qi->idx > curr_queue_pairs * 2)) {
> +            /* TODO: error message */
> +            return -1;
> +        }
> +
> +        *n =3D qi->num;
> +        *inflight =3D g_new(VirtQueueElement *, *n);
> +        for (uint16_t j =3D 0; j < *n; ++j) {
> +            (*inflight)[j] =3D qemu_get_virtqueue_element_from_old(
> +                &net->parent_obj, &qi->elems[j],
> +                sizeof(VirtQueueElement));
> +        }
> +
> +        QTAILQ_REMOVE(&tmp->queues_inflight, qi, entry);
> +        g_free(qi->elems);
> +        g_free(qi);
> +    }
> +
> +    return 0;
> +}
> +
> +/* TODO: Allocate a temporal per queue / queue element, not all of them!=
 */
> +static const VMStateDescription vmstate_virtio_net_inflight =3D {
> +    .name      =3D "virtio-net-device/inflight",
> +    .pre_save =3D virtio_net_inflight_pre_save,
> +    .post_save =3D virtio_net_inflight_post_save,
> +    .pre_load =3D virtio_net_inflight_init,
> +    .post_load =3D virtio_net_inflight_post_load,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_QTAILQ_V(queues_inflight, struct VirtIONetMigTmp, 0,
> +                         vmstate_virtio_net_inflight_queue,
> +                         VirtIONetInflightQueue, entry),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
>  static const VMStateDescription vmstate_virtio_net_device =3D {
>      .name =3D "virtio-net-device",
>      .version_id =3D VIRTIO_NET_VM_VERSION,
> @@ -3279,6 +3405,9 @@ static const VMStateDescription vmstate_virtio_net_=
device =3D {
>                           vmstate_virtio_net_tx_waiting),
>          VMSTATE_UINT64_TEST(curr_guest_offloads, VirtIONet,
>                              has_ctrl_guest_offloads),
> +        /* TODO: Move to subsection */
> +        VMSTATE_WITH_TMP(VirtIONet, struct VirtIONetMigTmp,
> +                         vmstate_virtio_net_inflight),
>          VMSTATE_END_OF_LIST()
>     },
>      .subsections =3D (const VMStateDescription * []) {
> --
> 2.31.1
>


