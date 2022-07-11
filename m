Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F124B56FBE1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 11:36:32 +0200 (CEST)
Received: from localhost ([::1]:45716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oApqB-0008Oi-Qp
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 05:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oApnm-0005kq-6a
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:34:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oApni-0004ui-Pv
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657532037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C7IKGO4VHxhjAth2znQ7bg1mJruw+APYcIoDEbniPSE=;
 b=iaQUFprsOWR3jusfRpEIlXfKnfk7Xxo5XHGUpP3jfATYUDcM6Kp1VFhOf54H1xn+9vPGUE
 NdBPBFMsraye0uMLXfr6rgcM151EPVz/BjB5dhx1ALSaluCM6OfvNYxMuE9Eklb4jQNSe+
 yKellg9/Md6sfm4t+w3GAgdzc3xu0MM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-R_e4pO4lPwGUCtZ8TxODWA-1; Mon, 11 Jul 2022 05:33:50 -0400
X-MC-Unique: R_e4pO4lPwGUCtZ8TxODWA-1
Received: by mail-qk1-f199.google.com with SMTP id
 e128-20020a376986000000b006af6adf035cso4923620qkc.8
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 02:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C7IKGO4VHxhjAth2znQ7bg1mJruw+APYcIoDEbniPSE=;
 b=JIiGltr7favMG1/o723lyZG4egF5aSdBnsRWTk2A9h7GXR6E4ZRtMCBK8SooOjMBT7
 ZrBS4jJPjDw5nV8FL8PiVuqFAXAnABRydznB5o4bHFVRV46sC8PlZ+EZY5EHonJcI8Qb
 agpWYYbYxk+Rm1/hoNFFigmsDo3p5qeiX52U1gumorp/Ve7oHTiIVP+yMgwLKkeaLfHV
 grbpRu+yVcl2oxMskYYDGAtwVbvk9iVcOKhYNJ/N/ny0CXijjLVUYCF6rrTrdXqIGLw/
 9pz4NLi5qEbqcJU8QWLpHJ0cA8pRT/MDZ1NBNdvFq/fA0OLr5FLGqVUnp1fthfPtiz1T
 yMjg==
X-Gm-Message-State: AJIora8tf1mH4RAZ65K7lxoRJyKmHIRpgjtSYHLdegNhzAf6pr6cILhM
 FKXaeAgeCcmpSpVzYEb6g16kyVNdKP+MWgfTsWnaqUKqzSL/JHYVUlKCpNikLcUE71YNj6O8+qe
 aCCUWbfaGmmubHI1K9TrtAwGNwMNNdXk=
X-Received: by 2002:ac8:5dd1:0:b0:31d:34db:e0d with SMTP id
 e17-20020ac85dd1000000b0031d34db0e0dmr13298629qtx.592.1657532029667; 
 Mon, 11 Jul 2022 02:33:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uL1+NlXgABZMgQ5nQgKAM2/Z4HFp7LE/C7f71xHmnVgHZQEa4SthgbW7D6iKZtyfAmLQn0p5oahTqCUpQN9mg=
X-Received: by 2002:ac8:5dd1:0:b0:31d:34db:e0d with SMTP id
 e17-20020ac85dd1000000b0031d34db0e0dmr13298608qtx.592.1657532029411; Mon, 11
 Jul 2022 02:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-10-eperezma@redhat.com>
 <ece7b78f-9920-be6f-cea4-b9069035a6b0@redhat.com>
In-Reply-To: <ece7b78f-9920-be6f-cea4-b9069035a6b0@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 11 Jul 2022 11:33:13 +0200
Message-ID: <CAJaqyWfpOTmUkdiRN57A3wfnmZojoAaHte-oOtmo3wfQWD1pfA@mail.gmail.com>
Subject: Re: [RFC PATCH v9 09/23] vhost: Add SVQElement
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 11, 2022 at 11:00 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/7 02:39, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > This will allow SVQ to add metadata to the different queue elements. To
> > simplify changes, only store actual element at this patch.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  8 ++++--
> >   hw/virtio/vhost-shadow-virtqueue.c | 41 ++++++++++++++++++++---------=
-
> >   2 files changed, 33 insertions(+), 16 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 0fbdd69153..e434dc63b0 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -15,6 +15,10 @@
> >   #include "standard-headers/linux/vhost_types.h"
> >   #include "hw/virtio/vhost-iova-tree.h"
> >
> > +typedef struct SVQElement {
> > +    VirtQueueElement *elem;
> > +} SVQElement;
> > +
> >   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> >   typedef int (*ShadowVirtQueueStart)(VhostShadowVirtqueue *svq,
> >                                       void *opaque);
> > @@ -55,8 +59,8 @@ typedef struct VhostShadowVirtqueue {
> >       /* IOVA mapping */
> >       VhostIOVATree *iova_tree;
> >
> > -    /* Map for use the guest's descriptors */
> > -    VirtQueueElement **ring_id_maps;
> > +    /* Each element context */
> > +    SVQElement *ring_id_maps;
> >
> >       /* Next VirtQueue element that guest made available */
> >       VirtQueueElement *next_guest_avail_elem;
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 46d3c1d74f..913bca8769 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -237,7 +237,7 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq=
, const struct iovec *out_sg,
> >           return false;
> >       }
> >
> > -    svq->ring_id_maps[qemu_head] =3D elem;
> > +    svq->ring_id_maps[qemu_head].elem =3D elem;
> >       return true;
> >   }
> >
> > @@ -385,15 +385,25 @@ static uint16_t vhost_svq_last_desc_of_chain(cons=
t VhostShadowVirtqueue *svq,
> >       return i;
> >   }
> >
> > -static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
> > -                                           uint32_t *len)
> > +static bool vhost_svq_is_empty_elem(SVQElement elem)
> > +{
> > +    return elem.elem =3D=3D NULL;
> > +}
> > +
> > +static SVQElement vhost_svq_empty_elem(void)
> > +{
> > +    return (SVQElement){};
> > +}
>
>
> I wonder what's the benefit of using this instead of passing pointer to
> SVQElement and using memset().
>

