Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B5B3D1E35
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 08:25:06 +0200 (CEST)
Received: from localhost ([::1]:39004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6S8n-0007DA-F0
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 02:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6S7w-0006H5-Q6
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:24:12 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6S7t-0002EW-T8
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:24:12 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GVj4S6rdRzZr8Y;
 Thu, 22 Jul 2021 14:20:40 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 14:24:04 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 14:24:03 +0800
Subject: Re: [PATCH for-6.2 v2 10/11] machine: Split out the smp parsing code
To: Andrew Jones <drjones@redhat.com>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-11-wangyanan55@huawei.com>
 <20210719172009.yujvlk4mu2xcl25g@gator>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <d040bdbf-47f5-da25-9aae-8285530a0948@huawei.com>
Date: Thu, 22 Jul 2021 14:24:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210719172009.yujvlk4mu2xcl25g@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard
 Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/20 1:20, Andrew Jones wrote:
> On Mon, Jul 19, 2021 at 11:20:42AM +0800, Yanan Wang wrote:
>> We are going to introduce an unit test for the parser smp_parse()
>> in hw/core/machine.c, but now machine.c is only built in softmmu.
>>
>> In order to solve the build dependency on the smp parsing code and
>> avoid building unrelated stuff for the unit tests, move the related
>> code from machine.c into a new common file, i.e., machine-smp.c.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   MAINTAINERS           |   1 +
>>   hw/core/machine-smp.c | 124 ++++++++++++++++++++++++++++++++++++++++++
>>   hw/core/machine.c     | 109 -------------------------------------
>>   hw/core/meson.build   |   1 +
>>   include/hw/boards.h   |   1 +
>>   5 files changed, 127 insertions(+), 109 deletions(-)
>>   create mode 100644 hw/core/machine-smp.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 9100f9a043..70633e3bf4 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1626,6 +1626,7 @@ F: cpu.c
>>   F: hw/core/cpu.c
>>   F: hw/core/machine-qmp-cmds.c
>>   F: hw/core/machine.c
>> +F: hw/core/machine-smp.c
>>   F: hw/core/null-machine.c
>>   F: hw/core/numa.c
>>   F: hw/cpu/cluster.c
>> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
>> new file mode 100644
>> index 0000000000..6a00cfe44a
>> --- /dev/null
>> +++ b/hw/core/machine-smp.c
>> @@ -0,0 +1,124 @@
>> +/*
>> + * QEMU Machine (related to SMP configuration)
>> + *
>> + * Copyright (C) 2014 Red Hat Inc
>> + *
>> + * Authors:
>> + *   Marcel Apfelbaum <marcel.a@redhat.com>
> This header was obviously copy+pasted without being updated.
Yes, the header was kept unchanged.

But actually I'm not completely sure which field should be updated. :)
Should I add "Copyright (C) 2021, Huawei, Inc." and also the authorship
"Yanan Wang <wangyanan55@huawei.com>" behind the existing ones
or just replace them?
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/boards.h"
>> +#include "qapi/error.h"
>> +
>> +/*
>> + * smp_parse - Generic function used to parse the given SMP configuration
>> + *
>> + * The topology parameters must be specified equal to or great than one
>> + * or just omitted, explicit configuration like "cpus=0" is not allowed.
>> + * The omitted parameters will be calculated based on the provided ones.
>> + *
>> + * maxcpus will default to the value of cpus if omitted and will be used
>> + * to compute the missing sockets/cores/threads. cpus will be calculated
>> + * from the computed parametrs if omitted.
>> + *
>> + * In calculation of omitted arch-netural sockets/cores/threads, we prefer
>> + * sockets over cores over threads before 6.2, while prefer cores over
>> + * sockets over threads since 6.2 on. The arch-specific dies will directly
>> + * default to 1 if omitted.
>> + */
>> +void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>> +{
>> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>> +    unsigned cpus    = config->has_cpus ? config->cpus : 0;
>> +    unsigned sockets = config->has_sockets ? config->sockets : 0;
>> +    unsigned dies    = config->has_dies ? config->dies : 1;
>> +    unsigned cores   = config->has_cores ? config->cores : 0;
>> +    unsigned threads = config->has_threads ? config->threads : 0;
>> +    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>> +
>> +    if ((config->has_cpus && config->cpus == 0) ||
>> +        (config->has_sockets && config->sockets == 0) ||
>> +        (config->has_dies && config->dies == 0) ||
>> +        (config->has_cores && config->cores == 0) ||
>> +        (config->has_threads && config->threads == 0) ||
>> +        (config->has_maxcpus && config->maxcpus == 0)) {
>> +        error_setg(errp, "parameters must be equal to or greater than one"
>> +                   "if provided");
>> +        return;
>> +    }
>> +
>> +    if (!mc->smp_dies_supported && dies > 1) {
>> +        error_setg(errp, "dies not supported by this machine's CPU topology");
>> +        return;
>> +    }
>> +
>> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
>> +
>> +    /* prefer sockets over cores over threads before 6.2 */
>> +    if (mc->smp_prefer_sockets) {
>> +        if (sockets == 0) {
>> +            cores = cores > 0 ? cores : 1;
>> +            threads = threads > 0 ? threads : 1;
>> +            sockets = maxcpus / (dies * cores * threads);
>> +            sockets = sockets > 0 ? sockets : 1;
>> +        } else if (cores == 0) {
>> +            threads = threads > 0 ? threads : 1;
>> +            cores = maxcpus / (sockets * dies * threads);
>> +            cores = cores > 0 ? cores : 1;
>> +        } else if (threads == 0) {
>> +            threads = maxcpus / (sockets * dies * cores);
>> +            threads = threads > 0 ? threads : 1;
>> +        }
>> +    /* prefer cores over sockets over threads since 6.2 */
>> +    } else {
>> +        if (cores == 0) {
>> +            sockets = sockets > 0 ? sockets : 1;
>> +            threads = threads > 0 ? threads : 1;
>> +            cores = maxcpus / (sockets * dies * threads);
>> +            cores = cores > 0 ? cores : 1;
>> +        } else if (sockets == 0) {
>> +            threads = threads > 0 ? threads : 1;
>> +            sockets = maxcpus / (dies * cores * threads);
>> +            sockets = sockets > 0 ? sockets : 1;
>> +        } else if (threads == 0) {
>> +            threads = maxcpus / (sockets * dies * cores);
>> +            threads = threads > 0 ? threads : 1;
>> +        }
>> +    }
>> +
>> +    /* use the computed parameters to calculate the omitted cpus */
>> +    cpus = cpus > 0 ? cpus : sockets * dies * cores * threads;
>> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
>> +
>> +    if (sockets * dies * cores * threads != maxcpus) {
>> +        g_autofree char *dies_msg = g_strdup_printf(
>> +            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
>> +        error_setg(errp, "Invalid CPU topology: "
>> +                   "sockets (%u)%s * cores (%u) * threads (%u) "
>> +                   "!= maxcpus (%u)",
>> +                   sockets, dies_msg, cores, threads,
>> +                   maxcpus);
>> +        return;
>> +    }
>> +
>> +    if (sockets * dies * cores * threads < cpus) {
>> +        g_autofree char *dies_msg = g_strdup_printf(
>> +            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
>> +        error_setg(errp, "Invalid CPU topology: "
>> +                   "sockets (%u)%s * cores (%u) * threads (%u) < "
>> +                   "smp_cpus (%u)",
>> +                   sockets, dies_msg, cores, threads, cpus);
>> +        return;
>> +    }
>> +
>> +    ms->smp.cpus = cpus;
>> +    ms->smp.sockets = sockets;
>> +    ms->smp.dies = dies;
>> +    ms->smp.cores = cores;
>> +    ms->smp.threads = threads;
>> +    ms->smp.max_cpus = maxcpus;
>> +}
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 9d24b67ef3..61be266b6c 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -744,115 +744,6 @@ void machine_set_cpu_numa_node(MachineState *machine,
>>       }
>>   }
>>   
>> -/*
>> - * smp_parse - Generic function used to parse the given SMP configuration
>> - *
>> - * The topology parameters must be specified equal to or great than one
>> - * or just omitted, explicit configuration like "cpus=0" is not allowed.
>> - * The omitted parameters will be calculated based on the provided ones.
>> - *
>> - * maxcpus will default to the value of cpus if omitted and will be used
>> - * to compute the missing sockets/cores/threads. cpus will be calculated
>> - * from the computed parametrs if omitted.
>> - *
>> - * In calculation of omitted arch-netural sockets/cores/threads, we prefer
>> - * sockets over cores over threads before 6.2, while prefer cores over
>> - * sockets over threads since 6.2 on. The arch-specific dies will directly
>> - * default to 1 if omitted.
>> - */
>> -static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>> -{
>> -    MachineClass *mc = MACHINE_GET_CLASS(ms);
>> -    unsigned cpus    = config->has_cpus ? config->cpus : 0;
>> -    unsigned sockets = config->has_sockets ? config->sockets : 0;
>> -    unsigned dies    = config->has_dies ? config->dies : 1;
>> -    unsigned cores   = config->has_cores ? config->cores : 0;
>> -    unsigned threads = config->has_threads ? config->threads : 0;
>> -    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>> -
>> -    if ((config->has_cpus && config->cpus == 0) ||
>> -        (config->has_sockets && config->sockets == 0) ||
>> -        (config->has_dies && config->dies == 0) ||
>> -        (config->has_cores && config->cores == 0) ||
>> -        (config->has_threads && config->threads == 0) ||
>> -        (config->has_maxcpus && config->maxcpus == 0)) {
>> -        error_setg(errp, "parameters must be equal to or greater than one"
>> -                   "if provided");
>> -        return;
>> -    }
>> -
>> -    if (!mc->smp_dies_supported && dies > 1) {
>> -        error_setg(errp, "dies not supported by this machine's CPU topology");
>> -        return;
>> -    }
>> -
>> -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
>> -
>> -    /* prefer sockets over cores over threads before 6.2 */
>> -    if (mc->smp_prefer_sockets) {
>> -        if (sockets == 0) {
>> -            cores = cores > 0 ? cores : 1;
>> -            threads = threads > 0 ? threads : 1;
>> -            sockets = maxcpus / (dies * cores * threads);
>> -            sockets = sockets > 0 ? sockets : 1;
>> -        } else if (cores == 0) {
>> -            threads = threads > 0 ? threads : 1;
>> -            cores = maxcpus / (sockets * dies * threads);
>> -            cores = cores > 0 ? cores : 1;
>> -        } else if (threads == 0) {
>> -            threads = maxcpus / (sockets * dies * cores);
>> -            threads = threads > 0 ? threads : 1;
>> -        }
>> -    /* prefer cores over sockets over threads since 6.2 */
>> -    } else {
>> -        if (cores == 0) {
>> -            sockets = sockets > 0 ? sockets : 1;
>> -            threads = threads > 0 ? threads : 1;
>> -            cores = maxcpus / (sockets * dies * threads);
>> -            cores = cores > 0 ? cores : 1;
>> -        } else if (sockets == 0) {
>> -            threads = threads > 0 ? threads : 1;
>> -            sockets = maxcpus / (dies * cores * threads);
>> -            sockets = sockets > 0 ? sockets : 1;
>> -        } else if (threads == 0) {
>> -            threads = maxcpus / (sockets * dies * cores);
>> -            threads = threads > 0 ? threads : 1;
>> -        }
>> -    }
>> -
>> -    /* use the computed parameters to calculate the omitted cpus */
>> -    cpus = cpus > 0 ? cpus : sockets * dies * cores * threads;
>> -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
>> -
>> -    if (sockets * dies * cores * threads != maxcpus) {
>> -        g_autofree char *dies_msg = g_strdup_printf(
>> -            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
>> -        error_setg(errp, "Invalid CPU topology: "
>> -                   "sockets (%u)%s * cores (%u) * threads (%u) "
>> -                   "!= maxcpus (%u)",
>> -                   sockets, dies_msg, cores, threads,
>> -                   maxcpus);
>> -        return;
>> -    }
>> -
>> -    if (sockets * dies * cores * threads < cpus) {
>> -        g_autofree char *dies_msg = g_strdup_printf(
>> -            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
>> -        error_setg(errp, "Invalid CPU topology: "
>> -                   "sockets (%u)%s * cores (%u) * threads (%u) < "
>> -                   "smp_cpus (%u)",
>> -                   sockets, dies_msg, cores, threads, cpus);
>> -        return;
>> -    }
>> -
>> -    ms->smp.cpus = cpus;
>> -    ms->smp.sockets = sockets;
>> -    ms->smp.dies = dies;
>> -    ms->smp.cores = cores;
>> -    ms->smp.threads = threads;
>> -    ms->smp.max_cpus = maxcpus;
>> -}
>> -
>>   static void machine_get_smp(Object *obj, Visitor *v, const char *name,
>>                               void *opaque, Error **errp)
>>   {
>> diff --git a/hw/core/meson.build b/hw/core/meson.build
>> index 18f44fb7c2..6d727c7742 100644
>> --- a/hw/core/meson.build
>> +++ b/hw/core/meson.build
>> @@ -14,6 +14,7 @@ hwcore_files = files(
>>   )
>>   
>>   common_ss.add(files('cpu-common.c'))
>> +common_ss.add(files('machine-smp.c'))
>>   common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
>>   common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
>>   common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 12ab0f5968..071eec1e74 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -34,6 +34,7 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine);
>>   void machine_set_cpu_numa_node(MachineState *machine,
>>                                  const CpuInstanceProperties *props,
>>                                  Error **errp);
>> +void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp);
>>   
>>   /**
>>    * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
>> -- 
>> 2.19.1
>>
> Otherwise
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
>
Thanks,
Yanan
.


