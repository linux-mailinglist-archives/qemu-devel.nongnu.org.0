Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF336A8F9B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:02:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvct-0007as-0h; Thu, 02 Mar 2023 21:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcr-0007a5-05
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:29 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcn-0001t1-Qn
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:28 -0500
Received: by mail-pl1-x635.google.com with SMTP id n6so1349474plf.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CMWr8hu2DUhhMopayYGFX1AvPPyHQPBspx9QuL7Pv04=;
 b=j1xzuovAaNsIROvcsbkqSGUMectFMHoRYkFqSPO4SGGp/lqqs0ZQQam1Yu0c1EnS2B
 ypI50q2hAqR8uRMSzO0fk65OuSed7QyWkOAaObgJpkIscUy3VLoe4Je3gMS3tNfbhKnh
 S0nVrwkBYc4ZnwPfWRjJ5NY+A6/alXVSppoqj8SlL/R2dm1pSoFlMy1/vnO9VACo0c+m
 7VUCxRMx6KTAn+cmBTziqkAOx4Pm14tBPSN0EI6hIsHZZPWzB/JBXZyzi4zKfbqkWopC
 EWBkdI7t+P3h84fCBgoCPc7DdVdzZISjipoVlAqK0dP4HE74nwh+WV53rwlAfkDqClAj
 bwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CMWr8hu2DUhhMopayYGFX1AvPPyHQPBspx9QuL7Pv04=;
 b=bFAqqcUtJ0fX5Bw3p/aLHopJjkV4xy3om6ZGcTYhXkA+Ba4MvIb3PDwK7uYTnO3ISx
 gOp//HGnKKVABLpdZ5oqA5+t9y9lafAdAOAwuAeCijToeXx6CTvmk1DSmcfKec0JctyF
 +E+ljMDARQdABYr6UVQGvRElQSX3vkx1yooVLgm1E/CAgCbzjcdzx/0bBqQkdlbftJ1n
 HY+bw4cUpIGJWrhg8Y3m2SqrBLDAxLigQn+mZniN0644Rp8ydPBxul0ZxlauBIMh3CsT
 FIAblcL2r5r2CSwMJy34Ltp+BtqyeXhecR6nJiJg81Yzb2FfiImcpLpkuNIMSHKqQb3D
 vY1w==
X-Gm-Message-State: AO0yUKUeB0oqPRFyc+vDZFQAH3uHEeYfjax8ZfP/mrZzqUYM/5tlU7V8
 L2rCprKFHoVOG1mBCaEMnvKZhGnJ4vIdJ+zWohk=
X-Google-Smtp-Source: AK7set/Bx6JBJe6yhKwtyB42wq4fzo18J3B8PnuyFs//nYSIKuwhdd33A54kKBUz9poPxMLfGy+kkQ==
X-Received: by 2002:a17:902:8bcb:b0:19e:664e:fcaf with SMTP id
 r11-20020a1709028bcb00b0019e664efcafmr546141plo.0.1677812304142; 
 Thu, 02 Mar 2023 18:58:24 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4.5 20/29] gdbstub: move register helpers into standalone
 include
Date: Thu,  2 Mar 2023 18:57:56 -0800
Message-Id: <20230303025805.625589-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Alex Bennée <alex.bennee@linaro.org>

These inline helpers are all used by target specific code so move them
out of the general header so we don't needlessly pollute the rest of
the API with target specific stuff.

