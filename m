Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B49856A4D4D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 22:35:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWl7r-00076V-28; Mon, 27 Feb 2023 16:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7p-00075s-3K
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:37 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7n-0004G9-7y
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:36 -0500
Received: by mail-pl1-x62d.google.com with SMTP id i5so6570456pla.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 13:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+GyGNlJdKa3KwsEwlzZ+L9gq2ekV4ImCWMbXLmwTrsw=;
 b=fIdA64RfihIRamb7j74hmofzWQJVD6FYB2Kip/42Lpf3990NkcEcN8H3MwUvri+vSS
 cgnbSXyNOam8XAVStBvQiAeB/hukLB2YgmYodt17AeS75t8CNfJm5Q3/HNBTwwUyvLaH
 Bpi2xiID73PTkOzNsCk8taW4jNhiKZBrtrz/DV9Tc3dbT1z0TvuKojyb1055pmmGA8HW
 MiUFDjpa6wWC9gafIaC5fOJ9oOA9HKFx1xkCbX3D09Tn9NQNW5NilBW8y43VM9DztwTo
 LOuTumP97TstQL24EPQcgi+U+/WBdKi6/3dknrAERXZf9K54cwMtqnrPevNpR9zN7nNe
 33nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GyGNlJdKa3KwsEwlzZ+L9gq2ekV4ImCWMbXLmwTrsw=;
 b=CwHWqHlvvkz1ojQ34vu0/Ik9Oup+UD3xpwcaCnenDFkUhhPP4fHFd3Xy2qcrM/mZnq
 UM7d5lctr50YOEGQlfnw3b2IWIFz8esIo/iIOvK6spvqzRqgAHgezUIzi7mUPKWX1DVs
 4p4ZiGs6St/xkYeXVQXwmDvLropgRjQ5WNNna5k9ZH0hDoll9/TbeRKZ3Doklbxt78eo
 EuorKEBi+mTSgBxxndoy3QH+0X4MaGQgUbpYSLWogPa4uMyy+Zyx4E6NGMyjC/g5yBIL
 XS1MwTxeZGKxCezfeoSCnLsNeMCRLvNeuMTFAmc0ALskYsYadFm4gGUWd3Fj572RyXoj
 qN+Q==
X-Gm-Message-State: AO0yUKVtt/TUscQiGMgumCwdq0YLhvZWQaAPIc4euF1aPTmn/SLbRQks
 kG68hmmYWXlrbZ9CE3bGP5bsp1xtseTdZZJiJWU=
X-Google-Smtp-Source: AK7set9wzisSAPtKNk2R5OK9bUckBBzAkqndzwQDsgjujowFw77JVn4zSyUZRtKNqYfYYxP9m2ISvA==
X-Received: by 2002:a05:6a20:3d91:b0:cd:3f04:6452 with SMTP id
 s17-20020a056a203d9100b000cd3f046452mr1046310pzi.49.1677533613648; 
 Mon, 27 Feb 2023 13:33:33 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 01/14] target/arm: Normalize aarch64 gdbstub get/set
 function names
Date: Mon, 27 Feb 2023 11:33:16 -1000
Message-Id: <20230227213329.793795-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Make the form of the function names between fp and sve the same:
  - arm_gdb_*_svereg -> aarch64_gdb_*_sve_reg.
  - aarch64_fpu_gdb_*_reg -> aarch64_gdb_*_fpu_reg.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 8 ++++----
 target/arm/gdbstub.c   | 9 +++++----
 target/arm/gdbstub64.c | 8 ++++----
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 680c574717..fa21393ebc 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1342,10 +1342,10 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
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


