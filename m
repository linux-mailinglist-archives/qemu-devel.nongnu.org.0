Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7E3230065
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 05:56:26 +0200 (CEST)
Received: from localhost ([::1]:44998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0Gj2-00033h-LV
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 23:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1k0GiD-0002XL-Aq
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 23:55:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39955
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1k0GiA-0008ID-9e
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 23:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595908528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynpCO4uyr/8A3lGbL6JNSrbQSI0Cz1oD4mjLWJYAXDI=;
 b=iYkzFMqPxC2V7Hr6DS0jkQ6hIFVTr9K8D5gI0cH/YOVXCScoVdpvydLGpkPzwxRX2Ard5M
 lOCqSzVL2XAIinYqHD2e1Et9VKoL9Bc11xnmT02N8t3DoIHADAt17ycWvY5+iOBBZ/62Gd
 BtohhMs8gR7+9Bz1MxX/o6kNouYdIDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-8oe0LFtfNSGjyKLsikHQZw-1; Mon, 27 Jul 2020 23:55:26 -0400
X-MC-Unique: 8oe0LFtfNSGjyKLsikHQZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F41D9186A835
 for <qemu-devel@nongnu.org>; Tue, 28 Jul 2020 03:55:25 +0000 (UTC)
Received: from [10.72.13.242] (ovpn-13-242.pek2.redhat.com [10.72.13.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05F8D726BE;
 Tue, 28 Jul 2020 03:55:17 +0000 (UTC)
Subject: Re: [PATCH] virtio-pci: fix virtio_pci_queue_enabled()
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20200727153319.43716-1-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f208ec76-56b7-cd65-c20b-2d7bb1b665dc@redhat.com>
Date: Tue, 28 Jul 2020 11:55:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727153319.43716-1-lvivier@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 23:55:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/7/27 下午11:33, Laurent Vivier wrote:
> In legacy mode, virtio_pci_queue_enabled() falls back to
> virtio_queue_enabled() to know if the queue is enabled.
>
> But virtio_queue_enabled() calls again virtio_pci_queue_enabled()
> if k->queue_enabled is set. This ends in a crash after a stack
> overflow.
>
> The problem can be reproduced with
> "-device virtio-net-pci,disable-legacy=off,disable-modern=true
>   -net tap,vhost=on"
>
> And a look to the backtrace is very explicit:
>
>      ...
>      #4  0x000000010029a438 in virtio_queue_enabled ()
>      #5  0x0000000100497a9c in virtio_pci_queue_enabled ()
>      ...
>      #130902 0x000000010029a460 in virtio_queue_enabled ()
>      #130903 0x0000000100497a9c in virtio_pci_queue_enabled ()
>      #130904 0x000000010029a460 in virtio_queue_enabled ()
>      #130905 0x0000000100454a20 in vhost_net_start ()
>      ...
>
> This patch fixes the problem by introducing a new function
> for the legacy case and calls it from virtio_pci_queue_enabled().
> It also calls it from virtio_queue_enabled() to avoid code duplication.
>
> Fixes: f19bcdfedd53 ("virtio-pci: implement queue_enabled method")
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Cindy Lu <lulu@redhat.com>
> CC: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>


Queued for rc2.

Thanks


> ---
>   hw/virtio/virtio-pci.c     | 2 +-
>   hw/virtio/virtio.c         | 7 ++++++-
>   include/hw/virtio/virtio.h | 1 +
>   3 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index ada1101d07bf..4ad3ad81a2cf 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1116,7 +1116,7 @@ static bool virtio_pci_queue_enabled(DeviceState *d, int n)
>           return proxy->vqs[vdev->queue_sel].enabled;
>       }
>   
> -    return virtio_queue_enabled(vdev, n);
> +    return virtio_queue_enabled_legacy(vdev, n);
>   }
>   
>   static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 546a198e79b0..e98302521769 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3309,6 +3309,11 @@ hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n)
>       return vdev->vq[n].vring.desc;
>   }
>   
> +bool virtio_queue_enabled_legacy(VirtIODevice *vdev, int n)
> +{
> +    return virtio_queue_get_desc_addr(vdev, n) != 0;
> +}
> +
>   bool virtio_queue_enabled(VirtIODevice *vdev, int n)
>   {
>       BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
> @@ -3317,7 +3322,7 @@ bool virtio_queue_enabled(VirtIODevice *vdev, int n)
>       if (k->queue_enabled) {
>           return k->queue_enabled(qbus->parent, n);
>       }
> -    return virtio_queue_get_desc_addr(vdev, n) != 0;
> +    return virtio_queue_enabled_legacy(vdev, n);
>   }
>   
>   hwaddr virtio_queue_get_avail_addr(VirtIODevice *vdev, int n)
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 198ffc762678..e424df12cf6d 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -295,6 +295,7 @@ typedef struct VirtIORNGConf VirtIORNGConf;
>                         VIRTIO_F_RING_PACKED, false)
>   
>   hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n);
> +bool virtio_queue_enabled_legacy(VirtIODevice *vdev, int n);
>   bool virtio_queue_enabled(VirtIODevice *vdev, int n);
>   hwaddr virtio_queue_get_avail_addr(VirtIODevice *vdev, int n);
>   hwaddr virtio_queue_get_used_addr(VirtIODevice *vdev, int n);


