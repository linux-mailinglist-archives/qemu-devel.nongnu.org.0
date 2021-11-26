Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E1645E41F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 02:44:18 +0100 (CET)
Received: from localhost ([::1]:40934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqQHg-0007T8-JD
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 20:44:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mqQGA-0006mm-Sd
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 20:42:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mqQG7-0002y4-Nq
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 20:42:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637890957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVVEI8kvd2y4s4HUEuVNPf+QcTpHXdXgX2jO0Ay1WLw=;
 b=X+Ky0VVyQO0lqGj8BCUzLI1NeQtSsFCA3mP0Vd9l5IyJAQ6Q7urMSZeEJHKgeNCtL3Wc6c
 4n/RWIyWhXt2rvLChg0HIWFAjdNMy8FNBoxum//MsH949Fa59Y6UQRHGug4NiTYqf17Nzk
 F4qMmKIHYBl6XH7Lo1xnY73ggvSSJLk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-sWN6x35mN4KVHyMcpN-2KQ-1; Thu, 25 Nov 2021 20:42:36 -0500
X-MC-Unique: sWN6x35mN4KVHyMcpN-2KQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 v9-20020a50d849000000b003dcb31eabaaso6668108edj.13
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 17:42:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SVVEI8kvd2y4s4HUEuVNPf+QcTpHXdXgX2jO0Ay1WLw=;
 b=QETwXF4iHtLw7QRnLclI6LPP3eDhrsiCdoyu+J5dkuduH6qKPewvu3ij8MKy9jmzdG
 KwzmZx2KkeJXl6qm0u9jVNnshJOBwCZmwxbLYyi5QDNp7RR8sKTQNl8y/A4Qj3+Mt+jV
 JcFmPIVsdY5K6D1aZ/VEiMgFDqW0Q9XNsjG6uWSo7ZqRp/Jawb4cDwrWQ4m8+mBkDXWX
 dSVJlz+ZwoU6CqRgyd7vBJ7AtuiMEYcvnY21NR87JCwmswi6Z+XANzA3YaWiNRKhNI71
 P2bC5xVjRfLjI0stlFXMVsr9IZ8Lw/2tkf5PA2DP1QBrccMHYsE6Q7S1cMRDnD93t7H3
 X/nA==
X-Gm-Message-State: AOAM530ymnoAme1Y5f8C6JnKLU4HhB9qbmhGhoGa5Ohf1y8EfN1J4GVn
 YNpAbYAHDqQCH1lBwmzoHeQWbKyn77or5kQzO64yJvkCcRsSvQCvUFoJ3F84yMhvv/UNxNK7umP
 w/vcGVQUcZOnfkL0=
X-Received: by 2002:a05:6402:16cd:: with SMTP id
 r13mr44897692edx.264.1637890955071; 
 Thu, 25 Nov 2021 17:42:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwO3Yd6S0kWgR71xfMUz0qyEC3qtYf5p1OstUCtD3z81bilEaAr8MklmGc9c75MMeBWj8t9Zg==
X-Received: by 2002:a05:6402:16cd:: with SMTP id
 r13mr44897671edx.264.1637890954869; 
 Thu, 25 Nov 2021 17:42:34 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:e87:2d40:4ed4:5676:5c1a])
 by smtp.gmail.com with ESMTPSA id ch28sm2799780edb.72.2021.11.25.17.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 17:42:33 -0800 (PST)
Date: Thu, 25 Nov 2021 20:42:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH 1/2] virito-balloon: process all in sgs for free_page_vq
Message-ID: <20211125204054-mutt-send-email-mst@kernel.org>
References: <20211125022046.10433-1-jasowang@redhat.com>
 <f4ae1d19-1409-7250-5149-8831b2cfa1d2@redhat.com>
 <20211125110724-mutt-send-email-mst@kernel.org>
 <d162f85f-214b-3d4b-c860-47b3367e7099@redhat.com>
 <b8d226cb51d04484861f1e1809043c1d@intel.com>
