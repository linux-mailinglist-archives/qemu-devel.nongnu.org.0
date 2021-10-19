Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DA243340B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:59:26 +0200 (CEST)
Received: from localhost ([::1]:44332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcmq5-0007Co-O3
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcmmk-0003y1-PQ
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:55:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcmmi-0004vr-6r
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634640955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oF1LO+zZt5LPqidAFiTdzHJSWmeS04R8XzKItGwlBUI=;
 b=abVPNEVLKWsE26aKCNA+0ULDHGQFPMwYnP6ErCwOOgzeoG7vSjn9oeTWhlTdN2PNvMyKac
 RJZhwSY75jxH+L5wo2vidiNuO4/cyiGxQoFwH1gfGsvPi54oEvo9q4Ms4eZhCCpTuUNMCR
 IREWcf+o6ahj7Du1aX2dra0ghaAozEw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-5MM4TNZtPaS476UcOTV_fg-1; Tue, 19 Oct 2021 06:55:54 -0400
X-MC-Unique: 5MM4TNZtPaS476UcOTV_fg-1
Received: by mail-wr1-f72.google.com with SMTP id
 s1-20020adfc541000000b001645b92c65bso4771669wrf.6
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 03:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oF1LO+zZt5LPqidAFiTdzHJSWmeS04R8XzKItGwlBUI=;
 b=5cKt1SJCDCUikBKsnZpjZpDnlb+YB/b7K9FiLvGxAPhuliVcOTM6NtJdS0Z8Ja1YDe
 qf1siVOX5BayAs7SnFC4Cvu4x+Rf6YITt5rco4wA30rkOFWccrQhkA9fx4j9op2rvAx2
 LOZI5OJ05+9QkL6ebgx40UqlQz7SQAU7zR2RhDX9W+dIpsnP1du4mzR6vNCgAJcGdIs4
 dvYUl84cue1v7Y4gXbDGovwFMV37IXv4fAR4xxYm0njjiHkYO3fMkaUUKF17UEb0stdp
 j/T5WCQK0LAlEMCXdkY/lcvKaq6GVnPNOFUlhiyyIzHkZtoMXVH7J29OFss8SldvVHMd
 DNpA==
X-Gm-Message-State: AOAM533lMYArnuhj6n3sQfSlQmW/s040RRLpq1ArXoesy36zfQcT2UHY
 q4tEPeKo5hHd66jgP02v+SetOb+/cbFMJkds4DdQ8oPn9EjnIvRrAmt0wAUuIgcEkzUC+JXhkme
 CP9UCN/lPrI/SCO8=
X-Received: by 2002:adf:f044:: with SMTP id t4mr43075329wro.406.1634640952892; 
 Tue, 19 Oct 2021 03:55:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw64gQGACLNHzRHh1RhxEt8O5Ny+vUag0e48MVm+bZoR1hZigL+3nHtExGWIPrtwMFMvZGGFQ==
X-Received: by 2002:adf:f044:: with SMTP id t4mr43075299wro.406.1634640952646; 
 Tue, 19 Oct 2021 03:55:52 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id h11sm14094824wrz.5.2021.10.19.03.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 03:55:52 -0700 (PDT)
Date: Tue, 19 Oct 2021 06:55:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xueming Li <xuemingl@nvidia.com>
Subject: Re: [PATCH v5 2/2] vhost-user: remove VirtQ notifier restore
Message-ID: <20211019065517-mutt-send-email-mst@kernel.org>
References: <20211019075743.2162432-1-xuemingl@nvidia.com>
 <20211019075743.2162432-3-xuemingl@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20211019075743.2162432-3-xuemingl@nvidia.com>
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

On Tue, Oct 19, 2021 at 03:57:43PM +0800, Xueming Li wrote:
> When vhost-user vdpa client restart, VQ notifier mmap address and MR
> become invalid, restore MR only is wrong.

wrong how? as opposed to what?

> vdpa client will set VQ
> notifier after reconnect.
> 
> This patch removes VQ notifier restore and related flags.

with the result that ...

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
> index cfca1b9adc..cc33f4b042 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1144,19 +1144,6 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
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
> @@ -1164,7 +1151,7 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
>      VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
>      VirtIODevice *vdev = dev->vdev;
>  
> -    if (n->addr && n->set) {
> +    if (n->addr) {
>          virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
>          if (!qemu_in_vcpu_thread()) { /* Avoid vCPU dead lock. */
>              /* Wait for VM threads accessing old flatview which contains notifier. */
> @@ -1172,15 +1159,12 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
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
> @@ -1540,7 +1524,6 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
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


