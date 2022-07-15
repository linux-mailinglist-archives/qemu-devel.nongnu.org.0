Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC30575B14
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 07:43:44 +0200 (CEST)
Received: from localhost ([::1]:53180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCE75-0004XC-7x
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 01:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCE3A-0001iE-Fj
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 01:39:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCE36-0005K7-Ff
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 01:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657863575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQu5cUHcf3lz3t+UPpTW/aX+ZBBalBFdUb3pWRgi2eo=;
 b=NyVzdAXDirWXWw+sDMtXg4Qt0ZD7GOaP0gvKbMde+SS/dRKJF/mm1oGUDtymruaSdTD+oN
 5zGewpDOLPg5kMPH5sgw+jsK5IWQjBQts8nOTxoAm99oICawvJTlpsVRQVUssELuzuLbRk
 29iJkJ8pPP8PK5k3pIwTvTBPheCTURc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-L8ktm4KqPGqpu0bIAb81uA-1; Fri, 15 Jul 2022 01:39:34 -0400
X-MC-Unique: L8ktm4KqPGqpu0bIAb81uA-1
Received: by mail-qt1-f197.google.com with SMTP id
 m6-20020ac866c6000000b002f52f9fb4edso3032626qtp.19
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 22:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iQu5cUHcf3lz3t+UPpTW/aX+ZBBalBFdUb3pWRgi2eo=;
 b=TmsyP3gP10eirt7R6//KXad1j9rcmC696Fc2aXkW7S3fzbka67NtPgAepi7j1fDg/s
 AuD8Zwy4drMZDl0zilg98M4iFX5cvepGRSTHAoyCsd4Q0WHXP2uJYm+STGGq3ft0SrIB
 gCIgfABl7Xg7J4enT3FWLZFb4PqgrZ1gJlCBv0oz1rvi5RlJu1qI7tfvaIM37JpRVOYn
 rncJRQU8I6v1++9nLEyn3S/XtCE9O8pv5F9DHJLANJ4d+InYz60kVNfIOm4zDajeESyu
 RubqeO8ufNe3f2GaGt6288B/giQEgqVJcBoftyFzslYzgf9cc3mYmLEtzEU11d3bmVrM
 L95w==
X-Gm-Message-State: AJIora/RfpJXvQ3LVDjLWB4tcpkDxxgVGEPpb2OGr+ynuG21DXFniggT
 6LlU3ipvMAerfAg9ecXcfGtIyUn9fdysI8dpNPPzfZb8jhbtmhUxFVL/OuumjEDC3ZoQNOV1MyD
 d+j+8JSEZCZMJi7f8H9i4QRSBJK8xOnQ=
X-Received: by 2002:a05:622a:14cc:b0:31b:f650:16af with SMTP id
 u12-20020a05622a14cc00b0031bf65016afmr10833644qtx.186.1657863572903; 
 Thu, 14 Jul 2022 22:39:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1stD/CA/EniCMDHOeeTyDMsjKwo0ipCXP5RXKA7LxkfBvDmGuzxrGrU4URxpgCyWDxsViZZm2J2BpQGE+lEZpQ=
X-Received: by 2002:a05:622a:14cc:b0:31b:f650:16af with SMTP id
 u12-20020a05622a14cc00b0031bf65016afmr10833636qtx.186.1657863572696; Thu, 14
 Jul 2022 22:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-13-eperezma@redhat.com>
 <CACGkMEuHR_R6Jxjvznv1T-d6SGngsYQyfhCNw8-HoTb3FLcX0w@mail.gmail.com>
In-Reply-To: <CACGkMEuHR_R6Jxjvznv1T-d6SGngsYQyfhCNw8-HoTb3FLcX0w@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 15 Jul 2022 07:38:56 +0200
Message-ID: <CAJaqyWfwODXUr_z3Qzp7_MSbEamG0W8MxUtxn1kV-NE_qfBi-A@mail.gmail.com>
Subject: Re: [PATCH v2 12/19] vhost: add vhost_svq_poll
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Jul 15, 2022 at 5:59 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> >
> > It allows the Shadow Control VirtQueue to wait for the device to use th=
e
> > available buffers.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-shadow-virtqueue.h |  1 +
> >  hw/virtio/vhost-shadow-virtqueue.c | 22 ++++++++++++++++++++++
> >  2 files changed, 23 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 1692541cbb..b5c6e3b3b4 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -89,6 +89,7 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *svq, c=
onst SVQElement *elem,
> >  int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_s=
g,
> >                    size_t out_num, const struct iovec *in_sg, size_t in=
_num,
> >                    SVQElement *elem);
> > +size_t vhost_svq_poll(VhostShadowVirtqueue *svq);
> >
> >  void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick=
_fd);
> >  void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd)=
;
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 5244896358..31a267f721 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -486,6 +486,28 @@ static void vhost_svq_flush(VhostShadowVirtqueue *=
svq,
> >      } while (!vhost_svq_enable_notification(svq));
> >  }
> >
> > +/**
> > + * Poll the SVQ for one device used buffer.
> > + *
> > + * This function race with main event loop SVQ polling, so extra
> > + * synchronization is needed.
> > + *
> > + * Return the length written by the device.
> > + */
> > +size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
> > +{
> > +    do {
> > +        uint32_t len;
> > +        SVQElement *elem =3D vhost_svq_get_buf(svq, &len);
> > +        if (elem) {
> > +            return len;
> > +        }
> > +
> > +        /* Make sure we read new used_idx */
> > +        smp_rmb();
>
> There's already one smp_rmb(0 in vhost_svq_get_buf(). So this seems usele=
ss?
>

That rmb is after checking for new entries with (vq->last_used_idx !=3D
svq->shadow_used_idx) , to avoid reordering used_idx read with the
actual used entry. So my understanding is
that the compiler is free to skip that check within the while loop.

Maybe the right solution is to add it in vhost_svq_more_used after the
condition (vq->last_used_idx !=3D svq->shadow_used_idx) is false?

Thanks!


> Thanks
>
> > +    } while (true);
> > +}
> > +
> >  /**
> >   * Forward used buffers.
> >   *
> > --
> > 2.31.1
> >
>


