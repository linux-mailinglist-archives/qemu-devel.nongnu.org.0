Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F266FB5EA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 19:28:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw4dK-0006uM-89; Mon, 08 May 2023 13:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pw4dH-0006tv-VL
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:26:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pw4dF-00044S-Vj
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683566800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nA9vkAOFJUWtp/QpvGz8fcxHmOMqAahWo3inTYupG3c=;
 b=KC3aySvCoNSBJm0p8APNRu4zRaaUlcfE7fv1S5AkGZzM4+YvGJ9Mv52a25viBiu1NxfItJ
 x/Ntg1BTdJK+LSpc46j5px4eqDBoKA8v/lvZeiXuyFABNhHFf6scr6tvga0K8ffhgJUBk7
 8omN+t2/Aj4rAU410jYyEzWIyHZRKo8=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-b__2mkPhMZWjGgNuk3pNkQ-1; Mon, 08 May 2023 13:26:39 -0400
X-MC-Unique: b__2mkPhMZWjGgNuk3pNkQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-b9a25f6aa0eso9170509276.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 10:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683566798; x=1686158798;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nA9vkAOFJUWtp/QpvGz8fcxHmOMqAahWo3inTYupG3c=;
 b=WUIYQU0B0W9+0V5Q1OXEZuwFc3hjX/2qDDl9FxK/FoR3tU3AlM7eOQBQQVHeOMiYal
 XNxg7ZGbMOU+GIYa2wL3ZczO/oHG6uv3syV41B7zd8xbNKkpm6gUXU6e0D9KM5JCsPG+
 tXpBOKfmLq9YSl0Kjuo4WmE63b6AuZqjU41pNXP0cChh/Rw7blACTXXM7MxENwUKePcO
 LofnDJIV0M6+8GWZUQP2iYO+6ooblj0ikYMq/Za/pR81dEXoNJ7WrODMVaITlZIDdiox
 zdV8AcIdyyWnh5vJxemeSYbgStOuQc89mZuNR+g2HonfkfGLUrefcT8xNgZ2F0D+Iqwv
 pohg==
X-Gm-Message-State: AC+VfDxG8vel32hK6Omp74zYcqT5b4KbEYWpxPh0Sa1Gi8ojA0k/wUzA
 5+7ddEPxvheh37FDB6ZADIOqtRWz9MVPRc4cqP2XJ1cSq1nBXK6B3Mcyi2ssdk9uNkENtbAJjZh
 KcQunYbzr1/rBCyWoZluY2AGXWvx79qI=
X-Received: by 2002:a25:ad93:0:b0:b9d:88a7:dbc with SMTP id
 z19-20020a25ad93000000b00b9d88a70dbcmr10536600ybi.59.1683566798547; 
 Mon, 08 May 2023 10:26:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4G9nHkOx+AxSJ6Fg90nzSaOPy7KIft8J+Vro1Kh4pmDuh0xry912XlJi+q2TWBr8YCRt8UlkJwCk1Cmk1gJ+M=
X-Received: by 2002:a25:ad93:0:b0:b9d:88a7:dbc with SMTP id
 z19-20020a25ad93000000b00b9d88a70dbcmr10536587ybi.59.1683566798208; Mon, 08
 May 2023 10:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230506150111.2496-1-yin31149@gmail.com>
