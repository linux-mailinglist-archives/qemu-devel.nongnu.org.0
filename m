Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961534CB565
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 04:26:39 +0100 (CET)
Received: from localhost ([::1]:57028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPc6w-0006Sx-7I
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 22:26:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nPbtP-0007aF-QU
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:12:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nPbtO-0003fv-5I
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646277154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Ul8oWuvUeDzNfHlnwEYmiKJujaeZ1hRs0XrndxwX2o=;
 b=dNlSRrfXJCYvQX7+Y2xc4cAFChs9yRFiQl63tVyom5ppFhARuHGYk4iFtLlb0BNiyF6/Jn
 iuuf1qbQNYMO+gPDcAnnWBcBf7o/CZuz2KSG8FPndhhclfSVdS3LoOMeax04kCE3ylpIkT
 2yb4KZzGm3TIOYtP0mGEinm333os6ac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-mpRQKxuVODixC-1zIZnKYQ-1; Wed, 02 Mar 2022 22:12:31 -0500
X-MC-Unique: mpRQKxuVODixC-1zIZnKYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46D521091DA1;
 Thu,  3 Mar 2022 03:12:30 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-119.pek2.redhat.com [10.72.13.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E96D91078675;
 Thu,  3 Mar 2022 03:12:25 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 3/3] hw/arm/virt: Unify ACPI processor ID in MADT and SRAT
 table
Date: Thu,  3 Mar 2022 11:11:52 +0800
Message-Id: <20220303031152.145960-4-gshan@redhat.com>
In-Reply-To: <20220303031152.145960-1-gshan@redhat.com>
References: <20220303031152.145960-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


