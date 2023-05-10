Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4E06FD393
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 03:36:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwYjU-00072F-Fr; Tue, 09 May 2023 21:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1pwYjP-0006wu-Tw
 for qemu-devel@nongnu.org; Tue, 09 May 2023 21:35:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1pwYjO-0002Cd-3i
 for qemu-devel@nongnu.org; Tue, 09 May 2023 21:35:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683682500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=muG2PwapXViLE8SET5NCINn/fJ8GuDyufFDuYy9W0LI=;
 b=PX5X5Fwz9TJq4AlV9oSpQP3CdI/tlLJxVNzXEEDJ4HxhHKG8tMWOE6fnXT5pb1n87cNL/C
 Pm+E0FCy6N1Zb01j/RwUL5M4jQ4clocH+m3Mnr/R1H7P+Fi4Q4PYUKh3z0UqzZYuAHw/pN
 EqHfpbG/Hmu20Cko/Z0R23Q6/8/+ftA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-Y2XOjmG1Miq1KulZ0J3K2Q-1; Tue, 09 May 2023 21:33:33 -0400
X-MC-Unique: Y2XOjmG1Miq1KulZ0J3K2Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-965b9e29579so734635266b.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 18:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683682412; x=1686274412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=muG2PwapXViLE8SET5NCINn/fJ8GuDyufFDuYy9W0LI=;
 b=YgBxl/z6LSG36rlLvUJXn/FnujwQGts9N+EN6NflbYsTINMOqy45XtJYyB8nzDR49Y
 ZEVw4q5XGYkgopbVnSQeO3p4JP9DuKXICmpkpj9Bfa8V0IvsdJiel1CRUgnT2JYtedR5
 3TTEALnJIWB32ods3Fpoj9cuav25BRpBy3dBeIt4synaF1Du28RksOEt6DNlm8v1ecQe
 a4KWvkFfu42Cc00Ntz46fcWTWuWdjD45vJNUpC5/j72Kj5P30ryq7YV6U/HBjYBocxSg
 agjQ4dW66dDfwuEUggA8vp0DkYcm81lx307q9n3uY8OUoikB5MX0tWtMDxSE5dlVb3N7
 9vLw==
X-Gm-Message-State: AC+VfDw+jEuJZ9uBQmjHoDM4HAGPawe1FJowB4NOmrbtq30nhBotQ6Mf
 InEWxBt5VvcVmuRnFzmlkAuo6wX4KPJJRUmfGMxUbNsj1WL01RnH4dFMfEg7hGrqG8PmNXwqSS7
 u9VRgXThFDifdNrT3zhxEDCFtUVbT6fI=
X-Received: by 2002:a17:907:7da9:b0:966:538f:843b with SMTP id
 oz41-20020a1709077da900b00966538f843bmr9443074ejc.77.1683682411939; 
 Tue, 09 May 2023 18:33:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yJl1HXetH2aHJJ+ckNCejSjwxYr5DKnv8AVE74xrXJ9Vq0M2AmAP6Aziysxc5CqwbbzyR+tA+FLu2tqNwKqU=
X-Received: by 2002:a17:907:7da9:b0:966:538f:843b with SMTP id
 oz41-20020a1709077da900b00966538f843bmr9443058ejc.77.1683682411569; Tue, 09
 May 2023 18:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230506150111.2496-1-yin31149@gmail.com>
 <CAJaqyWfwFx_zhYpJ_o4E7M84255GbNtKGDM9fnqkyBJMTA=k2w@mail.gmail.com>
In-Reply-To: <CAJaqyWfwFx_zhYpJ_o4E7M84255GbNtKGDM9fnqkyBJMTA=k2w@mail.gmail.com>
From: Lei Yang <leiyang@redhat.com>
Date: Wed, 10 May 2023 09:32:54 +0800
Message-ID: <CAPpAL=yWNtKG4j1395=FipdW1YAfoJ2N_CBAPQtE5QadcUOyTQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] vhost: fix possible wrap in SVQ descriptor ring
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Hawkins Jiawei <yin31149@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 18801353760@163.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leiyang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

QE applied this patch to do sanity testing on vhost-net, there is no
any regression problem.

Tested-by: Lei Yang <leiyang@redhat.com>



