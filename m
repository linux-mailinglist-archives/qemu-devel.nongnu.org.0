Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8D24EE5CB
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 03:48:22 +0200 (CEST)
Received: from localhost ([::1]:55022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na6Oi-00035c-Sd
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 21:48:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1na6Mg-0002Qz-Vy
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 21:46:15 -0400
Received: from smtpbg152.qq.com ([13.245.186.79]:52528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1na6MZ-0006I1-8v
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 21:46:14 -0400
X-QQ-mid: bizesmtp67t1648777556t5hb7wu8
Received: from [10.25.2.237] ( [222.190.105.194])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 01 Apr 2022 09:45:55 +0800 (CST)
X-QQ-SSF: 01000000002000803000B00A0000000
X-QQ-GoodBg: 0
Message-ID: <0485a5b3-61b2-08cd-0e55-036e5afd06a4@archeros.com>+F6EBEC79085C71E1
Date: Fri, 1 Apr 2022 09:45:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH RESEND v3] vdpa: reset the backend device in the end of
 vhost_net_stop()
To: Si-Wei Liu <si-wei.liu@oracle.com>, jasowang@redhat.com, mst@redhat.com
References: <1648634561-12504-1-git-send-email-08005325@163.com>
 <1648718713-7637-1-git-send-email-qiudayu@archeros.com>
 <0055bb0b-6c24-9a25-83f2-08ea2b3fe0e6@oracle.com>
From: Michael Qiu <qiudayu@archeros.com>
In-Reply-To: <0055bb0b-6c24-9a25-83f2-08ea2b3fe0e6@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:archeros.com:qybgforeign:qybgforeign8
X-QQ-Bgrelay: 1
Received-SPF: none client-ip=13.245.186.79; envelope-from=qiudayu@archeros.com;
 helo=smtpbg152.qq.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 INVALID_MSGID=0.568, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eperezma@redhat.com, lingshan.zhu@intel.com, qemu-devel@nongnu.org,
 lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2022/4/1 9:12, Si-Wei Liu worte:
> 
> 
> On 3/31/2022 2:25 AM, qiudayu@archeros.com wrote:
>> From: Michael Qiu <qiudayu@archeros.com>
>>
>> Currently, when VM poweroff, it will trigger vdpa
>> device(such as mlx bluefield2 VF) reset many times(with 1 datapath
>> queue pair and one control queue, triggered 3 times), this
>> leads to below issue:
>>
>> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
>>
>> This because in vhost_net_stop(), it will stop all vhost device bind to
>> this virtio device, and in vhost_dev_stop(), qemu tries to stop the 
>> device
>> , then stop the queue: vhost_virtqueue_stop().
>>
>> In vhost_dev_stop(), it resets the device, which clear some flags
>> in low level driver, and in next loop(stop other vhost backends),
>> qemu try to stop the queue corresponding to the vhost backend,
>>   the driver finds that the VQ is invalied, this is the root cause.
>>
>> To solve the issue, vdpa should set vring unready, and
>> remove reset ops in device stop: vhost_dev_start(hdev, false).
>>
>> and implement a new function vhost_dev_reset, only reset backend
>> device after all vhost(per-queue) stoped.
>>
>> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
>> Acked-by: Jason Wang <jasowang@redhat.com>
>> ---
>> v3 --> v2:
>>      Call vhost_dev_reset() at the end of vhost_net_stop().
>>
>>      Since the vDPA device need re-add the status bit
>>      VIRTIO_CONFIG_S_ACKNOWLEDGE and VIRTIO_CONFIG_S_DRIVER,
>>      simply, add them inside vhost_vdpa_reset_device, and
>>      the only way calling vhost_vdpa_reset_device is in
>>      vhost_net_stop(), so it keeps the same behavior as before.
>>
>> v2 --> v1:
>>     Implement a new function vhost_dev_reset,
>>     reset the backend kernel device at last.
>> ---
>>   hw/net/vhost_net.c        | 24 +++++++++++++++++++++---
>>   hw/virtio/vhost-vdpa.c    | 15 +++++++++------
>>   hw/virtio/vhost.c         | 15 ++++++++++++++-
>>   include/hw/virtio/vhost.h |  1 +
>>   4 files changed, 45 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index 30379d2..422c9bf 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -325,7 +325,7 @@ int vhost_net_start(VirtIODevice *dev, 
>> NetClientState *ncs,
>>       int total_notifiers = data_queue_pairs * 2 + cvq;
>>       VirtIONet *n = VIRTIO_NET(dev);
>>       int nvhosts = data_queue_pairs + cvq;
>> -    struct vhost_net *net;
>> +    struct vhost_net *net = NULL;
>>       int r, e, i, index_end = data_queue_pairs * 2;
>>       NetClientState *peer;
>> @@ -391,8 +391,17 @@ int vhost_net_start(VirtIODevice *dev, 
>> NetClientState *ncs,
>>   err_start:
>>       while (--i >= 0) {
>>           peer = qemu_get_peer(ncs , i);
>> -        vhost_net_stop_one(get_vhost_net(peer), dev);
>> +
>> +        net = get_vhost_net(peer);
>> +
>> +        vhost_net_stop_one(net, dev);
>>       }
>> +
>> +    /* We only reset backend vdpa device */
>> +    if (net && net->dev.vhost_ops->backend_type == 
>> VHOST_BACKEND_TYPE_VDPA) {
> I would reset the device anyway regardless the first vhost_dev. Some 
> ioctl calls may have well changed device state in vhost_dev_start() that 
> has no way to get back than reset.
> 
Here I just use the first vhost_dev as nothing is different in each 
vhost_dev, reset just set 0 to the vhost-vdpa socket FD. In all 
vhost_dev, FD is the same.

>> +        vhost_dev_reset(&net->dev);
> I would move this to the end as it's more sensible to reset the device 
> after guest notifier is disabled.

I will move it in next patch

>> +    }
>> +
>>       e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>>       if (e < 0) {
>>           fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", 
>> e);
>> @@ -410,6 +419,7 @@ void vhost_net_stop(VirtIODevice *dev, 
>> NetClientState *ncs,
>>       VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
>>       VirtIONet *n = VIRTIO_NET(dev);
>>       NetClientState *peer;
>> +    struct vhost_net *net = NULL;
>>       int total_notifiers = data_queue_pairs * 2 + cvq;
>>       int nvhosts = data_queue_pairs + cvq;
>>       int i, r;
>> @@ -420,7 +430,15 @@ void vhost_net_stop(VirtIODevice *dev, 
>> NetClientState *ncs,
>>           } else {
>>               peer = qemu_get_peer(ncs, n->max_queue_pairs);
>>           }
>> -        vhost_net_stop_one(get_vhost_net(peer), dev);
>> +
>> +        net = get_vhost_net(peer);
>> +
>> +        vhost_net_stop_one(net, dev);
>> +    }
>> +
>> +    /* We only reset backend vdpa device */
>> +    if (net && net->dev.vhost_ops->backend_type == 
>> VHOST_BACKEND_TYPE_VDPA) {
> Yikes, I think it needs some code refactoring here without having to 
> check VHOST_BACKEND_TYPE_VDPA explicitly. Historically the 
> .vhost_reset_device() op was misnamed: it was initially meant for 
> RESET_OWNER but never got used. Could you add a new .vhost_reset_owner() 
> op to VhostOps (via another patch) and rename properly, e.g. from 
> vhost_kernel_reset_device() to vhost_kernel_reset_owner()? For 
> vhost_user_reset_device(), you can safely factor out the 
> VHOST_USER_RESET_OWNER case to a new vhost_user_reset_owner() function, 
> and only reset the device in vhost_user_reset_device() depending on the 
> VHOST_USER_PROTOCOL_F_RESET_DEVICE protocol feature.
> 
> With this change, vhost_reset_device will be effectively a no-op on 
> vhost_kernel (NULL) and vhost_user (only applicable to vhost-user-scsi 
> backend which supports VHOST_USER_PROTOCOL_F_RESET_DEVICE).


OK, I will make a patch to do that.

>> +        vhost_dev_reset(&net->dev);
> I would move this to the end as it's more sensible to reset the device 
> after guest notifier is disabled.
> 
>>       }
>>       r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> index c5ed7a3..3ef0199 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -708,6 +708,11 @@ static int vhost_vdpa_reset_device(struct 
>> vhost_dev *dev)
>>       ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>>       trace_vhost_vdpa_reset_device(dev, status);
>> +
>> +    /* Add back this status, so that the device could work next time*/
>> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>> +                               VIRTIO_CONFIG_S_DRIVER);
>> +
> Hmmm, this might not be the ideal place, but I'm fine to leave it as-is. 
> It would need some more future work in code refactoring for e.g. live 
> migration and error recovery.
> 
> Thanks,
> -Siwei
> 
>>       return ret;
>>   }
>> @@ -719,14 +724,14 @@ static int vhost_vdpa_get_vq_index(struct 
>> vhost_dev *dev, int idx)
>>       return idx;
>>   }
>> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, unsigned 
>> int ready)
>>   {
>>       int i;
>>       trace_vhost_vdpa_set_vring_ready(dev);
>>       for (i = 0; i < dev->nvqs; ++i) {
>>           struct vhost_vring_state state = {
>>               .index = dev->vq_index + i,
>> -            .num = 1,
>> +            .num = ready,
>>           };
>>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>       }
>> @@ -1088,8 +1093,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev 
>> *dev, bool started)
>>           if (unlikely(!ok)) {
>>               return -1;
>>           }
>> -        vhost_vdpa_set_vring_ready(dev);
>> +        vhost_vdpa_set_vring_ready(dev, 1);
>>       } else {
>> +        vhost_vdpa_set_vring_ready(dev, 0);
>>           ok = vhost_vdpa_svqs_stop(dev);
>>           if (unlikely(!ok)) {
>>               return -1;
>> @@ -1105,9 +1111,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev 
>> *dev, bool started)
>>           memory_listener_register(&v->listener, &address_space_memory);
>>           return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>>       } else {
>> -        vhost_vdpa_reset_device(dev);
>> -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>> -                                   VIRTIO_CONFIG_S_DRIVER);
>>           memory_listener_unregister(&v->listener);
>>           return 0;
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index b643f42..7e0cdb6 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -1820,7 +1820,6 @@ fail_features:
>>   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
>>   {
>>       int i;
>> -
>>       /* should only be called after backend is connected */
>>       assert(hdev->vhost_ops);
>> @@ -1854,3 +1853,17 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>>       return -ENOSYS;
>>   }
>> +
>> +int vhost_dev_reset(struct vhost_dev *hdev)
>> +{
>> +    int ret = 0;
>> +
>> +    /* should only be called after backend is connected */
>> +    assert(hdev->vhost_ops);
>> +
>> +    if (hdev->vhost_ops->vhost_reset_device) {
>> +        ret = hdev->vhost_ops->vhost_reset_device(hdev);
>> +    }
>> +
>> +    return ret;
>> +}
>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>> index 58a73e7..b8b7c20 100644
>> --- a/include/hw/virtio/vhost.h
>> +++ b/include/hw/virtio/vhost.h
>> @@ -114,6 +114,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void 
>> *opaque,
>>   void vhost_dev_cleanup(struct vhost_dev *hdev);
>>   int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
>>   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
>> +int vhost_dev_reset(struct vhost_dev *hdev);
>>   int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice 
>> *vdev);
>>   void vhost_dev_disable_notifiers(struct vhost_dev *hdev, 
>> VirtIODevice *vdev);
> 
> 



