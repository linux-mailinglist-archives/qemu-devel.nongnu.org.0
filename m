Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511172CFC17
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 17:40:01 +0100 (CET)
Received: from localhost ([::1]:33064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klabI-0007ob-Ca
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 11:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klaEH-0001B8-4g
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:16:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:49140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klaE4-0000GS-Mi
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:16:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9DE0B1CA;
 Sat,  5 Dec 2020 16:15:45 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v8 27/27] cpu: introduce cpu_accel_instance_init
Date: Sat,  5 Dec 2020 17:15:18 +0100
Message-Id: <20201205161518.14365-28-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201205161518.14365-1-cfontana@suse.de>
References: <20201205161518.14365-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

centralize the calls to cpu->accel_cpu_interface

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 hw/core/cpu.c         | 9 +++++++++
 include/hw/core/cpu.h | 6 ++++++
 target/i386/cpu.c     | 9 ++-------
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index f41c009e6c..873cf5e4ef 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -242,6 +242,15 @@ void cpu_reset(CPUState *cpu)
     trace_guest_cpu_reset(cpu);
 }
 
+void cpu_accel_instance_init(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->accel_cpu_interface) {
+        cc->accel_cpu_interface->cpu_instance_init(cpu);
+    }
+}
+
 static void cpu_common_reset(DeviceState *dev)
 {
     CPUState *cpu = CPU(dev);
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fee3a68194..0a09f0dd8b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -677,6 +677,12 @@ void cpu_list_remove(CPUState *cpu);
  */
 void cpu_reset(CPUState *cpu);
 
+/**
+ * cpu_accel_instance_init:
+ * @cpu: The CPU that needs to do accel-specific object initializations.
+ */
+void cpu_accel_instance_init(CPUState *cpu);
+
 /**
  * cpu_class_by_name:
  * @typename: The CPU base type.
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aabb8edfe0..e2f16a1f37 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -28,7 +28,6 @@
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "sysemu/hvf.h"
-#include "hw/core/accel-cpu.h"
 #include "sysemu/xen.h"
 #include "kvm/kvm_i386.h"
 #include "sev_i386.h"
@@ -6621,8 +6620,6 @@ static void x86_cpu_initfn(Object *obj)
 {
     X86CPU *cpu = X86_CPU(obj);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(obj);
-    CPUClass *cc = CPU_CLASS(xcc);
-
     CPUX86State *env = &cpu->env;
     FeatureWord w;
 
@@ -6680,10 +6677,8 @@ static void x86_cpu_initfn(Object *obj)
         x86_cpu_load_model(cpu, xcc->model);
     }
 
-    /* if required, do the accelerator-specific cpu initialization */
-    if (cc->accel_cpu_interface) {
-        cc->accel_cpu_interface->cpu_instance_init(CPU(obj));
-    }
+    /* if required, do accelerator-specific cpu initializations */
+    cpu_accel_instance_init(CPU(obj));
 }
 
 static int64_t x86_cpu_get_arch_id(CPUState *cs)
-- 
2.26.2


