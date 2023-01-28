Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4C667F716
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 11:23:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLiLh-0002Qj-NN; Sat, 28 Jan 2023 05:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLiLf-0002QU-0I
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 05:22:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLiLc-00034U-Uj
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 05:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674901331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aYOUCKVwd/ni/RKtcBJZFKT3igbLn1pvhDgIUs3Og74=;
 b=fV4p0QP1aErZK8fCKcoKc+pUmXlbBCyjqyW7voI5KJtSkHjSoOuzvuMlPnuJ8KbD0dsRsy
 Pvn5OZxhWc157m7kh1IMw4pzMHBZwItROWZEE0WilyxiPmchtOL4JkQUTs6EhqRCGxvCzn
 q6w2KMyAuNxyS9HwaKBAhTVxtYH9RKk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-H1SQQbyiOvuN9KOO4KUEtw-1; Sat, 28 Jan 2023 05:22:09 -0500
X-MC-Unique: H1SQQbyiOvuN9KOO4KUEtw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so6146901wmq.2
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 02:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aYOUCKVwd/ni/RKtcBJZFKT3igbLn1pvhDgIUs3Og74=;
 b=yJl3YikRBcsv0wATEIrgR+JXaPh/PB0HRIhrwLJlKMTGZiyWm3Sgo9FjX+O1CKsG3n
 u75cAQt895bPU8mGhAy8lCXZjXtPTzSIEJSFl/6THak4hXrG/gX9c2/iLcPecKiyRfJe
 CIbDthG6FL6bxkblBhUqqYFGF9J7dvUUl1d62lScCa/OX3EOZGYdks8XWGNX53HtrVDG
 DxYeyYv/oJOFRI2VEQyeO8vngevK5HviOrpT+tuQShLz3yluG/rG0tr4fICoG63gHT3u
 r3t6USr/O5buFVsjyXPnBV+C2K8L7Hc0zZ2G49Uw3RIPGpxmhfJboeWC7OCaMAcQyV/N
 rmdg==
X-Gm-Message-State: AFqh2koPavZQ6az+KM2VKW6KPS/lnBUlj7W/AaMTZn0G0a1UmCd2WIOf
 bOslC0x6OHnpY4w7sH/Zy6wS8q+0NKiI+2DjD45TLDblqoCeJOzuOcg2GeHX1lSNmYhRT6C7p7s
 YsRxjKuiqSNIz5Lg=
X-Received: by 2002:a05:600c:502c:b0:3db:30d:deac with SMTP id
 n44-20020a05600c502c00b003db030ddeacmr43284302wmr.1.1674901328723; 
 Sat, 28 Jan 2023 02:22:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtMhpLN8hTwyVspW379Q6TOZf+zr3e7vwDX1a/1sNeNBsAwBWKII+RL05SWvBZumxFYHoNKRw==
X-Received: by 2002:a05:600c:502c:b0:3db:30d:deac with SMTP id
 n44-20020a05600c502c00b003db030ddeacmr43284287wmr.1.1674901328464; 
 Sat, 28 Jan 2023 02:22:08 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 y21-20020a05600c341500b003da28dfdedcsm207012wmp.5.2023.01.28.02.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 02:22:07 -0800 (PST)
Date: Sat, 28 Jan 2023 05:22:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/3]  virtio: struct VirtQueue introduce reset
Message-ID: <20230128050411-mutt-send-email-mst@kernel.org>
References: <20230128071724.33677-1-xuanzhuo@linux.alibaba.com>
 <20230128071724.33677-3-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230128071724.33677-3-xuanzhuo@linux.alibaba.com>
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

On Sat, Jan 28, 2023 at 03:17:23PM +0800, Xuan Zhuo wrote:
>  In the current design, we stop the device from operating on the vring
>  during per-queue reset by resetting the structure VirtQueue.
> 
>  But before the reset operation, when recycling some resources, we should
>  stop referencing new vring resources. For example, when recycling
>  virtio-net's asynchronous sending resources, virtio-net should be able
>  to perceive that the current queue is in the per-queue reset state, and
>  stop sending new packets from the tx queue.
> 
>  Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>  hw/virtio/virtio.c         | 8 ++++++++
>  include/hw/virtio/virtio.h | 3 +++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 03077b2ecf..907d5b8bde 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2030,6 +2030,12 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
>  {
>      VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>  
> +    /*
> +     * Mark this queue is per-queue reset status. The device should release the
> +     * references of the vring, and not refer more new vring item.
> +     */
> +    vdev->vq[queue_index].reset = true;
> +
>      if (k->queue_reset) {
>          k->queue_reset(vdev, queue_index);
>      }
> @@ -2053,6 +2059,8 @@ void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
>      }
>      */
>  
> +    vdev->vq[queue_index].reset = false;
> +
>      if (k->queue_enable) {
>          k->queue_enable(vdev, queue_index);
>      }
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 1c0d77c670..b888538d09 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -251,6 +251,9 @@ struct VirtQueue {
>      /* Notification enabled? */
>      bool notification;
>  
> +    /* Per-Queue Reset status */
> +    bool reset;
> +
>      uint16_t queue_index;
>  

Reset state makes no sense. It seems to imply queue_reset
in the spec. And for extra fun there's "reset" in the pci
proxy which means "virtio_queue_reset is in progress" - I have no
idea what uses it though - it is not guest visible.  First what is it?
It actually means "queue has been reset and not has not been enabled since".
So disabled_by_reset maybe?

Second this hack helps make the change minimal
so it's helpful for stable, but it's ugly in that it
duplicates the reverse of enabled value - we don't really
care what disabled it in practice.

With the fixups above I can apply so it's easier to backport, but later
a patch on top should clean it all up, perhaps by adding
"enabled" in VirtQueue. We should also get rid of "reset" in the proxy
unless there's some way it's useful which I don't currently see.



>      unsigned int inuse;
> -- 
> 2.32.0.3.g01195cf9f


