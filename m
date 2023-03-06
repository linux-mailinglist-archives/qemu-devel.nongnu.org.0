Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91AC6AC5A4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:38:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrY-0004C9-Hj; Mon, 06 Mar 2023 10:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrV-00046b-8J
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:53 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrP-0002AE-FA
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:52 -0500
Received: by mail-wr1-x433.google.com with SMTP id g3so9256975wri.6
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/AQejgWbtYpiD7FfeheRyQLSBVKA3u2JfApjtw1egSo=;
 b=h/7DbJ/WqGPvlNyK1ZS/5tIo+vk7LYypiNUjZuhp5MDedp0XLS+7f7nsRLVfmrjNfZ
 ul8CQ+1FEMuYU8KnZ9EEnYwCyKiiUpcwB46+5bCdtzd/FJfNOaRUponedGkczUbQxINV
 AtNjnYrP299W7H0LtrKG3MsVFs54CclHjGYu6QiBdnPtcAemejXkkqVpAIwGY3BVa1oD
 bTMs7PjJUTm/BQ03J9P0lpvt2XUOXRlsf2rAGSOGa8BZo1eLoRIecxXCwqhncAsIm4z6
 1b/hHYqXV/FKwujpWI28aPSX/qzLGaysEkbAbrOoNoSLZtLVg2/+wgAZI6o4mr8EXhGQ
 gMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/AQejgWbtYpiD7FfeheRyQLSBVKA3u2JfApjtw1egSo=;
 b=xLbUNeJhGJV7QDLR2HIB8uVdlnEbWX0iqseK5IioGNwaUK8XxxmTmecRWgCLVVb+jr
 kEcqaBsHKmaNeluWe1mC0D9WPheutMvvAA5N+HEIosO3TjBW2kRWRYIxsKJX0cgoVIbZ
 n1369ASiEo3ESIz562WXItR7kIdb0HEt12+bzieugh2mlmSux0CHA/1Z6XwI1ztBALxc
 VjbuF5AA2wtsP9gfRXT2ymcFFjphrt+4EsKWya4Ww+NIxm53J7XUd9nI1rkn5nhW+4PW
 OyTBxMGJEkHBak3NdfOwa8gTQpJQuVSA6Op5tv+pz3YzF8JnBz2HQMN8M8bv5jxIq99s
 wpeA==
X-Gm-Message-State: AO0yUKXT21ApHQPaoGlN9zRfjlZ4KfivVeKEsFT/97iJM3g+S771BQm9
 P/2657jHHqKyjjuzVG9Vd1sh+0pmSmwOyNBHKfM=
X-Google-Smtp-Source: AK7set8fr5yFO86JQIoK0b8/5vcUdZm8B3Ya5ITUZEXcD6jWevNm3yrCUHVVFzpSQUl5r3lPHo7S1A==
X-Received: by 2002:a5d:6545:0:b0:2c7:cc8:782c with SMTP id
 z5-20020a5d6545000000b002c70cc8782cmr10516590wrv.1.1678116886102; 
 Mon, 06 Mar 2023 07:34:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/21] target/arm: Implement gdbstub pauth extension
Date: Mon,  6 Mar 2023 15:34:25 +0000
Message-Id: <20230306153435.490894-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

The extension is primarily defined by the Linux kernel NT_ARM_PAC_MASK
ptrace register set.

The original gdb feature consists of two masks, data and code, which are
used to mask out the authentication code within a pointer.  Following
discussion with Luis Machado, add two more masks in order to support
pointers within the high half of the address space (i.e. TTBR1 vs TTBR0).

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1105
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230227213329.793795-12-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configs/targets/aarch64-linux-user.mak    |  2 +-
 configs/targets/aarch64-softmmu.mak       |  2 +-
 configs/targets/aarch64_be-linux-user.mak |  2 +-
 target/arm/internals.h                    |  2 ++
 target/arm/gdbstub.c                      |  5 ++++
 target/arm/gdbstub64.c                    | 34 +++++++++++++++++++++++
 gdb-xml/aarch64-pauth.xml                 | 15 ++++++++++
 7 files changed, 59 insertions(+), 3 deletions(-)
 create mode 100644 gdb-xml/aarch64-pauth.xml

