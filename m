Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965924EFEE3
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 07:18:30 +0200 (CEST)
Received: from localhost ([::1]:38218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naW9d-0004wD-8i
	for lists+qemu-devel@lfdr.de; Sat, 02 Apr 2022 01:18:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1naW6x-0004D0-4P
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 01:15:43 -0400
Received: from smtpbg139.qq.com ([175.27.65.136]:18403 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1naW6t-0004tG-IA
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 01:15:42 -0400
X-QQ-mid: bizesmtp89t1648876488tzv9e1c4
Received: from [10.25.15.160] ( [222.190.105.194])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 02 Apr 2022 13:14:46 +0800 (CST)
X-QQ-SSF: 00000000002000803000B00A0000000
X-QQ-FEAT: k0yT7W7BRd2g+D8AkeTYknYC7BlGd3DX8YHRakbFKvXOP87Xv+t9KTVu0mvwZ
 rCx5cb6HWpi8qPsWo6SF4TgApbfp3pegSJl6sTj6518tGXucnjmHBu25e2hpy3ljPfdzbkI
 pgNQAKBELAEphItkdWS3/vYtnQacDZoU8glaiNvMoIrG9sj/YYWscXeV+Of2SujVKnkkTgY
 agyVqhRvsgzPi/pv9HTIaEj/74n3FM1ZaQ3CVnVrJmuIOc5hHPETdq/A1MKf/c4S1+SJBtf
 mbTM+MSSxiQEeMGY4DcUBaf9PHLv0dSv2P2wQ/nFYNcEWrqstwXaUqOs1jdQyW4vsoi2k6Y
 do5X9DNltLOZ4WmalcQu1yjokWH7w==
X-QQ-GoodBg: 0
Message-ID: <f4ac0e4e-38ae-ecd6-6b0d-ab6abb535e54@archeros.com>+B0B60B7CDC850D03
Date: Sat, 2 Apr 2022 13:14:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] vhost: Refactor vhost_reset_device() in VhostOps
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com, si-wei.liu@oracle.com
References: <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-2-git-send-email-qiudayu@archeros.com>
 <c8e8459d-32b5-55ff-44f4-1f03edb8a597@redhat.com>
From: Michael Qiu <qiudayu@archeros.com>
In-Reply-To: <c8e8459d-32b5-55ff-44f4-1f03edb8a597@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:archeros.com:qybgspam:qybgspam6
Received-SPF: none client-ip=175.27.65.136; envelope-from=qiudayu@archeros.com;
 helo=smtpbg.qq.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 INVALID_MSGID=0.568, KHOP_HELO_FCRDNS=0.187, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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



On 2022/4/2 10:38, Jason Wang wrote:
> 
> 在 2022/4/1 下午7:06, Michael Qiu 写道:
>> Currently in vhost framwork, vhost_reset_device() is misnamed.
>> Actually, it should be vhost_reset_owner().
>>
>> In vhost user, it make compatible with reset device ops, but
>> vhost kernel does not compatible with it, for vhost vdpa, it
>> only implement reset device action.
>>
>> So we need seperate the function into vhost_reset_owner() and
>> vhost_reset_device(). So that different backend could use the
>> correct function.
> 
> 
> I see no reason when RESET_OWNER needs to be done for kernel backend.
> 

In kernel vhost, RESET_OWNER  indeed do vhost device level reset: 
vhost_net_reset_owner()

static long vhost_net_reset_owner(struct vhost_net *n)
{
[...]
         err = vhost_dev_check_owner(&n->dev);
         if (err)
                 goto done;
         umem = vhost_dev_reset_owner_prepare();
         if (!umem) {
                 err = -ENOMEM;
                 goto done;
         }
         vhost_net_stop(n, &tx_sock, &rx_sock);
         vhost_net_flush(n);
         vhost_dev_stop(&n->dev);
         vhost_dev_reset_owner(&n->dev, umem);
         vhost_net_vq_reset(n);
[...]

}

In the history of QEMU, There is a commit:
commit d1f8b30ec8dde0318fd1b98d24a64926feae9625
Author: Yuanhan Liu <yuanhan.liu@linux.intel.com>
Date:   Wed Sep 23 12:19:57 2015 +0800

     vhost: rename VHOST_RESET_OWNER to VHOST_RESET_DEVICE

     Quote from Michael:

         We really should rename VHOST_RESET_OWNER to VHOST_RESET_DEVICE.

but finally, it has been reverted by the author:
commit 60915dc4691768c4dc62458bb3e16c843fab091d
Author: Yuanhan Liu <yuanhan.liu@linux.intel.com>
Date:   Wed Nov 11 21:24:37 2015 +0800

     vhost: rename RESET_DEVICE backto RESET_OWNER

     This patch basically reverts commit d1f8b30e.

     It turned out that it breaks stuff, so revert it:
 
http://lists.nongnu.org/archive/html/qemu-devel/2015-10/msg00949.html

Seems kernel take RESET_OWNER for reset,but QEMU never call to this 
function to do a reset.

> And if I understand the code correctly, vhost-user "abuse" RESET_OWNER 
> for reset. So the current code looks fine?
> 
> 
>>
>> Signde-off-by: Michael Qiu <qiudayu@archeros.com>
>> ---
>>   hw/scsi/vhost-user-scsi.c         |  6 +++++-
>>   hw/virtio/vhost-backend.c         |  4 ++--
>>   hw/virtio/vhost-user.c            | 22 ++++++++++++++++++----
>>   include/hw/virtio/vhost-backend.h |  2 ++
>>   4 files changed, 27 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
>> index 1b2f7ee..f179626 100644
>> --- a/hw/scsi/vhost-user-scsi.c
>> +++ b/hw/scsi/vhost-user-scsi.c
>> @@ -80,8 +80,12 @@ static void vhost_user_scsi_reset(VirtIODevice *vdev)
>>           return;
>>       }
>> -    if (dev->vhost_ops->vhost_reset_device) {
>> +    if (virtio_has_feature(dev->protocol_features,
>> +                           VHOST_USER_PROTOCOL_F_RESET_DEVICE) &&
>> +                           dev->vhost_ops->vhost_reset_device) {
>>           dev->vhost_ops->vhost_reset_device(dev);
>> +    } else if (dev->vhost_ops->vhost_reset_owner) {
>> +        dev->vhost_ops->vhost_reset_owner(dev);
> 
> 
> Actually, I fail to understand why we need an indirection via vhost_ops. 
> It's guaranteed to be vhost_user_ops.
> 
> 
>>       }
>>   }
>> diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
>> index e409a86..abbaa8b 100644
>> --- a/hw/virtio/vhost-backend.c
>> +++ b/hw/virtio/vhost-backend.c
>> @@ -191,7 +191,7 @@ static int vhost_kernel_set_owner(struct vhost_dev 
>> *dev)
>>       return vhost_kernel_call(dev, VHOST_SET_OWNER, NULL);
>>   }
>> -static int vhost_kernel_reset_device(struct vhost_dev *dev)
>> +static int vhost_kernel_reset_owner(struct vhost_dev *dev)
>>   {
>>       return vhost_kernel_call(dev, VHOST_RESET_OWNER, NULL);
>>   }
>> @@ -317,7 +317,7 @@ const VhostOps kernel_ops = {
>>           .vhost_get_features = vhost_kernel_get_features,
>>           .vhost_set_backend_cap = vhost_kernel_set_backend_cap,
>>           .vhost_set_owner = vhost_kernel_set_owner,
>> -        .vhost_reset_device = vhost_kernel_reset_device,
>> +        .vhost_reset_owner = vhost_kernel_reset_owner,
> 
> 
> I think we can delete the current vhost_reset_device() since it not used 
> in any code path.
> 

I planned to use it for vDPA reset, and vhost-user-scsi also use device 
reset.

Thanks,
Michael

> Thanks
> 
> 
>>           .vhost_get_vq_index = vhost_kernel_get_vq_index,
>>   #ifdef CONFIG_VHOST_VSOCK
>>           .vhost_vsock_set_guest_cid = vhost_kernel_vsock_set_guest_cid,
>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>> index 6abbc9d..4412008 100644
>> --- a/hw/virtio/vhost-user.c
>> +++ b/hw/virtio/vhost-user.c
>> @@ -1475,16 +1475,29 @@ static int vhost_user_get_max_memslots(struct 
>> vhost_dev *dev,
>>       return 0;
>>   }
>> +static int vhost_user_reset_owner(struct vhost_dev *dev)
>> +{
>> +    VhostUserMsg msg = {
>> +        .hdr.request = VHOST_USER_RESET_OWNER,
>> +        .hdr.flags = VHOST_USER_VERSION,
>> +    };
>> +
>> +    return vhost_user_write(dev, &msg, NULL, 0);
>> +}
>> +
>>   static int vhost_user_reset_device(struct vhost_dev *dev)
>>   {
>>       VhostUserMsg msg = {
>> +        .hdr.request = VHOST_USER_RESET_DEVICE,
>>           .hdr.flags = VHOST_USER_VERSION,
>>       };
>> -    msg.hdr.request = virtio_has_feature(dev->protocol_features,
>> -                                         
>> VHOST_USER_PROTOCOL_F_RESET_DEVICE)
>> -        ? VHOST_USER_RESET_DEVICE
>> -        : VHOST_USER_RESET_OWNER;
>> +    /* Caller must ensure the backend has 
>> VHOST_USER_PROTOCOL_F_RESET_DEVICE
>> +     * support */
>> +    if (!virtio_has_feature(dev->protocol_features,
>> +                       VHOST_USER_PROTOCOL_F_RESET_DEVICE)) {
>> +        return -EPERM;
>> +    }
>>       return vhost_user_write(dev, &msg, NULL, 0);
>>   }
>> @@ -2548,6 +2561,7 @@ const VhostOps user_ops = {
>>           .vhost_set_features = vhost_user_set_features,
>>           .vhost_get_features = vhost_user_get_features,
>>           .vhost_set_owner = vhost_user_set_owner,
>> +        .vhost_reset_owner = vhost_user_reset_owner,
>>           .vhost_reset_device = vhost_user_reset_device,
>>           .vhost_get_vq_index = vhost_user_get_vq_index,
>>           .vhost_set_vring_enable = vhost_user_set_vring_enable,
>> diff --git a/include/hw/virtio/vhost-backend.h 
>> b/include/hw/virtio/vhost-backend.h
>> index 81bf310..affeeb0 100644
>> --- a/include/hw/virtio/vhost-backend.h
>> +++ b/include/hw/virtio/vhost-backend.h
>> @@ -77,6 +77,7 @@ typedef int (*vhost_get_features_op)(struct 
>> vhost_dev *dev,
>>                                        uint64_t *features);
>>   typedef int (*vhost_set_backend_cap_op)(struct vhost_dev *dev);
>>   typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
>> +typedef int (*vhost_reset_owner_op)(struct vhost_dev *dev);
>>   typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
>>   typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx);
>>   typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
>> @@ -150,6 +151,7 @@ typedef struct VhostOps {
>>       vhost_get_features_op vhost_get_features;
>>       vhost_set_backend_cap_op vhost_set_backend_cap;
>>       vhost_set_owner_op vhost_set_owner;
>> +    vhost_reset_owner_op vhost_reset_owner;
>>       vhost_reset_device_op vhost_reset_device;
>>       vhost_get_vq_index_op vhost_get_vq_index;
>>       vhost_set_vring_enable_op vhost_set_vring_enable;
> 
> 

