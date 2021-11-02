Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00C74435B5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:37:36 +0100 (CET)
Received: from localhost ([::1]:35890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyfA-0000Ds-0d
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTO-0005gE-Se
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:26 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:35508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTM-0004Dc-Tc
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:26 -0400
Received: by mail-qv1-xf33.google.com with SMTP id u25so13891786qve.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 11:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4iN+wCNn39PyCmqyIu9fXyF1t2chc7mKLTiK8TWZaXs=;
 b=JoPCVBn9L1Ue22zkRBO/EyAKTn1xiZ8Z9+zAHemM/cg31+nW5NR+EEMoag89yIU4Vu
 6cp4Ds2SdZ1FdONyDtr487fadvrTZel39kfy1pj7y3P6fCvwvzocpdeFy6vBE5fUjBlb
 8PynOc2HDPFrq6lHMddP7xzxAPkVATYFqW+9uMxNdQN6331of0sppX6/e0doNLwhFM66
 1E7sJpiwz/Rdpu0Y2fNQ74bCR1qPI4WHkyrxIDYHqW9lSJOIL5rXoS6aujVUijKJyUD5
 RbPQ1Tu0PhpmuOPhgpZOpQo13R3tBsJah7qT8bB/hyJ/INCopvCBbQm5e30YUT0m+zsY
 tl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4iN+wCNn39PyCmqyIu9fXyF1t2chc7mKLTiK8TWZaXs=;
 b=n6p2Ut+kagCn2o0q34AHoUrsO9fUpRELv6V1SQeMkMzl27bu4NFic9CX030PENWExR
 lFJbn1dau/WM4meV4nabQSKKSB6bcdHRQaD5FJHBJ+0xhAsJ9qi1Eg2TQFxBShSkzJeF
 Z/d8NvPPnBzfZKJ4YPnbyZzGlo8mo11cMexNG56uztfFumg2mdUCi2BrHyI3p+vkjr8j
 UWwqKU8hY/fVWPXksBWGnCUultvEefFrBRqkLjaF6jhKxNDtVHh5ct3SnDMoBI9MxQS1
 tJbFIx2F2N1kyOBhWoKWBQMjK8AAIWna9vCu8xNhT4wWodSLRp1pfYfFWF04EQc8ZdQ4
 s38Q==
X-Gm-Message-State: AOAM532sWQGdE1Yxyri3Rl5vLzrEUPfTolwNLJmfajkFh/tQslbJKWnX
 CfxKmwh33Sxz2B6mAG8u7fNzMjwbfhB/vg==
X-Google-Smtp-Source: ABdhPJyQSklgrzZTg+CEORm4UgQSsos2Ez8PgYoPF8SZtOK3xjMPDLSPNWbOkKn8T/bw0v5OJ1xfCQ==
X-Received: by 2002:a0c:edb0:: with SMTP id h16mr27487471qvr.17.1635877523902; 
 Tue, 02 Nov 2021 11:25:23 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y9sm13701081qko.74.2021.11.02.11.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 11:25:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 05/12] target/arm: Advertise MVE to gdb when present
Date: Tue,  2 Nov 2021 14:25:12 -0400
Message-Id: <20211102182519.320319-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102182519.320319-1-richard.henderson@linaro.org>
References: <20211102182519.320319-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

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
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211101160814.5103-1-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 13d40b55e6..d489e6da83 100644
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
index acecc339e3..3e10d6b15d 100644
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
index f6c95ba07a..92c8349b96 100644
--- a/configs/targets/arm-softmmu.mak
+++ b/configs/targets/arm-softmmu.mak
@@ -1,4 +1,4 @@
 TARGET_ARCH=arm
 TARGET_SUPPORTS_MTTCG=y
-TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
+TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
 TARGET_NEED_FDT=y
diff --git a/configs/targets/armeb-linux-user.mak b/configs/targets/armeb-linux-user.mak
index 662c73d8fb..f81e5bf1fe 100644
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
index e0dcb33e32..134da0d0ae 100644
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
index 0000000000..cba664c4c5
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
2.25.1


