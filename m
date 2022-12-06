Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F39643F0D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 09:51:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Te0-0005kI-RG; Tue, 06 Dec 2022 03:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p2Tdx-0005jl-WC
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 03:49:38 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p2Tdv-00020u-Ch
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 03:49:37 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NRDbV5m1Kz15N4w;
 Tue,  6 Dec 2022 16:48:38 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Dec 2022 16:49:25 +0800
Message-ID: <c46d9d1e-82b2-be13-ae19-370c5fda7811@huawei.com>
Date: Tue, 6 Dec 2022 16:49:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] vdpa: commit all host notifier MRs in a single MR
 transaction
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>
References: <20221206081841.2458-1-longpeng2@huawei.com>
 <20221206081841.2458-3-longpeng2@huawei.com>
 <fd68f23b-218e-0d76-972b-a89c612b7e44@linaro.org>
In-Reply-To: <fd68f23b-218e-0d76-972b-a89c612b7e44@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.265,
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



在 2022/12/6 16:30, Philippe Mathieu-Daudé 写道:
> On 6/12/22 09:18, Longpeng(Mike) via wrote:
>> From: Longpeng <longpeng2@huawei.com>
>>
>> This allows the vhost-vdpa device to batch the setup of all its MRs of
>> host notifiers.
>>
>> This significantly reduces the device starting time, e.g. the time spend
>> on setup the host notifier MRs reduce from 423ms to 32ms for a VM with
>> 64 vCPUs and 3 vhost-vDPA generic devices[1] (64vq per device).
>>
>> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg921541.html
>>
>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>> ---
>>   hw/virtio/vhost-vdpa.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
> 
> 
>> @@ -562,16 +571,25 @@ static void 
>> vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
>>           return;
>>       }
>> +    /*
>> +     * Pack all the changes to the memory regions in a single
>> +     * transaction to avoid a few updating of the address space
>> +     * topology.
>> +     */
>> +    memory_region_transaction_begin();
>> +
>>       for (i = dev->vq_index; i < dev->vq_index + dev->nvqs; i++) {
>>           if (vhost_vdpa_host_notifier_init(dev, i)) {
>>               goto err;
> 
> Could we simplify by replacing this goto statement with:
> 
>                 vhost_vdpa_host_notifiers_uninit(dev, i - dev->vq_index);
>                 break;
> 
> ?
> 
Good suggestion! I'll do in v3, thanks.

>>           }
>>       }
>> +    memory_region_transaction_commit();
>>       return;
>>   err:
>>       vhost_vdpa_host_notifiers_uninit(dev, i - dev->vq_index);
>> +    memory_region_transaction_commit();
>>       return;
>>   }
> 
> .

