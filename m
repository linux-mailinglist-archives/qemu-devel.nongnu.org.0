Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1922C1707
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:53:51 +0100 (CET)
Received: from localhost ([::1]:51876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIqM-0000yy-8g
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIhw-0000j6-Jb
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:45:12 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIhq-0001Al-VQ
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:45:04 -0500
Received: by mail-wr1-x42b.google.com with SMTP id i2so1081984wrs.4
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MK2uHhpNIWKEQBVWTQsuDC1qbyeediSuomIIPq7aUys=;
 b=iFp1Mltt3KbFMhp4El2npndIs/qXLepRTI0+0lkKthro/yYUQpn8aarhi3j2aiepPt
 DfwWn0tNF4kVKGneEKZ38NGhtNRQTxsayyumCpiY/mhKdbdMHkqFsMdRpde4yt017uWb
 0s5fUNYAsfOhxEy3rTje+WFO0TkQAMlNLbcEz/CnD7v35iXJAWnWcL7YZpflvBzKI+5r
 J1Z7yYbYABsgWkM96+e/OE5XTPNY50LyvNXTa1pkwhPBRDrAGDYVEf54Vva/hkYTDMsT
 6VJKsyCSyO8FaVu1ggwpenb77ScRtw/qO74AVorTB2t3d7Gfs4W3KdQPCquw+DcV67cT
 Qg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MK2uHhpNIWKEQBVWTQsuDC1qbyeediSuomIIPq7aUys=;
 b=gEfeDUArh2qT05/1K48sZP0omRwnzuq+0djVlqIVnUAAnJmYL5GYqFJLcN0HYnYrGB
 48DUvCHWhwRZvr2dD0TzAZ8SvLi1tnrOqbzOxFKi+E/AUXGpldKhHydlhvE30D1zn9Qj
 Ioh+VffKDn2q035MX9J0aiX9bIZev3g2IFq4O2ELOT4CBj4N+/ENl3bfvQHjCKMV3Gsx
 D6sHGbJnl8TDgi6SQ4A+g3MHyMJ1kx1+oGYkVdP6AfW4oj4qEDnE4tH1R1Tekl+D2yq0
 PxBe1DiCtCfzvnZQtexZerpokbyon436StpZxsPNTfCAtyVOxnD9QVMJpMAyVk5pOwuw
 oeiQ==
X-Gm-Message-State: AOAM530DEyP/RlWvzpGOr3UH+TBt8aiFVP8NuLxcRkPMISWmk5EFh15g
 Jp+i9lfej4uc7cpjrDCY9scLCt9vgSo=
X-Google-Smtp-Source: ABdhPJwRwtpQQztVBRE8o2Z9h9uxW4XWS0IV1CYI9RtfFQQ9kLxNGCibWwkK0iGpXONkf77jtzQZiA==
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr1476459wrr.85.1606164300590; 
 Mon, 23 Nov 2020 12:45:00 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id t13sm21879411wru.67.2020.11.23.12.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:44:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/28] target/mips: Extract FPU helpers to 'fpu_helper.h'
Date: Mon, 23 Nov 2020 21:44:22 +0100
Message-Id: <20201123204448.3260804-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract FPU specific helpers from "internal.h" to "fpu_helper.h".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201120210844.2625602-2-f4bug@amsat.org>
---
 target/mips/fpu_helper.h   | 50 ++++++++++++++++++++++++++++++++++++++
 target/mips/internal.h     | 43 --------------------------------
 linux-user/mips/cpu_loop.c |  1 +
 target/mips/fpu_helper.c   |  1 +
 target/mips/gdbstub.c      |  1 +
 target/mips/kvm.c          |  1 +
 target/mips/machine.c      |  1 +
 target/mips/msa_helper.c   |  1 +
 target/mips/translate.c    |  1 +
 9 files changed, 57 insertions(+), 43 deletions(-)
 create mode 100644 target/mips/fpu_helper.h

diff --git a/target/mips/fpu_helper.h b/target/mips/fpu_helper.h
new file mode 100644
index 00000000000..3aaee3f3430
--- /dev/null
+++ b/target/mips/fpu_helper.h
@@ -0,0 +1,50 @@
+/*
+ *  Helpers for emulation of FPU-related MIPS instructions.
+ *
+ *  Copyright (C) 2004-2005  Jocelyn Mayer
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+#include "fpu/softfloat-helpers.h"
+#include "cpu.h"
+
+extern const FloatRoundMode ieee_rm[4];
+
+uint32_t float_class_s(uint32_t arg, float_status *fst);
+uint64_t float_class_d(uint64_t arg, float_status *fst);
+
+static inline void restore_rounding_mode(CPUMIPSState *env)
+{
+    set_float_rounding_mode(ieee_rm[env->active_fpu.fcr31 & 3],
+                            &env->active_fpu.fp_status);
+}
+
+static inline void restore_flush_mode(CPUMIPSState *env)
+{
+    set_flush_to_zero((env->active_fpu.fcr31 & (1 << FCR31_FS)) != 0,
+                      &env->active_fpu.fp_status);
+}
+
+static inline void restore_snan_bit_mode(CPUMIPSState *env)
+{
+    set_snan_bit_is_one((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) == 0,
+                        &env->active_fpu.fp_status);
+}
+
+static inline void restore_fp_status(CPUMIPSState *env)
+{
+    restore_rounding_mode(env);
+    restore_flush_mode(env);
+    restore_snan_bit_mode(env);
+}
+
+static inline void restore_msa_fp_status(CPUMIPSState *env)
+{
+    float_status *status = &env->active_tc.msa_fp_status;
+    int rounding_mode = (env->active_tc.msacsr & MSACSR_RM_MASK) >> MSACSR_RM;
+    bool flush_to_zero = (env->active_tc.msacsr & MSACSR_FS_MASK) != 0;
+
+    set_float_rounding_mode(ieee_rm[rounding_mode], status);
+    set_flush_to_zero(flush_to_zero, status);
+    set_flush_inputs_to_zero(flush_to_zero, status);
+}
diff --git a/target/mips/internal.h b/target/mips/internal.h
index bbd10e9d45f..7bea3af0b29 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -8,8 +8,6 @@
 #ifndef MIPS_INTERNAL_H
 #define MIPS_INTERNAL_H
 
-#include "fpu/softfloat-helpers.h"
-
 /*
  * MMU types, the first four entries have the same layout as the
  * CP0C0_MT field.
@@ -222,49 +220,8 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        bool probe, uintptr_t retaddr);
 
 /* op_helper.c */
