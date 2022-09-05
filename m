Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550365ACD58
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 10:04:40 +0200 (CEST)
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV75y-0004L7-1h
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 04:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oV718-0001NS-0D
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 03:59:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oV713-0000D0-DW
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 03:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662364772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmB8GAaO935jx1JWCqdqmPBPpffrXimVgHt5J5BrNno=;
 b=YOwErf+kB7xI5lgyGIBAipqWrdO3IMCB8CGvef+LjqihWnk1axBHu2hUhrANRUaVMz5R93
 JFbpP0qldrTeUot19MQAZYRcVbk1xc7yUcsOED4kxJCMVQ+MVdrae7VgyrJejc/YnDWex+
 5Q9NVD6LVGF3F/rOqux3nbxBRavJUlE=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-9K4ahhJLPqq-96GfNWQUuA-1; Mon, 05 Sep 2022 03:59:31 -0400
X-MC-Unique: 9K4ahhJLPqq-96GfNWQUuA-1
Received: by mail-pg1-f198.google.com with SMTP id
 h13-20020a63530d000000b0043087bbf72dso4118424pgb.17
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 00:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=QmB8GAaO935jx1JWCqdqmPBPpffrXimVgHt5J5BrNno=;
 b=01MxNpA0Rf4fSO50t/b3++kab2cJregZgoQCDty8CycHU4K6QE9+FBd5FOTHWrrNv5
 zQHsg72QHj79VP+Lhef5YDNmF6j77QT9FFwz0wYTiSAytm4llD4DXzMtqaRYPC6j0K4/
 i1OVtyNG8U9T4PpihfTAwx7eGCWIXNwNeXgQ46jnukFKfwSrsJk9girCWWJPUJn2zlJS
 wFz3MDfHNRtI25jLBRXzf61z28QOdJB3Nd9SDAD2diGegjyK5OyRImfEHxD8N2m+eYx4
 XGCcM0XOJ6WCmWjFv7nS7jFbvSb5+dESCtf1V+BNgCxRZCnIpXn/WlqKy0qLxD4vqmfK
 bvcQ==
X-Gm-Message-State: ACgBeo3CDzj2p2sDWxh3ZlEFPHD8/vNAO1dJp08hCHEJJMdoFORBWO3J
 7SUITHpNjFcGJiZWJplazTWAMeCjdqNNAuiOwQVq2Sc59nXsBnLWqgPCcV0zaiurhL48MCr/X3a
 aEGwb7jhKFEKbckI=
X-Received: by 2002:a63:4e44:0:b0:42b:1fff:72d1 with SMTP id
 o4-20020a634e44000000b0042b1fff72d1mr41668933pgl.432.1662364769977; 
 Mon, 05 Sep 2022 00:59:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4IxvAG9nXn9ubCcwtnG7azJJfAREEw3DGVLTNvm2270wp8bkZ1Seb3rD2GkTCkyldSci+MPQ==
X-Received: by 2002:a63:4e44:0:b0:42b:1fff:72d1 with SMTP id
 o4-20020a634e44000000b0042b1fff72d1mr41668913pgl.432.1662364769673; 
 Mon, 05 Sep 2022 00:59:29 -0700 (PDT)
Received: from [10.72.13.239] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 205-20020a6217d6000000b0053818255880sm6929959pfx.193.2022.09.05.00.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 00:59:29 -0700 (PDT)
Message-ID: <4069b154-7d72-6e31-8904-94538f1874b3@redhat.com>
Date: Mon, 5 Sep 2022 15:59:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 06/15] virtio-pci: support queue reset
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
 <0851d6ea5c84b71d0c661d91da973e4abf9155c1.1661414345.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <0851d6ea5c84b71d0c661d91da973e4abf9155c1.1661414345.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.978, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


在 2022/8/25 16:08, Kangjie Xu 写道:
> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>
> PCI devices support vq reset.
>
> Based on this function, the driver can adjust the size of the ring, and
> quickly recycle the buffer in the ring.
>
> The migration of the virtio devices will not happen during a reset
> operation. This is becuase the global iothread lock is held. Migration
> thread also needs the lock. As a result, when migration of virtio
> devices starts, the 'reset' status of VirtIOPCIQueue will always be 0.
> Thus, we do not need to add it in vmstate_virtio_pci_modern_queue_state.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/virtio-pci.c         | 15 +++++++++++++++
>   include/hw/virtio/virtio-pci.h |  5 +++++
>   2 files changed, 20 insertions(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index a50c5a57d7..79b9e641dd 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1251,6 +1251,9 @@ static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
>       case VIRTIO_PCI_COMMON_Q_USEDHI:
>           val = proxy->vqs[vdev->queue_sel].used[1];
>           break;
> +    case VIRTIO_PCI_COMMON_Q_RESET:
> +        val = proxy->vqs[vdev->queue_sel].reset;
> +        break;
>       default:
>           val = 0;
>       }
> @@ -1338,6 +1341,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
>                          ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
>                          proxy->vqs[vdev->queue_sel].used[0]);
>               proxy->vqs[vdev->queue_sel].enabled = 1;
> +            proxy->vqs[vdev->queue_sel].reset = 0;
>           } else {
>               virtio_error(vdev, "wrong value for queue_enable %"PRIx64, val);
>           }
> @@ -1360,6 +1364,16 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
>       case VIRTIO_PCI_COMMON_Q_USEDHI:
>           proxy->vqs[vdev->queue_sel].used[1] = val;
>           break;
> +    case VIRTIO_PCI_COMMON_Q_RESET:
> +        if (val == 1) {
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
> @@ -1954,6 +1968,7 @@ static void virtio_pci_reset(DeviceState *qdev)
>   
>       for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>           proxy->vqs[i].enabled = 0;
> +        proxy->vqs[i].reset = 0;
>           proxy->vqs[i].num = 0;
>           proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
>           proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
> diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
> index 2446dcd9ae..938799e8f6 100644
> --- a/include/hw/virtio/virtio-pci.h
> +++ b/include/hw/virtio/virtio-pci.h
> @@ -117,6 +117,11 @@ typedef struct VirtIOPCIRegion {
>   typedef struct VirtIOPCIQueue {
>     uint16_t num;
>     bool enabled;
> +  /*
> +   * No need to migrate the reset status, because it is always 0
> +   * when the migration starts.
> +   */
> +  bool reset;
>     uint32_t desc[2];
>     uint32_t avail[2];
>     uint32_t used[2];


