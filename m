Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46ED483A7B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 03:08:45 +0100 (CET)
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ZFk-0008Ld-UH
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 21:08:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4ZDR-0006hn-SL; Mon, 03 Jan 2022 21:06:21 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4ZDP-0004Tu-2W; Mon, 03 Jan 2022 21:06:21 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JSbVL0r2tzZdrs;
 Tue,  4 Jan 2022 10:02:50 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 10:06:15 +0800
Subject: Re: [PATCH v6 4/7] hw/arm/virt-acpi-build: Make an ARM specific PPTT
 generator
To: Andrew Jones <drjones@redhat.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, "Michael S . Tsirkin" <mst@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani
 Sinha <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-5-wangyanan55@huawei.com>
 <20220103113006.yp3kmaqoh7darhnq@gator>
Message-ID: <fe505a8a-d1e0-22a2-7093-4085077fcdcf@huawei.com>
Date: Tue, 4 Jan 2022 10:06:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220103113006.yp3kmaqoh7darhnq@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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

On 2022/1/3 19:30, Andrew Jones wrote:
> On Mon, Jan 03, 2022 at 04:46:33PM +0800, Yanan Wang wrote:
>> We have a generic build_pptt() in hw/acpi/aml-build.c but it's
>> currently only used in ARM acpi initialization. Now we are going
>> to support the new CPU cluster parameter which is currently only
>> supported by ARM, it won't be a very good idea to add it to the
>> generic build_pptt() as it will make the code complex and hard
>> to maintain especially when we also support CPU cache topology
>> hierarchy in build_pptt() too. Note that the cache topology
>> design also varies between different CPU targets.
> It's a shame to remove generic ACPI table. I'm not sure what
> will be best when addressing the cache topology, but for the
> clusters it seems like we should be able to easily skip them
> when has_clusters is false.
Hm yes. Currently for clusters alone, a check of 
ms->smp_props.clusters_supported
would be enough. So I guess it's preferred that we should keep the
generic PPTT, right?
>> So an ARM specific PPTT generator becomes necessary now. Given
>> that the generic one is currently only used by ARM, let's just
>> move build_pptt() from aml-build.c to virt-acpi-build.c with
>> minor update.
> Please state what the minor update is? I see the oem parameter
> change, but I want to be sure that's the one you're referring
> to.
Yes, I changed the function parameter "ms" to "vms". That's the
whole update.