Note we have to include cpu.h in semihosting as it was relying on a
side effect before.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-21-alex.bennee@linaro.org>
---
 include/exec/gdbstub.h                 |  86 ---------------------
 include/gdbstub/helpers.h              | 103 +++++++++++++++++++++++++
 semihosting/syscalls.c                 |   1 +
 target/alpha/gdbstub.c                 |   2 +-
 target/arm/gdbstub.c                   |   1 +
 target/arm/gdbstub64.c                 |   2 +-
 target/arm/tcg/helper-a64.c            |   2 +-
 target/arm/tcg/m_helper.c              |   1 +
 target/avr/gdbstub.c                   |   2 +-
 target/cris/gdbstub.c                  |   2 +-
 target/hexagon/gdbstub.c               |   2 +-
 target/hppa/gdbstub.c                  |   2 +-
 target/i386/gdbstub.c                  |   2 +-
 target/i386/whpx/whpx-all.c            |   2 +-
 target/loongarch/gdbstub.c             |   1 +
 target/m68k/gdbstub.c                  |   2 +-
 target/m68k/helper.c                   |   1 +
 target/m68k/m68k-semi.c                |   1 +
 target/microblaze/gdbstub.c            |   2 +-
 target/mips/gdbstub.c                  |   2 +-
 target/mips/tcg/sysemu/mips-semi.c     |   1 +
 target/nios2/cpu.c                     |   2 +-
 target/nios2/nios2-semi.c              |   1 +
 target/openrisc/gdbstub.c              |   2 +-
 target/openrisc/interrupt.c            |   2 +-
 target/openrisc/mmu.c                  |   2 +-
 target/ppc/cpu_init.c                  |   2 +-
 target/ppc/gdbstub.c                   |   1 +
 target/riscv/gdbstub.c                 |   1 +
 target/rx/gdbstub.c                    |   2 +-
 target/s390x/gdbstub.c                 |   1 +
 target/s390x/helper.c                  |   2 +-
 target/sh4/gdbstub.c                   |   2 +-
 target/sparc/gdbstub.c                 |   2 +-
 target/tricore/gdbstub.c               |   2 +-
 target/xtensa/core-dc232b.c            |   2 +-
 target/xtensa/core-dc233c.c            |   2 +-
 target/xtensa/core-de212.c             |   2 +-
 target/xtensa/core-de233_fpu.c         |   2 +-
 target/xtensa/core-dsp3400.c           |   2 +-
 target/xtensa/core-fsf.c               |   2 +-
 target/xtensa/core-lx106.c             |   2 +-
 target/xtensa/core-sample_controller.c |   2 +-
 target/xtensa/core-test_kc705_be.c     |   2 +-
 target/xtensa/core-test_mmuhifi_c3.c   |   2 +-
 target/xtensa/gdbstub.c                |   2 +-
 target/xtensa/helper.c                 |   2 +-
 target/xtensa/import_core.sh           |   2 +-
 48 files changed, 149 insertions(+), 121 deletions(-)
 create mode 100644 include/gdbstub/helpers.h

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 8fff5450ed..bb8a3928dd 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -110,92 +110,6 @@ void gdb_register_coprocessor(CPUState *cpu,
                               gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
                               int num_regs, const char *xml, int g_pos);
 
