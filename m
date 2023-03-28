Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A7F6CC0FF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 15:32:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph9Pr-0000Co-H6; Tue, 28 Mar 2023 09:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph9Pm-0000Aw-Jo
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:31:07 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph9Pj-0006D3-Uf
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:31:06 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t4so6996819wra.7
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680010262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZgZN2Srx1PApQn0cW7r82/IW9IYA4I9jqu3/I/uULBo=;
 b=w17saQKHrOFywkpGzdXUOvACuhJiXlOXQrUuWzzZ1nHX4SIqTcV50zfXt4toiGuCYO
 wARwfXMroePVxqYCiJqrykXIxDvY+wKgTTKkR50Frit7R/W8gmepd1hbYC8wkzca1UgY
 LVRwulXdcbrOwLt3LDGQ5t+gbymXZjpCwDN+3Ls8MCpfPxrBlouiOVmji7ArSp8eO4/f
 MWZcVdr57vEidWa7/aI9sG94+e49+5Ik+l8ZGei1/ROVD8bPivOG53vVf4FnlMVR9us+
 sHvPAYgO/lU7aeEg1vj+OduMhGjCJ4Ra1HBYi8BGjDStCv7rjWnkpJ6svPnruaUkPz+U
 jPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680010262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZgZN2Srx1PApQn0cW7r82/IW9IYA4I9jqu3/I/uULBo=;
 b=TFD1hcKUspe82ddf0SsHLVMjFvboLGEvU6XHbAq6eZMGDzKFGZkfd4IEHMDq+/N9Hv
 bwjTTe9LGtKs4PmBuTGhm+/s6by2K43ZJ42jY8+O6UKPCpOXg/w+oVktvE1YmbhMNXr8
 4krYJXkBkpctCtyJmjGHwj7b7aFVC2dknBmhiCXYVSa3vw08deQO0gMCYKJPoOnNkKe6
 ImdEL5/VmNPTH3vpMMFptJ+HF0XDVlHI8SEYNIy0BON8+iKTjrjV7O3ikTLRWGaCgAyN
 H7eUXsvTIIKt8Snu9gFbBYkZLL6w4kUGoTLb39Zn7m8h4udbJi3SpOEFCbioI2B2NkpX
 fBDQ==
X-Gm-Message-State: AAQBX9fmZ/504qK1cXPbw8/NN0HzT9iBafMgjdil/S/6XcCZCcHFgT6k
 cTh7/aGThiWIauFmHOGrMddB4g==
X-Google-Smtp-Source: AKy350bYw0apj/2HjGjpm3eyvVw1EgyzKtaAOTBPNkxQXeaHlyZu5A+D+tWkcEkS/UuHsB7ZMcwdTw==
X-Received: by 2002:adf:e4cb:0:b0:2ce:bd2e:1fea with SMTP id
 v11-20020adfe4cb000000b002cebd2e1feamr13667172wrm.26.1680010262577; 
 Tue, 28 Mar 2023 06:31:02 -0700 (PDT)
Received: from localhost.localdomain ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a5d6903000000b002e105c017adsm4207620wru.44.2023.03.28.06.31.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Mar 2023 06:31:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v2 1/2] target/arm/gdbstub: Only advertise M-profile
 features if TCG available
Date: Tue, 28 Mar 2023 15:30:53 +0200
Message-Id: <20230328133054.6553-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328133054.6553-1-philmd@linaro.org>
References: <20230328133054.6553-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/gdbstub.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 3bd86cee97..13fbe9b0d7 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "exec/gdbstub.h"
 #include "gdbstub/helpers.h"
+#include "sysemu/tcg.h"
 #include "internals.h"
 #include "cpregs.h"
 
@@ -553,7 +554,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      2, "arm-vfp-sysregs.xml", 0);
         }
     }
-    if (cpu_isar_feature(aa32_mve, cpu)) {
+    if (cpu_isar_feature(aa32_mve, cpu) && tcg_enabled()) {
         gdb_register_coprocessor(cs, mve_gdb_get_reg, mve_gdb_set_reg,
                                  1, "arm-m-profile-mve.xml", 0);
     }
@@ -561,7 +562,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                              arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
                              "system-registers.xml", 0);
 
-    if (arm_feature(env, ARM_FEATURE_M)) {
+    if (arm_feature(env, ARM_FEATURE_M) && tcg_enabled()) {
         gdb_register_coprocessor(cs,
             arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
             arm_gen_dynamic_m_systemreg_xml(cs, cs->gdb_num_regs),
-- 
2.38.1