-uint32_t float_class_s(uint32_t arg, float_status *fst);
-uint64_t float_class_d(uint64_t arg, float_status *fst);
-
-extern const FloatRoundMode ieee_rm[4];
-
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
 
-static inline void restore_rounding_mode(CPUMIPSState *env)
-{
-    set_float_rounding_mode(ieee_rm[env->active_fpu.fcr31 & 3],
-                            &env->active_fpu.fp_status);
-}
-
-static inline void restore_flush_mode(CPUMIPSState *env)
-{
-    set_flush_to_zero((env->active_fpu.fcr31 & (1 << FCR31_FS)) != 0,
-                      &env->active_fpu.fp_status);
-}
-
-static inline void restore_snan_bit_mode(CPUMIPSState *env)
-{
-    set_snan_bit_is_one((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) == 0,
-                        &env->active_fpu.fp_status);
-}
-
-static inline void restore_fp_status(CPUMIPSState *env)
-{
-    restore_rounding_mode(env);
-    restore_flush_mode(env);
-    restore_snan_bit_mode(env);
-}
-
-static inline void restore_msa_fp_status(CPUMIPSState *env)
-{
-    float_status *status = &env->active_tc.msa_fp_status;
-    int rounding_mode = (env->active_tc.msacsr & MSACSR_RM_MASK) >> MSACSR_RM;
-    bool flush_to_zero = (env->active_tc.msacsr & MSACSR_FS_MASK) != 0;
-
-    set_float_rounding_mode(ieee_rm[rounding_mode], status);
-    set_flush_to_zero(flush_to_zero, status);
-    set_flush_inputs_to_zero(flush_to_zero, status);
-}
-
 static inline void restore_pamask(CPUMIPSState *env)
 {
     if (env->hflags & MIPS_HFLAG_ELPA) {
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index cfe7ba5c47d..b58dbeb83d1 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -23,6 +23,7 @@
 #include "cpu_loop-common.h"
 #include "elf.h"
 #include "internal.h"
+#include "fpu_helper.h"
 
 # ifdef TARGET_ABI_MIPSO32
 #  define MIPS_SYSCALL_NUMBER_UNUSED -1
diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 501bd401a16..7d949cd8e3a 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -31,6 +31,7 @@
 #include "exec/memop.h"
 #include "sysemu/kvm.h"
 #include "fpu/softfloat.h"
+#include "fpu_helper.h"
 
 
 /* Complex FPU operations which may need stack space. */
diff --git a/target/mips/gdbstub.c b/target/mips/gdbstub.c
index e39f8d75cf0..f1c2a2cf6d6 100644
--- a/target/mips/gdbstub.c
+++ b/target/mips/gdbstub.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "internal.h"
 #include "exec/gdbstub.h"
+#include "fpu_helper.h"
 
 int mips_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index 72637a1e021..df47eded328 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -27,6 +27,7 @@
 #include "kvm_mips.h"
 #include "exec/memattrs.h"
 #include "hw/boards.h"
+#include "fpu_helper.h"
 
 #define DEBUG_KVM 0
 
diff --git a/target/mips/machine.c b/target/mips/machine.c
index 5b23e3e912a..a4ea67c2980 100644
--- a/target/mips/machine.c
+++ b/target/mips/machine.c
@@ -2,6 +2,7 @@
 #include "cpu.h"
 #include "internal.h"
 #include "migration/cpu.h"
+#include "fpu_helper.h"
 
 static int cpu_post_load(void *opaque, int version_id)
 {
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 249f0fdad80..b89b4c44902 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -23,6 +23,7 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
+#include "fpu_helper.h"
 
 /* Data format min and max values */
 #define DF_BITS(df) (1 << ((df) + 3))
diff --git a/target/mips/translate.c b/target/mips/translate.c
index c64a1bc42e1..5ec9fd7e92a 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -39,6 +39,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
+#include "fpu_helper.h"
 
 #define MIPS_DEBUG_DISAS 0
 
-- 
2.26.2


