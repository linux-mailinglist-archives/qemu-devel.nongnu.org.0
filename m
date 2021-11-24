Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C755945B748
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:20:26 +0100 (CET)
Received: from localhost ([::1]:59500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpoS0-0004y4-Ee
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:20:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mpoP5-0002iQ-Th
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:17:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mpoOw-0002xJ-H2
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:17:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637745433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pec9nAFWnLOtGVdnzXNxYTK1bht2OU7RAgR+m7QaKcY=;
 b=bt3C6Nb7FZmlJf6YubyRfDYWR9xh+PEOOW0SFV+e1i1YsAqf2s2tJDjLSPawIY91WLUtCA
 Bm2VXaS5LvGrtWJpCH/IOn01osJjBjvVoMoTUGiNoGAJPLho1Dy5MMKa+tTESGfw2tbm8w
 tyBcMTUXG3faKNcfmRdjj9td12GuFsk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-_mAJWFKuOWOFIPVyfS2Zhg-1; Wed, 24 Nov 2021 04:17:11 -0500
X-MC-Unique: _mAJWFKuOWOFIPVyfS2Zhg-1
Received: by mail-ed1-f72.google.com with SMTP id
 i19-20020a05640242d300b003e7d13ebeedso1705895edc.7
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pec9nAFWnLOtGVdnzXNxYTK1bht2OU7RAgR+m7QaKcY=;
 b=XYxQ6QmkjAofgLZNR1ViF8ToTBoG+4cCDeMVQNDu806BxxQJWVlFl1VTvjNbGnWlv1
 8U2q1qCnEMy1YYVMAZmgpX8JQGZ6543cZXIgUEEGitOXpbOp+o1MUM1cOfSl4T3Bo9dV
 ysJqxT8PFZzCmT9w/Wa6ts7ygrPTiGX0JxJCO4JulT0YvS8wnu1LgVOyKzRstH54K3xj
 SeVuEZDdJZi7jtGF9unf5xX7Op92+tnre8jzEjKp0FHPdTfmm6QO/GxJKp8+4kEivwWm
 iS5Z+/Dfw81NL7YztavSYexKDTrnQ6uSsotx9bvsXc+BkowrtCunYCCQ5R8HEjJQ1Clr
 23Sw==
X-Gm-Message-State: AOAM53383qlVujFmOeXXyRUl6EctFLbVnBSt/DeYNSsHp9cXTsv4iS1t
 6YZ/18d1pw72q/6uiozQ96r/rDi+hRpj7XOkCejOet+3AZx6eOqU1+eZrcunHjOcpp9z2/UGYYk
 zsfeN0i/SeMWCdHg=
X-Received: by 2002:a05:6402:438a:: with SMTP id
 o10mr21688523edc.353.1637745430095; 
 Wed, 24 Nov 2021 01:17:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw00SRXEwgkiOcQMjsjzYbTWcBhY49kdgY5S099JxQBAxeXaI6Ghd0NkZEzRZQR8GpupzXXvg==
X-Received: by 2002:a05:6402:438a:: with SMTP id
 o10mr21688483edc.353.1637745429889; 
 Wed, 24 Nov 2021 01:17:09 -0800 (PST)
Received: from redhat.com ([2.55.144.93])
 by smtp.gmail.com with ESMTPSA id ar2sm6471147ejc.20.2021.11.24.01.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:17:09 -0800 (PST)
Date: Wed, 24 Nov 2021 04:17:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] virtio-balloon: correct used length
Message-ID: <20211124041604-mutt-send-email-mst@kernel.org>
References: <20211124043255.6050-1-jasowang@redhat.com>
 <20211124020118-mutt-send-email-mst@kernel.org>
 <CACGkMEsGX6y9cppLoGGsNtoJvbw4TLBVo2V0TFLOGr-JybXA-w@mail.gmail.com>
 <20211124032456-mutt-send-email-mst@kernel.org>
 <CACGkMEuHkM7DDN=xoJ=WHki+6SyB_cUfMr7q0yawYucvf3yBWQ@mail.gmail.com>
 <CACGkMEuiUj_d31fcQxKW0MBZQm7sDsYGZw2c5zo6Pt9cVTZWRA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEuiUj_d31fcQxKW0MBZQm7sDsYGZw2c5zo6Pt9cVTZWRA@mail.gmail.com>
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

