Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E23A46D94C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 18:11:06 +0100 (CET)
Received: from localhost ([::1]:35020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv0TA-0005tn-NY
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 12:11:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mv0LW-0001Ru-LX
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 12:03:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mv0LS-0002sr-6j
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 12:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638982985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oLkSeCBvFlZ3Keuy3lQ+8MCPir4is+1rI1cSrUFPGY4=;
 b=WOHvGK71xoXDa5KiKwXNiR4FzmLv7+L+xMlk9oAyrs7U/+iyFLNLlEuzeOOgIA+hwx9xIT
 c2LhkvweEUd8GCDwhradAeNM+fbpKYsukJV4bLhHI3AgJNY6z6kxM4oWypHmGk0E56047Q
 CltTDE3e3rb+cXaw78q//kBwiTEQOXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-g8m00RmJO-mnEiAy8jPgVQ-1; Wed, 08 Dec 2021 12:03:02 -0500
X-MC-Unique: g8m00RmJO-mnEiAy8jPgVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 715C010247A9;
 Wed,  8 Dec 2021 17:02:58 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.193.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 311F5196E2;
 Wed,  8 Dec 2021 17:02:44 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH for-7.0] hw: Add compat machines for 7.0
Date: Wed,  8 Dec 2021 18:02:41 +0100
Message-Id: <20211208170241.110551-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 14 +++++++++++++-
 hw/i386/pc_q35.c           | 13 ++++++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 9 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 30da05dfe040..ddcfab426436 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2857,10 +2857,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_7_0_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(7, 0)
+
 static void virt_machine_6_2_options(MachineClass *mc)
 {
+    virt_machine_7_0_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
+DEFINE_VIRT_MACHINE(6, 2)
 
 static void virt_machine_6_1_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 53a99abc5605..a9c15479fe1d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,6 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
+GlobalProperty hw_compat_6_2[] = {};
+const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
+
 GlobalProperty hw_compat_6_1[] = {
     { "vhost-user-vsock-device", "seqpacket", "off" },
     { "nvme-ns", "shared", "off" },
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a2ef40ecbc24..fccde2ef39f6 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -94,6 +94,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
+GlobalProperty pc_compat_6_2[] = {};
+const size_t pc_compat_6_2_len = G_N_ELEMENTS(pc_compat_6_2);
+
 GlobalProperty pc_compat_6_1[] = {
     { TYPE_X86_CPU, "hv-version-id-build", "0x1bbc" },
     { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 223dd3e05d15..b03026bf0648 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -413,7 +413,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_6_2_machine_options(MachineClass *m)
+static void pc_i440fx_7_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -422,6 +422,18 @@ static void pc_i440fx_6_2_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_I440FX_MACHINE(v7_0, "pc-i440fx-7.0", NULL,
+                      pc_i440fx_7_0_machine_options);
+
+static void pc_i440fx_6_2_machine_options(MachineClass *m)
+{
+    pc_i440fx_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
+    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
+}
+
 DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
                       pc_i440fx_6_2_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index e1e100316d93..6b66eb16bb64 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -360,7 +360,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_6_2_machine_options(MachineClass *m)
+static void pc_q35_7_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -368,6 +368,17 @@ static void pc_q35_6_2_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_Q35_MACHINE(v7_0, "pc-q35-7.0", NULL,
+                   pc_q35_7_0_machine_options);
+
+static void pc_q35_6_2_machine_options(MachineClass *m)
+{
+    pc_q35_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
+    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
+}
+
 DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
                    pc_q35_6_2_machine_options);
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3b5fd749be89..837342932586 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4665,15 +4665,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     }                                                                \
     type_init(spapr_machine_register_##suffix)
 
+/*
+ * pseries-7.0
+ */
+static void spapr_machine_7_0_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE(7_0, "7.0", true);
+
 /*
  * pseries-6.2
  */
 static void spapr_machine_6_2_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_7_0_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
 }
 
-DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
+DEFINE_SPAPR_MACHINE(6_2, "6.2", false);
 
 /*
  * pseries-6.1
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 653587ea62f4..84e3e63c430d 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -791,14 +791,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_7_0_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_7_0_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(7_0, "7.0", true);
+
 static void ccw_machine_6_2_instance_options(MachineState *machine)
 {
+    ccw_machine_7_0_instance_options(machine);
 }
 
 static void ccw_machine_6_2_class_options(MachineClass *mc)
 {
+    ccw_machine_7_0_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
 }
-DEFINE_CCW_MACHINE(6_2, "6.2", true);
+DEFINE_CCW_MACHINE(6_2, "6.2", false);
 
 static void ccw_machine_6_1_instance_options(MachineState *machine)
 {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 9c1c1901046c..b7b68471ffc1 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -375,6 +375,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_6_2[];
+extern const size_t hw_compat_6_2_len;
+
 extern GlobalProperty hw_compat_6_1[];
 extern const size_t hw_compat_6_1_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 9ab39e428f80..b38947c224cd 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -196,6 +196,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 
+extern GlobalProperty pc_compat_6_2[];
+extern const size_t pc_compat_6_2_len;
+
 extern GlobalProperty pc_compat_6_1[];
 extern const size_t pc_compat_6_1_len;
 
-- 
2.31.1


