Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32F6441DC4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 17:11:59 +0100 (CET)
Received: from localhost ([::1]:50194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhZug-0005vt-Re
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 12:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhZrA-0003Ca-O1
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:08:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhZr7-0002F2-Pz
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:08:20 -0400
Received: by mail-wr1-x434.google.com with SMTP id r8so16014993wra.7
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lz0bed1C0VkGRnr0JjHV0yoHub3q8oPcfjfRG+4+a0U=;
 b=pEVpmAN9n6H7Nd04ZbjP5f20Wc3UK3PS67ccc+cWQtnH3E3vM9h+qOdS7grzHuj2PQ
 CGji7PquGWmhpe6e7ubRekQMW3d26MP+VSjZSxI6efmP6NTWbwCqqujYmFhjyDPUChRl
 iWRHQUNpBUUj811DkC3/klNpZoM/006LTR2RUNaJd8cbzAS4FhO1y8ziMrDX/rtQj9Ug
 jiqsc8mQiaBN3MYgZtmy7JrFx3fPX80MAvgXSb4W1R0MPkmJQbdLlrN0sSijrwc/cVKc
 Q3FoWElC4m3C24fhZjEuRYDwcW4ZpEMnJp0y4o9d4L69tbqpDT+rXWSVcXCKIwXAg9g+
 SdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lz0bed1C0VkGRnr0JjHV0yoHub3q8oPcfjfRG+4+a0U=;
 b=vn4tWOusi9bK2im/WeOJRcnA+3Sk/w7lA/C/ShFwgHE9XoTTMMP/Adhar679YzAZQi
 eqek3y40N02/VXenP8hSfzGmRLoYJuhm1Wz1xfsS8W/sIedisdxPQvLbdl5Tqe7q18Nw
 vyjDBRjxUNmyjSure5bebhQPpSi5lnNDZE63y9qPp2QVWMZ4w6rMyV9UsZE3FaCsATwT
 c+ggF2QLLeAQSvUwiqeBU/dk7dLU1hwMRNYEQ+Fc2bKBmxT8A29xuaEThlmrK7jrzQS5
 I92m7HDUPPqOspbCZC+DLEU4+KnptXlM2JzxReQ6H4NofIrCbvcJL1YaPyNt6oldQ7iR
 P9+w==
X-Gm-Message-State: AOAM531eeumOmIKBFutOICVPMBHJ6TTbEF1e8lt/M2aYU2zYsvnPc/mF
 bps8sJb0B3USS5clg1upgXVMSBcnKTJilA==
X-Google-Smtp-Source: ABdhPJye+duJRTy01JBXvDIVp8+NG5odjKiXXUPfaLTIwktfJ5IxgmTIi5koUkJXHuj2wQu2eXse3Q==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr36351072wrn.82.1635782896392; 
 Mon, 01 Nov 2021 09:08:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w1sm16212935wmc.19.2021.11.01.09.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 09:08:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 for-6.2] target/arm: Advertise MVE to gdb when present
Date: Mon,  1 Nov 2021 16:08:14 +0000
Message-Id: <20211101160814.5103-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cortex-M CPUs with MVE should advertise this fact to gdb, using the
org.gnu.gdb.arm.m-profile-mve XML feature, which defines the VPR
register.  Presence of this feature also tells gdb to create
pseudo-registers Q0..Q7, so we do not need to tell gdb about them
separately.

Note that unless you have a very recent GDB that includes this fix:
http://patches-tcwg.linaro.org/patch/58133/ gdb will mis-print the
individual fields of the VPR register as zero (but showing the whole
thing as hex, eg with "print /x $vpr" will give the correct value).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
Reposting this unchanged except to remove the 'RFC' tag, as
the gdb patches have now gone upstream and the XML layout is
therefore finalized.
---
 configs/targets/aarch64-softmmu.mak  |  2 +-
 configs/targets/arm-linux-user.mak   |  2 +-
 configs/targets/arm-softmmu.mak      |  2 +-
 configs/targets/armeb-linux-user.mak |  2 +-
 target/arm/gdbstub.c                 | 25 +++++++++++++++++++++++++
 gdb-xml/arm-m-profile-mve.xml        | 19 +++++++++++++++++++
 6 files changed, 48 insertions(+), 4 deletions(-)
 create mode 100644 gdb-xml/arm-m-profile-mve.xml

