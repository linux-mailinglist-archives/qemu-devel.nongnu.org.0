Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C57764A415
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:24:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4kdE-00084W-Ui; Mon, 12 Dec 2022 10:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p4kdA-00083p-M3
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p4kd7-00072t-JH
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670858529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K7LaarmLLOu5FmPKS52J+EHne9sPmkHDrJIWtE74xTA=;
 b=HHsn6KLsBjtTij05OCI1T075mmu3Jhzjb5Bp7V4erIvzG+WaAo+vC/Tvz0LG69IUbQaVCn
 mBJ5+DewRXc6fYGIa6qWlY//uJ1BWFmUnOKO5RazREvgtnK2qDbKjgqMfjKbqjH0/EJm/V
 pMc1Ad4LpsXy5CALSU2SE1U0/YP181w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-M7mD7MRMPFKU7TKPPswlgA-1; Mon, 12 Dec 2022 10:22:03 -0500
X-MC-Unique: M7mD7MRMPFKU7TKPPswlgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF88F29ABA09;
 Mon, 12 Dec 2022 15:22:02 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.195.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 694102026D76;
 Mon, 12 Dec 2022 15:21:59 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH for-8.0 v2 2/2] pc: clean up compat machines
Date: Mon, 12 Dec 2022 16:21:45 +0100
Message-Id: <20221212152145.124317-3-cohuck@redhat.com>
In-Reply-To: <20221212152145.124317-1-cohuck@redhat.com>
References: <20221212152145.124317-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We can move setting default_cpu_version into the base machine options,
and we need to unset alias and is_default only once.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/i386/pc_piix.c | 27 +--------------------------
 hw/i386/pc_q35.c  | 16 +---------------
 2 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1c0a7b83b545..b48047f50caf 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -426,6 +426,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pcmc->default_nic_model = "e1000";
     pcmc->pci_root_uid = 0;
+    pcmc->default_cpu_version = 1;
 
     m->family = "pc_piix";
     m->desc = "Standard PC (i440FX + PIIX, 1996)";
