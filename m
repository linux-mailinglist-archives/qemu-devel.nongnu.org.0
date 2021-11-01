Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3180442256
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 22:06:51 +0100 (CET)
Received: from localhost ([::1]:46828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mheW2-0000uH-Gb
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 17:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mheQX-0006y4-2C
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 17:01:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mheQO-0003lG-6y
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 17:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635800457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wm0XUHKurA4ErlUZF3ieRiuX0DFI3ZpMIlULVm/bgkc=;
 b=Fn8HYWtdXUQAkHiprELYY+xP0QZn30D1mj7gTaY+WQJ/8Usjsg3H+qtKfxb/0pgPBVx38W
 3zTAwmPqhpm5pztf2HAjFTb2zgm6rGxtYf0Ev3NTjTyppORPXeJP13yEBY1zjxi49cLmc5
 cm1Ab0edJTcg9C8O3Lgk29Qd5ga9uwk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-uE859N0APKW3gqzyPK5Sjw-1; Mon, 01 Nov 2021 17:00:56 -0400
X-MC-Unique: uE859N0APKW3gqzyPK5Sjw-1
Received: by mail-ed1-f69.google.com with SMTP id
 t18-20020a056402021200b003db9e6b0e57so16739384edv.10
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 14:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wm0XUHKurA4ErlUZF3ieRiuX0DFI3ZpMIlULVm/bgkc=;
 b=G/ufQMDn2jSy8wMk/4AQibijW4WTuYfh80rSh3HOXnQ3GwYyh3JdT/6MLl159gFNpy
 xIGsPyuejJoK7aAsRoDG+DFaZNrvUBDmWzfkMFAELBh05KpmKhjJA9/QWT83StG7JM3e
 jIuocDc3XgJS7Qo2wWM/Dma8BJd326eBS5Em8wc/IHs0PCr6v/2jczPYGVCCij9xQGVj
 VDGzmZQZ8DtUcsNIEqLn5V2UD3uRDnGQ58Jop8CbDg1bYxD6XuaLpgYKdWlJfftpkvYr
 4NxcnXQICHDwmNv7HyShEdnLS+Xp06txaZFMW7GgpAPLFyczx4JPcUFFZ4SCLetHeZNq
 sThQ==
X-Gm-Message-State: AOAM530A+cv8jCG1CVAwbjSZf1KE5VIuDuDfwBB2zGoBub9QVDP+G/kV
 o8zVoaOyU+ABOwwtEmMxMYdiaYnbB0FQab6P/fomqxyNsKbQpzlvTN8rRn/E3Bpb/Lqo1x9KSgR
 zDtd6i15E+fxS9nQ=
X-Received: by 2002:a17:906:58d0:: with SMTP id
 e16mr39047809ejs.181.1635800454962; 
 Mon, 01 Nov 2021 14:00:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2KtKi5OZ+hJzuS4m4dJp4PdT8YF/xmurWvXlBiIneoHUnBjr730w3Nm4Fw2/vi1e2Lcnk8g==
X-Received: by 2002:a17:906:58d0:: with SMTP id
 e16mr39047778ejs.181.1635800454620; 
 Mon, 01 Nov 2021 14:00:54 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id r19sm9277951edt.54.2021.11.01.14.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 14:00:52 -0700 (PDT)
Date: Mon, 1 Nov 2021 17:00:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xueming Li <xuemingl@nvidia.com>
Subject: Re: [PATCH v6 2/2] vhost-user: fix VirtQ notifier cleanup
Message-ID: <20211101165311-mutt-send-email-mst@kernel.org>
References: <20211101083813.1224522-1-xuemingl@nvidia.com>
 <20211101083813.1224522-3-xuemingl@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20211101083813.1224522-3-xuemingl@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.734, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Mon, Nov 01, 2021 at 04:38:13PM +0800, Xueming Li wrote:
> When vhost-user device cleanup is executed and un-mmaps notifier
> address, VM cpu thread writing the notifier fails by accessing invalid
> address error.
> 
> To avoid this concurrent issue, call RCU and wait for a memory flatview
> update, then un-mmap notifiers in callback.
> 
> Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
> Cc: qemu-stable@nongnu.org
> Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
> Signed-off-by: Xueming Li <xuemingl@nvidia.com>
> ---
>  hw/virtio/vhost-user.c         | 50 +++++++++++++++++++++-------------
>  include/hw/virtio/vhost-user.h |  2 ++
>  2 files changed, 33 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index c671719e9b..5adad4d029 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -25,6 +25,7 @@
>  #include "migration/migration.h"
>  #include "migration/postcopy-ram.h"
>  #include "trace.h"
> +#include "exec/ramblock.h"
>  
>  #include <sys/ioctl.h>
>  #include <sys/socket.h>
> @@ -1143,15 +1144,27 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
>      return vhost_set_vring(dev, VHOST_USER_SET_VRING_NUM, ring);
>  }
>  
> -static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
> -                                            int queue_idx)
> +static void vhost_user_host_notifier_free(VhostUserHostNotifier *n)
>  {
> -    struct vhost_user *u = dev->opaque;
> -    VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
> -    VirtIODevice *vdev = dev->vdev;
> +    assert(n && n->old_addr);
> +    munmap(n->old_addr, qemu_real_host_page_size);
> +    n->old_addr = NULL;
> +}
> +
> +static void vhost_user_host_notifier_remove(VhostUserState *user,
> +                                            VirtIODevice *vdev, int queue_idx)
> +{
> +    VhostUserHostNotifier *n = &user->notifier[queue_idx];
>  
>      if (n->addr) {
> -        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
> +        if (vdev) {
> +            virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
> +        }
> +        assert(n->addr);
> +        assert(!n->old_addr);
> +        n->old_addr = n->addr;
> +        n->addr = NULL;
> +        call_rcu(n, vhost_user_host_notifier_free, rcu);
>      }
>  }
>  
> @@ -1190,8 +1203,9 @@ static int vhost_user_get_vring_base(struct vhost_dev *dev,
>          .payload.state = *ring,
>          .hdr.size = sizeof(msg.payload.state),
>      };
> +    struct vhost_user *u = dev->opaque;
>  
> -    vhost_user_host_notifier_remove(dev, ring->index);
> +    vhost_user_host_notifier_remove(u->user, dev->vdev, ring->index);
>  
>      if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>          return -1;
> @@ -1486,12 +1500,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
>  
>      n = &user->notifier[queue_idx];
>  
> -    if (n->addr) {
> -        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
> -        object_unparent(OBJECT(&n->mr));
> -        munmap(n->addr, page_size);
> -        n->addr = NULL;
> -    }
> +    vhost_user_host_notifier_remove(user, vdev, queue_idx);
>  
>      if (area->u64 & VHOST_USER_VRING_NOFD_MASK) {
>          return 0;
> @@ -1510,9 +1519,12 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
>  
>      name = g_strdup_printf("vhost-user/host-notifier@%p mmaps[%d]",
>                             user, queue_idx);
> -    if (!n->mr.ram) /* Don't init again after suspend. */
> +    if (!n->mr.ram) { /* Don't init again after suspend. */
>          memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
>                                            page_size, addr);
> +    } else {
> +        n->mr.ram_block->host = addr;
> +    }
>      g_free(name);
>  
>      if (virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true)) {
> @@ -2460,17 +2472,17 @@ bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp)
>  void vhost_user_cleanup(VhostUserState *user)
>  {
>      int i;
> +    VhostUserHostNotifier *n;
>  
>      if (!user->chr) {
>          return;
>      }
>      memory_region_transaction_begin();
>      for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
> -        if (user->notifier[i].addr) {
> -            object_unparent(OBJECT(&user->notifier[i].mr));
> -            munmap(user->notifier[i].addr, qemu_real_host_page_size);
> -            user->notifier[i].addr = NULL;
> -        }
> +        n = &user->notifier[i];
> +        assert(!n->addr);

I'm pretty confused as to why this assert holds.
Add a comment?

> +        vhost_user_host_notifier_remove(user, NULL, i);
> +        object_unparent(OBJECT(&n->mr));
>      }
>      memory_region_transaction_commit();
>      user->chr = NULL;

I'm also confused on why we can do unparent for notifiers which have
never been set up. Won't n->mr be invalid then?


> diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
> index f6012b2078..03aa22d450 100644
> --- a/include/hw/virtio/vhost-user.h
> +++ b/include/hw/virtio/vhost-user.h
> @@ -12,8 +12,10 @@
>  #include "hw/virtio/virtio.h"
>  
>  typedef struct VhostUserHostNotifier {
> +    struct rcu_head rcu;
>      MemoryRegion mr;
>      void *addr;
> +    void *old_addr;

That's not a very clear name. Is this literally just
"address for the rcu callback to unmap"?
Maybe unmap_addr then?

>  } VhostUserHostNotifier;
>  
>  typedef struct VhostUserState {
> -- 
> 2.33.0


