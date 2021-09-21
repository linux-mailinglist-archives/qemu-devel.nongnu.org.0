Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770574137B0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 18:36:58 +0200 (CEST)
Received: from localhost ([::1]:59830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSilN-0008NX-Hq
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 12:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSidq-0008PB-Jz
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:29:10 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSidn-0002BQ-Vn
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:29:10 -0400
Received: by mail-wr1-x429.google.com with SMTP id u18so39209595wrg.5
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 09:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TUr52VVjSox7QlwwUlvluUaP8NJZfKJMZXIF71lXSE0=;
 b=amx69U+3QHHTT4aIh0IRIL9s4U31vq0VJZkFdxSbuv+Z0I1ujGr0Kmc6CMy65NBmog
 92Qn6pGPyhd1B34PBDXt/nCa1yiqVMvWjz06ofc7qXb6CYF4QWIl70qoivelJVGlDCm4
 phgXVaK5muwFTgIR+2SOy0Lx/uHuzkFGxD8omUxmSTRqARJu/Dl86dVANTx3FPJIvday
 ZAY15kzZGk2CQXUdHdbGOWTdwohNENA7n2XhHGvQmKkCuq6y1wjNaEEZkGbiURVsgh+s
 sslzBYbRj1uwPO82q0bbqyw2sTibgypmzTV7gKL2TCCsvVB8oeOmt/Rm70LiDlLb0wFa
 i/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TUr52VVjSox7QlwwUlvluUaP8NJZfKJMZXIF71lXSE0=;
 b=HB9ntp67KtDFIcKPAmYDpY+qaVJZ7P2tFmWWD+WuYd7NpUSXvlJkg0Lfl3jsP9m/2v
 ME0QIxWa3Js5FnD8sTzhK+3dVvDa3VL8Oy/DAEZrEH03MJqTedfWXlV1cQU3fHgDqIP/
 wRI5X76DDIDn8oqZnzvQbdQNJLrkiUZJZbaYtYXVdJ2MPYlSHQJceDum2CodgnIpHXpI
 aB0hGNL9bnrkGVtO7HyP6Zcasgsw/lWkeYNzS4qsS4NyDLW25qcI5avf0WGWN9Yom5aJ
 zMoblVeq74BjgMLOs20G6MX1WvVzNYtgeE1pC/NQ96AITE90kLu7qQfGo89d2YrCnTs2
 zoQA==
X-Gm-Message-State: AOAM533sTgJvTD3ehjMB8D6KX2ymC6xcXznK978OfD1Cy7aGVUtoPFZ7
 tSSVxmZ8O05LhxPi2ej26ZI2ZQ==
X-Google-Smtp-Source: ABdhPJwSUcvGP4YvzDD2V1yZ+fYcbBaGjst6nJnrmxMfYnZBcsu9dvlB0GObiz68CT4VdrO4ICQNYw==
X-Received: by 2002:a05:600c:201:: with SMTP id 1mr5589971wmi.5.1632241746531; 
 Tue, 21 Sep 2021 09:29:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q7sm19841014wru.56.2021.09.21.09.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 09:29:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/5] target/arm: Don't put FPEXC and FPSID in
 org.gnu.gdb.arm.vfp XML
Date: Tue, 21 Sep 2021 17:29:00 +0100
Message-Id: <20210921162901.17508-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921162901.17508-1-peter.maydell@linaro.org>
References: <20210921162901.17508-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we send VFP XML which includes D0..D15 or D0..D31, plus
FPSID, FPSCR and FPEXC.  The upstream GDB tolerates this, but its
definition of this XML feature does not include FPSID or FPEXC.  In
particular, for M-profile cores there are no FPSID or FPEXC
registers, so advertising those is wrong.

Move FPSID and FPEXC into their own bit of XML which we only send for
A and R profile cores.  This brings our definition of the XML
org.gnu.gdb.arm.vfp feature into line with GDB's own (at least for
non-Neon cores...) and means we don't claim to have FPSID and FPEXC
on M-profile.

