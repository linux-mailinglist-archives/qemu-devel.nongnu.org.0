Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F94464394
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 00:42:16 +0100 (CET)
Received: from localhost ([::1]:36164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msClL-0004b4-Ky
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 18:42:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1msCk8-0003pK-Ru
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 18:41:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1msCk5-00052h-9R
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 18:40:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638315655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HJUs4sqYrfyvq90acWJLlrvnPGbWhOQNjHY8+nLJ0Zg=;
 b=RG79CJQ9HIojPu5LABSnlq3X3BMTs6q0ayxhxW06qNEP+cGqhTC5cM1rlebKb1INb2dH93
 5y13MUp6ZRevVhRD6ijupjB2PwzmW9HbuWK/YJcczRbB7I2VGfz7CMZFi4z9sbb/lWydzz
 MKTmQuCzFMjyeea5PhyPdWMtzP/aplU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-d1qMJWhvO-C1on6Ix6asKw-1; Tue, 30 Nov 2021 18:40:54 -0500
X-MC-Unique: d1qMJWhvO-C1on6Ix6asKw-1
Received: by mail-ed1-f71.google.com with SMTP id
 30-20020a508e5e000000b003f02e458b17so11660437edx.17
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 15:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HJUs4sqYrfyvq90acWJLlrvnPGbWhOQNjHY8+nLJ0Zg=;
 b=7MU6wcz3k1tbmDgdCRbgGBc4+oX1pGDJzuPISyzAtMVPJAdBjhEG3s7apFSMHZGj1f
 Vi+8ugiB2uaTOECsqut0VT3kHw4GoP10nSm3s/dBcDUpMEfq+Aqt4vLmfWDvlGSvwKg6
 YLiO5NwpScoyPrfpslQeMwoctqyhgiNFr382VULZlJSRgARmuP9MwBYF4kApfiju6/3c
 VZINpdHOPibF5piqfYZ1F7ovWXLGEtVZOF9+PCx2Ko93Je8c5ldnxiHfGoDienKUv11B
 kMuDCtGju/b3H5pGVxzi0Nho0WjB8y/NiUrUxruEMR38gJ5wWvmN0sLpRf4TpW3j5+5S
 0xUw==
X-Gm-Message-State: AOAM5331gDRhu53uKRsC8ATSeS6SuyxWzPJwi1CMYbEevKiap78Vmop0
 m4rBTkahzhmKdN7giuoetnXenv+NN8hAn/W3/kcRmdpsXeH1o/vYgdYZlGnSTzGP6ytG6Pgl4Zh
 39m321dCSHCa1d0Y=
X-Received: by 2002:aa7:c415:: with SMTP id j21mr3036470edq.289.1638315653400; 
 Tue, 30 Nov 2021 15:40:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynCeGAbrKrXCSiHmEWtO6rLayv5ox6lLqEvrtjUOQWdOIdrbXg7sscv6yygvXxJgZJMMMVCA==
X-Received: by 2002:aa7:c415:: with SMTP id j21mr3036454edq.289.1638315653223; 
 Tue, 30 Nov 2021 15:40:53 -0800 (PST)
Received: from redhat.com ([2.53.15.215])
 by smtp.gmail.com with ESMTPSA id ds1sm2440639edb.91.2021.11.30.15.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:40:52 -0800 (PST)
Date: Tue, 30 Nov 2021 18:40:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtio: signal after wrapping packed used_idx
Message-ID: <20211130184031-mutt-send-email-mst@kernel.org>
References: <20211130134510.267382-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211130134510.267382-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Tiwei Bie <tiwei.bie@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 30, 2021 at 01:45:10PM +0000, Stefan Hajnoczi wrote:
> Packed Virtqueues wrap used_idx instead of letting it run freely like
> Split Virtqueues do. If the used ring wraps more than once there is no
> way to compare vq->signalled_used and vq->used_idx in
> virtio_packed_should_notify() since they are modulo vq->vring.num.
> 
> This causes the device to stop sending used buffer notifications when
> when virtio_packed_should_notify() is called less than once each time
> around the used ring.
> 
> It is possible to trigger this with virtio-blk's dataplane
> notify_guest_bh() irq coalescing optimization. The call to
> virtio_notify_irqfd() (and virtio_packed_should_notify()) is deferred to
> a BH. If the guest driver is polling it can complete and submit more
> requests before the BH executes, causing the used ring to wrap more than
> once. The result is that the virtio-blk device ceases to raise
> interrupts and I/O hangs.
> 
> Cc: Tiwei Bie <tiwei.bie@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Makes sense.  Fixes tag?

> ---
> Smarter solutions welcome, but I think notifying once per vq->vring.num
> is acceptable.
> ---
>  hw/virtio/virtio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index ea7c079fb0..f7851c2750 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -885,6 +885,7 @@ static void virtqueue_packed_flush(VirtQueue *vq, unsigned int count)
>      if (vq->used_idx >= vq->vring.num) {
>          vq->used_idx -= vq->vring.num;
>          vq->used_wrap_counter ^= 1;
> +        vq->signalled_used_valid = false;
>      }
>  }
>  
> -- 
> 2.33.1


