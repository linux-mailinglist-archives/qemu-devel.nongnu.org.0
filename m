Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BCD58223B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 10:34:43 +0200 (CEST)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGcV8-0003rs-BH
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 04:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGcKk-0003Na-TI
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:23:59 -0400
Received: from out199-8.us.a.mail.aliyun.com ([47.90.199.8]:47437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGcKb-00013T-Dg
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:23:52 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VKa69hG_1658910219; 
Received: from 30.227.68.147(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VKa69hG_1658910219) by smtp.aliyun-inc.com;
 Wed, 27 Jul 2022 16:23:40 +0800
Message-ID: <5b5bc692-f7fb-1e76-6404-b0e036f7b419@linux.alibaba.com>
Date: Wed, 27 Jul 2022 16:23:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 11/16] vhost: introduce restart and release for
 vhost_dev's vqs
To: Jason Wang <jasowang@redhat.com>
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <98cc06919b016e16b9abc606dd514ac2b4f85c06.1658141552.git.kangjie.xu@linux.alibaba.com>
 <2606a57f-53ef-8cc4-d51a-76c43f6ecbcf@redhat.com>
 <f28d29ac-f244-a523-ed78-84c438d13340@linux.alibaba.com>
 <CACGkMEtxXSm8Qc1LpKJJYm9cQ-F+eU5Lqecr62maRPxq1tM5rg@mail.gmail.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, xuanzhuo@linux.alibaba.com,
 hengqi@linux.alibaba.com, mst@redhat.com
In-Reply-To: <CACGkMEtxXSm8Qc1LpKJJYm9cQ-F+eU5Lqecr62maRPxq1tM5rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=47.90.199.8;
 envelope-from=kangjie.xu@linux.alibaba.com; helo=out199-8.us.a.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


在 2022/7/27 12:47, Jason Wang 写道:
> On Tue, Jul 26, 2022 at 1:13 PM Kangjie Xu <kangjie.xu@linux.alibaba.com> wrote:
>>
>> 在 2022/7/26 12:13, Jason Wang 写道:
>>> 在 2022/7/18 19:17, Kangjie Xu 写道:
>>>> Introduce vhost_dev_virtqueue_restart(), which can restart the
>>>> virtqueue when the vhost has already started running.
>>>>
>>>> Meanwhile, vhost_dev_virtqueue_release(), which can ummap the
>>>> vrings and the desc of a specific vq of a device.
>>>>
>>>> Combining the two functions, we can reset a virtqueue with a
>>>> started vhost.
>>>>
>>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>>> ---
>>>>    hw/virtio/vhost.c         | 29 +++++++++++++++++++++++++++++
>>>>    include/hw/virtio/vhost.h |  6 ++++++
>>>>    2 files changed, 35 insertions(+)
>>>>
>>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>>> index e467dfc7bc..d158d71866 100644
>>>> --- a/hw/virtio/vhost.c
>>>> +++ b/hw/virtio/vhost.c
>>>> @@ -1904,3 +1904,32 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>>>>          return -ENOSYS;
>>>>    }
>>>> +
>>>> +void vhost_dev_virtqueue_release(struct vhost_dev *hdev,
>>>> VirtIODevice *vdev,
>>>> +                                 int vq_index)
>>>> +{
>>>> +    int idx = vq_index - hdev->vq_index;
>>>> +
>>>> +    idx = hdev->vhost_ops->vhost_get_vq_index(hdev, idx);
>>>> +
>>>> +    vhost_virtqueue_unmap(hdev,
>>>> +                          vdev,
>>>> +                          hdev->vqs + idx,
>>>> +                          hdev->vq_index + idx);
>>>> +}
>>>
>>> Anything wrong that makes you can't use vhost_virtqueue_stop() here?
>>>
>>> Thanks
>>>
>> Yeah, vhost_virtqueue_stop() will result in all the queues in the device
>> being stopped.
> This sounds a defect of the backend. I think we'd better not
> workaround it in the qemu.
Yeah, I agree.
>> In the scenario of DPDK-OVS, vhost_virtqueue_stop will send
>> VHOST_USER_GET_VRING_BASE to DPDK. This message is meant to destroy the
>> queue.
> That's tricky.
>
>> However, In DPDK, VHOST_USER_GET_VRING_BASE message will lead to
>> vhost_destroy_device_notify(). This function will disable all the queues
>> in the device.
> Ok. I wonder how the reset is implemented in DPDK? It looks to me a
> new type of request is required.
>
Currently, DPDK does not support reset of queue level, but it supports 
device-level reset. VHOST_USER_RESET_DEVICE request exists in vhost 
protocol but it is not used in vhost-net module in QEMU.

