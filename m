Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B62C6CA41C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:30:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pglyT-0003G9-N4; Mon, 27 Mar 2023 08:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pglyS-0003Fl-5g
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:29:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pglyQ-0002A1-DX
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679920156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WuK/hP5W9/5l5UdCVf4BY7ADo22fXMQ9ZGn5/xAm4DQ=;
 b=JXPQ13kQ0SClUb+Kq7d/Bq57Eb4nYthmXZhiykIwdRlw2jYg3UFHhKerb7muAY2bVj8Mlr
 VdzueBifInifcXyCjYMgBAgOtkvAYmssKDaAfR/ty7pw3uGAdutQQ7SDo6Jlwo4dfUYwEU
 JM5FqX+A12/5OtiZWnYpnacaQrxFoXc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-d91rv77WO26LbYY_50avKw-1; Mon, 27 Mar 2023 08:29:15 -0400
X-MC-Unique: d91rv77WO26LbYY_50avKw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bi27-20020a05600c3d9b00b003ef6ee937b8so1421931wmb.2
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 05:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679920154;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WuK/hP5W9/5l5UdCVf4BY7ADo22fXMQ9ZGn5/xAm4DQ=;
 b=IX5u7GcgbJg3yOq20PsNq3pPA7KvgOPdE9LkJPfdqVyGCafUUfvTR8ow/KfAVENmSY
 osPw8ecRTq9o3Fj5SnN/cnW2gFd29cENyv4ZoDkKq7sNnIBNoCF/9wshx70Lq02oPeOa
 IQb6BnoA3uStdV88eYy29J2o3Vum24olX//YmhI52pGO6fy/MYieai5QMFx2XaTh0cB7
 ihogu4TYMRqV60vkkaRbAmCPLfVyw8r2Iqd4yUw0Sgthm7AP1Ad+zAGMFlE4hjWQB/Lo
 bbkfFd0EmMiwNVxFhseBuQn8syWQqzIeoAEDIeyXUtSl8t8ZI0rZ3mS4bMpWsDLDLFIm
 Lj2g==
X-Gm-Message-State: AO0yUKUi4lrUS9neYIwOgleov1lLAaZQjjYu3eXgbzB9HC1cbB+vG55v
 SyjRatav0vlVUsPBZpAaQDIb5ANbnAKDmGRBH/YP3Rofd1mdYKYJ16Rl8pxeL0zBJbOHyg1OB8D
 HA26WEreE2a1H5KA=
X-Received: by 2002:a7b:c7d6:0:b0:3e1:f8af:8772 with SMTP id
 z22-20020a7bc7d6000000b003e1f8af8772mr9233509wmk.9.1679920154374; 
 Mon, 27 Mar 2023 05:29:14 -0700 (PDT)
X-Google-Smtp-Source: AK7set9lvAoPygMu75KlgLhD2yFRA+bdAVoUSmiVH/E4HhLELn5kY1No0J66OOq39euzZ2dNwAFHKA==
X-Received: by 2002:a7b:c7d6:0:b0:3e1:f8af:8772 with SMTP id
 z22-20020a7bc7d6000000b003e1f8af8772mr9233490wmk.9.1679920154047; 
 Mon, 27 Mar 2023 05:29:14 -0700 (PDT)
Received: from redhat.com ([2.52.153.142]) by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c0a0400b003ef4cd057f5sm8836755wmp.4.2023.03.27.05.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:29:13 -0700 (PDT)
Date: Mon, 27 Mar 2023 08:29:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>,
 qemu-devel@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 "open list:virtio-ccw" <qemu-s390x@nongnu.org>
Subject: Re: [PATCH v2] virtio: refresh vring region cache after updating a
 virtqueue size
Message-ID: <20230327082859-mutt-send-email-mst@kernel.org>
References: <20230317002749.27379-1-clopez@suse.de> <87y1npglk0.fsf@redhat.com>
 <20230322182433.695270d0.pasic@linux.ibm.com>
 <877cv2sbbo.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877cv2sbbo.fsf@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 27, 2023 at 01:06:19PM +0200, Cornelia Huck wrote:
> On Wed, Mar 22 2023, Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Wed, 22 Mar 2023 10:52:31 +0100
> > Cornelia Huck <cohuck@redhat.com> wrote:
> > [..]
> >> >
> >> > diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> >> > index e33e5207ab..f44de1a8c1 100644
> >> > --- a/hw/s390x/virtio-ccw.c
> >> > +++ b/hw/s390x/virtio-ccw.c
> >> > @@ -237,6 +237,7 @@ static int virtio_ccw_set_vqs(SubchDev *sch, VqInfoBlock *info,
> >> >                  return -EINVAL;
> >> >              }
> >> >              virtio_queue_set_num(vdev, index, num);
> >> > +            virtio_init_region_cache(vdev, index);  
> >> 
> >> Hmm... this is not wrong, but looking at it again, I see that the guest
> >> has no way to change num after our last call to
> >> virtio_init_region_cache() (while setting up the queue addresses.) IOW,
> >> this introduces an extra round trip that is not really needed.
> >> 
> >
> > I don't quite understand. AFAIU the virtio_init_region_cache() would see
> > the (new) queue addresses but not the new size (num). Yes virtio-ccw
> > already knows the new num but it is yet to call
> > to put it into vdev->vq[n].vring.num from where
> > virtio_init_region_cache() picks it up.
> >
> > If we were to first virtio_queue_set_num() and only then the address
> > I would understand. But with the code as is, I don't. Am I missing
> > something?
> 
> Hrm, virtio_queue_set_rings() doesn't pass num, I thought it did... I
> wonder whether ordering virtio_queue_set_num() before it would be better
> anyway (if the guest gave us an invalid num, we don't need to setup any
> addresses and init any caches).
> 
> Smth like
> 
> if (info) {
>    if (desc) {
>       if (virtio_queue_get_max_num(...) < num) {
>           return -EINVAL;
>       }
>       virtio_queue_set_num(...);
>    }
>    virtio_queue_set_rings(...);
> } else { /* legacy */
>    if (desc && virtio_queue_get_max_num(...) > num) {
>        return -EINVAL;
>    }
>    virtio_queue_set_addr(...);
> }
> virtio_queue_set_vector(vdev, index, desc ? index : VIRTIO_NO_VECTOR);
> 
> might be easier to follow than the current code.
> 
> Or we could just go with this patch, which has the advantage of already
> existing :)

Yea ... an ack would be appreciated.

-- 
MST


