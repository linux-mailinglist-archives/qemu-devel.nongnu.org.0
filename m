Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87D836FB91
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:33:59 +0200 (CEST)
Received: from localhost ([::1]:47962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTHK-0002XM-Pk
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBZ-0005oi-OW
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:01 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBL-0003uG-Ny
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:01 -0400
Received: by mail-wr1-x430.google.com with SMTP id x7so70543536wrw.10
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 06:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Gh79ck4FlFPcKEk1rzUMq0CLfgwlB1dTvg+/l16Ufic=;
 b=BoHE0kaT7dFEaSAmSVaJjR425Z5SsFYKHR0g2T6aNUOwOSfCDgREEuvltIfp3Uu+/b
 KVMFr+EOGneAfIDaPs3BeIO49bEkIGJynxgg7lXZ2o6fabt8ETlmElM4X8sK2wYyG81A
 7JyFxHuDQqDD5D4lUtoq/aOVdnqO9Dupu0u+nIasvtTmzvRnQuBKZXTz77m9VWeODTr1
 00v9uLutEe1rFGLOEtjcHVz0W9cMvZlzAILY8gDrqrYP906K1Z1C935MiJH6tUn8z40Y
 5xB6aC8s+dOeed7Oqfo/rjOBM9hFX132rkqXlhbIZeCvwQv74Nzu1UECQS/kS3m8dwn0
 bWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gh79ck4FlFPcKEk1rzUMq0CLfgwlB1dTvg+/l16Ufic=;
 b=FOsnVdPqcPVnVtNcRzUUXvtNlW/W1+UqeJS60hxljITr2FBoReaSk471PwqmsDqI1+
 xx/bQjRxvojXg+sJ6G2NISqHoONwpY00r/hvm2Gda4RJ6FW/D0zBTpTv/4GXz75lBBQd
 2vK+L4IQkUuFZZ2UpDKL6G5yBAptYd+ZVUAoSCjXYc8HYnNhcOHO0+ogsJnApsbp2Y7u
 /RGaJA+6GOo9SNh3qp2FxFj0/ut6WVoxi1m63VMJ20aX/jcAyRkuBIjpzr71FHenlWD0
 L2btu54TeUhjkSMsAVOYaLTY1n6raDo6fXIBQGetRxRbh4fd2wonlWD0bJEMiQz8+y2f
 k+bQ==
X-Gm-Message-State: AOAM532jdNaQawDqD7uZOPwty9R6AYjUDFp5V4NhCdTfhSXHsJ5u0hJO
 rZtI6MHWHx+qRV3flwX5gQw3K8AEKbQtfcfy
X-Google-Smtp-Source: ABdhPJxZZdZic5eSJfcOLZ9aaCkNBlgXmD8CWNLVBXNpDHxI0FCToqeOFe+1ojltJJmODKgKiLeonw==
X-Received: by 2002:a5d:534d:: with SMTP id t13mr6862799wrv.153.1619789265225; 
 Fri, 30 Apr 2021 06:27:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm2420349wrx.15.2021.04.30.06.27.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 06:27:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/13] target/arm: Make functions used by m-nocp global
Date: Fri, 30 Apr 2021 14:27:30 +0100
Message-Id: <20210430132740.10391-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430132740.10391-1-peter.maydell@linaro.org>
References: <20210430132740.10391-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to split out the .c.inc files which are currently included
into translate.c so they are separate compilation units.  To do this
we need to make some functions which are currently file-local to
translate.c have global scope; create a translate-a32.h paralleling
the existing translate-a64.h as a place for these declarations to
live, so that code moved into the new compilation units can call
them.

The functions made global here are those required by the
m-nocp.decode functions, except that I have converted the whole
family of {read,write}_neon_element* and also both the load_cpu and
store_cpu functions for consistency, even though m-nocp only wants a
few functions from each.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a32.h     | 57 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 39 +++++------------------
 target/arm/translate-vfp.c.inc |  2 +-
 3 files changed, 65 insertions(+), 33 deletions(-)
 create mode 100644 target/arm/translate-a32.h

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
new file mode 100644
index 00000000000..c5d937b27e8
--- /dev/null
+++ b/target/arm/translate-a32.h
@@ -0,0 +1,57 @@
+/*
+ *  AArch32 translation, common definitions.
+ *
+ * Copyright (c) 2021 Linaro, Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef TARGET_ARM_TRANSLATE_A64_H
+#define TARGET_ARM_TRANSLATE_A64_H
+
+void load_reg_var(DisasContext *s, TCGv_i32 var, int reg);
+void arm_gen_condlabel(DisasContext *s);
+bool vfp_access_check(DisasContext *s);
+void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop);
+void read_neon_element64(TCGv_i64 dest, int reg, int ele, MemOp memop);
+void write_neon_element32(TCGv_i32 src, int reg, int ele, MemOp memop);
+void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop);
+
+static inline TCGv_i32 load_cpu_offset(int offset)
+{
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    tcg_gen_ld_i32(tmp, cpu_env, offset);
+    return tmp;
+}
+
+#define load_cpu_field(name) load_cpu_offset(offsetof(CPUARMState, name))
+
+static inline void store_cpu_offset(TCGv_i32 var, int offset)
+{
+    tcg_gen_st_i32(var, cpu_env, offset);
+    tcg_temp_free_i32(var);
+}
+
+#define store_cpu_field(var, name) \
+    store_cpu_offset(var, offsetof(CPUARMState, name))
+
+/* Create a new temporary and set it to the value of a CPU register.  */
+static inline TCGv_i32 load_reg(DisasContext *s, int reg)
+{
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    load_reg_var(s, tmp, reg);
+    return tmp;
+}
+
+#endif
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8b71b1c41b6..3c1d52279bc 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -50,6 +50,7 @@
 #define ENABLE_ARCH_8     arm_dc_feature(s, ARM_FEATURE_V8)
 
 #include "translate.h"
