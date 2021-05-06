Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BC1374D6C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 04:19:47 +0200 (CEST)
Received: from localhost ([::1]:36508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leTcA-0007WT-LX
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 22:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1leTaj-0005mF-NX
 for qemu-devel@nongnu.org; Wed, 05 May 2021 22:18:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1leTaf-0004a0-I3
 for qemu-devel@nongnu.org; Wed, 05 May 2021 22:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620267490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UbkJPmmd890QXH0bue9UgrHw4eJinSfBmWjskV4OTa0=;
 b=WOUGd1ZJ6qxLl62rc2mlDqSKYEXZoFEO6gDVyT5Yd/qYLOYFctdUQJgjn7NUhX4af1kS5Y
 42DgLZlpWCRnmCt0w+hMko3z22JVpHVEYPY8EP1dpc2SIXhYGGUlFqOIP9DDpy66+attbL
 Hl/PoSiA1Y9xh1qZZRwb5zMux2L2Sig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-trBiY5UHNAKM31CtmyAJUw-1; Wed, 05 May 2021 22:18:07 -0400
X-MC-Unique: trBiY5UHNAKM31CtmyAJUw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55965803622;
 Thu,  6 May 2021 02:18:06 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-159.pek2.redhat.com
 [10.72.13.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64F7A5D6A8;
 Thu,  6 May 2021 02:18:01 +0000 (UTC)
Subject: Re: [PATCH 2/2] vhost-vdpa: doorbell mapping support
To: Si-Wei Liu <si-wei.liu@oracle.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210415080444.44645-1-jasowang@redhat.com>
 <20210415080444.44645-3-jasowang@redhat.com>
 <c2a0e640-4f76-c6a3-12a7-756204473030@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cb97a251-ed9e-4417-4aab-527a428c86d0@redhat.com>
Date: Thu, 6 May 2021 10:17:59 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <c2a0e640-4f76-c6a3-12a7-756204473030@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elic@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/1 上午6:32, Si-Wei Liu 写道:
>
>
> On 4/15/2021 1:04 AM, Jason Wang wrote:
>> This patch implements the doorbell mapping support for
>> vhost-vDPA. This is simply done by using mmap()/munmap() for the
>> vhost-vDPA fd during device start/stop. For the device without
>> doorbell support, we fall back to eventfd based notification
>> gracefully.
>>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   hw/virtio/vhost-vdpa.c         | 85 ++++++++++++++++++++++++++++++++++
>>   include/hw/virtio/vhost-vdpa.h |  7 +++
>>   2 files changed, 92 insertions(+)
>>
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> index dd4321bac2..c3a3b7566f 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -285,12 +285,95 @@ static int vhost_vdpa_init(struct vhost_dev 
>> *dev, void *opaque)
>>       return 0;
>>   }
>>   +static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
>> +                                            int queue_index)
>> +{
>> +    size_t page_size = qemu_real_host_page_size;
>> +    struct vhost_vdpa *v = dev->opaque;
>> +    VirtIODevice *vdev = dev->vdev;
>> +    VhostVDPAHostNotifier *n;
>> +
>> +    n = &v->notifier[queue_index];
>> +
>> +    if (n->addr) {
>> +        virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, 
>> false);
>> +        object_unparent(OBJECT(&n->mr));
>> +        munmap(n->addr, page_size);
>> +        n->addr = NULL;
>> +    }
>> +}
>> +
>> +static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, 
>> int n)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < n; i++) {
>> +        vhost_vdpa_host_notifier_uninit(dev, i);
>> +    }
>> +}
>> +
>> +static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int 
>> queue_index)
>> +{
>> +    size_t page_size = qemu_real_host_page_size;
>> +    struct vhost_vdpa *v = dev->opaque;
>> +    VirtIODevice *vdev = dev->vdev;
>> +    VhostVDPAHostNotifier *n;
>> +    int fd = v->device_fd;
>> +    void *addr;
>> +    char *name;
>> +
>> +    vhost_vdpa_host_notifier_uninit(dev, queue_index);
>> +
>> +    n = &v->notifier[queue_index];
>> +
>> +    addr = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, fd,
>> +                queue_index * page_size);
>> +    if (addr == MAP_FAILED) {
>> +        goto err;
>> +    }
>> +
>> +    name = g_strdup_printf("vhost-vdpa/host-notifier@%p mmaps[%d]",
>> +                           v, queue_index);
>> +    memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
>> +                                      page_size, addr);
>> +    g_free(name);
>> +
>> +    if (virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, 
>> true)) {
>> +        munmap(addr, page_size);
>> +        goto err;
>> +    }
>> +    n->addr = addr;
>> +
>> +    return 0;
>> +
>> +err:
>> +    return -1;
>> +}
>> +
>> +static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < dev->nvqs; i++) {
>> +        if (vhost_vdpa_host_notifier_init(dev, i)) {
> Shouldn't (hdev->vq_index + i) be used instead of i? or it's assumed 
> to be single QP for vhost-vdpa for the moment?


Only single queue pair is supported, I'm working on the multiqueue support.


> If the latter, would be good to add some comment.


I agree, and I think it's better to use vq_index + i to avoid future 
changes.


>> +            goto err;
>> +        }
>> +    }
>> +
>> +    return;
>> +
>> +err:
>> +    vhost_vdpa_host_notifiers_uninit(dev, i);
> I'm not sure if it is really the intent to leave other vqs behind - I 
> presume that either none of them is mapped, or all mappable should be 
> mapped. Why here just uninit the first unmappable vq?