-#ifdef NEED_CPU_H
-#include "cpu.h"
-
-/*
- * The GDB remote protocol transfers values in target byte order. As
- * the gdbstub may be batching up several register values we always
- * append to the array.
- */
-
-static inline int gdb_get_reg8(GByteArray *buf, uint8_t val)
-{
-    g_byte_array_append(buf, &val, 1);
-    return 1;
-}
-
-static inline int gdb_get_reg16(GByteArray *buf, uint16_t val)
-{
-    uint16_t to_word = tswap16(val);
-    g_byte_array_append(buf, (uint8_t *) &to_word, 2);
-    return 2;
-}
-
-static inline int gdb_get_reg32(GByteArray *buf, uint32_t val)
-{
-    uint32_t to_long = tswap32(val);
-    g_byte_array_append(buf, (uint8_t *) &to_long, 4);
-    return 4;
-}
-
-static inline int gdb_get_reg64(GByteArray *buf, uint64_t val)
-{
-    uint64_t to_quad = tswap64(val);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-    return 8;
-}
-
-static inline int gdb_get_reg128(GByteArray *buf, uint64_t val_hi,
-                                 uint64_t val_lo)
-{
-    uint64_t to_quad;
-#if TARGET_BIG_ENDIAN
-    to_quad = tswap64(val_hi);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-    to_quad = tswap64(val_lo);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-#else
-    to_quad = tswap64(val_lo);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-    to_quad = tswap64(val_hi);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-#endif
-    return 16;
-}
-
-static inline int gdb_get_zeroes(GByteArray *array, size_t len)
-{
-    guint oldlen = array->len;
-    g_byte_array_set_size(array, oldlen + len);
-    memset(array->data + oldlen, 0, len);
-
-    return len;
-}
-
-/**
- * gdb_get_reg_ptr: get pointer to start of last element
- * @len: length of element
- *
- * This is a helper function to extract the pointer to the last
- * element for additional processing. Some front-ends do additional
- * dynamic swapping of the elements based on CPU state.
- */
-static inline uint8_t * gdb_get_reg_ptr(GByteArray *buf, int len)
-{
-    return buf->data + buf->len - len;
-}
-
-#if TARGET_LONG_BITS == 64
-#define gdb_get_regl(buf, val) gdb_get_reg64(buf, val)
-#define ldtul_p(addr) ldq_p(addr)
-#else
-#define gdb_get_regl(buf, val) gdb_get_reg32(buf, val)
-#define ldtul_p(addr) ldl_p(addr)
-#endif
-
-#endif /* NEED_CPU_H */
-
 /**
  * gdbserver_start: start the gdb server
  * @port_or_device: connection spec for gdb
diff --git a/include/gdbstub/helpers.h b/include/gdbstub/helpers.h
new file mode 100644
index 0000000000..c573aef2dc
--- /dev/null
+++ b/include/gdbstub/helpers.h
@@ -0,0 +1,103 @@
+/*
+ * gdbstub helpers
+ *
+ * These are all used by the various frontends and have to be host
+ * aware to ensure things are store in target order.
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _GDBSTUB_HELPERS_H_
+#define _GDBSTUB_HELPERS_H_
+
+#ifdef NEED_CPU_H
+#include "cpu.h"
+
+/*
+ * The GDB remote protocol transfers values in target byte order. As
+ * the gdbstub may be batching up several register values we always
+ * append to the array.
+ */
+
+static inline int gdb_get_reg8(GByteArray *buf, uint8_t val)
+{
+    g_byte_array_append(buf, &val, 1);
+    return 1;
+}
+
+static inline int gdb_get_reg16(GByteArray *buf, uint16_t val)
+{
+    uint16_t to_word = tswap16(val);
+    g_byte_array_append(buf, (uint8_t *) &to_word, 2);
+    return 2;
+}
+
+static inline int gdb_get_reg32(GByteArray *buf, uint32_t val)
+{
+    uint32_t to_long = tswap32(val);
+    g_byte_array_append(buf, (uint8_t *) &to_long, 4);
+    return 4;
+}
+
+static inline int gdb_get_reg64(GByteArray *buf, uint64_t val)
+{
+    uint64_t to_quad = tswap64(val);
+    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
+    return 8;
+}
+
+static inline int gdb_get_reg128(GByteArray *buf, uint64_t val_hi,
+                                 uint64_t val_lo)
+{
+    uint64_t to_quad;
+#if TARGET_BIG_ENDIAN
+    to_quad = tswap64(val_hi);
+    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
+    to_quad = tswap64(val_lo);
+    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
+#else
+    to_quad = tswap64(val_lo);
+    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
+    to_quad = tswap64(val_hi);
+    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
+#endif
+    return 16;
+}
+
+static inline int gdb_get_zeroes(GByteArray *array, size_t len)
+{
+    guint oldlen = array->len;
+    g_byte_array_set_size(array, oldlen + len);
+    memset(array->data + oldlen, 0, len);
+
+    return len;
+}
+
+/**
+ * gdb_get_reg_ptr: get pointer to start of last element
+ * @len: length of element
+ *
+ * This is a helper function to extract the pointer to the last
+ * element for additional processing. Some front-ends do additional
+ * dynamic swapping of the elements based on CPU state.
+ */
+static inline uint8_t *gdb_get_reg_ptr(GByteArray *buf, int len)
+{
+    return buf->data + buf->len - len;
+}
+
+#if TARGET_LONG_BITS == 64
+#define gdb_get_regl(buf, val) gdb_get_reg64(buf, val)
+#define ldtul_p(addr) ldq_p(addr)
+#else
+#define gdb_get_regl(buf, val) gdb_get_reg32(buf, val)
+#define ldtul_p(addr) ldl_p(addr)
+#endif
+
+#else
+#error "gdbstub helpers should only be included by target specific code"
+#endif
+
+#endif /* _GDBSTUB_HELPERS_H_ */
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index e89992cf90..d69078899a 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "exec/gdbstub.h"
+#include "cpu.h"
 #include "semihosting/guestfd.h"
 #include "semihosting/syscalls.h"
 #include "semihosting/console.h"
