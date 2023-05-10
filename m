Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0432D6FE18B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:29:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwljT-00051z-Ch; Wed, 10 May 2023 11:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1pwljS-00051p-E9
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1pwljP-0007kW-4q
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683732473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NE9c7G70Ibd/Gy0DdYNPTmYSQN51QZkxVe2CYrFoY9s=;
 b=OSyBkG+IPBs9UMYYuox4j/nMF7h19gXJ4RE+iSEDwyo0RZod2FHIa/ASdbpFYLp4877NLf
 kg8XBhXJgcePAg3xrJOQ5k4PmXLb0XeU4AqXzYZaNCpPf40nITIV4TA2n1D/IDaJw6nU8n
 xpIzpCTt2DHnCiuqPvdZbvT1nwf5VOQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-Sj_XeapPOg2-B23DyD0nvQ-1; Wed, 10 May 2023 11:27:52 -0400
X-MC-Unique: Sj_XeapPOg2-B23DyD0nvQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50bc6c6b9dbso14152596a12.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683732471; x=1686324471;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NE9c7G70Ibd/Gy0DdYNPTmYSQN51QZkxVe2CYrFoY9s=;
 b=aCoIuLYQXVWwZbS9KbiQYI9e3+7Z+I3Vh9DcP385vNGttIt3vIPTrFeQ5WJ8f56gWE
 OPi8bdvayhQPv5NMSctwh1BND6IenGdPLmG7nsEoCfqIAMmW2zW0dSBsgQrTzGhkzzQs
 3W2/RenLAPxHUF3MsEZhQCP4Dp39eeNGlwIGCb+LtVhTsM5sFhed4PjesLf85ldUSHvC
 pRjuRZFqQknUxoGWH2csumSelDtIhf+Cn4Ikb4VnEAl5GcYTd+tDhSStgy8REcagWJyR
 CLbBWjhBG9asx1WSgQG0SmRwOvGwuze3KLkmjYy7g9ZhnCDWRDmLnF0zM1pwKNkz0mvn
 6HmA==
X-Gm-Message-State: AC+VfDxYaddY06F3rR+Fkz6POIS5wSpvwt1GzAx+wmhMLzejWh0ZRlAp
 rIl+Da2xsY2DGH7iiBh5PsXb9Ap9oKbY0mf2xIJjr+vfVp9bBH96EaLkNtpHbsQFVFUwgoxtapa
 qbgutsJUYACzIQzQMb5HqCcui2TIn3qo=
X-Received: by 2002:aa7:d687:0:b0:4ad:738b:6706 with SMTP id
 d7-20020aa7d687000000b004ad738b6706mr15355997edr.2.1683732471112; 
 Wed, 10 May 2023 08:27:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6TZm18N2lwTQXaBj3a4pATSoSofi1rDrijeS7CAopQFNqsvvROR7RjiEXJffjGAh050WpRAnH0RU7bXaNIycY=
X-Received: by 2002:aa7:d687:0:b0:4ad:738b:6706 with SMTP id
 d7-20020aa7d687000000b004ad738b6706mr15355976edr.2.1683732470763; Wed, 10 May
 2023 08:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230506150111.2496-1-yin31149@gmail.com>
 <CAJaqyWfwFx_zhYpJ_o4E7M84255GbNtKGDM9fnqkyBJMTA=k2w@mail.gmail.com>
 <CAPpAL=yWNtKG4j1395=FipdW1YAfoJ2N_CBAPQtE5QadcUOyTQ@mail.gmail.com>
In-Reply-To: <CAPpAL=yWNtKG4j1395=FipdW1YAfoJ2N_CBAPQtE5QadcUOyTQ@mail.gmail.com>
From: Lei Yang <leiyang@redhat.com>
Date: Wed, 10 May 2023 23:27:14 +0800
Message-ID: <CAPpAL=xwMPQbC0HTOyQeBDdFiwR7SO0VT=UoZe-cWxXC7LVpYA@mail.gmail.com>
Subject: Re: [PATCH RESEND] vhost: fix possible wrap in SVQ descriptor ring
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Hawkins Jiawei <yin31149@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 18801353760@163.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d124dd05fb588325"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leiyang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000d124dd05fb588325
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

QE applied this patch to do sanity testing on vhost-vdpa, there is no any
regression problem.

Tested-by: Lei Yang <leiyang@redhat.com>


On Wed, May 10, 2023 at 9:32=E2=80=AFAM Lei Yang <leiyang@redhat.com> wrote=
:

