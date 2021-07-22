Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726193D1EF7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:25:00 +0200 (CEST)
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6T4l-0004gq-Hw
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6Sye-0002P2-5A
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:18:40 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6Syb-0001cQ-Il
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:18:39 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GVkHJ0yJxzcgx0;
 Thu, 22 Jul 2021 15:15:08 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 15:18:31 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 15:18:30 +0800
Subject: Re: [PATCH for-6.2 v2 02/11] machine: Make smp_parse generic enough
 for all arches
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-3-wangyanan55@huawei.com> <YPWt+o/kl60Db8kT@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <e0c7e165-0cdd-cc21-7eec-f017679dc6d4@huawei.com>
Date: Thu, 22 Jul 2021 15:18:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YPWt+o/kl60Db8kT@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/20 0:53, Daniel P. Berrangé wrote:
> On Mon, Jul 19, 2021 at 11:20:34AM +0800, Yanan Wang wrote:
>> Currently the only difference between smp_parse and pc_smp_parse
>> is the support of multi-dies and the related error reporting code.
>> With an arch compat variable "bool smp_dies_supported", we can
>> easily make smp_parse generic enough for all arches and the PC
>> specific one can be removed.
>>
>> Making smp_parse() generic enough can reduce code duplication and
>> ease the code maintenance, and also allows extending the topology
>> with more arch specific members (e.g., clusters) in the future.
>>
>> No functional change intended.
>>
>> Suggested-by: Andrew Jones <drjones@redhat.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/core/machine.c   | 28 ++++++++++-------
>>   hw/i386/pc.c        | 76 +--------------------------------------------
>>   include/hw/boards.h |  1 +
>>   3 files changed, 19 insertions(+), 86 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index d73daa10f4..ed6712e964 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -743,6 +743,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
>>   
>>   static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>   {
>> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>>       unsigned cpus    = config->has_cpus ? config->cpus : 0;
>>       unsigned sockets = config->has_sockets ? config->sockets : 0;
>>       unsigned dies    = config->has_dies ? config->dies : 1;
>> @@ -761,7 +762,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>           return;
>>       }
>>   
>> -    if (dies > 1) {
>> +    if (!mc->smp_dies_supported && dies > 1) {
>>           error_setg(errp, "dies not supported by this machine's CPU topology");
>>           return;
>>       }
>> @@ -772,23 +773,25 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>           threads = threads > 0 ? threads : 1;
>>           if (cpus == 0) {
>>               sockets = sockets > 0 ? sockets : 1;
>> -            cpus = cores * threads * sockets;
>> +            cpus = sockets * dies * cores * threads;
>>           } else {
>>               maxcpus = maxcpus > 0 ? maxcpus : cpus;
>> -            sockets = maxcpus / (cores * threads);
>> +            sockets = maxcpus / (dies * cores * threads);
>>           }
>>       } else if (cores == 0) {
>>           threads = threads > 0 ? threads : 1;
>> -        cores = cpus / (sockets * threads);
>> +        cores = cpus / (sockets * dies * threads);
>>           cores = cores > 0 ? cores : 1;
>>       } else if (threads == 0) {
>> -        threads = cpus / (cores * sockets);
>> +        threads = cpus / (sockets * dies * cores);
>>           threads = threads > 0 ? threads : 1;
>> -    } else if (sockets * cores * threads < cpus) {
>> +    } else if (sockets * dies * cores * threads < cpus) {
>> +        g_autofree char *dies_msg = g_strdup_printf(
>> +            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
>>           error_setg(errp, "cpu topology: "
>> -                   "sockets (%u) * cores (%u) * threads (%u) < "
>> +                   "sockets (%u)%s * cores (%u) * threads (%u) < "
>>                      "smp_cpus (%u)",
>> -                   sockets, cores, threads, cpus);
>> +                   sockets, dies_msg, cores, threads, cpus);
> Since we're allowing dies=1 (but not greater), I'm not convinced we
> need the conditionally built error message, and could just include
> "* dies" all the time.
>
> If we do want it to be conditionally different though, I'd just
> sugest calling error_setg twice. Although this duplicates stuff,
> it'll be clearer to read which I think is a net win.
>
The duplicates may increase quickly if more arch specific members
are introduced, I think the conditional error reporting may still be
necessary, but should be more clearer than current approach. :)

Thanks,
Yanan
.


