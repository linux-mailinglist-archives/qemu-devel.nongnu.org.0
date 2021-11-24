Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A84C45B65B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 09:13:58 +0100 (CET)
Received: from localhost ([::1]:54442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpnPh-0006Lr-Dd
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 03:13:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mpnAu-0005No-W0
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:58:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mpnAt-0000mb-EZ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637740718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=txXLjYtwGkiGcjhvF2jIF9Bdw7T+PyC94hc0HMCIEOs=;
 b=YbaP+6p16teC9HAaOKNwT6ZcXtd/Kvb0iUudCBPHyCnrl0WJu8c5yz3ik+FOah5jgkb50F
 wuc7NShPxsbBlBOzE/t4E7VPpJFm5kS9Fjfuz1FbTo26z37LRA8jBcOsJXahBLKJ5rclF3
 iUTXNZZI8ny4TqJUzW41qtXfnH9h78E=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-AVv9SoDUOR60mhNXKiY8ig-1; Wed, 24 Nov 2021 02:58:35 -0500
X-MC-Unique: AVv9SoDUOR60mhNXKiY8ig-1
Received: by mail-lj1-f197.google.com with SMTP id
 s16-20020a2ea710000000b0021b674e9347so515156lje.8
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 23:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=txXLjYtwGkiGcjhvF2jIF9Bdw7T+PyC94hc0HMCIEOs=;
 b=E3CB5V+w/roOXWpe5tGV13sr5R7iisKITWQO8cantLB5AIwsf92uMxh3a/wOewl8jU
 PAjHnxWwJvhbhsDFHfOW+elDnca0E5NSi6FrWYFw+oiTOaog8A5qgX7l5XNCU2XIne34
 WHMihLw+uwTcgJWZizJcHw91BkgagukKWmWjLXmFQIZfadj3Qsyv23pGG8W+oouSDDMp
 E5YUnyQi4VyGOQRHAAJyDXzTIlhjt6eTGTjD/iIKekY4wK96qTHFsY0ODBeb8Piyahxc
 yPd78dUI+yBaglvTCoBesCzxTFjVKkXqpJdfaEC1fo2N7EhuztqRBOg/kIR52LS3uOw0
 N41A==
X-Gm-Message-State: AOAM533j8fxz02HfzbNrb1NYrUfrq9JBpgvmERPTT6FWrAmZ+ggt2Npd
 Kxo7oZjZrm1RJUviHifI48IqVutFP4hxQnIPdxp6UDxM2ndmfxNwGIOI/h/VFXnjqy0YpFQS/EC
 EylQd/QlLFUHzufC78XkRc9HlE5/fimg=
X-Received: by 2002:a05:6512:3b2b:: with SMTP id
 f43mr12640854lfv.629.1637740713852; 
 Tue, 23 Nov 2021 23:58:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEOWtvA8b7yMw+7H5C1pXSie6nuPyHYt8RR5GnaOVgxLI+sGIKmO4tpwtEiO5cgzOR1rwhAC142K11bapJIhM=
X-Received: by 2002:a05:6512:3b2b:: with SMTP id
 f43mr12640824lfv.629.1637740713597; 
 Tue, 23 Nov 2021 23:58:33 -0800 (PST)
MIME-Version: 1.0
References: <20211124043255.6050-1-jasowang@redhat.com>
 <20211124020118-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211124020118-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 24 Nov 2021 15:58:22 +0800
Message-ID: <CACGkMEsGX6y9cppLoGGsNtoJvbw4TLBVo2V0TFLOGr-JybXA-w@mail.gmail.com>
Subject: Re: [PATCH] virtio-balloon: correct used length
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Wed, Nov 24, 2021 at 3:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Nov 24, 2021 at 12:32:55PM +0800, Jason Wang wrote:
> > Spec said:
> >
> > "and len the total of bytes written into the buffer."
> >
> > For inflateq, deflateq and statsq, we don't process in_sg so the used
> > length should be zero. For free_page_vq, though the free pages are
> > supplied via in_sgs, zero used length should still be fine since
> > anyway driver is expected to use the length in this case and it
> > simplifies the error handling path.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
>
> I think for free page vq the point is that the pages are
> zeroed by hypervisor, so we must set used len accordingly. No?

I may miss something, I think it is used for clearing the dirty
bitmaps to avoid migrating unused pages, the zeroing is not needed.

Thanks

>
> > ---
> >  hw/virtio/virtio-balloon.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > index c6962fcbfe..3e52daa793 100644
> > --- a/hw/virtio/virtio-balloon.c
> > +++ b/hw/virtio/virtio-balloon.c
> > @@ -231,7 +231,7 @@ static void balloon_stats_poll_cb(void *opaque)
> >          return;
> >      }
> >
> > -    virtqueue_push(s->svq, s->stats_vq_elem, s->stats_vq_offset);
> > +    virtqueue_push(s->svq, s->stats_vq_elem, 0);
> >      virtio_notify(vdev, s->svq);
> >      g_free(s->stats_vq_elem);
> >      s->stats_vq_elem = NULL;
> > @@ -438,7 +438,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> >              memory_region_unref(section.mr);
> >          }
> >
> > -        virtqueue_push(vq, elem, offset);
> > +        virtqueue_push(vq, elem, 0);
> >          virtio_notify(vdev, vq);
> >          g_free(elem);
> >          virtio_balloon_pbp_free(&pbp);
> > @@ -549,7 +549,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
> >      }
> >
> >  out:
> > -    virtqueue_push(vq, elem, 1);
> > +    virtqueue_push(vq, elem, 0);
> >      g_free(elem);
> >      return ret;
> >  }
> > --
> > 2.25.1
>


