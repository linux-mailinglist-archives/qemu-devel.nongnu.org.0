Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DD964A414
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:24:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4kd5-00082D-SD; Mon, 12 Dec 2022 10:22:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p4kd3-00081e-MV
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:22:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p4kd1-00072D-SX
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670858523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vvzvOyeefYHkoMGe4bZugTKomPztWz7RE3MgNQEVQDQ=;
 b=Rfjo5w+jGULwyqQm4BWVyX97VV7Ay6e7gbF2lYnmv2fRwHpW1+p2JWXfodQv6ujY3vVYiV
 ULznMhXoNS8404Dn5LhTXCBidd9kj690bJcUiCIDTSqtl/cVl9JZUCIdwr+dW9IYlhCSnU
 UOTcHhb2tuzXQr4J4cYinEu1RDPcUtc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-xpQsAyZkOQWvGjiA68jH9g-1; Mon, 12 Dec 2022 10:22:00 -0500
X-MC-Unique: xpQsAyZkOQWvGjiA68jH9g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29DF2806001;
 Mon, 12 Dec 2022 15:21:59 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.195.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 994F72026D4B;
 Mon, 12 Dec 2022 15:21:55 +0000 (UTC)
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
Subject: [PATCH for-8.0 v2 1/2] hw: Add compat machines for 8.0
Date: Mon, 12 Dec 2022 16:21:44 +0100
Message-Id: <20221212152145.124317-2-cohuck@redhat.com>
In-Reply-To: <20221212152145.124317-1-cohuck@redhat.com>
References: <20221212152145.124317-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add 8.0 machine types for arm/i440fx/m68k/q35/s390x/spapr.

Reviewed-by: Cédric Le Goater <clg@kaod.org> [ppc]
Reviewed-by: Thomas Huth <thuth@redhat.com> [s390x]
Reviewed-by: Greg Kurz <groug@kaod.org> [ppc]
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
index b87135085610..2a46660980e7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3096,10 +3096,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_8_0_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(8, 0)
+
 static void virt_machine_7_2_options(MachineClass *mc)
 {
+    virt_machine_8_0_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
+DEFINE_VIRT_MACHINE(7, 2)
 
 static void virt_machine_7_1_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 8d34caa31dc8..0592ae7e4850 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -40,6 +40,9 @@
 #include "hw/virtio/virtio-pci.h"
 #include "qom/object_interfaces.h"
 
+GlobalProperty hw_compat_7_2[] = {};
+const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
+
 GlobalProperty hw_compat_7_1[] = {
     { "virtio-device", "queue_reset", "false" },
 };
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 546b703cb42c..9aeff77e9dca 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -107,6 +107,9 @@
     { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
     { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
 
+GlobalProperty pc_compat_7_2[] = {};
+const size_t pc_compat_7_2_len = G_N_ELEMENTS(pc_compat_7_2);
+
 GlobalProperty pc_compat_7_1[] = {};
 const size_t pc_compat_7_1_len = G_N_ELEMENTS(pc_compat_7_1);
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0ad0ed160387..1c0a7b83b545 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -435,7 +435,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_7_2_machine_options(MachineClass *m)
+static void pc_i440fx_8_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -444,6 +444,18 @@ static void pc_i440fx_7_2_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_I440FX_MACHINE(v8_0, "pc-i440fx-8.0", NULL,
+                      pc_i440fx_8_0_machine_options);
+
+static void pc_i440fx_7_2_machine_options(MachineClass *m)
+{
+    pc_i440fx_8_0_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
+    compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
+}
+
 DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
                       pc_i440fx_7_2_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a496bd6e74f5..10bb49f679b0 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -370,7 +370,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_7_2_machine_options(MachineClass *m)
+static void pc_q35_8_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -378,6 +378,17 @@ static void pc_q35_7_2_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_Q35_MACHINE(v8_0, "pc-q35-8.0", NULL,
+                   pc_q35_8_0_machine_options);
+
+static void pc_q35_7_2_machine_options(MachineClass *m)
+{
+    pc_q35_8_0_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
+    compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
+}
+
 DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
                    pc_q35_7_2_machine_options);
 
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index da5eafd2756f..4cb5beef1a0c 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -346,10 +346,17 @@ type_init(virt_machine_register_types)
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
+static void virt_machine_8_0_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE(8, 0, true)
+
 static void virt_machine_7_2_options(MachineClass *mc)
 {
+    virt_machine_8_0_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
 }
-DEFINE_VIRT_MACHINE(7, 2, true)
+DEFINE_VIRT_MACHINE(7, 2, false)
 
 static void virt_machine_7_1_options(MachineClass *mc)
 {
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 66b414d2e9ba..da9c84c1198f 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4733,15 +4733,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     }                                                                \
     type_init(spapr_machine_register_##suffix)
 
+/*
+ * pseries-8.0
+ */
+static void spapr_machine_8_0_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE(8_0, "8.0", true);
+
 /*
  * pseries-7.2
  */
 static void spapr_machine_7_2_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_8_0_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
 }
 
-DEFINE_SPAPR_MACHINE(7_2, "7.2", true);
+DEFINE_SPAPR_MACHINE(7_2, "7.2", false);
 
 /*
  * pseries-7.1
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 2e64ffab45ef..325e0cfa6560 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -823,14 +823,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_8_0_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_8_0_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(8_0, "8.0", true);
+
 static void ccw_machine_7_2_instance_options(MachineState *machine)
 {
+    ccw_machine_8_0_instance_options(machine);
 }
 
 static void ccw_machine_7_2_class_options(MachineClass *mc)
 {
+    ccw_machine_8_0_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
 }
-DEFINE_CCW_MACHINE(7_2, "7.2", true);
+DEFINE_CCW_MACHINE(7_2, "7.2", false);
 
 static void ccw_machine_7_1_instance_options(MachineState *machine)
 {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 90f1dd3aeb79..d18d6d007335 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -379,6 +379,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_7_2[];
+extern const size_t hw_compat_7_2_len;
+
 extern GlobalProperty hw_compat_7_1[];
 extern const size_t hw_compat_7_1_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index c95333514ed3..991f905f5d25 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -200,6 +200,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 
+extern GlobalProperty pc_compat_7_2[];
+extern const size_t pc_compat_7_2_len;
+
 extern GlobalProperty pc_compat_7_1[];
 extern const size_t pc_compat_7_1_len;
 
-- 
2.38.1