> QE applied this patch to do sanity testing on vhost-net, there is no
> any regression problem.
>
> Tested-by: Lei Yang <leiyang@redhat.com>
>
>
>
> On Tue, May 9, 2023 at 1:28=E2=80=AFAM Eugenio Perez Martin <eperezma@red=
hat.com>
> wrote:
> >
> > On Sat, May 6, 2023 at 5:01=E2=80=AFPM Hawkins Jiawei <yin31149@gmail.c=
om>
> wrote:
> > >
> > > QEMU invokes vhost_svq_add() when adding a guest's element into SVQ.
> > > In vhost_svq_add(), it uses vhost_svq_available_slots() to check
> > > whether QEMU can add the element into the SVQ. If there is
> > > enough space, then QEMU combines some out descriptors and
> > > some in descriptors into one descriptor chain, and add it into
> > > svq->vring.desc by vhost_svq_vring_write_descs().
> > >
> > > Yet the problem is that, `svq->shadow_avail_idx - svq->shadow_used_id=
x`
> > > in vhost_svq_available_slots() return the number of occupied elements=
,
> > > or the number of descriptor chains, instead of the number of occupied
> > > descriptors, which may cause wrapping in SVQ descriptor ring.
> > >
> > > Here is an example. In vhost_handle_guest_kick(), QEMU forwards
> > > as many available buffers to device by virtqueue_pop() and
> > > vhost_svq_add_element(). virtqueue_pop() return a guest's element,
> > > and use vhost_svq_add_elemnt(), a wrapper to vhost_svq_add(), to
> > > add this element into SVQ. If QEMU invokes virtqueue_pop() and
> > > vhost_svq_add_element() `svq->vring.num` times,
> vhost_svq_available_slots()
> > > thinks QEMU just ran out of slots and everything should work fine.
> > > But in fact, virtqueue_pop() return `svq-vring.num` elements or
> > > descriptor chains, more than `svq->vring.num` descriptors, due to
> > > guest memory fragmentation, and this cause wrapping in SVQ descriptor
> ring.
> > >
> >
> > The bug is valid even before marking the descriptors used. If the
> > guest memory is fragmented, SVQ must add chains so it can try to add
> > more descriptors than possible.
> >
> > > Therefore, this patch adds `num_free` field in VhostShadowVirtqueue
> > > structure, updates this field in vhost_svq_add() and
> > > vhost_svq_get_buf(), to record the number of free descriptors.
> > > Then we can avoid wrap in SVQ descriptor ring by refactoring
> > > vhost_svq_available_slots().
> > >
> > > Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")
> > > Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
> > > ---
> > >  hw/virtio/vhost-shadow-virtqueue.c | 9 ++++++++-
> > >  hw/virtio/vhost-shadow-virtqueue.h | 3 +++
> > >  2 files changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c
> b/hw/virtio/vhost-shadow-virtqueue.c
> > > index 8361e70d1b..e1c6952b10 100644
> > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > @@ -68,7 +68,7 @@ bool vhost_svq_valid_features(uint64_t features,
> Error **errp)
> > >   */
> > >  static uint16_t vhost_svq_available_slots(const VhostShadowVirtqueue
> *svq)
> > >  {
> > > -    return svq->vring.num - (svq->shadow_avail_idx -
> svq->shadow_used_idx);
> > > +    return svq->num_free;
> > >  }
> > >
> > >  /**
> > > @@ -263,6 +263,9 @@ int vhost_svq_add(VhostShadowVirtqueue *svq, cons=
t
> struct iovec *out_sg,
> > >          return -EINVAL;
> > >      }
> > >
> > > +    /* Update the size of SVQ vring free descriptors */
> > > +    svq->num_free -=3D ndescs;
> > > +
> > >      svq->desc_state[qemu_head].elem =3D elem;
> > >      svq->desc_state[qemu_head].ndescs =3D ndescs;
> > >      vhost_svq_kick(svq);
> > > @@ -450,6 +453,9 @@ static VirtQueueElement
> *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
> > >      svq->desc_next[last_used_chain] =3D svq->free_head;
> > >      svq->free_head =3D used_elem.id;
> > >
> > > +    /* Update the size of SVQ vring free descriptors */
> >
> > No need for this comment.
> >
> > Apart from that,
> >
> > Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >
> > > +    svq->num_free +=3D num;
> > > +
> > >      *len =3D used_elem.len;
> > >      return g_steal_pointer(&svq->desc_state[used_elem.id].elem);
> > >  }
> > > @@ -659,6 +665,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq,
> VirtIODevice *vdev,
> > >      svq->iova_tree =3D iova_tree;
> > >
> > >      svq->vring.num =3D virtio_queue_get_num(vdev,
> virtio_get_queue_index(vq));
> > > +    svq->num_free =3D svq->vring.num;
> > >      driver_size =3D vhost_svq_driver_area_size(svq);
> > >      device_size =3D vhost_svq_device_area_size(svq);
> > >      svq->vring.desc =3D qemu_memalign(qemu_real_host_page_size(),
> driver_size);
> > > diff --git a/hw/virtio/vhost-shadow-virtqueue.h
> b/hw/virtio/vhost-shadow-virtqueue.h
> > > index 926a4897b1..6efe051a70 100644
> > > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > > @@ -107,6 +107,9 @@ typedef struct VhostShadowVirtqueue {
> > >
> > >      /* Next head to consume from the device */
> > >      uint16_t last_used_idx;
> > > +
> > > +    /* Size of SVQ vring free descriptors */
> > > +    uint16_t num_free;
> > >  } VhostShadowVirtqueue;
> > >
> > >  bool vhost_svq_valid_features(uint64_t features, Error **errp);
> > > --
> > > 2.25.1
> > >
> >
> >
>

