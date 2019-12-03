Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9183710F7AE
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 07:13:49 +0100 (CET)
Received: from localhost ([::1]:48970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ic1RU-0006oV-Li
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 01:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ic1PE-0005wq-PB
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 01:11:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ic1PA-0008TM-Re
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 01:11:26 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2208 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ic1P9-0008NJ-O2
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 01:11:24 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 766BE120A797F34AE397;
 Tue,  3 Dec 2019 14:11:16 +0800 (CST)
Received: from [127.0.0.1] (10.120.177.99) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Dec 2019
 14:11:10 +0800
Subject: Re: [PATCH] virtio-balloon: fix memory leak while attach
 virtio-balloon device
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1575337459-34864-1-git-send-email-pannengyuan@huawei.com>
 <20191203003223-mutt-send-email-mst@kernel.org>
From: pannengyuan <pannengyuan@huawei.com>
Message-ID: <6747993c-496c-7663-cae1-5309ceb071b5@huawei.com>
Date: Tue, 3 Dec 2019 14:11:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191203003223-mutt-send-email-mst@kernel.org>
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
Cc: liyiting@huawei.com, kuhn.chenqun@huawei.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2019/12/3 13:34, Michael S. Tsirkin wrote:
> On Tue, Dec 03, 2019 at 09:44:19AM +0800, pannengyuan@huawei.com wrote:
>> From: PanNengyuan <pannengyuan@huawei.com>
>>
>> ivq/dvq/svq/free_page_vq is forgot to cleanup in
>> virtio_balloon_device_unrealize, the memory leak stack is as follow:
>>
>> Direct leak of 14336 byte(s) in 2 object(s) allocated from:
>>     #0 0x7f99fd9d8560 in calloc (/usr/lib64/libasan.so.3+0xc7560)
>>     #1 0x7f99fcb20015 in g_malloc0 (/usr/lib64/libglib-2.0.so.0+0x50015)
>>     #2 0x557d90638437 in virtio_add_queue /mnt/sdb/qemu-4.2.0-rc0/hw/virtio/virtio.c:2327
>>     #3 0x557d9064401d in virtio_balloon_device_realize /mnt/sdb/qemu-4.2.0-rc0/hw/virtio/virtio-balloon.c:793
>>     #4 0x557d906356f7 in virtio_device_realize /mnt/sdb/qemu-4.2.0-rc0/hw/virtio/virtio.c:3504
>>     #5 0x557d9073f081 in device_set_realized /mnt/sdb/qemu-4.2.0-rc0/hw/core/qdev.c:876
>>     #6 0x557d908b1f4d in property_set_bool /mnt/sdb/qemu-4.2.0-rc0/qom/object.c:2080
>>     #7 0x557d908b655e in object_property_set_qobject /mnt/sdb/qemu-4.2.0-rc0/qom/qom-qobject.c:26
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: PanNengyuan <pannengyuan@huawei.com>
>> ---
>>  hw/virtio/virtio-balloon.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
>> index 40b04f5..5329c65 100644
>> --- a/hw/virtio/virtio-balloon.c
>> +++ b/hw/virtio/virtio-balloon.c
>> @@ -831,6 +831,13 @@ static void virtio_balloon_device_unrealize(DeviceState *dev, Error **errp)
>>      }
>>      balloon_stats_destroy_timer(s);
>>      qemu_remove_balloon_handler(s);
>> +
>> +    virtio_del_queue(vdev, 0);
>> +    virtio_del_queue(vdev, 1);
>> +    virtio_del_queue(vdev, 2);
>> +    if (s->free_page_vq) {
>> +        virtio_del_queue(vdev, 3);
>> +    }
>>      virtio_cleanup(vdev);
>>  }
> 
> Hmm ok, but how about just doing it through a vq pointer then?
> Seems cleaner. E.g. use patch below and add your on top
> using the new virtio_delete_queue?
> 

ok, It seems more cleaner, I will send a new version later.

Thanks.

> -->
> virtio: add ability to delete vq through a pointer
> 
> Devices tend to maintain vq pointers, allow deleting them like this.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> --
> 
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index c32a815303..e18756d50d 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -183,6 +183,8 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
>  
>  void virtio_del_queue(VirtIODevice *vdev, int n);
>  
> +void virtio_delete_queue(VirtQueue *vq);
> +
>  void virtqueue_push(VirtQueue *vq, const VirtQueueElement *elem,
>                      unsigned int len);
>  void virtqueue_flush(VirtQueue *vq, unsigned int count);
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 04716b5f6c..31dd140990 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2330,17 +2330,22 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
>      return &vdev->vq[i];
>  }
>  
> +void virtio_delete_queue(VirtQueue *vq)
> +{
> +    vq->vring.num = 0;
> +    vq->vring.num_default = 0;
> +    vq->handle_output = NULL;
> +    vq->handle_aio_output = NULL;
> +    g_free(vq->used_elems);
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
> +    virtio_delete_queue(&vdev->vq[n]);
>  }
>  
>  static void virtio_set_isr(VirtIODevice *vdev, int value)
> 
> 
> .
> 


