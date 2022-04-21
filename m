Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F0B509F42
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:04:19 +0200 (CEST)
Received: from localhost ([::1]:33708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVXm-0003J1-1h
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nhVKO-00075o-SI; Thu, 21 Apr 2022 07:50:28 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:5155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nhVKL-0000IK-9c; Thu, 21 Apr 2022 07:50:28 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KkbMX663FzCrY9;
 Thu, 21 Apr 2022 19:45:44 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Apr 2022 19:50:09 +0800
Subject: Re: [PATCH v7 4/4] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
To: Gavin Shan <gshan@redhat.com>, <qemu-arm@nongnu.org>
CC: <lvivier@redhat.com>, <eduardo@habkost.net>, <thuth@redhat.com>,
 <berrange@redhat.com>, <shan.gavin@gmail.com>, <peter.maydell@linaro.org>,
 <Jonathan.Cameron@Huawei.com>, <zhenyzha@redhat.com>, <mst@redhat.com>,
 <qemu-devel@nongnu.org>, <armbru@redhat.com>, <imammedo@redhat.com>,
 <ani@anisinha.ca>, <pbonzini@redhat.com>, <drjones@redhat.com>,
 <eblake@redhat.com>, <f4bug@amsat.org>
References: <20220420104909.233058-1-gshan@redhat.com>
 <20220420104909.233058-5-gshan@redhat.com>
Message-ID: <c737c168-108c-ba35-953e-44c14b8f8ae7@huawei.com>
Date: Thu, 21 Apr 2022 19:50:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220420104909.233058-5-gshan@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 2022/4/20 18:49, Gavin Shan wrote:
> When the PPTT table is built, the CPU topology is re-calculated, but
> it's unecessary because the CPU topology has been populated in
> virt_possible_cpu_arch_ids() on arm/virt machine.
>
> This reworks build_pptt() to avoid by reusing the existing IDs in
> ms->possible_cpus. Currently, the only user of build_pptt() is
> arm/virt machine.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/acpi/aml-build.c | 109 +++++++++++++++++++-------------------------
>   1 file changed, 47 insertions(+), 62 deletions(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 4086879ebf..73f4e69c29 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2002,86 +2002,71 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                   const char *oem_id, const char *oem_table_id)
>   {
>       MachineClass *mc = MACHINE_GET_CLASS(ms);
> -    GQueue *list = g_queue_new();
> -    guint pptt_start = table_data->len;
> -    guint parent_offset;
> -    guint length, i;
> -    int uid = 0;
> -    int socket;
> +    CPUArchIdList *cpus = ms->possible_cpus;
> +    int64_t socket_id = -1, cluster_id = -1, core_id = -1;
> +    uint32_t socket_offset = 0, cluster_offset = 0, core_offset = 0;
> +    uint32_t pptt_start = table_data->len;
> +    int n;
>       AcpiTable table = { .sig = "PPTT", .rev = 2,
>                           .oem_id = oem_id, .oem_table_id = oem_table_id };
>   
>       acpi_table_begin(&table, table_data);
>   
> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
> -        g_queue_push_tail(list,
> -            GUINT_TO_POINTER(table_data->len - pptt_start));
> -        build_processor_hierarchy_node(
> -            table_data,
> -            /*
> -             * Physical package - represents the boundary
> -             * of a physical package
> -             */
> -            (1 << 0),
> -            0, socket, NULL, 0);
> -    }
> +    /*
> +     * This works with the assumption that cpus[n].props.*_id has been
> +     * sorted from top to down levels in mc->possible_cpu_arch_ids().
> +     * Otherwise, the unexpected and duplicate containers will be
> +     * created.
> +     */
s/duplicate/duplicated
> +    for (n = 0; n < cpus->len; n++) {
> +        if (cpus->cpus[n].props.socket_id != socket_id) {
> +            assert(cpus->cpus[n].props.socket_id > socket_id);
> +            socket_id = cpus->cpus[n].props.socket_id;
> +            cluster_id = -1;
> +            core_id = -1;
> +            socket_offset = table_data->len - pptt_start;
> +            build_processor_hierarchy_node(table_data,
> +                (1 << 0), /* Physical package */
> +                0, socket_id, NULL, 0);
> +        }
>   
> -    if (mc->smp_props.clusters_supported) {
> -        length = g_queue_get_length(list);
> -        for (i = 0; i < length; i++) {
> -            int cluster;
> -
> -            parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
> -                g_queue_push_tail(list,
> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
> -                build_processor_hierarchy_node(
> -                    table_data,
> -                    (0 << 0), /* not a physical package */
> -                    parent_offset, cluster, NULL, 0);
> +        if (mc->smp_props.clusters_supported) {
> +            if (cpus->cpus[n].props.cluster_id != cluster_id) {
> +                assert(cpus->cpus[n].props.cluster_id > cluster_id);
> +                cluster_id = cpus->cpus[n].props.cluster_id;
> +                core_id = -1;
> +                cluster_offset = table_data->len - pptt_start;
> +                build_processor_hierarchy_node(table_data,
> +                    (0 << 0), /* Not a physical package */
> +                    socket_offset, cluster_id, NULL, 0);
>               }
> +        } else {
> +            cluster_offset = socket_offset;
>           }
> -    }
>   
> -    length = g_queue_get_length(list);
> -    for (i = 0; i < length; i++) {
> -        int core;
> -
> -        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -        for (core = 0; core < ms->smp.cores; core++) {
> -            if (ms->smp.threads > 1) {
> -                g_queue_push_tail(list,
> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
> -                build_processor_hierarchy_node(
> -                    table_data,
> +        if (ms->smp.threads == 1) {
> +            build_processor_hierarchy_node(table_data,
> +                (1 << 1) | /* ACPI Processor ID valid */
> +                (1 << 3),  /* Node is a Leaf */
> +                cluster_offset, n, NULL, 0);
> +        } else {
> +            if (cpus->cpus[n].props.core_id != core_id) {
> +                assert(cpus->cpus[n].props.core_id > core_id);
> +                core_id = cpus->cpus[n].props.core_id;
> +                core_offset = table_data->len - pptt_start;
> +                build_processor_hierarchy_node(table_data,
>                       (0 << 0), /* not a physical package */
nit: For consistency, maybe "Not a physical package"
> -                    parent_offset, core, NULL, 0);
> -            } else {
> -                build_processor_hierarchy_node(
> -                    table_data,
> -                    (1 << 1) | /* ACPI Processor ID valid */
> -                    (1 << 3),  /* Node is a Leaf */
> -                    parent_offset, uid++, NULL, 0);
> +                    cluster_offset, core_id, NULL, 0);
>               }
> -        }
> -    }
> -
> -    length = g_queue_get_length(list);
> -    for (i = 0; i < length; i++) {
> -        int thread;
>   
> -        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -        for (thread = 0; thread < ms->smp.threads; thread++) {
> -            build_processor_hierarchy_node(
> -                table_data,
> +            build_processor_hierarchy_node(table_data,
>                   (1 << 1) | /* ACPI Processor ID valid */
>                   (1 << 2) | /* Processor is a Thread */
>                   (1 << 3),  /* Node is a Leaf */
> -                parent_offset, uid++, NULL, 0);
> +                core_offset, n, NULL, 0);
>           }
>       }
>   
> -    g_queue_free(list);
>       acpi_table_end(linker, &table);
>   }
>   
For the function of exposing vCPU topology to guest:
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan

