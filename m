Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4266552E3
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 17:39:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8l3Q-0005DJ-3r; Fri, 23 Dec 2022 11:37:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p8l3N-0005Cn-T8; Fri, 23 Dec 2022 11:37:50 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p8l3L-0004Xk-PQ; Fri, 23 Dec 2022 11:37:49 -0500
Received: from [192.168.106.118]
 (dynamic-095-118-065-151.95.118.pool.telefonica.de [95.118.65.151])
 by csgraf.de (Postfix) with ESMTPSA id B196E6080584;
 Fri, 23 Dec 2022 17:37:44 +0100 (CET)
Message-ID: <94c1de49-c028-3368-f980-a6908049dca9@csgraf.de>
Date: Fri, 23 Dec 2022 17:37:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/2] hw/arm/virt: Consolidate GIC finalize logic
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221223090107.98888-1-agraf@csgraf.de>
 <20221223090107.98888-2-agraf@csgraf.de> <87mt7expy4.fsf@redhat.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <87mt7expy4.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hey Cornelia,

On 23.12.22 13:30, Cornelia Huck wrote:
> On Fri, Dec 23 2022, Alexander Graf <agraf@csgraf.de> wrote:
>
>> Up to now, the finalize_gic_version() code open coded what is essentially
>> a support bitmap match between host/emulation environment and desired
>> target GIC type.
>>
>> This open coding leads to undesirable side effects. For example, a VM with
>> KVM and -smp 10 will automatically choose GICv3 while the same command
>> line with TCG will stay on GICv2 and fail the launch.
>>
>> This patch combines the TCG and KVM matching code paths by making
>> everything a 2 pass process. First, we determine which GIC versions the
>> current environment is able to support, then we go through a single
>> state machine to determine which target GIC mode that means for us.
>>
>> After this patch, the only user noticable changes should be consolidated
>> error messages as well as TCG -M virt supporting -smp > 8 automatically.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>
>> ---
>>
>> v1 -> v2:
>>
>>    - Leave VIRT_GIC_VERSION defines intact, we need them for MADT generation
>>
>> v2 -> v3:
>>
>>    - Fix comment
>>    - Flip kvm-enabled logic for host around
>> ---
>>   hw/arm/virt.c         | 198 ++++++++++++++++++++++--------------------
>>   include/hw/arm/virt.h |  15 ++--
>>   2 files changed, 112 insertions(+), 101 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index ea2413a0ba..6d27f044fe 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1820,6 +1820,84 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>>       }
>>   }
>>   
>> +static VirtGICType finalize_gic_version_do(const char *accel_name,
>> +                                           VirtGICType gic_version,
>> +                                           int gics_supported,
>> +                                           unsigned int max_cpus)
>> +{
>> +    /* Convert host/max/nosel to GIC version number */
>> +    switch (gic_version) {
>> +    case VIRT_GIC_VERSION_HOST:
>> +        if (!kvm_enabled()) {
>> +            error_report("gic-version=host requires KVM");
>> +            exit(1);
>> +        }
>> +
>> +        /* For KVM, gic-version=host means gic-version=max */
>> +        return finalize_gic_version_do(accel_name, VIRT_GIC_VERSION_MAX,
>> +                                       gics_supported, max_cpus);
> I think I'd still rather use /* fallthrough */ here, but let's leave
> that decision to the maintainers.


I originally had a fallthrough here, then looked at the code and 
concluded for myself that I dislike fallthroughs :). They make more 
complicated code flows insanely complicated and are super error prone.

> In any case,
>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>
> [As an aside, we have a QEMU_FALLTHROUGH #define that maps to
> __attribute__((fallthrough)) if available, but unlike the Linux kernel,
> we didn't bother to convert everything to use it in QEMU. Should we?
> Would using the attribute give us some extra benefits?]


IMHO we're be better off just refactoring code in ways that don't 
require fall-throughs. Modern compilers inline functions pretty well, so 
I think there's very little reason for them anymore.

Thanks a lot for the reviews!


Alex



