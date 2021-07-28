Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24713D8EE6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 15:23:11 +0200 (CEST)
Received: from localhost ([::1]:45012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8jWg-0003tC-Ud
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 09:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m8jVH-00034W-7Q
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:21:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m8jV9-0004Wg-TE
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627478494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3GxkVyNCH4cE8y4r2VXyUFuHBpAYwQKwXAzeWDxFTYU=;
 b=IvRlXRC2dZfTZFXzhYHzGw7UnpNrl1YH9uB84FMrOl9UfkhawZp+7SR9mQAl0/opGpxQ1o
 dkZW5dp8MzwWcto11z4axx1gpWlptYFxSsaXbRwpLFgKO1+DXAsEoGbyRks4/4/IVZXfVq
 AjCyvuYTKYOg9vyv/1K+xuubl40huR0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-TBEXouqDPfa-gnwEmTdCaA-1; Wed, 28 Jul 2021 09:21:32 -0400
X-MC-Unique: TBEXouqDPfa-gnwEmTdCaA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r2-20020a05600c35c2b029023a3f081487so939673wmq.4
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 06:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3GxkVyNCH4cE8y4r2VXyUFuHBpAYwQKwXAzeWDxFTYU=;
 b=sc0+dApB8Aqz8rmqGIfTK0iBtakD0kSA5s80kV9kVxZ7wGQ5W0AVPOKaN9w7i+E5wl
 bLi2Y/hGCqxEIumc+O6mXh2bmWcxZtyJ1rYy8xnr8n56IY49jpyM1K0wMP6nS5X+y2JM
 a6hVP53yMZCWizLTvAVSyq86maxui3Uy9BqBtMaGIN6o8YOf8+8kj1FHnJB8Ai/l8EsS
 CONVmly1aIBfYVVS/eWHh+R1xeCSUm4QtonfLkBHnnd74oZA2xmzm7bWYj5tQgQi2hD+
 XK/y1nn7mDah9OysHlZm2hhjqfANo76PEDYF9XGBTuUfsidXKdoJQn82k3JQXJpeHhfN
 F+Ow==
X-Gm-Message-State: AOAM531VUUIHqI8hKqnMbrNyoOr250RXEy+kR7nbVvd6o9ttxNGXVAj8
 ZzrwOBcGAlCTIBxmpfkPhhr1qbU4ocuKXo1yCezUPu4Dv+wNOobem7BDiyNnwI6vU/nlIySUOPp
 IIc0d6nqj7Ah9T6Q=
X-Received: by 2002:a05:600c:4ecc:: with SMTP id
 g12mr9553286wmq.118.1627478491745; 
 Wed, 28 Jul 2021 06:21:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz8eHtp8lcDMUHu+bMeBT6PtIKByKVRshuXyMLM8geO3I11L4Dqp5YqITmf/Kzdq0yq09Lag==
X-Received: by 2002:a05:600c:4ecc:: with SMTP id
 g12mr9553257wmq.118.1627478491361; 
 Wed, 28 Jul 2021 06:21:31 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id n5sm6625194wri.31.2021.07.28.06.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 06:21:30 -0700 (PDT)
Date: Wed, 28 Jul 2021 14:21:29 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: [PATCH 3/7] virtio: Add shared memory capability
Message-ID: <YQFZ2Vl4dvy/neN+@work-vm>
References: <20210727170510.2116383-1-antonio.caggiano@collabora.com>
 <20210727170510.2116383-4-antonio.caggiano@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20210727170510.2116383-4-antonio.caggiano@collabora.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Antonio Caggiano (antonio.caggiano@collabora.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Define a new capability type 'VIRTIO_PCI_CAP_SHARED_MEMORY_CFG'.
> They allow defining shared memory regions with sizes and offsets
> of 2^32 and more.
> Multiple instances of the capability are allowed and distinguished
> by a device-specific 'id'.
> Use VIRTIO_GPU_SHM_ID_HOST_VISIBLE as id for virtio-gpu.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> (cherry picked from commit a5d628a3a3c5e60b98b15ffff197c36a77056115)

Could you please separate this off, so that you have my original
virtio-pci patch, adn then the gpu parts in a separate patch please.

Dave

> ---
>  hw/display/virtio-gpu-pci.c |  2 +-
>  hw/display/virtio-vga.c     |  2 +-
>  hw/virtio/virtio-pci.c      | 19 +++++++++++++++++++
>  hw/virtio/virtio-pci.h      |  5 +++++
>  4 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
> index 9808663d05..a79bd751b2 100644
> --- a/hw/display/virtio-gpu-pci.c
> +++ b/hw/display/virtio-gpu-pci.c
> @@ -43,7 +43,7 @@ static void virtio_gpu_pci_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>                           PCI_BASE_ADDRESS_MEM_PREFETCH |
>                           PCI_BASE_ADDRESS_MEM_TYPE_64,
>                           &g->hostmem);
> -        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, 0);
> +        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, VIRTIO_GPU_SHM_ID_HOST_VISIBLE);
>      }
>  
>      qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus), errp);
> diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
> index 61993dd3f2..ca841a0799 100644
> --- a/hw/display/virtio-vga.c
> +++ b/hw/display/virtio-vga.c
> @@ -147,7 +147,7 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>                           PCI_BASE_ADDRESS_MEM_PREFETCH |
>                           PCI_BASE_ADDRESS_MEM_TYPE_64,
>                           &g->hostmem);
> -        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, 0);
> +        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, VIRTIO_GPU_SHM_ID_HOST_VISIBLE);
>      }
>  
>      if (!(vpci_dev->flags & VIRTIO_PCI_FLAG_PAGE_PER_VQ)) {
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 433060ac02..37a50b4658 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1149,6 +1149,25 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
>      return offset;
>  }
>  
> +int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
> +                           uint8_t bar, uint64_t offset, uint64_t length,
> +                           uint8_t id)
> +{
> +    struct virtio_pci_cap64 cap = {
> +        .cap.cap_len = sizeof cap,
> +        .cap.cfg_type = VIRTIO_PCI_CAP_SHARED_MEMORY_CFG,
> +    };
> +    uint32_t mask32 = ~0;
> +
> +    cap.cap.bar = bar;
> +    cap.cap.length = cpu_to_le32(length & mask32);
> +    cap.length_hi = cpu_to_le32((length >> 32) & mask32);
> +    cap.cap.offset = cpu_to_le32(offset & mask32);
> +    cap.offset_hi = cpu_to_le32((offset >> 32) & mask32);
> +    cap.cap.id = id;
> +    return virtio_pci_add_mem_cap(proxy, &cap.cap);
> +}
> +
>  static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
>                                         unsigned size)
>  {
> diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> index 2446dcd9ae..25c4b7a32d 100644
> --- a/hw/virtio/virtio-pci.h
> +++ b/hw/virtio/virtio-pci.h
> @@ -252,4 +252,9 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
>   */
>  unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
>  
> +/* Add shared memory capability */
> +int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
> +                           uint8_t bar, uint64_t offset, uint64_t length,
> +                           uint8_t id);
> +
>  #endif
> -- 
> 2.30.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


