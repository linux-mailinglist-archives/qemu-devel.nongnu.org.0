Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981043D1D1B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 06:43:50 +0200 (CEST)
Received: from localhost ([::1]:35450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6QYn-0004T3-4t
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 00:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6QY4-0003kS-A8
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 00:43:04 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6QY1-0001s9-4N
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 00:43:03 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GVfqn0mKnzZrQ3;
 Thu, 22 Jul 2021 12:39:33 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 12:42:56 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 12:42:55 +0800
Subject: Re: [PATCH for-6.2 v2 04/11] machine: Use the computed parameters to
 calculate omitted cpus
To: Andrew Jones <drjones@redhat.com>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-5-wangyanan55@huawei.com>
 <20210719164203.r3f4qdbw3y3ieghb@gator>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <ddf16035-d99f-9974-aec6-5bd0466205ed@huawei.com>
Date: Thu, 22 Jul 2021 12:42:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210719164203.r3f4qdbw3y3ieghb@gator>
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

On 2021/7/20 0:42, Andrew Jones wrote:
> On Mon, Jul 19, 2021 at 11:20:36AM +0800, Yanan Wang wrote:
>> Currently we directly calculate the omitted cpus based on the already
>> provided parameters. This makes some cmdlines like:
>>    -smp maxcpus=16
>>    -smp sockets=2,maxcpus=16
>>    -smp sockets=2,dies=2,maxcpus=16
>>    -smp sockets=2,cores=4,maxcpus=16
>> not work. We should probably use the computed paramters to calculate
>> cpus when maxcpus is provided while cpus is omitted, which will make
>> above configs start to work.
>>
>> Note: change in this patch won't affect any existing working cmdlines
>> but allows more incomplete configs to be valid.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/core/machine.c | 17 +++++++++--------
>>   1 file changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index c9f15b15a5..668f0a1553 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -767,26 +767,27 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>           return;
>>       }
>>   
>> -    /* compute missing values, prefer sockets over cores over threads */
>>       maxcpus = maxcpus > 0 ? maxcpus : cpus;
>>   
>> -    if (cpus == 0) {
>> -        sockets = sockets > 0 ? sockets : 1;
>> -        cores = cores > 0 ? cores : 1;
>> -        threads = threads > 0 ? threads : 1;
>> -        cpus = sockets * dies * cores * threads;
>> -        maxcpus = maxcpus > 0 ? maxcpus : cpus;
>> -    } else if (sockets == 0) {
>> +    /* compute missing values, prefer sockets over cores over threads */
>> +    if (sockets == 0) {
>>           cores = cores > 0 ? cores : 1;
>>           threads = threads > 0 ? threads : 1;
>>           sockets = maxcpus / (dies * cores * threads);
>> +        sockets = sockets > 0 ? sockets : 1;
>>       } else if (cores == 0) {
>>           threads = threads > 0 ? threads : 1;
>>           cores = maxcpus / (sockets * dies * threads);
>> +        cores = cores > 0 ? cores : 1;
>>       } else if (threads == 0) {
>>           threads = maxcpus / (sockets * dies * cores);
>> +        threads = threads > 0 ? threads : 1;
>>       }
> I didn't think we wanted this rounding which this patch adds back into
> cores and threads and now also sockets.
Firstly, I think we can agree that with or without the rounding, the invalid
configs will still be reported as invalid. So the only difference is in 
the err
message (either report 0 or 1 of a fractional parameter). :)

I added back the rounding because this patch indeed need it, we start
to use the computed parameters to calculate cpus, so we have to ensure
that the computed parameters are at least 1. If both cpus and maxcpus
are omitted (e.g. -smp sockets=16), without the rounding we will get
zeroed cpus and maxcpus, and with the rounding we will get valid result
like "cpus=16,sockets=16,cores=1,threads=1,maxcpus=16".

If a "0" or "1" in the error message doesn't make so much difference as
assumed for the error reporting, I suggest that we probably can keep the
rounding which makes the parser code concise.
>>   
>> +    /* use the computed parameters to calculate the omitted cpus */
>> +    cpus = cpus > 0 ? cpus : sockets * dies * cores * threads;
>> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> It doesn't really matter, but I think I'd rather write this like
>
>   maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
>   cpus = cpus > 0 ? cpus : maxcpus;
Yes, there is no functional difference. But I think maybe we'd better keep
some consistence with the "maxcpus = maxcpus > 0 ? maxcpus : cpus"
at top this function and also with the smp doc in qemu-option.hx i.e.
"If omitted the maximum number of CPUs will be set to match the initial
CPU count" ?

Thanks,
Yanan
.
>> +
>>       if (sockets * dies * cores * threads < cpus) {
>>           g_autofree char *dies_msg = g_strdup_printf(
>>               mc->smp_dies_supported ? " * dies (%u)" : "", dies);
>> -- 
>> 2.19.1
>>
> Thanks,
> drew
>
> .