diff --git a/target/alpha/gdbstub.c b/target/alpha/gdbstub.c
index 7db14f4431..0f8fa150f8 100644
--- a/target/alpha/gdbstub.c
+++ b/target/alpha/gdbstub.c
@@ -19,7 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 
 int alpha_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 2f806512d0..05d6eb802a 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "internals.h"
 #include "cpregs.h"
 
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 07a6746944..48d2888b6f 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -20,7 +20,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "internals.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 
 int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 0972a4bdd0..c3edf163be 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "qemu/log.h"
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index f94e87e728..e05da83af5 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "internals.h"
+#include "gdbstub/helpers.h"
 #include "exec/helper-proto.h"
 #include "qemu/main-loop.h"
 #include "qemu/bitops.h"
diff --git a/target/avr/gdbstub.c b/target/avr/gdbstub.c
index 1c1b908c92..150344d8b9 100644
--- a/target/avr/gdbstub.c
+++ b/target/avr/gdbstub.c
@@ -19,7 +19,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 
 int avr_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
diff --git a/target/cris/gdbstub.c b/target/cris/gdbstub.c
index 2418d575b1..25c0ca33a5 100644
--- a/target/cris/gdbstub.c
+++ b/target/cris/gdbstub.c
@@ -19,7 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 
 int crisv10_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
diff --git a/target/hexagon/gdbstub.c b/target/hexagon/gdbstub.c
index d152d01bfe..46083da620 100644
--- a/target/hexagon/gdbstub.c
+++ b/target/hexagon/gdbstub.c
@@ -16,7 +16,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "cpu.h"
 #include "internal.h"
 
