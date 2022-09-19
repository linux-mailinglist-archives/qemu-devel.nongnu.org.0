Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C58C5BC9A4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 12:40:06 +0200 (CEST)
Received: from localhost ([::1]:49496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaEC2-0008Hy-QH
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 06:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oaDug-0005LN-Sc
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 06:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oaDud-0004qF-6d
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 06:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663582921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=is8NmPRH1HvkGV/mHLACnkYQAx8CyVAGNL22ZJ2+oZM=;
 b=KV24HVXAcqdwXofS4538oD4yxyzENp95ToFjSZoivecdXTqtBuDTlXHpHWgS8BUXRXMp/D
 oCV5Pd31E9RuxhAtEmNrPIX5eByR9xIvJwKqWQuiKZ11vpA5gHDHWn6+Va/+LBwdla1tCB
 K9W8kEgfrTmDazWBSVLNaFR5H48Dzuw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-550-Ahz7mDKgPjmTWT1vPpwWow-1; Mon, 19 Sep 2022 06:21:59 -0400
X-MC-Unique: Ahz7mDKgPjmTWT1vPpwWow-1
Received: by mail-wm1-f72.google.com with SMTP id
 c3-20020a7bc843000000b003b486fc6a40so2428118wml.7
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 03:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=is8NmPRH1HvkGV/mHLACnkYQAx8CyVAGNL22ZJ2+oZM=;
 b=i/w/zSZP7HxCDTWLwHt1/SuymJwp99OdDAOcRv8bmHGht2vRg0AWe4t3+bsaGfKYGY
 AibfclBa8AFEmZPlghmoh5SyTdFiAl+2eqqOt/THUT8MDsMs5x4jS37NbE55pMvxHtXy
 xqQU+hoVFg5aorBs/Fin8MZQpcYk7U1vlRSygwsHHd+rK+gIPpTH5u1I/nqJl3Ya2zFY
 8RP967tezlYQOh0Du3pyQguJNQNOd4qQKfnBSgpQmZiaZ96cuGNTAo7E6ooXNptl8jcT
 0xDI8I1DpvzN/ekgibnMbxSNdDmVXJiKLMk4ISNhp1pdhGqxzIKuHt2rz7vdm4ZBM7HY
 Pfog==
X-Gm-Message-State: ACrzQf1Is8pjwCTjbKt5aUcK1dOCKx7axzXyCCTEzy3caxuRmGDHPnyg
 ECG4tzxHZ3wnDLdxWrUw2VH9f68CIVbmZ9YOWa2NVuiI+ZO/qnhEyM+of3E6UR2SSLio2z59IKU
 ANdVURgbwnQNSa7M=
X-Received: by 2002:a05:6000:1d98:b0:225:294:8150 with SMTP id
 bk24-20020a0560001d9800b0022502948150mr10143127wrb.169.1663582918431; 
 Mon, 19 Sep 2022 03:21:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4D0rDeuQcoiCWX8FppKywgKMofjCNzn7uAKW0ZF1W9avHsmwFUnMNHM08H+QxuH4y73Ps9Xw==
X-Received: by 2002:a05:6000:1d98:b0:225:294:8150 with SMTP id
 bk24-20020a0560001d9800b0022502948150mr10143110wrb.169.1663582918202; 
 Mon, 19 Sep 2022 03:21:58 -0700 (PDT)
Received: from redhat.com ([2.55.16.18]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b003b33943ce5esm11627436wmo.32.2022.09.19.03.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 03:21:57 -0700 (PDT)
Date: Mon, 19 Sep 2022 06:21:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: liuhaiwei <liuhaiwei9699@126.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com
Subject: Re: [PATCH 1/3] virtio-net: fix max vring buf size when set ring num
Message-ID: <20220919062020-mutt-send-email-mst@kernel.org>
References: <20220919093915.33003-1-liuhaiwei9699@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919093915.33003-1-liuhaiwei9699@126.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 19, 2022 at 05:39:13AM -0400, liuhaiwei wrote:

Pls write a commit log. Explain what is this patch fixing
and why this is the correct fix.


> Signed-off-by: liuhaiwei <liuhaiwei9699@126.com>

Please use your full first and last name.
No anonymous contributions.

> ---
>  hw/virtio/virtio.c         | 10 +++++++---
>  include/hw/virtio/virtio.h |  1 +
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 5d607aeaa0..d93c20d747 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2286,13 +2286,17 @@ void virtio_queue_set_rings(VirtIODevice *vdev, int n, hwaddr desc,
>  
>  void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
>  {
> +    int vq_max_size = VIRTQUEUE_MAX_SIZE;
> +    if (!strcmp(vdev->name, "virtio-net")) {
> +        vq_max_size = VIRTIO_NET_VQ_MAX_SIZE;
> +    }
> +


Any less ugly ways to do this?

>      /* Don't allow guest to flip queue between existent and
>       * nonexistent states, or to set it to an invalid size.
>       */
>      if (!!num != !!vdev->vq[n].vring.num ||
> -        num > VIRTQUEUE_MAX_SIZE ||
> -        num < 0) {
> -        return;
> +        num > vq_max_size || num < 0) {
> +	    return;
>      }
>      vdev->vq[n].vring.num = num;
>  }
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index db1c0ddf6b..1f4d2eb5d7 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -50,6 +50,7 @@ size_t virtio_feature_get_config_size(const VirtIOFeature *features,
>  typedef struct VirtQueue VirtQueue;
>  
>  #define VIRTQUEUE_MAX_SIZE 1024
> +#define VIRTIO_NET_VQ_MAX_SIZE (4096)



>  
>  typedef struct VirtQueueElement
>  {
> -- 
> 2.27.0


