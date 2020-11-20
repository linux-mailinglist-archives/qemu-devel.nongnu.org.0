Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E441D2BB81E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:11:40 +0100 (CET)
Received: from localhost ([::1]:41534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDgx-0004OZ-TU
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDeJ-0002lb-1m
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:08:55 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDeH-0003lK-C6
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:08:54 -0500
Received: by mail-wm1-x329.google.com with SMTP id 10so11849468wml.2
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+fc+YUz62tq02umlqIV5H66jZhdZhb5rDT17gD+B0T0=;
 b=T+c5m+fCdxu+clJ1SWsLGwARmZ6iZF1HIvE2x+jTGE6/Esg1fExuuA2PbAj+5PWHaB
 rBKxCgy0X4pt7vX6qeshU74KJ/X8xthS+6RYm+Fq05xmkJnPi6hHeud+N5jerDYRPGza
 u790RBarOzbfE/WAw2uv9CRv9gdu1LXTU251cMLCSxOIfOKyzQd2rlgUXVZ6oReMVsa9
 iEYw9UzCwCG0nQx7zLomtaQDSayBvd57iFxf0ZLVgPXNeaO+lqI1fYU23PX3hXIBB4l3
 0pKmfiRbluff8D760fEMqzPJzPcDfVFuOEpeZdyBSvc34STqtrDXQGK6JHMmAGJKFrNX
 aLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+fc+YUz62tq02umlqIV5H66jZhdZhb5rDT17gD+B0T0=;
 b=hTPxewyphyLdemuVd9aWdgE+gqvYPgGnEHc7LBnlN5Z5R8qO22ShzUf/tJAHK20FBf
 lohzQH01eOPrbwJCo+ljhMN56+HonJHBHB3Le1QD+1LAKBtPcijuxMxX+NL45ry5OIjw
 8qckSP+PCzjmFKJKZUcyM7D17uXX3EngJ/Qr+ar9g9NsvXuYAWc8nz1en3mhSh+sZ9GG
 zapmPDaDNEyCzzQWT6snunVOBYE6AE5f3e/jSQWMGBwFxm6UflDaHALLhO22fbj4csad
 ds3lDKvl0VxKEJK+BfVlv8Alxm0LmSuCXs0+uu1H95SX1iekbK92OnU/L9zGAm230xV6
 +/PA==
X-Gm-Message-State: AOAM531dGUyUU2qv+HoXnNpcR2RSR1kY0jpH8rB3HaaQYkxiXn5dhcuA
 G2Aa2h0Jm13/hbVvhyGxu8+iO8T+1f0=
X-Google-Smtp-Source: ABdhPJyMWl1CLz2CtmfNK1IxSBRRhLqCKClWf6WaMhSaron8adZwuSUc3h3uZbNWWPUz7jV1Yb7ZUQ==
X-Received: by 2002:a7b:c8d3:: with SMTP id f19mr11601864wml.17.1605906531772; 
 Fri, 20 Nov 2020 13:08:51 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id m3sm6678867wrv.6.2020.11.20.13.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:08:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/26] target/mips: Extract FPU helpers to 'fpu_helper.h'
Date: Fri, 20 Nov 2020 22:08:19 +0100
Message-Id: <20201120210844.2625602-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract FPU specific helpers from "internal.h" to "fpu_helper.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/fpu_helper.h   | 50 ++++++++++++++++++++++++++++++++++++++
 target/mips/internal.h     | 42 --------------------------------
 linux-user/mips/cpu_loop.c |  1 +
 target/mips/fpu_helper.c   |  1 +
 target/mips/gdbstub.c      |  1 +
 target/mips/kvm.c          |  1 +
 target/mips/machine.c      |  1 +
 target/mips/msa_helper.c   |  1 +
 target/mips/translate.c    |  1 +
 9 files changed, 57 insertions(+), 42 deletions(-)
 create mode 100644 target/mips/fpu_helper.h

diff --git a/target/mips/fpu_helper.h b/target/mips/fpu_helper.h
new file mode 100644
index 00000000000..83c698d583f
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
+extern unsigned int ieee_rm[];
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
index dd8a7809b64..7bea3af0b29 100644
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
@@ -222,48 +220,8 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        bool probe, uintptr_t retaddr);
 
 /* op_helper.c */
-uint32_t float_class_s(uint32_t arg, float_status *fst);
-uint64_t float_class_d(uint64_t arg, float_status *fst);
-
-extern unsigned int ieee_rm[];
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
index 020b768e87b..a74dc18d746 100644
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