On Wed, Nov 24, 2021 at 04:32:06PM +0800, Jason Wang wrote:
> On Wed, Nov 24, 2021 at 4:28 PM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Nov 24, 2021 at 4:25 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Wed, Nov 24, 2021 at 03:58:22PM +0800, Jason Wang wrote:
> > > > On Wed, Nov 24, 2021 at 3:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Wed, Nov 24, 2021 at 12:32:55PM +0800, Jason Wang wrote:
> > > > > > Spec said:
> > > > > >
> > > > > > "and len the total of bytes written into the buffer."
> > > > > >
> > > > > > For inflateq, deflateq and statsq, we don't process in_sg so the used
> > > > > > length should be zero. For free_page_vq, though the free pages are
> > > > > > supplied via in_sgs, zero used length should still be fine since
> > > > > > anyway driver is expected to use the length in this case and it
> > > > > > simplifies the error handling path.
> > > > > >
> > > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > >
> > > > > I think for free page vq the point is that the pages are
> > > > > zeroed by hypervisor, so we must set used len accordingly. No?
> > > >
> > > > I may miss something, I think it is used for clearing the dirty
> > > > bitmaps to avoid migrating unused pages, the zeroing is not needed.
> > > >
> > > > Thanks
> > >
> > > And, once the page is migrated, it's value on destination may differ
> > > from one on source.
> >
> > Right, I will fix this in the next version.
> >
> > Thanks
> 
> Btw in the get_free_page_hints() I see this:
> 
>     if (elem->in_num && dev->free_page_hint_status == FREE_PAGE_HINT_S_START) {
> qemu_guest_free_page_hint(elem->in_sg[0].iov_base,
>                                   elem->in_sg[0].iov_len);
>     }
> 
> It looks like only the first in sg is used, it looks like a bug?
> 
> Thanks

It sure does.


> >
> >
> > >
> > > > >
> > > > > > ---
> > > > > >  hw/virtio/virtio-balloon.c | 6 +++---
> > > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > > > > > index c6962fcbfe..3e52daa793 100644
> > > > > > --- a/hw/virtio/virtio-balloon.c
> > > > > > +++ b/hw/virtio/virtio-balloon.c
> > > > > > @@ -231,7 +231,7 @@ static void balloon_stats_poll_cb(void *opaque)
> > > > > >          return;
> > > > > >      }
> > > > > >
> > > > > > -    virtqueue_push(s->svq, s->stats_vq_elem, s->stats_vq_offset);
> > > > > > +    virtqueue_push(s->svq, s->stats_vq_elem, 0);
> > > > > >      virtio_notify(vdev, s->svq);
> > > > > >      g_free(s->stats_vq_elem);
> > > > > >      s->stats_vq_elem = NULL;
> > > > > > @@ -438,7 +438,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> > > > > >              memory_region_unref(section.mr);
> > > > > >          }
> > > > > >
> > > > > > -        virtqueue_push(vq, elem, offset);
> > > > > > +        virtqueue_push(vq, elem, 0);
> > > > > >          virtio_notify(vdev, vq);
> > > > > >          g_free(elem);
> > > > > >          virtio_balloon_pbp_free(&pbp);
> > > > > > @@ -549,7 +549,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
> > > > > >      }
> > > > > >
> > > > > >  out:
> > > > > > -    virtqueue_push(vq, elem, 1);
> > > > > > +    virtqueue_push(vq, elem, 0);
> > > > > >      g_free(elem);
> > > > > >      return ret;
> > > > > >  }
> > > > > > --
> > > > > > 2.25.1
> > > > >
> > >


