Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17986EDCFA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:46:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDN2-0008R5-29; Tue, 25 Apr 2023 03:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMz-0008Hv-Ra
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMx-0006n9-Og
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SZyALfukxzBD+7v1skx9V8CEhb/AqBg6Lg9I83bz/T8=;
 b=JKJvNanr5lkXd+2ahYSaBzjUNCOgTW43Aj8JLc8DpJxLq9SbNfr1uAxvXue5m1GwW/5sKO
 qcA+gUZhB2xVnH7EKiko6eNg7Jf4DVZx/XCISUIwhBMw/gx+E1dcH7pzF4klI0RuO+KcMe
 EvVZlzzVNg0mjQFMIuktVWDqbae8jV8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-NR3KoDzzMKSD7HIyT0jYiw-1; Tue, 25 Apr 2023 03:45:45 -0400
X-MC-Unique: NR3KoDzzMKSD7HIyT0jYiw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f080f9ea3eso20277965e9.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408743; x=1685000743;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZyALfukxzBD+7v1skx9V8CEhb/AqBg6Lg9I83bz/T8=;
 b=OjPI5Ug70/52Zda3Uhi/b2BmEnYYx9rbml5tPDg0TFjHv1Ng5j3sq/BuqYf/IP1qVw
 Ebej+YKlyhVLTBy5VDqWAikEW0B+vfg7Wk0XawqXbrVieU+CrIdSviTlZyD2FSKaUjuj
 yLHaiEbeSm8FWjYIHgruX+/9qahCFqZbylXM3g8EJjnUm83m/99xGth0uodAN6ytUdM3
 zkkdk6nYJcSpvL2SVvVXVWbP369xUtTNo8s9jCye9rlqU1nxocJ479C6aej6KTDkC+BF
 c3kC22GZvjHHjFVMunXfE7cBtMfVxCsWKILf3bfCfyN7wQsUcVpD72e8PF2mYCaPrWe8
 Hf6g==
X-Gm-Message-State: AAQBX9cmXxauLL2vDyDCIVRLCxH0ogdxjnW8m/jaPew66Wnx6NUZDAjr
 teYIWIWMiZSLuUQIMiu9AnJxCvur/B4nJmRed/YAUD7wsoxX3XUKv70i7Cf+5eVtCO5r2M18tc0
 +67gmiSXN1pSQrU5TSgOEq/3lWZaViu3SVxuVRirCZhnRC8EkDu+MKXxhOO9jLejhXdgJ
X-Received: by 2002:a1c:f703:0:b0:3f1:8aaa:c20c with SMTP id
 v3-20020a1cf703000000b003f18aaac20cmr9254145wmh.7.1682408743053; 
 Tue, 25 Apr 2023 00:45:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZjGTe1T/xtPuDjdz/lLIbB779Df0qnRXhmuPm9srvEx7TXY3QGG9eMUpOVKaeHaAEFO4z3/A==
X-Received: by 2002:a1c:f703:0:b0:3f1:8aaa:c20c with SMTP id
 v3-20020a1cf703000000b003f18aaac20cmr9254105wmh.7.1682408742668; 
 Tue, 25 Apr 2023 00:45:42 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f191c9c4b0sm11060595wmc.11.2023.04.25.00.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:41 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:45:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Subject: [PULL 15/31] hw: Add compat machines for 8.1
Message-ID: <0259dd3e6ffe35145068ddc1bfb5c3ec06b33f48.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Cornelia Huck <cohuck@redhat.com>

Add 8.1 machine types for arm/i440fx/m68k/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20230314173009.152667-1-cohuck@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 hw/arm/virt.c              | 11 +++++++++--
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 16 +++++++++++++---
 hw/i386/pc_q35.c           | 14 ++++++++++++--
 hw/m68k/virt.c             | 11 +++++++++--
 hw/ppc/spapr.c             | 17 ++++++++++++++---
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 10 files changed, 82 insertions(+), 13 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index f840f88d54..f4117fdb9a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -383,6 +383,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_8_0[];
+extern const size_t hw_compat_8_0_len;
+
 extern GlobalProperty hw_compat_7_2[];
 extern const size_t hw_compat_7_2_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 8206d5405a..eb668e9034 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -195,6 +195,9 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 
+extern GlobalProperty pc_compat_8_0[];
+extern const size_t pc_compat_8_0_len;
+
 extern GlobalProperty pc_compat_7_2[];
 extern const size_t pc_compat_7_2_len;
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ac626b3bef..267fe56fae 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3232,10 +3232,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_machine_8_0_options(MachineClass *mc)
+static void virt_machine_8_1_options(MachineClass *mc)
 {
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(8, 0)
+DEFINE_VIRT_MACHINE_AS_LATEST(8, 1)
+
+static void virt_machine_8_0_options(MachineClass *mc)
+{
+    virt_machine_8_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_8_0, hw_compat_8_0_len);
+}
+DEFINE_VIRT_MACHINE(8, 0)
 
 static void virt_machine_7_2_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index cd13b8b0a3..2ce97a5d3b 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -39,6 +39,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
