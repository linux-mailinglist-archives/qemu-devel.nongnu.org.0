Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD46325B9B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 03:25:26 +0100 (CET)
Received: from localhost ([::1]:59886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFSon-0005b9-8N
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 21:25:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFSmt-00051c-0e; Thu, 25 Feb 2021 21:23:27 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFSmp-0000ip-Uc; Thu, 25 Feb 2021 21:23:26 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dmtgz23R4z16Cpw;
 Fri, 26 Feb 2021 10:21:35 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Feb 2021 10:23:04 +0800
Subject: Re: [RFC PATCH 4/5] hw/acpi/aml-build: add processor hierarchy node
 structure
To: Andrew Jones <drjones@redhat.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210225085627.2263-5-fangying1@huawei.com>
 <20210225114732.5f7gqgl7lym7d4hs@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <5afc6d2b-6e16-d44c-13cf-bd75c63f89db@huawei.com>
Date: Fri, 26 Feb 2021 10:23:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210225114732.5f7gqgl7lym7d4hs@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.435,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, Henglong Fan <fanhenglong@huawei.com>,
 alistair.francis@wdc.com, qemu-arm@nongnu.org, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/25/2021 7:47 PM, Andrew Jones wrote:
> On Thu, Feb 25, 2021 at 04:56:26PM +0800, Ying Fang wrote:
>> Add the processor hierarchy node structures to build ACPI information
>> for CPU topology. Since the private resources may be used to describe
>> cache hierarchy and it is variable among different topology level,
>> three helpers are introduced to describe the hierarchy.
>>
>> (1) build_socket_hierarchy for socket description
>> (2) build_processor_hierarchy for processor description
>> (3) build_smt_hierarchy for thread (logic processor) description
>>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> Signed-off-by: Henglong Fan <fanhenglong@huawei.com>
>> ---
>>   hw/acpi/aml-build.c         | 40 +++++++++++++++++++++++++++++++++++++
>>   include/hw/acpi/acpi-defs.h | 13 ++++++++++++
>>   include/hw/acpi/aml-build.h |  7 +++++++
>>   3 files changed, 60 insertions(+)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index a2cd7a5830..a0af3e9d73 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -1888,6 +1888,46 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>                    table_data->len - slit_start, 1, oem_id, oem_table_id);
>>   }
>>   
>> +/*
>> + * ACPI 6.3: 5.2.29.1 Processor hierarchy node structure (Type 0)
>> + */
>> +void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
>> +{
>> +    build_append_byte(tbl, ACPI_PPTT_TYPE_PROCESSOR); /* Type 0 - processor */
>> +    build_append_byte(tbl, 20);         /* Length, no private resources */
>> +    build_append_int_noprefix(tbl, 0, 2);  /* Reserved */
>> +    build_append_int_noprefix(tbl, ACPI_PPTT_PHYSICAL_PACKAGE, 4);
> 
> Missing '/* Flags */'

Will fix.

> 
>> +    build_append_int_noprefix(tbl, parent, 4); /* Parent */
>> +    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
>> +    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
>> +}
>> +
>> +void build_processor_hierarchy(GArray *tbl, uint32_t flags,
>> +                               uint32_t parent, uint32_t id)
>> +{
>> +    build_append_byte(tbl, ACPI_PPTT_TYPE_PROCESSOR);  /* Type 0 - processor */
>> +    build_append_byte(tbl, 20);         /* Length, no private resources */
>> +    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
>> +    build_append_int_noprefix(tbl, flags, 4);  /* Flags */
>> +    build_append_int_noprefix(tbl, parent, 4); /* Parent */
>> +    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
>> +    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
>> +}
>> +
>> +void build_thread_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
>> +{
>> +    build_append_byte(tbl, ACPI_PPTT_TYPE_PROCESSOR); /* Type 0 - processor */
>> +    build_append_byte(tbl, 20);           /* Length, no private resources */
>> +    build_append_int_noprefix(tbl, 0, 2); /* Reserved */
>> +    build_append_int_noprefix(tbl,
>> +                              ACPI_PPTT_ACPI_PROCESSOR_ID_VALID |
>> +                              ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD |
>> +                              ACPI_PPTT_ACPI_LEAF_NODE, 4);  /* Flags */
>> +    build_append_int_noprefix(tbl, parent , 4); /* parent */
> 
> 'parent' not capitalized. We want these comments to exactly match the text
> in the spec.

Will fix.

> 
>> +    build_append_int_noprefix(tbl, id, 4);      /* ACPI processor ID */
>> +    build_append_int_noprefix(tbl, 0, 4);       /* Num of private resources */
>> +}
>> +
>>   /* build rev1/rev3/rev5.1 FADT */
>>   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>                   const char *oem_id, const char *oem_table_id)
>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>> index cf9f44299c..45e10d886f 100644
>> --- a/include/hw/acpi/acpi-defs.h
>> +++ b/include/hw/acpi/acpi-defs.h
>> @@ -618,4 +618,17 @@ struct AcpiIortRC {
>>   } QEMU_PACKED;
>>   typedef struct AcpiIortRC AcpiIortRC;
>>   
>> +enum {
>> +    ACPI_PPTT_TYPE_PROCESSOR = 0,
>> +    ACPI_PPTT_TYPE_CACHE,
>> +    ACPI_PPTT_TYPE_ID,
>> +    ACPI_PPTT_TYPE_RESERVED
>> +};
>> +
>> +#define ACPI_PPTT_PHYSICAL_PACKAGE          (1)
>> +#define ACPI_PPTT_ACPI_PROCESSOR_ID_VALID   (1 << 1)
>> +#define ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD  (1 << 2)      /* ACPI 6.3 */
>> +#define ACPI_PPTT_ACPI_LEAF_NODE            (1 << 3)      /* ACPI 6.3 */
>> +#define ACPI_PPTT_ACPI_IDENTICAL            (1 << 4)      /* ACPI 6.3 */
>> +
>>   #endif
>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>> index 380d3e3924..7f0ca1a198 100644
>> --- a/include/hw/acpi/aml-build.h
>> +++ b/include/hw/acpi/aml-build.h
>> @@ -462,6 +462,13 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>>   void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>                   const char *oem_id, const char *oem_table_id);
>>   
>> +void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
>> +
>> +void build_processor_hierarchy(GArray *tbl, uint32_t flags,
>> +                               uint32_t parent, uint32_t id);
>> +
>> +void build_thread_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
> 
> Why does build_processor_hierarchy() take a flags argument, but the
> others don't? Why not just have a single 'flags' taking function,
> like [*] that works for all of them? I think that answer to that is

Yes, you are right.

> that when cache topology support is added it's better to break these
> into separate functions, but should we do that now? It seems odd to
> be introducing unused defines and this API before it's necessary.
So it is better for us to keep just one common build_processor_hierarchy
API here in your opinion.

> 
> [*] https://github.com/rhdrjones/qemu/commit/439b38d67ca1f2cbfa5b9892a822b651ebd05c11
> 
> Thanks,
> drew
> 
>> +
>>   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>                   const char *oem_id, const char *oem_table_id);
>>   
>> -- 
>> 2.23.0
>>
>>
> 
> .
> 

Thanks,
Ying.

