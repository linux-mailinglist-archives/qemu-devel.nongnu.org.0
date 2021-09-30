Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1A441DDEE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:47:07 +0200 (CEST)
Received: from localhost ([::1]:48644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyH4-0005Vj-5H
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjX-0000Oz-Cq
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:29 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjO-000434-94
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h15so9053206wrc.3
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=df3ktvzb5CG1BKifpEL1YOCm6Kq0Mca9smWBzQx/djI=;
 b=m+5chfHjifgiTA4SIyxqWb47Bhjemz1dpscjdzzeAkbDeEMoZcwiMLiTtn+crp5Urc
 YP4E7zOStl4SuTFRR4itTlKgO8sWgEl0iFP3EEmwVqIsmvGKe5yMtFdaaQUW09RSbOxp
 99bqFIOSSG4G9xfqGcI9TcC+hE5KXUBJDMdS2pBDDwBJ1r7cDy1SJJIaDJDz9KQsXQ96
 rrTJ3nkHOT3TBwAYlGW+8/Gztn58Evn1TJwqzm/051x1UpQLjBqgJFb4oeBSMRi1Kx45
 wkaWCRz+DmiqD+NF3UyRhGrwaIBOqv6AeDtrN5s4JqrXf3Y3IRY8GStEU68484nP1RC3
 xFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=df3ktvzb5CG1BKifpEL1YOCm6Kq0Mca9smWBzQx/djI=;
 b=zKVtSkTkkSJzJ7MglbEzMZ1FuUodSJhac4CRFLdqXHIOBduOdVYpfOCzNexiwT5+R0
 zOhD9389L8bnGJi+DWoHSCfPwGxHzHPcOQRbPbUbgcnbS2AUT0dSuqUsjjnpgjYLNv8S
 2tWposqFEY5maYTjHNr1gZnXglhb3x47PJubWgSPCVHs15UeYQd10vHJ8cckWrwX6rHo
 8+MS9wbbhNV2YCeJk3o4070cKKAtSW9KpZooZNZpHZX8GSHu7n2QL6z0280ndF91opRU
 FEHWzqLdBGIIlGFnxCvHiRMlLbOGUPSKkBkEX0q+MLr8zfcMULc7mYD1gYBeHQMyLK6T
 RJvw==
X-Gm-Message-State: AOAM530VDOpd0i27P4rf8kPqy99VDC+5yv5V01d4BtVySFrFdtJQbysO
 OqYYen6F9RgHc7UdWST9BHJ24D0ZBD2UrA==
X-Google-Smtp-Source: ABdhPJxnLgzLQC3aTFiA3F9WSIm7PdRjLI6FVECBjTs+PIK6upHoSMFdVRppYlPhBXliTWzc0KN27w==
X-Received: by 2002:a05:6000:154f:: with SMTP id
 15mr4459052wry.254.1633014736219; 
 Thu, 30 Sep 2021 08:12:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/22] target/arm: Don't put FPEXC and FPSID in
 org.gnu.gdb.arm.vfp XML
Date: Thu, 30 Sep 2021 16:11:54 +0100
Message-Id: <20210930151201.9407-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210921162901.17508-5-peter.maydell@linaro.org
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