In-Reply-To: <20230506150111.2496-1-yin31149@gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 8 May 2023 19:26:02 +0200
Message-ID: <CAJaqyWfwFx_zhYpJ_o4E7M84255GbNtKGDM9fnqkyBJMTA=k2w@mail.gmail.com>
Subject: Re: [PATCH RESEND] vhost: fix possible wrap in SVQ descriptor ring
To: Hawkins Jiawei <yin31149@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 18801353760@163.com,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, May 6, 2023 at 5:01=E2=80=AFPM Hawkins Jiawei <yin31149@gmail.com> =
wrote:
>
> QEMU invokes vhost_svq_add() when adding a guest's element into SVQ.
> In vhost_svq_add(), it uses vhost_svq_available_slots() to check
> whether QEMU can add the element into the SVQ. If there is
> enough space, then QEMU combines some out descriptors and
> some in descriptors into one descriptor chain, and add it into
> svq->vring.desc by vhost_svq_vring_write_descs().
>
> Yet the problem is that, `svq->shadow_avail_idx - svq->shadow_used_idx`
> in vhost_svq_available_slots() return the number of occupied elements,
> or the number of descriptor chains, instead of the number of occupied
> descriptors, which may cause wrapping in SVQ descriptor ring.
>
> Here is an example. In vhost_handle_guest_kick(), QEMU forwards
> as many available buffers to device by virtqueue_pop() and
> vhost_svq_add_element(). virtqueue_pop() return a guest's element,
> and use vhost_svq_add_elemnt(), a wrapper to vhost_svq_add(), to
> add this element into SVQ. If QEMU invokes virtqueue_pop() and
> vhost_svq_add_element() `svq->vring.num` times, vhost_svq_available_slots=
()
> thinks QEMU just ran out of slots and everything should work fine.
> But in fact, virtqueue_pop() return `svq-vring.num` elements or
> descriptor chains, more than `svq->vring.num` descriptors, due to
> guest memory fragmentation, and this cause wrapping in SVQ descriptor rin=
g.
>

The bug is valid even before marking the descriptors used. If the
guest memory is fragmented, SVQ must add chains so it can try to add
more descriptors than possible.

> Therefore, this patch adds `num_free` field in VhostShadowVirtqueue
> structure, updates this field in vhost_svq_add() and
> vhost_svq_get_buf(), to record the number of free descriptors.
> Then we can avoid wrap in SVQ descriptor ring by refactoring
> vhost_svq_available_slots().
>
> Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")
> Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
> ---
>  hw/virtio/vhost-shadow-virtqueue.c | 9 ++++++++-
>  hw/virtio/vhost-shadow-virtqueue.h | 3 +++
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index 8361e70d1b..e1c6952b10 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -68,7 +68,7 @@ bool vhost_svq_valid_features(uint64_t features, Error =
**errp)
>   */
>  static uint16_t vhost_svq_available_slots(const VhostShadowVirtqueue *sv=
q)
>  {
> -    return svq->vring.num - (svq->shadow_avail_idx - svq->shadow_used_id=
x);
> +    return svq->num_free;
>  }
>
>  /**
> @@ -263,6 +263,9 @@ int vhost_svq_add(VhostShadowVirtqueue *svq, const st=
ruct iovec *out_sg,
>          return -EINVAL;
>      }
>
> +    /* Update the size of SVQ vring free descriptors */
> +    svq->num_free -=3D ndescs;
> +
>      svq->desc_state[qemu_head].elem =3D elem;
>      svq->desc_state[qemu_head].ndescs =3D ndescs;
>      vhost_svq_kick(svq);
> @@ -450,6 +453,9 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShado=
wVirtqueue *svq,
>      svq->desc_next[last_used_chain] =3D svq->free_head;
>      svq->free_head =3D used_elem.id;
>
> +    /* Update the size of SVQ vring free descriptors */

No need for this comment.

Apart from that,

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

> +    svq->num_free +=3D num;
> +
>      *len =3D used_elem.len;
>      return g_steal_pointer(&svq->desc_state[used_elem.id].elem);
>  }
> @@ -659,6 +665,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtI=
ODevice *vdev,
>      svq->iova_tree =3D iova_tree;
>
>      svq->vring.num =3D virtio_queue_get_num(vdev, virtio_get_queue_index=
(vq));
> +    svq->num_free =3D svq->vring.num;
>      driver_size =3D vhost_svq_driver_area_size(svq);
>      device_size =3D vhost_svq_device_area_size(svq);
>      svq->vring.desc =3D qemu_memalign(qemu_real_host_page_size(), driver=
_size);
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-=
virtqueue.h
> index 926a4897b1..6efe051a70 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -107,6 +107,9 @@ typedef struct VhostShadowVirtqueue {
>
>      /* Next head to consume from the device */
>      uint16_t last_used_idx;
> +
> +    /* Size of SVQ vring free descriptors */
> +    uint16_t num_free;
>  } VhostShadowVirtqueue;
>
>  bool vhost_svq_valid_features(uint64_t features, Error **errp);
> --
> 2.25.1
>


