Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F337B6A4D57
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 22:37:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWl86-0007Ig-2F; Mon, 27 Feb 2023 16:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl84-0007FE-8H
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:52 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl82-0004KT-9U
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:51 -0500
Received: by mail-pj1-x1044.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so11497288pjb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 13:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lGHYHFO7atPDP15MVjfGq01WPHLD9Q8qsF/rVBYljso=;
 b=bdk14H7jrHUs2At7nmyFFE3wyrjNtkUE2jVvTXttWJxb6hOBnT61gTwukFTM96OsJb
 rvp0l0fsiO/Wl0ecJ5M4CkaxqKwDYm522pfc8ZpO5xZM1IbEDEPTxabY9GEk9Dh5tXPM
 ySvisR6GB2Ia6r5eRDXLiw6PyfescmaEkabNlrrvSlkgNF1TcPpe4/0NBEehq50/91DS
 yTusXrmzfu05adWtIxDqMpeDgfO9JVlpNO5xzZwWx0RWLamT9NABe+3bCZupREtlAavy
 RiCFH2H7nnpaU8XCwAfOwU3xKnUu47CcmgR/GJTk8Hv0q7GIrhCPbrip8mGgzng8AQyu
 WtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lGHYHFO7atPDP15MVjfGq01WPHLD9Q8qsF/rVBYljso=;
 b=pMl+v6YCwHUipumWbAT4mYXazNymZPUdjUuU0oBtb9Me7hn8w6wOdAqEiNUyK77UtU
 ozF7HtnSxy4JEpU9wH95mgXHWCTbMPtEcgVbM7MNYjcf4IbAvp1SXbQuZjopn9298N1m
 DgbghYUU15qjYzKjxNUqOIktEtrO+8EzEO5/MKbRNwDTWmK7O3Puj9j3fwfmBweSY0j1
 Mze8G4iiKPbgGPsPTzgHv7EquZZXAYzvup3r4JcaUmvoMycHlVicUdyqkW3NnGj7CQYR
 ctt8dZ/1BNGosu9l5MWl20Sh3aio4zKkyNukyeMH8UMT262J64B4hotPpLPZkQDwQQUS
 WLSw==
X-Gm-Message-State: AO0yUKVxG+YSdK5BLYzPnvOp2jwJGoJkZ8QY5StlnWj8xWNcuh8//IwF
 FYkGcJcX+1eMBCFlUS9WEIa0acdjI/RgU9kr0EvYYQ==
X-Google-Smtp-Source: AK7set9I/7PPc1dfAYtiam3klQzr9gc6V5rQrLIB0hbs4axFlxhwyU1ao6T/jKa8Cj49ZBff0I3iag==
X-Received: by 2002:a05:6a20:9389:b0:bc:f336:98ed with SMTP id
 x9-20020a056a20938900b000bcf33698edmr1035311pzh.45.1677533628979; 
 Mon, 27 Feb 2023 13:33:48 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 11/14] target/arm: Implement gdbstub pauth extension
Date: Mon, 27 Feb 2023 11:33:26 -1000
Message-Id: <20230227213329.793795-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
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

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1105
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index c02dd59743..97271117a4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1347,6 +1347,8 @@ int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg);
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