It seems like there is no way for the driver to directly reset the 
device in vhost user net (If we use ethtool -r <eth_name>, we will get 
operation not supported.)

Actually we can plug the driver in and out to perform a device reset 
operation, but it will be applied to all the devices. I take it for 
example here.

If you plug out the driver(modprobe -r virtio-net), vhost_dev_stop() 
will be called in qemu. DPDK will receive VHOST_USER_GET_VRING_BASE 
messages for each virtqueue.

Then you can plug in the driver(modprobe virtio-net), vhost_dev_start() 
will be called in qemu. The process is same as when we boot the machine, 
DPDK will receive:

     VHOST_USER_SET_VRING_NUM, VHOST_USER_SET_VRING_BASE, 
VHOST_USER_SET_VRING_ADDR, VHOST_USER_SET_VRING_KICK, 
VHOST_USER_SET_VRING_CALL

in order to start a virtqueue.

Our vq reset implemenation does not need any change to the DPDK except 
adding the feature bit, since we reuse all the request types in 
vhost-user protocol.

I agree that we should add a new request in vhost-user protocol to 
support vq reset, we'll implement it in the next version.

>> Thus, when restarting the queue, other queues except the restarted one
>> are still disabled.
>>
>> On the other hand, I think it may be not necessary to destroy the queue.
>> We can simply disable it. When restarting the queue, it will be
>> intialized again.
> So for vhost-net kernel, we can simply set NULL as the backend for a
> specific virtqueue. We just need to refactor the stop codes (which did
> it at vhost device level instead of queue level currently).
>
> Thanks

Yes, I think so.

Thanks

>> Thanks
>>
>>>> +
>>>> +int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, VirtIODevice
>>>> *vdev,
>>>> +                                int vq_index)
>>>> +{
>>>> +    int idx = vq_index - hdev->vq_index;
>>>> +    int r = 0;
>>>> +
>>>> +    idx = hdev->vhost_ops->vhost_get_vq_index(hdev, idx);
>>>> +
>>>> +    r = vhost_virtqueue_start(hdev,
>>>> +                              vdev,
>>>> +                              hdev->vqs + idx,
>>>> +                              hdev->vq_index + idx);
>>>> +
>>>> +    return r;
>>>> +}
>>>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>>>> index a346f23d13..7df7dbe24d 100644
>>>> --- a/include/hw/virtio/vhost.h
>>>> +++ b/include/hw/virtio/vhost.h
>>>> @@ -277,6 +277,12 @@ bool vhost_has_free_slot(void);
>>>>    int vhost_net_set_backend(struct vhost_dev *hdev,
>>>>                              struct vhost_vring_file *file);
>>>>    +
>>>> +void vhost_dev_virtqueue_release(struct vhost_dev *hdev,
>>>> VirtIODevice *vdev,
>>>> +                                 int vq_index);
>>>> +int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, VirtIODevice
>>>> *vdev,
>>>> +                                int vq_index);
>>>> +
>>>>    int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova,
>>>> int write);
>>>>      void vhost_dev_reset_inflight(struct vhost_inflight *inflight);