+GlobalProperty hw_compat_8_0[] = {};
+const size_t hw_compat_8_0_len = G_N_ELEMENTS(hw_compat_8_0);
+
 GlobalProperty hw_compat_7_2[] = {
     { "e1000e", "migrate-timadj", "off" },
     { "virtio-mem", "x-early-migration", "false" },
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1489abf010..615e1d3d06 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -116,6 +116,9 @@
     { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
     { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
 
+GlobalProperty pc_compat_8_0[] = {};
+const size_t pc_compat_8_0_len = G_N_ELEMENTS(pc_compat_8_0);
+
 GlobalProperty pc_compat_7_2[] = {
     { "ICH9-LPC", "noreboot", "true" },
 };
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 30eedd62a3..21591dad8d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -454,21 +454,31 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_8_0_machine_options(MachineClass *m)
+static void pc_i440fx_8_1_machine_options(MachineClass *m)
 {
     pc_i440fx_machine_options(m);
     m->alias = "pc";
     m->is_default = true;
 }
 
+DEFINE_I440FX_MACHINE(v8_1, "pc-i440fx-8.1", NULL,
+                      pc_i440fx_8_1_machine_options);
+
+static void pc_i440fx_8_0_machine_options(MachineClass *m)
+{
+    pc_i440fx_8_1_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_8_0, hw_compat_8_0_len);
+    compat_props_add(m->compat_props, pc_compat_8_0, pc_compat_8_0_len);
+}
+
 DEFINE_I440FX_MACHINE(v8_0, "pc-i440fx-8.0", NULL,
                       pc_i440fx_8_0_machine_options);
 
 static void pc_i440fx_7_2_machine_options(MachineClass *m)
 {
     pc_i440fx_8_0_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
     compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 797ba347fd..f02919d92c 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -373,19 +373,29 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_8_0_machine_options(MachineClass *m)
+static void pc_q35_8_1_machine_options(MachineClass *m)
 {
     pc_q35_machine_options(m);
     m->alias = "q35";
 }
 
+DEFINE_Q35_MACHINE(v8_1, "pc-q35-8.1", NULL,
+                   pc_q35_8_1_machine_options);
+
+static void pc_q35_8_0_machine_options(MachineClass *m)
+{
+    pc_q35_8_1_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_8_0, hw_compat_8_0_len);
+    compat_props_add(m->compat_props, pc_compat_8_0, pc_compat_8_0_len);
+}
+
 DEFINE_Q35_MACHINE(v8_0, "pc-q35-8.0", NULL,
                    pc_q35_8_0_machine_options);
 
 static void pc_q35_7_2_machine_options(MachineClass *m)
 {
     pc_q35_8_0_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
     compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
 }
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 754b9bdfcc..731205b215 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -347,10 +347,17 @@ type_init(virt_machine_register_types)
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
-static void virt_machine_8_0_options(MachineClass *mc)
+static void virt_machine_8_1_options(MachineClass *mc)
 {
 }
-DEFINE_VIRT_MACHINE(8, 0, true)
+DEFINE_VIRT_MACHINE(8, 1, true)
+
+static void virt_machine_8_0_options(MachineClass *mc)
+{
+    virt_machine_8_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_8_0, hw_compat_8_0_len);
+}
+DEFINE_VIRT_MACHINE(8, 0, false)
 
 static void virt_machine_7_2_options(MachineClass *mc)
 {
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4921198b9d..ddc9c7b1a1 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4735,14 +4735,25 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     type_init(spapr_machine_register_##suffix)
 
 /*
- * pseries-8.0
+ * pseries-8.1
  */
-static void spapr_machine_8_0_class_options(MachineClass *mc)
+static void spapr_machine_8_1_class_options(MachineClass *mc)
 {
     /* Defaults for the latest behaviour inherited from the base class */
 }
 
-DEFINE_SPAPR_MACHINE(8_0, "8.0", true);
+DEFINE_SPAPR_MACHINE(8_1, "8.1", true);
+
+/*
+ * pseries-8.0
+ */
+static void spapr_machine_8_0_class_options(MachineClass *mc)
+{
+    spapr_machine_8_1_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_8_0, hw_compat_8_0_len);
+}
+
+DEFINE_SPAPR_MACHINE(8_0, "8.0", false);
 
 /*
  * pseries-7.2
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 503f212a31..e6f2c62625 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -826,14 +826,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_8_1_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_8_1_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(8_1, "8.1", true);
+
 static void ccw_machine_8_0_instance_options(MachineState *machine)
 {
+    ccw_machine_8_1_instance_options(machine);
 }
 
 static void ccw_machine_8_0_class_options(MachineClass *mc)
 {
+    ccw_machine_8_1_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_8_0, hw_compat_8_0_len);
 }
-DEFINE_CCW_MACHINE(8_0, "8.0", true);
+DEFINE_CCW_MACHINE(8_0, "8.0", false);
 
 static void ccw_machine_7_2_instance_options(MachineState *machine)
 {
-- 
MST


