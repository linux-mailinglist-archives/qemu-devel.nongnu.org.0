Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B72645591
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 09:41:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2pyy-0007o9-R5; Wed, 07 Dec 2022 03:40:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2pyv-0007mU-A6
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 03:40:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2pyt-0004UR-7B
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 03:40:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670402441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k0VnNyOMDr6Ervi6YY5NEu4PVjBCEf7VIDUlTROY75c=;
 b=GSHslEWFjJIyf5phiI8Vwm7HsUNNRiLZqjXBulkE+qOT1M1YUWhALoZArsWV15UKDXAIIt
 rLxsBplJg9cqmrHy0IPV5Fx4tbLsQKEcZ9uRLD+81908oqkzINqUaQRGxjWidjiXBA6wSC
 tafFqOUyXStp2ySx2ZCVM7qjob/SHmU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-dD4uds51OGuzDLSuH5ppGg-1; Wed, 07 Dec 2022 03:40:40 -0500
X-MC-Unique: dD4uds51OGuzDLSuH5ppGg-1
Received: by mail-ej1-f72.google.com with SMTP id
 sa20-20020a1709076d1400b007bbe8699c2eso2946632ejc.6
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 00:40:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k0VnNyOMDr6Ervi6YY5NEu4PVjBCEf7VIDUlTROY75c=;
 b=L+K2XmaHgH4tWrPfWuSS6aWoBwPPiylMmGPk/UXIBXqWeGuB89k5LE4X8X1QhGszqL
 WH5lmC9zRZvc/eeuxoAmWmqYv0JShutLDGrojoJfKOp014nJqYPS9FIf9S03nYjWxQun
 q6OKbTVOT1qLBt5OLUsYHzRoh/8JGTOAPj02mWX6hwiA+lTqL5qS44mtMzbdDDseyUHD
 /yHuc3wbHnTBJ4V9EAeVn0G7AJzOxYS6j3uJh7hnsgl4fCvtWVYdEeDrwKbt1Qr6CQVd
 l0l9dv93RiQw3NdhlHfEZEctjSytK3f9Z5KUv5hNcXZKMPmWiI/T9OZfcYJs2Ly3x2fe
 tq5g==
X-Gm-Message-State: ANoB5pmWkuiXd44VNYESA8hD63hGPC9zk6j+KAaig/R4aNJxRuLmrGIe
 Py3LNPag7F3CLmw9l3U0F3hLIdewxqSFrE7ljeU2TNGc2P2g2/96DPIgxtGA6xFkxZgezR2adBW
 h54ywxCDwuxqwTfED/npjQX05XExv4x8=
X-Received: by 2002:a17:906:c249:b0:7ad:9f03:fd44 with SMTP id
 bl9-20020a170906c24900b007ad9f03fd44mr60927962ejb.73.1670402439022; 
 Wed, 07 Dec 2022 00:40:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4IZyrx8NiuBsXKdKO4n9GCAreiBMnlkrnfhMPTteWICSErqPWyvdMem+kExBIvPL2aqucDGP7/4DBRY8L0gkQ=
X-Received: by 2002:a17:906:c249:b0:7ad:9f03:fd44 with SMTP id
 bl9-20020a170906c24900b007ad9f03fd44mr60927931ejb.73.1670402438736; Wed, 07
 Dec 2022 00:40:38 -0800 (PST)
MIME-Version: 1.0
References: <20221205170436.2977336-1-eperezma@redhat.com>
 <20221205170436.2977336-11-eperezma@redhat.com>
 <PH0PR12MB5481DA422812F1B111667791DC189@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481DA422812F1B111667791DC189@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 7 Dec 2022 09:40:02 +0100
Message-ID: <CAJaqyWejQCDRG6R8fWJKmKoXjDZ21hhn=qPoHSmF9=SougKxag@mail.gmail.com>
Subject: Re: [RFC PATCH for 8.0 10/13] virtio-net: Migrate vhost inflight
 descriptors
To: Parav Pandit <parav@nvidia.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Liuxiangdong <liuxiangdong5@huawei.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <elic@nvidia.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Juan Quintela <quintela@redhat.com>
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

