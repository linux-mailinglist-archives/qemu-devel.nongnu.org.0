Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8177F698A97
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 03:42:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUCj-00064Y-C3; Wed, 15 Feb 2023 21:41:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSUCh-00064O-MH
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:40:59 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSUCe-0001L8-O7
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:40:59 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PHJzb3SWpzJsWb;
 Thu, 16 Feb 2023 10:38:51 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Thu, 16 Feb 2023 10:40:34 +0800
Message-ID: <18356725-8cfb-a691-45ab-306987a7fd7e@huawei.com>
Date: Thu, 16 Feb 2023 10:40:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 10/18] i386: Update APIC ID parsing rule to support
 module level
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
 <20230213093625.158170-11-zhao1.liu@linux.intel.com>
 <c4607aed-a010-21cc-592a-f17be6a64259@huawei.com>
 <Y+z0RxPYGQafkKFz@liuzhao-OptiPlex-7080>
In-Reply-To: <Y+z0RxPYGQafkKFz@liuzhao-OptiPlex-7080>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.257,
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

在 2023/2/15 23:03, Zhao Liu 写道:
> On Wed, Feb 15, 2023 at 07:06:32PM +0800, wangyanan (Y) wrote:
>> Date: Wed, 15 Feb 2023 19:06:32 +0800
>> From: "wangyanan (Y)" <wangyanan55@huawei.com>
>> Subject: Re: [PATCH RESEND 10/18] i386: Update APIC ID parsing rule to
>>   support module level
>>
>> Hi Zhao,
>>
>> 在 2023/2/13 17:36, Zhao Liu 写道:
>>> From: Zhuocheng Ding <zhuocheng.ding@intel.com>
>>>
>>> Add the module level parsing support for APIC ID.
>>>
>>> With this support, now the conversion between X86CPUTopoIDs,
>>> X86CPUTopoInfo and APIC ID is completed.
>> IIUC, contents in patch 6-8 and 10 are all about "Introduce the module-level
>> CPU topology support for x86", why do we need gradually do this with kinds
>> of temporary things instead of warp them into one patch?
> Patch 6 is about CPUX86State.nr_dies, which is independent from
> patch 7, 8, 10.
Ok
>
> Patch 7 (X86CPUTopoInfo.modules_per_die), patch 8 (X86CPUTopoIDs.module_id),
> and patch 10 (APIC ID parsing rule) are related but have their own
> relatively clear little themes, and are gradually completing full
> support for module level in apic id.
>
> Patch 7, 8, 10 can be combined into one big patch. This current
> splitting way is actually designed to make it easier to review...
> But if you think this is not convenient for review, sorry for that,
> and I'm willing to merge them together. ;-)
So comments in patch 7, I think merging 8 and 10 will be clean enough.

