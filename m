Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5DA6130CE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 07:57:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opOis-0008Ao-Nc; Mon, 31 Oct 2022 02:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1opOin-0008AJ-Oa
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 02:56:33 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1opOik-00017G-Mr
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 02:56:33 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N13p80R0YzHvGB;
 Mon, 31 Oct 2022 14:56:00 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 14:56:16 +0800
Subject: Re: [PATCH v2 1/4] hw/acpi/aml-build: Only generate cluster node in
 PPTT when specified
To: Yicong Yang <yangyicong@huawei.com>
CC: <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
 <yangyicong@hisilicon.com>, <prime.zeng@huawei.com>,
 <hesham.almatary@huawei.com>, <ionela.voinescu@arm.com>,
 <darren@os.amperecomputing.com>, <mst@redhat.com>,
 <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>, Ani Sinha
 <ani@anisinha.ca>, Eduardo Habkost <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, <qemu-devel@nongnu.org>
References: <20221027032613.18377-1-yangyicong@huawei.com>
 <20221027032613.18377-2-yangyicong@huawei.com>
Message-ID: <6fa8a6ca-765a-8a55-76fb-91714b740fe7@huawei.com>
Date: Mon, 31 Oct 2022 14:56:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20221027032613.18377-2-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Yicong,

On 2022/10/27 11:26, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
>
> Currently we'll always generate a cluster node no matter user has
> specified '-smp clusters=X' or not. Cluster is an optional level
> and will participant the building of Linux scheduling domains and
> only appears on a few platforms. It's unncessary to always build
> it which cannot reflect the real topology on platforms have no
> cluster and to avoid affecting the linux scheduling domains in the
> VM. So only generate it when user specified explicitly.
>
> Tested qemu-system-aarch64 with `-smp 8` and linux 6.1-rc1, without
> this patch:
> estuary:/sys/devices/system/cpu/cpu0/topology$ cat cluster_*
> ff	# cluster_cpus
> 0-7	# cluster_cpus_list
> 56	# cluster_id
>
> with this patch:
> estuary:/sys/devices/system/cpu/cpu0/topology$ cat cluster_*
> ff	# cluster_cpus
> 0-7	# cluster_cpus_list
> 36	# cluster_id, with no cluster node kernel will make it to
> 	  physical package id
>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   hw/acpi/aml-build.c   | 2 +-
>   hw/core/machine-smp.c | 3 +++
>   include/hw/boards.h   | 2 ++
>   qemu-options.hx       | 2 ++
>   4 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index e6bfac95c7..aab73af66d 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2030,7 +2030,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                   0, socket_id, NULL, 0);
>           }
>   
> -        if (mc->smp_props.clusters_supported) {
> +        if (mc->smp_props.clusters_supported && ms->smp.build_cluster) {
>               if (cpus->cpus[n].props.cluster_id != cluster_id) {
>                   assert(cpus->cpus[n].props.cluster_id > cluster_id);
>                   cluster_id = cpus->cpus[n].props.cluster_id;
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index b39ed21e65..5d37e8d07a 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -158,6 +158,9 @@ void machine_parse_smp_config(MachineState *ms,
>       ms->smp.threads = threads;
>       ms->smp.max_cpus = maxcpus;
>   
> +    if (config->has_clusters)
> +        ms->smp.build_cluster = true;
> +
>       /* sanity-check of the computed topology */
>       if (sockets * dies * clusters * cores * threads != maxcpus) {
>           g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 311ed17e18..c53f047b90 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -305,6 +305,7 @@ typedef struct DeviceMemoryState {
>    * @cores: the number of cores in one cluster
>    * @threads: the number of threads in one core
>    * @max_cpus: the maximum number of logical processors on the machine
> + * @build_cluster: build cluster topology or not
>    */
>   typedef struct CpuTopology {
>       unsigned int cpus;
> @@ -314,6 +315,7 @@ typedef struct CpuTopology {
>       unsigned int cores;
>       unsigned int threads;
>       unsigned int max_cpus;
> +    bool build_cluster;
build_cluster seems a variable defined specifically for ACPI PPTT
generation. It may not be proper to place it in the generic struct
CpuTopology which only holds topo members.

What about a more generic variable in struct SMPCompatProps
together with @clusters_supported. Something like below:

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 1f57ee8ca2..8db0706d5d 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -130,11 +130,14 @@ typedef struct {
   * @prefer_sockets - whether sockets are preferred over cores in smp 
parsing
   * @dies_supported - whether dies are supported by the machine
   * @clusters_supported - whether clusters are supported by the machine
+ * @has_clusters - whether clusters is explicitly specified in the user
+ *    provided SMP configuration.
   */
  typedef struct {
      bool prefer_sockets;
      bool dies_supported;
      bool clusters_supported;
+    bool has_clusters;
  } SMPCompatProps;

>   } CpuTopology;
>   
>   /**
> diff --git a/qemu-options.hx b/qemu-options.hx
> index eb38e5dc40..0a710e7be3 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -342,6 +342,8 @@ SRST
>       were preferred over threads), however, this behaviour is considered
>       liable to change. Prior to 6.2 the preference was sockets over cores
>       over threads. Since 6.2 the preference is cores over sockets over threads.
> +    The cluster topology will only be generated if explicitly specified
> +    by the "-cluster" option.
no "-cluster" option, only "-smp" :)
>       For example, the following option defines a machine board with 2 sockets
>       of 1 core before 6.2 and 1 socket of 2 cores after 6.2:
Maybe better to add a note at *end* of the doc about -smp like:

Note: The cluster topology will only be generated in ACPI and exposed
to guest if it's explicitly specified in -smp.

Thanks,
Yanan

