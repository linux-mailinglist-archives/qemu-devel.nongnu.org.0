Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7694FF619
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 13:52:21 +0200 (CEST)
Received: from localhost ([::1]:37636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nebXo-0008E0-7X
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 07:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nebW4-00077i-6d; Wed, 13 Apr 2022 07:50:32 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nebW0-00059F-15; Wed, 13 Apr 2022 07:50:31 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Kdgnn5gpCzgYhm;
 Wed, 13 Apr 2022 19:47:57 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2375.24; Wed, 13 Apr 2022 19:49:47 +0800
Subject: Re: [PATCH v5 1/4] qapi/machine.json: Add cluster-id
To: Gavin Shan <gshan@redhat.com>, <qemu-arm@nongnu.org>
CC: <qemu-devel@nongnu.org>, <imammedo@redhat.com>, <drjones@redhat.com>,
 <richard.henderson@linaro.org>, <peter.maydell@linaro.org>,
 <zhenyzha@redhat.com>, <shan.gavin@gmail.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-2-gshan@redhat.com>
Message-ID: <fedf507c-c5ea-aeec-9acc-586f08dcaea4@huawei.com>
Date: Wed, 13 Apr 2022 19:49:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220403145953.10522-2-gshan@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
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

On 2022/4/3 22:59, Gavin Shan wrote:
> This adds cluster-id in CPU instance properties, which will be used
> by arm/virt machine. Besides, the cluster-id is also verified or
> dumped in various spots:
>
>    * hw/core/machine.c::machine_set_cpu_numa_node() to associate
>      CPU with its NUMA node.
>
>    * hw/core/machine.c::machine_numa_finish_cpu_init() to associate
>      CPU with NUMA node when no default association isn't provided.
>
>    * hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() to dump
>      cluster-id.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/core/machine-hmp-cmds.c |  4 ++++
>   hw/core/machine.c          | 16 ++++++++++++++++
>   qapi/machine.json          |  6 ++++--
>   3 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
> index 4e2f319aeb..5cb5eecbfc 100644
> --- a/hw/core/machine-hmp-cmds.c
> +++ b/hw/core/machine-hmp-cmds.c
> @@ -77,6 +77,10 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
>           if (c->has_die_id) {
>               monitor_printf(mon, "    die-id: \"%" PRIu64 "\"\n", c->die_id);
>           }
> +        if (c->has_cluster_id) {
> +            monitor_printf(mon, "    cluster-id: \"%" PRIu64 "\"\n",
> +                           c->cluster_id);
> +        }
>           if (c->has_core_id) {
>               monitor_printf(mon, "    core-id: \"%" PRIu64 "\"\n", c->core_id);
>           }
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index d856485cb4..8748b64657 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -677,6 +677,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
>               return;
>           }
>   
> +        if (props->has_cluster_id && !slot->props.has_cluster_id) {
> +            error_setg(errp, "cluster-id is not supported");
> +            return;
> +        }
> +
>           if (props->has_socket_id && !slot->props.has_socket_id) {
>               error_setg(errp, "socket-id is not supported");
>               return;
> @@ -696,6 +701,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
>                   continue;
>           }
>   
> +        if (props->has_cluster_id &&
> +            props->cluster_id != slot->props.cluster_id) {
> +                continue;
> +        }
> +
>           if (props->has_die_id && props->die_id != slot->props.die_id) {
>                   continue;
>           }
> @@ -990,6 +1000,12 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
>           }
>           g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
>       }
> +    if (cpu->props.has_cluster_id) {
> +        if (s->len) {
> +            g_string_append_printf(s, ", ");
> +        }
> +        g_string_append_printf(s, "cluster-id: %"PRId64, cpu->props.cluster_id);
> +    }
>       if (cpu->props.has_core_id) {
>           if (s->len) {
>               g_string_append_printf(s, ", ");
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 9c460ec450..ea22b574b0 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -868,10 +868,11 @@
>   # @node-id: NUMA node ID the CPU belongs to
>   # @socket-id: socket number within node/board the CPU belongs to
>   # @die-id: die number within socket the CPU belongs to (since 4.1)
> -# @core-id: core number within die the CPU belongs to
> +# @cluster-id: cluster number within die the CPU belongs to
I remember this should be "cluster number within socket..."
according to Igor's comments in v3 ?
> +# @core-id: core number within cluster/die the CPU belongs to
>   # @thread-id: thread number within core the CPU belongs to
>   #
> -# Note: currently there are 5 properties that could be present
> +# Note: currently there are 6 properties that could be present
>   #       but management should be prepared to pass through other
>   #       properties with device_add command to allow for future
>   #       interface extension. This also requires the filed names to be kept in
> @@ -883,6 +884,7 @@
>     'data': { '*node-id': 'int',
>               '*socket-id': 'int',
>               '*die-id': 'int',
> +            '*cluster-id': 'int',
>               '*core-id': 'int',
>               '*thread-id': 'int'
>     }
Otherwise, looks good to me:
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Please also keep the involved Maintainers on Cc list in next version,
an Ack from them is best. :)

Thanks,
Yanan

