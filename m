Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB039A175
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 14:50:17 +0200 (CEST)
Received: from localhost ([::1]:34376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lomng-0000V5-5a
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 08:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lommL-0007ay-2k; Thu, 03 Jun 2021 08:48:54 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lommH-00083M-VD; Thu, 03 Jun 2021 08:48:52 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FwlvN0w9fz1BH2C;
 Thu,  3 Jun 2021 20:44:00 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 20:48:44 +0800
Received: from [10.174.185.226] (10.174.185.226) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 20:48:43 +0800
Subject: Re: [PATCH v4 5/8] hw/pci: Add pci_bus_range to get bus number range
To: <eric.auger@redhat.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
 <1621914605-14724-6-git-send-email-wangxingang5@huawei.com>
 <edcf80ec-7f91-b986-047c-a87c8cc7d669@redhat.com>
From: Xingang Wang <wangxingang5@huawei.com>
Message-ID: <b9bc0bcb-335b-6fc1-8de9-568dfdd4b3fa@huawei.com>
Date: Thu, 3 Jun 2021 20:48:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <edcf80ec-7f91-b986-047c-a87c8cc7d669@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangxingang5@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.603,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: xieyingtai@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 2021/6/2 21:03, Eric Auger wrote:
> Hi Xingang,
> 
> On 5/25/21 5:50 AM, Wang Xingang wrote:
>> From: Xingang Wang <wangxingang5@huawei.com>
>>
>> This helps to get the bus number range of a pci bridge hierarchy.
>>
>> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
>> ---
>>   hw/pci/pci.c         | 15 +++++++++++++++
>>   include/hw/pci/pci.h |  1 +
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index 27d588e268..7f18ea5ef5 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -537,6 +537,21 @@ int pci_bus_num(PCIBus *s)
>>       return PCI_BUS_GET_CLASS(s)->bus_num(s);
>>   }
>>   
> Add a doc comment such as "returns the min and max bus numbers of a root
> bus"?
> 
> Besides
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> Thanks
> 
> Eric
>   

Thanks, I will add some annotation here.

Xingang

>> +void pci_bus_range(PCIBus *bus, int *min_bus, int *max_bus)
>> +{
>> +    int i;
>> +    *min_bus = *max_bus = pci_bus_num(bus);
>> +
>> +    for (i = 0; i < ARRAY_SIZE(bus->devices); ++i) {
>> +        PCIDevice *dev = bus->devices[i];
>> +
>> +        if (dev && PCI_DEVICE_GET_CLASS(dev)->is_bridge) {
>> +            *min_bus = MIN(*min_bus, dev->config[PCI_SECONDARY_BUS]);
>> +            *max_bus = MAX(*max_bus, dev->config[PCI_SUBORDINATE_BUS]);
>> +        }
>> +    }
>> +}
>> +
>>   int pci_bus_numa_node(PCIBus *bus)
>>   {
>>       return PCI_BUS_GET_CLASS(bus)->numa_node(bus);
>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>> index f4d51b672b..d0f4266e37 100644
>> --- a/include/hw/pci/pci.h
>> +++ b/include/hw/pci/pci.h
>> @@ -450,6 +450,7 @@ static inline PCIBus *pci_get_bus(const PCIDevice *dev)
>>       return PCI_BUS(qdev_get_parent_bus(DEVICE(dev)));
>>   }
>>   int pci_bus_num(PCIBus *s);
>> +void pci_bus_range(PCIBus *bus, int *min_bus, int *max_bus);
>>   static inline int pci_dev_bus_num(const PCIDevice *dev)
>>   {
>>       return pci_bus_num(pci_get_bus(dev));
> 
> .
> 
.

