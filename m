Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B657033DDB2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 20:40:15 +0100 (CET)
Received: from localhost ([::1]:40304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMFY6-0000P9-LK
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 15:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMEZp-0002G6-GY
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:37:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:36340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMEZi-0007qw-CQ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:37:57 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48C38AF32;
 Tue, 16 Mar 2021 18:37:33 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v8 42/44] target/arm: move TCG gt timer creation code in tcg/
Date: Tue, 16 Mar 2021 19:37:00 +0100
Message-Id: <20210316183702.10216-43-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210316183702.10216-1-cfontana@suse.de>
References: <20210316183702.10216-1-cfontana@suse.de>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

we need to be careful not to use

if (tcg_enabled())

here, because of the VMSTATE definitions in machine.c,
which are only protected by CONFIG_TCG, and thus
it would break the --enable-tcg --enable-kvm build.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/tcg/tcg-cpu.h        |  1 +
 target/arm/cpu.c                | 26 ++----------------------
 target/arm/tcg/sysemu/tcg-cpu.c | 36 +++++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
index dd08587949..3e4ce2c355 100644
--- a/target/arm/tcg/tcg-cpu.h
+++ b/target/arm/tcg/tcg-cpu.h
@@ -33,6 +33,7 @@ void tcg_arm_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc);
 /* Do semihosting call and set the appropriate return value. */
 void tcg_handle_semihosting(CPUState *cs);
 bool tcg_cpu_realizefn(CPUState *cs, Error **errp);
+bool tcg_cpu_realize_gt_timers(CPUState *cs, Error **errp);
 
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 09c1db604a..61cd12527b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -870,30 +870,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     bool no_aa32 = false;
 
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
-    {
-        uint64_t scale;
-
-        if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
-            if (!cpu->gt_cntfrq_hz) {
-                error_setg(errp, "Invalid CNTFRQ: %"PRId64"Hz",
-                           cpu->gt_cntfrq_hz);
-                return;
-            }
-            scale = gt_cntfrq_period_ns(cpu);
-        } else {
-            scale = GTIMER_SCALE;
-        }
-
-        cpu->gt_timer[GTIMER_PHYS] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
-                                               arm_gt_ptimer_cb, cpu);
-        cpu->gt_timer[GTIMER_VIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
-                                               arm_gt_vtimer_cb, cpu);
-        cpu->gt_timer[GTIMER_HYP] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
-                                              arm_gt_htimer_cb, cpu);
-        cpu->gt_timer[GTIMER_SEC] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
-                                              arm_gt_stimer_cb, cpu);
-        cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
-                                                  arm_gt_hvtimer_cb, cpu);
+    if (!tcg_cpu_realize_gt_timers(cs, errp)) {
+        return;
     }
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-cpu.c
index 115ac523dc..0a5b288b34 100644
--- a/target/arm/tcg/sysemu/tcg-cpu.c
+++ b/target/arm/tcg/sysemu/tcg-cpu.c
@@ -77,3 +77,39 @@ bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
     }
     return true;
 }
+
+/*
+ * we cannot use tcg_enabled() to condition the call to this function,
+ * due to the fields VMSTATE definitions in machine.c : it would break
+ * the --enable-tcg --enable-kvm build. We need to run this code whenever
+ * CONFIG_TCG is true, regardless of the chosen accelerator.
+ */
+bool tcg_cpu_realize_gt_timers(CPUState *cs, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    uint64_t scale;
+
+    if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
+        if (!cpu->gt_cntfrq_hz) {
+            error_setg(errp, "Invalid CNTFRQ: %"PRId64"Hz",
+                       cpu->gt_cntfrq_hz);
+            return false;
+        }
+        scale = gt_cntfrq_period_ns(cpu);
+    } else {
+        scale = GTIMER_SCALE;
+    }
+
+    cpu->gt_timer[GTIMER_PHYS] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                           arm_gt_ptimer_cb, cpu);
+    cpu->gt_timer[GTIMER_VIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                           arm_gt_vtimer_cb, cpu);
+    cpu->gt_timer[GTIMER_HYP] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                          arm_gt_htimer_cb, cpu);
+    cpu->gt_timer[GTIMER_SEC] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                          arm_gt_stimer_cb, cpu);
+    cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                              arm_gt_hvtimer_cb, cpu);
+    return true;
+}
-- 
2.26.2


