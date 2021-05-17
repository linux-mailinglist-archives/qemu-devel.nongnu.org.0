Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3B3383A3C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:42:11 +0200 (CEST)
Received: from localhost ([::1]:51852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligJm-0002Uz-Rc
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lig6I-00081G-Fv; Mon, 17 May 2021 12:28:14 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lig6E-0004zq-LA; Mon, 17 May 2021 12:28:14 -0400
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FkPcX0yQNzmVTx;
 Tue, 18 May 2021 00:25:16 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 00:28:00 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 00:27:59 +0800
Subject: Re: [RFC PATCH v3 6/9] hw/arm/virt-acpi-build: Use possible cpus in
 generation of MADT
To: Andrew Jones <drjones@redhat.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-7-wangyanan55@huawei.com>
 <20210517074256.xjqwejbi4mfsvug2@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <ac1b0f17-523d-adb8-c4f4-aa5c93966726@huawei.com>
Date: Tue, 18 May 2021 00:27:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210517074256.xjqwejbi4mfsvug2@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangyanan55@huawei.com; helo=szxga05-in.huawei.com
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

On 2021/5/17 15:42, Andrew Jones wrote:
> On Sun, May 16, 2021 at 06:28:57PM +0800, Yanan Wang wrote:
>> When building ACPI tables regarding CPUs we should always build
>> them for the number of possible CPUs, not the number of present
>> CPUs. So we create gicc nodes in MADT for possible cpus and then
>> ensure only the present CPUs are marked ENABLED. Furthermore, it
>> also needed if we are going to support CPU hotplug in the future.
>>
>> Co-developed-by: Andrew Jones <drjones@redhat.com>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>> Co-developed-by: Ying Fang <fangying1@huawei.com>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 29 +++++++++++++++++++++++++----
>>   1 file changed, 25 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index a2d8e87616..4d64aeb865 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -481,6 +481,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       const int *irqmap = vms->irqmap;
>>       AcpiMadtGenericDistributor *gicd;
>>       AcpiMadtGenericMsiFrame *gic_msi;
>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>> +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(MACHINE(vms));
>> +    bool pmu;
>>       int i;
>>   
>>       acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
>> @@ -491,11 +494,21 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
>>       gicd->version = vms->gic_version;
>>   
>> -    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
>> +    for (i = 0; i < possible_cpus->len; i++) {
>>           AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
>>                                                              sizeof(*gicc));
>>           ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
>>   
>> +        /*
>> +         * PMU should have been either implemented for all CPUs or not,
>> +         * so we only get information from the first CPU, which could
>> +         * represent the others.
>> +         */
>> +        if (i == 0) {
>> +            pmu = arm_feature(&armcpu->env, ARM_FEATURE_PMU);
>> +        }
>> +        assert(!armcpu || arm_feature(&armcpu->env, ARM_FEATURE_PMU) == pmu);
> This doesn't belong in this patch. The commit message doesn't even mention
> it. Also, I don't think we should do this here at all. If we want to
> ensure that all cpus have a pmu when one does, then that should be done
> somewhere like machvirt_init(), not in ACPI generation code which doesn't
> even run for non-ACPI VMs.
Sorry, I should have stated the reason of this change in the commit message.
Actually code change here and mp_affinity part below aim to make it correct
to create gicc entries for all possible cpus.

We only initialize and realize cpuobj for present cpus in machvirt_init,
so that we will get null ARMCPU pointer here for the non-present cpus,
and consequently we won't able to check from "armcpu->env" for the
non-present cpus. The same about "armcpu->mp_affinity".

That's the reason I use PMU configuration of the first cpu to represent the
others. I assume all cpus should have a pmu when one does here since it's
how armcpu->env is initialized. And the assert seems not needed here.

Is there any better alternative way about this?
>> +
>>           gicc->type = ACPI_APIC_GENERIC_CPU_INTERFACE;
>>           gicc->length = sizeof(*gicc);
>>           if (vms->gic_version == 2) {
>> @@ -504,11 +517,19 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>               gicc->gicv_base_address = cpu_to_le64(memmap[VIRT_GIC_VCPU].base);
>>           }
>>           gicc->cpu_interface_number = cpu_to_le32(i);
>> -        gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
>> +        gicc->arm_mpidr = cpu_to_le64(possible_cpus->cpus[i].arch_id);
> Hmm, I think we may have a problem. I don't think there's any guarantee
> that possible_cpus->cpus[i].arch_id == armcpu->mp_affinity, because
> arch_id comes from virt_cpu_mp_affinity(), which is arm_cpu_mp_affinity,
> but with a variable cluster size, however mp_affinity comes from
> arm_cpu_mp_affinity with a set cluster size. Also, when KVM is used,
> then all bets are off as to what mp_affinity is.
Right! Arch_id is initialized by virt_cpu_mp_affinity() in machvirt and then
mp_affinity is initialized by arch_id. Here they two have the same value.

But mp_affinity will be overridden in kvm_arch_init_vcpu() when KVM is
enabled. Here they two won't have the same value.
> We need to add some code that ensures arch_id == mp_affinity,
Can we also update the arch_id at the same time when we change mp_affinity?
> and, for
> now, we should stick with mp_affinity, since, at least when KVM is used,
> that's the correct one.
I also prefer sticking with mp_affinity, if the problem I explain about 
ARMCPU
above can be perfectly solved.
>>           gicc->uid = cpu_to_le32(i);
>> -        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
>>   
>> -        if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
>> +        /*
>> +         * ACPI spec says that LAPIC entry for non present CPU may be
> Why are we talking about LAPICs in a GICC generator?
Ah, sorry. This ought to be GICC entry. Will fix.

Thanks,
Yanan
>> +         * omitted from MADT or it must be marked as disabled. Here we
>> +         * choose to also keep the disabled ones in MADT.
>> +         */
>> +        if (possible_cpus->cpus[i].cpu != NULL) {
>> +            gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
>> +        }
>> +
>> +        if (pmu) {
>>               gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>>           }
>>           if (vms->virt) {
>> -- 
>> 2.19.1
>>
> Thanks,
> drew
>
> .

