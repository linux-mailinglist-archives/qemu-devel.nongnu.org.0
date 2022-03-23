Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A4B4E4D56
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 08:29:21 +0100 (CET)
Received: from localhost ([::1]:40102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWvQm-0006sz-UR
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 03:29:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWvNK-0004PP-KV
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 03:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWvNI-0000w1-TJ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 03:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648020344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Ul8oWuvUeDzNfHlnwEYmiKJujaeZ1hRs0XrndxwX2o=;
 b=D/R9Dh8oi4FfpSbD31vhr2QLLgHYsjv8TNzWrgas122gDmeOrlwjy2gOMQgAE8I6GbiKWg
 2wHNN6BR2fxr+izxzffNksBsEACooy3GWEf3dyaupXis3lQ1F5QFhjgnthDX49KFbB9asl
 akBft1xPdqTfUXEDLQBgYE5WPNROOV0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-fd0OouEMMs6H0iyM-dk5Ow-1; Wed, 23 Mar 2022 03:25:40 -0400
X-MC-Unique: fd0OouEMMs6H0iyM-dk5Ow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63CFA185A79C;
 Wed, 23 Mar 2022 07:25:40 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-33.pek2.redhat.com [10.72.12.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7C6B2166B2D;
 Wed, 23 Mar 2022 07:25:35 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 4/4] hw/arm/virt: Unify ACPI processor ID in MADT and SRAT
 table
Date: Wed, 23 Mar 2022 15:24:38 +0800
Message-Id: <20220323072438.71815-5-gshan@redhat.com>
In-Reply-To: <20220323072438.71815-1-gshan@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The value of the following field has been used in ACPI PPTT table
to identify the corresponding processor. This takes the same field
as the ACPI processor ID in MADT and SRAT tables.

  ms->possible_cpus->cpus[i].props.thread_id

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt-acpi-build.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 449fab0080..7fedb56eea 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -534,13 +534,16 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     for (i = 0; i < cpu_list->len; ++i) {
         uint32_t nodeid = cpu_list->cpus[i].props.node_id;
+        uint32_t thread_id = cpu_list->cpus[i].props.thread_id;
+
         /*
          * 5.2.16.4 GICC Affinity Structure
          */
         build_append_int_noprefix(table_data, 3, 1);      /* Type */
         build_append_int_noprefix(table_data, 18, 1);     /* Length */
         build_append_int_noprefix(table_data, nodeid, 4); /* Proximity Domain */
-        build_append_int_noprefix(table_data, i, 4); /* ACPI Processor UID */
+        build_append_int_noprefix(table_data,
+                                  thread_id, 4); /* ACPI Processor UID */
         /* Flags, Table 5-76 */
         build_append_int_noprefix(table_data, 1 /* Enabled */, 4);
         build_append_int_noprefix(table_data, 0, 4); /* Clock Domain */
@@ -704,6 +707,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     int i;
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+    MachineState *ms = MACHINE(vms);
     const MemMapEntry *memmap = vms->memmap;
     AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
@@ -725,8 +729,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, vms->gic_version, 1);
     build_append_int_noprefix(table_data, 0, 3);   /* Reserved */
 
-    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
+    for (i = 0; i < ms->smp.cpus; i++) {
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
+        uint32_t thread_id = ms->possible_cpus->cpus[i].props.thread_id;
         uint64_t physical_base_address = 0, gich = 0, gicv = 0;
         uint32_t vgic_interrupt = vms->virt ? PPI(ARCH_GIC_MAINT_IRQ) : 0;
         uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
@@ -743,7 +748,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, 76, 1);   /* Length */
         build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
         build_append_int_noprefix(table_data, i, 4);    /* GIC ID */
-        build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
+        build_append_int_noprefix(table_data,
+                                  thread_id, 4);        /* ACPI Processor UID */
         /* Flags */
         build_append_int_noprefix(table_data, 1, 4);    /* Enabled */
         /* Parking Protocol Version */
-- 
2.23.0


