Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDDA432E7C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 08:42:38 +0200 (CEST)
Received: from localhost ([::1]:54942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcipZ-0005yQ-JF
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 02:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcikx-0001bf-Rc
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:37:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcikw-0003Mv-10
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634625469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iKxmUuPVWl+K9c3Y/g7mw2KbTFIx3RlSpXAD8u73Qrs=;
 b=FoEJCU3g1GAXb0nuoBF9wl1MF5unxchs2aGgBp3ap/0FYpvqzDJhz9a3GYNSKOtdJ5Y9jI
 qEkmoUhsjkpzzIzL61q2Bjoaswq4xDZudugM7Gb84H2NS1NJrnd9FpeA29Q25yeQOZQyif
 It/PfojU5bHQ4jaj4NSWVc6aqfoG8+s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-7NGOS3aZM863ZiPLvcnbwg-1; Tue, 19 Oct 2021 02:37:48 -0400
X-MC-Unique: 7NGOS3aZM863ZiPLvcnbwg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v18-20020a7bcb52000000b00322fea1d5b7so737982wmj.9
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 23:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iKxmUuPVWl+K9c3Y/g7mw2KbTFIx3RlSpXAD8u73Qrs=;
 b=OCXx7ydAKPLQwn55523gK6LSSaxo+AH8ldU+WCYLD9mw6q0DAQrKpRwLh4caQqjVgB
 kRdiGbtDzeLVVYMZV8ult5ppnSPPYOkvUjK715iWtpORLoZopIxiFlWX/i1debCun1PC
 01TCcWh16xOIVPnDVH0Wmv04unIHYqDedrR8JSOJ6C79cBnBy/uYESbu6HG8AsSf5Z9S
 Dj/Er3YzJyTr/Esr1DnLoxAkA2/Tmvg2ezIxreV2xn5+oKv4qj6hm18bwkTye9BTFRsz
 hgRtQuLPY7B/iffqeNZzdVOgZL3lvjTVWkNgqRGy2OPwUYzIqfpjo4Cshv2XximUr+6B
 0w3g==
X-Gm-Message-State: AOAM531wvCQKopV6ybE3AL/dJItXK4KArMnWj6LBI48vM/4GA+uF+suj
 wGkVdlvuXsxMQVpMXnG8AWtSwwfsuukkSV7G0w5HpdsdeDJqACLxQaJwIYwG43ViRObZ2xsKUKd
 s/Nwf1dAYbRHANvg=
X-Received: by 2002:a1c:a5cd:: with SMTP id o196mr4094214wme.96.1634625466984; 
 Mon, 18 Oct 2021 23:37:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4PcGJcLltIfAghUJTxjeRFzZD0sFKMO3gAlwqjnyYwKx8/wuZikBP0xaHdXJHlTPKSqaAvQ==
X-Received: by 2002:a1c:a5cd:: with SMTP id o196mr4094201wme.96.1634625466752; 
 Mon, 18 Oct 2021 23:37:46 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id q14sm1343875wmq.4.2021.10.18.23.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 23:37:46 -0700 (PDT)
Date: Tue, 19 Oct 2021 02:37:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xueming Li <xuemingl@nvidia.com>
Subject: Re: [PATCH v3 2/2] vhost-user: remove VirtQ notifier restore
Message-ID: <20211019022100-mutt-send-email-mst@kernel.org>
References: <20211008075805.589644-1-xuemingl@nvidia.com>
 <20211008075805.589644-3-xuemingl@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20211008075805.589644-3-xuemingl@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, qemu-devel@nongnu.org,
 tiwei.bie@intel.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 08, 2021 at 03:58:05PM +0800, Xueming Li wrote:
> When vhost-user vdpa client restart, VQ notifier resources become
> invalid, no need to keep mmap, vdpa client will set VQ notifier after
> reconnect.
> 
> Removes VQ notifier restore and related flags.
> 
> Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
> Cc: tiwei.bie@intel.com
> Cc: qemu-stable@nongnu.org
> Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
> Signed-off-by: Xueming Li <xuemingl@nvidia.com>

Pls fix up bisect and repost.
Also, can you please clarify what does "no need" mean?
You include a Fixes tag but is there a bug? What behaviour
are you trying to fix? A resource leak?
Or are you just simplifying code?
If the later then no need for a Fixes tag.




> ---
>  hw/virtio/vhost-user.c         | 20 ++------------------
>  include/hw/virtio/vhost-user.h |  1 -
>  2 files changed, 2 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index b2e948bdc7..d127aa478a 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -22,6 +22,7 @@
>  #include "qemu/main-loop.h"
>  #include "qemu/sockets.h"
>  #include "sysemu/cryptodev.h"
> +#include "sysemu/cpus.h"
>  #include "migration/migration.h"
>  #include "migration/postcopy-ram.h"
>  #include "trace.h"
> @@ -1143,19 +1144,6 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
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
> @@ -1163,7 +1151,7 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
>      VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
>      VirtIODevice *vdev = dev->vdev;
>  
> -    if (n->addr && n->set) {
> +    if (n->addr) {
>          virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
>          if (!qemu_in_vcpu_thread()) { /* Avoid vCPU dead lock. */
>              /* Wait for VM threads accessing old flatview which contains notifier. */
> @@ -1171,15 +1159,12 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
>          }
>          munmap(n->addr, qemu_real_host_page_size);
>          n->addr = NULL;
> -        n->set = false;
>      }
>  }
>  
>  static int vhost_user_set_vring_base(struct vhost_dev *dev,
>                                       struct vhost_vring_state *ring)
>  {
> -    vhost_user_host_notifier_restore(dev, ring->index);
> -
>      return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
>  }
>  
> @@ -1539,7 +1524,6 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
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


