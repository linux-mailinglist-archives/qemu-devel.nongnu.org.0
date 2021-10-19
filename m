Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2755432EB5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 08:56:53 +0200 (CEST)
Received: from localhost ([::1]:53554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcj3N-0007km-0g
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 02:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mciuu-0005m8-Cm
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:48:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mciuq-0007xw-22
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634626082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cD7rRqViLcOUeSMoqT2K/dhZOHZk+Q8oV7ZNCsCJrnE=;
 b=R4uShUDMsD9l2MhTHBIHFS4Uk4BNJqZj/oCCaA3jtXLDvaoPL8FQIMzXE3Ybso5ObOGCie
 5ujsQgo9knsB8VXxczIJQVPBh8wIPtOmrUADvBFKYHs1tuIRgLuvYL52wVdNvoRR0eVO1h
 aDAetha9uGPNFM8pV3kJ3W1c9UL0oX0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428--sfq9fahO9iDNNBRsik9-A-1; Tue, 19 Oct 2021 02:48:00 -0400
X-MC-Unique: -sfq9fahO9iDNNBRsik9-A-1
Received: by mail-wr1-f72.google.com with SMTP id
 p12-20020adfc38c000000b00160d6a7e293so9699729wrf.18
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 23:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cD7rRqViLcOUeSMoqT2K/dhZOHZk+Q8oV7ZNCsCJrnE=;
 b=Ajm9buqGf+85KHcEV06NZGkXoAJ85klkLV9vpZrlqoWIptTxtBZsNcvekg/eZ7srSG
 QAoq/WT75WwP6v+2YZ9b9TbHor4LlR7qhxF8dqSHzQqboiYk7svEGcrvteSmo/SEETHj
 n7GAom5hQOWWY3BZrh6FKpBIMoKFGGNAq4Wa0ZJmx3P7SVxRXPn27Gu91Mf/Xg3SzE4X
 +Xxw893xtH7DnXfhX+ZPvSZmNQ3YVX/ZvpcgEHH5BKkYfVtEi6TMty5XIvx8pM2SylI3
 Kzc3XHVKrIzbLf3Xppv0iGik/3qRCygj2B54whu9zA2Wrz7/cqGkIME9FBaMowh7vOvV
 HcPQ==
X-Gm-Message-State: AOAM5324DGNYb+2keH4mJHrVwFyBuOmkX0Oz7UJFX50RD+EWbYh26SLg
 h5l5r+rvIh9h4gVItDGhQ9uprmLwSqcI6m3fDdXBLgLS25J1DMRMr0AGt/RbCUTkwxQ1KbckPwL
 rKO89t8nQ+fq8o2c=
X-Received: by 2002:a05:600c:2111:: with SMTP id
 u17mr3934105wml.162.1634626078265; 
 Mon, 18 Oct 2021 23:47:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2kSqt6F1rdRH/grSVpqJxTrNCAeHnXjRLsg9kMszJdeEjLoenVtQ9y6qyndeICKwP1LlKJw==
X-Received: by 2002:a05:600c:2111:: with SMTP id
 u17mr3934080wml.162.1634626077958; 
 Mon, 18 Oct 2021 23:47:57 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id z6sm1706691wmp.1.2021.10.18.23.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 23:47:57 -0700 (PDT)
Date: Tue, 19 Oct 2021 02:47:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v9 01/10] virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
Message-ID: <20211019023945-mutt-send-email-mst@kernel.org>
References: <20210930023348.17770-1-lulu@redhat.com>
 <20210930023348.17770-2-lulu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930023348.17770-2-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: jasowang@redhat.com, dgilbert@redhat.com, qemu-devel@nongnu.org,
 arei.gonglei@huawei.com, kraxel@redhat.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 10:33:39AM +0800, Cindy Lu wrote:
> To support configure interrupt for vhost-vdpa
> introduce VIRTIO_CONFIG_IRQ_IDX -1 as config queue index, Then we can reuse
> the function guest_notifier_mask and guest_notifier_pending.
> Add the check of queue index, if the driver does not support configure
> interrupt, the function will just return
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>

typo in subject