+#include "translate-a32.h"
 
 #if defined(CONFIG_USER_ONLY)
 #define IS_USER(s) 1
@@ -101,7 +102,7 @@ void arm_translate_init(void)
 }
 
 /* Generate a label used for skipping this instruction */
-static void arm_gen_condlabel(DisasContext *s)
+void arm_gen_condlabel(DisasContext *s)
 {
     if (!s->condjmp) {
         s->condlabel = gen_new_label();
@@ -187,24 +188,6 @@ static inline int get_a32_user_mem_index(DisasContext *s)
     }
 }
 
-static inline TCGv_i32 load_cpu_offset(int offset)
-{
-    TCGv_i32 tmp = tcg_temp_new_i32();
-    tcg_gen_ld_i32(tmp, cpu_env, offset);
-    return tmp;
-}
-
-#define load_cpu_field(name) load_cpu_offset(offsetof(CPUARMState, name))
-
-static inline void store_cpu_offset(TCGv_i32 var, int offset)
-{
-    tcg_gen_st_i32(var, cpu_env, offset);
-    tcg_temp_free_i32(var);
-}
-
-#define store_cpu_field(var, name) \
-    store_cpu_offset(var, offsetof(CPUARMState, name))
-
 /* The architectural value of PC.  */
 static uint32_t read_pc(DisasContext *s)
 {
@@ -212,7 +195,7 @@ static uint32_t read_pc(DisasContext *s)
 }
 
 /* Set a variable to the value of a CPU register.  */
-static void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
+void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
 {
     if (reg == 15) {
         tcg_gen_movi_i32(var, read_pc(s));
@@ -221,14 +204,6 @@ static void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
     }
 }
 
-/* Create a new temporary and set it to the value of a CPU register.  */
-static inline TCGv_i32 load_reg(DisasContext *s, int reg)
-{
-    TCGv_i32 tmp = tcg_temp_new_i32();
-    load_reg_var(s, tmp, reg);
-    return tmp;
-}
-
 /*
  * Create a new temp, REG + OFS, except PC is ALIGN(PC, 4).
  * This is used for load/store for which use of PC implies (literal),
@@ -1208,7 +1183,7 @@ static inline void vfp_store_reg32(TCGv_i32 var, int reg)
     tcg_gen_st_i32(var, cpu_env, vfp_reg_offset(false, reg));
 }
 
-static void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop)
+void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop)
 {
     long off = neon_element_offset(reg, ele, memop);
 
@@ -1234,7 +1209,7 @@ static void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop)
     }
 }
 
-static void read_neon_element64(TCGv_i64 dest, int reg, int ele, MemOp memop)
+void read_neon_element64(TCGv_i64 dest, int reg, int ele, MemOp memop)
 {
     long off = neon_element_offset(reg, ele, memop);
 
@@ -1253,7 +1228,7 @@ static void read_neon_element64(TCGv_i64 dest, int reg, int ele, MemOp memop)
     }
 }
 
-static void write_neon_element32(TCGv_i32 src, int reg, int ele, MemOp memop)
+void write_neon_element32(TCGv_i32 src, int reg, int ele, MemOp memop)
 {
     long off = neon_element_offset(reg, ele, memop);
 
@@ -1272,7 +1247,7 @@ static void write_neon_element32(TCGv_i32 src, int reg, int ele, MemOp memop)
     }
 }
 
-static void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop)
+void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop)
 {
     long off = neon_element_offset(reg, ele, memop);
 
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index e20d9c7ba66..c368ada877b 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -191,7 +191,7 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
  * The most usual kind of VFP access check, for everything except
  * FMXR/FMRX to the always-available special registers.
  */
-static bool vfp_access_check(DisasContext *s)
+bool vfp_access_check(DisasContext *s)
 {
     return full_vfp_access_check(s, false);
 }
-- 
2.20.1


