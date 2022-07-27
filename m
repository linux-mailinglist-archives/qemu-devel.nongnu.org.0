Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF11B582652
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 14:24:07 +0200 (CEST)
Received: from localhost ([::1]:33170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGg58-0005jY-W6
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 08:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oGfzm-0001Pg-2Z
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 08:18:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oGfzi-0006gk-N4
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 08:18:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658924310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O9fnthMzfJLVM79QjbbMjM8a3h7O0bHpxqPLXB+XmNs=;
 b=f0irRHIVx+ih9efxOsHmTMGDwRQrjA04up0UEMO96AMbJSxP7HZjUDlZa+UmNBmm+1ldJ+
 InRQUAQR3ItRW1m0fUGaIjRlKZzSTaPXlcC7CvyKyL9D2piNf4At015GTud5rHphOcdYuZ
 7NLRNzKzFAEmuAyAzDpLNN1U4P7ti1o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-JYsAZtImMMG7lDpsGE4WQA-1; Wed, 27 Jul 2022 08:18:25 -0400
X-MC-Unique: JYsAZtImMMG7lDpsGE4WQA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D36758001EA;
 Wed, 27 Jul 2022 12:18:24 +0000 (UTC)
Received: from gondolin.fritz.box (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73B8C492CA2;
 Wed, 27 Jul 2022 12:18:20 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH for-7.2] hw: Add compat machines for 7.2
Date: Wed, 27 Jul 2022 14:17:55 +0200
Message-Id: <20220727121755.395894-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add 7.2 machine types for arm/i440fx/m68k/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 14 +++++++++++++-
 hw/i386/pc_q35.c           | 13 ++++++++++++-
 hw/m68k/virt.c             |  9 ++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 10 files changed, 79 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9633f822f361..1a6480fd2a76 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3094,10 +3094,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_7_2_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
+
 static void virt_machine_7_1_options(MachineClass *mc)
 {
+    virt_machine_7_2_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(7, 1)
+DEFINE_VIRT_MACHINE(7, 1)
 
 static void virt_machine_7_0_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index a673302ccec5..aa520e74a8c8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -40,6 +40,9 @@
 #include "hw/virtio/virtio-pci.h"
 #include "qom/object_interfaces.h"
 
+GlobalProperty hw_compat_7_1[] = {};
+const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
+
 GlobalProperty hw_compat_7_0[] = {
     { "arm-gicv3-common", "force-8-bit-prio", "on" },
     { "nvme-ns", "eui64-default", "on"},
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 774cb2bf0748..31724c42ac90 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -107,6 +107,9 @@
     { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
     { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
 
+GlobalProperty pc_compat_7_1[] = {};
+const size_t pc_compat_7_1_len = G_N_ELEMENTS(pc_compat_7_1);
+
 GlobalProperty pc_compat_7_0[] = {};
 const size_t pc_compat_7_0_len = G_N_ELEMENTS(pc_compat_7_0);
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index a234989ac363..34fa0021c7be 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -424,7 +424,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_7_1_machine_options(MachineClass *m)
+static void pc_i440fx_7_2_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -433,6 +433,18 @@ static void pc_i440fx_7_1_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
+                      pc_i440fx_7_2_machine_options);
+
+static void pc_i440fx_7_1_machine_options(MachineClass *m)
+{
+    pc_i440fx_7_2_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
+    compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
+}
+
 DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
                       pc_i440fx_7_1_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index f96cbd04e284..38634cd11413 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -362,7 +362,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_7_1_machine_options(MachineClass *m)
+static void pc_q35_7_2_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -370,6 +370,17 @@ static void pc_q35_7_1_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
+                   pc_q35_7_2_machine_options);
+
+static void pc_q35_7_1_machine_options(MachineClass *m)
+{
+    pc_q35_7_2_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
+    compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
+}
+
 DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
                    pc_q35_7_1_machine_options);
 
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 0aa383fa6bda..3122c8ef2c38 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -322,10 +322,17 @@ type_init(virt_machine_register_types)
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
+static void virt_machine_7_2_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE(7, 2, true)
+
 static void virt_machine_7_1_options(MachineClass *mc)
 {
+    virt_machine_7_2_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
 }
-DEFINE_VIRT_MACHINE(7, 1, true)
+DEFINE_VIRT_MACHINE(7, 1, false)
 
 static void virt_machine_7_0_options(MachineClass *mc)
 {
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index bc9ba6e6dcf2..fb790b61e442 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4730,15 +4730,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     }                                                                \
     type_init(spapr_machine_register_##suffix)
 
+/*
+ * pseries-7.2
+ */
+static void spapr_machine_7_2_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE(7_2, "7.2", true);
+
 /*
  * pseries-7.1
  */
 static void spapr_machine_7_1_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_7_2_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
 }
 
-DEFINE_SPAPR_MACHINE(7_1, "7.1", true);
+DEFINE_SPAPR_MACHINE(7_1, "7.1", false);
 
 /*
  * pseries-7.0
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index cc3097bfee80..bf1b36d824db 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -792,14 +792,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_7_2_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_7_2_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(7_2, "7.2", true);
+
 static void ccw_machine_7_1_instance_options(MachineState *machine)
 {
+    ccw_machine_7_2_instance_options(machine);
 }
 
 static void ccw_machine_7_1_class_options(MachineClass *mc)
 {
+    ccw_machine_7_2_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
 }
-DEFINE_CCW_MACHINE(7_1, "7.1", true);
+DEFINE_CCW_MACHINE(7_1, "7.1", false);
 
 static void ccw_machine_7_0_instance_options(MachineState *machine)
 {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index d94edcef2883..487243a39c84 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -380,6 +380,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_7_1[];
+extern const size_t hw_compat_7_1_len;
+
 extern GlobalProperty hw_compat_7_0[];
 extern const size_t hw_compat_7_0_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index b7735dccfc81..4517fa08f2e9 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -195,6 +195,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 
+extern GlobalProperty pc_compat_7_1[];
+extern const size_t pc_compat_7_1_len;
+
 extern GlobalProperty pc_compat_7_0[];
 extern const size_t pc_compat_7_0_len;
 
-- 
2.35.3


