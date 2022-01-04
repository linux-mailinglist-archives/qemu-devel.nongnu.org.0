Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9131F483A83
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 03:17:39 +0100 (CET)
Received: from localhost ([::1]:47586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ZOM-0004AU-2s
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 21:17:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4ZM0-00023r-Gm; Mon, 03 Jan 2022 21:15:12 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4ZLy-00086L-Cj; Mon, 03 Jan 2022 21:15:11 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JSblq0PFVzbjmB;
 Tue,  4 Jan 2022 10:14:31 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 10:15:03 +0800
Subject: Re: [PATCH v6 6/7] hw/arm/virt-acpi-build: Support cluster level in
 PPTT generation
To: Andrew Jones <drjones@redhat.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, "Michael S . Tsirkin" <mst@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani
 Sinha <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-7-wangyanan55@huawei.com>
 <20220103113238.g3vk7nxmgefxe2gn@gator>
Message-ID: <845ec56e-7a06-3774-2dab-c50040b59f4e@huawei.com>
Date: Tue, 4 Jan 2022 10:15:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220103113238.g3vk7nxmgefxe2gn@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) NICE_REPLY_A=-3.354, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>


On 2022/1/3 19:32, Andrew Jones wrote:
> On Mon, Jan 03, 2022 at 04:46:35PM +0800, Yanan Wang wrote:
>> Support cluster level in generation of ACPI Processor Properties
>> Topology Table (PPTT) for ARM virt machines.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 3ce7680393..5f91969688 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -840,6 +840,21 @@ build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>               0, socket, NULL, 0);
>>       }
>>   
>> +    length = g_queue_get_length(list);
>> +    for (i = 0; i < length; i++) {
>> +        int cluster;
>> +
>> +        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>> +        for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
>> +            g_queue_push_tail(list,
>> +                GUINT_TO_POINTER(table_data->len - pptt_start));
>> +            build_processor_hierarchy_node(
>> +                table_data,
>> +                (0 << 0), /* not a physical package */
>> +                father_offset, cluster, NULL, 0);
>> +        }
>> +    }
>> +
>>       length = g_queue_get_length(list);
>>       for (i = 0; i < length; i++) {
>>           int core;
>> -- 
>> 2.27.0
>>
> Looks good except please do s/father_offset/parent_offset/ as I mentioned
> in an earlier patch.
Will do.
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
>
Thanks,
Yanan


