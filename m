Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395E867F717
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 11:24:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLiNK-0003Wp-Er; Sat, 28 Jan 2023 05:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLiNI-0003Wa-Cx
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 05:23:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLiNG-0003HP-9c
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 05:23:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674901433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=caBFM00kRgechCjSMMC4d/+9+yYQlzekIWJJK5gnW6o=;
 b=QWdHAN/AEGVzW8V/BT0ACZ+/Tupe4mhSE7YAzmHXqsOSmRyM/xbIQFLQSYBjmNpHhIZdTK
 jrQbPstoZ77KZqf8K4UnBf3yriyGbY44ush/VmS4CMcME3AcKtlTQEBVeh75D2vGgW7vj1
 46ysXgauW99cWeV9v+w1JLQMaG5t8W8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-z8CQgvY1PlmIlwktgNPLgg-1; Sat, 28 Jan 2023 05:23:51 -0500
X-MC-Unique: z8CQgvY1PlmIlwktgNPLgg-1
Received: by mail-wm1-f69.google.com with SMTP id
 z11-20020a1c4c0b000000b003db062505b9so2175409wmf.4
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 02:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=caBFM00kRgechCjSMMC4d/+9+yYQlzekIWJJK5gnW6o=;
 b=iUJttfoblR83DjlCNEJnvjSF1MQXi+Fy4UnTVX7s3qR3HYlYv5rTTWt779VvjqQPWS
 ERSdDtBoc0uD/t2yGmGLd9eKFefclllrUshBJx9Nb0bjPnhYgnm4PWvBwi6MqioJrOD7
 h1WcnvR7hTpv259NI/QKAUlLttFYL05UDiQyw2ZnLhUB11d304W0svK/tkj1Vd7xhfQ2
 zxhoRItsAj5Ehxqh8sXOwW1Hx70h0rK9xyONyx2rslFgn5ZpHpAwOAFFXWbEmeS31+7j
 KqpgYKoIY1guf+iub9wMbh0d/nR0KiwndFB/wRxFlhTw8n9LI87otFaFzd7awUogulm2
 BQ8Q==
X-Gm-Message-State: AO0yUKV3w4bYQCb0vLYfuGvZN6ZWrGbb0LKWcxHTA3orydHVCwpBzQOa
 msAE1E1ma46Wg5yygRAKkY5bMpOYKlqvEB4ECfmLCiFUsXc33fK6t+Gpq1Scu51SsXqa0Li/Ed7
 BJebDRwItbWx/zzQ=
X-Received: by 2002:a5d:410f:0:b0:2bf:d940:29b6 with SMTP id
 l15-20020a5d410f000000b002bfd94029b6mr2288719wrp.54.1674901430541; 
 Sat, 28 Jan 2023 02:23:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+e1JlIosck5Q6Pqb72b+my24PwwInGJgClmqD/a9nMuB9tJrufEtvcBowWVY1jQ6LQjYnAcA==
X-Received: by 2002:a5d:410f:0:b0:2bf:d940:29b6 with SMTP id
 l15-20020a5d410f000000b002bfd94029b6mr2288704wrp.54.1674901430233; 
 Sat, 28 Jan 2023 02:23:50 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 z12-20020a5d4d0c000000b002bbb2d43f65sm6280310wrt.14.2023.01.28.02.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 02:23:49 -0800 (PST)
Date: Sat, 28 Jan 2023 05:23:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/3] virtio: move struct VirtQueue to include file
Message-ID: <20230128052212-mutt-send-email-mst@kernel.org>
References: <20230128071724.33677-1-xuanzhuo@linux.alibaba.com>
 <20230128071724.33677-2-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230128071724.33677-2-xuanzhuo@linux.alibaba.com>
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

On Sat, Jan 28, 2023 at 03:17:22PM +0800, Xuan Zhuo wrote:
> This patch move struct VirtQueue into virtio.h.
> 
> In order to implement Queue Reset, we have to record the queue reset
> status of in struct VirtQueue and provide it to device.
> 
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

So add an API please, no need to move the struct.
This patch will go away then.

