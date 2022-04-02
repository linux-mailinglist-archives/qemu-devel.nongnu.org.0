Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BFF4EFDE7
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 04:04:18 +0200 (CEST)
Received: from localhost ([::1]:57132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naT7h-0001h9-QX
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 22:04:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1naT65-0000jc-TG; Fri, 01 Apr 2022 22:02:37 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1naT63-00064R-2d; Fri, 01 Apr 2022 22:02:37 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KVgHF35LPzgY7d;
 Sat,  2 Apr 2022 10:00:41 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Sat, 2 Apr 2022 10:02:21 +0800
Subject: Re: [PATCH v3 2/4] hw/arm/virt: Fix CPU's default NUMA node ID
To: Gavin Shan <gshan@redhat.com>, <qemu-arm@nongnu.org>
CC: <qemu-devel@nongnu.org>, <imammedo@redhat.com>, <drjones@redhat.com>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <zhenyzha@redhat.com>, <shan.gavin@gmail.com>
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-3-gshan@redhat.com>
Message-ID: <a69a124c-6d13-4513-7116-0b35b7e4b11d@huawei.com>
Date: Sat, 2 Apr 2022 10:02:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220323072438.71815-3-gshan@redhat.com>
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


On 2022/3/23 15:24, Gavin Shan wrote:
> When CPU-to-NUMA association isn't explicitly provided by users,
> the default on is given by mc->get_default_cpu_node_id(). However,
s/on/one
> the CPU topology isn't fully considered in the default association
> and this causes CPU topology broken warnings on booting Linux guest.
>
> For example, the following warning messages are observed when the
> Linux guest is booted with the following command lines.
>
>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>    -accel kvm -machine virt,gic-version=host               \
>    -cpu host                                               \
>    -smp 6,sockets=2,cores=3,threads=1                      \
>    -m 1024M,slots=16,maxmem=64G                            \
>    -object memory-backend-ram,id=mem0,size=128M            \
>    -object memory-backend-ram,id=mem1,size=128M            \
>    -object memory-backend-ram,id=mem2,size=128M            \
>    -object memory-backend-ram,id=mem3,size=128M            \
>    -object memory-backend-ram,id=mem4,size=128M            \
>    -object memory-backend-ram,id=mem4,size=384M            \
>    -numa node,nodeid=0,memdev=mem0                         \
>    -numa node,nodeid=1,memdev=mem1                         \
>    -numa node,nodeid=2,memdev=mem2                         \
>    -numa node,nodeid=3,memdev=mem3                         \
>    -numa node,nodeid=4,memdev=mem4                         \
>    -numa node,nodeid=5,memdev=mem5
>           :
>    alternatives: patching kernel code
>    BUG: arch topology borken
>    the CLS domain not a subset of the MC domain
>    <the above error log repeats>
>    BUG: arch topology borken
>    the DIE domain not a subset of the NODE domain
>
> With current implementation of mc->get_default_cpu_node_id(),
> CPU#0 to CPU#5 are associated with NODE#0 to NODE#5 separately.
> That's incorrect because CPU#0/1/2 should be associated with same
> NUMA node because they're seated in same socket.
>
> This fixes the issue by considering the socket ID when the default
> CPU-to-NUMA association is provided in virt_possible_cpu_arch_ids().
> With this applied, no more CPU topology broken warnings are seen
> from the Linux guest. The 6 CPUs are associated with NODE#0/1, but
> there are no CPUs associated with NODE#2/3/4/5.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/arm/virt.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 064eac42f7..3286915229 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2497,7 +2497,9 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>   
>   static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>   {
> -    return idx % ms->numa_state->num_nodes;
> +    int64_t socket_id = ms->possible_cpus->cpus[idx].props.socket_id;
> +
> +    return socket_id % ms->numa_state->num_nodes;
>   }
>   
>   static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)


