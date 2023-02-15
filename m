Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343BF69777F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 08:42:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSCQU-0001kA-5E; Wed, 15 Feb 2023 02:42:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSCQS-0001jp-1d
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:42:00 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSCQN-0005Rj-VA
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:41:59 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PGqhv55D8z16NhP;
 Wed, 15 Feb 2023 15:39:27 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Wed, 15 Feb 2023 15:41:47 +0800
Message-ID: <c3d68005-54e0-b8fe-8dc1-5989fe3c7e69@huawei.com>
Date: Wed, 15 Feb 2023 15:41:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 06/18] i386: Introduce module-level cpu topology to
 CPUX86State
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: <qemu-devel@nongnu.org>, Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi
 <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo
 <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Like Xu
 <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-7-zhao1.liu@linux.intel.com>
In-Reply-To: <20230213093625.158170-7-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

在 2023/2/13 17:36, Zhao Liu 写道:
> From: Zhuocheng Ding <zhuocheng.ding@intel.com>
>
> smp command has the "clusters" parameter but x86 hasn't supported that
> level. Though "clusters" was introduced to help define L2 cache topology
> [1], using cluster to define x86's L2 cache topology will cause the
> compatibility problem:
Well, the smp parameter "clusters" isn't destined to define L2 cache
topology. It's actually a CPU topology level concept above cores, in
which the cores may share some resources (the resources can be L2
cache or some others like L3 cache tags, depending on the Archs).

On some ARM64 chips, cores in the same cluster share a L2 and
hold their own L1D/I separately. There are also chips, where cores
in the same cluster have their own L2 & L1D/I cache separately,
and share a L3 cache tag.
> Currently, x86 defaults that the L2 cache is shared in one core, which
> actually implies a default setting "cores per L2 cache is 1" and
> therefore implicitly defaults to having as many L2 caches as cores.
>
> For example (i386 PC machine):
> -smp 16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16 (*)
>
> Considering the topology of the L2 cache, this (*) implicitly means "1
> core per L2 cache" and "2 L2 caches per die".
>
> If we use cluster to configure L2 cache topology with the new default
> setting "clusters per L2 cache is 1", the above semantics will change
> to "2 cores per cluster" and "1 cluster per L2 cache", that is, "2
> cores per L2 cache".
>
> So the same command (*) will cause changes in the L2 cache topology,
> further affecting the performance of the virtual machine.
>
> Therefore, x86 should only treat cluster as a cpu topology level and
> avoid using it to change L2 cache by default for compatibility.
Agree. I think all the smp parameters only indicates the CPU hierarchy,
while the cache layout is much more flexible.
>
> "cluster" in smp is the CPU topology level which is between "core" and
> die.
>
> For x86, the "cluster" in smp is corresponding to the module level [2],
> which is above the core level. So use the "module" other than "cluster"
> in i386 code.
>
> And please note that x86 already has a cpu topology level also named
> "cluster" [2], this level is at the upper level of the package. Here,
> the cluster in x86 cpu topology is completely different from the
> "clusters" as the smp parameter. After the module level is introduced,
> the cluster as the smp parameter will actually refer to the module level
> of x86.
I see. So the reason for use of "module" instead of "cluster" is that there
is already cluster concept above Package in the x86 reference.

Thanks,
Yanan
> [1]: 0d87178 (hw/core/machine: Introduce CPU cluster topology support)
> [2]: SDM, vol.3, ch.9, 9.9.1 Hierarchical Mapping of Shared Resources.
>
> Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> Co-developed-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/i386/x86.c     | 1 +
>   target/i386/cpu.c | 1 +
>   target/i386/cpu.h | 6 ++++++
>   3 files changed, 8 insertions(+)
>
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index eaff4227bd68..ae1bb562d6e2 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -306,6 +306,7 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
>       init_topo_info(&topo_info, x86ms);
>   
>       env->nr_dies = ms->smp.dies;
> +    env->nr_modules = ms->smp.clusters;
>   
>       /*
>        * If APIC ID is not set,
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 4cda84eb96f1..61ec9a7499b8 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6781,6 +6781,7 @@ static void x86_cpu_initfn(Object *obj)
>       CPUX86State *env = &cpu->env;
>   
>       env->nr_dies = 1;
> +    env->nr_modules = 1;
>       cpu_set_cpustate_pointers(cpu);
>   
>       object_property_add(obj, "feature-words", "X86CPUFeatureWordInfo",
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index d4bc19577a21..f3afea765982 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1810,7 +1810,13 @@ typedef struct CPUArchState {
>   
>       TPRAccess tpr_access_type;
>   
> +    /* Number of dies per package. */
>       unsigned nr_dies;
> +    /*
> +     * Number of modules per die. Module level in x86 cpu topology is
> +     * corresponding to smp.clusters.
> +     */
> +    unsigned nr_modules;
>   } CPUX86State;
>   
>   struct kvm_msrs;