On Tue, May 9, 2023 at 1:28=E2=80=AFAM Eugenio Perez Martin <eperezma@redha=
t.com> wrote:
>
> On Sat, May 6, 2023 at 5:01=E2=80=AFPM Hawkins Jiawei <yin31149@gmail.com=
> wrote:
> >
> > QEMU invokes vhost_svq_add() when adding a guest's element into SVQ.
> > In vhost_svq_add(), it uses vhost_svq_available_slots() to check
> > whether QEMU can add the element into the SVQ. If there is
> > enough space, then QEMU combines some out descriptors and
> > some in descriptors into one descriptor chain, and add it into
> > svq->vring.desc by vhost_svq_vring_write_descs().
> >
> > Yet the problem is that, `svq->shadow_avail_idx - svq->shadow_used_idx`
> > in vhost_svq_available_slots() return the number of occupied elements,
> > or the number of descriptor chains, instead of the number of occupied
> > descriptors, which may cause wrapping in SVQ descriptor ring.
> >
> > Here is an example. In vhost_handle_guest_kick(), QEMU forwards
> > as many available buffers to device by virtqueue_pop() and
> > vhost_svq_add_element(). virtqueue_pop() return a guest's element,
> > and use vhost_svq_add_elemnt(), a wrapper to vhost_svq_add(), to
> > add this element into SVQ. If QEMU invokes virtqueue_pop() and
> > vhost_svq_add_element() `svq->vring.num` times, vhost_svq_available_slo=
ts()
> > thinks QEMU just ran out of slots and everything should work fine.
> > But in fact, virtqueue_pop() return `svq-vring.num` elements or
> > descriptor chains, more than `svq->vring.num` descriptors, due to
> > guest memory fragmentation, and this cause wrapping in SVQ descriptor r=
ing.
> >
>
> The bug is valid even before marking the descriptors used. If the
> guest memory is fragmented, SVQ must add chains so it can try to add
> more descriptors than possible.
>
> > Therefore, this patch adds `num_free` field in VhostShadowVirtqueue
> > structure, updates this field in vhost_svq_add() and
> > vhost_svq_get_buf(), to record the number of free descriptors.
> > Then we can avoid wrap in SVQ descriptor ring by refactoring
> > vhost_svq_available_slots().
> >
> > Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")
> > Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
> > ---
> >  hw/virtio/vhost-shadow-virtqueue.c | 9 ++++++++-
> >  hw/virtio/vhost-shadow-virtqueue.h | 3 +++
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 8361e70d1b..e1c6952b10 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -68,7 +68,7 @@ bool vhost_svq_valid_features(uint64_t features, Erro=
r **errp)
> >   */
> >  static uint16_t vhost_svq_available_slots(const VhostShadowVirtqueue *=
svq)
> >  {
> > -    return svq->vring.num - (svq->shadow_avail_idx - svq->shadow_used_=
idx);
> > +    return svq->num_free;
> >  }
> >
> >  /**
> > @@ -263,6 +263,9 @@ int vhost_svq_add(VhostShadowVirtqueue *svq, const =
struct iovec *out_sg,
> >          return -EINVAL;
> >      }
> >
> > +    /* Update the size of SVQ vring free descriptors */
> > +    svq->num_free -=3D ndescs;
> > +
> >      svq->desc_state[qemu_head].elem =3D elem;
> >      svq->desc_state[qemu_head].ndescs =3D ndescs;
> >      vhost_svq_kick(svq);
> > @@ -450,6 +453,9 @@ static VirtQueueElement *vhost_svq_get_buf(VhostSha=
dowVirtqueue *svq,
> >      svq->desc_next[last_used_chain] =3D svq->free_head;
> >      svq->free_head =3D used_elem.id;
> >
> > +    /* Update the size of SVQ vring free descriptors */
>
> No need for this comment.
>
> Apart from that,
>
> Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> > +    svq->num_free +=3D num;
> > +
> >      *len =3D used_elem.len;
> >      return g_steal_pointer(&svq->desc_state[used_elem.id].elem);
> >  }
> > @@ -659,6 +665,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, Vir=
tIODevice *vdev,
> >      svq->iova_tree =3D iova_tree;
> >
> >      svq->vring.num =3D virtio_queue_get_num(vdev, virtio_get_queue_ind=
ex(vq));
> > +    svq->num_free =3D svq->vring.num;
> >      driver_size =3D vhost_svq_driver_area_size(svq);
> >      device_size =3D vhost_svq_device_area_size(svq);
> >      svq->vring.desc =3D qemu_memalign(qemu_real_host_page_size(), driv=
er_size);
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 926a4897b1..6efe051a70 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -107,6 +107,9 @@ typedef struct VhostShadowVirtqueue {
> >
> >      /* Next head to consume from the device */
> >      uint16_t last_used_idx;
> > +
> > +    /* Size of SVQ vring free descriptors */
> > +    uint16_t num_free;
> >  } VhostShadowVirtqueue;
> >
> >  bool vhost_svq_valid_features(uint64_t features, Error **errp);
> > --
> > 2.25.1
> >
>
>


