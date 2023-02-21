Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAB869D86E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 03:22:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUIGd-0001kq-LU; Mon, 20 Feb 2023 21:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGO-0001fV-Px
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:18 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGM-0008GF-IF
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:16 -0500
Received: by mail-pj1-x1044.google.com with SMTP id
 v3-20020a17090a6b0300b002341a2656e5so3142200pjj.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 18:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ppe2Qcjf7oc9HJYN5MySDHbITJCBzPtX1IDnG3TMP0=;
 b=SkOM92ii9nNZjeb5wi06xOzuxQmWZPxsZLw6x0oSc9Z6aUTQtD/UsU8N3gcWnFqLVg
 77gKMN5P/6UICzwqEubCjGz1l1bMtsPAOkSQje/3EPPTiWhPzIr1o0uKQsGFxAkCgDz1
 qeVW2q67Cyi9d7LoZpdpFTbpE4UXu8tpDV29AVAzosa6Epy2AtjDVmif3lES7xxlsU+K
 U40Ft5c87Fi2Rmigc+hVeTa1QL9t7X2SrcZecTDaTPy4vKlhTGEZmynAuo7B3JMyBfCG
 XoMQye9fsmpbImu8ujxmSp24sTb74KYnBiAAFBPCGe90CwjLyVeaKLg9dad1LG8Q9tNf
 mGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ppe2Qcjf7oc9HJYN5MySDHbITJCBzPtX1IDnG3TMP0=;
 b=gcJ9yXsuUMn/xgx/V/fVArcVQ+KemkSycQKKr2K4L1wfcZP2NRNY1FZPNxuj8JZ25C
 Qz/ZapfNeU6MD5WL+dX0Z1h8epQbfUxQgPsyP6YJQZgS5RrrdHbQ6cP9bAUEow0/GnLK
 +VN4vY/KSZTiva0lTi5mUM7deGYswi/pE0FmZu6YZjFpwiUnhBNyT92+0g5bb3ppUj4v
 XGiOJ7Oidl8yJTZSg0l7SJLMWB3cicB9k0dOUcGzmonOhymf00gurnjOkoXCOaay7nKn
 S2bJoM6uyg0LuVaFmssOv6WUpcNWr0pXA8TrCDvJiRI/B+eFiqo0mqF3MILU1p0tdnDy
 b6/Q==
X-Gm-Message-State: AO0yUKVggKIX7m5fh/KR2zUcvgCTSSg+9UbyxMLy5tW5nqoTINvUAF0a
 3i+cdMVnQH6StVja3dSBrbvu/EqPaSOTssPL8cCxhA==
X-Google-Smtp-Source: AK7set/4VeAS4x3D3hUchV80Ni5vMH3o6rIxpJc77bcbSME67blbkXObKAS+MZPVis9t6vDOmsEMFw==
X-Received: by 2002:a17:903:2441:b0:19a:9610:b234 with SMTP id
 l1-20020a170903244100b0019a9610b234mr3893497pls.1.1676946011785; 
 Mon, 20 Feb 2023 18:20:11 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Luis Machado <luis.machado@arm.com>,
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: [PATCH v2 11/14] target/arm: Implement gdbstub pauth extension
Date: Mon, 20 Feb 2023 16:19:48 -1000
Message-Id: <20230221021951.453601-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
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

The extension is primarily defined by the Linux kernel NT_ARM_PAC_MASK
ptrace register set.

The original gdb feature consists of two masks, data and code, which are
used to mask out the authentication code within a pointer.  Following
discussion with Luis Machado, add two more masks in order to support
pointers within the high half of the address space (i.e. TTBR1 vs TTBR0).

Cc: Luis Machado <luis.machado@arm.com>
Cc: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1105
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index db552f1839..ba8bc5fe3f 100644
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
index d489e6da83..b4338e9568 100644
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
index dc78044fb1..acb5620cdb 100644
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
index 370655061e..fb88b16579 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1331,6 +1331,8 @@ int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_gdb_set_fpu_reg(CPUARMState *env, uint8_t *buf, int reg);
+int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg);
+int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg);
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index bf8aff7824..062c8d447a 100644
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
index 3d9e9e97c8..3bee892fb7 100644
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
index 0000000000..24af5f903c
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


