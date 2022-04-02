Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88F94EFDEA
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 04:09:46 +0200 (CEST)
Received: from localhost ([::1]:59374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naTCz-0003Ov-PV
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 22:09:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1naTCD-0002kM-1x
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 22:08:57 -0400
Received: from smtpbg136.qq.com ([106.55.201.188]:41343 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1naTCA-0006hj-6X
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 22:08:56 -0400
X-QQ-mid: bizesmtp90t1648865292tzxlccyy
Received: from [10.25.15.160] ( [222.190.105.194])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 02 Apr 2022 10:08:11 +0800 (CST)
X-QQ-SSF: 01000000002000803000B00A0000000
X-QQ-FEAT: 32aHAbQKZSk9KLbE91DpkcRgs84sdd2r6oEQg1dYWjlLck+bs9vkjQqk3hhuU
 9hse37CNoaY1/fdlVz3D/H+1bqnQWC6xBDgPLrNEfW6bGdGVcBSxG6SNe6RY5FBqGF6R8yi
 y8EuLEozzOxlhf+WzhTTyvSLnQIP3xEB0M7TfXBOe2TZu6062bKPOgKequ5HTQDgcZc61C/
 RPltwI4ZhDDSgYzon/1rB02yXNnfhCBtDZuvZkEpoi/knKCW94/PEopnBCjV/gMf934M/Iq
 bCv4EpLmLhgUl1vQCBrjcNoykRdLLo0zUuGbcCAcc1E9qMsE2prwFyRYT/LoKm0mH1Ug==
X-QQ-GoodBg: 0
Message-ID: <92c867df-a54a-b6fb-58ad-41c7b4b899b1@archeros.com>+7E4C9EE9B8090E93
Date: Sat, 2 Apr 2022 10:08:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] vhost: Refactor vhost_reset_device() in VhostOps
To: Si-Wei Liu <si-wei.liu@oracle.com>, jasowang@redhat.com, mst@redhat.com
References: <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-2-git-send-email-qiudayu@archeros.com>
 <28d7c13f-44f3-c8d2-d8d8-1c70a723e159@oracle.com>
From: Michael Qiu <qiudayu@archeros.com>
In-Reply-To: <28d7c13f-44f3-c8d2-d8d8-1c70a723e159@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:archeros.com:qybgspam:qybgspam7
Received-SPF: none client-ip=106.55.201.188; envelope-from=qiudayu@archeros.com;
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



On 2022/4/2 8:44, Si-Wei Liu wrote:
> 
> 
> On 4/1/2022 4:06 AM, Michael Qiu wrote:
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
> This line change is not needed. VHOST_USER_PROTOCOL_F_RESET_DEVICE is 
> guaranteed to be available if getting here.
>> +                           dev->vhost_ops->vhost_reset_device) {
>>           dev->vhost_ops->vhost_reset_device(dev);
>> +    } else if (dev->vhost_ops->vhost_reset_owner) {
>> +        dev->vhost_ops->vhost_reset_owner(dev);
> Nope, drop these two lines. The caller of vhost_user_scsi_reset() 
> doesn't expect vhost_reset_owner to be called in case vhost_reset_device 
> is not implemented.
> 

  You are right, I will drop these two lines and remove 
VHOST_USER_PROTOCOL_F_RESET_DEVICE  check.


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
> I think we can safely remove this check, since the caller already 
> guarantees VHOST_USER_PROTOCOL_F_RESET_DEVICE is around as what your 
> comment mentions.
> 

I think it probely worth to check, because for vhost_net_stop() it does 
not check this flag, otherwise we should check if the backend is vhost 
user with this flag enabled.

> The previous branch condition is to reuse the vhost_reset_device op for 
> two different ends, but there's no actual user for 
> VHOST_USER_RESET_OWNER historically.
> 
> Thanks,
> -Siwei
> 
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


