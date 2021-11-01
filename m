Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EBC44226D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 22:12:46 +0100 (CET)
Received: from localhost ([::1]:53510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhebl-0005YN-OP
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 17:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mheW5-0002fX-68
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 17:06:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mheW1-0005AI-VV
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 17:06:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635800809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AiQBb2MBDTv9KhEGxDedBxooUibSv8d0C/RPg5mZgC4=;
 b=fzMwoVk+2TwXyXJcMgeksEFtnU4PqaXDH7Ap8g5j9u/ZKneJ9dzsvkP9XC8K0cGzFhZ/sW
 Hi5PJchGn369GodpRU33xSo3LXWgORmDWA4AGYTmm+XJjsfABAQA4yaa2JhSDbUeaT07rX
 XebgvjiorxxLEZhzd+d9Ba0EX07Ud04=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-halmyV9cPK2NeO8z9yemlg-1; Mon, 01 Nov 2021 17:06:47 -0400
X-MC-Unique: halmyV9cPK2NeO8z9yemlg-1
Received: by mail-ed1-f71.google.com with SMTP id
 w26-20020a056402071a00b003e28a389d04so4462148edx.4
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 14:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AiQBb2MBDTv9KhEGxDedBxooUibSv8d0C/RPg5mZgC4=;
 b=a4eCnSfoQV3UXH9BzEWGo7k2rIFQrUpoaOruKtxbbCbPD0MI8q6zs7Sf1plEmIhH2g
 2RckxrE38whjkJYuluMG10yoXqM9n8RqqzYtq35cICoj5h/btmN/Be4mT2WjHO0GchlC
 3j0TvDzym7lOEhP1jX5x1AGFjqqhtyjBXLl4OT8q0PEL6Mn2N6/V+zZrk/vSvpTM6pkr
 VUILXQPJJFeSlv0ZEJGZkbCKcjMZeCZd3urY2lHRmu9y9rX1Zac70UlNcN0f9lonkovN
 QhNFw7b6Jp7PAQA4/ne+7fvmG1fIgKDJsTsMH9FXE5wiSSQGIz3nTO1xxexMcHWVy6hK
 6UKw==
X-Gm-Message-State: AOAM530BBRzvxZ+Ta93A3fo+SYOrVgr4iAOjMen3/6tbss49uVX/oejh
 Zd3Iow0XM9hii5KsD8ER2FzmlfjZ2AkxHD4zK0xtaT1RJXMW6u/mgSXjn+mlq/f5n0oA9DiT+Wc
 jxOG0mDtodF6YbOc=
X-Received: by 2002:a17:907:6d06:: with SMTP id
 sa6mr32535547ejc.436.1635800806654; 
 Mon, 01 Nov 2021 14:06:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXjHFiBzMH0iQ1ZRzfB1E02Sv08vc18SnsR1sxDq9qEW0Yyklj+XhYu4/7khqJu5TXch0afQ==
X-Received: by 2002:a17:907:6d06:: with SMTP id
 sa6mr32535522ejc.436.1635800806434; 
 Mon, 01 Nov 2021 14:06:46 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id sd28sm1244455ejc.37.2021.11.01.14.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 14:06:45 -0700 (PDT)
Date: Mon, 1 Nov 2021 17:06:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xueming Li <xuemingl@nvidia.com>
Subject: Re: [PATCH v6 1/2] vhost-user: remove VirtQ notifier restore
Message-ID: <20211101170506-mutt-send-email-mst@kernel.org>
References: <20211101083813.1224522-1-xuemingl@nvidia.com>
 <20211101083813.1224522-2-xuemingl@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20211101083813.1224522-2-xuemingl@nvidia.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
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
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 01, 2021 at 04:38:12PM +0800, Xueming Li wrote:
> When vhost-user vdpa client suspend, backend may close all resources,
> VQ notifier mmap address become invalid, restore MR which contains
> the invalid address is wrong. vdpa client will set VQ notifier after
> reconnect.
> 
> This patch removes VQ notifier restore and related flags to avoid reusing
> invalid address.
> 
> Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
> Cc: qemu-stable@nongnu.org
> Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
> Signed-off-by: Xueming Li <xuemingl@nvidia.com>
> ---
>  hw/virtio/vhost-user.c         | 19 +------------------
>  include/hw/virtio/vhost-user.h |  1 -
>  2 files changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index bf6e50223c..c671719e9b 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1143,19 +1143,6 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
>      return vhost_set_vring(dev, VHOST_USER_SET_VRING_NUM, ring);
>  }
>  
> -static void vhost_user_host_notifier_restore(struct vhost_dev *dev,
> -                                             int queue_idx)
> -{
> -    struct vhost_user *u = dev->opaque;
> -    VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
> -    VirtIODevice *vdev = dev->vdev;
> -
> -    if (n->addr && !n->set) {
> -        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true);
> -        n->set = true;
> -    }
> -}
> -
>  static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
>                                              int queue_idx)
>  {
> @@ -1163,17 +1150,14 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
>      VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
>      VirtIODevice *vdev = dev->vdev;
>  
> -    if (n->addr && n->set) {
> +    if (n->addr) {
>          virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
> -        n->set = false;
>      }
>  }
>

So on vq stop we still remove the notifier...
  
>  static int vhost_user_set_vring_base(struct vhost_dev *dev,
>                                       struct vhost_vring_state *ring)
>  {
> -    vhost_user_host_notifier_restore(dev, ring->index);
> -
>      return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
>  }
>  

but on vq start we do not reinstate it? Does this not mean that
notifiers won't work after stop then start?


> @@ -1538,7 +1522,6 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
>      }
>  
>      n->addr = addr;
> -    n->set = true;
>  
>      return 0;
>  }
> diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
> index a9abca3288..f6012b2078 100644
> --- a/include/hw/virtio/vhost-user.h
> +++ b/include/hw/virtio/vhost-user.h
> @@ -14,7 +14,6 @@
>  typedef struct VhostUserHostNotifier {
>      MemoryRegion mr;
>      void *addr;
> -    bool set;
>  } VhostUserHostNotifier;
>  
>  typedef struct VhostUserState {
> -- 
> 2.33.0


