Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0235C3D9D9E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:26:08 +0200 (CEST)
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zUd-0002If-3N
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m8zSt-0000cf-AN
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:24:19 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m8zSq-0008PE-Ao
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:24:18 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Gb0l60Bhnzcjlx;
 Thu, 29 Jul 2021 14:20:34 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 14:24:03 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 14:24:01 +0800
Subject: Re: [PATCH for-6.2 v3 01/11] machine: Minor refactor/cleanup for the
 smp parsers
To: Andrew Jones <drjones@redhat.com>
References: <20210728034848.75228-1-wangyanan55@huawei.com>
 <20210728034848.75228-2-wangyanan55@huawei.com>
 <20210728201649.g4gx644sciq2junf@gator>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <1605c460-1baa-18ce-b08d-561cc32b4035@huawei.com>
Date: Thu, 29 Jul 2021 14:24:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210728201649.g4gx644sciq2junf@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.277,
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
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/29 4:16, Andrew Jones wrote:
> On Wed, Jul 28, 2021 at 11:48:38AM +0800, Yanan Wang wrote:
>> To pave the way for the functional improvement in later patches,
>> make some refactor/cleanup for the smp parsers, including using
>> local maxcpus instead of ms->smp.max_cpus in the calculation,
>> defaulting dies to 0 initially like other members, cleanup the
>> sanity check for dies.
>>
>> No functional change intended.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/core/machine.c | 19 +++++++++++--------
>>   hw/i386/pc.c      | 23 ++++++++++++++---------
>>   2 files changed, 25 insertions(+), 17 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index e1533dfc47..ffc0629854 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -747,9 +747,11 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>       unsigned sockets = config->has_sockets ? config->sockets : 0;
>>       unsigned cores   = config->has_cores ? config->cores : 0;
>>       unsigned threads = config->has_threads ? config->threads : 0;
>> +    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>>   
>> -    if (config->has_dies && config->dies != 0 && config->dies != 1) {
>> +    if (config->has_dies && config->dies > 1) {
>>           error_setg(errp, "dies not supported by this machine's CPU topology");
>> +        return;
>>       }
>>   
>>       /* compute missing values, prefer sockets over cores over threads */
>> @@ -760,8 +762,8 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>               sockets = sockets > 0 ? sockets : 1;
>>               cpus = cores * threads * sockets;
>>           } else {
>> -            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
>> -            sockets = ms->smp.max_cpus / (cores * threads);
>> +            maxcpus = maxcpus > 0 ? maxcpus : cpus;
>> +            sockets = maxcpus / (sockets * cores);
> Should be divided by (cores * threads) like before.
Absolutely... Will fix it.

Thanks,
Yanan
> Thanks,
> drew
>
> .


