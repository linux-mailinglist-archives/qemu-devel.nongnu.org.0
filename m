Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F688483A7C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 03:09:00 +0100 (CET)
Received: from localhost ([::1]:42400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ZFz-0000HN-PV
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 21:08:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4ZCz-0005yZ-F2; Mon, 03 Jan 2022 21:05:53 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:4153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4ZCw-0003zn-IY; Mon, 03 Jan 2022 21:05:53 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JSbXX0PKGz9rx2;
 Tue,  4 Jan 2022 10:04:44 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 10:05:44 +0800
Subject: Re: [PATCH v6 3/7] hw/acpi/aml-build: Improve scalability of PPTT
 generation
To: Andrew Jones <drjones@redhat.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, "Michael S . Tsirkin" <mst@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani
 Sinha <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-4-wangyanan55@huawei.com>
 <20220103112407.p7aep3yqnlhevylc@gator>
Message-ID: <50b8d6d9-8ed1-5a25-cad3-7c3d6e8fafed@huawei.com>
Date: Tue, 4 Jan 2022 10:05:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220103112407.p7aep3yqnlhevylc@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
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

Hi Drew,
Thanks for your review.
On 2022/1/3 19:24, Andrew Jones wrote:
> On Mon, Jan 03, 2022 at 04:46:32PM +0800, Yanan Wang wrote:
>> Currently we generate a PPTT table of n-level processor hierarchy
>> with n-level loops in build_pptt(). It works fine as now there are
>> only three CPU topology parameters. But the code may become less
>> scalable with the processor hierarchy levels increasing.
>>
>> This patch only improves the scalability of build_pptt by reducing
>> the loops, and intends to make no functional change.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/acpi/aml-build.c | 50 +++++++++++++++++++++++++++++----------------
>>   1 file changed, 32 insertions(+), 18 deletions(-)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index b3b3310df3..be3851be36 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -2001,7 +2001,10 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>>   void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>                   const char *oem_id, const char *oem_table_id)
>>   {
>> -    int pptt_start = table_data->len;
>> +    GQueue *list = g_queue_new();
>> +    guint pptt_start = table_data->len;
>> +    guint father_offset;
> "parent_offset" would be more conventional.
Apparently... I will rename it.
>> +    guint length, i;
>>       int uid = 0;
>>       int socket;
>>       AcpiTable table = { .sig = "PPTT", .rev = 2,
>> @@ -2010,9 +2013,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>       acpi_table_begin(&table, table_data);
>>   
>>       for (socket = 0; socket < ms->smp.sockets; socket++) {
>> -        uint32_t socket_offset = table_data->len - pptt_start;
>> -        int core;
>> -
>> +        g_queue_push_tail(list,
>> +            GUINT_TO_POINTER(table_data->len - pptt_start));
>>           build_processor_hierarchy_node(
>>               table_data,
>>               /*
>> @@ -2021,35 +2023,47 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>                */
>>               (1 << 0),
>>               0, socket, NULL, 0);
>> +    }
>>   
>> -        for (core = 0; core < ms->smp.cores; core++) {
>> -            uint32_t core_offset = table_data->len - pptt_start;
>> -            int thread;
>> +    length = g_queue_get_length(list);
>> +    for (i = 0; i < length; i++) {
>> +        int core;
>>   
>> +        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>> +        for (core = 0; core < ms->smp.cores; core++) {
>>               if (ms->smp.threads > 1) {
>> +                g_queue_push_tail(list,
>> +                    GUINT_TO_POINTER(table_data->len - pptt_start));
>>                   build_processor_hierarchy_node(
>>                       table_data,
>>                       (0 << 0), /* not a physical package */
>> -                    socket_offset, core, NULL, 0);
>> -
>> -                for (thread = 0; thread < ms->smp.threads; thread++) {
>> -                    build_processor_hierarchy_node(
>> -                        table_data,
>> -                        (1 << 1) | /* ACPI Processor ID valid */
>> -                        (1 << 2) | /* Processor is a Thread */
>> -                        (1 << 3),  /* Node is a Leaf */
>> -                        core_offset, uid++, NULL, 0);
>> -                }
>> +                    father_offset, core, NULL, 0);
>>               } else {
>>                   build_processor_hierarchy_node(
>>                       table_data,
>>                       (1 << 1) | /* ACPI Processor ID valid */
>>                       (1 << 3),  /* Node is a Leaf */
>> -                    socket_offset, uid++, NULL, 0);
>> +                    father_offset, uid++, NULL, 0);
>>               }
>>           }
>>       }
>>   
>> +    length = g_queue_get_length(list);
>> +    for (i = 0; i < length; i++) {
>> +        int thread;
>> +
>> +        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>> +        for (thread = 0; thread < ms->smp.threads; thread++) {
>> +            build_processor_hierarchy_node(
>> +                table_data,
>> +                (1 << 1) | /* ACPI Processor ID valid */
>> +                (1 << 2) | /* Processor is a Thread */
>> +                (1 << 3),  /* Node is a Leaf */
>> +                father_offset, uid++, NULL, 0);
>> +        }
>> +    }
>> +
>> +    g_queue_free(list);
>>       acpi_table_end(linker, &table);
>>   }
> This patch actually increases the number of loops, since we need to visit
> higher hierarchical nodes twice (once to enqueue and once to dequeue).
Yes, we actually need to access the higher hierarchical node's offset twice.
But that may not be a problem since numbers of topology parameters are
not so huge that we need to consider the performance.
> We
> do reduce code indentation and it looks like we could more easily skip
> hierarchy levels we don't want, though.
Yes, just as you said. The commit message doesn't describe the motivation
well. This patch aims to reduce the increasing code indentation because of
increasing nested loops, and consequently it's a bit easier to extend with
new topology level.
> While my impulse is to say we
> should just keep this simple and add another nested loop for clusters, I
> guess I'm OK with this too.
Thank you!
> Reviewed-by: Andrew Jones <drjones@redhat.com>
>
Thanks,
Yanan