MIME-Version: 1.0
In-Reply-To: <b8d226cb51d04484861f1e1809043c1d@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: "mpe@ellerman.id.au" <mpe@ellerman.id.au>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 26, 2021 at 01:21:46AM +0000, Wang, Wei W wrote:
> On Friday, November 26, 2021 12:11 AM, David Hildenbrand wrote:
> > On 25.11.21 17:09, Michael S. Tsirkin wrote:
> > > On Thu, Nov 25, 2021 at 09:28:59AM +0100, David Hildenbrand wrote:
> > >> On 25.11.21 03:20, Jason Wang wrote:
> > >>> We only process the first in sg which may lead to the bitmap of the
> > >>> pages belongs to following sgs were not cleared. This may result
> > >>> more pages to be migrated. Fixing this by process all in sgs for
> > >>> free_page_vq.
> > >>>
> > >>> Signed-off-by: Jason Wang <jasowang@redhat.com>
> > >>> ---
> > >>>  hw/virtio/virtio-balloon.c | 7 +++++--
> > >>>  1 file changed, 5 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > >>> index c6962fcbfe..17de2558cb 100644
> > >>> --- a/hw/virtio/virtio-balloon.c
> > >>> +++ b/hw/virtio/virtio-balloon.c
> > >>> @@ -510,6 +510,7 @@ static bool get_free_page_hints(VirtIOBalloon
> > *dev)
> > >>>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > >>>      VirtQueue *vq = dev->free_page_vq;
> > >>>      bool ret = true;
> > >>> +    int i;
> > >>>
> > >>>      while (dev->block_iothread) {
> > >>>          qemu_cond_wait(&dev->free_page_cond,
> > &dev->free_page_lock);
> > >>> @@ -544,8 +545,10 @@ static bool get_free_page_hints(VirtIOBalloon
> > *dev)
> > >>>      }
> > >>>
> > >>>      if (elem->in_num && dev->free_page_hint_status ==
> > FREE_PAGE_HINT_S_START) {
> > >>> -        qemu_guest_free_page_hint(elem->in_sg[0].iov_base,
> > >>> -                                  elem->in_sg[0].iov_len);
> > >>> +        for (i = 0; i < elem->in_num; i++) {
> > >>> +            qemu_guest_free_page_hint(elem->in_sg[i].iov_base,
> > >>> +                                      elem->in_sg[i].iov_len);
> > >>> +        }
> > >>>      }
> > >>>
> > >>>  out:
> > >>>
> > >>
> > >> Yes, but:
> > >>
> > >> 1. Linux never used more than one
> > >> 2. QEMU never consumed more than one
> 
> Yes, it works based on the fact that Linux only sends one hint each time.
> 
> > >>
> > >> The spec states:
> > >>
> > >> "(b) The driver maps a series of pages and adds them to the
> > >> free_page_vq as individual scatter-gather input buffer entries."
> > >>
> > >> However, the spec was written by someone else (Alex) as the code was
> > >> (Wei). The code was there first.
> > >>
> > >> I don't particularly care what to adjust (code or spec). However, to
> > >> me it feels more like the spec is slightly wrong and it was intended
> > >> like the code is by the original code author.
> > >>
> > >> But then again, I don't particularly care :)
> > >
> > > Original QEMU side code had several bugs so, that's another one.
> > > Given nothing too bad happens if guest submits too many S/Gs, and
> > > given the spec also has a general chapter suggesting devices are
> > > flexible in accepting a single buffer split to multiple S/Gs, I'm
> > > inclined to accept the patch.
> > 
> > Yeah, as I said, I don't particularly care. It's certainly an "easy change".
> > 
> > Acked-by: David Hildenbrand <david@redhat.com>
> > 
> 
> Don’t object the change.
> Just in case something unexpected, it would be better if someone could help do a test.
> 
> Thanks,
> Wei

Yes, the setup you used to test the original patches will do fine ...

-- 
MST


