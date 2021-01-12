Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44082F31B1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:29:46 +0100 (CET)
Received: from localhost ([::1]:56644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJk1-0006q7-CD
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kzJhj-0005ke-Kp; Tue, 12 Jan 2021 08:27:23 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kzJgu-0007dj-07; Tue, 12 Jan 2021 08:27:23 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DFWXH2sT5z15s2h;
 Tue, 12 Jan 2021 21:25:03 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Tue, 12 Jan 2021 21:25:56 +0800
Subject: Re: [RFC PATCH v3 10/13] target/arm/cpu: Add cpu cache description
 for arm
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201109030452.2197-1-fangying1@huawei.com>
 <20201109030452.2197-11-fangying1@huawei.com>
 <CAFEAcA-CuagYtA_9c7KrkvoBJqKnUNnT7M=C_MN1EnU4k1kAxQ@mail.gmail.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <41e9d848-c478-8873-769b-e1cc85253db7@huawei.com>
Date: Tue, 12 Jan 2021 21:25:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-CuagYtA_9c7KrkvoBJqKnUNnT7M=C_MN1EnU4k1kAxQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Andrew Jones <drjones@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, salil.mehta@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/30/2020 9:00 PM, Peter Maydell wrote:
> On Mon, 9 Nov 2020 at 03:05, Ying Fang <fangying1@huawei.com> wrote:
>>
>> Add the CPUCacheInfo structure to hold cpu cache information for ARM cpus.
>> A classic three level cache topology is used here. The default cache
>> capacity is given and userspace can overwrite these values.
>>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> ---
>>   target/arm/cpu.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   target/arm/cpu.h | 27 +++++++++++++++++++++++++++
>>   2 files changed, 69 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 056319859f..f1bac7452c 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -27,6 +27,7 @@
>>   #include "qapi/visitor.h"
>>   #include "cpu.h"
>>   #include "internals.h"
>> +#include "qemu/units.h"
>>   #include "exec/exec-all.h"
>>   #include "hw/qdev-properties.h"
>>   #if !defined(CONFIG_USER_ONLY)
>> @@ -997,6 +998,45 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
>>       return (Aff1 << ARM_AFF1_SHIFT) | Aff0;
>>   }
>>
>> +static CPUCaches default_cache_info = {
>> +    .l1d_cache = &(CPUCacheInfo) {
>> +    .type = DATA_CACHE,
>> +        .level = 1,
>> +        .size = 64 * KiB,
>> +        .line_size = 64,
>> +        .associativity = 4,
>> +        .sets = 256,
>> +        .attributes = 0x02,
>> +    },
> 
> Would it be possible to populate this structure from the
> CLIDR/CCSIDR ID register values, rather than having to
> specify the same thing in two places?

Sorry I missed this reply.

I had tried to fetch CLIDR/CCSID ID register values of host cpu
from KVM, however I did not get the value expected. May I made
some mistakes in KVM side.

Thanks for your guide, I'll try to populate them again.

> 
> thanks
> -- PMM
> .
> 

Thanks.
Ying.

