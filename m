Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332AA3E9EBA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 08:44:43 +0200 (CEST)
Received: from localhost ([::1]:40870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE4SH-00009u-On
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 02:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mE4RX-0007uI-Bi
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 02:43:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mE4RU-0003QF-1P
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 02:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628750629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OxK2f2dOVaEVKIiMGORNltMConWOt80seq/4tOJoFCE=;
 b=RnJ0wk+1YUejJibBc/v0odHWwOGCyJ7OvnO8AqXfn/QIOOzB1LYLyvAMTJ+WpuP7xVu5P1
 aNkYg5SL4V7pmdzKNfIVhNm47CyB1fAhBMoKsy9xy2YiTtE8CVJtyj2qg0ZIUoT8S5MolB
 vEhTxJuiUAcfe/w9V/vC95v6rE4yMlo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-yqMrAo0jMsS4NzVvfE89Xw-1; Thu, 12 Aug 2021 02:43:48 -0400
X-MC-Unique: yqMrAo0jMsS4NzVvfE89Xw-1
Received: by mail-qv1-f72.google.com with SMTP id
 w10-20020a0cfc4a0000b0290335dd22451dso2794606qvp.5
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 23:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OxK2f2dOVaEVKIiMGORNltMConWOt80seq/4tOJoFCE=;
 b=C3yUIugxiOuQgyfkCXfmrhPWFKgwrU1Ta5qcquGRzuNUe/7TiWENXeevxM+JD0qDL2
 1+SaAlZYTlHyMbiEZCoDFvW/rw9ki4+8mMxoczw2a2MsEHH+tXGNYwHaP79xYw4XZJmG
 MQihy/dbc2+02g9l/m6JsADvZgEjTpooiRnrcHUg/6dgoaBAzQKp7lR0Aibp5+EcCiHn
 xm4uhFT3aQJRPChMYhB4jTW3nUiRxp4DjfJXATt8QIik96G0mnwO+AFelR+jgZT0B30G
 FBU2NooGACbWhNWaIvCdlPMiv53i0WBHRTQ0B1NfyEA3e5xjSSGtl+kQN1xoWbdcQFvQ
 yDDw==
X-Gm-Message-State: AOAM532bnitpmBV4R9wrR0x67pnAUwaCdjitgZqP+VaazTjKt5Xoatec
 4agw8aVxXwD9EyuK2DGa0yqqw8UFKh4lAdKTXTfPE8ayuAg3fKW8XtliSSa1TeLybUbQaJQCg1s
 sCkjKRd7JrYaLvvGz31Kehc9NYKYDS54=
X-Received: by 2002:ac8:4e83:: with SMTP id 3mr2457082qtp.221.1628750628149;
 Wed, 11 Aug 2021 23:43:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwObkbJWnDKfmt24xaQ/SFSfIuY/jMOO5MG6Qw9vI6tpEFHy2R7tDVi/V/rzyBmoaVzsrYs1Dx0Ho8w2xeNtyQ=
X-Received: by 2002:ac8:4e83:: with SMTP id 3mr2457070qtp.221.1628750627958;
 Wed, 11 Aug 2021 23:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210811163211.185870-1-eperezma@redhat.com>
 <CACGkMEsP1QFh16qLDyXmPp4-NgLA-7HNZ7Far2sQqjr9rXoorw@mail.gmail.com>
In-Reply-To: <CACGkMEsP1QFh16qLDyXmPp4-NgLA-7HNZ7Far2sQqjr9rXoorw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 12 Aug 2021 08:43:12 +0200
Message-ID: <CAJaqyWcZiosVZnpepsOWBPFTypmofQpaGHpaCPFmD5B5bvw2iA@mail.gmail.com>
Subject: Re: [PATCH v2] vhost-vdpa: Do not send empty IOTLB update batches
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eli Cohen <elic@nvidia.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 8:16 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Aug 12, 2021 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> >
> > With the introduction of the batch hinting, meaningless batches can be
> > created with no IOTLB updates if the memory region was skipped by
> > vhost_vdpa_listener_skipped_section. This is the case of host notifiers
> > memory regions, device un/realize, and others. This causes the vdpa
> > device to receive dma mapping settings with no changes, a possibly
> > expensive operation for nothing.
> >
> > To avoid that, VHOST_IOTLB_BATCH_BEGIN hint is delayed until we have a
> > meaningful (not skipped section) mapping or unmapping operation, and
> > VHOST_IOTLB_BATCH_END is not written unless at least one of _UPDATE /
> > _INVALIDATE has been issued.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/hw/virtio/vhost-vdpa.h |  1 +
> >  hw/virtio/vhost-vdpa.c         | 50 ++++++++++++++++++++++++++--------
> >  2 files changed, 39 insertions(+), 12 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index e98e327f12..6538572a6f 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -23,6 +23,7 @@ typedef struct vhost_vdpa {
> >      int device_fd;
> >      int index;
> >      uint32_t msg_type;
> > +    size_t n_mr_updated;
> >      MemoryListener listener;
> >      struct vhost_dev *dev;
> >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 6ce94a1f4d..512fa18d68 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -89,19 +89,13 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *=
v, hwaddr iova,
> >      return ret;
> >  }
> >
> > -static void vhost_vdpa_listener_begin(MemoryListener *listener)
> > +static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
> >  {
> > -    struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa,=
 listener);
> > -    struct vhost_dev *dev =3D v->dev;
> > -    struct vhost_msg_v2 msg =3D {};
> >      int fd =3D v->device_fd;
> > -
> > -    if (!(dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH)))=
 {
> > -        return;
> > -    }
> > -
> > -    msg.type =3D v->msg_type;
> > -    msg.iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN;
> > +    struct vhost_msg_v2 msg =3D {
> > +        .type =3D v->msg_type,
> > +        .iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN,
> > +    };
> >
> >      if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> >          error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> > @@ -109,6 +103,25 @@ static void vhost_vdpa_listener_begin(MemoryListen=
er *listener)
> >      }
> >  }
> >
> > +static bool vhost_vdpa_iotlb_batch_is_started(const struct vhost_vdpa =
*v)
> > +{
> > +    return v->n_mr_updated !=3D 0;
> > +}
> > +
> > +static void vhost_vdpa_iotlb_batch_begin_once(struct vhost_vdpa *v)
> > +{
> > +    if (!vhost_vdpa_iotlb_batch_is_started(v)) {
> > +        vhost_vdpa_listener_begin_batch(v);
> > +    }
> > +
> > +    v->n_mr_updated++;
> > +}
> > +
> > +static void vhost_vdpa_iotlb_batch_reset(struct vhost_vdpa *v)
> > +{
> > +    v->n_mr_updated =3D 0;
> > +}
> > +
> >  static void vhost_vdpa_listener_commit(MemoryListener *listener)
> >  {
> >      struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa,=
 listener);
