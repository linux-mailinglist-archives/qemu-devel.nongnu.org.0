Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663A96C4DAE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:29:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezSl-0003v2-56; Wed, 22 Mar 2023 10:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pezSi-0003u4-Ps
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:29:12 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pezSh-0001yc-7V
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:29:12 -0400
Received: by mail-wm1-x332.google.com with SMTP id o32so5282731wms.1
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679495349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pLFkci5O5POjG1PMHDhT+XDLlH/l0geR+447mWScQDk=;
 b=alSKek3LPWOHgay97/CzlKC9spc9UixiqfVKFDxE9Ka6LmHCazYLWjy0u2WArnjy4A
 snSEs9KGeo5jYiNnu/bvA1gt/PIeFeKSRC8g80SYgv6jz8AM1+VgBkApwrLJxTHP1EDc
 D/ohryWMFhmMrh8AroCKLY1A00qVDc6q8UxUYvzJmCddnUZRbekBC4FpdVWIHBuB6k4k
 Z4+OR0Ea7yMgHHpTsB38k5zumExdMqV7+xRHocWR/8Qz+htUIjQ6V8gqzSRlDziE0R6b
 encIMQl3NUN+RlqG+eOGco1r3cwmzDYn2Cmsu5XXoH6tyAkRbeOv8lhStQDaL8Iuxifg
 PHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679495349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pLFkci5O5POjG1PMHDhT+XDLlH/l0geR+447mWScQDk=;
 b=uNMNJ6pGoCLIJAq9RMO5EkSL4dccIicvJf/oRePK4RtPlUIz1/kJrG2XCZY9R/O0Nv
 6gE/wdaYHtnV83LJCXjFfkdLibkURcnL6YW52bxk1Hh25L7P/tELgjU2O4zAUfVl5hhj
 vq9IM1GAyYQWpbUmtniy8zYh96q9/Hqz02F0NlEjFm31V4xH23Lxrf1pjx7uSTp6Nx/E
 QHbOIMK1orSyveP1joqWY9IUx/CPgbLaNnwgM9yFjlnoT/4Af1wcRisjzUrBdAfQB4pi
 Agu/dVmI3jxqtdo3JXatjfcg4IuAV3PUDRrN2z9P5ssOYdrJj/dK2hAM5FBWXNcILePc
 1jZw==
X-Gm-Message-State: AO0yUKUttgQ6uVkfAQeumRgzH4t+vp8TwzBFMYxTmWm+HUFSbdGyGO3V
 wC0ybjiTpWvqRCx4L7dte/WkBKKdkUHnnBxIq8oXew==
X-Google-Smtp-Source: AK7set/TEtWYodEj7mvlXjissILsMDYIJkxN+mmdpj16er+8xbe55i7H0xPZfuZswfJlVAVGoPReBQ==
X-Received: by 2002:a1c:c901:0:b0:3e2:201a:5bcc with SMTP id
 f1-20020a1cc901000000b003e2201a5bccmr5565990wmb.33.1679495349629; 
 Wed, 22 Mar 2023 07:29:09 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a1c7714000000b003ee10fb56ebsm7663702wmi.9.2023.03.22.07.29.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Mar 2023 07:29:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 1/2] target/arm/gdbstub: Restrict
 aarch64_gdb_get_pauth_reg() to CONFIG_TCG
Date: Wed, 22 Mar 2023 15:29:01 +0100
Message-Id: <20230322142902.69511-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230322142902.69511-1-philmd@linaro.org>
References: <20230322142902.69511-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

aarch64_gdb_get_pauth_reg() -- although disabled since commit
5787d17a42 ("target/arm: Don't advertise aarch64-pauth.xml to
gdb") is still compiled in. It calls pauth_ptr_mask() which is
located in target/arm/tcg/pauth_helper.c, a TCG specific helper.

Restrict aarch64_gdb_get_pauth_reg() to TCG to avoid a linking
error when TCG is not enabled:

  Undefined symbols for architecture arm64:
    "_pauth_ptr_mask", referenced from:
        _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
  ld: symbol(s) not found for architecture arm64
  clang: error: linker command failed with exit code 1 (use -v to see invocation)

Fixes: e995d5cce4 ("target/arm: Implement gdbstub pauth extension")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/gdbstub.c   | 3 ++-
 target/arm/gdbstub64.c | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 3bd86cee97..655369dc74 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "exec/gdbstub.h"
 #include "gdbstub/helpers.h"
+#include "sysemu/tcg.h"
 #include "internals.h"
 #include "cpregs.h"
 
@@ -526,7 +527,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
          * crash if they see this XML from QEMU; disable it for the 8.0
          * release, pending a better solution.
          */
-        if (isar_feature_aa64_pauth(&cpu->isar)) {
+        if (isar_feature_aa64_pauth(&cpu->isar) && tcg_enabled()) {
             gdb_register_coprocessor(cs, aarch64_gdb_get_pauth_reg,
                                      aarch64_gdb_set_pauth_reg,
                                      4, "aarch64-pauth.xml", 0);
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index ec1e07f139..3bb0923cbf 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -210,6 +210,8 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
+#ifdef CONFIG_TCG
+
 int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
     switch (reg) {
@@ -244,6 +246,8 @@ int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
+#endif
+
 static void output_vector_union_type(GString *s, int reg_width,
                                      const char *name)
 {
-- 
2.38.1


