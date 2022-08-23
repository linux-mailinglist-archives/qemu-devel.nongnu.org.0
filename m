Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C8759D2AD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 09:53:07 +0200 (CEST)
Received: from localhost ([::1]:60846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQOie-0002X3-K5
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 03:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQOXA-0000wy-9n
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:41:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQOX3-0006TF-4T
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661240464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6t9VEvPtz8d0Nu1qI+XxAMU4X7jVpWvKZSg9//O9H6w=;
 b=F95NOtIYaKufbQtELH0WNTCrZWFkaWgeH7kg1sIkEe0YeX4d6IJeIjWJtPPxCNy54n7ujZ
 dcM3XfQ9VrBZ8ftzg8qF3GY3IEsFzIXHEcXoJITLCqzAOoC2uI23vvXdJo94Xmx8lp/sx1
 vLz0blrkVJLXfpbMiXrvfFDXAts5N7s=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-zk0W7XfaP2-Q4ytlSMP9AA-1; Tue, 23 Aug 2022 03:41:01 -0400
X-MC-Unique: zk0W7XfaP2-Q4ytlSMP9AA-1
Received: by mail-pl1-f199.google.com with SMTP id
 u14-20020a17090341ce00b00172f000e493so2825979ple.8
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 00:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=6t9VEvPtz8d0Nu1qI+XxAMU4X7jVpWvKZSg9//O9H6w=;
 b=z1uQIIMmCJikDCk6gvgparG7P3R2SMML5HobYDgcAsZrGk4n4V9a/gBlPE9AnUUA6v
 ZiXZkg+gyM+ZEbHujpAV3iZxZhN6UHanYAPqnaC6KNUzpzwaDOqHwzv2wlqTZMSY/v3+
 OdLCw7HHABBe8m8wXS4QbjT1yvToCnNq0XQwNBBoaoyd7ysLfD2y4ntClXFSkt1Qqw3V
 TRCI3h9DwDfj8Zpqnqu5I6XjxQ8fHGTTBJYCvOwuMf/BEviOko9COxw26nMprEFs1HTV
 T2t2zDb0UswjXj6tlNV6Gh9ZLytaL77kMQQ0jbNp2ZKXPwM5fBwzYDGOIQhcz8hlNvhw
 ypag==
X-Gm-Message-State: ACgBeo3a3Y8fMJhqH4sTlZCYzjnRPwBULQOI5wtxdfdicYfRV2UslCVa
 uivFnBMgiKK86bwoIiMvArTUR/fNwYhog0wri2Qce51DhIeoB653Ars/uVu410+dcp8yMN+HTk+
 9mJ0L+spXjAORSz4=
X-Received: by 2002:a17:902:ce12:b0:172:dc6e:18f6 with SMTP id
 k18-20020a170902ce1200b00172dc6e18f6mr11950496plg.34.1661240460463; 
 Tue, 23 Aug 2022 00:41:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR60l/Go4uPaAkZ/iyMzhE7aMgX7MBpadVLqGaPiYtZR5M+4l2hR915NYl86psCghUbQgxgqug==
X-Received: by 2002:a17:902:ce12:b0:172:dc6e:18f6 with SMTP id
 k18-20020a170902ce1200b00172dc6e18f6mr11950481plg.34.1661240460197; 
 Tue, 23 Aug 2022 00:41:00 -0700 (PDT)
Received: from [10.72.13.141] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a170902d4d000b0016d3935eff0sm9732806plg.176.2022.08.23.00.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 00:40:59 -0700 (PDT)
Message-ID: <4553ca4a-6df9-dac4-307e-ccc405744bb9@redhat.com>
Date: Tue, 23 Aug 2022 15:40:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 06/24] virtio-pci: support queue reset
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <d3bbe50c546b55971e87ff4cbc61e049c6800db8.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <d3bbe50c546b55971e87ff4cbc61e049c6800db8.1660611460.git.kangjie.xu@linux.alibaba.com>
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
> PCI devices support vq reset.
>
> Based on this function, the driver can adjust the size of the ring, and
> quickly recycle the buffer in the ring.
>
> The migration of the virtio devices will not happen during a reset
> operation. This is becuase the global iothread lock is held. Migration
> thread also needs the lock. As a result, we do not need to migrate the
> reset state of VirtIOPCIQueue.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> ---
>   hw/virtio/virtio-pci.c         | 19 +++++++++++++++++++
>   include/hw/virtio/virtio-pci.h |  1 +
>   2 files changed, 20 insertions(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 45327f0b31..ec8e92052f 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1246,6 +1246,9 @@ static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
>       case VIRTIO_PCI_COMMON_Q_USEDHI:
>           val = proxy->vqs[vdev->queue_sel].used[1];
>           break;
> +    case VIRTIO_PCI_COMMON_Q_RESET:
> +        val = proxy->vqs[vdev->queue_sel].reset;
> +        break;
>       default:
>           val = 0;
>       }
> @@ -1333,6 +1336,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
>                          ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
>                          proxy->vqs[vdev->queue_sel].used[0]);
>               proxy->vqs[vdev->queue_sel].enabled = 1;
> +            proxy->vqs[vdev->queue_sel].reset = 0;
>           } else {
>               virtio_error(vdev, "wrong value for queue_enable %"PRIx64, val);
>           }
> @@ -1355,6 +1359,20 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
>       case VIRTIO_PCI_COMMON_Q_USEDHI:
>           proxy->vqs[vdev->queue_sel].used[1] = val;
>           break;
> +    case VIRTIO_PCI_COMMON_Q_RESET:
> +        if (val == 1) {
> +            /*
> +             * With the global iothread lock taken, the migration will not
> +             * happen until the virtqueue reset is done.
> +             */


This comment applies to all other common cfg operation as well, So it 
looks not necessary?


> +            proxy->vqs[vdev->queue_sel].reset = 1;
> +
> +            virtio_queue_reset(vdev, vdev->queue_sel);
> +
> +            proxy->vqs[vdev->queue_sel].reset = 0;
> +            proxy->vqs[vdev->queue_sel].enabled = 0;
> +        }
> +        break;
>       default:
>           break;
>       }
> @@ -1950,6 +1968,7 @@ static void virtio_pci_reset(DeviceState *qdev)
>   
>       for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>           proxy->vqs[i].enabled = 0;
> +        proxy->vqs[i].reset = 0;
>           proxy->vqs[i].num = 0;
>           proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
>           proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
> diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
> index 2446dcd9ae..e9290e2b94 100644
> --- a/include/hw/virtio/virtio-pci.h
> +++ b/include/hw/virtio/virtio-pci.h
> @@ -117,6 +117,7 @@ typedef struct VirtIOPCIRegion {
>   typedef struct VirtIOPCIQueue {
>     uint16_t num;
>     bool enabled;
> +  bool reset;


Do we need to migrate this?

Thanks


>     uint32_t desc[2];
>     uint32_t avail[2];
>     uint32_t used[2];