On Mon, Dec 5, 2022 at 9:52 PM Parav Pandit <parav@nvidia.com> wrote:
>
>
> > From: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > Sent: Monday, December 5, 2022 12:05 PM
> >
> > There is currently no data to be migrated, since nothing populates or r=
ead
> > the fields on virtio-net.
> >
> > The migration of in-flight descriptors is modelled after the migration =
of
> > requests in virtio-blk. With some differences:
> > * virtio-blk migrates queue number on each request. Here we only add a
> >   vq if it has descriptors to migrate, and then we make all descriptors
> >   in an array.
> > * Use of QTAILQ since it works similar to signal the end of the infligh=
t
> >   descriptors: 1 for more data, 0 if end. But do it for each vq instead
> >   of for each descriptor.
> > * Usage of VMState macros.
> >
> > The fields of descriptors would be way more complicated if we use the
> > VirtQueueElements directly, since there would be a few levels of
> > indirections. Using VirtQueueElementOld for the moment, and migrate to
> > VirtQueueElement for the final patch.
> >
> > TODO: Proper migration versioning
> > TODO: Do not embed vhost-vdpa structs
> > TODO: Migrate the VirtQueueElement, not VirtQueueElementOld.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/hw/virtio/virtio-net.h |   2 +
> >  include/migration/vmstate.h    |  11 +++
> >  hw/net/virtio-net.c            | 129 +++++++++++++++++++++++++++++++++
> >  3 files changed, 142 insertions(+)
> >
> > diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-=
net.h
> > index ef234ffe7e..ae7c017ef0 100644
> > --- a/include/hw/virtio/virtio-net.h
> > +++ b/include/hw/virtio/virtio-net.h
> > @@ -151,9 +151,11 @@ typedef struct VirtIONetQueue {
> >      QEMUTimer *tx_timer;
> >      QEMUBH *tx_bh;
> >      uint32_t tx_waiting;
> > +    uint32_t tx_inflight_num, rx_inflight_num;
> >      struct {
> >          VirtQueueElement *elem;
> >      } async_tx;
> > +    VirtQueueElement **tx_inflight, **rx_inflight;
> >      struct VirtIONet *n;
> >  } VirtIONetQueue;
> >
> > diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> > index 9726d2d09e..9e0dfef9ee 100644
> > --- a/include/migration/vmstate.h
> > +++ b/include/migration/vmstate.h
> > @@ -626,6 +626,17 @@ extern const VMStateInfo vmstate_info_qlist;
> >      .offset     =3D vmstate_offset_varray(_state, _field, _type),     =
 \
