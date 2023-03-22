Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B16C4DAF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:29:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezSp-0003yB-UJ; Wed, 22 Mar 2023 10:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pezSn-0003wc-Tf
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:29:17 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pezSm-00020A-4p
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:29:17 -0400
Received: by mail-wm1-x333.google.com with SMTP id m35so11670597wms.4
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 07:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679495354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZgolkMT8PMDnGL6LNTapds6VAVWk4DJsX2jjIB/I6WQ=;
 b=LP2p3qVfMxVxXcZIq+YLF5GKgjZAUvfQyvARZOAVyhjsi5tPB4A+DRnxBT0+qEgDds
 /AJ470NbnOrs2wnTkRIoEtuE68VWkK0hpVU1/zzmsP0HZrNTVqLMQAUCqf52vKeWtrje
 IKfQC9yhLeKdog0/ztD4YDQa17Vk3gN+ECaDUEWPeMLCxLNLsCSg9nFLVYwN0mDD6L8Q
 gMDGzQgo0SNpm/3VEscyXsrpXQCVirxP9LsJQvg20VR/KhRFk8yHl385l3kTdbYk2srS
 Im2O9yGKTp/b3R2M3SEr2oVSYleGlrvsCJrU3AG0HpzSOmOW4xwIjcSPuRlvf3l4PwgD
 IbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679495354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZgolkMT8PMDnGL6LNTapds6VAVWk4DJsX2jjIB/I6WQ=;
 b=AvVYoN2yxmpmvIpW/0YPOp++3ZVZcBkzl7JoC2zt4isKBY0zfKmKhzJ5sjsFDR8A3g
 24jyX4gsTLJyXAeLRnNcPU0BvK9HMxsd79pZWZVyHWbgx09iVqr4TLHKD394weqfNkmO
 UjEXgCClMeYp1E60Zak5RjSKziFQpysarnkUdSshgciedU6gH0Yw24/BiniTPhpRbAZA
 gKkbEnPqpIZlkUesH27y3wJVbHzaVlyTPjKx4ONeSasqUevsRfX3LXiVuGc42atcl25G
 kOvIUIjdbi2wG/4cHqR3GqiBa3xzkkT3sEC+cs/axZ0LjzUtdZjqP18PgppzAhH34Fem
 aOag==
X-Gm-Message-State: AO0yUKV2JqzkUub5tHGJuXrFDYVHepqCjPF+cVf9c7K2t+rZsqxD11QX
 vISGwQ1yrBaNl+M6TBVioTHSHvAMaHaIUCfY/Y9KSQ==
X-Google-Smtp-Source: AK7set/f1Jel4PEN1VyFB9P8enoVl10ChOSVBQdVpWFUdeoDNxx7XTbquwuEjbpwJcmOJnX0B+fIkw==
X-Received: by 2002:a05:600c:cc5:b0:3ed:2346:44bd with SMTP id
 fk5-20020a05600c0cc500b003ed234644bdmr1893510wmb.19.1679495354633; 
 Wed, 22 Mar 2023 07:29:14 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a7bcc8d000000b003ee1acdb036sm6775207wma.17.2023.03.22.07.29.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Mar 2023 07:29:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 2/2] target/arm/gdbstub: Only advertise M-profile
 features if TCG available
Date: Wed, 22 Mar 2023 15:29:02 +0100
Message-Id: <20230322142902.69511-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230322142902.69511-1-philmd@linaro.org>
References: <20230322142902.69511-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Cortex-M profile is only emulable from TCG accelerator. Restrict
the GDBstub features to its availability in order to avoid a link
error when TCG is not enabled:

  Undefined symbols for architecture arm64:
    "_arm_v7m_get_sp_ptr", referenced from:
        _m_sysreg_get in target_arm_gdbstub.c.o
    "_arm_v7m_mrs_control", referenced from:
        _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
  ld: symbol(s) not found for architecture arm64
  clang: error: linker command failed with exit code 1 (use -v to see invocation)

Fixes: 7d8b28b8b5 ("target/arm: Implement gdbstub m-profile systemreg and secext")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 655369dc74..2986ed6fc8 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -554,7 +554,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      2, "arm-vfp-sysregs.xml", 0);
         }
     }
-    if (cpu_isar_feature(aa32_mve, cpu)) {
+    if (cpu_isar_feature(aa32_mve, cpu) && tcg_enabled()) {
         gdb_register_coprocessor(cs, mve_gdb_get_reg, mve_gdb_set_reg,
                                  1, "arm-m-profile-mve.xml", 0);
     }
@@ -562,7 +562,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                              arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
                              "system-registers.xml", 0);
 
-    if (arm_feature(env, ARM_FEATURE_M)) {
+    if (arm_feature(env, ARM_FEATURE_M) && tcg_enabled()) {
         gdb_register_coprocessor(cs,
             arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
             arm_gen_dynamic_m_systemreg_xml(cs, cs->gdb_num_regs),
-- 
2.38.1