@@ -437,11 +438,9 @@ static void pc_i440fx_machine_options(MachineClass *m)
 
 static void pc_i440fx_8_0_machine_options(MachineClass *m)
 {
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
     m->alias = "pc";
     m->is_default = true;
-    pcmc->default_cpu_version = 1;
 }
 
 DEFINE_I440FX_MACHINE(v8_0, "pc-i440fx-8.0", NULL,
@@ -463,8 +462,6 @@ static void pc_i440fx_7_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_7_2_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     pcmc->legacy_no_rng_seed = true;
     compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
     compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
@@ -477,8 +474,6 @@ static void pc_i440fx_7_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_7_1_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     pcmc->enforce_amd_1tb_hole = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
@@ -490,8 +485,6 @@ DEFINE_I440FX_MACHINE(v7_0, "pc-i440fx-7.0", NULL,
 static void pc_i440fx_6_2_machine_options(MachineClass *m)
 {
     pc_i440fx_7_0_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
     compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
 }
@@ -502,8 +495,6 @@ DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
 static void pc_i440fx_6_1_machine_options(MachineClass *m)
 {
     pc_i440fx_6_2_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
     m->smp_props.prefer_sockets = true;
@@ -515,8 +506,6 @@ DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
 static void pc_i440fx_6_0_machine_options(MachineClass *m)
 {
     pc_i440fx_6_1_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_0, hw_compat_6_0_len);
     compat_props_add(m->compat_props, pc_compat_6_0, pc_compat_6_0_len);
 }
@@ -527,8 +516,6 @@ DEFINE_I440FX_MACHINE(v6_0, "pc-i440fx-6.0", NULL,
 static void pc_i440fx_5_2_machine_options(MachineClass *m)
 {
     pc_i440fx_6_0_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
     compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
 }
@@ -541,8 +528,6 @@ static void pc_i440fx_5_1_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
 
     pc_i440fx_5_2_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
     compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
     pcmc->kvmclock_create_always = false;
@@ -555,8 +540,6 @@ DEFINE_I440FX_MACHINE(v5_1, "pc-i440fx-5.1", NULL,
 static void pc_i440fx_5_0_machine_options(MachineClass *m)
 {
     pc_i440fx_5_1_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     m->numa_mem_supported = true;
     compat_props_add(m->compat_props, hw_compat_5_0, hw_compat_5_0_len);
     compat_props_add(m->compat_props, pc_compat_5_0, pc_compat_5_0_len);
@@ -569,8 +552,6 @@ DEFINE_I440FX_MACHINE(v5_0, "pc-i440fx-5.0", NULL,
 static void pc_i440fx_4_2_machine_options(MachineClass *m)
 {
     pc_i440fx_5_0_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_4_2, hw_compat_4_2_len);
     compat_props_add(m->compat_props, pc_compat_4_2, pc_compat_4_2_len);
 }
@@ -581,8 +562,6 @@ DEFINE_I440FX_MACHINE(v4_2, "pc-i440fx-4.2", NULL,
 static void pc_i440fx_4_1_machine_options(MachineClass *m)
 {
     pc_i440fx_4_2_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_4_1, hw_compat_4_1_len);
     compat_props_add(m->compat_props, pc_compat_4_1, pc_compat_4_1_len);
 }
@@ -594,8 +573,6 @@ static void pc_i440fx_4_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_4_1_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     pcmc->default_cpu_version = CPU_VERSION_LEGACY;
     compat_props_add(m->compat_props, hw_compat_4_0, hw_compat_4_0_len);
     compat_props_add(m->compat_props, pc_compat_4_0, pc_compat_4_0_len);
@@ -609,9 +586,7 @@ static void pc_i440fx_3_1_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
 
     pc_i440fx_4_0_machine_options(m);
-    m->is_default = false;
     m->smbus_no_migration_support = true;
-    m->alias = NULL;
     pcmc->pvh_enabled = false;
     compat_props_add(m->compat_props, hw_compat_3_1, hw_compat_3_1_len);
     compat_props_add(m->compat_props, pc_compat_3_1, pc_compat_3_1_len);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 10bb49f679b0..67ceb04bcc2d 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -355,6 +355,7 @@ static void pc_q35_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pcmc->default_nic_model = "e1000e";
     pcmc->pci_root_uid = 0;
+    pcmc->default_cpu_version = 1;
 
     m->family = "pc_q35";
     m->desc = "Standard PC (Q35 + ICH9, 2009)";
@@ -372,10 +373,8 @@ static void pc_q35_machine_options(MachineClass *m)
 
 static void pc_q35_8_0_machine_options(MachineClass *m)
 {
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
     m->alias = "q35";
-    pcmc->default_cpu_version = 1;
 }
 
 DEFINE_Q35_MACHINE(v8_0, "pc-q35-8.0", NULL,
@@ -396,7 +395,6 @@ static void pc_q35_7_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_2_machine_options(m);
-    m->alias = NULL;
     pcmc->legacy_no_rng_seed = true;
     compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
     compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
@@ -409,7 +407,6 @@ static void pc_q35_7_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_1_machine_options(m);
-    m->alias = NULL;
     pcmc->enforce_amd_1tb_hole = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
@@ -421,7 +418,6 @@ DEFINE_Q35_MACHINE(v7_0, "pc-q35-7.0", NULL,
 static void pc_q35_6_2_machine_options(MachineClass *m)
 {
     pc_q35_7_0_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
     compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
 }
@@ -432,7 +428,6 @@ DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
 static void pc_q35_6_1_machine_options(MachineClass *m)
 {
     pc_q35_6_2_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
     m->smp_props.prefer_sockets = true;
@@ -444,7 +439,6 @@ DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
 static void pc_q35_6_0_machine_options(MachineClass *m)
 {
     pc_q35_6_1_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_6_0, hw_compat_6_0_len);
     compat_props_add(m->compat_props, pc_compat_6_0, pc_compat_6_0_len);
 }
@@ -455,7 +449,6 @@ DEFINE_Q35_MACHINE(v6_0, "pc-q35-6.0", NULL,
 static void pc_q35_5_2_machine_options(MachineClass *m)
 {
     pc_q35_6_0_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
     compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
 }
@@ -468,7 +461,6 @@ static void pc_q35_5_1_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
 
     pc_q35_5_2_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
     compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
     pcmc->kvmclock_create_always = false;
@@ -481,7 +473,6 @@ DEFINE_Q35_MACHINE(v5_1, "pc-q35-5.1", NULL,
 static void pc_q35_5_0_machine_options(MachineClass *m)
 {
     pc_q35_5_1_machine_options(m);
-    m->alias = NULL;
     m->numa_mem_supported = true;
     compat_props_add(m->compat_props, hw_compat_5_0, hw_compat_5_0_len);
     compat_props_add(m->compat_props, pc_compat_5_0, pc_compat_5_0_len);
@@ -494,7 +485,6 @@ DEFINE_Q35_MACHINE(v5_0, "pc-q35-5.0", NULL,
 static void pc_q35_4_2_machine_options(MachineClass *m)
 {
     pc_q35_5_0_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_4_2, hw_compat_4_2_len);
     compat_props_add(m->compat_props, pc_compat_4_2, pc_compat_4_2_len);
 }
@@ -505,7 +495,6 @@ DEFINE_Q35_MACHINE(v4_2, "pc-q35-4.2", NULL,
 static void pc_q35_4_1_machine_options(MachineClass *m)
 {
     pc_q35_4_2_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_4_1, hw_compat_4_1_len);
     compat_props_add(m->compat_props, pc_compat_4_1, pc_compat_4_1_len);
 }
@@ -517,7 +506,6 @@ static void pc_q35_4_0_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_4_1_machine_options(m);
-    m->alias = NULL;
     pcmc->default_cpu_version = CPU_VERSION_LEGACY;
     /*
      * This is the default machine for the 4.0-stable branch. It is basically
@@ -535,7 +523,6 @@ static void pc_q35_4_0_machine_options(MachineClass *m)
 {
     pc_q35_4_0_1_machine_options(m);
     m->default_kernel_irqchip_split = true;
-    m->alias = NULL;
     /* Compat props are applied by the 4.0.1 machine */
 }
 
@@ -549,7 +536,6 @@ static void pc_q35_3_1_machine_options(MachineClass *m)
     pc_q35_4_0_machine_options(m);
     m->default_kernel_irqchip_split = false;
     m->smbus_no_migration_support = true;
-    m->alias = NULL;
     pcmc->pvh_enabled = false;
     compat_props_add(m->compat_props, hw_compat_3_1, hw_compat_3_1_len);
     compat_props_add(m->compat_props, pc_compat_3_1, pc_compat_3_1_len);
-- 
2.38.1