> >  }
> >
> > +#define VMSTATE_STRUCT_VARRAY_ALLOC_UINT16(_field, _state,
> > _field_num,        \
> > +                                           _version, _vmsd, _type) {  =
        \
> > +    .name       =3D (stringify(_field)),                              =
          \
> > +    .version_id =3D (_version),                                       =
          \
> > +    .vmsd       =3D &(_vmsd),                                         =
          \
> > +    .num_offset =3D vmstate_offset_value(_state, _field_num, uint16_t)=
,         \
> > +    .size       =3D sizeof(_type),                                    =
          \
> > +    .flags      =3D VMS_STRUCT | VMS_VARRAY_UINT16 | VMS_ALLOC |
> > VMS_POINTER,   \
> > +    .offset     =3D vmstate_offset_pointer(_state, _field, _type),    =
          \
> > +}
> > +
> >  #define VMSTATE_STRUCT_VARRAY_ALLOC(_field, _state, _field_num,
> > _version, _vmsd, _type) {\
> >      .name       =3D (stringify(_field)),                              =
 \
> >      .version_id =3D (_version),                                       =
 \
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c index
> > aba12759d5..ffd7bf1fc7 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -3077,6 +3077,13 @@ static bool mac_table_doesnt_fit(void *opaque,
> > int version_id)
> >      return !mac_table_fits(opaque, version_id);  }
> >
> > +typedef struct VirtIONetInflightQueue {
> > +    uint16_t idx;
> > +    uint16_t num;
> > +    QTAILQ_ENTRY(VirtIONetInflightQueue) entry;
> > +    VirtQueueElementOld *elems;
> > +} VirtIONetInflightQueue;
> > +
> >  /* This temporary type is shared by all the WITH_TMP methods
> >   * although only some fields are used by each.
> >   */
> > @@ -3086,6 +3093,7 @@ struct VirtIONetMigTmp {
> >      uint16_t        curr_queue_pairs_1;
> >      uint8_t         has_ufo;
> >      uint32_t        has_vnet_hdr;
> > +    QTAILQ_HEAD(, VirtIONetInflightQueue) queues_inflight;
> >  };
> >
> >  /* The 2nd and subsequent tx_waiting flags are loaded later than @@ -
> > 3231,6 +3239,124 @@ static const VMStateDescription
> > vmstate_virtio_net_rss =3D {
> >      },
> >  };
> >
> > +static const VMStateDescription vmstate_virtio_net_inflight_queue =3D =
{
> > +    .name      =3D "virtio-net-device/inflight/queue",
> > +    .fields =3D (VMStateField[]) {
> > +        VMSTATE_UINT16(idx, VirtIONetInflightQueue),
> > +        VMSTATE_UINT16(num, VirtIONetInflightQueue),
> > +
> > +        VMSTATE_STRUCT_VARRAY_ALLOC_UINT16(elems,
> > VirtIONetInflightQueue, num,
> > +                                           0, vmstate_virtqueue_elemen=
t_old,
> > +                                           VirtQueueElementOld),
> > +        VMSTATE_END_OF_LIST()
> > +    },
> > +};
> > +
> > +static int virtio_net_inflight_init(void *opaque) {
> > +    struct VirtIONetMigTmp *tmp =3D opaque;
> > +
> > +    QTAILQ_INIT(&tmp->queues_inflight);
> > +    return 0;
> > +}
> > +
> > +static int virtio_net_inflight_pre_save(void *opaque) {
> > +    struct VirtIONetMigTmp *tmp =3D opaque;
> > +    VirtIONet *net =3D tmp->parent;
> > +    uint16_t curr_queue_pairs =3D net->multiqueue ? net->curr_queue_pa=
irs :
> > 1;
> > +    VirtIONetInflightQueue *qi =3D g_new0(VirtIONetInflightQueue,
> > +                                        curr_queue_pairs * 2);
> > +
> > +    virtio_net_inflight_init(opaque);
> > +    for (uint16_t i =3D 0; i < curr_queue_pairs * 2; ++i) {
> > +        VirtIONetQueue *q =3D &net->vqs[vq2q(i)];
> > +        size_t n =3D i % 2 ? q->tx_inflight_num : q->rx_inflight_num;
> > +        VirtQueueElement **inflight =3D i % 2 ? q->tx_inflight :
> > + q->rx_inflight;
> > +
> > +        if (n =3D=3D 0) {
> > +            continue;
> > +        }
> > +
> > +        qi[i].idx =3D i;
> > +        qi[i].num =3D n;
> > +        qi[i].elems =3D g_new0(VirtQueueElementOld, n);
> > +        for (uint16_t j =3D 0; j < n; ++j) {
> > +            qemu_put_virtqueue_element_old(inflight[j], &qi[i].elems[j=
]);
> > +        }
> > +        QTAILQ_INSERT_TAIL(&tmp->queues_inflight, &qi[i], entry);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int virtio_net_inflight_post_save(void *opaque) {
> > +    struct VirtIONetMigTmp *tmp =3D opaque;
> > +    VirtIONetInflightQueue *qi;
> > +
> > +    while ((qi =3D QTAILQ_FIRST(&tmp->queues_inflight))) {
> > +        QTAILQ_REMOVE(&tmp->queues_inflight, qi, entry);
> > +        g_free(qi->elems);
> > +        g_free(qi);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int virtio_net_inflight_post_load(void *opaque, int version_id)
> > +{
> > +    struct VirtIONetMigTmp *tmp =3D opaque;
> > +    VirtIONet *net =3D tmp->parent;
> > +    uint16_t curr_queue_pairs =3D net->multiqueue ? net->curr_queue_pa=
irs :
> > 1;
> > +    VirtIONetInflightQueue *qi;
> > +
> > +    while ((qi =3D QTAILQ_FIRST(&tmp->queues_inflight))) {
> > +        VirtIONetQueue *q =3D &net->vqs[vq2q(qi->idx)];
> > +        uint32_t *n =3D qi->idx % 2 ? &q->tx_inflight_num : &q->rx_inf=
light_num;
> > +        VirtQueueElement ***inflight =3D qi->idx % 2 ?
> > +                                       &q->tx_inflight : &q->rx_inflig=
ht;
> > +        if (unlikely(qi->num =3D=3D 0)) {
> > +            /* TODO: error message */
> > +            return -1;
> > +        }
> > +
> > +        if (unlikely(qi->idx > curr_queue_pairs * 2)) {
> > +            /* TODO: error message */
> > +            return -1;
> > +        }
> > +
> > +        *n =3D qi->num;
> > +        *inflight =3D g_new(VirtQueueElement *, *n);
> > +        for (uint16_t j =3D 0; j < *n; ++j) {
> > +            (*inflight)[j] =3D qemu_get_virtqueue_element_from_old(
> > +                &net->parent_obj, &qi->elems[j],
> > +                sizeof(VirtQueueElement));
> > +        }
> > +
> > +        QTAILQ_REMOVE(&tmp->queues_inflight, qi, entry);
> > +        g_free(qi->elems);
> > +        g_free(qi);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +/* TODO: Allocate a temporal per queue / queue element, not all of
> > +them! */ static const VMStateDescription vmstate_virtio_net_inflight =
=3D {
> > +    .name      =3D "virtio-net-device/inflight",
> > +    .pre_save =3D virtio_net_inflight_pre_save,
> > +    .post_save =3D virtio_net_inflight_post_save,
> > +    .pre_load =3D virtio_net_inflight_init,
> > +    .post_load =3D virtio_net_inflight_post_load,
> > +    .fields =3D (VMStateField[]) {
> > +        VMSTATE_QTAILQ_V(queues_inflight, struct VirtIONetMigTmp, 0,
> > +                         vmstate_virtio_net_inflight_queue,
> > +                         VirtIONetInflightQueue, entry),
> > +        VMSTATE_END_OF_LIST()
> > +    },
> > +};
> > +
> How is the CVQ related mac, vlan, rss replay different than these infligh=
t descriptors, due to which inflights to be done by these callbacks and CVQ=
 differently?

CVQ is processed by qemu directly, so it is guaranteed they will not
be out of order. Guest memory is enough to recover in the destination.


