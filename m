Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A6E34AFE7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:11:40 +0100 (CET)
Received: from localhost ([::1]:52176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPsnz-0002UK-OV
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHI-0006i2-2g
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:45680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHG-00013e-9F
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B02D5AF2C;
 Fri, 26 Mar 2021 19:37:38 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 30/65] target/arm: fix style of arm_cpu_do_interrupt
 functions before move
Date: Fri, 26 Mar 2021 20:36:26 +0100
Message-Id: <20210326193701.5981-31-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326193701.5981-1-cfontana@suse.de>
References: <20210326193701.5981-1-cfontana@suse.de>
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

before refactoring the exception code, fix the style of the
functions being moved.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/tcg/helper.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index aaa307daca..b03ac630af 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -894,10 +894,11 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         new_mode = ARM_CPU_MODE_UND;
         addr = 0x04;
         mask = CPSR_I;
-        if (env->thumb)
+        if (env->thumb) {
             offset = 2;
-        else
+        } else {
             offset = 4;
+        }
         break;
     case EXCP_SWI:
         new_mode = ARM_CPU_MODE_SVC;
@@ -983,7 +984,8 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         /* High vectors. When enabled, base address cannot be remapped. */
         addr += 0xffff0000;
     } else {
-        /* ARM v7 architectures provide a vector base address register to remap
+        /*
+         * ARM v7 architectures provide a vector base address register to remap
          * the interrupt vector table.
          * This register is only followed in non-monitor mode, and is banked.
          * Note: only bits 31:5 are valid.
@@ -1092,7 +1094,8 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
 
     if (cur_el < new_el) {
-        /* Entry vector offset depends on whether the implemented EL
+        /*
+         * Entry vector offset depends on whether the implemented EL
          * immediately lower than the target level is using AArch32 or AArch64
          */
         bool is_aa64;
@@ -1279,7 +1282,8 @@ static void handle_semihosting(CPUState *cs)
 }
 #endif
 
-/* Handle a CPU exception for A and R profile CPUs.
+/*
+ * Handle a CPU exception for A and R profile CPUs.
  * Do any appropriate logging, handle PSCI calls, and then hand off
  * to the AArch64-entry or AArch32-entry function depending on the
  * target exception level's register width.
@@ -1324,7 +1328,8 @@ void arm_cpu_do_interrupt(CPUState *cs)
     }
 #endif
 
-    /* Hooks may change global state so BQL should be held, also the
+    /*
+     * Hooks may change global state so BQL should be held, also the
      * BQL needs to be held for any modification of
      * cs->interrupt_request.
      */
-- 
2.26.2