> > @@ -120,6 +133,10 @@ static void vhost_vdpa_listener_commit(MemoryListe=
ner *listener)
> >          return;
> >      }
> >
> > +    if (vhost_vdpa_iotlb_batch_is_started(v)) {
> > +        return;
> > +    }
> > +
> >      msg.type =3D v->msg_type;
> >      msg.iotlb.type =3D VHOST_IOTLB_BATCH_END;
> >
> > @@ -127,6 +144,8 @@ static void vhost_vdpa_listener_commit(MemoryListen=
er *listener)
> >          error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> >                       fd, errno, strerror(errno));
> >      }
> > +
> > +    vhost_vdpa_iotlb_batch_reset(v);
> >  }
> >
> >  static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> > @@ -170,6 +189,10 @@ static void vhost_vdpa_listener_region_add(MemoryL=
istener *listener,
> >
> >      llsize =3D int128_sub(llend, int128_make64(iova));
> >
> > +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH))=
 {
>
> Let's move this in to vhost_vdpa_iotlb_batch_begin_once()?
>

Sure

> > +        vhost_vdpa_iotlb_batch_begin_once(v);
> > +    }
> > +
> >      ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> >                               vaddr, section->readonly);
> >      if (ret) {
> > @@ -221,6 +244,10 @@ static void vhost_vdpa_listener_region_del(MemoryL=
istener *listener,
> >
> >      llsize =3D int128_sub(llend, int128_make64(iova));
> >
> > +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH))=
 {
> > +        vhost_vdpa_iotlb_batch_begin_once(v);
> > +    }
> > +
>
> Do we need to check vhost_vdpa_iotlb_batch_is_started() in the .commit?
>

I don't follow you here. It's that comment in this position of the
patch for a reason?

That checking is the one that allows qemu to skip the IOTLB_END write.

> Others look good.
>
> Thanks
>
> >      ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> >      if (ret) {
> >          error_report("vhost_vdpa dma unmap error!");
> > @@ -234,7 +261,6 @@ static void vhost_vdpa_listener_region_del(MemoryLi=
stener *listener,
> >   * depends on the addnop().
> >   */
> >  static const MemoryListener vhost_vdpa_memory_listener =3D {
> > -    .begin =3D vhost_vdpa_listener_begin,
> >      .commit =3D vhost_vdpa_listener_commit,
> >      .region_add =3D vhost_vdpa_listener_region_add,
> >      .region_del =3D vhost_vdpa_listener_region_del,
> > --
> > 2.27.0
> >
>


