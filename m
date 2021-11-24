Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA3645B685
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 09:28:19 +0100 (CET)
Received: from localhost ([::1]:45336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpnda-0002Sg-Dt
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 03:28:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mpnb2-0000Ng-Rb
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 03:25:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mpnay-00035H-Ef
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 03:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637742334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AYx0raBMykIjvC2YSuicewNUXtukIz29nBwFO3zOqEk=;
 b=Xv2UxgDrKELr2vFrQijLBxebKeqpXfYIWCBgNUuYMMGC5/lF9hG3sZUWUzPsjxOVPG89ry
 iQJJbU82pcT+kXmsQBOkCxip/zrLSWUzvGrsXFWmxxNFf1a7rlpqwx0DCFG1YwP677y1SV
 AoPiX5aG9fU2b76LuFv5DrYm6sanHoI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-hWikLCORMySySsopImRS5Q-1; Wed, 24 Nov 2021 03:25:33 -0500
X-MC-Unique: hWikLCORMySySsopImRS5Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 r2-20020adfe682000000b00198af042b0dso273102wrm.23
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 00:25:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AYx0raBMykIjvC2YSuicewNUXtukIz29nBwFO3zOqEk=;
 b=I4IXanH7tLAsQeMs0aiXiC5w2cLgNm5smELbh8V2Pyddcv3a/AjXNJuzTNsEc1hbK3
 uGGlCnDFMOq1k6C0hLm0lpeCexzjWeg8LYEPbFXXom9YYVVuyoBmLstLg3d/fyqznC/4
 0+qiNOeOFOTaimcA12Z+N9QbFpzeHH0e7ejifMUTIHYzDyNv/5YRabnEb5BW6C+dZ9Kh
 fqp7WvUPLdtmp7f1ef7oK2Xpubuh0hlK/Q12qLVMKsMnEIyx1gI9KvikdRRIqPVHoL+J
 BoLAa2L8oZRl+4FMGz8fzzBE0jaLSJm0VhNO/HzOdBsav29TBUzoGWKpQ+Q/AVEmC78F
 KBoQ==
X-Gm-Message-State: AOAM531t8RC/ORRui4ww9CtWly31N0zOLEmO3nmOLlUq3atcIYWuo7Gq
 Q0n4HFcKCD35nqlZMcnPviWo5HhIE4Vf9HpIVDwjhgXks+Fzzvahz7kHacGeQ1NeLuDnZVwi1Rx
 K2tTftbgdQ/9u6Bk=
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr16324063wrs.26.1637742331696; 
 Wed, 24 Nov 2021 00:25:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSAmkpqO3SJaZ6lJsdblLPU1Fg6FfABGagG+o5cKK7eG3SBM7ExAKoMmCxAsoVBza7aukaAg==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr16324039wrs.26.1637742331475; 
 Wed, 24 Nov 2021 00:25:31 -0800 (PST)
Received: from redhat.com ([2.55.144.93])
 by smtp.gmail.com with ESMTPSA id x1sm14342469wru.40.2021.11.24.00.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 00:25:31 -0800 (PST)
Date: Wed, 24 Nov 2021 03:25:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] virtio-balloon: correct used length
Message-ID: <20211124032456-mutt-send-email-mst@kernel.org>
References: <20211124043255.6050-1-jasowang@redhat.com>
 <20211124020118-mutt-send-email-mst@kernel.org>
 <CACGkMEsGX6y9cppLoGGsNtoJvbw4TLBVo2V0TFLOGr-JybXA-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsGX6y9cppLoGGsNtoJvbw4TLBVo2V0TFLOGr-JybXA-w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Michael Ellerman <mpe@ellerman.id.au>, qemu-devel <qemu-devel@nongnu.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 03:58:22PM +0800, Jason Wang wrote:
> On Wed, Nov 24, 2021 at 3:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Nov 24, 2021 at 12:32:55PM +0800, Jason Wang wrote:
> > > Spec said:
> > >
> > > "and len the total of bytes written into the buffer."
> > >
> > > For inflateq, deflateq and statsq, we don't process in_sg so the used
> > > length should be zero. For free_page_vq, though the free pages are
> > > supplied via in_sgs, zero used length should still be fine since
> > > anyway driver is expected to use the length in this case and it
> > > simplifies the error handling path.
> > >
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> >
> > I think for free page vq the point is that the pages are
> > zeroed by hypervisor, so we must set used len accordingly. No?
> 
> I may miss something, I think it is used for clearing the dirty
> bitmaps to avoid migrating unused pages, the zeroing is not needed.
> 
> Thanks

And, once the page is migrated, it's value on destination may differ
from one on source.

> >
> > > ---
> > >  hw/virtio/virtio-balloon.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > > index c6962fcbfe..3e52daa793 100644
> > > --- a/hw/virtio/virtio-balloon.c
> > > +++ b/hw/virtio/virtio-balloon.c
> > > @@ -231,7 +231,7 @@ static void balloon_stats_poll_cb(void *opaque)
> > >          return;
> > >      }
> > >
> > > -    virtqueue_push(s->svq, s->stats_vq_elem, s->stats_vq_offset);
> > > +    virtqueue_push(s->svq, s->stats_vq_elem, 0);
> > >      virtio_notify(vdev, s->svq);
> > >      g_free(s->stats_vq_elem);
> > >      s->stats_vq_elem = NULL;
> > > @@ -438,7 +438,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> > >              memory_region_unref(section.mr);
> > >          }
> > >
> > > -        virtqueue_push(vq, elem, offset);
> > > +        virtqueue_push(vq, elem, 0);
> > >          virtio_notify(vdev, vq);
> > >          g_free(elem);
> > >          virtio_balloon_pbp_free(&pbp);
> > > @@ -549,7 +549,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
> > >      }
> > >
> > >  out:
> > > -    virtqueue_push(vq, elem, 1);
> > > +    virtqueue_push(vq, elem, 0);
> > >      g_free(elem);
> > >      return ret;
> > >  }
> > > --
> > > 2.25.1
> >


