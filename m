Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA43116535
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 04:06:29 +0100 (CET)
Received: from localhost ([::1]:35406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ie9NU-0001qy-NE
	for lists+qemu-devel@lfdr.de; Sun, 08 Dec 2019 22:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43795)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ie9MH-0001KW-KN
 for qemu-devel@nongnu.org; Sun, 08 Dec 2019 22:05:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ie9MG-0006i9-Ba
 for qemu-devel@nongnu.org; Sun, 08 Dec 2019 22:05:13 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2219 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ie9MD-00066A-Pf
 for qemu-devel@nongnu.org; Sun, 08 Dec 2019 22:05:12 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D6E8BA78CFA171FFB855;
 Mon,  9 Dec 2019 11:05:03 +0800 (CST)
Received: from [127.0.0.1] (10.120.177.99) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Mon, 9 Dec 2019
 11:04:54 +0800
Subject: Re: [PATCH v3 1/3] virtio: add ability to delete vq through a pointer
To: <mst@redhat.com>
References: <1575856810-9388-1-git-send-email-pannengyuan@huawei.com>
 <1575856810-9388-2-git-send-email-pannengyuan@huawei.com>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <7fa88bda-b36a-c8e1-fed9-a1d4c26963ab@huawei.com>
Date: Mon, 9 Dec 2019 11:04:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1575856810-9388-2-git-send-email-pannengyuan@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.120.177.99]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: liyiting@huawei.com, kuhn.chenqun@huawei.com, Amit Shah <amit@kernel.org>,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2019/12/9 10:00, pannengyuan@huawei.com wrote:
> From: Michael S. Tsirkin <mst@redhat.com> 
> 
> Devices tend to maintain vq pointers, allow deleting them through a vq
> pointer.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> [PMM: change function name to virtio_queue_cleanup; set used_elems to NULL after free]

Oh. I'm sorry. Here is PNM (not PMM).

> Cc: Amit Shah <amit@kernel.org>
> Reviewed-by: Pankaj Gupta <pagupta@redhat.com>
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> ---
> Changes v2 to v1:
> - use virtio_delete_queue to cleanup vq through a vq pointer
> ---
> Changes v3 to v2:
> - change function name from virtio_delete_queue to virtio_queue_cleanup
> ---
>  hw/virtio/virtio.c         | 16 +++++++++++-----
>  include/hw/virtio/virtio.h |  2 ++
>  2 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 04716b5..2743258 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2330,17 +2330,23 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
>      return &vdev->vq[i];
>  }
>  
> +void virtio_queue_cleanup(VirtQueue *vq)
> +{
> +    vq->vring.num = 0;
> +    vq->vring.num_default = 0;
> +    vq->handle_output = NULL;
> +    vq->handle_aio_output = NULL;
> +    g_free(vq->used_elems);
> +    vq->used_elems = NULL;
> +}
> +
>  void virtio_del_queue(VirtIODevice *vdev, int n)
>  {
>      if (n < 0 || n >= VIRTIO_QUEUE_MAX) {
>          abort();
>      }
>  
> -    vdev->vq[n].vring.num = 0;
> -    vdev->vq[n].vring.num_default = 0;
> -    vdev->vq[n].handle_output = NULL;
> -    vdev->vq[n].handle_aio_output = NULL;
> -    g_free(vdev->vq[n].used_elems);
> +    virtio_queue_cleanup(&vdev->vq[n]);
>  }
>  
>  static void virtio_set_isr(VirtIODevice *vdev, int value)
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index c32a815..cc0b3f0 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -183,6 +183,8 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
>  
>  void virtio_del_queue(VirtIODevice *vdev, int n);
>  
> +void virtio_queue_cleanup(VirtQueue *vq);
> +
>  void virtqueue_push(VirtQueue *vq, const VirtQueueElement *elem,
>                      unsigned int len);
>  void virtqueue_flush(VirtQueue *vq, unsigned int count);
> 


