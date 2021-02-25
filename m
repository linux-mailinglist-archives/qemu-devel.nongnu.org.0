Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00979324F2B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:29:15 +0100 (CET)
Received: from localhost ([::1]:57512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEpV-00046P-W2
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:29:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lFEnH-0002mH-PA
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 06:26:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lFEnF-0003I2-Nx
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 06:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614252412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UvadxrMtPBjg+zJkU9IUMsFImuhNZkDn0Ltc3uCWweE=;
 b=IUnfrDHIrUhETLpxbWGl2xT7JPXb0pXIOL/4zCBUjdZsReaaAUVmZ9aSGuY9o9nP+4rTj+
 +nTeg5sopcvTAyrepGEZGjcqJf8Ia97H9s2LdNy3oJFCbH1VsmlvzHHds5fEt+VHVej5iq
 9o2OLNNJSXQFT0SWAeX1LdDAVB4nDBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-ZyxpTTV7PLix8T5toTTIfw-1; Thu, 25 Feb 2021 06:26:47 -0500
X-MC-Unique: ZyxpTTV7PLix8T5toTTIfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 710AB8030B7;
 Thu, 25 Feb 2021 11:26:45 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF21F5D767;
 Thu, 25 Feb 2021 11:26:39 +0000 (UTC)
Date: Thu, 25 Feb 2021 12:26:36 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH 3/5] hw/arm/virt-acpi-build: distinguish possible and
 present cpus
Message-ID: <20210225112636.qiahzzhjd6jfrzoz@kamzik.brq.redhat.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210225085627.2263-4-fangying1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210225085627.2263-4-fangying1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 25, 2021 at 04:56:25PM +0800, Ying Fang wrote:
> When building ACPI tables regarding CPUs we should always build
> them for the number of possible CPUs, not the number of present
> CPUs. We then ensure only the present CPUs are enabled in madt.
> Furthermore, it is also needed if we are going to support CPU
> hotplug in the future.
> 
> This patch is a rework based on Andrew Jones's contribution at
> https://lists.gnu.org/archive/html/qemu-arm/2018-07/msg00076.html
> 
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 14 ++++++++++----
>  hw/arm/virt.c            |  2 ++
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f9c9df916c..bb91152fe2 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -61,13 +61,16 @@
>  
>  static void acpi_dsdt_add_cpus(Aml *scope, VirtMachineState *vms)
>  {
> -    MachineState *ms = MACHINE(vms);
> +    CPUArchIdList *possible_cpus = MACHINE(vms)->possible_cpus;
>      uint16_t i;
>  
> -    for (i = 0; i < ms->smp.cpus; i++) {
> +    for (i = 0; i < possible_cpus->len; i++) {

Switching from ms->smp.cpus to possible_cpus->len makes some sense
here, since we're going to be using possible_cpus->cpus[] inside
the loop. Otherwise, I'd prefer switching to ms->smp.max_cpus.

>          Aml *dev = aml_device("C%.03X", i);
>          aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
>          aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> +        if (possible_cpus->cpus[i].cpu == NULL) {
> +            aml_append(dev, aml_name_decl("_STA", aml_int(0)));
> +        }
>          aml_append(scope, dev);
>      }
>  }
> @@ -479,6 +482,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      const int *irqmap = vms->irqmap;
>      AcpiMadtGenericDistributor *gicd;
>      AcpiMadtGenericMsiFrame *gic_msi;
> +    CPUArchIdList *possible_cpus = MACHINE(vms)->possible_cpus;
>      int i;
>  
>      acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
> @@ -489,7 +493,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
>      gicd->version = vms->gic_version;
>  
> -    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
> +    for (i = 0; i < possible_cpus->len; i++) {

Same comment as above.

>          AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
>                                                             sizeof(*gicc));
>          ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
> @@ -504,7 +508,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          gicc->cpu_interface_number = cpu_to_le32(i);
>          gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
>          gicc->uid = cpu_to_le32(i);
> -        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
> +        if (possible_cpus->cpus[i].cpu != NULL) {
> +            gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
> +        }
>  
>          if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
>              gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index c133b342b8..75659502e2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2047,6 +2047,8 @@ static void machvirt_init(MachineState *machine)
>  
>          qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
>          object_unref(cpuobj);
> +        /* Initialize cpu member here since cpu hotplug is not supported yet */
> +        machine->possible_cpus->cpus[n].cpu = cpuobj;

This feels like we're violating a possible_cpus abstraction. Igor?
Also, it's using cpuobj after unrefing it.

>      }
>      fdt_add_timer_nodes(vms);
>      fdt_add_cpu_nodes(vms);
> -- 
> 2.23.0
> 
> 

Thanks,
drew


