Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF51469D865
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 03:21:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUIGA-0001ZZ-Pl; Mon, 20 Feb 2023 21:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIG8-0001YO-QC
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:00 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIG6-00080p-Df
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:00 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso3357528pjb.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 18:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FenKak9v2X2vdqlU4pPM5lEm81DvM/co942SULkbTsQ=;
 b=h2cmN2MAT2x9FSWOCa73jPOVTEfLnRERZv1Zri+6vw3ThDvwZaVVxli+6O5Pm2y3DQ
 XoHTnB0Qt0xH+u8kmc14mwL10lWGH3nx9MxNL7tZrB8nS9cTZ1i+SFT34bSy6J0OpGN9
 gUCca22uCYe4NIB00Xh6dbgbEHU4PtWqb1x2FJqSlbHrDCibxzryTn/kJaz0Fp1Hk6yF
 uZsPF3tBJQdJwzcZtu0JPw0Gv5jvuy/wxsRwBYfx0wJAHvXR6XQxB71j0wC4EFHKW33m
 ThaL5K6xsy/n0x6V61di5PjRU4O+dvDocSkeSHzi0PzRDUSkawyVL/e1HLBwa3WXSKTe
 NdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FenKak9v2X2vdqlU4pPM5lEm81DvM/co942SULkbTsQ=;
 b=vXDRyeImmsixv0BOoOgE0zd4icf3T0y6n7jefRyp/UVnTlHlyxv0ba+voc6BSuU3JF
 6mImyfteJzqjJs8QkHElVSNbm/omv7Ev67SjDyaLjnmaLLXybAH8GF7n/b8PwowRdjdX
 jRS5T1wALYT2FfQjfZMjOR7tEGjeso0Jl7iLpLwxVzY+Azr5gwzysm/Nekd/2Z43PLV1
 iYwD0LWcPSbszcPd+XwcBDHTsamdCBMtjqJwSWjWzaAwAJU8nP0GXn9dwF2qdQgeasNF
 ltSz8VWn6dL5nsTtl6G+wHPy+Wodk11aAOllZHD6glgi1GNbCpy/9nAIZHHWLYgCOKq4
 j1sA==
X-Gm-Message-State: AO0yUKVmZ8FrKyFmamUR7A+2DmeXV7Fyh5OzIKEgV4EZ7qFehco/u+4d
 HgCPmU9MhpZ2YX8kAba+QTerq6rtvgMNRqJAOSk=
X-Google-Smtp-Source: AK7set9wCeq0uxxnflOBFo1rslbIbCqpBlh7AMVUcJPl4kUR3RVBRY72t6QHo0iHas46t7nBBbaz0A==
X-Received: by 2002:a17:903:1106:b0:19a:8284:83a6 with SMTP id
 n6-20020a170903110600b0019a828483a6mr2930608plh.56.1676945996863; 
 Mon, 20 Feb 2023 18:19:56 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:19:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v2 01/14] target/arm: Normalize aarch64 gdbstub get/set
 function names
Date: Mon, 20 Feb 2023 16:19:38 -1000
Message-Id: <20230221021951.453601-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Make the form of the function names between fp and sve the same:
  - arm_gdb_*_svereg -> aarch64_gdb_*_sve_reg.
  - aarch64_fpu_gdb_*_reg -> aarch64_gdb_*_fpu_reg.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 8 ++++----
 target/arm/gdbstub.c   | 9 +++++----
 target/arm/gdbstub64.c | 8 ++++----
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 759b70c646..121ecd420b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1326,10 +1326,10 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
 }
 
 #ifdef TARGET_AARCH64
-int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg);
-int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg);
-int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg);
-int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg);
+int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg);
+int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg);
+int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg);
+int aarch64_gdb_set_fpu_reg(CPUARMState *env, uint8_t *buf, int reg);
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 2f806512d0..cf1c01e3cf 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -466,12 +466,13 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
          */
 #ifdef TARGET_AARCH64
         if (isar_feature_aa64_sve(&cpu->isar)) {
-            gdb_register_coprocessor(cs, arm_gdb_get_svereg, arm_gdb_set_svereg,
-                                     arm_gen_dynamic_svereg_xml(cs, cs->gdb_num_regs),
+            int nreg = arm_gen_dynamic_svereg_xml(cs, cs->gdb_num_regs);
+            gdb_register_coprocessor(cs, aarch64_gdb_get_sve_reg,
+                                     aarch64_gdb_set_sve_reg, nreg,
                                      "sve-registers.xml", 0);
         } else {
-            gdb_register_coprocessor(cs, aarch64_fpu_gdb_get_reg,
-                                     aarch64_fpu_gdb_set_reg,
+            gdb_register_coprocessor(cs, aarch64_gdb_get_fpu_reg,
+                                     aarch64_gdb_set_fpu_reg,
                                      34, "aarch64-fpu.xml", 0);
         }
 #endif
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 07a6746944..c598cb0375 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -72,7 +72,7 @@ int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
-int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
+int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
     switch (reg) {
     case 0 ... 31:
@@ -92,7 +92,7 @@ int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
     }
 }
 
-int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
+int aarch64_gdb_set_fpu_reg(CPUARMState *env, uint8_t *buf, int reg)
 {
     switch (reg) {
     case 0 ... 31:
@@ -116,7 +116,7 @@ int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
     }
 }
 
-int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
+int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
     ARMCPU *cpu = env_archcpu(env);
 
@@ -164,7 +164,7 @@ int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
     return 0;
 }
 
-int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg)
+int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
 {
     ARMCPU *cpu = env_archcpu(env);
 
-- 
2.34.1