I'm not sure I get here, there's a loop in 
vhost_vdpa_host_notifiers_uninit(), so we either:

1) map all doorbells

or

2) no doorell is mapped


>
>> +    return;
>> +}
>> +
>>   static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>>   {
>>       struct vhost_vdpa *v;
>>       assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>>       v = dev->opaque;
>>       trace_vhost_vdpa_cleanup(dev, v);
>> +    vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>>       memory_listener_unregister(&v->listener);
>>         dev->opaque = NULL;
>> @@ -467,6 +550,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev 
>> *dev, bool started)
>>       if (started) {
>>           uint8_t status = 0;
>>           memory_listener_register(&v->listener, &address_space_memory);
>> +        vhost_vdpa_host_notifiers_init(dev);
>>           vhost_vdpa_set_vring_ready(dev);
>>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>>           vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
>> @@ -476,6 +560,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev 
>> *dev, bool started)
>>           vhost_vdpa_reset_device(dev);
>>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>                                      VIRTIO_CONFIG_S_DRIVER);
>> +        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>>           memory_listener_unregister(&v->listener);
>>             return 0;
>> diff --git a/include/hw/virtio/vhost-vdpa.h 
>> b/include/hw/virtio/vhost-vdpa.h
>> index 9b81a409da..0f11ecff34 100644
>> --- a/include/hw/virtio/vhost-vdpa.h
>> +++ b/include/hw/virtio/vhost-vdpa.h
>> @@ -14,11 +14,18 @@
>>     #include "hw/virtio/virtio.h"
>>   +typedef struct VhostVDPAHostNotifier {
>> +    MemoryRegion mr;
>> +    void *addr;
>> +} VhostVDPAHostNotifier;
>> +
>>   typedef struct vhost_vdpa {
>>       int device_fd;
>>       uint32_t msg_type;
>>       MemoryListener listener;
>>       struct vhost_dev *dev;
>> +    VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>> +    bool host_notifier_set;
> What this host_notifier_set is used for? Doesn't seem it's ever set or 
> referenced?


Right, will remove it.

Thanks


>
>>   } VhostVDPA;
>>     extern AddressSpace address_space_memory;
> Thanks,
> -Siwei
>