> ---
>  hw/virtio/virtio.c         | 49 -----------------------------------
>  include/hw/virtio/virtio.h | 52 ++++++++++++++++++++++++++++++++++++--
>  2 files changed, 50 insertions(+), 51 deletions(-)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index f35178f5fc..03077b2ecf 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -101,60 +101,11 @@ typedef struct VRingMemoryRegionCaches {
>      MemoryRegionCache used;
>  } VRingMemoryRegionCaches;
>  
> -typedef struct VRing
> -{
> -    unsigned int num;
> -    unsigned int num_default;
> -    unsigned int align;
> -    hwaddr desc;
> -    hwaddr avail;
> -    hwaddr used;
> -    VRingMemoryRegionCaches *caches;
> -} VRing;
> -
>  typedef struct VRingPackedDescEvent {
>      uint16_t off_wrap;
>      uint16_t flags;
>  } VRingPackedDescEvent ;
>  
> -struct VirtQueue
> -{
> -    VRing vring;
> -    VirtQueueElement *used_elems;
> -
> -    /* Next head to pop */
> -    uint16_t last_avail_idx;
> -    bool last_avail_wrap_counter;
> -
> -    /* Last avail_idx read from VQ. */
> -    uint16_t shadow_avail_idx;
> -    bool shadow_avail_wrap_counter;
> -
> -    uint16_t used_idx;
> -    bool used_wrap_counter;
> -
> -    /* Last used index value we have signalled on */
> -    uint16_t signalled_used;
> -
> -    /* Last used index value we have signalled on */
> -    bool signalled_used_valid;
> -
> -    /* Notification enabled? */
> -    bool notification;
> -
> -    uint16_t queue_index;
> -
> -    unsigned int inuse;
> -
> -    uint16_t vector;
> -    VirtIOHandleOutput handle_output;
> -    VirtIODevice *vdev;
> -    EventNotifier guest_notifier;
> -    EventNotifier host_notifier;
> -    bool host_notifier_enabled;
> -    QLIST_ENTRY(VirtQueue) node;
> -};
> -
>  const char *virtio_device_names[] = {
>      [VIRTIO_ID_NET] = "virtio-net",
>      [VIRTIO_ID_BLOCK] = "virtio-blk",
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 77c6c55929..1c0d77c670 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -214,6 +214,56 @@ struct VirtioDeviceClass {
>      struct vhost_dev *(*get_vhost)(VirtIODevice *vdev);
>  };
>  
> +typedef struct VRingMemoryRegionCaches VRingMemoryRegionCaches;
> +typedef void (*VirtIOHandleOutput)(VirtIODevice *, VirtQueue *);
> +
> +typedef struct VRing {
> +    unsigned int num;
> +    unsigned int num_default;
> +    unsigned int align;
> +    hwaddr desc;
> +    hwaddr avail;
> +    hwaddr used;
> +    VRingMemoryRegionCaches *caches;
> +} VRing;
> +
> +struct VirtQueue {
> +    VRing vring;
> +    VirtQueueElement *used_elems;
> +
> +    /* Next head to pop */
> +    uint16_t last_avail_idx;
> +    bool last_avail_wrap_counter;
> +
> +    /* Last avail_idx read from VQ. */
> +    uint16_t shadow_avail_idx;
> +    bool shadow_avail_wrap_counter;
> +
> +    uint16_t used_idx;
> +    bool used_wrap_counter;
> +
> +    /* Last used index value we have signalled on */
> +    uint16_t signalled_used;
> +
> +    /* Last used index value we have signalled on */
> +    bool signalled_used_valid;
> +
> +    /* Notification enabled? */
> +    bool notification;
> +
> +    uint16_t queue_index;
> +
> +    unsigned int inuse;
> +
> +    uint16_t vector;
> +    VirtIOHandleOutput handle_output;
> +    VirtIODevice *vdev;
> +    EventNotifier guest_notifier;
> +    EventNotifier host_notifier;
> +    bool host_notifier_enabled;
> +    QLIST_ENTRY(VirtQueue) node;
> +};
> +
>  void virtio_instance_init_common(Object *proxy_obj, void *data,
>                                   size_t vdev_size, const char *vdev_name);
>  
> @@ -226,8 +276,6 @@ void virtio_error(VirtIODevice *vdev, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
>  /* Set the child bus name. */
>  void virtio_device_set_child_bus_name(VirtIODevice *vdev, char *bus_name);
>  
> -typedef void (*VirtIOHandleOutput)(VirtIODevice *, VirtQueue *);
> -
>  VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
>                              VirtIOHandleOutput handle_output);
>  
> -- 
> 2.32.0.3.g01195cf9f