--000000000000d124dd05fb588325
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">QE applied this patch to do sanity testing on vhost-vdpa, =
there is no any regression problem.<div><br></div><div>Tested-by: Lei Yang =
&lt;<a href=3D"mailto:leiyang@redhat.com" target=3D"_blank">leiyang@redhat.=
com</a>&gt;<br></div></div><br><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, May 10, 2023 at 9:32=E2=80=AFAM Lei Yang &=
lt;<a href=3D"mailto:leiyang@redhat.com" target=3D"_blank">leiyang@redhat.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">QE applied this patch to do sanity testing on vhost-net, there is no<br>
any regression problem.<br>
<br>
Tested-by: Lei Yang &lt;<a href=3D"mailto:leiyang@redhat.com" target=3D"_bl=
ank">leiyang@redhat.com</a>&gt;<br>
<br>
<br>
<br>
On Tue, May 9, 2023 at 1:28=E2=80=AFAM Eugenio Perez Martin &lt;<a href=3D"=
mailto:eperezma@redhat.com" target=3D"_blank">eperezma@redhat.com</a>&gt; w=
rote:<br>
&gt;<br>
&gt; On Sat, May 6, 2023 at 5:01=E2=80=AFPM Hawkins Jiawei &lt;<a href=3D"m=
ailto:yin31149@gmail.com" target=3D"_blank">yin31149@gmail.com</a>&gt; wrot=
e:<br>
&gt; &gt;<br>
&gt; &gt; QEMU invokes vhost_svq_add() when adding a guest&#39;s element in=
to SVQ.<br>
&gt; &gt; In vhost_svq_add(), it uses vhost_svq_available_slots() to check<=
br>
&gt; &gt; whether QEMU can add the element into the SVQ. If there is<br>
&gt; &gt; enough space, then QEMU combines some out descriptors and<br>
&gt; &gt; some in descriptors into one descriptor chain, and add it into<br=
>
&gt; &gt; svq-&gt;vring.desc by vhost_svq_vring_write_descs().<br>
&gt; &gt;<br>
&gt; &gt; Yet the problem is that, `svq-&gt;shadow_avail_idx - svq-&gt;shad=
ow_used_idx`<br>
&gt; &gt; in vhost_svq_available_slots() return the number of occupied elem=
ents,<br>
&gt; &gt; or the number of descriptor chains, instead of the number of occu=
pied<br>
&gt; &gt; descriptors, which may cause wrapping in SVQ descriptor ring.<br>
&gt; &gt;<br>
&gt; &gt; Here is an example. In vhost_handle_guest_kick(), QEMU forwards<b=
r>
&gt; &gt; as many available buffers to device by virtqueue_pop() and<br>
&gt; &gt; vhost_svq_add_element(). virtqueue_pop() return a guest&#39;s ele=
ment,<br>
&gt; &gt; and use vhost_svq_add_elemnt(), a wrapper to vhost_svq_add(), to<=
br>
&gt; &gt; add this element into SVQ. If QEMU invokes virtqueue_pop() and<br=
>
&gt; &gt; vhost_svq_add_element() `svq-&gt;vring.num` times, vhost_svq_avai=
lable_slots()<br>
&gt; &gt; thinks QEMU just ran out of slots and everything should work fine=
.<br>
&gt; &gt; But in fact, virtqueue_pop() return `svq-vring.num` elements or<b=
r>
&gt; &gt; descriptor chains, more than `svq-&gt;vring.num` descriptors, due=
 to<br>