Also the commit log and subject do not seem to match what patch is
doing. Description makes it look like a refactoring, but
it isn't. guest_notifier_mask don't exist.
And I'm not sure why it's safe to do nothing e.g. in
pending.




> ---
>  hw/display/vhost-user-gpu.c    |  6 ++++++
>  hw/net/virtio-net.c            | 10 +++++++---
>  hw/virtio/vhost-user-fs.c      |  9 +++++++--
>  hw/virtio/vhost-vsock-common.c |  6 ++++++
>  hw/virtio/virtio-crypto.c      |  6 ++++++
>  include/hw/virtio/virtio.h     |  2 ++
>  6 files changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
> index 49df56cd14..73ad3d84c9 100644
> --- a/hw/display/vhost-user-gpu.c
> +++ b/hw/display/vhost-user-gpu.c
> @@ -485,6 +485,9 @@ vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx)
>  {
>      VhostUserGPU *g = VHOST_USER_GPU(vdev);
>  
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return false;
> +    }
>      return vhost_virtqueue_pending(&g->vhost->dev, idx);
>  }
>  
> @@ -493,6 +496,9 @@ vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
>  {
>      VhostUserGPU *g = VHOST_USER_GPU(vdev);
>  
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
>      vhost_virtqueue_mask(&g->vhost->dev, vdev, idx, mask);
>  }
>  
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 16d20cdee5..65b7cabcaf 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3152,7 +3152,10 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
>      VirtIONet *n = VIRTIO_NET(vdev);
>      NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>      assert(n->vhost_started);
> -    return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
> +    if (idx != VIRTIO_CONFIG_IRQ_IDX) {
> +        return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
> +    }
> +    return false;
>  }
>  
>  static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
> @@ -3161,8 +3164,9 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>      VirtIONet *n = VIRTIO_NET(vdev);
>      NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>      assert(n->vhost_started);
> -    vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
> -                             vdev, idx, mask);
> +    if (idx != VIRTIO_CONFIG_IRQ_IDX) {
> +        vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
> +    }
>  }
>  
>  static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index c595957983..309c8efabf 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -156,11 +156,13 @@ static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>       */
>  }
>  
> -static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
> -                                            bool mask)
> +static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
>  {
>      VHostUserFS *fs = VHOST_USER_FS(vdev);
>  
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
>      vhost_virtqueue_mask(&fs->vhost_dev, vdev, idx, mask);
>  }
>  
> @@ -168,6 +170,9 @@ static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx)
>  {
>      VHostUserFS *fs = VHOST_USER_FS(vdev);
>  
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return false;
> +    }
>      return vhost_virtqueue_pending(&fs->vhost_dev, idx);
>  }
>  
> diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> index 4ad6e234ad..2112b44802 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -101,6 +101,9 @@ static void vhost_vsock_common_guest_notifier_mask(VirtIODevice *vdev, int idx,
>  {
>      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>  
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
>      vhost_virtqueue_mask(&vvc->vhost_dev, vdev, idx, mask);
>  }
>  
> @@ -109,6 +112,9 @@ static bool vhost_vsock_common_guest_notifier_pending(VirtIODevice *vdev,
>  {
>      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>  
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return false;
> +    }
>      return vhost_virtqueue_pending(&vvc->vhost_dev, idx);
>  }
>  
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index 54f9bbb789..1d5192f8b4 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -948,6 +948,9 @@ static void virtio_crypto_guest_notifier_mask(VirtIODevice *vdev, int idx,
>  
>      assert(vcrypto->vhost_started);
>  
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
>      cryptodev_vhost_virtqueue_mask(vdev, queue, idx, mask);
>  }
>  
> @@ -958,6 +961,9 @@ static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
>  
>      assert(vcrypto->vhost_started);
>  
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return false;
> +    }
>      return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
>  }
>  
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index fa711a8912..2766c293f4 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -67,6 +67,8 @@ typedef struct VirtQueueElement
>  
>  #define VIRTIO_NO_VECTOR 0xffff
>

Add a comment here. E.g. /* special index value used internally for config irqs */
  
> +#define VIRTIO_CONFIG_IRQ_IDX -1
> +
>  #define TYPE_VIRTIO_DEVICE "virtio-device"
>  OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
>  
> -- 
> 2.21.3