It was a more direct translation of the previous workflow but we can
use memset here for sure.

>
> > +
> > +static SVQElement vhost_svq_get_buf(VhostShadowVirtqueue *svq, uint32_=
t *len)
> >   {
> >       const vring_used_t *used =3D svq->vring.used;
> >       vring_used_elem_t used_elem;
> > +    SVQElement svq_elem =3D vhost_svq_empty_elem();
> >       uint16_t last_used, last_used_chain, num;
> >
> >       if (!vhost_svq_more_used(svq)) {
> > -        return NULL;
> > +        return svq_elem;
> >       }
> >
> >       /* Only get used array entries after they have been exposed by de=
v */
> > @@ -406,24 +416,25 @@ static VirtQueueElement *vhost_svq_get_buf(VhostS=
hadowVirtqueue *svq,
> >       if (unlikely(used_elem.id >=3D svq->vring.num)) {
> >           qemu_log_mask(LOG_GUEST_ERROR, "Device %s says index %u is us=
ed",
> >                         svq->vdev->name, used_elem.id);
> > -        return NULL;
> > +        return svq_elem;
> >       }
> >
> > -    if (unlikely(!svq->ring_id_maps[used_elem.id])) {
> > +    svq_elem =3D svq->ring_id_maps[used_elem.id];
> > +    svq->ring_id_maps[used_elem.id] =3D vhost_svq_empty_elem();
> > +    if (unlikely(vhost_svq_is_empty_elem(svq_elem))) {
>
>
> Any reason we can't simply assign NULL to ring_id_maps[used_elem.id]?
>

It simply avoids allocating more memory, so error code paths are
simplified, etc. In the kernel, vring_desc_state_split, desc_extra and
similar are not an array of pointers but an array of states, so we
apply the same here. Returning them by value it's not so common
though.

But we can allocate a state per in-flight descriptor for sure.

Thanks!


> Thanks
>
>
> >           qemu_log_mask(LOG_GUEST_ERROR,
> >               "Device %s says index %u is used, but it was not availabl=
e",
> >               svq->vdev->name, used_elem.id);
> > -        return NULL;
> > +        return svq_elem;
> >       }
> >
> > -    num =3D svq->ring_id_maps[used_elem.id]->in_num +
> > -          svq->ring_id_maps[used_elem.id]->out_num;
> > +    num =3D svq_elem.elem->in_num + svq_elem.elem->out_num;
> >       last_used_chain =3D vhost_svq_last_desc_of_chain(svq, num, used_e=
lem.id);
> >       svq->desc_next[last_used_chain] =3D svq->free_head;
> >       svq->free_head =3D used_elem.id;
> >
> >       *len =3D used_elem.len;
> > -    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
> > +    return svq_elem;
> >   }
> >
> >   /**
> > @@ -454,6 +465,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *s=
vq,
> >           vhost_svq_disable_notification(svq);
> >           while (true) {
> >               uint32_t len;
> > +            SVQElement svq_elem;
> >               g_autofree VirtQueueElement *elem =3D NULL;
> >
> >               if (unlikely(i >=3D svq->vring.num)) {
> > @@ -464,11 +476,12 @@ static void vhost_svq_flush(VhostShadowVirtqueue =
*svq,
> >                   return;
> >               }
> >
> > -            elem =3D vhost_svq_get_buf(svq, &len);
> > -            if (!elem) {
> > +            svq_elem =3D vhost_svq_get_buf(svq, &len);
> > +            if (vhost_svq_is_empty_elem(svq_elem)) {
> >                   break;
> >               }
> >
> > +            elem =3D g_steal_pointer(&svq_elem.elem);
> >               virtqueue_fill(vq, elem, len, i++);
> >           }
> >
> > @@ -611,7 +624,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, Vir=
tIODevice *vdev,
> >       memset(svq->vring.desc, 0, driver_size);
> >       svq->vring.used =3D qemu_memalign(qemu_real_host_page_size(), dev=
ice_size);
> >       memset(svq->vring.used, 0, device_size);
> > -    svq->ring_id_maps =3D g_new0(VirtQueueElement *, svq->vring.num);
> > +    svq->ring_id_maps =3D g_new0(SVQElement, svq->vring.num);
> >       svq->desc_next =3D g_new0(uint16_t, svq->vring.num);
> >       for (unsigned i =3D 0; i < svq->vring.num - 1; i++) {
> >           svq->desc_next[i] =3D cpu_to_le16(i + 1);
> > @@ -636,7 +649,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >
> >       for (unsigned i =3D 0; i < svq->vring.num; ++i) {
> >           g_autofree VirtQueueElement *elem =3D NULL;
> > -        elem =3D g_steal_pointer(&svq->ring_id_maps[i]);
> > +        elem =3D g_steal_pointer(&svq->ring_id_maps[i].elem);
> >           if (elem) {
> >               virtqueue_detach_element(svq->vq, elem, 0);
> >           }
>


