Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E696C59D28F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 09:48:35 +0200 (CEST)
Received: from localhost ([::1]:46450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQOeJ-0008EH-0M
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 03:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQOYS-0002Fx-KH
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:42:33 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:40194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQOYJ-0006bp-JU
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:42:26 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VN0jVNd_1661240533; 
Received: from 30.227.72.120(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VN0jVNd_1661240533) by smtp.aliyun-inc.com;
 Tue, 23 Aug 2022 15:42:13 +0800
Message-ID: <9409cbb4-7be9-1fd5-618c-01fba913c4b8@linux.alibaba.com>
Date: Tue, 23 Aug 2022 15:42:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 05/24] virtio: core: vq reset feature negotation support
To: Jason Wang <jasowang@redhat.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <932993943b00e0a0567a7a78c7f92c97bb105d58.1660611460.git.kangjie.xu@linux.alibaba.com>
 <87cf42ed-4645-fec6-1990-317d85f09338@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
In-Reply-To: <87cf42ed-4645-fec6-1990-317d85f09338@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.56;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-56.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001,
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


在 2022/8/23 15:34, Jason Wang 写道:
>
> 在 2022/8/16 09:06, Kangjie Xu 写道:
>> A a new command line parameter "queue_reset" is added.
>>
>> Meanwhile, the vq reset feature is disabled for pre-7.1 machines.
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>   hw/core/machine.c          | 1 +
>>   include/hw/virtio/virtio.h | 4 +++-
>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index a673302cce..8b22b4647f 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -43,6 +43,7 @@
>>   GlobalProperty hw_compat_7_0[] = {
>>       { "arm-gicv3-common", "force-8-bit-prio", "on" },
>>       { "nvme-ns", "eui64-default", "on"},
>> +    { "virtio-device", "queue_reset", "false" },
>
>
> 7.1 is about to release so we need to do it for pre-7.2.
>
> Thanks
>
The current version is 7.0.92, should I wait until 7.1 to be released 
and submit my patch after that? or just add hw_compat_7_1[] and related 
support.

Thanks

>
>>   };
>>   const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
>>   diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>> index 085997d8f3..ed3ecbef80 100644
>> --- a/include/hw/virtio/virtio.h
>> +++ b/include/hw/virtio/virtio.h
>> @@ -295,7 +295,9 @@ typedef struct VirtIORNGConf VirtIORNGConf;
>>       DEFINE_PROP_BIT64("iommu_platform", _state, _field, \
>>                         VIRTIO_F_IOMMU_PLATFORM, false), \
>>       DEFINE_PROP_BIT64("packed", _state, _field, \
>> -                      VIRTIO_F_RING_PACKED, false)
>> +                      VIRTIO_F_RING_PACKED, false), \
>> +    DEFINE_PROP_BIT64("queue_reset", _state, _field, \
>> +                      VIRTIO_F_RING_RESET, true)
>>     hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n);
>>   bool virtio_queue_enabled_legacy(VirtIODevice *vdev, int n);

