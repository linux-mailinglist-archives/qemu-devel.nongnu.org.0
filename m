Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD11C386FE1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 04:18:06 +0200 (CEST)
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lipJ7-0001MD-E9
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 22:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lipHQ-0000K6-76; Mon, 17 May 2021 22:16:20 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lipHL-0007Ti-9f; Mon, 17 May 2021 22:16:19 -0400
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FkffF5r50zmhXH;
 Tue, 18 May 2021 10:12:37 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 10:16:06 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 10:16:05 +0800
Subject: Re: [RFC PATCH v3 9/9] hw/arm/virt: Add separate -smp parsing
 function for ARM machines
To: Andrew Jones <drjones@redhat.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-10-wangyanan55@huawei.com>
 <20210517082431.lz7zmtpcnezbmo6t@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <23d800e1-f408-74f9-7c04-0dfc637df74a@huawei.com>
Date: Tue, 18 May 2021 10:16:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210517082431.lz7zmtpcnezbmo6t@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangyanan55@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

On 2021/5/17 16:24, Andrew Jones wrote:
> On Sun, May 16, 2021 at 06:29:00PM +0800, Yanan Wang wrote:
>> The cpu hierarchy topology information parsed out from QEMU -smp
>> command line will be exposed to guest kernel through ACPI and DT
>> since machine type 6.1, so we will expect more detailed topology
>> descriptions and will be more strict with the -smp cmdlines when
>> parsing them.
>>
>> Compared with the default smp_parse() where all missing values
>> are automatically calculated in turn, there is some difference
>> in ARM specific virt_smp_parse(). The parsing logic is like:
>> At least one of cpus or maxcpus must be provided. Threads will
>> default to 1 if not provided (assume not support SMT). Sockets
>> and cores must be either both provided or both not.
>>
>> Note, if neither sockets nor cores are provided, we calculate
>> all the missing values like smp_parse() did before, but will
>> disable support of exposing these auto-populated descriptions
>> to guest. Then guest will populate its topology by default.
>>
>> Suggested-by: Andrew Jones <drjones@redhat.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/arm/virt.c   | 95 +++++++++++++++++++++++++++++++++++++++++++++++++
>>   qemu-options.hx |  4 +++
>>   2 files changed, 99 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 50e324975f..44e990e3be 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -76,6 +76,8 @@
>>   #include "hw/virtio/virtio-iommu.h"
>>   #include "hw/char/pl011.h"
>>   #include "qemu/guest-random.h"
>> +#include "qapi/qmp/qerror.h"
>> +#include "sysemu/replay.h"
>>   
>>   #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>       static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>> @@ -2627,6 +2629,98 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>>       return fixed_ipa ? 0 : requested_pa_size;
>>   }
>>   
>> +/*
>> + * virt_smp_parse - Used to parse -smp command line for ARM machines.
>> + *
>> + * Compared with the default smp_parse where all the missing values
>> + * are automatically calculated in turn, in this function, we expect
>> + * more detailed topology information provided and are more strict
>> + * with the -smp cmdlines when parsing them.
>> + *
>> + * We require that at least one of cpus or maxcpus must be provided.
>> + * Threads will default to 1 if not provided. Sockets and cores must
>> + * be either both provided or both not.
>> + *
>> + * Note, if neither sockets nor cores are specified, we will calculate
>> + * all the missing values just like smp_parse() does, but will disable
>> + * exposure of cpu topology descriptions to guest.
>> + */
>> +static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
>> +{
>> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(ms);
>> +
>> +    if (opts) {
>> +        unsigned cpus = qemu_opt_get_number(opts, "cpus", 0);
>> +        unsigned maxcpus = qemu_opt_get_number(opts, "maxcpus", 0);
>> +        unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
>> +        unsigned cores = qemu_opt_get_number(opts, "cores", 0);
>> +        unsigned threads = qemu_opt_get_number(opts, "threads", 0);
>> +
>> +        /* Default threads to 1 if not provided */
>> +        threads = threads > 0 ? threads : 1;
> Can't do this yet, need to do it later, because...
>
>> +
>> +        if (cpus == 0 && maxcpus == 0) {
>> +            error_report("at least one of cpus or maxcpus must be provided");
>> +            exit(1);
>> +        }
>> +
>> +        if (sockets == 0 && cores == 0) {
>> +            /* Disable exposure of topology descriptions to guest */
>> +            vmc->no_cpu_topology = true;
> ...we should do ensure threads == 0 here, otherwise provide another error
> message.
>
>> +
>> +            /* Compute missing values, prefer sockets over cores */
>> +            cores = 1;
> Now threads = 1 is good here.
>
>> +            if (cpus == 0) {
>> +                sockets = 1;
>> +                cpus = sockets * cores * threads;
> This should be
>
>    cpus = maxcpus;
>    sockets = cpus;
>
>> +            } else {
>> +                maxcpus = maxcpus > 0 ? maxcpus : cpus;
>> +                sockets = maxcpus / (cores * threads);
> We know cores and threads should both be 1 here, so just do
>
>   sockets = maxcpus;
>
>> +            }
>> +        } else if (sockets > 0 && cores > 0) {
> Now
>          threads = threads > 0 ? threads : 1;
>
> is good here.
>
>> +            cpus = cpus > 0 ? cpus : sockets * cores * threads;
>> +            maxcpus = maxcpus > 0 ? maxcpus : cpus;
> We should calculate maxcpus first based on the topology,
>
>    maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
>    cpus = cpus > 0 ? cpus : maxcpus;
 From comments above, now I see something was missed by me in
previous discussion in v3. We won't allow that threads is provided
but sockets and cores are not. And cpus should default to maxcpus
if it is not explicitly specified.

I will fix as above suggests.
> Please do comprehensive testing to ensure everything works as it
> should. You can drop this function into a standalone executable
> and run it for all possible inputs, maxcpus=0, maxcpus < cpus, maxcpus ==
> cpus, maxcpus > cpus, sockets = 0, sockets < cpus, sockets == cpus, etc.
Of course, these tests are definitely necessary, will do it after the 
rework.

Thnaks,
Yanan
>> +        } else {
>> +            error_report("sockets and cores must be both provided "
>> +                         "or both not");
>> +            exit(1);
>> +        }
>> +
>> +        if (maxcpus < cpus) {
>> +            error_report("maxcpus must be equal to or greater than smp");
>> +            exit(1);
>> +        }
>> +
>> +        if (sockets * cores * threads < cpus) {
>> +            error_report("cpu topology: "
>> +                         "sockets (%u) * cores (%u) * threads (%u) < "
>> +                         "smp_cpus (%u)",
>> +                         sockets, cores, threads, cpus);
>> +            exit(1);
>> +        }
>> +
>> +        if (sockets * cores * threads != maxcpus) {
>> +            error_report("cpu topology: "
>> +                         "sockets (%u) * cores (%u) * threads (%u) "
>> +                         "!= maxcpus (%u)",
>> +                         sockets, cores, threads, maxcpus);
>> +            exit(1);
>> +        }
>> +
>> +        ms->smp.cpus = cpus;
>> +        ms->smp.max_cpus = maxcpus;
>> +        ms->smp.sockets = sockets;
>> +        ms->smp.cores = cores;
>> +        ms->smp.threads = threads;
>> +    }
>> +
>> +    if (ms->smp.cpus > 1) {
>> +        Error *blocker = NULL;
>> +        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
>> +        replay_add_blocker(blocker);
>> +    }
>> +}
>> +
>>   static void virt_machine_class_init(ObjectClass *oc, void *data)
>>   {
>>       MachineClass *mc = MACHINE_CLASS(oc);
>> @@ -2652,6 +2746,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>       mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>>       mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
>> +    mc->smp_parse = virt_smp_parse;
>>       mc->kvm_type = virt_kvm_type;
>>       assert(!mc->get_hotplug_handler);
>>       mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 635dc8a624..bd97086c21 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -203,6 +203,10 @@ SRST
>>       computed. If any on the three values is given, the total number of
>>       CPUs n can be omitted. maxcpus specifies the maximum number of
>>       hotpluggable CPUs.
>> +
>> +    For the ARM target, at least one of cpus or maxcpus must be provided.
>> +    Threads will default to 1 if not provided. Sockets and cores must be
>> +    either both provided or both not.
>>   ERST
>>   
>>   DEF("numa", HAS_ARG, QEMU_OPTION_numa,
>> -- 
>> 2.19.1
>>
> .

