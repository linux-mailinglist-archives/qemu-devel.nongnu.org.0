Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B5859D32C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 10:17:06 +0200 (CEST)
Received: from localhost ([::1]:56450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQP5t-00070Z-BD
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 04:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQOtK-00084l-Iy
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 04:04:07 -0400
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:36244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQOtA-0001OL-V4
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 04:03:59 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R771e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VN112Ny_1661241828; 
Received: from 30.227.72.120(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VN112Ny_1661241828) by smtp.aliyun-inc.com;
 Tue, 23 Aug 2022 16:03:48 +0800
Message-ID: <82e5afa4-f949-3291-90f4-3ee4ac440721@linux.alibaba.com>
Date: Tue, 23 Aug 2022 16:03:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 09/24] vhost: introduce vhost_dev_virtqueue_stop()
To: Jason Wang <jasowang@redhat.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <d10274ce04b729e92402a040af7c4d9d23a4824d.1660611460.git.kangjie.xu@linux.alibaba.com>
 <3995c3ff-2806-b1aa-12e0-f4026253219d@redhat.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 hengqi@linux.alibaba.com, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
In-Reply-To: <3995c3ff-2806-b1aa-12e0-f4026253219d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.54;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-54.freemail.mail.aliyun.com
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


在 2022/8/23 15:52, Jason Wang 写道:
>
> 在 2022/8/16 09:06, Kangjie Xu 写道:
>> Introduce vhost_dev_virtqueue_stop(), which can ummap the
>> vrings and the desc of it.
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>   hw/virtio/vhost.c         | 9 +++++++++
>>   include/hw/virtio/vhost.h | 3 +++
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index e467dfc7bc..1bca9ff48d 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -1904,3 +1904,12 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>>         return -ENOSYS;
>>   }
>> +
>> +void vhost_dev_virtqueue_stop(struct vhost_dev *hdev, VirtIODevice 
>> *vdev,
>> +                              int idx)
>> +{
>> +    vhost_virtqueue_unmap(hdev,
>> +                          vdev,
>> +                          hdev->vqs + idx,
>> +                          idx);
>
>
> So I think the unmap is not sufficient, we need backend specific 
> support. E.g for vhost kernel, need a SET_BACKEND here?
>
> Thanks
>
But SET_BACKEND of vhost-net needs a parameter fd in vhost_vring_file: 
that is net->backend of VHostNetState.

If we add the fd parameter or struct vhost_vring_file to 
vhost_dev_virtqueue_stop/restart, it exposes some implementation details 
in the parameter list.

And that seems not good? So I put SET_BACKEND in the vhost-net module. 
The workflow is similar to vhost_net_start_one().

Thanks

>
>> +}
>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>> index a346f23d13..574888440c 100644
>> --- a/include/hw/virtio/vhost.h
>> +++ b/include/hw/virtio/vhost.h
>> @@ -288,4 +288,7 @@ int vhost_dev_set_inflight(struct vhost_dev *dev,
>>                              struct vhost_inflight *inflight);
>>   int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
>>                              struct vhost_inflight *inflight);
>> +
>> +void vhost_dev_virtqueue_stop(struct vhost_dev *hdev, VirtIODevice 
>> *vdev,
>> +                              int idx);
>>   #endif

