Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D93345E88B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 08:38:42 +0100 (CET)
Received: from localhost ([::1]:42522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqVof-0005L3-2V
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 02:38:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mqVnA-0004bc-Tk
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 02:37:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mqVn7-0006L3-Ns
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 02:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637912224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1MqstZiR7ySAKBnQzIXm/glLHDcxXRNoDLjpayvbW5E=;
 b=agOhGmNT5jEZCqrAObZMgJPD7iltklzrubvk7cXZBEWiLBPy7qZBEWJeGg49tp4i1bz5cB
 PchksASLG035lVNDrdoj8yR6KvYfg1bKAuIGixwbsSl0PmqhIi3CeYNvU8sJg9v3HIEzw+
 cYrWV3pO8oL25qv8Pzx5JabL72qoh+o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-sADCuDTXOQSJt-C5L4zkEw-1; Fri, 26 Nov 2021 02:37:01 -0500
X-MC-Unique: sADCuDTXOQSJt-C5L4zkEw-1
Received: by mail-ed1-f72.google.com with SMTP id
 d13-20020a056402516d00b003e7e67a8f93so7327075ede.0
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 23:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1MqstZiR7ySAKBnQzIXm/glLHDcxXRNoDLjpayvbW5E=;
 b=dVhMG5V6JYc05qN+h1yhO1c3uhEsjGsTyAyyOEVyBGlN+WuukEzwQuuTaES2UKs77E
 x0rKTynRv38ur8bLXoMt69H1nWiUr8yW6AamrktKjP0euJ+W3bXpa9hx5qcFi7N9LC7M
 fM2Rghta6vsxzG16uSz1K4cdJFCNl7c3GzI718tSyQ6sEp8gF1+Q0EwtnsRLgtVPZJr+
 CszknCCMQZBLaQqBzJsaiNXurR2wip+SvFOBL39E7I7W1kOGdezbZ2Dl6EQLaswIb5Vh
 vECtsx/auUOQM+UFSUVlrxlhnkZY3vFloMSKb2ucDs+fGsEJas4HbFj9iEzViACL9rXD
 UP/g==
X-Gm-Message-State: AOAM532skqoWlLczLSAfYOHMeYXI8FKbDRJQvERbO6SmoLys7rXSTPsQ
 9vvWax0miJ2q+MRGZu/p1WKh4Y2T/KArUg3ZT2c4aKSnOVtinA6ZUsw1iBBYl0O/XAx2DoVnGAZ
 JIegF3efug+kwPGE=
X-Received: by 2002:a50:fc10:: with SMTP id i16mr46612754edr.84.1637912219869; 
 Thu, 25 Nov 2021 23:36:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeEH/Q0z9qG0wDIc6G8VZZo2orMPcZgLv0hIH3VfSQw9Cgf8QAJ12v+2JMPKJKO+/seAXI+A==
X-Received: by 2002:a50:fc10:: with SMTP id i16mr46612730edr.84.1637912219588; 
 Thu, 25 Nov 2021 23:36:59 -0800 (PST)
Received: from redhat.com ([176.12.226.108])
 by smtp.gmail.com with ESMTPSA id jy28sm2590611ejc.118.2021.11.25.23.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 23:36:59 -0800 (PST)
Date: Fri, 26 Nov 2021 02:36:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/2] virtio-balloon: correct used length
Message-ID: <20211126023424-mutt-send-email-mst@kernel.org>
References: <20211125022046.10433-1-jasowang@redhat.com>
 <20211125022046.10433-2-jasowang@redhat.com>
 <20211125111055-mutt-send-email-mst@kernel.org>
 <CACGkMEsXRQm-vssQD0Cp1R-00B1G-XvdMFv1PX07qZqYPxH71A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsXRQm-vssQD0Cp1R-00B1G-XvdMFv1PX07qZqYPxH71A@mail.gmail.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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

On Fri, Nov 26, 2021 at 10:45:43AM +0800, Jason Wang wrote:
> On Fri, Nov 26, 2021 at 12:14 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Nov 25, 2021 at 10:20:46AM +0800, Jason Wang wrote:
> > > Spec said:
> > >
> > > "and len the total of bytes written into the buffer."
> > >
> > > For inflateq, deflateq and statsq, we don't process in_sg so the used
> > > length should be zero. For free_page_vq, since the pages could be
> > > changed in the destination, we should make all pages used for safety.
> >
> > Yea, about that, I know I said it, but I was wrong, sorry.
> >
> > Spec says this:
> >
> >         \field{len} is particularly useful
> >         for drivers using untrusted buffers: if a driver does not know exactly
> >         how much has been written by the device, the driver would have to zero
> >         the buffer in advance to ensure no data leakage occurs.
> >
> >         For example, a network driver may hand a received buffer directly to
> >         an unprivileged userspace application.  If the network device has not
> >         overwritten the bytes which were in that buffer, this could leak the
> >         contents of freed memory from other processes to the application.
> >
> >
> > In other words, device must guarantee that used length was
> > written into. Since we don't know that, we really should
> > write 0 there, and the fact we don't is a spec violation.
> 
> The problem is, if we write 0, the driver may assume there's no change
> on those pages?
> 
> Thanks

No:


The driver MUST NOT make assumptions about data in device-writable buffers
beyond the first \field{len} bytes, and SHOULD ignore this data.



> >
> >
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > >  hw/virtio/virtio-balloon.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > > index 17de2558cb..fb4426ac0c 100644
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
> > > @@ -510,6 +510,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
> > >      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > >      VirtQueue *vq = dev->free_page_vq;
> > >      bool ret = true;
> > > +    size_t used = 0;
> > >      int i;
> > >
> > >      while (dev->block_iothread) {
> > > @@ -548,11 +549,12 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
> > >          for (i = 0; i < elem->in_num; i++) {
> > >              qemu_guest_free_page_hint(elem->in_sg[i].iov_base,
> > >                                        elem->in_sg[i].iov_len);
> > > +            used += elem->in_sg[i].iov_len;
> > >          }
> > >      }
> > >
> > >  out:
> > > -    virtqueue_push(vq, elem, 1);
> > > +    virtqueue_push(vq, elem, used);
> > >      g_free(elem);
> > >      return ret;
> > >  }
> > > --
> > > 2.25.1
> >


