Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73AE4333FA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:54:31 +0200 (CEST)
Received: from localhost ([::1]:37652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcmlJ-0002Uk-SQ
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcmk3-0001c7-VW
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:53:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcmk2-0002aq-3F
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:53:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634640789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=EwW6Z8crEPlFJeOSR/EZUxBlTrM5rTZfdnxMnuSM/tU=;
 b=aCc10a3aOfo5ONM3D71rh2GnOd748rm/RI4/Atp4MjBX74odkiN12COO8XlqOcW5l4Ph0Z
 U72pqI3J7vzv8FiSoQE0ll8WAsa2CcBlAdUgtk0tNmKa3W5sr5Z8AxvgstKpxdJYZw6q+G
 Lucrg8lTvYcYOby5CY7vhyv6RDom/Ik=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-Ei-CiGj2NkOMd-LGlev34A-1; Tue, 19 Oct 2021 06:53:08 -0400
X-MC-Unique: Ei-CiGj2NkOMd-LGlev34A-1
Received: by mail-wr1-f70.google.com with SMTP id
 l8-20020a5d6d88000000b001611b5de796so9998339wrs.10
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 03:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:in-reply-to;
 bh=EwW6Z8crEPlFJeOSR/EZUxBlTrM5rTZfdnxMnuSM/tU=;
 b=zwch9/4bm1c6jY4shTrrq8NL956tOOU2LSXFXi2ARVcls7UngFSB+PreKIYhhxXg0d
 FDj/70LEVok9gr2Qx65O8HiMYSaka1ZjZwzP27LIypDnVbhzB9BHR8kU0+LmY9fZM1SR
 1VKlOO54eF1H/CvouxpUmzTlluDcclxIz8oIYyOjUg5wSxVzqgFa3PqzW85Dwk2I+ULG
 yLS4YZSL0tLhF7gAlGC0Hq8QWwIJbxC5YY15vZYABznof5r6b4uDYLERVH7bqwkWLAdX
 01qrkg5LPuHRfP6fzCmxanmAxDvpM0Y8pQLQuQQgKCHShP/B86H77IMGAA7w3dCJm2fZ
 t06A==
X-Gm-Message-State: AOAM530wValdxrUV3BLbOACRY91gStCS6EoR+vvBoP26Izyc00MoO4VG
 WsBOjr+DuGyEi+R342aQqgc6pkwfP8enKLoYtUAoMyWmR1GUGVMu57f8VLRUwY5WjycYd4Ualg8
 EoNNGSPcQ6/eZLRs=
X-Received: by 2002:a1c:a1c2:: with SMTP id k185mr5357072wme.144.1634640786866; 
 Tue, 19 Oct 2021 03:53:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUJyyG3cKThT9wDJNI+720xgaxBEYdd9ofM5NACEKKyvGCbmfzrEI9ztJbvezWGhfoJZV6FQ==
X-Received: by 2002:a1c:a1c2:: with SMTP id k185mr5357045wme.144.1634640786598; 
 Tue, 19 Oct 2021 03:53:06 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id p8sm1857790wmg.15.2021.10.19.03.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 03:53:05 -0700 (PDT)
Date: Tue, 19 Oct 2021 06:52:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xueming Li <xuemingl@nvidia.com>
Subject: Re: [PATCH v5 1/2] vhost-user: fix VirtQ notifier cleanup
Message-ID: <20211019064825-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211019075743.2162432-3-xuemingl@nvidia.com>
 <20211019075743.2162432-2-xuemingl@nvidia.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 03:57:42PM +0800, Xueming Li wrote:
> When vhost-user device cleanup and unmmap notifier address, VM cpu

you mean cleanup is executed and un-mmaps ...

> thread that writing the notifier failed

that writing -> writing
failed -> fails

> with accessing invalid address.

... error

> 
> To avoid this concurrent issue, wait memory flatview update by draining

wait -> wait for a 

> rcu callbacks, then unmap notifiers.
> 
> Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
> Cc: qemu-stable@nongnu.org
> Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
> Signed-off-by: Xueming Li <xuemingl@nvidia.com>


If I apply this, qos-test hangs.




> ---
>  hw/virtio/vhost-user.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index bf6e50223c..cfca1b9adc 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -18,6 +18,7 @@
>  #include "chardev/char-fe.h"
>  #include "io/channel-socket.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/cpus.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/sockets.h"
> @@ -1165,6 +1166,12 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
>  
>      if (n->addr && n->set) {
>          virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
> +        if (!qemu_in_vcpu_thread()) { /* Avoid vCPU dead lock. */

ok this avoids deadlock, but the comment does not explain:
why does not vcpu thread
need to wait for other VCPU threads? what if one of these
is in the middle of notify?


> +            /* Wait for VM threads accessing old flatview which contains notifier. */
> +            drain_call_rcu();
> +        }
> +        munmap(n->addr, qemu_real_host_page_size);
> +        n->addr = NULL;
>          n->set = false;
>      }
>  }
> @@ -1502,12 +1509,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
>  
>      n = &user->notifier[queue_idx];
>  
> -    if (n->addr) {
> -        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
> -        object_unparent(OBJECT(&n->mr));
> -        munmap(n->addr, page_size);
> -        n->addr = NULL;
> -    }
> +    vhost_user_host_notifier_remove(dev, queue_idx);
>  
>      if (area->u64 & VHOST_USER_VRING_NOFD_MASK) {
>          return 0;
> @@ -2485,11 +2487,17 @@ void vhost_user_cleanup(VhostUserState *user)
>      for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>          if (user->notifier[i].addr) {
>              object_unparent(OBJECT(&user->notifier[i].mr));
> +        }
> +    }
> +    memory_region_transaction_commit();
> +    /* Wait for VM threads accessing old flatview which contains notifier. */
> +    drain_call_rcu();
> +    for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
> +        if (user->notifier[i].addr) {
>              munmap(user->notifier[i].addr, qemu_real_host_page_size);
>              user->notifier[i].addr = NULL;
>          }
>      }
> -    memory_region_transaction_commit();
>      user->chr = NULL;
>  }
>  
> -- 
> 2.33.0


