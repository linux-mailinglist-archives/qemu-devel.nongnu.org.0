Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A993C580B6D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 08:21:22 +0200 (CEST)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGDwX-00071J-RS
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 02:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGDsN-0004Dm-GU
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 02:17:03 -0400
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:43936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGDsH-0004a7-8H
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 02:17:02 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VKTvEUH_1658816211; 
Received: from 30.227.68.147(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VKTvEUH_1658816211) by smtp.aliyun-inc.com;
 Tue, 26 Jul 2022 14:16:52 +0800
Message-ID: <ed277399-3fe0-e3f7-b93b-05c47d13803b@linux.alibaba.com>
Date: Tue, 26 Jul 2022 14:16:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 01/16] virtio-pci: virtio_pci_common_cfg add
 queue_notify_data
To: Jason Wang <jasowang@redhat.com>
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <17224da449cac081550fd44001798a6e95da3a96.1658141552.git.kangjie.xu@linux.alibaba.com>
 <07c61248-1774-69a9-ed1d-e6a089c2a89c@redhat.com>
Cc: mst@redhat.com, hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com,
 qemu-devel@nongnu.org
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
In-Reply-To: <07c61248-1774-69a9-ed1d-e6a089c2a89c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.45;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-45.freemail.mail.aliyun.com
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


在 2022/7/26 11:17, Jason Wang 写道:
>
> 在 2022/7/18 19:16, Kangjie Xu 写道:
>> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>
>> Add queue_notify_data in struct virtio_pci_common_cfg, which comes from
>> here https://github.com/oasis-tcs/virtio-spec/issues/89
>>
>> Since I want to add queue_reset after queue_notify_data, I submitted
>> this patch first.
>>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>
>
> This should be done by script/update-linux-headers.sh.
>
> Thanks
>
Will fix.

Thanks

>
>> ---
>>   include/standard-headers/linux/virtio_pci.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/include/standard-headers/linux/virtio_pci.h 
>> b/include/standard-headers/linux/virtio_pci.h
>> index db7a8e2fcb..598ebe9825 100644
>> --- a/include/standard-headers/linux/virtio_pci.h
>> +++ b/include/standard-headers/linux/virtio_pci.h
>> @@ -164,6 +164,7 @@ struct virtio_pci_common_cfg {
>>       uint32_t queue_avail_hi;        /* read-write */
>>       uint32_t queue_used_lo;        /* read-write */
>>       uint32_t queue_used_hi;        /* read-write */
>> +    uint16_t queue_notify_data;    /* read-write */
>>   };
>>     /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
>> @@ -202,6 +203,7 @@ struct virtio_pci_cfg_cap {
>>   #define VIRTIO_PCI_COMMON_Q_AVAILHI    44
>>   #define VIRTIO_PCI_COMMON_Q_USEDLO    48
>>   #define VIRTIO_PCI_COMMON_Q_USEDHI    52
>> +#define VIRTIO_PCI_COMMON_Q_NOTIFY_DATA    56
>>     #endif /* VIRTIO_PCI_NO_MODERN */

