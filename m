Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D1A658982
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 06:20:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAlJV-0006cP-IJ; Thu, 29 Dec 2022 00:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pAlJQ-0006cC-4p
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 00:18:40 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pAlJ8-0004QS-QO
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 00:18:25 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NjGpN6QCSzmWw1;
 Thu, 29 Dec 2022 13:16:44 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 29 Dec 2022 13:18:02 +0800
Message-ID: <976a7dd9-238d-9c71-27fb-0374b221c4bb@huawei.com>
Date: Thu, 29 Dec 2022 13:18:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/3] vhost: configure all host notifiers in a single MR
 transaction
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, "Michael S.
 Tsirkin" <mst@redhat.com>
CC: <stefanha@redhat.com>, <jasowang@redhat.com>, <cohuck@redhat.com>,
 <sgarzare@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>
References: <20221227072015.3134-1-longpeng2@huawei.com>
 <20221227072015.3134-3-longpeng2@huawei.com>
 <8054d186-0196-ccb0-091d-0ee9caadb576@linaro.org>
 <20221227125331-mutt-send-email-mst@kernel.org>
 <114ff13b-86fd-7ca4-df93-0c05f54866b8@linaro.org>
In-Reply-To: <114ff13b-86fd-7ca4-df93-0c05f54866b8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.147,
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
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2022/12/28 21:12, Philippe Mathieu-Daudé 写道:
> On 27/12/22 18:54, Michael S. Tsirkin wrote:
>> On Tue, Dec 27, 2022 at 05:43:57PM +0100, Philippe Mathieu-Daudé wrote:
>>> On 27/12/22 08:20, Longpeng(Mike) wrote:
>>>> From: Longpeng <longpeng2@huawei.com>
>>>>
>>>> This allows the vhost device to batch the setup of all its host 
>>>> notifiers.
>>>> This significantly reduces the device starting time, e.g. the time 
>>>> spend
>>>> on enabling notifiers reduce from 376ms to 9.1ms for a VM with 64 vCPUs
>>>> and 3 vhost-vDPA generic devices (vdpa_sim_blk, 64vq per device)
>>>>
>>>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>>>> ---
>>>>    hw/virtio/vhost.c | 24 ++++++++++++++++++++++++
>>>>    1 file changed, 24 insertions(+)
>>>>
>>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>>> index 5994559da8..064d4abe5c 100644
>>>> --- a/hw/virtio/vhost.c
>>>> +++ b/hw/virtio/vhost.c
>>>> @@ -1562,16 +1562,25 @@ int vhost_dev_enable_notifiers(struct 
>>>> vhost_dev *hdev, VirtIODevice *vdev)
>>>>            return r;
>>>>        }
>>>> +    /*
>>>> +     * Batch all the host notifiers in a single transaction to avoid
>>>> +     * quadratic time complexity in address_space_update_ioeventfds().
>>>> +     */
>>>> +    memory_region_transaction_begin();
>>>> +
>>>>        for (i = 0; i < hdev->nvqs; ++i) {
>>>>            r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), 
>>>> hdev->vq_index + i,
>>>>                                             true);
>>>>            if (r < 0) {
>>>>                error_report("vhost VQ %d notifier binding failed: 
>>>> %d", i, -r);
>>>> +            memory_region_transaction_commit();
>>>>                vhost_dev_disable_notifiers(hdev, vdev);
>>>
>>> Could we 'break' here, ...
>>>
>>>>                return r;
>>>>            }
>>>>        }
>>>> +    memory_region_transaction_commit();
>>>> +
>>>>        return 0;
>>>
>>> ... and return 'r' here?
>>
>>
>> won't this commit twice? seems ugly ...
> 
> Twice? I meant keep the begin/commit() around the for() to have
> only *one* commit() call instead of 2:
> 

There's a transaction in vhost_dev_disable_notifiers() too, We must 
commit the outter transaction before invoking it, you can see the 
comment in it.

> -- >8 --
> +    memory_region_transaction_begin();
> +
>       for (i = 0; i < hdev->nvqs; ++i) {
>           r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), 
> hdev->vq_index + i,
>                                            true);
>           if (r < 0) {
>               error_report("vhost VQ %d notifier binding failed: %d", i, 
> -r);
>               vhost_dev_disable_notifiers(hdev, vdev);
> -            return r;
> +            break;
>           }
>       }
> 
> +    memory_region_transaction_commit();
> +
> -    return 0;
> +    return r;
>   }
> ---
> 
> Anyhow,
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> .

