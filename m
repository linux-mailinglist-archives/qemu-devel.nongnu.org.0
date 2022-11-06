Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5BA61E24B
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 14:14:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orfRc-0002RQ-Ol; Sun, 06 Nov 2022 08:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1orfRX-0002RA-KW
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 08:12:07 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1orfRS-0004qo-1U
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 08:12:07 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N4vrj6gkcz15MJF;
 Sun,  6 Nov 2022 21:11:33 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 6 Nov 2022 21:11:40 +0800
Message-ID: <2b3d77fc-ece4-32b4-964a-c939613f1ca3@huawei.com>
Date: Sun, 6 Nov 2022 21:11:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v7 resend 0/4] add generic vDPA device support
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: <stefanha@redhat.com>, <jasowang@redhat.com>, <sgarzare@redhat.com>,
 <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 <xiehong@huawei.com>
References: <20221105083629.1058-1-longpeng2@huawei.com>
 <20221105103601-mutt-send-email-mst@kernel.org>
 <5387e1e7-b741-b6a1-f091-f15d5f136e38@huawei.com>
 <20221106011943-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221106011943-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2022/11/6 13:22, Michael S. Tsirkin 写道:
> On Sun, Nov 06, 2022 at 08:17:07AM +0800, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
>>
>>
>> 在 2022/11/6 0:43, Michael S. Tsirkin 写道:
>>> On Sat, Nov 05, 2022 at 04:36:25PM +0800, Longpeng(Mike) wrote:
>>>> From: Longpeng <longpeng2@huawei.com>
>>>>
>>>> Hi guys,
>>>>
>>>> With the generic vDPA device, QEMU won't need to touch the device
>>>> types any more, such like vfio.
>>>
>>> With this kind of passthrough migration is completely MIA right?
>>> Better add a blocker...
>>
>> Oh, I missed the "vdpa-dev: mark the device as unmigratable" since v4 and
>> I'll add it in the next version.
>>
>> We'll support passthrough migration in the next step. We have already
>> written a demo that can migrate between some offloading cards.
> 
> Hmm ok. Backend disconnect can't work though, can it? State
> is by necessity lost when backend crashes.
>Yes, it can't.

>>> And given this is there an advantage over VFIO?
>>
>> I think the answer is the same as "why we need vDPA" if we compare it with
>> VFIO.
> 
> The answer is mostly because you can migrate and support backend
> disconnect, no?
>
Migrating between different hardware is the first consideration in our 
requirement, supporting backend disconnect is a low priority.

>>>
>>>> We can use the generic vDPA device as follow:
>>>>     -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-X
>>>>     Or
>>>>     -M microvm -m 512m -smp 2 -kernel ... -initrd ... -device \
>>>>     vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-x
>>>
>>>> Changes v6 -> v7:
>>>>       (v6: https://mail.gnu.org/archive/html/qemu-devel/2022-05/msg02821.html)
>>>>       - rebase. [Jason]
>>>>       - add documentation . [Stefan]
>>>>
>>>> Changes v5 -> v6:
>>>>     Patch 2:
>>>>       - Turn to the original approach in the RFC to initialize the
>>>>         virtio_pci_id_info array. [Michael]
>>>> 	  https://lore.kernel.org/all/20220105005900.860-2-longpeng2@huawei.com/
>>>>     Patch 3:
>>>>       - Fix logical error of exception handler around the post_init.
>>>>         [Stefano]
>>>>       - Fix some coding style warnings. [Stefano]
>>>>     Patch 4:
>>>>       - Fix some coding style warnings. [Stefano]
>>>>
>>>> Changes v4 -> v5:
>>>>     Patch 3:
>>>>       - remove vhostfd [Jason]
>>>>       - support virtio-mmio [Jason]
>>>>
>>>> Changes v3 -> v4:
>>>>     v3: https://www.mail-archive.com/qemu-devel@nongnu.org/msg877015.html
>>>>     - reorganize the series [Stefano]
>>>>     - fix some typos [Stefano]
>>>>     - fix logical error in vhost_vdpa_device_realize [Stefano]
>>>>
>>>> Changes v2 -> v3
>>>>     Patch 4 & 5:
>>>>       - only call vdpa ioctls in vdpa-dev.c [Stefano, Longpeng]
>>>>       - s/VQS_NUM/VQS_COUNT  [Stefano]
>>>>       - check both vdpa_dev_fd and vdpa_dev [Stefano]
>>>>     Patch 6:
>>>>       - move all steps into vhost_vdpa_device_unrealize. [Stefano]
>>>>
>>>> Changes RFC -> v2
>>>>     Patch 1:
>>>>       - rename 'pdev_id' to 'trans_devid'  [Michael]
>>>>       - only use transitional device id for the devices
>>>>         listed in the spec  [Michael]
>>>>       - use macros to make the id_info table clearer  [Longpeng]
>>>>       - add some modern devices in the id_info table  [Longpeng]
>>>>     Patch 2:
>>>>       - remove the GET_VECTORS_NUM command  [Jason]
>>>>     Patch 4:
>>>>       - expose vdpa_dev_fd as a QOM preperty  [Stefan]
>>>>       - introduce vhost_vdpa_device_get_u32 as a common
>>>>         function to make the code clearer  [Stefan]
>>>>       - fix the misleading description of 'dc->desc'  [Stefano]
>>>>     Patch 5:
>>>>       - check returned number of virtqueues  [Stefan]
>>>>     Patch 6:
>>>>       - init s->num_queues  [Stefano]
>>>>       - free s->dev.vqs  [Stefano]
>>>>
>>>>
>>>> Longpeng (Mike) (4):
>>>>     virtio: get class_id and pci device id by the virtio id
>>>>     vdpa: add vdpa-dev support
>>>>     vdpa: add vdpa-dev-pci support
>>>>     docs: Add generic vhost-vdpa device documentation
>>>>
>>>>    docs/system/devices/vhost-vdpa-device.rst |  43 +++
>>>>    hw/virtio/Kconfig                         |   5 +
>>>>    hw/virtio/meson.build                     |   2 +
>>>>    hw/virtio/vdpa-dev-pci.c                  | 102 ++++++
>>>>    hw/virtio/vdpa-dev.c                      | 377 ++++++++++++++++++++++
>>>>    hw/virtio/virtio-pci.c                    |  88 +++++
>>>>    include/hw/virtio/vdpa-dev.h              |  43 +++
>>>>    include/hw/virtio/virtio-pci.h            |   5 +
>>>>    8 files changed, 665 insertions(+)
>>>>    create mode 100644 docs/system/devices/vhost-vdpa-device.rst
>>>>    create mode 100644 hw/virtio/vdpa-dev-pci.c
>>>>    create mode 100644 hw/virtio/vdpa-dev.c
>>>>    create mode 100644 include/hw/virtio/vdpa-dev.h
>>>>
>>>> -- 
>>>> 2.23.0
>>>
>>> .
> 
> 
> .

