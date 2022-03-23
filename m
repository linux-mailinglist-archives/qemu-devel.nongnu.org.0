Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31A64E4B81
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 04:34:07 +0100 (CET)
Received: from localhost ([::1]:49324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWrl9-0007bn-1M
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 23:34:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWrj9-00059c-V9
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 23:32:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWrj6-0004IZ-9p
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 23:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648006319;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hpDJNZY/U+lVR4I7Rc+khyF0YH3Kq8V98sO85I7TTzQ=;
 b=EEV5TUZjxfICu16RRSXvApr1bW4lmOi4ESO4YCBlGoOOFt3DQqIGLpB5DTbUNTm87+AC0t
 n1AhK5TM4jqdtreo4A+h92alkIGwQ3LogGCfd1kquBr9WniTvnUAfxA2gjLDOf0m90jedu
 79smW0XMckphPaJbdOeByUmY6ImYa0A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-5mDHNC92MnKnP0HAoOuqSw-1; Tue, 22 Mar 2022 23:31:58 -0400
X-MC-Unique: 5mDHNC92MnKnP0HAoOuqSw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8BE7801E80;
 Wed, 23 Mar 2022 03:31:57 +0000 (UTC)
Received: from [10.72.12.33] (ovpn-12-33.pek2.redhat.com [10.72.12.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C276743E914;
 Wed, 23 Mar 2022 03:31:51 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
To: Igor Mammedov <imammedo@redhat.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>
References: <20220303031152.145960-1-gshan@redhat.com>
 <20220303031152.145960-3-gshan@redhat.com>
 <12b4a089-b01f-f536-499e-d6029d0b1dea@huawei.com>
 <20220318142811.1d8eb072@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <3f55457e-bf2e-03f4-1eef-17d277c4d094@redhat.com>
Date: Wed, 23 Mar 2022 11:31:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220318142811.1d8eb072@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor and Yanan,

On 3/18/22 9:28 PM, Igor Mammedov wrote:
> On Fri, 18 Mar 2022 14:34:12 +0800
> "wangyanan (Y)" <wangyanan55@huawei.com> wrote:
>> On 2022/3/3 11:11, Gavin Shan wrote:
>>> When the PPTT table is built, the CPU topology is re-calculated, but
>>> it's unecessary because the CPU topology, except the cluster IDs,
>>> has been populated in virt_possible_cpu_arch_ids() on arm/virt machine.
>>>
>>> This avoids to re-calculate the CPU topology by reusing the existing
>>> one in ms->possible_cpus. However, the cluster ID for the CPU instance
>>> has to be calculated dynamically because there is no corresponding
>>> field in struct CpuInstanceProperties. Currently, the only user of
>>> build_pptt() is arm/virt machine.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>    hw/acpi/aml-build.c | 106 ++++++++++++++++++++++++++++++++++----------
>>>    1 file changed, 82 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>>> index 8966e16320..572cf5fc00 100644
>>> --- a/hw/acpi/aml-build.c
>>> +++ b/hw/acpi/aml-build.c
>>> @@ -2002,18 +2002,27 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>>                    const char *oem_id, const char *oem_table_id)
>>>    {
>>>        MachineClass *mc = MACHINE_GET_CLASS(ms);
>>> +    CPUArchIdList *cpus = ms->possible_cpus;
>>> +    GQueue *socket_list = g_queue_new();
>>> +    GQueue *cluster_list = g_queue_new();
>>> +    GQueue *core_list = g_queue_new();
>>>        GQueue *list = g_queue_new();
>>>        guint pptt_start = table_data->len;
>>>        guint parent_offset;
>>>        guint length, i;
>>> -    int uid = 0;
>>> -    int socket;
>>> +    int n, id, socket_id, cluster_id, core_id, thread_id;
>>>        AcpiTable table = { .sig = "PPTT", .rev = 2,
>>>                            .oem_id = oem_id, .oem_table_id = oem_table_id };
>>>    
>>>        acpi_table_begin(&table, table_data);
>>>    
>>> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
>>> +    for (n = 0; n < cpus->len; n++) {
>>> +        socket_id = cpus->cpus[n].props.socket_id;
>>> +        if (g_queue_find(socket_list, GUINT_TO_POINTER(socket_id))) {
>>> +            continue;
>>> +        }
>>> +
>>> +        g_queue_push_tail(socket_list, GUINT_TO_POINTER(socket_id));
>>>            g_queue_push_tail(list,
>>>                GUINT_TO_POINTER(table_data->len - pptt_start));
>>>            build_processor_hierarchy_node(
>>> @@ -2023,65 +2032,114 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>>                 * of a physical package
>>>                 */
>>>                (1 << 0),
>>> -            0, socket, NULL, 0);
>>> +            0, socket_id, NULL, 0);
>>>        }
>>>    
>>>        if (mc->smp_props.clusters_supported) {
>>>            length = g_queue_get_length(list);
>>>            for (i = 0; i < length; i++) {
>>> -            int cluster;
>>> -
>>>                parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>>> -            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
>>> +            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
>>> +
>>> +            for (n = 0; n < cpus->len; n++) {
>>> +                if (cpus->cpus[n].props.socket_id != socket_id) {
>>> +                    continue;
>>> +                }
>>> +
>>> +                /*
>>> +                 * We have to calculate the cluster ID because it isn't
>>> +                 * available in the CPU instance properties.
>>> +                 */
>> Since we need cluster ID now, maybe we can simply make it supported
>> in the CPU instance properties.
> 
> agreed
> 

Thanks for your review. I will add it in v3. FYI, the addition
needs to be done in the PATCH[v3 01/04] where the CPU topology
is populated :)

Thanks,
Gavin

>>> +                cluster_id = cpus->cpus[n].props.thread_id /
>>> +                             (ms->smp.cores * ms->smp.threads);
>>> +                if (g_queue_find(cluster_list, GUINT_TO_POINTER(cluster_id))) {
>>> +                    continue;
>>> +                }
>>> +
>>> +                g_queue_push_tail(cluster_list, GUINT_TO_POINTER(cluster_id));
>>>                    g_queue_push_tail(list,
>>>                        GUINT_TO_POINTER(table_data->len - pptt_start));
>>>                    build_processor_hierarchy_node(
>>>                        table_data,
>>>                        (0 << 0), /* not a physical package */
>>> -                    parent_offset, cluster, NULL, 0);
>>> +                    parent_offset, cluster_id, NULL, 0);
>>>                }
>>>            }
>>>        }
>>>    
>>>        length = g_queue_get_length(list);
>>>        for (i = 0; i < length; i++) {
>>> -        int core;
>>> -
>>>            parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>>> -        for (core = 0; core < ms->smp.cores; core++) {
>>> -            if (ms->smp.threads > 1) {
>>> -                g_queue_push_tail(list,
>>> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
>>> -                build_processor_hierarchy_node(
>>> -                    table_data,
>>> -                    (0 << 0), /* not a physical package */
>>> -                    parent_offset, core, NULL, 0);
>>> -            } else {
>>> +        if (!mc->smp_props.clusters_supported) {
>>> +            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
>>> +        } else {
>>> +            cluster_id = GPOINTER_TO_UINT(g_queue_pop_head(cluster_list));
>>> +        }
>>> +
>>> +        for (n = 0; n < cpus->len; n++) {
>>> +            if (!mc->smp_props.clusters_supported &&
>>> +                cpus->cpus[n].props.socket_id != socket_id) {
>>> +                continue;
>>> +            }
>>> +
>>> +            /*
>>> +             * We have to calculate the cluster ID because it isn't
>>> +             * available in the CPU instance properties.
>>> +             */
>>> +            id = cpus->cpus[n].props.thread_id /
>>> +                (ms->smp.cores * ms->smp.threads);
>>> +            if (mc->smp_props.clusters_supported && id != cluster_id) {
>>> +                continue;
>>> +            }
>>> +
>>> +            core_id = cpus->cpus[n].props.core_id;
>>> +            if (ms->smp.threads <= 1) {
>>>                    build_processor_hierarchy_node(
>>>                        table_data,
>>>                        (1 << 1) | /* ACPI Processor ID valid */
>>>                        (1 << 3),  /* Node is a Leaf */
>>> -                    parent_offset, uid++, NULL, 0);
>>> +                    parent_offset, core_id, NULL, 0);
>>> +                continue;
>>>                }
>>> +
>>> +            if (g_queue_find(core_list, GUINT_TO_POINTER(core_id))) {
>>> +                continue;
>>> +            }
>>> +
>>> +            g_queue_push_tail(core_list, GUINT_TO_POINTER(core_id));
>>> +            g_queue_push_tail(list,
>>> +                GUINT_TO_POINTER(table_data->len - pptt_start));
>>> +            build_processor_hierarchy_node(
>>> +                table_data,
>>> +                (0 << 0), /* not a physical package */
>>> +                parent_offset, core_id, NULL, 0);
>>>            }
>>>        }
>>>    
>>>        length = g_queue_get_length(list);
>>>        for (i = 0; i < length; i++) {
>>> -        int thread;
>>> -
>>>            parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>>> -        for (thread = 0; thread < ms->smp.threads; thread++) {
>>> +        core_id = GPOINTER_TO_UINT(g_queue_pop_head(core_list));
>>> +
>>> +        for (n = 0; n < cpus->len; n++) {
>>> +            if (cpus->cpus[n].props.core_id != core_id) {
>>> +                continue;
>>> +            }
>>> +
>>> +            thread_id = cpus->cpus[n].props.thread_id;
>>>                build_processor_hierarchy_node(
>>>                    table_data,
>>>                    (1 << 1) | /* ACPI Processor ID valid */
>>>                    (1 << 2) | /* Processor is a Thread */
>>>                    (1 << 3),  /* Node is a Leaf */
>>> -                parent_offset, uid++, NULL, 0);
>>> +                parent_offset, thread_id, NULL, 0);
>>>            }
>>>        }
>>>    
>>>        g_queue_free(list);
>>> +    g_queue_free(core_list);
>>> +    g_queue_free(cluster_list);
>>> +    g_queue_free(socket_list);
>>>        acpi_table_end(linker, &table);
>>>    }
>>>      
>>
> 


