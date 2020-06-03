Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A251EC667
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 03:05:56 +0200 (CEST)
Received: from localhost ([::1]:40652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgHqs-0000iX-Ro
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 21:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1jgHq8-0008WK-EY; Tue, 02 Jun 2020 21:05:08 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:59168 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1jgHq6-0002I6-LQ; Tue, 02 Jun 2020 21:05:08 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D7EBB57D5887912644D7;
 Wed,  3 Jun 2020 09:04:52 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.233) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 3 Jun 2020 09:04:42 +0800
Subject: Re: [PATCH] target/arm/cpu: adjust virtual time for cortex series cpu
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200530092204.1746-1-fangying1@huawei.com>
 <CAFEAcA91gsTpkeH6SVPoGKDFOgCJVxV=wvBOT57eagcYeMiarQ@mail.gmail.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <27efd94c-88fd-1166-fb94-fd3faa1d2e68@huawei.com>
Date: Wed, 3 Jun 2020 09:04:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA91gsTpkeH6SVPoGKDFOgCJVxV=wvBOT57eagcYeMiarQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.233]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 21:04:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, wu.wubin@huawei.com,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/6/1 20:41, Peter Maydell wrote:
> On Sat, 30 May 2020 at 10:22, Ying Fang <fangying1@huawei.com> wrote:
>>
>> Virtual time adjustment was implemented for virt-5.0 machine type,
>> but the cpu property was enabled only for host-passthrough and
>> max cpu model. Let's add it for arm cortex series cpu which has
>> the gernic timer feature enabled.
>>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 32bec156f2..a564141b22 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1973,6 +1973,9 @@ static void cortex_a7_initfn(Object *obj)
>>       cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
>>       cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
>>       define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
>> +    if (kvm_enabled()) {
>> +        kvm_arm_add_vcpu_properties(obj);
>> +    }
>>   }
> 
> If we have the same bit of code in all these initfns,
> that suggests we should probably actually be doing this
> in some more generic place conditional on some cpu feature
> or other test. The commit message suggests we should add
> this property for every CPU which is using KVM and has
> the generic timers, in which case we could perhaps
> have the call to kvm_arm_add_vcpu_properties moved to
> arm_cpu_post_init(), and then have the kvm_arm_add_vcpu_properties
> function check the ARM_FEATURE_GENERIC_TIMER flag to see
> whether to add the property or not.
Thanks for pointing it out, to put kvm_arm_add_vcpu_properties into
arm_cpu_post_init is much better.

I will send a V2.
> 
> thanks
> -- PMM
> 
> .
> 
Thanks
Ying.


