Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E03A7014E9
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 09:23:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxjaa-0007mp-4J; Sat, 13 May 2023 03:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1pxjaX-0007mg-4J
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:22:45 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1pxjaT-0004pd-CD
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:22:44 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4QJH683cTtz18KDJ;
 Sat, 13 May 2023 15:18:08 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 13 May 2023 15:22:22 +0800
CC: "Michael S. Tsirkin" <mst@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Igor
 Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 <qemu-devel@nongnu.org>, Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PULL 45/51] hw/acpi/aml-build: Only generate cluster node in
 PPTT when specified
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Yicong Yang
 <yangyicong@hisilicon.com>
References: <20230105091310.263867-1-mst@redhat.com>
 <20230105091310.263867-46-mst@redhat.com>
 <8a8724d5-d29d-eae5-3440-af089c3b6756@linaro.org>
Message-ID: <dfb5ccd7-26aa-0874-2168-09731a9c5e80@huawei.com>
Date: Sat, 13 May 2023 15:22:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <8a8724d5-d29d-eae5-3440-af089c3b6756@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=yangyicong@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.845,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Philippe,

On 2023/5/10 18:13, Philippe Mathieu-Daudé wrote:
> Hi Yang,
> 
> On 5/1/23 10:16, Michael S. Tsirkin wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Currently we'll always generate a cluster node no matter user has
>> specified '-smp clusters=X' or not. Cluster is an optional level
>> and will participant the building of Linux scheduling domains and
>> only appears on a few platforms. It's unncessary to always build
>> it when it cannot reflect the real topology on platforms having no
>> cluster implementation and to avoid affecting the linux scheduling
>> domains in the VM. So only generate the cluster topology in ACPI
>> PPTT when the user has specified it explicitly in -smp.
>>
>> Tested qemu-system-aarch64 with `-smp 8` and linux 6.1-rc1, without
>> this patch:
>> estuary:/sys/devices/system/cpu/cpu0/topology$ cat cluster_*
>> ff    # cluster_cpus
>> 0-7    # cluster_cpus_list
>> 56    # cluster_id
>>
>> with this patch:
>> estuary:/sys/devices/system/cpu/cpu0/topology$ cat cluster_*
>> ff    # cluster_cpus
>> 0-7    # cluster_cpus_list
>> 36    # cluster_id, with no cluster node kernel will make it to
>>       physical package id
>>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
>> Tested-by: Yanan Wang <wangyanan55@huawei.com>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> Message-Id: <20221229065513.55652-3-yangyicong@huawei.com>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>   include/hw/boards.h   | 3 +++
>>   hw/acpi/aml-build.c   | 2 +-
>>   hw/core/machine-smp.c | 2 ++
>>   qemu-options.hx       | 3 +++
>>   4 files changed, 9 insertions(+), 1 deletion(-)
> 
> 
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index 42feb4d4d7..ea331a20d1 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -2030,7 +2030,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>                   0, socket_id, NULL, 0);
>>           }
>>   -        if (mc->smp_props.clusters_supported) {
>> +        if (mc->smp_props.clusters_supported && mc->smp_props.has_clusters) {
>>               if (cpus->cpus[n].props.cluster_id != cluster_id) {
>>                   assert(cpus->cpus[n].props.cluster_id > cluster_id);
>>                   cluster_id = cpus->cpus[n].props.cluster_id;
>> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
>> index b39ed21e65..c3dab007da 100644
>> --- a/hw/core/machine-smp.c
>> +++ b/hw/core/machine-smp.c
>> @@ -158,6 +158,8 @@ void machine_parse_smp_config(MachineState *ms,
>>       ms->smp.threads = threads;
>>       ms->smp.max_cpus = maxcpus;
>>   +    mc->smp_props.has_clusters = config->has_clusters;
> 
> In another patch Bernhard noticed a QOM class field updated from
> a QOM object, which is an anti-OOP pattern:
> https://lore.kernel.org/qemu-devel/6E514B4B-9185-424E-832E-01813DE8E83F@gmail.com/
> 
> Looking at the codebase I noticed this is what you are doing here.
> By doing so, updating the class field from this particular instance
> results in all other instances being affected.
> 

Is it suggested to move this to machinestat so we won't touch the machineclass members
in the initialization here? In the initial version the has_clusters is placed in the
ms->smp structure but it's suggested that's not a good place, see the discussion [1]

[1] https://lore.kernel.org/qemu-devel/6fa8a6ca-765a-8a55-76fb-91714b740fe7@huawei.com/

Thanks.

> Currently this isn't really an issue because there are at most 2
> MachineState instances (in a migration case, where we want the same
> machine). However it would be nice to have this bad code example
> cleaned. (Also eventually this could become an issue with heterogeneous
> machines, but I'm not sure yet).
> 
> Do you mind sending a patch?
> 
> Thanks,
> 
> Phil.
> 
>>       /* sanity-check of the computed topology */
>>       if (sockets * dies * clusters * cores * threads != maxcpus) {
>>           g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 7f99d15b23..8662568324 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -343,6 +343,9 @@ SRST
>>       ::
>>             -smp 2
>> +
>> +    Note: The cluster topology will only be generated in ACPI and exposed
>> +    to guest if it's explicitly specified in -smp.
>>   ERST
>>     DEF("numa", HAS_ARG, QEMU_OPTION_numa,
> 
> .

