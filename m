Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B08950B6DD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:08:37 +0200 (CEST)
Received: from localhost ([::1]:58140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhs5U-00041j-HM
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nhrQO-0003wo-K2
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nhrQL-00016o-I5
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650626765;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CaoYLyrhrrsj5w/bDs7iy/OZM5xUAkUYxGvb21eVQxk=;
 b=HzprhbyToXj5HRrBWWohLNoc9+lssUua4YMVl0fV0bwwHQ4+oAVxUhoy9j3/DzlY/I2FxM
 3SrfwqJp8HzUwpsALkoOjwjqPdHnx0dSbFu+Fp1f4Tpq//GItNigbEA2DJLw8elp70ZOlp
 HC1rGCaUYTl2jeZQsE6nM202EzCn2t8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-6awA8c4kMyWazddF-8X3tQ-1; Fri, 22 Apr 2022 07:26:01 -0400
X-MC-Unique: 6awA8c4kMyWazddF-8X3tQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 666ED101AA42;
 Fri, 22 Apr 2022 11:26:00 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DE1954ACB4;
 Fri, 22 Apr 2022 11:25:51 +0000 (UTC)
Subject: Re: [PATCH v7 4/4] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-arm@nongnu.org
References: <20220420104909.233058-1-gshan@redhat.com>
 <20220420104909.233058-5-gshan@redhat.com>
 <c737c168-108c-ba35-953e-44c14b8f8ae7@huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <95aec73e-74ae-5511-3fe2-39cfc73e5253@redhat.com>
Date: Fri, 22 Apr 2022 19:25:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <c737c168-108c-ba35-953e-44c14b8f8ae7@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: lvivier@redhat.com, eduardo@habkost.net, thuth@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, armbru@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, zhenyzha@redhat.com, drjones@redhat.com,
 pbonzini@redhat.com, shan.gavin@gmail.com, Jonathan.Cameron@Huawei.com,
 ani@anisinha.ca, imammedo@redhat.com, eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yanan,

On 4/21/22 7:50 PM, wangyanan (Y) wrote:
> On 2022/4/20 18:49, Gavin Shan wrote:
>> When the PPTT table is built, the CPU topology is re-calculated, but
>> it's unecessary because the CPU topology has been populated in
>> virt_possible_cpu_arch_ids() on arm/virt machine.
>>
>> This reworks build_pptt() to avoid by reusing the existing IDs in
>> ms->possible_cpus. Currently, the only user of build_pptt() is
>> arm/virt machine.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/acpi/aml-build.c | 109 +++++++++++++++++++-------------------------
>>   1 file changed, 47 insertions(+), 62 deletions(-)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index 4086879ebf..73f4e69c29 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -2002,86 +2002,71 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>                   const char *oem_id, const char *oem_table_id)
>>   {
>>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>> -    GQueue *list = g_queue_new();
>> -    guint pptt_start = table_data->len;
>> -    guint parent_offset;
>> -    guint length, i;
>> -    int uid = 0;
>> -    int socket;
>> +    CPUArchIdList *cpus = ms->possible_cpus;
>> +    int64_t socket_id = -1, cluster_id = -1, core_id = -1;
>> +    uint32_t socket_offset = 0, cluster_offset = 0, core_offset = 0;
>> +    uint32_t pptt_start = table_data->len;
>> +    int n;
>>       AcpiTable table = { .sig = "PPTT", .rev = 2,
>>                           .oem_id = oem_id, .oem_table_id = oem_table_id };
>>       acpi_table_begin(&table, table_data);
>> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
>> -        g_queue_push_tail(list,
>> -            GUINT_TO_POINTER(table_data->len - pptt_start));
>> -        build_processor_hierarchy_node(
>> -            table_data,
>> -            /*
>> -             * Physical package - represents the boundary
>> -             * of a physical package
>> -             */
>> -            (1 << 0),
>> -            0, socket, NULL, 0);
>> -    }
>> +    /*
>> +     * This works with the assumption that cpus[n].props.*_id has been
>> +     * sorted from top to down levels in mc->possible_cpu_arch_ids().
>> +     * Otherwise, the unexpected and duplicate containers will be
>> +     * created.
>> +     */
> s/duplicate/duplicated