diff --git a/configs/targets/aarch64-linux-user.mak b/configs/targets/aarch64-linux-user.mak
index db552f18390..ba8bc5fe3fd 100644
--- a/configs/targets/aarch64-linux-user.mak
+++ b/configs/targets/aarch64-linux-user.mak
@@ -1,6 +1,6 @@
 TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
-TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
+TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/aarch64-pauth.xml
 TARGET_HAS_BFLT=y
 CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/aarch64-softmmu.mak b/configs/targets/aarch64-softmmu.mak
index d489e6da830..b4338e95680 100644
--- a/configs/targets/aarch64-softmmu.mak
+++ b/configs/targets/aarch64-softmmu.mak
@@ -1,5 +1,5 @@
 TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
 TARGET_SUPPORTS_MTTCG=y
-TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
+TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml gdb-xml/aarch64-pauth.xml
 TARGET_NEED_FDT=y
diff --git a/configs/targets/aarch64_be-linux-user.mak b/configs/targets/aarch64_be-linux-user.mak
index dc78044fb15..acb5620cdbf 100644
--- a/configs/targets/aarch64_be-linux-user.mak
+++ b/configs/targets/aarch64_be-linux-user.mak
@@ -1,7 +1,7 @@
 TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
 TARGET_BIG_ENDIAN=y
-TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
+TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/aarch64-pauth.xml
 TARGET_HAS_BFLT=y
 CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c891c7a3831..dda89aa5dff 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1349,6 +1349,8 @@ int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_gdb_set_fpu_reg(CPUARMState *env, uint8_t *buf, int reg);
+int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg);
+int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg);
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index bf8aff78241..062c8d447a0 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -355,6 +355,11 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      aarch64_gdb_set_fpu_reg,
                                      34, "aarch64-fpu.xml", 0);
         }
+        if (isar_feature_aa64_pauth(&cpu->isar)) {
+            gdb_register_coprocessor(cs, aarch64_gdb_get_pauth_reg,
+                                     aarch64_gdb_set_pauth_reg,
+                                     4, "aarch64-pauth.xml", 0);
+        }
 #endif
     } else {
         if (arm_feature(env, ARM_FEATURE_NEON)) {
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 3d9e9e97c86..3bee892fb76 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -210,6 +210,40 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
+int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg)
+{
+    switch (reg) {
+    case 0: /* pauth_dmask */
+    case 1: /* pauth_cmask */
+    case 2: /* pauth_dmask_high */
+    case 3: /* pauth_cmask_high */
+        /*
+         * Note that older versions of this feature only contained
+         * pauth_{d,c}mask, for use with Linux user processes, and
+         * thus exclusively in the low half of the address space.
+         *
+         * To support system mode, and to debug kernels, two new regs
+         * were added to cover the high half of the address space.
+         * For the purpose of pauth_ptr_mask, we can use any well-formed
+         * address within the address space half -- here, 0 and -1.
+         */
+        {
+            bool is_data = !(reg & 1);
+            bool is_high = reg & 2;
+            uint64_t mask = pauth_ptr_mask(env, -is_high, is_data);
+            return gdb_get_reg64(buf, mask);
+        }
+    default:
+        return 0;
+    }
+}
+
+int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    /* All pseudo registers are read-only. */
+    return 0;
+}
+
 static void output_vector_union_type(GString *s, int reg_width,
                                      const char *name)
 {
diff --git a/gdb-xml/aarch64-pauth.xml b/gdb-xml/aarch64-pauth.xml
new file mode 100644
index 00000000000..24af5f903c1
--- /dev/null
+++ b/gdb-xml/aarch64-pauth.xml
@@ -0,0 +1,15 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018-2022 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.aarch64.pauth">
+  <reg name="pauth_dmask" bitsize="64"/>
+  <reg name="pauth_cmask" bitsize="64"/>
+  <reg name="pauth_dmask_high" bitsize="64"/>
+  <reg name="pauth_cmask_high" bitsize="64"/>
+</feature>
+
-- 
2.34.1


