Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD335809E2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 05:22:27 +0200 (CEST)
Received: from localhost ([::1]:47482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGB9O-0001tu-B6
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 23:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGB7D-0008Gp-KC
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 23:20:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGB7B-0005sJ-T2
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 23:20:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658805609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uZ9bXlbP1+s1ovXTZhG4o0vQUxKHbVFGM/4cgPgCLT4=;
 b=B1fb6WeFZgeVMLrHEeQnhEFG/r3zhVVbPofTnVXhSaFhsADmjQZ6upBbxfeRvlGMVPcXwT
 NuWFR+ukzOu8DAKXQs3aMslVpUb3ctvWZ5CpPbjYy3LYJyE6DvmJZhztiYW5jnbmKEIvFP
 pD8vIpcLngattWflYXkzvJ3W954ErUQ=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-Mn8_HezhP3G5NKeF3_NqJw-1; Mon, 25 Jul 2022 23:20:07 -0400
X-MC-Unique: Mn8_HezhP3G5NKeF3_NqJw-1
Received: by mail-pf1-f199.google.com with SMTP id
 bt6-20020a056a00438600b0052b41c191a4so4323412pfb.19
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 20:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uZ9bXlbP1+s1ovXTZhG4o0vQUxKHbVFGM/4cgPgCLT4=;
 b=VGfx3nvPvC28bpoAmVmH4UhsPWm1xvdHivL/Fh4D1TInJXySFPXbiz9kuwGbblpdZZ
 t8QgpxKbmNMuKnDzx+nRMheNE/gCmsJnOya0f6FbwjMXRfb2vfS2OAWg9SKwNdTiMj3c
 jyiLfRvvZv7ZgWCs7bXLYNjxC+Y1/fefKeHfBBbSMLRtK7Y5CAQGjzIu4+VniaLJ6aR5
 s4M5DA5MMrlhb4CBEH7ElCblfOVYvI+10s2OROpc9ULn34jsmoDyzXtpOKELu1BPXBpP
 HFAOVtLatXdPbzDd1Ko++WszI9HnNh3T4Rs9OIYGH2FEscrTEs6FseAsoCCAdvO5eIYq
 nh1g==
X-Gm-Message-State: AJIora/YvJc87mBBhfuJXDqcO/pXciD+kBfQXdGPmt9F3UBLH8PXhKJ/
 rLYFebLED13DCDM9zt2vrLzwJXW5wLGRV1QUj//xaU6uQ43Wu8bkbJw3EZP/Ed9nLtCM2SWJM/P
 Vao9AYz4yk4jhsqk=
X-Received: by 2002:a63:cc08:0:b0:41a:8f88:9a0f with SMTP id
 x8-20020a63cc08000000b0041a8f889a0fmr13068322pgf.340.1658805606806; 
 Mon, 25 Jul 2022 20:20:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tw2aMD0WXZ1n/6/dVQeOsrMGB2J3Y1Sl9ko6E4BuoDmRFVGn944QJT1KfakVBdVrsAtNEulg==
X-Received: by 2002:a63:cc08:0:b0:41a:8f88:9a0f with SMTP id
 x8-20020a63cc08000000b0041a8f889a0fmr13068300pgf.340.1658805606473; 
 Mon, 25 Jul 2022 20:20:06 -0700 (PDT)
Received: from [10.72.12.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a634a02000000b0040ced958e8fsm9135218pga.80.2022.07.25.20.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 20:20:06 -0700 (PDT)
Message-ID: <30024d3c-8e95-13cd-6abc-843b8e317ad1@redhat.com>
Date: Tue, 26 Jul 2022 11:20:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 04/16] virtio: introduce __virtio_queue_reset()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <b6b5ceb2a099537731c130a4ed44d7e108e88a1d.1658141552.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <b6b5ceb2a099537731c130a4ed44d7e108e88a1d.1658141552.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/7/18 19:17, Kangjie Xu 写道:
> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>
> Separate the logic of vq reset. This logic will be called directly
> later.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/virtio.c | 37 +++++++++++++++++++++----------------
>   1 file changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 5d607aeaa0..67d54832a9 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2019,6 +2019,26 @@ static enum virtio_device_endian virtio_current_cpu_endian(void)
>       }
>   }
>   
> +static void __virtio_queue_reset(VirtIODevice *vdev, uint32_t i)
> +{
> +    vdev->vq[i].vring.desc = 0;
> +    vdev->vq[i].vring.avail = 0;
> +    vdev->vq[i].vring.used = 0;
> +    vdev->vq[i].last_avail_idx = 0;
> +    vdev->vq[i].shadow_avail_idx = 0;
> +    vdev->vq[i].used_idx = 0;
> +    vdev->vq[i].last_avail_wrap_counter = true;
> +    vdev->vq[i].shadow_avail_wrap_counter = true;
> +    vdev->vq[i].used_wrap_counter = true;
> +    virtio_queue_set_vector(vdev, i, VIRTIO_NO_VECTOR);
> +    vdev->vq[i].signalled_used = 0;
> +    vdev->vq[i].signalled_used_valid = false;
> +    vdev->vq[i].notification = true;
> +    vdev->vq[i].vring.num = vdev->vq[i].vring.num_default;
> +    vdev->vq[i].inuse = 0;
> +    virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
> +}
> +
>   void virtio_reset(void *opaque)
>   {
>       VirtIODevice *vdev = opaque;
> @@ -2050,22 +2070,7 @@ void virtio_reset(void *opaque)
>       virtio_notify_vector(vdev, vdev->config_vector);
>   
>       for(i = 0; i < VIRTIO_QUEUE_MAX; i++) {
> -        vdev->vq[i].vring.desc = 0;
> -        vdev->vq[i].vring.avail = 0;
> -        vdev->vq[i].vring.used = 0;
> -        vdev->vq[i].last_avail_idx = 0;
> -        vdev->vq[i].shadow_avail_idx = 0;
> -        vdev->vq[i].used_idx = 0;
> -        vdev->vq[i].last_avail_wrap_counter = true;
> -        vdev->vq[i].shadow_avail_wrap_counter = true;
> -        vdev->vq[i].used_wrap_counter = true;
> -        virtio_queue_set_vector(vdev, i, VIRTIO_NO_VECTOR);
> -        vdev->vq[i].signalled_used = 0;
> -        vdev->vq[i].signalled_used_valid = false;
> -        vdev->vq[i].notification = true;
> -        vdev->vq[i].vring.num = vdev->vq[i].vring.num_default;
> -        vdev->vq[i].inuse = 0;
> -        virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
> +        __virtio_queue_reset(vdev, i);
>       }
>   }
>   