(It seems unlikely to me that any gdbstub users really care about
being able to look at FPEXC and FPSID; but we've supplied them to gdb
for a decade and it's not hard to keep doing so.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configs/targets/aarch64-softmmu.mak  |  2 +-
 configs/targets/arm-linux-user.mak   |  2 +-
 configs/targets/arm-softmmu.mak      |  2 +-
 configs/targets/armeb-linux-user.mak |  2 +-
 target/arm/gdbstub.c                 | 56 ++++++++++++++++++++--------
 gdb-xml/arm-neon.xml                 |  2 -
 gdb-xml/arm-vfp-sysregs.xml          | 17 +++++++++
 gdb-xml/arm-vfp.xml                  |  2 -
 gdb-xml/arm-vfp3.xml                 |  2 -
 9 files changed, 61 insertions(+), 26 deletions(-)
 create mode 100644 gdb-xml/arm-vfp-sysregs.xml

diff --git a/configs/targets/aarch64-softmmu.mak b/configs/targets/aarch64-softmmu.mak
index 7703127674e..13d40b55e6d 100644
--- a/configs/targets/aarch64-softmmu.mak
+++ b/configs/targets/aarch64-softmmu.mak
@@ -1,5 +1,5 @@
 TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
 TARGET_SUPPORTS_MTTCG=y
-TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
+TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_NEED_FDT=y
diff --git a/configs/targets/arm-linux-user.mak b/configs/targets/arm-linux-user.mak
index e741ffd4d30..acecc339e38 100644
--- a/configs/targets/arm-linux-user.mak
+++ b/configs/targets/arm-linux-user.mak
@@ -1,6 +1,6 @@
 TARGET_ARCH=arm
 TARGET_SYSTBL_ABI=common,oabi
 TARGET_SYSTBL=syscall.tbl
-TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
+TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_HAS_BFLT=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/arm-softmmu.mak b/configs/targets/arm-softmmu.mak
index 84a98f48186..f6c95ba07a4 100644
--- a/configs/targets/arm-softmmu.mak
+++ b/configs/targets/arm-softmmu.mak
@@ -1,4 +1,4 @@
 TARGET_ARCH=arm
 TARGET_SUPPORTS_MTTCG=y
-TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
+TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_NEED_FDT=y
diff --git a/configs/targets/armeb-linux-user.mak b/configs/targets/armeb-linux-user.mak
index 255e44e8b0a..662c73d8fbd 100644
--- a/configs/targets/armeb-linux-user.mak
+++ b/configs/targets/armeb-linux-user.mak
@@ -2,6 +2,6 @@ TARGET_ARCH=arm
 TARGET_SYSTBL_ABI=common,oabi
 TARGET_SYSTBL=syscall.tbl
 TARGET_WORDS_BIGENDIAN=y
-TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
+TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_HAS_BFLT=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index cbf156d192f..e0dcb33e325 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -144,11 +144,7 @@ static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
     }
     switch (reg - nregs) {
     case 0:
-        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPSID]);
-    case 1:
         return gdb_get_reg32(buf, vfp_get_fpscr(env));
-    case 2:
-        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPEXC]);
     }
     return 0;
 }
@@ -172,13 +168,31 @@ static int vfp_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
         }
     }
     switch (reg - nregs) {
+    case 0:
+        vfp_set_fpscr(env, ldl_p(buf));
+        return 4;
+    }
+    return 0;
+}
+
+static int vfp_gdb_get_sysreg(CPUARMState *env, GByteArray *buf, int reg)
+{
+    switch (reg) {
+    case 0:
+        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPSID]);
+    case 1:
+        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPEXC]);
+    }
+    return 0;
+}
+
+static int vfp_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    switch (reg) {
     case 0:
         env->vfp.xregs[ARM_VFP_FPSID] = ldl_p(buf);
         return 4;
     case 1:
-        vfp_set_fpscr(env, ldl_p(buf));
-        return 4;
-    case 2:
         env->vfp.xregs[ARM_VFP_FPEXC] = ldl_p(buf) & (1 << 30);
         return 4;
     }
@@ -434,15 +448,25 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      34, "aarch64-fpu.xml", 0);
         }
 #endif
