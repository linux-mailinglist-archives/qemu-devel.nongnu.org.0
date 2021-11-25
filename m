Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346B945DE67
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 17:11:13 +0100 (CET)
Received: from localhost ([::1]:54732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqHL6-0004uo-9g
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 11:11:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mqHJe-0003O3-AO
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 11:09:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mqHJc-0000Xq-CI
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 11:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637856579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3qXjE07F9lUbC/p2hMLDE5QUPSBoHVGKc81qDzgNyac=;
 b=bgFYYgkdaTa5Gz2dke9/sxjh2yVYrKFT90Al9pQzV8UuSucTU2uaNMW6sc8LvLhdkXKOpb
 x6bslAacpFNd5CoVfiQSEp6lyBCFWc6rOpK4Nr+etnNvh/XyFTPgNedJ9KrVg9r3XQI2nE
 F0okSU6sx3cSC6/Ryq9OWtcnnuhZoa8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-268-P8MB-4GMPoqfqnSx_qIXNg-1; Thu, 25 Nov 2021 11:09:38 -0500
X-MC-Unique: P8MB-4GMPoqfqnSx_qIXNg-1
Received: by mail-ed1-f71.google.com with SMTP id
 eg20-20020a056402289400b003eb56fcf6easo5788863edb.20
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 08:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3qXjE07F9lUbC/p2hMLDE5QUPSBoHVGKc81qDzgNyac=;
 b=7zX/yZdF7rk+nfSsXs/jC33T9pOvdV3XWuoItXthmp1duEY7RUy5hLQ4fvcQzi1Mbr
 O+sH9X8dxMgJxDDcDaA2e7xKtZQpZtoB+l8fg+LqZhIIzBjlP5yC98hNjCFhZsgOK5fW
 fIAaR1Ncx1VSqLH+mTT1tO2iQxpRRlpjPsUedu5l9DQb+ElgcVodubWDOg3Tr3Zuqjrs
 liu1mirOyAR3QtPKTFU1A3OA1C7ObV6GB3ZXpVFVfXZAbYyJ8w7HVZNn9W9dtifX35J6
 34UDEPsbfhVtsedWws/1O6exFC4mhh8RKrOzn/35Bevk3RX+/ynxlR0qFQ1ApScgNwcF
 uTPA==
X-Gm-Message-State: AOAM530SFs9NDH9Q/o+joHnCBjCHW5fUBEamha4gS8ZJ5EBHBicceuZm
 Crr3VZTFNS92FL/hK1hITxhmaC3jNvC65ezHGaDy05+Ap6AuedZbpRBTHWGIbaSvshxeweDAvZS
 jilV9TeM52HhkYgY=
X-Received: by 2002:a17:906:54e:: with SMTP id
 k14mr31487905eja.268.1637856577189; 
 Thu, 25 Nov 2021 08:09:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBv3Wf7Zb1mPi8EAJ9rdJ7yqbgo8Ya6WXBSAT+9nuuvsjuEdiyhpilnZyAoMo4pjmlIBNy5g==
X-Received: by 2002:a17:906:54e:: with SMTP id
 k14mr31487860eja.268.1637856576933; 
 Thu, 25 Nov 2021 08:09:36 -0800 (PST)
Received: from redhat.com ([176.12.197.47])
 by smtp.gmail.com with ESMTPSA id m6sm2546947edc.36.2021.11.25.08.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 08:09:36 -0800 (PST)
Date: Thu, 25 Nov 2021 11:09:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 1/2] virito-balloon: process all in sgs for free_page_vq
Message-ID: <20211125110724-mutt-send-email-mst@kernel.org>
References: <20211125022046.10433-1-jasowang@redhat.com>
 <f4ae1d19-1409-7250-5149-8831b2cfa1d2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f4ae1d19-1409-7250-5149-8831b2cfa1d2@redhat.com>
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
Cc: mpe@ellerman.id.au, Jason Wang <jasowang@redhat.com>,
 Wei Wang <wei.w.wang@intel.com>, qemu-devel@nongnu.org,
 Alexander Duyck <alexander.duyck@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 25, 2021 at 09:28:59AM +0100, David Hildenbrand wrote:
> On 25.11.21 03:20, Jason Wang wrote:
> > We only process the first in sg which may lead to the bitmap of the
> > pages belongs to following sgs were not cleared. This may result more
> > pages to be migrated. Fixing this by process all in sgs for
> > free_page_vq.
> > 
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  hw/virtio/virtio-balloon.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > index c6962fcbfe..17de2558cb 100644
> > --- a/hw/virtio/virtio-balloon.c
> > +++ b/hw/virtio/virtio-balloon.c
> > @@ -510,6 +510,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
> >      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> >      VirtQueue *vq = dev->free_page_vq;
> >      bool ret = true;
> > +    int i;
> >  
> >      while (dev->block_iothread) {
> >          qemu_cond_wait(&dev->free_page_cond, &dev->free_page_lock);
> > @@ -544,8 +545,10 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
> >      }
> >  
> >      if (elem->in_num && dev->free_page_hint_status == FREE_PAGE_HINT_S_START) {
> > -        qemu_guest_free_page_hint(elem->in_sg[0].iov_base,
> > -                                  elem->in_sg[0].iov_len);
> > +        for (i = 0; i < elem->in_num; i++) {
> > +            qemu_guest_free_page_hint(elem->in_sg[i].iov_base,
> > +                                      elem->in_sg[i].iov_len);
> > +        }
> >      }
> >  
> >  out:
> > 
> 
> Yes, but:
> 
> 1. Linux never used more than one
> 2. QEMU never consumed more than one
> 
> The spec states:
> 
> "(b) The driver maps a series of pages and adds them to the free_page_vq
> as individual scatter-gather input buffer entries."
> 
> However, the spec was written by someone else (Alex) as the code was
> (Wei). The code was there first.
> 
> I don't particularly care what to adjust (code or spec). However, to me
> it feels more like the spec is slightly wrong and it was intended like
> the code is by the original code author.
> 
> But then again, I don't particularly care :)

Original QEMU side code had several bugs so, that's another one.
Given nothing too bad happens if guest submits too many S/Gs,
and given the spec also has a general chapter suggesting devices
are flexible in accepting a single buffer split to multiple S/Gs,
I'm inclined to accept the patch.

> -- 
> Thanks,
> 
> David / dhildenb


