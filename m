Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFD42A2369
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 04:14:47 +0100 (CET)
Received: from localhost ([::1]:51516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZQIw-0007R5-7V
	for lists+qemu-devel@lfdr.de; Sun, 01 Nov 2020 22:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kZQHy-0006tt-Lq; Sun, 01 Nov 2020 22:13:46 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kZQHv-00054y-G2; Sun, 01 Nov 2020 22:13:46 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPdKT2S6wzkbQL;
 Mon,  2 Nov 2020 11:13:33 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 11:13:25 +0800
Subject: Re: [RFC PATCH v2 07/13] hw/arm/virt-acpi-build: distinguish possible
 and present cpus Message
To: Andrew Jones <drjones@redhat.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
 <20201020131440.1090-8-fangying1@huawei.com>
 <20201029172016.rsgo4stjrkdr7j2r@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <da7abc9a-873f-b968-e366-3bdcedbf81ef@huawei.com>
Date: Mon, 2 Nov 2020 11:13:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20201029172016.rsgo4stjrkdr7j2r@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/01 22:13:36
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/30/2020 1:20 AM, Andrew Jones wrote:
> 
> You need to remove 'Message' from the summary.
> 
> On Tue, Oct 20, 2020 at 09:14:34PM +0800, Ying Fang wrote:
>> When building ACPI tables regarding CPUs we should always build
>> them for the number of possible CPUs, not the number of present
>> CPUs. We then ensure only the present CPUs are enabled.
>>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> I guess my s-o-b is here because this is a rework of
> 
> https://github.com/rhdrjones/qemu/commit/b18d7a889f424b8a8679c43d7f4804fdeeeaf3fd

The s-o-b is given since this one is based on your branch.

> 
> I think it changed enough you could just drop my authorship. A
> based-on comment in the commit message would be more than enough.

Thanks. Will fix it. Hope it won't make you confused.

> 
> Comment on the patch below.
> 
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index a222981737..fae5a26741 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -57,14 +57,18 @@
>>   
>>   #define ARM_SPI_BASE 32
>>   
>> -static void acpi_dsdt_add_cpus(Aml *scope, int cpus)
>> +static void acpi_dsdt_add_cpus(Aml *scope, VirtMachineState *vms)
>>   {
>>       uint16_t i;
>> +    CPUArchIdList *possible_cpus = MACHINE(vms)->possible_cpus;
>>   
>> -    for (i = 0; i < cpus; i++) {
>> +    for (i = 0; i < possible_cpus->len; i++) {
>>           Aml *dev = aml_device("C%.03X", i);
>>           aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
>>           aml_append(dev, aml_name_decl("_UID", aml_int(i)));
>> +        if (possible_cpus->cpus[i].cpu == NULL) {
>> +            aml_append(dev, aml_name_decl("_STA", aml_int(0)));
>> +        }
>>           aml_append(scope, dev);
>>       }
>>   }
>> @@ -470,6 +474,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       const int *irqmap = vms->irqmap;
>>       AcpiMadtGenericDistributor *gicd;
>>       AcpiMadtGenericMsiFrame *gic_msi;
>> +    int possible_cpus = MACHINE(vms)->possible_cpus->len;
>>       int i;
>>   
>>       acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
>> @@ -480,7 +485,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
>>       gicd->version = vms->gic_version;
>>   
>> -    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
>> +    for (i = 0; i < possible_cpus; i++) {
>>           AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
>>                                                              sizeof(*gicc));
>>           ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
>> @@ -495,7 +500,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>           gicc->cpu_interface_number = cpu_to_le32(i);
>>           gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
>>           gicc->uid = cpu_to_le32(i);
>> -        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
>> +        if (i < MACHINE(vms)->smp.cpus) {
> 
> Shouldn't this be

Yes, Stupid mistake. Maybe it was lost when I am doing the rebase.
Will fix that. Thanks for your patience in the reply and review.

Ying Fang.
> 
>          if (possible_cpus->cpus[i].cpu != NULL) {
> 
>> +            gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
>> +        }
>>   
>>           if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
>>               gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>> @@ -599,7 +606,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>        * the RTC ACPI device at all when using UEFI.
>>        */
>>       scope = aml_scope("\\_SB");
>> -    acpi_dsdt_add_cpus(scope, ms->smp.cpus);
>> +    acpi_dsdt_add_cpus(scope, vms);
>>       acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>>                          (irqmap[VIRT_UART] + ARM_SPI_BASE));
>>       if (vmc->acpi_expose_flash) {
>> -- 
>> 2.23.0
>>
>>
> 
> Thanks,
> drew
> 
> .
> 

