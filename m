Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A9759D268
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 09:41:19 +0200 (CEST)
Received: from localhost ([::1]:34716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQOXG-0000x1-El
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 03:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQOOa-0004m1-Br
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:32:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQOOW-0005AJ-4D
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:32:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661239935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/GPNRSPlCs3e5+KncFx6VEf3FsbOhQqbJULWfjo59c=;
 b=UPhz3sd+DO3/YJKe8m7v0vQp0pOlSS7iihL5ieW3s1aKv5/qzQiN4GGCrJK8cRPfi7exDS
 MlY9W8F4FLtX4E6UPxlUKtbVrcHXldMsp/GAvs+5HKVnmpfvvzxYrCbQhkA8dCOBVZYIwB
 5YluXIbIkJPGBGJTZvgSdf9xQ3+onBE=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-fBXrghfENh2jmNH4xDLVMg-1; Tue, 23 Aug 2022 03:32:14 -0400
X-MC-Unique: fBXrghfENh2jmNH4xDLVMg-1
Received: by mail-pj1-f69.google.com with SMTP id
 z8-20020a17090a014800b001fac4204c7eso7170212pje.8
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 00:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=b/GPNRSPlCs3e5+KncFx6VEf3FsbOhQqbJULWfjo59c=;
 b=tyrwYvI+RNE7KciHXKfampApOu4+3I5utqtU3BUA36FFaDN6W+V8VkP1AUL7OjOLKL
 QjhW17WGiMXQlS8Mt7jXpYUaXlbRjIb9dWnGJ2CxrsJPsshPOpA9wK1Sz6SwtBtz/WKg
 iYnUcGFBItKCh5rWu/VmkP0b246sAOJrWIIaHaePsn/Pc0cVA+DSAnpnvFN93rzwkM5A
 18NAZTGboilegQNQ5HHIZdtnBmCGHQVOP8S3WcHmIUCmLmKV1CZoFIv5c0XI3z8yp6si
 x8hr9n+nN1M4WR99XD0CfL2iRSrdpks8zctVxlNQuLk8jy7EOqBRFFdigJ0MN/Tfy5oS
 mckg==
X-Gm-Message-State: ACgBeo0VRDRq5swFWXBpzsDpxpOhHr++yzUdteCwhdtH0q42Xq+dXtoz
 okaFqfPrGsA01hDQ0cPIF2BtjIkreOh3Eeds1jwa8NXQKKWJCFHk8/jHriNTB1sgg+O4kPJdAqt
 EgHNU78JP4eR5qMY=
X-Received: by 2002:a63:cd55:0:b0:42a:7649:77c7 with SMTP id
 a21-20020a63cd55000000b0042a764977c7mr11087175pgj.149.1661239933029; 
 Tue, 23 Aug 2022 00:32:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR57OpWAY9vv6Vw6/rnNBs8stzIrp8BkXhQVTR+dyFWTiu6o37NkWy7n5nffBpCNS25JEwk+BQ==
X-Received: by 2002:a63:cd55:0:b0:42a:7649:77c7 with SMTP id
 a21-20020a63cd55000000b0042a764977c7mr11087168pgj.149.1661239932797; 
 Tue, 23 Aug 2022 00:32:12 -0700 (PDT)
Received: from [10.72.13.141] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm11369771pjc.3.2022.08.23.00.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 00:32:11 -0700 (PDT)
Message-ID: <fca64720-2d81-5f0a-96e3-fc9638cd61a4@redhat.com>
Date: Tue, 23 Aug 2022 15:32:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 03/24] virtio: introduce virtio_queue_reset()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <271124b687a7e9a2c2d0b06f79f05517a294691a.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <271124b687a7e9a2c2d0b06f79f05517a294691a.1660611460.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/8/16 09:06, Kangjie Xu 写道:
> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>
> Introduce a new interface function virtio_queue_reset() to implement
> reset for vq.
>
> Add a new callback to VirtioDeviceClass for queue reset operation for
> each child device.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/virtio.c         | 11 +++++++++++
>   include/hw/virtio/virtio.h |  2 ++
>   2 files changed, 13 insertions(+)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 67d54832a9..0e9d41366f 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2039,6 +2039,17 @@ static void __virtio_queue_reset(VirtIODevice *vdev, uint32_t i)
>       virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
>   }
>   
> +void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> +{
> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> +
> +    if (k->queue_reset) {
> +        k->queue_reset(vdev, queue_index);
> +    }
> +
> +    __virtio_queue_reset(vdev, queue_index);
> +}
> +
>   void virtio_reset(void *opaque)
>   {
>       VirtIODevice *vdev = opaque;
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index db1c0ddf6b..879394299b 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -130,6 +130,7 @@ struct VirtioDeviceClass {
>       void (*set_config)(VirtIODevice *vdev, const uint8_t *config);
>       void (*reset)(VirtIODevice *vdev);
>       void (*set_status)(VirtIODevice *vdev, uint8_t val);
> +    void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
>       /* For transitional devices, this is a bitmap of features
>        * that are only exposed on the legacy interface but not
>        * the modern one.
> @@ -268,6 +269,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
>                                         MemoryRegion *mr, bool assign);
>   int virtio_set_status(VirtIODevice *vdev, uint8_t val);
>   void virtio_reset(void *opaque);
> +void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
>   void virtio_update_irq(VirtIODevice *vdev);
>   int virtio_set_features(VirtIODevice *vdev, uint64_t val);
>   


