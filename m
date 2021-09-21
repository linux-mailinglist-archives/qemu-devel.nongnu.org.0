Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514694137B1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 18:37:49 +0200 (CEST)
Received: from localhost ([::1]:33116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSimC-0000zK-99
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 12:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSidr-0008Sa-K5
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:29:11 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSido-0002Bc-LY
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:29:11 -0400
Received: by mail-wr1-x432.google.com with SMTP id g16so40940195wrb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 09:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3E7kwGW+up3GsQ28CwtzAbDb2VBzaxcDFqWQbjPeAEA=;
 b=pvKVaQn2e8Q+WDlpeh1skSR+tN/P7fC+WrGZG0hhddp/Ru/Jgjy4/36LQQ3/qdUynf
 poLwiSsiR14PTEF8W9zHZBx0dbuNWU6S4WquA1m7g1z3C1Fd+IKqqYZO2ELuSUemRxrI
 aJ1nu8WmFoaVJHLwmszoxVjFRWrGI+sWWhi6gN0WwWyH2WAvI5mRz1DLDtH2psN5IMSw
 AcaBTCIfdyOqPn2dINVhzIbon/kQfZbOo6iz/qKLN1dI4C7kuOlsHuobffLJJOqRn1cn
 XxPLI8DqzTQEK1ERycgYFTHUVtkAt2okk9IF/kROQ1dadfvGo1V6PShRKR19QQi+6OVg
 1aWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3E7kwGW+up3GsQ28CwtzAbDb2VBzaxcDFqWQbjPeAEA=;
 b=M7je9I56CNdDU0ASFzte/aKdNRRGbiYFmxGx0YleQj0lvZb7+3OW8ynK15Lek4/E9F
 Vg0oLCLVwY39Ygajy0hoNLHdT2SR7EotgbfJmPtYlThChEqdvcpoM26G+msVxrnv4ZlR
 4qCR7iAmRdXrIdtBpCuHYKT4+JjnSBMWuntI1S1QB+j25QCbDwdbi+XACMHuUJM1R1pv
 gxuwq7u0x+0DSvn1JN7HNe4FoHnktpOumx70I/XWE9bYDZ6YW/JXOwQl8JD3piFQXnPm
 1u3lkXa9IbrHJaRv8YiBij3t3j5Ck4PHCK/4PToyt3hM5PfQazfOpM2PepmliknBz1mr
 Ts8Q==
X-Gm-Message-State: AOAM532br1Csat9ZsEPwMPiUGB3EpQzmuV38GHhkYU6aWKBNhjkPw7XZ
 3zMXQbPhNkzFZ818L8//bilthOxutjDF8w==
X-Google-Smtp-Source: ABdhPJxXInD1Otfu/jruvW7LweOG2oWJ2MkBC+UD2qkgBbOq/6xEaMmhkHo7qzurAi/xZ5UpzocBwQ==
X-Received: by 2002:a7b:c405:: with SMTP id k5mr5615050wmi.24.1632241747252;
 Tue, 21 Sep 2021 09:29:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q7sm19841014wru.56.2021.09.21.09.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 09:29:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/5] [RFC] target/arm: Advertise MVE to gdb when present
Date: Tue, 21 Sep 2021 17:29:01 +0100
Message-Id: <20210921162901.17508-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921162901.17508-1-peter.maydell@linaro.org>
References: <20210921162901.17508-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Cortex-M CPUs with MVE should advertise this fact to gdb, using the
org.gnu.gdb.arm.m-profile-mve XML feature, which defines the VPR
register.  Presence of this feature also tells gdb to create
pseudo-registers Q0..Q7, so we do not need to tell gdb about them
separately.

Note that unless you have a very recent GDB that includes this fix:
http://patches-tcwg.linaro.org/patch/58133/ gdb will mis-print the
individual fields of the VPR register as zero (but showing the whole
thing as hex, eg with "print /x $vpr" will give the correct value).

NB: the gdb patches to implement this have not yet landed in
gdb upstream, so this patch is RFC status only until that
happens and the XML is finalized.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


