Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281F74DD4B8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 07:39:34 +0100 (CET)
Received: from localhost ([::1]:42864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV6Gq-0003GE-LS
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 02:39:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nV6Bq-00016q-UO; Fri, 18 Mar 2022 02:34:23 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:5133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nV6Bn-0003e7-Bt; Fri, 18 Mar 2022 02:34:22 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KKZ1Q2gXLzCqjP;
 Fri, 18 Mar 2022 14:32:10 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 14:34:12 +0800
Subject: Re: [PATCH v2 2/3] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
To: Gavin Shan <gshan@redhat.com>, <qemu-arm@nongnu.org>
CC: <qemu-devel@nongnu.org>, <imammedo@redhat.com>, <drjones@redhat.com>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <shan.gavin@gmail.com>, <zhenyzha@redhat.com>
References: <20220303031152.145960-1-gshan@redhat.com>
 <20220303031152.145960-3-gshan@redhat.com>
Message-ID: <12b4a089-b01f-f536-499e-d6029d0b1dea@huawei.com>
Date: Fri, 18 Mar 2022 14:34:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220303031152.145960-3-gshan@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>

Hi Gavin,

On 2022/3/3 11:11, Gavin Shan wrote:
> When the PPTT table is built, the CPU topology is re-calculated, but
> it's unecessary because the CPU topology, except the cluster IDs,
> has been populated in virt_possible_cpu_arch_ids() on arm/virt machine.
>
> This avoids to re-calculate the CPU topology by reusing the existing
> one in ms->possible_cpus. However, the cluster ID for the CPU instance
> has to be calculated dynamically because there is no corresponding
> field in struct CpuInstanceProperties. Currently, the only user of
> build_pptt() is arm/virt machine.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/acpi/aml-build.c | 106 ++++++++++++++++++++++++++++++++++----------
>   1 file changed, 82 insertions(+), 24 deletions(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 8966e16320..572cf5fc00 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2002,18 +2002,27 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                   const char *oem_id, const char *oem_table_id)
>   {
>       MachineClass *mc = MACHINE_GET_CLASS(ms);
> +    CPUArchIdList *cpus = ms->possible_cpus;
> +    GQueue *socket_list = g_queue_new();
> +    GQueue *cluster_list = g_queue_new();
> +    GQueue *core_list = g_queue_new();
>       GQueue *list = g_queue_new();
>       guint pptt_start = table_data->len;
>       guint parent_offset;
>       guint length, i;
> -    int uid = 0;
> -    int socket;
> +    int n, id, socket_id, cluster_id, core_id, thread_id;
>       AcpiTable table = { .sig = "PPTT", .rev = 2,
>                           .oem_id = oem_id, .oem_table_id = oem_table_id };
>   
>       acpi_table_begin(&table, table_data);
>   
> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
> +    for (n = 0; n < cpus->len; n++) {
> +        socket_id = cpus->cpus[n].props.socket_id;
> +        if (g_queue_find(socket_list, GUINT_TO_POINTER(socket_id))) {
> +            continue;
> +        }
> +
> +        g_queue_push_tail(socket_list, GUINT_TO_POINTER(socket_id));
>           g_queue_push_tail(list,
>               GUINT_TO_POINTER(table_data->len - pptt_start));
>           build_processor_hierarchy_node(
> @@ -2023,65 +2032,114 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                * of a physical package
>                */
>               (1 << 0),
> -            0, socket, NULL, 0);
> +            0, socket_id, NULL, 0);
>       }
>   
>       if (mc->smp_props.clusters_supported) {
>           length = g_queue_get_length(list);
>           for (i = 0; i < length; i++) {
> -            int cluster;
> -
>               parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
> +            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
> +
> +            for (n = 0; n < cpus->len; n++) {
> +                if (cpus->cpus[n].props.socket_id != socket_id) {
> +                    continue;
> +                }
> +
> +                /*
> +                 * We have to calculate the cluster ID because it isn't
> +                 * available in the CPU instance properties.
> +                 */
Since we need cluster ID now, maybe we can simply make it supported
in the CPU instance properties.

Thanks,
Yanan
> +                cluster_id = cpus->cpus[n].props.thread_id /
> +                             (ms->smp.cores * ms->smp.threads);
> +                if (g_queue_find(cluster_list, GUINT_TO_POINTER(cluster_id))) {
> +                    continue;
> +                }
> +
> +                g_queue_push_tail(cluster_list, GUINT_TO_POINTER(cluster_id));
>                   g_queue_push_tail(list,
>                       GUINT_TO_POINTER(table_data->len - pptt_start));
>                   build_processor_hierarchy_node(
>                       table_data,
>                       (0 << 0), /* not a physical package */
> -                    parent_offset, cluster, NULL, 0);
> +                    parent_offset, cluster_id, NULL, 0);
>               }
>           }
>       }
>   
>       length = g_queue_get_length(list);
>       for (i = 0; i < length; i++) {
> -        int core;
> -
>           parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -        for (core = 0; core < ms->smp.cores; core++) {
> -            if (ms->smp.threads > 1) {
> -                g_queue_push_tail(list,
> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
> -                build_processor_hierarchy_node(
> -                    table_data,
> -                    (0 << 0), /* not a physical package */
> -                    parent_offset, core, NULL, 0);
> -            } else {
> +        if (!mc->smp_props.clusters_supported) {
> +            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
> +        } else {
> +            cluster_id = GPOINTER_TO_UINT(g_queue_pop_head(cluster_list));
> +        }
> +
> +        for (n = 0; n < cpus->len; n++) {
> +            if (!mc->smp_props.clusters_supported &&
> +                cpus->cpus[n].props.socket_id != socket_id) {
> +                continue;
> +            }
> +
> +            /*
> +             * We have to calculate the cluster ID because it isn't
> +             * available in the CPU instance properties.
> +             */
> +            id = cpus->cpus[n].props.thread_id /
> +                (ms->smp.cores * ms->smp.threads);
> +            if (mc->smp_props.clusters_supported && id != cluster_id) {
> +                continue;
> +            }
> +
> +            core_id = cpus->cpus[n].props.core_id;
> +            if (ms->smp.threads <= 1) {
>                   build_processor_hierarchy_node(
>                       table_data,
>                       (1 << 1) | /* ACPI Processor ID valid */
>                       (1 << 3),  /* Node is a Leaf */
> -                    parent_offset, uid++, NULL, 0);
> +                    parent_offset, core_id, NULL, 0);
> +                continue;
>               }
> +
> +            if (g_queue_find(core_list, GUINT_TO_POINTER(core_id))) {
> +                continue;
> +            }
> +
> +            g_queue_push_tail(core_list, GUINT_TO_POINTER(core_id));
> +            g_queue_push_tail(list,
> +                GUINT_TO_POINTER(table_data->len - pptt_start));
> +            build_processor_hierarchy_node(
> +                table_data,
> +                (0 << 0), /* not a physical package */
> +                parent_offset, core_id, NULL, 0);
>           }
>       }
>   
>       length = g_queue_get_length(list);
>       for (i = 0; i < length; i++) {
> -        int thread;
> -
>           parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -        for (thread = 0; thread < ms->smp.threads; thread++) {
> +        core_id = GPOINTER_TO_UINT(g_queue_pop_head(core_list));
> +
> +        for (n = 0; n < cpus->len; n++) {
> +            if (cpus->cpus[n].props.core_id != core_id) {
> +                continue;
> +            }
> +
> +            thread_id = cpus->cpus[n].props.thread_id;
>               build_processor_hierarchy_node(
>                   table_data,
>                   (1 << 1) | /* ACPI Processor ID valid */
>                   (1 << 2) | /* Processor is a Thread */
>                   (1 << 3),  /* Node is a Leaf */
> -                parent_offset, uid++, NULL, 0);
> +                parent_offset, thread_id, NULL, 0);
>           }
>       }
>   
>       g_queue_free(list);
> +    g_queue_free(core_list);
> +    g_queue_free(cluster_list);
> +    g_queue_free(socket_list);
>       acpi_table_end(linker, &table);
>   }
>   