&gt; &gt; guest memory fragmentation, and this cause wrapping in SVQ descri=
ptor ring.<br>
&gt; &gt;<br>
&gt;<br>
&gt; The bug is valid even before marking the descriptors used. If the<br>
&gt; guest memory is fragmented, SVQ must add chains so it can try to add<b=
r>
&gt; more descriptors than possible.<br>
&gt;<br>
&gt; &gt; Therefore, this patch adds `num_free` field in VhostShadowVirtque=
ue<br>
&gt; &gt; structure, updates this field in vhost_svq_add() and<br>
&gt; &gt; vhost_svq_get_buf(), to record the number of free descriptors.<br=
>
&gt; &gt; Then we can avoid wrap in SVQ descriptor ring by refactoring<br>
&gt; &gt; vhost_svq_available_slots().<br>
&gt; &gt;<br>
&gt; &gt; Fixes: 100890f7ca (&quot;vhost: Shadow virtqueue buffers forwardi=
ng&quot;)<br>
&gt; &gt; Signed-off-by: Hawkins Jiawei &lt;<a href=3D"mailto:yin31149@gmai=
l.com" target=3D"_blank">yin31149@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 hw/virtio/vhost-shadow-virtqueue.c | 9 ++++++++-<br>
&gt; &gt;=C2=A0 hw/virtio/vhost-shadow-virtqueue.h | 3 +++<br>
&gt; &gt;=C2=A0 2 files changed, 11 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost=
-shadow-virtqueue.c<br>
&gt; &gt; index 8361e70d1b..e1c6952b10 100644<br>
&gt; &gt; --- a/hw/virtio/vhost-shadow-virtqueue.c<br>
&gt; &gt; +++ b/hw/virtio/vhost-shadow-virtqueue.c<br>
&gt; &gt; @@ -68,7 +68,7 @@ bool vhost_svq_valid_features(uint64_t features=
, Error **errp)<br>
&gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt;=C2=A0 static uint16_t vhost_svq_available_slots(const VhostShadow=
Virtqueue *svq)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 return svq-&gt;vring.num - (svq-&gt;shadow_avail_i=
dx - svq-&gt;shadow_used_idx);<br>
&gt; &gt; +=C2=A0 =C2=A0 return svq-&gt;num_free;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 /**<br>
&gt; &gt; @@ -263,6 +263,9 @@ int vhost_svq_add(VhostShadowVirtqueue *svq, =
const struct iovec *out_sg,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Update the size of SVQ vring free descriptors *=
/<br>
&gt; &gt; +=C2=A0 =C2=A0 svq-&gt;num_free -=3D ndescs;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 svq-&gt;desc_state[qemu_head].elem =3D elem;<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 svq-&gt;desc_state[qemu_head].ndescs =3D ndes=
cs;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 vhost_svq_kick(svq);<br>
&gt; &gt; @@ -450,6 +453,9 @@ static VirtQueueElement *vhost_svq_get_buf(Vh=
ostShadowVirtqueue *svq,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 svq-&gt;desc_next[last_used_chain] =3D svq-&g=
t;free_head;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 svq-&gt;free_head =3D <a href=3D"http://used_=
elem.id" rel=3D"noreferrer" target=3D"_blank">used_elem.id</a>;<br>
&gt; &gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Update the size of SVQ vring free descriptors *=
/<br>
&gt;<br>
&gt; No need for this comment.<br>
&gt;<br>
&gt; Apart from that,<br>
&gt;<br>
&gt; Acked-by: Eugenio P=C3=A9rez &lt;<a href=3D"mailto:eperezma@redhat.com=
" target=3D"_blank">eperezma@redhat.com</a>&gt;<br>
&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 svq-&gt;num_free +=3D num;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 *len =3D used_elem.len;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return g_steal_pointer(&amp;svq-&gt;desc_stat=
e[<a href=3D"http://used_elem.id" rel=3D"noreferrer" target=3D"_blank">used=
_elem.id</a>].elem);<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; @@ -659,6 +665,7 @@ void vhost_svq_start(VhostShadowVirtqueue *sv=
q, VirtIODevice *vdev,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 svq-&gt;iova_tree =3D iova_tree;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 svq-&gt;vring.num =3D virtio_queue_get_num(vd=
ev, virtio_get_queue_index(vq));<br>
&gt; &gt; +=C2=A0 =C2=A0 svq-&gt;num_free =3D svq-&gt;vring.num;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 driver_size =3D vhost_svq_driver_area_size(sv=
q);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 device_size =3D vhost_svq_device_area_size(sv=
q);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 svq-&gt;vring.desc =3D qemu_memalign(qemu_rea=
l_host_page_size(), driver_size);<br>
&gt; &gt; diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost=
-shadow-virtqueue.h<br>
&gt; &gt; index 926a4897b1..6efe051a70 100644<br>
&gt; &gt; --- a/hw/virtio/vhost-shadow-virtqueue.h<br>
&gt; &gt; +++ b/hw/virtio/vhost-shadow-virtqueue.h<br>
&gt; &gt; @@ -107,6 +107,9 @@ typedef struct VhostShadowVirtqueue {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* Next head to consume from the device */<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 uint16_t last_used_idx;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Size of SVQ vring free descriptors */<br>
&gt; &gt; +=C2=A0 =C2=A0 uint16_t num_free;<br>
&gt; &gt;=C2=A0 } VhostShadowVirtqueue;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 bool vhost_svq_valid_features(uint64_t features, Error **er=
rp);<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--000000000000d124dd05fb588325--