Both should be fine, but I will replace it with the one you prefer
in v8.

>> +    for (n = 0; n < cpus->len; n++) {
>> +        if (cpus->cpus[n].props.socket_id != socket_id) {
>> +            assert(cpus->cpus[n].props.socket_id > socket_id);
>> +            socket_id = cpus->cpus[n].props.socket_id;
>> +            cluster_id = -1;
>> +            core_id = -1;
>> +            socket_offset = table_data->len - pptt_start;
>> +            build_processor_hierarchy_node(table_data,
>> +                (1 << 0), /* Physical package */
>> +                0, socket_id, NULL, 0);
>> +        }
>> -    if (mc->smp_props.clusters_supported) {
>> -        length = g_queue_get_length(list);
>> -        for (i = 0; i < length; i++) {
>> -            int cluster;
>> -
>> -            parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>> -            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
>> -                g_queue_push_tail(list,
>> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
>> -                build_processor_hierarchy_node(
>> -                    table_data,
>> -                    (0 << 0), /* not a physical package */
>> -                    parent_offset, cluster, NULL, 0);
>> +        if (mc->smp_props.clusters_supported) {
>> +            if (cpus->cpus[n].props.cluster_id != cluster_id) {
>> +                assert(cpus->cpus[n].props.cluster_id > cluster_id);
>> +                cluster_id = cpus->cpus[n].props.cluster_id;
>> +                core_id = -1;
>> +                cluster_offset = table_data->len - pptt_start;
>> +                build_processor_hierarchy_node(table_data,
>> +                    (0 << 0), /* Not a physical package */
>> +                    socket_offset, cluster_id, NULL, 0);
>>               }
>> +        } else {
>> +            cluster_offset = socket_offset;
>>           }
>> -    }
>> -    length = g_queue_get_length(list);
>> -    for (i = 0; i < length; i++) {
>> -        int core;
>> -
>> -        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>> -        for (core = 0; core < ms->smp.cores; core++) {
>> -            if (ms->smp.threads > 1) {
>> -                g_queue_push_tail(list,
>> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
>> -                build_processor_hierarchy_node(
>> -                    table_data,
>> +        if (ms->smp.threads == 1) {
>> +            build_processor_hierarchy_node(table_data,
>> +                (1 << 1) | /* ACPI Processor ID valid */
>> +                (1 << 3),  /* Node is a Leaf */
>> +                cluster_offset, n, NULL, 0);
>> +        } else {
>> +            if (cpus->cpus[n].props.core_id != core_id) {
>> +                assert(cpus->cpus[n].props.core_id > core_id);
>> +                core_id = cpus->cpus[n].props.core_id;
>> +                core_offset = table_data->len - pptt_start;
>> +                build_processor_hierarchy_node(table_data,
>>                       (0 << 0), /* not a physical package */
> nit: For consistency, maybe "Not a physical package"

Sure. Will do in v8.

>> -                    parent_offset, core, NULL, 0);
>> -            } else {
>> -                build_processor_hierarchy_node(
>> -                    table_data,
>> -                    (1 << 1) | /* ACPI Processor ID valid */
>> -                    (1 << 3),  /* Node is a Leaf */
>> -                    parent_offset, uid++, NULL, 0);
>> +                    cluster_offset, core_id, NULL, 0);
>>               }
>> -        }
>> -    }
>> -
>> -    length = g_queue_get_length(list);
>> -    for (i = 0; i < length; i++) {
>> -        int thread;
>> -        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>> -        for (thread = 0; thread < ms->smp.threads; thread++) {
>> -            build_processor_hierarchy_node(
>> -                table_data,
>> +            build_processor_hierarchy_node(table_data,
>>                   (1 << 1) | /* ACPI Processor ID valid */
>>                   (1 << 2) | /* Processor is a Thread */
>>                   (1 << 3),  /* Node is a Leaf */
>> -                parent_offset, uid++, NULL, 0);
>> +                core_offset, n, NULL, 0);
>>           }
>>       }
>> -    g_queue_free(list);
>>       acpi_table_end(linker, &table);
>>   }
> For the function of exposing vCPU topology to guest:
> Tested-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> 

Thanks for testing it and your time to review this series.

Thanks,
Gavin