diff --git a/target/hppa/gdbstub.c b/target/hppa/gdbstub.c
index 729c37b2ca..48a514384f 100644
--- a/target/hppa/gdbstub.c
+++ b/target/hppa/gdbstub.c
@@ -19,7 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 
 int hppa_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index 786971284a..ebb000df6a 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -19,7 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "include/gdbstub/helpers.h"
 
 #ifdef TARGET_X86_64
 static const int gpr_map[16] = {
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 3d0c0b375f..52af81683c 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -12,7 +12,7 @@
 #include "cpu.h"
 #include "exec/address-spaces.h"
 #include "exec/ioport.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/accel.h"
 #include "sysemu/whpx.h"
 #include "sysemu/cpus.h"
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index a4d1e28e36..fa3e034d15 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -10,6 +10,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 
 uint64_t read_fcc(CPULoongArchState *env)
 {
diff --git a/target/m68k/gdbstub.c b/target/m68k/gdbstub.c
index eb2d030e14..1e5f033a12 100644
--- a/target/m68k/gdbstub.c
+++ b/target/m68k/gdbstub.c
@@ -19,7 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 
 int m68k_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 4621cf2402..3b3a6ea8bd 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -23,6 +23,7 @@
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
+#include "gdbstub/helpers.h"
 #include "fpu/softfloat.h"
 #include "qemu/qemu-print.h"
 
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 87b1314925..f753710d7d 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -21,6 +21,7 @@
 
 #include "cpu.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "semihosting/syscalls.h"
 #include "semihosting/softmmu-uaccess.h"
 #include "hw/boards.h"
diff --git a/target/microblaze/gdbstub.c b/target/microblaze/gdbstub.c
index 8143fcae88..29ac6e9c0f 100644
--- a/target/microblaze/gdbstub.c
+++ b/target/microblaze/gdbstub.c
@@ -19,7 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 
 /*
  * GDB expects SREGs in the following order:
diff --git a/target/mips/gdbstub.c b/target/mips/gdbstub.c
index f1c2a2cf6d..62d7b72407 100644
--- a/target/mips/gdbstub.c
+++ b/target/mips/gdbstub.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "internal.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "fpu_helper.h"
 
 int mips_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 85f0567a7f..4e6e759057 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "qemu/log.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "semihosting/softmmu-uaccess.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index cff30823da..bc5cbf81c2 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -23,7 +23,7 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "exec/log.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "hw/qdev-properties.h"
 
 static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index f76e8588c5..113b3f22aa 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -24,6 +24,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "semihosting/syscalls.h"
 #include "semihosting/softmmu-uaccess.h"
 #include "qemu/log.h"
diff --git a/target/openrisc/gdbstub.c b/target/openrisc/gdbstub.c
index 095bf76c12..d1074a0581 100644
--- a/target/openrisc/gdbstub.c
+++ b/target/openrisc/gdbstub.c
@@ -19,7 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 
 int openrisc_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
index c31c6f12c4..3887812810 100644
--- a/target/openrisc/interrupt.c
+++ b/target/openrisc/interrupt.c
@@ -21,7 +21,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/host-utils.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/loader.h"
diff --git a/target/openrisc/mmu.c b/target/openrisc/mmu.c
index 0b8afdbacf..603c26715e 100644
--- a/target/openrisc/mmu.c
+++ b/target/openrisc/mmu.c
@@ -22,7 +22,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/host-utils.h"
 #include "hw/loader.h"
 
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d62ffe8a6f..0ce2e3c91d 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "disas/dis-asm.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "kvm_ppc.h"
 #include "sysemu/cpus.h"
 #include "sysemu/hw_accel.h"
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 1a0b9ca82c..d2bc1d7c53 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "internal.h"
 
 static int ppc_gdb_register_len_apple(int n)
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 6e7bbdbd5e..a542683901 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -18,6 +18,7 @@
 
 #include "qemu/osdep.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "cpu.h"
 
 struct TypeSize {
diff --git a/target/rx/gdbstub.c b/target/rx/gdbstub.c
index 7eb2059a84..d7e0e6689b 100644
--- a/target/rx/gdbstub.c
+++ b/target/rx/gdbstub.c
@@ -17,7 +17,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 
 int rx_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index a5d69d0e0b..0cb69395b4 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -23,6 +23,7 @@
 #include "s390x-internal.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/bitops.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/tcg.h"
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 473c8e51b0..2b363aa959 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -21,7 +21,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "s390x-internal.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/timer.h"
 #include "hw/s390x/ioinst.h"
 #include "hw/s390x/pv.h"
diff --git a/target/sh4/gdbstub.c b/target/sh4/gdbstub.c
index 3488f68e32..d8e199fc06 100644
--- a/target/sh4/gdbstub.c
+++ b/target/sh4/gdbstub.c
@@ -19,7 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 
 /* Hint: Use "set architecture sh4" in GDB to see fpu registers */
 /* FIXME: We should use XML for this.  */
diff --git a/target/sparc/gdbstub.c b/target/sparc/gdbstub.c
index 5d1e808e8c..a1c8fdc4d5 100644
--- a/target/sparc/gdbstub.c
+++ b/target/sparc/gdbstub.c
@@ -19,7 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 
 #ifdef TARGET_ABI32
 #define gdb_get_rega(buf, val) gdb_get_reg32(buf, val)
diff --git a/target/tricore/gdbstub.c b/target/tricore/gdbstub.c
index 3a27a7e65d..e8f8e5e6ea 100644
--- a/target/tricore/gdbstub.c
+++ b/target/tricore/gdbstub.c
@@ -18,7 +18,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 
 
 #define LCX_REGNUM         32
diff --git a/target/xtensa/core-dc232b.c b/target/xtensa/core-dc232b.c
index c982d09c24..9aba2667e3 100644
--- a/target/xtensa/core-dc232b.c
+++ b/target/xtensa/core-dc232b.c
@@ -27,7 +27,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/host-utils.h"
 #include "qemu/timer.h"
 
diff --git a/target/xtensa/core-dc233c.c b/target/xtensa/core-dc233c.c
index 595ab9a90f..9b0a625063 100644
--- a/target/xtensa/core-dc233c.c
+++ b/target/xtensa/core-dc233c.c
@@ -27,7 +27,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/host-utils.h"
 
 #include "core-dc233c/core-isa.h"
diff --git a/target/xtensa/core-de212.c b/target/xtensa/core-de212.c
index 50c995ba79..b08fe22e65 100644
--- a/target/xtensa/core-de212.c
+++ b/target/xtensa/core-de212.c
@@ -27,7 +27,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/host-utils.h"
 
 #include "core-de212/core-isa.h"
diff --git a/target/xtensa/core-de233_fpu.c b/target/xtensa/core-de233_fpu.c
index 41af8057fb..8845cdb592 100644
--- a/target/xtensa/core-de233_fpu.c
+++ b/target/xtensa/core-de233_fpu.c
@@ -27,7 +27,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/host-utils.h"
 
 #include "core-de233_fpu/core-isa.h"
diff --git a/target/xtensa/core-dsp3400.c b/target/xtensa/core-dsp3400.c
index 81e425c568..c0f94b9e27 100644
--- a/target/xtensa/core-dsp3400.c
+++ b/target/xtensa/core-dsp3400.c
@@ -27,7 +27,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/host-utils.h"
 
 #include "core-dsp3400/core-isa.h"
diff --git a/target/xtensa/core-fsf.c b/target/xtensa/core-fsf.c
index 3327c50b4f..310be8d61f 100644
--- a/target/xtensa/core-fsf.c
+++ b/target/xtensa/core-fsf.c
@@ -27,7 +27,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/host-utils.h"
 
 #include "core-fsf/core-isa.h"
diff --git a/target/xtensa/core-lx106.c b/target/xtensa/core-lx106.c
index 7a771d09a6..7f71d088f3 100644
--- a/target/xtensa/core-lx106.c
+++ b/target/xtensa/core-lx106.c
@@ -27,7 +27,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/host-utils.h"
 
 #include "core-lx106/core-isa.h"
diff --git a/target/xtensa/core-sample_controller.c b/target/xtensa/core-sample_controller.c
index fd5de5576b..8867001aac 100644
--- a/target/xtensa/core-sample_controller.c
+++ b/target/xtensa/core-sample_controller.c
@@ -27,7 +27,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/host-utils.h"
 
 #include "core-sample_controller/core-isa.h"
diff --git a/target/xtensa/core-test_kc705_be.c b/target/xtensa/core-test_kc705_be.c
index 294c16f2f4..bd082f49aa 100644
--- a/target/xtensa/core-test_kc705_be.c
+++ b/target/xtensa/core-test_kc705_be.c
@@ -27,7 +27,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/host-utils.h"
 
 #include "core-test_kc705_be/core-isa.h"
diff --git a/target/xtensa/core-test_mmuhifi_c3.c b/target/xtensa/core-test_mmuhifi_c3.c
index c0e5d32d1e..3090dd01ed 100644
--- a/target/xtensa/core-test_mmuhifi_c3.c
+++ b/target/xtensa/core-test_mmuhifi_c3.c
@@ -27,7 +27,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/host-utils.h"
 
 #include "core-test_mmuhifi_c3/core-isa.h"
diff --git a/target/xtensa/gdbstub.c b/target/xtensa/gdbstub.c
index b6696063e5..4b3bfb7e59 100644
--- a/target/xtensa/gdbstub.c
+++ b/target/xtensa/gdbstub.c
@@ -19,7 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/log.h"
 
 enum {
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index 2aa9777a8e..dbeb97a953 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -29,7 +29,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "exec/helper-proto.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
diff --git a/target/xtensa/import_core.sh b/target/xtensa/import_core.sh
index b4c15556c2..17dfec8957 100755
--- a/target/xtensa/import_core.sh
+++ b/target/xtensa/import_core.sh
@@ -41,7 +41,7 @@ tar -xf "$OVERLAY" -O binutils/xtensa-modules.c | \
 cat <<EOF > "${TARGET}.c"
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/helpers.h"
 #include "qemu/host-utils.h"
 
 #include "core-$NAME/core-isa.h"
-- 
2.34.1


