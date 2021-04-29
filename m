Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB02036E32D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 04:16:03 +0200 (CEST)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbwDi-0006ix-Fx
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 22:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbwCV-0006C8-Vx; Wed, 28 Apr 2021 22:14:48 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbwCS-0005YY-Of; Wed, 28 Apr 2021 22:14:47 -0400
Received: from dggeml757-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FVzXj1lMLzYbhZ;
 Thu, 29 Apr 2021 10:12:21 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml757-chm.china.huawei.com (10.1.199.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 29 Apr 2021 10:14:38 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 29 Apr 2021 10:14:37 +0800
Subject: Re: [RFC PATCH v2 2/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
To: Andrew Jones <drjones@redhat.com>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
 <20210413083147.34236-3-wangyanan55@huawei.com>
 <20210428103141.5qfhzcqko6hxhxee@gator>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <262dba57-437c-36aa-7a86-8f0c59751887@huawei.com>
Date: Thu, 29 Apr 2021 10:14:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210428103141.5qfhzcqko6hxhxee@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Peter Maydell <peter.maydell@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com, qemu-devel@nongnu.org,
 yangyicong@huawei.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, Igor
 Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

On 2021/4/28 18:31, Andrew Jones wrote:
> On Tue, Apr 13, 2021 at 04:31:45PM +0800, Yanan Wang wrote:
>> There is a separate function virt_smp_parse() in hw/virt/arm.c used
>> to parse cpu topology for the ARM machines. So add parsing of -smp
>> cluster parameter in it, then total number of logical cpus will be
>> calculated like: max_cpus = sockets * clusters * cores * threads.
>>
>> In virt_smp_parse(), the computing logic of missing values prefers
>> cores over sockets over threads. And for compatibility, the value
>> of clusters will be set as default 1 if not explicitly specified.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/arm/virt.c | 32 ++++++++++++++++++--------------
>>   1 file changed, 18 insertions(+), 14 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 57ef961cb5..51797628db 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2639,35 +2639,38 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
>>       if (opts) {
>>           unsigned cpus = qemu_opt_get_number(opts, "cpus", 0);
>>           unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
>> +        unsigned clusters = qemu_opt_get_number(opts, "clusters", 1);
>>           unsigned cores = qemu_opt_get_number(opts, "cores", 0);
>>           unsigned threads = qemu_opt_get_number(opts, "threads", 0);
>> +        VirtMachineState *vms = VIRT_MACHINE(ms);
>>   
>>           /*
>> -         * Compute missing values; prefer cores over sockets and
>> -         * sockets over threads.
>> +         * Compute missing values; prefer cores over sockets and sockets
>> +         * over threads. For compatibility, value of clusters will have
>> +         * been set as default 1 if not explicitly specified.
>>            */
>>           if (cpus == 0 || cores == 0) {
>>               sockets = sockets > 0 ? sockets : 1;
>>               threads = threads > 0 ? threads : 1;
>>               if (cpus == 0) {
>>                   cores = cores > 0 ? cores : 1;
>> -                cpus = cores * threads * sockets;
>> +                cpus = sockets * clusters * cores * threads;
>>               } else {
>>                   ms->smp.max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
>> -                cores = ms->smp.max_cpus / (sockets * threads);
>> +                cores = ms->smp.max_cpus / (sockets * clusters * threads);
>>               }
>>           } else if (sockets == 0) {
>>               threads = threads > 0 ? threads : 1;
>> -            sockets = cpus / (cores * threads);
>> +            sockets = cpus / (clusters * cores * threads);
>>               sockets = sockets > 0 ? sockets : 1;
> If we initialize clusters to zero instead of one and add lines in
> 'cpus == 0 || cores == 0' and 'sockets == 0' like
> 'clusters = clusters > 0 ? clusters : 1' as needed, then I think we can
> add
>
>   } else if (clusters == 0) {
>       threads = threads > 0 ? threads : 1;
>       clusters = cpus / (sockets * cores * thread);
>       clusters = clusters > 0 ? clusters : 1;
>   }
>
> here.
I have thought about this kind of format before, but there is a little bit
difference between these two ways. Let's chose the better and more
reasonable one of the two.

Way A currently in this patch:
If value of clusters is not explicitly specified in -smp command line, 
we assume
that users don't want to support clusters, for compatibility we 
initialized the
value to 1. So that with cmdline "-smp cpus=24, sockets=2, cores=6", we will
parse out the topology description like below:
cpus=24, sockets=2, clusters=1, cores=6, threads=2

Way B that you suggested for this patch:
Whether value of clusters is explicitly specified in -smp command line 
or not,
we assume that clusters are supported and calculate the value. So that with
cmdline "-smp cpus=24, sockets=2, cores=6", we will parse out the topology
description like below:
cpus =24, sockets=2, clusters=2, cores=6, threads=1

But I think maybe we should not assume too much about what users think
through the -smp command line. We should just assume that all levels of
cpu topology are supported and calculate them, and users should be more
careful if they want to get the expected results with not so complete 
cmdline.
If I'm right, then Way B should be better. :)

Thanks,
Yanan
>>           } else if (threads == 0) {
>> -            threads = cpus / (cores * sockets);
>> +            threads = cpus / (sockets * clusters * cores);
>>               threads = threads > 0 ? threads : 1;
>> -        } else if (sockets * cores * threads < cpus) {
>> +        } else if (sockets * clusters * cores * threads < cpus) {
>>               error_report("cpu topology: "
>> -                         "sockets (%u) * cores (%u) * threads (%u) < "
>> -                         "smp_cpus (%u)",
>> -                         sockets, cores, threads, cpus);
>> +                         "sockets (%u) * clusters (%u) * cores (%u) * "
>> +                         "threads (%u) < smp_cpus (%u)",
>> +                         sockets, clusters, cores, threads, cpus);
>>               exit(1);
>>           }
>>   
>> @@ -2678,11 +2681,11 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
>>               exit(1);
>>           }
>>   
>> -        if (sockets * cores * threads != ms->smp.max_cpus) {
>> +        if (sockets * clusters * cores * threads != ms->smp.max_cpus) {
>>               error_report("cpu topology: "
>> -                         "sockets (%u) * cores (%u) * threads (%u)"
>> -                         "!= maxcpus (%u)",
>> -                         sockets, cores, threads,
>> +                         "sockets (%u) * clusters (%u) * cores (%u) * "
>> +                         "threads (%u) != maxcpus (%u)",
>> +                         sockets, clusters, cores, threads,
>>                            ms->smp.max_cpus);
>>               exit(1);
>>           }
>> @@ -2691,6 +2694,7 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
>>           ms->smp.cores = cores;
>>           ms->smp.threads = threads;
>>           ms->smp.sockets = sockets;
>> +        vms->smp_clusters = clusters;
>>       }
>>   
>>       if (ms->smp.cpus > 1) {
>> -- 
>> 2.19.1
>>
> Thanks,
> drew
>
> .

