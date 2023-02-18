Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1DD69B3B7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 21:19:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT790-0005kj-N8; Fri, 17 Feb 2023 15:15:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pT78P-0004GS-H3; Fri, 17 Feb 2023 15:15:11 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pT78M-00014z-G2; Fri, 17 Feb 2023 15:15:09 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A96A220FBD;
 Fri, 17 Feb 2023 20:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676664904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRc0e5uIvfMVp5ULxxJVjzrBpmFpsMaB/O9Bi9dJ6kI=;
 b=y7bSzF5a5dR7Eiiat5fnUCNEaAvxgzizzF0jrGgNy78FmJ+qH+vbuONqqEtWIFAP7oHoc+
 4tFhe6rqvIp5V+m9BAPt20+NbSHsBIrtEH+zb8nA3jmoDgQCHYj0QFwpgRqNqZnyC2c763
 E0MDX/al9tXqbmqYe4tX6qzhFBU928k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676664904;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRc0e5uIvfMVp5ULxxJVjzrBpmFpsMaB/O9Bi9dJ6kI=;
 b=laGEq9l+hesowseAkjTEBYo///KSyJECvctvtAunN1age63m2ChV8RPjgAIQU6OS2OFlX4
 WkHx+KlM3S4jHTAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62DE3138E3;
 Fri, 17 Feb 2023 20:15:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SJwfC0Xg72MwIAAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:15:01 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v6 20/29] target/arm: move cpu_tcg to tcg/cpu32.c
Date: Fri, 17 Feb 2023 17:11:41 -0300
Message-Id: <20230217201150.22032-21-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

From: Claudio Fontana <cfontana@suse.de>

move the module containing cpu models definitions
for 32bit TCG-only CPUs to tcg/ and rename it for clarity.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c                         |  2 +-
 target/arm/meson.build                |  1 -
 target/arm/{cpu_tcg.c => tcg/cpu32.c} | 13 +++----------
 target/arm/tcg/cpu64.c                |  2 +-
 target/arm/tcg/meson.build            |  1 +
 tests/qtest/arm-cpu-features.c        | 12 +++++++++---
 6 files changed, 15 insertions(+), 16 deletions(-)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (99%)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 20a18d0ba1..fbeeed115d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -204,9 +204,9 @@ static const int a15irqmap[] = {
 };
 
 static const char *valid_cpus[] = {
+#ifdef CONFIG_TCG
     ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
-#ifdef CONFIG_TCG
     ARM_CPU_TYPE_NAME("cortex-a35"),
     ARM_CPU_TYPE_NAME("cortex-a55"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
diff --git a/target/arm/meson.build b/target/arm/meson.build
index b0bc8a3cea..f03d242ba8 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -6,7 +6,6 @@ arm_ss.add(files(
   'gdbstub.c',
   'helper.c',
   'vfp_helper.c',
-  'cpu_tcg.c',
 ))
 arm_ss.add(zlib)
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/tcg/cpu32.c
similarity index 99%
rename from target/arm/cpu_tcg.c
rename to target/arm/tcg/cpu32.c
index 64d5a785c1..caa5252ad9 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/tcg/cpu32.c
@@ -1,5 +1,5 @@
 /*
- * QEMU ARM TCG CPUs.
+ * QEMU ARM TCG-only CPUs.
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -10,9 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
-#endif /* CONFIG_TCG */
 #include "internals.h"
 #include "target/arm/idau.h"
 #if !defined(CONFIG_USER_ONLY)
@@ -93,7 +91,7 @@ void aa32_max_features(ARMCPU *cpu)
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
+#if !defined(CONFIG_USER_ONLY)
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -117,7 +115,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return ret;
 }
-#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY */
 
 static void arm926_initfn(Object *obj)
 {
@@ -1013,7 +1011,6 @@ static void pxa270c5_initfn(Object *obj)
     cpu->reset_sctlr = 0x00000078;
 }
 
-#ifdef CONFIG_TCG
 static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
@@ -1034,7 +1031,6 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .debug_check_breakpoint = arm_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
-#endif /* CONFIG_TCG */
 
 static void arm_v7m_class_init(ObjectClass *oc, void *data)
 {
@@ -1042,10 +1038,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     CPUClass *cc = CPU_CLASS(oc);
 
     acc->info = data;
-#ifdef CONFIG_TCG
     cc->tcg_ops = &arm_v7m_tcg_ops;
-#endif /* CONFIG_TCG */
-
     cc->gdb_core_xml_file = "arm-m-profile.xml";
 }
 
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 89d54ec0f6..d0feb3eb52 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -457,7 +457,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
 
 /*
  * -cpu max: a CPU with as many features enabled as our emulation supports.
- * The version of '-cpu max' for qemu-system-arm is defined in cpu_tcg.c;
+ * The version of '-cpu max' for qemu-system-arm is defined in cpu32.c;
  * this only needs to handle 64 bits.
  */
 void aarch64_max_tcg_initfn(Object *obj)
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 128f782816..4d99f6dacb 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -18,6 +18,7 @@ gen = [
 arm_ss.add(gen)
 
 arm_ss.add(files(
+  'cpu32.c',
   'translate.c',
   'translate-m-nocp.c',
   'translate-mve.c',
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8691802950..4ff2014bea 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -506,9 +506,15 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         QDict *resp;
         char *error;
 
-        assert_error(qts, "cortex-a15",
-            "We cannot guarantee the CPU type 'cortex-a15' works "
-            "with KVM on this host", NULL);
+        if (qtest_has_accel("tcg")) {
+            assert_error(qts, "cortex-a15",
+                         "We cannot guarantee the CPU type 'cortex-a15' works "
+                         "with KVM on this host", NULL);
+        } else {
+            assert_error(qts, "cortex-a15",
+                         "The CPU type 'cortex-a15' is not a "
+                         "recognized ARM CPU type", NULL);
+        }
 
         assert_has_feature_enabled(qts, "host", "aarch64");
 
-- 
2.35.3


