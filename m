Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EAB387852
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:02:35 +0200 (CEST)
Received: from localhost ([::1]:52652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liyQk-0007ma-11
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liyMw-00069g-Fo; Tue, 18 May 2021 07:58:39 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liyMp-00066z-EV; Tue, 18 May 2021 07:58:38 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FkvZx4X4vzsRnJ;
 Tue, 18 May 2021 19:55:37 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 19:58:22 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 19:58:21 +0800
Subject: Re: [RFC PATCH v3 6/9] hw/arm/virt-acpi-build: Use possible cpus in
 generation of MADT
To: Salil Mehta <salil.mehta@huawei.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-7-wangyanan55@huawei.com>
 <6d3c643dc9174f8199ea9422f9e995e5@huawei.com>
 <14284387-dcf4-cfb2-127c-5d1e1d0ecb79@huawei.com>
 <82d006dab8b64e658f205246abc850c2@huawei.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <d99a32e6-99f7-6977-5f74-0d9f9a06b5ea@huawei.com>
Date: Tue, 18 May 2021 19:58:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <82d006dab8b64e658f205246abc850c2@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
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
Cc: "Song Bao Hua \(Barry Song\)" <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 yangyicong <yangyicong@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Alistair
 Francis <alistair.francis@wdc.com>, "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui <yuzenghui@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/5/18 14:47, Salil Mehta wrote:
>> From: wangyanan (Y)
>> Sent: Tuesday, May 18, 2021 6:03 AM
>>
>> Hi Salil,
>>
>> On 2021/5/18 1:07, Salil Mehta wrote:
>>>> From: Qemu-arm
>> [mailto:qemu-arm-bounces+salil.mehta=huawei.com@nongnu.org]
>>>> On Behalf Of Yanan Wang
>>>> Sent: Sunday, May 16, 2021 11:29 AM
>>>> To: Peter Maydell <peter.maydell@linaro.org>; Andrew Jones
>>>> <drjones@redhat.com>; Michael S . Tsirkin <mst@redhat.com>; Igor Mammedov
>>>> <imammedo@redhat.com>; Shannon Zhao <shannon.zhaosl@gmail.com>; Alistair
>>>> Francis <alistair.francis@wdc.com>; David Gibson
>>>> <david@gibson.dropbear.id.au>; qemu-devel@nongnu.org; qemu-arm@nongnu.org
>>>> Cc: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>; zhukeqian
>>>> <zhukeqian1@huawei.com>; yangyicong <yangyicong@huawei.com>; Zengtao (B)
>>>> <prime.zeng@hisilicon.com>; Wanghaibin (D) <wanghaibin.wang@huawei.com>;
>>>> yuzenghui <yuzenghui@huawei.com>; Paolo Bonzini <pbonzini@redhat.com>;
>>>> Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> Subject: [RFC PATCH v3 6/9] hw/arm/virt-acpi-build: Use possible cpus in
>>>> generation of MADT
>>>>
>>>> When building ACPI tables regarding CPUs we should always build
>>>> them for the number of possible CPUs, not the number of present
>>>> CPUs. So we create gicc nodes in MADT for possible cpus and then
>>>> ensure only the present CPUs are marked ENABLED. Furthermore, it
>>>> also needed if we are going to support CPU hotplug in the future.
>>> Hi Yanan,
>>> Yes, these changes are part of the QEMU patch-set I floated last year.
>>>
>>> Link: https://www.mail-archive.com/qemu-devel@nongnu.org/msg712018.html
>> Yes, I noticed this. Thanks!
>>> Perhaps I am missing something, but how this patch is related to the vcpu
>>> topology support?
>> No related actually. But this patch together with patch 5 aim to provide
>> complete information (all cpus including enabled and the others) to guest,
>> which will be more consistent with requirement in ACPI spec.
>
> Well, if it is not related to the cpu topology support then this and other
> similar patches included with the same line of thought should not be
> part of this patch-set.
>
> I am already working with ARM folks in this regard.
Hi Salil,

I'm planning to pack this part into a separate patchset and may repost
it another time, given that there are still some issues to solve.

Thanks,
Yanan
> Thanks
>
>> We don't consider cpu hotplug at all in this patch, but it indeed pave way
>> for cpu hotplug in the future.
>>
>> Thanks,
>> Yanan
>>> Thanks
>>>
>>>> Co-developed-by: Andrew Jones <drjones@redhat.com>
>>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>>> Co-developed-by: Ying Fang <fangying1@huawei.com>
>>>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>>>> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
>>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>>> ---
>>>>    hw/arm/virt-acpi-build.c | 29 +++++++++++++++++++++++++----
>>>>    1 file changed, 25 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>> index a2d8e87616..4d64aeb865 100644
>>>> --- a/hw/arm/virt-acpi-build.c
>>>> +++ b/hw/arm/virt-acpi-build.c
>>>> @@ -481,6 +481,9 @@ build_madt(GArray *table_data, BIOSLinker *linker,
>>>> VirtMachineState *vms)
>>>>        const int *irqmap = vms->irqmap;
>>>>        AcpiMadtGenericDistributor *gicd;
>>>>        AcpiMadtGenericMsiFrame *gic_msi;
>>>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>>> +    const CPUArchIdList *possible_cpus =
>>>> mc->possible_cpu_arch_ids(MACHINE(vms));
>>>> +    bool pmu;
>>>>        int i;
>>>>
>>>>        acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
>>>> @@ -491,11 +494,21 @@ build_madt(GArray *table_data, BIOSLinker *linker,
>>>> VirtMachineState *vms)
>>>>        gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
>>>>        gicd->version = vms->gic_version;
>>>>
>>>> -    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
>>>> +    for (i = 0; i < possible_cpus->len; i++) {
>>>>            AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
>>>>                                                               sizeof(*gicc));
>>>>            ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
>>>>
>>>> +        /*
>>>> +         * PMU should have been either implemented for all CPUs or not,
>>>> +         * so we only get information from the first CPU, which could
>>>> +         * represent the others.
>>>> +         */
>>>> +        if (i == 0) {
>>>> +            pmu = arm_feature(&armcpu->env, ARM_FEATURE_PMU);
>>>> +        }
>>>> +        assert(!armcpu || arm_feature(&armcpu->env, ARM_FEATURE_PMU) ==
>> pmu);
>>>> +
>>>>            gicc->type = ACPI_APIC_GENERIC_CPU_INTERFACE;
>>>>            gicc->length = sizeof(*gicc);
>>>>            if (vms->gic_version == 2) {
>>>> @@ -504,11 +517,19 @@ build_madt(GArray *table_data, BIOSLinker *linker,
>>>> VirtMachineState *vms)
>>>>                gicc->gicv_base_address =
>>>> cpu_to_le64(memmap[VIRT_GIC_VCPU].base);
>>>>            }
>>>>            gicc->cpu_interface_number = cpu_to_le32(i);
>>>> -        gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
>>>> +        gicc->arm_mpidr = cpu_to_le64(possible_cpus->cpus[i].arch_id);
>>>>            gicc->uid = cpu_to_le32(i);
>>>> -        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
>>>>
>>>> -        if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
>>>> +        /*
>>>> +         * ACPI spec says that LAPIC entry for non present CPU may be
>>>> +         * omitted from MADT or it must be marked as disabled. Here we
>>>> +         * choose to also keep the disabled ones in MADT.
>>>> +         */
>>>> +        if (possible_cpus->cpus[i].cpu != NULL) {
>>>> +            gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
>>>> +        }
>>>> +
>>>> +        if (pmu) {
>>>>                gicc->performance_interrupt =
>> cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>>>>            }
>>>>            if (vms->virt) {
>>>> --
>>>> 2.19.1
>>>>
>>> .

