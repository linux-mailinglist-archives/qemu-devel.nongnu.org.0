Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA37445B608
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:58:27 +0100 (CET)
Received: from localhost ([::1]:51248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpnAg-0002WR-8G
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:58:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mpmJU-00031B-Ez
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:03:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mpmJR-0007F5-Mj
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:03:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637737404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E8sR2JVu6v9pTrd+hQaqGusSBY43KypKfJTWz6bNGvk=;
 b=NsptiWYMZ0ogPkyyAsa/vVq6+LRdyWTzlPevREpRSzYZBuIWLMhboI/4U4AFVin3atTIal
 T8UUw0nyRWYgJ+Ae1G7JJ7DGL9VQ6bK6pkjr/9/KxPTzh+LU/QulPyhGKkuVnkTWEJCEpl
 4T4LCV+DDTtsL8F32vZ2kWFfYqhxO2M=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-QC4tNKG2MgCmNZ_NcsRjjA-1; Wed, 24 Nov 2021 02:03:19 -0500
X-MC-Unique: QC4tNKG2MgCmNZ_NcsRjjA-1
Received: by mail-ed1-f70.google.com with SMTP id
 m17-20020aa7d351000000b003e7c0bc8523so1362078edr.1
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 23:03:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E8sR2JVu6v9pTrd+hQaqGusSBY43KypKfJTWz6bNGvk=;
 b=ju0mTfcqXNe8jY/+4oGBxYcndfku3HOOc8Q649c1xsY31rzBV5ugBf1sKaGWM3CzD2
 3mczMfcJjr5QENL9G0xMKHuNztBncLfUPhhPUfwl+B7Nw9SJdY3N5GhK2WRcg33v7wHV
 L+0X5JZHGTeFUhY10BhAD0oYZgyQGB+q153rFVTwjLBkgIIsp+YNce39jrch4C+1qmoo
 HSGn1ixD7VHV3SOCUTQ3gVhWZpaGm48eGCEZ6p0ii9ZWMFxo6NS8L+ggAwNZ8hqBo9hD
 xB3nYTmf9Tgn8+bwyrexrurc9+cdmAg5/xCTCfTpYR2/Zf5t7TFswL7PHbs5d5ZsKnrG
 kg6w==
X-Gm-Message-State: AOAM532HjGZ4uJnxQAMDQDY/lHF1fJUOL+GUvayt2FmOmWJ66otcXcf3
 unC2NbDFPdpbW2Now93mVwkcOjEFU3ToJVYWVlKHWobh5O9oIOMRi9XaVQC/fEMKFfHampxqyqC
 N9k27wpvJjb8iYec=
X-Received: by 2002:a05:6402:3496:: with SMTP id
 v22mr20323500edc.177.1637737398032; 
 Tue, 23 Nov 2021 23:03:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzz6HNKwdZLuSMs7M5sfpir21yakmTqLMLiZccfCcxCvXveXbQW2rpuheqiRl/zf3up/WO5DQ==
X-Received: by 2002:a05:6402:3496:: with SMTP id
 v22mr20323452edc.177.1637737397791; 
 Tue, 23 Nov 2021 23:03:17 -0800 (PST)
Received: from redhat.com ([2.55.144.93])
 by smtp.gmail.com with ESMTPSA id qf8sm6428427ejc.8.2021.11.23.23.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 23:03:16 -0800 (PST)
Date: Wed, 24 Nov 2021 02:03:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] virtio-balloon: correct used length
Message-ID: <20211124020118-mutt-send-email-mst@kernel.org>
References: <20211124043255.6050-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124043255.6050-1-jasowang@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mpe@ellerman.id.au, qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 12:32:55PM +0800, Jason Wang wrote:
> Spec said:
> 
> "and len the total of bytes written into the buffer."
> 
> For inflateq, deflateq and statsq, we don't process in_sg so the used
> length should be zero. For free_page_vq, though the free pages are
> supplied via in_sgs, zero used length should still be fine since
> anyway driver is expected to use the length in this case and it
> simplifies the error handling path.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>

I think for free page vq the point is that the pages are
zeroed by hypervisor, so we must set used len accordingly. No?

> ---
>  hw/virtio/virtio-balloon.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index c6962fcbfe..3e52daa793 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -231,7 +231,7 @@ static void balloon_stats_poll_cb(void *opaque)
>          return;
>      }
>  
> -    virtqueue_push(s->svq, s->stats_vq_elem, s->stats_vq_offset);
> +    virtqueue_push(s->svq, s->stats_vq_elem, 0);
>      virtio_notify(vdev, s->svq);
>      g_free(s->stats_vq_elem);
>      s->stats_vq_elem = NULL;
> @@ -438,7 +438,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>              memory_region_unref(section.mr);
>          }
>  
> -        virtqueue_push(vq, elem, offset);
> +        virtqueue_push(vq, elem, 0);
>          virtio_notify(vdev, vq);
>          g_free(elem);
>          virtio_balloon_pbp_free(&pbp);
> @@ -549,7 +549,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
>      }
>  
>  out:
> -    virtqueue_push(vq, elem, 1);
> +    virtqueue_push(vq, elem, 0);
>      g_free(elem);
>      return ret;
>  }
> -- 
> 2.25.1


