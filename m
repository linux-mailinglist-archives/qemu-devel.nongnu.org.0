Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A7D4EC521
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 15:04:01 +0200 (CEST)
Received: from localhost ([::1]:54794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXzU-0008Qd-6I
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 09:04:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1nZV2d-0003lw-0p
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:55:03 -0400
Received: from smtpbg137.qq.com ([106.55.202.113]:51853 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1nZV2Z-0004e1-6R
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:55:02 -0400
X-QQ-mid: bizesmtp76t1648634015t1ijbnpz
Received: from [10.25.15.160] ( [222.190.105.194])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 30 Mar 2022 17:53:34 +0800 (CST)
X-QQ-SSF: 01000000002000402000B00A0000000
X-QQ-FEAT: 02HFykG0jkttH9Zg6W1ssvTZzl+ILrFpuazDwweADPl111VMutndB/CVEyvOq
 +g+j5ukXEDedKzHP49imPmH16qUCoTpyA0Agvg28McCQRtq4JmIi/NGZ43S01F6sSXg77KD
 0GpLkLWAqeypIt64kY+rVKBcCbBGHPOXpVnGK/ZoftPc+vMKSu1WbQCgffEevawMbGrXZzv
 Ec0vuOiaqXbFif9p5iwZLvXsEri4Uw0Rr2J9yAupoqFpDVxrs3ZUasT120avo6a1/sBLrN/
 96qqekU7pQKZwsfIHDNMPeSicgBDvCjP9x6G1ejTz7bjE+o+q3/z1UY+Tqv6K4iypfnA==
X-QQ-GoodBg: 0
Message-ID: <c0325d43-76cc-298a-2ff8-53ede3257846@archeros.com>+F124289D631EB6F8
Date: Wed, 30 Mar 2022 17:53:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] vdpa: Avoid reset when stop device
To: Jason Wang <jasowang@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>
References: <1648024966-5170-1-git-send-email-08005325@163.com>
 <CACGkMEsjQp+gjHV23ntJ2oTBCdt-1TT0GGn-PFDjOvETz6sQ7A@mail.gmail.com>
 <df7c9a87-b2bd-7758-a6b6-bd834a7336fe@oracle.com>
 <6fbf82a9-39ce-f179-5e4b-384123ca542c@archeros.com>
 <dde0ce95-a1e9-a662-66b6-1c17c77878fd@oracle.com>
 <CACGkMEvftrkMskukvoL0myqazPhJCnKJbxW53aVT3MqLgtY+Kw@mail.gmail.com>
From: Michael Qiu <qiudayu@archeros.com>
In-Reply-To: <CACGkMEvftrkMskukvoL0myqazPhJCnKJbxW53aVT3MqLgtY+Kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:archeros.com:qybgspam:qybgspam9
Received-SPF: none client-ip=106.55.202.113; envelope-from=qiudayu@archeros.com;
 helo=smtpbg.qq.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 INVALID_MSGID=0.568, KHOP_HELO_FCRDNS=0.187, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 08:57:42 -0400
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
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, 08005325@163.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2022/3/30 16:52, Jason Wang wrote:
> On Sat, Mar 26, 2022 at 3:59 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>>
>> On 3/25/2022 12:18 AM, Michael Qiu wrote:
>>>
>>>
>>> On 2022/3/25 14:32, Si-Wei Liu Wrote:
>>>>
>>>>
>>>> On 3/23/2022 2:20 AM, Jason Wang wrote:
>>>>> Adding Eugenio,  and Ling Shan.
>>>>>
>>>>> On Wed, Mar 23, 2022 at 4:58 PM <08005325@163.com> wrote:
>>>>>> From: Michael Qiu <qiudayu@archeros.com>
>>>>>>
>>>>>> Currently, when VM poweroff, it will trigger vdpa
>>>>>> device(such as mlx bluefield2 VF) reset twice, this leads
>>>>>> to below issue:
>>>>>>
>>>>>> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
>>>>>>
>>>>>> This because in vhost_dev_stop(), qemu tries to stop the device,
>>>>>> then stop the queue: vhost_virtqueue_stop().
>>>>>> In vhost_dev_stop(), it resets the device, which clear some flags
>>>>>> in low level driver, and the driver finds
>>>>>> that the VQ is invalied, this is the root cause.
>>>>>>
>>>>>> Actually, device reset will be called within func release()
>>>>>>
>>>>>> To solve the issue, vdpa should set vring unready, and
>>>>>> remove reset ops in device stop: vhost_dev_start(hdev, false).
>>>>> This is an interesting issue. Do you see a real issue except for the
>>>>> above warnings.
>>>>>
>>>>> The reason we "abuse" reset is that we don't have a stop uAPI for
>>>>> vhost. We plan to add a status bit to stop the whole device in the
>>>>> virtio spec, but considering it may take a while maybe we can first
>>>>> introduce a new uAPI/ioctl for that.
>>>> Yep. What was missing here is a vdpa specific uAPI for per-virtqueue
>>>> stop/suspend rather than spec level amendment to stop the whole
>>>> device (including both vq and config space). For now we can have vDPA
>>>> specific means to control the vq, something vDPA hardware vendor must
>>>> support for live migration, e.g. datapath switching to shadow vq. I
>>>> believe the spec amendment may follow to define a bit for virtio
>>>> feature negotiation later on if needed (FWIW virtio-vdpa already does
>>>> set_vq_ready(..., 0) to stop the vq).
>>>>
>>>> However, there's a flaw in this patch, see below.
>>>>>
>>>>> Note that the stop doesn't just work for virtqueue but others like,
>>>>> e.g config space. But considering we don't have config interrupt
>>>>> support right now, we're probably fine.
>>>>>
>>>>> Checking the driver, it looks to me only the IFCVF's set_vq_ready() is
>>>>> problematic, Ling Shan, please have a check. And we probably need a
>>>>> workaround for vp_vdpa as well.
>>>>>
>>>>> Anyhow, this seems to be better than reset. So for 7.1:
>>>>>
>>>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>>>>
>>>>>> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
>>>>>> ---
>>>>>>    hw/virtio/vhost-vdpa.c | 8 ++++----
>>>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>>>> index c5ed7a3..d858b4f 100644
>>>>>> --- a/hw/virtio/vhost-vdpa.c
>>>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>>>> @@ -719,14 +719,14 @@ static int vhost_vdpa_get_vq_index(struct
>>>>>> vhost_dev *dev, int idx)
>>>>>>        return idx;
>>>>>>    }
>>>>>>
>>>>>> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>>>>>> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev,
>>>>>> unsigned int ready)
>>>>>>    {
>>>>>>        int i;
>>>>>>        trace_vhost_vdpa_set_vring_ready(dev);
>>>>>>        for (i = 0; i < dev->nvqs; ++i) {
>>>>>>            struct vhost_vring_state state = {
>>>>>>                .index = dev->vq_index + i,
>>>>>> -            .num = 1,
>>>>>> +            .num = ready,
>>>>>>            };
>>>>>>            vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>>>>>        }
>>>>>> @@ -1088,8 +1088,9 @@ static int vhost_vdpa_dev_start(struct
>>>>>> vhost_dev *dev, bool started)
>>>>>>            if (unlikely(!ok)) {
>>>>>>                return -1;
>>>>>>            }
>>>>>> -        vhost_vdpa_set_vring_ready(dev);
>>>>>> +        vhost_vdpa_set_vring_ready(dev, 1);
>>>>>>        } else {
>>>>>> +        vhost_vdpa_set_vring_ready(dev, 0);
>>>>>>            ok = vhost_vdpa_svqs_stop(dev);
>>>>>>            if (unlikely(!ok)) {
>>>>>>                return -1;
>>>>>> @@ -1105,7 +1106,6 @@ static int vhost_vdpa_dev_start(struct
>>>>>> vhost_dev *dev, bool started)
>>>>>>            memory_listener_register(&v->listener,
>>>>>> &address_space_memory);
>>>>>>            return vhost_vdpa_add_status(dev,
>>>>>> VIRTIO_CONFIG_S_DRIVER_OK);
>>>>>>        } else {
>>>>>> -        vhost_vdpa_reset_device(dev);
>>>> Unfortunately, the reset can't be be removed from here as this code
>>>> path usually involves virtio reset or status change for e.g. invoked
>>>> via virtio_net_set_status(... , 0). Ideally we should use the
>>>> VhostOps.vhost_reset_device() to reset the vhost-vdpa device where
>>>> status change is involved after vhost_dev_stop() is done, but this
>>>> distinction is not there yet as of today in all of the virtio devices
>>>> except vhost_user_scsi.
>>>>
>>>> Alternatively we may be able to do something like below, stop the
>>>> virtqueue in vhost_vdpa_get_vring_base() in the
>>>> vhost_virtqueue_stop() context. Only until the hardware vq is
>>>> stopped, svq can stop and unmap then vhost-vdpa would reset the
>>>> device status. It kinda works, but not in a perfect way...
>> As I indicated above, this is an less ideal way to address the issue you
>> came across about, without losing functionality or introducing
>> regression to the code. Ideally it'd be best to get fixed in a clean
>> way, though that would a little more effort in code refactoring.
>> Personally I feel that the error message you saw is somewhat benign and
>> don't think it caused any real problem. Did you see trouble if living
>> with the bogus error message for the moment?
> 
> Should be fine for networking devices at least since we don't care
> about duplicated packets (restore last_avail_idx as used_idx).
> 
> But it might be problematic for types of devices.
> 
> Thanks
> 

I find that the second reset does not triggered by device qemu_del_nic, 
although it will trigger device reset, the rootcause is that,
we try to stop the vhost devices in each queue pair and control queue, 
each queue pair or control queue needs one vhost device. And all vhost 
devices share one kernel vdpa device.

In my case, only enable 1 datapath queue pair and one control queue.

the first time vhost_net_stop_one is for datapath queue pair, but
at this time the backend kernel vdpa device has been reset, in the
second loop, when stop control queue backend vhost device, the queue
already disappeared.

I will send V2 to fix the issue, to reset the device in the last vhost 
device stop stage.

> 
>>
>>>>
>>>> --- a/hw/virtio/vhost-vdpa.c
>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>> @@ -564,14 +564,14 @@ static int vhost_vdpa_get_vq_index(struct
>>>> vhost_dev *dev, int idx)
>>>>        return idx;
>>>>    }
>>>>
>>>> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>>>> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, int
>>>> enable)
>>>>    {
>>>>        int i;
>>>>        trace_vhost_vdpa_set_vring_ready(dev);
>>>>        for (i = 0; i < dev->nvqs; ++i) {
>>>>            struct vhost_vring_state state = {
>>>>                .index = dev->vq_index + i,
>>>> -            .num = 1,
>>>> +            .num = enable,
>>>>            };
>>>>            vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>>>        }
>>>> @@ -641,7 +641,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev
>>>> *dev, bool started)
>>>>
>>>>        if (started) {
>>>>            vhost_vdpa_host_notifiers_init(dev);
>>>> -        vhost_vdpa_set_vring_ready(dev);
>>>> +        vhost_vdpa_set_vring_ready(dev, 1);
>>>>        } else {
>>>>            vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>>>>        }
>>>> @@ -708,6 +708,9 @@ static int vhost_vdpa_get_vring_base(struct
>>>> vhost_dev *dev,
>>>>    {
>>>>        int ret;
>>>>
>>>> +    /* Deactivate the queue (best effort) */
>>>> +    vhost_vdpa_set_vring_ready(dev, 0);
>>>> +
>>>
>>> I don't think it's a good idea to change the state in "get" function,
>>>
>>> get means "read" not "write".
>> Well, if you look at the context of vhost_vdpa_get_vring_base(), the
>> only caller is vhost_virtqueue_stop(). Without stopping the hardware
>> ahead, it doesn't make sense to effectively get a used_index snapshot
>> for resuming/restarting the vq. It might be more obvious and sensible to
>> see that were to introduce another Vhost op to suspend the vq right
>> before the get_vring_base() call, though I wouldn't bother doing it.
>>
>>>
>>>>        ret = vhost_vdpa_call(dev, VHOST_GET_VRING_BASE, ring);
>>>>        trace_vhost_vdpa_get_vring_base(dev, ring->index, ring->num);
>>>>        return ret;
>>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>>> index 437347a..2e917d8 100644
>>>> --- a/hw/virtio/vhost.c
>>>> +++ b/hw/virtio/vhost.c
>>>> @@ -1832,15 +1832,15 @@ void vhost_dev_stop(struct vhost_dev *hdev,
>>>> VirtIODevice *vdev)
>>>>        /* should only be called after backend is connected */
>>>>        assert(hdev->vhost_ops);
>>>>
>>>> -    if (hdev->vhost_ops->vhost_dev_start) {
>>>> -        hdev->vhost_ops->vhost_dev_start(hdev, false);
>>>> -    }
>>>>        for (i = 0; i < hdev->nvqs; ++i) {
>>>>            vhost_virtqueue_stop(hdev,
>>>>                                 vdev,
>>>>                                 hdev->vqs + i,
>>>>                                 hdev->vq_index + i);
>>>>        }
>>>> +    if (hdev->vhost_ops->vhost_dev_start) {
>>>> +        hdev->vhost_ops->vhost_dev_start(hdev, false);
>>>> +    }
>>>>
>>>
>>> This first idea comes to me is just like this, but at last I don't
>>> choose this solution.
>>>
>>> When we start a device, first we start the virtqueue then
>>> vhost_ops->vhost_dev_start.
>>>
>>> So in stop stage, in my opinion, we should just do the opposite, do as
>>> the orignal code do. Change the sequential is a dangerous action.
>> I don't see any danger yet, would you please elaborate the specific
>> problem you see? I think this sequence is as expected:
>>
>> 1. suspend each individual vq i.e. stop processing upcoming request, and
>> possibly complete inflight requests  -> get_vring_base()
>> 2. tear down virtio resources from VMM for e.g. unmap guest memory
>> mappings, remove host notifiers, and et al
>> 3. reset device -> vhost_vdpa_reset_device()
>>
>> Regards,
>> -Siwei
>>
>>>
>>> Thanks,
>>> Michael
>>>>        if (vhost_dev_has_iommu(hdev)) {
>>>>            if (hdev->vhost_ops->vhost_set_iotlb_callback) {
>>>>
>>>> Regards,
>>>> -Siwei
>>>>
>>>>>>            vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>>>>> VIRTIO_CONFIG_S_DRIVER);
>>>>>>            memory_listener_unregister(&v->listener);
>>>>>> --
>>>>>> 1.8.3.1
>>>>>>
>>>>>
>>>>
>>>>
>>
> 
> 

