Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB9A34AFFC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:16:43 +0100 (CET)
Received: from localhost ([::1]:40618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPsss-0000t0-Uc
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHU-0006pm-Aj
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:38:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:45724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHJ-00014f-3K
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:38:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CCC45AF32;
 Fri, 26 Mar 2021 19:37:41 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 33/65] target/arm: move cpu_tcg to tcg/tcg-cpu-models.c
Date: Fri, 26 Mar 2021 20:36:29 +0100
Message-Id: <20210326193701.5981-34-cfontana@suse.de>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

move the module containing cpu models definitions
for 32bit TCG-only CPUs to tcg/ and rename it for clarity.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/{cpu_tcg.c => tcg/tcg-cpu-models.c} | 9 +--------
 target/arm/meson.build                         | 4 ----
 target/arm/tcg/meson.build                     | 1 +
 3 files changed, 2 insertions(+), 12 deletions(-)
 rename target/arm/{cpu_tcg.c => tcg/tcg-cpu-models.c} (99%)

diff --git a/target/arm/cpu_tcg.c b/target/arm/tcg/tcg-cpu-models.c
similarity index 99%
rename from target/arm/cpu_tcg.c
rename to target/arm/tcg/tcg-cpu-models.c
index 54df5a8e77..5dc8e2c93f 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/tcg/tcg-cpu-models.c
@@ -1,5 +1,5 @@
 /*
- * QEMU ARM TCG CPUs.
+ * QEMU ARM TCG-only CPUs.
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -9,10 +9,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
-#ifdef CONFIG_TCG
 #include "tcg/tcg-cpu.h"
-#endif /* CONFIG_TCG */
 #include "internals.h"
 #include "target/arm/idau.h"
 #if !defined(CONFIG_USER_ONLY)
@@ -24,7 +21,6 @@
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-#ifdef CONFIG_TCG
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -48,7 +44,6 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return ret;
 }
-#endif /* CONFIG_TCG */
 
 static void arm926_initfn(Object *obj)
 {
@@ -833,7 +828,6 @@ static void pxa270c5_initfn(Object *obj)
     cpu->reset_sctlr = 0x00000078;
 }
 
-#ifdef CONFIG_TCG
 static struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
@@ -849,7 +843,6 @@ static struct TCGCPUOps arm_v7m_tcg_ops = {
     .debug_check_watchpoint = arm_debug_check_watchpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
-#endif /* CONFIG_TCG */
 
 static void arm_v7m_class_init(ObjectClass *oc, void *data)
 {
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 0ccd2fb0bc..8d0c12b2fc 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -18,10 +18,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'gdbstub64.c',
 ))
 
-arm_ss.add(when: 'CONFIG_TCG', if_true: files(
-  'cpu_tcg.c',
-))
-
 arm_softmmu_ss = ss.source_set()
 arm_softmmu_ss.add(files(
   'arch_dump.c',
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index ef73dcaee3..233cd47422 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -29,6 +29,7 @@ arm_ss.add(when: 'CONFIG_TCG', if_true: files(
   'crypto_helper.c',
   'debug_helper.c',
   'tcg-cpu.c',
+  'tcg-cpu-models.c',
 
 ), if_false: files(
   'helper-stubs.c',
-- 
2.26.2