diff --git a/configs/targets/aarch64-softmmu.mak b/configs/targets/aarch64-softmmu.mak
index 13d40b55e6d..d489e6da830 100644
--- a/configs/targets/aarch64-softmmu.mak
+++ b/configs/targets/aarch64-softmmu.mak
@@ -1,5 +1,5 @@
 TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
 TARGET_SUPPORTS_MTTCG=y
-TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
+TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
 TARGET_NEED_FDT=y
diff --git a/configs/targets/arm-linux-user.mak b/configs/targets/arm-linux-user.mak
index acecc339e38..3e10d6b15d5 100644
--- a/configs/targets/arm-linux-user.mak
+++ b/configs/targets/arm-linux-user.mak
@@ -1,6 +1,6 @@
 TARGET_ARCH=arm
 TARGET_SYSTBL_ABI=common,oabi
 TARGET_SYSTBL=syscall.tbl
-TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
+TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
 TARGET_HAS_BFLT=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/arm-softmmu.mak b/configs/targets/arm-softmmu.mak
index f6c95ba07a4..92c8349b964 100644
--- a/configs/targets/arm-softmmu.mak
+++ b/configs/targets/arm-softmmu.mak
@@ -1,4 +1,4 @@
 TARGET_ARCH=arm
 TARGET_SUPPORTS_MTTCG=y
-TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
+TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
 TARGET_NEED_FDT=y
diff --git a/configs/targets/armeb-linux-user.mak b/configs/targets/armeb-linux-user.mak
index 662c73d8fbd..f81e5bf1fe4 100644
--- a/configs/targets/armeb-linux-user.mak
+++ b/configs/targets/armeb-linux-user.mak
@@ -2,6 +2,6 @@ TARGET_ARCH=arm
 TARGET_SYSTBL_ABI=common,oabi
 TARGET_SYSTBL=syscall.tbl
 TARGET_WORDS_BIGENDIAN=y
-TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
+TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
 TARGET_HAS_BFLT=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index e0dcb33e325..134da0d0ae3 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -199,6 +199,27 @@ static int vfp_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
+static int mve_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
+{
+    switch (reg) {
+    case 0:
+        return gdb_get_reg32(buf, env->v7m.vpr);
+    default:
+        return 0;
+    }
+}
+
+static int mve_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    switch (reg) {
+    case 0:
+        env->v7m.vpr = ldl_p(buf);
+        return 4;
+    default:
+        return 0;
+    }
+}
+
 /**
  * arm_get/set_gdb_*: get/set a gdb register
  * @env: the CPU state
@@ -468,6 +489,10 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      2, "arm-vfp-sysregs.xml", 0);
         }
     }
+    if (cpu_isar_feature(aa32_mve, cpu)) {
+        gdb_register_coprocessor(cs, mve_gdb_get_reg, mve_gdb_set_reg,
+                                 1, "arm-m-profile-mve.xml", 0);
+    }
     gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
                              arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
                              "system-registers.xml", 0);
diff --git a/gdb-xml/arm-m-profile-mve.xml b/gdb-xml/arm-m-profile-mve.xml
new file mode 100644
index 00000000000..cba664c4c5b
--- /dev/null
+++ b/gdb-xml/arm-m-profile-mve.xml
@@ -0,0 +1,19 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2021 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.arm.m-profile-mve">
+  <flags id="vpr_reg" size="4">
+    <!-- ARMv8.1-M and MVE: Unprivileged and privileged Access.  -->
+    <field name="P0" start="0" end="15"/>
+    <!-- ARMv8.1-M: Privileged Access only.  -->
+    <field name="MASK01" start="16" end="19"/>
+    <!-- ARMv8.1-M: Privileged Access only.  -->
+    <field name="MASK23" start="20" end="23"/>
+  </flags>
+  <reg name="vpr" bitsize="32" type="vpr_reg"/>
+</feature>
-- 
2.20.1