Thanks,
Yanan
>
> Thanks,
> Zhao
>
>> Before support
>> for smp.clusters in the CLI for x86, we can ensure that modules_per_dies is
>> always 1 so that the code is save in one diff. Or do I miss something?
>>
>> Thanks,
>> Yanan
>>> Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
>>> Co-developed-by: Zhao Liu <zhao1.liu@intel.com>
>>> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>>> ---
>>>    hw/i386/x86.c              | 19 ++++++++-----------
>>>    include/hw/i386/topology.h | 36 ++++++++++++++++++------------------
>>>    2 files changed, 26 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>>> index b90c6584930a..2a9d080a8e7a 100644
>>> --- a/hw/i386/x86.c
>>> +++ b/hw/i386/x86.c
>>> @@ -311,11 +311,11 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
>>>        /*
>>>         * If APIC ID is not set,
>>> -     * set it based on socket/die/core/thread properties.
>>> +     * set it based on socket/die/cluster/core/thread properties.
>>>         */
>>>        if (cpu->apic_id == UNASSIGNED_APIC_ID) {
>>> -        int max_socket = (ms->smp.max_cpus - 1) /
>>> -                                smp_threads / smp_cores / ms->smp.dies;
>>> +        int max_socket = (ms->smp.max_cpus - 1) / smp_threads / smp_cores /
>>> +                                ms->smp.clusters / ms->smp.dies;
>>>            /*
>>>             * die-id was optional in QEMU 4.0 and older, so keep it optional
>>> @@ -379,15 +379,12 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
>>>            x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
>>> -        /*
>>> -         * TODO: Before APIC ID supports module level parsing, there's no need
>>> -         * to expose module_id info.
>>> -         */
>>>            error_setg(errp,
>>> -            "Invalid CPU [socket: %u, die: %u, core: %u, thread: %u] with"
>>> -            " APIC ID %" PRIu32 ", valid index range 0:%d",
>>> -            topo_ids.pkg_id, topo_ids.die_id, topo_ids.core_id, topo_ids.smt_id,
>>> -            cpu->apic_id, ms->possible_cpus->len - 1);
>>> +            "Invalid CPU [socket: %u, die: %u, module: %u, core: %u, thread: %u]"
>>> +            " with APIC ID %" PRIu32 ", valid index range 0:%d",
>>> +            topo_ids.pkg_id, topo_ids.die_id, topo_ids.module_id,
>>> +            topo_ids.core_id, topo_ids.smt_id, cpu->apic_id,
>>> +            ms->possible_cpus->len - 1);
>>>            return;
>>>        }
>>> diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
>>> index 5de905dc00d3..3cec97b377f2 100644
>>> --- a/include/hw/i386/topology.h
>>> +++ b/include/hw/i386/topology.h
>>> @@ -79,12 +79,13 @@ static inline unsigned apicid_smt_width(X86CPUTopoInfo *topo_info)
>>>    /* Bit width of the Core_ID field */
>>>    static inline unsigned apicid_core_width(X86CPUTopoInfo *topo_info)
>>>    {
>>> -    /*
>>> -     * TODO: Will separate module info from core_width when update
>>> -     * APIC ID with module level.
>>> -     */
>>> -    return apicid_bitwidth_for_count(topo_info->cores_per_module *
>>> -                                     topo_info->modules_per_die);
>>> +    return apicid_bitwidth_for_count(topo_info->cores_per_module);
>>> +}
>>> +
>>> +/* Bit width of the Module_ID (cluster ID) field */
>>> +static inline unsigned apicid_module_width(X86CPUTopoInfo *topo_info)
>>> +{
>>> +    return apicid_bitwidth_for_count(topo_info->modules_per_die);
>>>    }
>>>    /* Bit width of the Die_ID field */
>>> @@ -99,10 +100,16 @@ static inline unsigned apicid_core_offset(X86CPUTopoInfo *topo_info)
>>>        return apicid_smt_width(topo_info);
>>>    }
>>> +/* Bit offset of the Module_ID (cluster ID) field */
>>> +static inline unsigned apicid_module_offset(X86CPUTopoInfo *topo_info)
>>> +{
>>> +    return apicid_core_offset(topo_info) + apicid_core_width(topo_info);
>>> +}
>>> +
>>>    /* Bit offset of the Die_ID field */
>>>    static inline unsigned apicid_die_offset(X86CPUTopoInfo *topo_info)
>>>    {
>>> -    return apicid_core_offset(topo_info) + apicid_core_width(topo_info);
>>> +    return apicid_module_offset(topo_info) + apicid_module_width(topo_info);
>>>    }
>>>    /* Bit offset of the Pkg_ID (socket ID) field */
>>> @@ -121,6 +128,7 @@ static inline apic_id_t x86_apicid_from_topo_ids(X86CPUTopoInfo *topo_info,
>>>    {
>>>        return (topo_ids->pkg_id  << apicid_pkg_offset(topo_info)) |
>>>               (topo_ids->die_id  << apicid_die_offset(topo_info)) |
>>> +           (topo_ids->module_id << apicid_module_offset(topo_info)) |
>>>               (topo_ids->core_id << apicid_core_offset(topo_info)) |
>>>               topo_ids->smt_id;
>>>    }
>>> @@ -138,11 +146,6 @@ static inline void x86_topo_ids_from_idx(X86CPUTopoInfo *topo_info,
>>>        unsigned nr_cores = topo_info->cores_per_module;
>>>        unsigned nr_threads = topo_info->threads_per_core;
>>> -    /*
>>> -     * Currently smp for i386 doesn't support "clusters", modules_per_die is
>>> -     * only 1. Therefore, the module_id generated from the module topology will
>>> -     * not conflict with the module_id generated according to the apicid.
>>> -     */
>>>        topo_ids->pkg_id = cpu_index / (nr_dies * nr_modules *
>>>                           nr_cores * nr_threads);
>>>        topo_ids->die_id = cpu_index / (nr_modules * nr_cores *
>>> @@ -166,12 +169,9 @@ static inline void x86_topo_ids_from_apicid(apic_id_t apicid,
>>>        topo_ids->core_id =
>>>                (apicid >> apicid_core_offset(topo_info)) &
>>>                ~(0xFFFFFFFFUL << apicid_core_width(topo_info));
>>> -    /*
>>> -     * TODO: This is the temporary initialization for topo_ids.module_id to
>>> -     * avoid "maybe-uninitialized" compilation errors. Will remove when APIC
>>> -     * ID supports module level parsing.
>>> -     */
>>> -    topo_ids->module_id = 0;
>>> +    topo_ids->module_id =
>>> +            (apicid >> apicid_module_offset(topo_info)) &
>>> +            ~(0xFFFFFFFFUL << apicid_module_width(topo_info));
>>>        topo_ids->die_id =
>>>                (apicid >> apicid_die_offset(topo_info)) &
>>>                ~(0xFFFFFFFFUL << apicid_die_width(topo_info));


