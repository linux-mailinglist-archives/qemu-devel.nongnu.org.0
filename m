Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FC52C7D06
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 03:54:31 +0100 (CET)
Received: from localhost ([::1]:46074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjZKg-00013t-U7
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 21:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kjZ31-0001Td-Lu
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 21:36:15 -0500
Received: from mx2.suse.de ([195.135.220.15]:57834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kjZ2t-0004rJ-8u
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 21:36:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19FB5AE65;
 Mon, 30 Nov 2020 02:35:56 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v7 22/22] cpu: introduce cpu_accel_instance_init
Date: Mon, 30 Nov 2020 03:35:35 +0100
Message-Id: <20201130023535.16689-23-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201130023535.16689-1-cfontana@suse.de>
References: <20201130023535.16689-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
index b1a495a383..c6838f171c 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -252,6 +252,15 @@ void cpu_accel_realize(CPUState *cpu, Error **errp)
     }
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
index 403f614559..4a7d82f821 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -683,6 +683,12 @@ void cpu_reset(CPUState *cpu);
  */
 void cpu_accel_realize(CPUState *cpu, Error **errp);
 
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
index 485f3bc97b..40c3f7c423 100644
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