Thanks,
Yanan
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/acpi/aml-build.c         | 80 ++-----------------------------------
>>   hw/arm/virt-acpi-build.c    | 77 ++++++++++++++++++++++++++++++++++-
>>   include/hw/acpi/aml-build.h |  5 ++-
>>   3 files changed, 81 insertions(+), 81 deletions(-)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index be3851be36..040fbc9b4b 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -1968,10 +1968,9 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>    * ACPI spec, Revision 6.3
>>    * 5.2.29.1 Processor hierarchy node structure (Type 0)
>>    */
>> -static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>> -                                           uint32_t parent, uint32_t id,
>> -                                           uint32_t *priv_rsrc,
>> -                                           uint32_t priv_num)
>> +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>> +                                    uint32_t parent, uint32_t id,
>> +                                    uint32_t *priv_rsrc, uint32_t priv_num)
>>   {
>>       int i;
>>   
>> @@ -1994,79 +1993,6 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>>       }
>>   }
>>   
>> -/*
>> - * ACPI spec, Revision 6.3
>> - * 5.2.29 Processor Properties Topology Table (PPTT)
>> - */
>> -void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>> -                const char *oem_id, const char *oem_table_id)
>> -{
>> -    GQueue *list = g_queue_new();
>> -    guint pptt_start = table_data->len;
>> -    guint father_offset;
>> -    guint length, i;
>> -    int uid = 0;
>> -    int socket;
>> -    AcpiTable table = { .sig = "PPTT", .rev = 2,
>> -                        .oem_id = oem_id, .oem_table_id = oem_table_id };
>> -
>> -    acpi_table_begin(&table, table_data);
>> -
>> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
>> -        g_queue_push_tail(list,
>> -            GUINT_TO_POINTER(table_data->len - pptt_start));
>> -        build_processor_hierarchy_node(
>> -            table_data,
>> -            /*
>> -             * Physical package - represents the boundary
>> -             * of a physical package
>> -             */
>> -            (1 << 0),
>> -            0, socket, NULL, 0);
>> -    }
>> -
>> -    length = g_queue_get_length(list);
>> -    for (i = 0; i < length; i++) {
>> -        int core;
>> -
>> -        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>> -        for (core = 0; core < ms->smp.cores; core++) {
>> -            if (ms->smp.threads > 1) {
>> -                g_queue_push_tail(list,
>> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
>> -                build_processor_hierarchy_node(
>> -                    table_data,
>> -                    (0 << 0), /* not a physical package */
>> -                    father_offset, core, NULL, 0);
>> -            } else {
>> -                build_processor_hierarchy_node(
>> -                    table_data,
>> -                    (1 << 1) | /* ACPI Processor ID valid */
>> -                    (1 << 3),  /* Node is a Leaf */
>> -                    father_offset, uid++, NULL, 0);
>> -            }
>> -        }
>> -    }
>> -
>> -    length = g_queue_get_length(list);
>> -    for (i = 0; i < length; i++) {
>> -        int thread;
>> -
>> -        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>> -        for (thread = 0; thread < ms->smp.threads; thread++) {
>> -            build_processor_hierarchy_node(
>> -                table_data,
>> -                (1 << 1) | /* ACPI Processor ID valid */
>> -                (1 << 2) | /* Processor is a Thread */
>> -                (1 << 3),  /* Node is a Leaf */
>> -                father_offset, uid++, NULL, 0);
>> -        }
>> -    }
>> -
>> -    g_queue_free(list);
>> -    acpi_table_end(linker, &table);
>> -}
>> -
>>   /* build rev1/rev3/rev5.1 FADT */
>>   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>                   const char *oem_id, const char *oem_table_id)
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index d0f4867fdf..3ce7680393 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -808,6 +808,80 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       acpi_table_end(linker, &table);
>>   }
>>   
>> +/*
>> + * ACPI spec, Revision 6.3
>> + * 5.2.29 Processor Properties Topology Table (PPTT)
>> + */
>> +static void
>> +build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>> +{
>> +    MachineState *ms = MACHINE(vms);
>> +    GQueue *list = g_queue_new();
>> +    guint pptt_start = table_data->len;
>> +    guint father_offset;
>> +    guint length, i;
>> +    int uid = 0;
>> +    int socket;
>> +    AcpiTable table = { .sig = "PPTT", .rev = 2, .oem_id = vms->oem_id,
>> +                        .oem_table_id = vms->oem_table_id };
>> +
>> +    acpi_table_begin(&table, table_data);
>> +
>> +    for (socket = 0; socket < ms->smp.sockets; socket++) {
>> +        g_queue_push_tail(list,
>> +            GUINT_TO_POINTER(table_data->len - pptt_start));
>> +        build_processor_hierarchy_node(
>> +            table_data,
>> +            /*
>> +             * Physical package - represents the boundary
>> +             * of a physical package
>> +             */
>> +            (1 << 0),
>> +            0, socket, NULL, 0);
>> +    }
>> +
>> +    length = g_queue_get_length(list);
>> +    for (i = 0; i < length; i++) {
>> +        int core;
>> +
>> +        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>> +        for (core = 0; core < ms->smp.cores; core++) {
>> +            if (ms->smp.threads > 1) {
>> +                g_queue_push_tail(list,
>> +                    GUINT_TO_POINTER(table_data->len - pptt_start));
>> +                build_processor_hierarchy_node(
>> +                    table_data,
>> +                    (0 << 0), /* not a physical package */
>> +                    father_offset, core, NULL, 0);
>> +            } else {
>> +                build_processor_hierarchy_node(
>> +                    table_data,
>> +                    (1 << 1) | /* ACPI Processor ID valid */
>> +                    (1 << 3),  /* Node is a Leaf */
>> +                    father_offset, uid++, NULL, 0);
>> +            }
>> +        }
>> +    }
>> +
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
>> +    acpi_table_end(linker, &table);
>> +}
>> +
>>   /* FADT */
>>   static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
>>                               VirtMachineState *vms, unsigned dsdt_tbl_offset)
>> @@ -953,8 +1027,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>   
>>       if (!vmc->no_cpu_topology) {
>>           acpi_add_table(table_offsets, tables_blob);
>> -        build_pptt(tables_blob, tables->linker, ms,
>> -                   vms->oem_id, vms->oem_table_id);
>> +        build_pptt(tables_blob, tables->linker, vms);
>>       }
>>   
>>       acpi_add_table(table_offsets, tables_blob);
>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>> index 8346003a22..2c457c8f17 100644
>> --- a/include/hw/acpi/aml-build.h
>> +++ b/include/hw/acpi/aml-build.h
>> @@ -489,8 +489,9 @@ void build_srat_memory(GArray *table_data, uint64_t base,
>>   void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>                   const char *oem_id, const char *oem_table_id);
>>   
>> -void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>> -                const char *oem_id, const char *oem_table_id);
>> +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>> +                                    uint32_t parent, uint32_t id,
>> +                                    uint32_t *priv_rsrc, uint32_t priv_num);
>>   
>>   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>                   const char *oem_id, const char *oem_table_id);
>> -- 
>> 2.27.0
>>
> Thanks,
> drew
>
> .


