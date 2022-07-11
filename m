Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC86E57098F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 19:55:02 +0200 (CEST)
Received: from localhost ([::1]:38800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAxcb-000240-8M
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 13:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oAxao-0000YX-8D
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 13:53:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oAxak-0003no-A6
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 13:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657561985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=babD7UDcU1gYaaaM965cIigQSR9TILDl64vr9k0aGjc=;
 b=gXt2kNgYFmSb1aiL/D3psO6FmZD6QitAN8RXUY5yMQQHt2VvwDlnMdd9YskpgiUA/KE4gC
 gPsBAezgJbY3mPnu8Vcynu8c5mPCEQvbAJf6YnibNJ5XeNHtlmbwkrxtqgjL9NB30zJGGc
 Q2B6VmbuNWkPJg2WUAw1QJUfvkUFMwA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-UL3r4YBbPTSvzPhjDdav_w-1; Mon, 11 Jul 2022 13:52:52 -0400
X-MC-Unique: UL3r4YBbPTSvzPhjDdav_w-1
Received: by mail-qk1-f198.google.com with SMTP id
 bm2-20020a05620a198200b006a5dac37fa2so5875557qkb.16
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 10:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=babD7UDcU1gYaaaM965cIigQSR9TILDl64vr9k0aGjc=;
 b=tBufZkDg4aLFFXefOXDgJvexac7dyVoJTpAxWgeEPvy3KdgWyZ+w7FU7euguVs4qfx
 0Ta5KAxry/MywxOm8AnEvehrUGR2i7sFDpnUcEUajSGs/mh1LDgl0fRWNiUPYslYaclp
 QF3f8FuzfAsG3lWRGiZZfMc59jIIgPNcHme3/38KejT2JxLwLSm/fbwDaYV28riTSrf2
 aWCJRCd5LRlolhXJlS9G6POVvCh+Vh28N77H2/MtijykqDL0ufl8PEc/xe56BQwJnm95
 Roekm0M4Q8I2N6Uyk/3u2pcVBoYMEIhMo4FfPqgqmQep3EXdh0CzdJppuvc4vzpwzFx9
 SFSQ==
X-Gm-Message-State: AJIora9Gnu2QyXOmhhNdsxKeq8EjGzELirIvqQcpfPmGsPl98sZ2JJSB
 tgBO7dAwKGvoEGpwPGpjnpTbAFictUgcxR4aLRGgQrX6VU4p4stDM3FGAN/SSIbmSe/AYPKR3yb
 K52FjB46VJ+yppPnNysjkV9SNOkD8TgE=
X-Received: by 2002:a05:622a:104c:b0:31e:b177:6bf0 with SMTP id
 f12-20020a05622a104c00b0031eb1776bf0mr7110718qte.582.1657561969750; 
 Mon, 11 Jul 2022 10:52:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vzMHV0gXe+t+qTz7Jh9DbTsHuU9Htxg+iR8MKsEaFmE3o2usaMVyUGRzH/CjL9xTUjG1TMBC5huXt71/bgzRE=
X-Received: by 2002:a05:622a:104c:b0:31e:b177:6bf0 with SMTP id
 f12-20020a05622a104c00b0031eb1776bf0mr7110697qte.582.1657561969510; Mon, 11
 Jul 2022 10:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-15-eperezma@redhat.com>
 <cac07706-7753-c3bd-e3f7-5ef48e190f1d@redhat.com>
In-Reply-To: <cac07706-7753-c3bd-e3f7-5ef48e190f1d@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 11 Jul 2022 19:52:13 +0200
Message-ID: <CAJaqyWdcr3VDL0cM7kSe_4uTzvsfZd_dYkqdZSo5ptQkAmX3UA@mail.gmail.com>
Subject: Re: [RFC PATCH v9 14/23] vhost: add vhost_svq_poll
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

On Mon, Jul 11, 2022 at 11:19 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/7 02:39, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > It allows the Shadow Control VirtQueue to wait the device to use the co=
mmands
> > that restore the net device state after a live migration.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  1 +
> >   hw/virtio/vhost-shadow-virtqueue.c | 54 ++++++++++++++++++++++++++++-=
-
> >   2 files changed, 52 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index d01d2370db..c8668fbdd6 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -100,6 +100,7 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
> >                            const VirtQueueElement *elem, uint32_t len);
> >   int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *i=
ov,
> >                        size_t out_num, size_t in_num, void *opaque);
> > +ssize_t vhost_svq_poll(VhostShadowVirtqueue *svq);
> >   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kic=
k_fd);
> >   void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd=
);
> >   void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index bd9e34b413..ed7f1d0bc9 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -10,6 +10,8 @@
> >   #include "qemu/osdep.h"
> >   #include "hw/virtio/vhost-shadow-virtqueue.h"
> >
> > +#include <glib/gpoll.h>
> > +
> >   #include "qemu/error-report.h"
> >   #include "qapi/error.h"
> >   #include "qemu/main-loop.h"
> > @@ -490,10 +492,11 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *sv=
q,
> >       }
> >   }
> >
> > -static void vhost_svq_flush(VhostShadowVirtqueue *svq,
> > -                            bool check_for_avail_queue)
> > +static size_t vhost_svq_flush(VhostShadowVirtqueue *svq,
> > +                              bool check_for_avail_queue)
> >   {
> >       VirtQueue *vq =3D svq->vq;
> > +    size_t ret =3D 0;
> >
> >       /* Forward as many used buffers as possible. */
> >       do {
> > @@ -510,7 +513,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *s=
vq,
> >                            "More than %u used buffers obtained in a %u =
size SVQ",
> >                            i, svq->vring.num);
> >                   virtqueue_flush(vq, svq->vring.num);
> > -                return;
> > +                return ret;
> >               }
> >
> >               svq_elem =3D vhost_svq_get_buf(svq, &len);
> > @@ -520,6 +523,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *s=
vq,
> >
> >               elem =3D g_steal_pointer(&svq_elem.opaque);
> >               virtqueue_fill(vq, elem, len, i++);
> > +            ret++;
> >           }
> >
> >           virtqueue_flush(vq, i);
> > @@ -533,6 +537,50 @@ static void vhost_svq_flush(VhostShadowVirtqueue *=
svq,
> >               vhost_handle_guest_kick(svq);
> >           }
> >       } while (!vhost_svq_enable_notification(svq));
> > +
> > +    return ret;
> > +}
> > +
> > +/**
> > + * Poll the SVQ for device used buffers.
> > + *
> > + * This function race with main event loop SVQ polling, so extra
> > + * synchronization is needed.
> > + *
> > + * Return the number of descriptors read from the device.
> > + */
> > +ssize_t vhost_svq_poll(VhostShadowVirtqueue *svq)
> > +{
> > +    int fd =3D event_notifier_get_fd(&svq->hdev_call);
> > +    GPollFD poll_fd =3D {
> > +        .fd =3D fd,
> > +        .events =3D G_IO_IN,
> > +    };
> > +    assert(fd >=3D 0);
> > +    int r =3D g_poll(&poll_fd, 1, -1);
>
>
> Any reason we can't simply (busy) polling the used ring here? It might
> help to reduce the latency (and it is what kernel driver uses).
>

Yes, I'll change to a busy polling. I forgot to change it.

Thanks!

> Thanks
>
>
> > +
> > +    if (unlikely(r < 0)) {
> > +        error_report("Cannot poll device call fd "G_POLLFD_FORMAT": (%=
d) %s",
> > +                     poll_fd.fd, errno, g_strerror(errno));
> > +        return -errno;
> > +    }
> > +
> > +    if (r =3D=3D 0) {
> > +        return 0;
> > +    }
> > +
> > +    if (unlikely(poll_fd.revents & ~(G_IO_IN))) {
> > +        error_report(
> > +            "Error polling device call fd "G_POLLFD_FORMAT": revents=
=3D%d",
> > +            poll_fd.fd, poll_fd.revents);
> > +        return -1;
> > +    }
> > +
> > +    /*
> > +     * Max return value of vhost_svq_flush is (uint16_t)-1, so it's sa=
fe to
> > +     * convert to ssize_t.
> > +     */
> > +    return vhost_svq_flush(svq, false);
> >   }
> >
> >   /**
>