-    } else if (arm_feature(env, ARM_FEATURE_NEON)) {
-        gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
-                                 51, "arm-neon.xml", 0);
-    } else if (cpu_isar_feature(aa32_simd_r32, cpu)) {
-        gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
-                                 35, "arm-vfp3.xml", 0);
-    } else if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
-        gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
-                                 19, "arm-vfp.xml", 0);
+    } else {
+        if (arm_feature(env, ARM_FEATURE_NEON)) {
+            gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
+                                     49, "arm-neon.xml", 0);
+        } else if (cpu_isar_feature(aa32_simd_r32, cpu)) {
+            gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
+                                     33, "arm-vfp3.xml", 0);
+        } else if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
+            gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
+                                     17, "arm-vfp.xml", 0);
+        }
+        if (!arm_feature(env, ARM_FEATURE_M)) {
+            /*
+             * A and R profile have FP sysregs FPEXC and FPSID that we
+             * expose to gdb.
+             */
+            gdb_register_coprocessor(cs, vfp_gdb_get_sysreg, vfp_gdb_set_sysreg,
+                                     2, "arm-vfp-sysregs.xml", 0);
+        }
     }
     gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
                              arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
diff --git a/gdb-xml/arm-neon.xml b/gdb-xml/arm-neon.xml
index ce3ee03ec48..9dce0a996fc 100644
--- a/gdb-xml/arm-neon.xml
+++ b/gdb-xml/arm-neon.xml
@@ -82,7 +82,5 @@
   <reg name="q14" bitsize="128" type="neon_q"/>
   <reg name="q15" bitsize="128" type="neon_q"/>
 
-  <reg name="fpsid" bitsize="32" type="int" group="float"/>
   <reg name="fpscr" bitsize="32" type="int" group="float"/>
-  <reg name="fpexc" bitsize="32" type="int" group="float"/>
 </feature>
diff --git a/gdb-xml/arm-vfp-sysregs.xml b/gdb-xml/arm-vfp-sysregs.xml
new file mode 100644
index 00000000000..c4aa2721c8d
--- /dev/null
+++ b/gdb-xml/arm-vfp-sysregs.xml
@@ -0,0 +1,17 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2021 Linaro Ltd.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.
+
+     These are A/R profile VFP system registers. Debugger users probably
+     don't really care about these, but because we used to (incorrectly)
+     provide them to gdb in the org.gnu.gdb.arm.vfp XML we continue
+     to do so via this separate XML.
+     -->
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.qemu.gdb.arm.vfp-sysregs">
+  <reg name="fpsid" bitsize="32" type="int" group="float"/>
+  <reg name="fpexc" bitsize="32" type="int" group="float"/>
+</feature>
diff --git a/gdb-xml/arm-vfp.xml b/gdb-xml/arm-vfp.xml
index b20881e9a99..ebed5b3d573 100644
--- a/gdb-xml/arm-vfp.xml
+++ b/gdb-xml/arm-vfp.xml
@@ -23,7 +23,5 @@
   <reg name="d14" bitsize="64" type="float"/>
   <reg name="d15" bitsize="64" type="float"/>
 
-  <reg name="fpsid" bitsize="32" type="int" group="float"/>
   <reg name="fpscr" bitsize="32" type="int" group="float"/>
-  <reg name="fpexc" bitsize="32" type="int" group="float"/>
 </feature>
diff --git a/gdb-xml/arm-vfp3.xml b/gdb-xml/arm-vfp3.xml
index 227afd8017f..ef391c7144d 100644
--- a/gdb-xml/arm-vfp3.xml
+++ b/gdb-xml/arm-vfp3.xml
@@ -39,7 +39,5 @@
   <reg name="d30" bitsize="64" type="float"/>
   <reg name="d31" bitsize="64" type="float"/>
 
-  <reg name="fpsid" bitsize="32" type="int" group="float"/>
   <reg name="fpscr" bitsize="32" type="int" group="float"/>
-  <reg name="fpexc" bitsize="32" type="int" group="float"/>
 </feature>
-- 
2.20.1


