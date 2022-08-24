Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25E859F1D6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 05:06:10 +0200 (CEST)
Received: from localhost ([::1]:56904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQgiX-0007bq-Fp
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 23:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQggV-0005wE-6X
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 23:04:04 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:49503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQggL-0000EV-Ez
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 23:03:55 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R841e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VN5U1Ij_1661310222; 
Received: from 30.227.72.120(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VN5U1Ij_1661310222) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 11:03:43 +0800
Message-ID: <56def30c-c6e1-e3dd-3214-b7b9e0439941@linux.alibaba.com>
Date: Wed, 24 Aug 2022 11:03:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 14/24] vhost-user: introduce vhost_reset_vring()
 interface
To: Jason Wang <jasowang@redhat.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <d25d72a6e6a678e1acf861622232180d7c0a5dc8.1660611460.git.kangjie.xu@linux.alibaba.com>
 <cc0089af-dd5f-6d4f-0584-1a75e89c0408@redhat.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
In-Reply-To: <cc0089af-dd5f-6d4f-0584-1a75e89c0408@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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


在 2022/8/24 10:50, Jason Wang 写道:
>
> 在 2022/8/16 09:06, Kangjie Xu 写道:
>> Introduce the interface vhost_reset_vring(). The interface is a wrapper
>> to send a VHOST_USER_RESET_VRING message to the back-end. It will reset
>> an individual vring in the back-end. Meanwhile, it will wait for a reply
>> to ensure the reset has been completed.
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>   hw/virtio/vhost-user.c            | 41 +++++++++++++++++++++++++++++++
>>   include/hw/virtio/vhost-backend.h |  3 +++
>>   2 files changed, 44 insertions(+)
>>
>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>> index 75b8df21a4..56033f7a92 100644
>> --- a/hw/virtio/vhost-user.c
>> +++ b/hw/virtio/vhost-user.c
>> @@ -126,6 +126,7 @@ typedef enum VhostUserRequest {
>>       VHOST_USER_GET_MAX_MEM_SLOTS = 36,
>>       VHOST_USER_ADD_MEM_REG = 37,
>>       VHOST_USER_REM_MEM_REG = 38,
>> +    VHOST_USER_RESET_VRING = 41,
>>       VHOST_USER_MAX
>>   } VhostUserRequest;
>>   @@ -1498,6 +1499,45 @@ static int 
>> vhost_user_get_max_memslots(struct vhost_dev *dev,
>>       return 0;
>>   }
>>   +static int vhost_user_reset_vring(struct vhost_dev *dev,
>> +                                  struct vhost_vring_state *ring)
>> +{
>> +    int ret;
>> +    VhostUserMsg msg = {
>> +        .hdr.request = VHOST_USER_RESET_VRING,
>> +        .hdr.flags = VHOST_USER_VERSION,
>
>
> Do we need VHOST_USER_NEED_REPLY_MASK here?
>
> Other looks good.
>
> Thanks
>
No, it works the same as vhost_user_get_features() or 
vhost_user_get_vring_base().

Thanks

>
>> +        .payload.state = *ring,
>> +        .hdr.size = sizeof(msg.payload.state),
>> +    };
>> +
>> +    if (!virtio_has_feature(dev->acked_features, 
>> VIRTIO_F_RING_RESET)) {
>> +        return -ENOTSUP;
>> +    }
>> +
>> +    ret = vhost_user_write(dev, &msg, NULL, 0);
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
>> +
>> +    ret = vhost_user_read(dev, &msg);
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
>> +
>> +    if (msg.hdr.request != VHOST_USER_RESET_VRING) {
>> +        error_report("Received unexpected msg type. Expected %d 
>> received %d",
>> +                     VHOST_USER_RESET_VRING, msg.hdr.request);
>> +        return -EPROTO;
>> +    }
>> +
>> +    if (msg.hdr.size != sizeof(msg.payload.state)) {
>> +        error_report("Received bad msg size.");
>> +        return -EPROTO;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int vhost_user_reset_device(struct vhost_dev *dev)
>>   {
>>       VhostUserMsg msg = {
>> @@ -2625,6 +2665,7 @@ const VhostOps user_ops = {
>>           .vhost_set_features = vhost_user_set_features,
>>           .vhost_get_features = vhost_user_get_features,
>>           .vhost_set_owner = vhost_user_set_owner,
>> +        .vhost_reset_vring = vhost_user_reset_vring,
>>           .vhost_reset_device = vhost_user_reset_device,
>>           .vhost_get_vq_index = vhost_user_get_vq_index,
>>           .vhost_set_vring_enable = vhost_user_set_vring_enable,
>> diff --git a/include/hw/virtio/vhost-backend.h 
>> b/include/hw/virtio/vhost-backend.h
>> index eab46d7f0b..f23bf71a8d 100644
>> --- a/include/hw/virtio/vhost-backend.h
>> +++ b/include/hw/virtio/vhost-backend.h
>> @@ -79,6 +79,8 @@ typedef int (*vhost_get_features_op)(struct 
>> vhost_dev *dev,
>>                                        uint64_t *features);
>>   typedef int (*vhost_set_backend_cap_op)(struct vhost_dev *dev);
>>   typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
>> +typedef int (*vhost_reset_vring_op)(struct vhost_dev *dev,
>> +                                    struct vhost_vring_state *ring);
>>   typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
>>   typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx);
>>   typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
>> @@ -154,6 +156,7 @@ typedef struct VhostOps {
>>       vhost_set_backend_cap_op vhost_set_backend_cap;
>>       vhost_set_owner_op vhost_set_owner;
>>       vhost_reset_device_op vhost_reset_device;
>> +    vhost_reset_vring_op vhost_reset_vring;
>>       vhost_get_vq_index_op vhost_get_vq_index;
>>       vhost_set_vring_enable_op vhost_set_vring_enable;
>>       vhost_requires_shm_log_op vhost_requires_shm_log;

