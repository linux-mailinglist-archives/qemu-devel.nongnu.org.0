Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CCF6CCC17
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 23:26:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phGon-0007br-1f; Tue, 28 Mar 2023 17:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phGok-0007bH-M4
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 17:25:22 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phGoi-0007LD-Pj
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 17:25:22 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso1391198wmo.0
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 14:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680038719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E3L0YvTAg6g+pvqy2IDkXobfjbifgoR5d+5WWMVGSjA=;
 b=bv49Li2ipHy1cMxkX6WHvslBbEPnJ3y9dwwdiLKSpPyJJTgL9ZubdYWhuv8dJISqNS
 3etfsZHTL2Y2BJYQlPF8PHVabyDWQBH0OWesmep62cm6r9FmjSa/G6IpRlwBMc7ToXE1
 QxHTyFSB0TtxsVuxTr3RdQxeZ9wwA+CueZRUdvFn/qWW71Tb0QMArp4pMK4/u7Gc+X5t
 ajqaY3goblqz/v5SkagIf8XvOMigcBmAKQdSF+UclT3z0ivieaAJ2TT/TTD5yaZVLAeL
 n6y38l+ZiYGBSgGgp8B790ehV07C/IAVyyUeT9xSvUiiiChIBVIikKouMVC43ZizKgB5
 kwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680038719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E3L0YvTAg6g+pvqy2IDkXobfjbifgoR5d+5WWMVGSjA=;
 b=JIr8d1/mKvQyot5yp/rxKYE/MtX9gX58v5uh0koJMnbEOZ/xRRI3bNekt47MAXvMgN
 2q+/3aEKx1kvJnjwdjytdfl1wbydbiCE20LenaGTGCpYMlv24aIOBZOfqi4DmeFD6jXv
 QxckyTA5+QJMKD2z8jjjUzckl0WqbEim8QN2tVMtG+I2bQvASi7x2QK8civYtJp0B127
 MQfnLcpf+CedjkxyHUjwhaeXmWRaXnI4bLtErwgX2X1ithO8bTXMj3/w1VzlkweHUuqQ
 WHESdFcMXMtWz4YN7lHreyaoJlUJZzLGhu/sxX0kDo4msWUd3r0kSE344J8nudYS92H/
 nepA==
X-Gm-Message-State: AO0yUKVM0s7WL9qdAt3x7gCZ+7xkHgmbtFppSQB0GSqNEwYKAyaGQVO5
 WMhfAi22e5Ac9flWF1UmGdz9CsASX8H7wFGCqDY=
X-Google-Smtp-Source: AK7set8WIujXU1AGAEWuXez1uuf9srFnCNMjZgpwikxo9IlRHARBhBgxt9KQvvH2X/nraKe9jOnZ/Q==
X-Received: by 2002:a05:600c:2312:b0:3ee:b3bf:5f7c with SMTP id
 18-20020a05600c231200b003eeb3bf5f7cmr13420456wmo.23.1680038719144; 
 Tue, 28 Mar 2023 14:25:19 -0700 (PDT)
Received: from localhost.localdomain ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a05600c4f4100b003ee1e07a14asm13756569wmq.45.2023.03.28.14.25.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Mar 2023 14:25:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v3] target/arm: Fix non-TCG build failure by inlining
 pauth_ptr_mask()
Date: Tue, 28 Mar 2023 23:25:16 +0200
Message-Id: <20230328212516.29592-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

To avoid a linking error when TCG is not enabled:

  Undefined symbols for architecture arm64:
    "_pauth_ptr_mask", referenced from:
        _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
  ld: symbol(s) not found for architecture arm64
  clang: error: linker command failed with exit code 1 (use -v to see invocation)

- Inline pauth_ptr_mask() in aarch64_gdb_get_pauth_reg()
  (this is the single user),
- Rename pauth_ptr_mask_internal() as pauth_ptr_mask() and
  inline it in "internals.h",

Fixes: e995d5cce4 ("target/arm: Implement gdbstub pauth extension")
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Supersedes: <20230328133054.6553-1-philmd@linaro.org>

Since v2:
- Rebased (patch #1 merged)
- Addressed rth's comments
- Added R-b tags
---
 target/arm/internals.h        | 16 +++++++---------
 target/arm/gdbstub64.c        |  7 +++++--
 target/arm/tcg/pauth_helper.c | 18 +-----------------
 3 files changed, 13 insertions(+), 28 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 673519a24a..71f4c6d8a2 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1389,15 +1389,13 @@ int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env);
 
-/**
- * pauth_ptr_mask:
- * @env: cpu context
- * @ptr: selects between TTBR0 and TTBR1
- * @data: selects between TBI and TBID
- *
- * Return a mask of the bits of @ptr that contain the authentication code.
- */
-uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data);
+static inline uint64_t pauth_ptr_mask(ARMVAParameters param)
+{
+    int bot_pac_bit = 64 - param.tsz;
+    int top_pac_bit = 64 - 8 * param.tbi;
+
+    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
+}
 
 /* Add the cpreg definitions for debug related system registers */
 void define_debug_regs(ARMCPU *cpu);
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index ec1e07f139..c1f7e8c934 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -230,8 +230,11 @@ int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg)
         {
             bool is_data = !(reg & 1);
             bool is_high = reg & 2;
-            uint64_t mask = pauth_ptr_mask(env, -is_high, is_data);
-            return gdb_get_reg64(buf, mask);
+            ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
+            ARMVAParameters param;
+
+            param = aa64_va_parameters(env, -is_high, mmu_idx, is_data);
+            return gdb_get_reg64(buf, pauth_ptr_mask(param));
         }
     default:
         return 0;
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 20f347332d..de067fa716 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -339,17 +339,9 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     return pac | ext | ptr;
 }
 
-static uint64_t pauth_ptr_mask_internal(ARMVAParameters param)
-{
-    int bot_pac_bit = 64 - param.tsz;
-    int top_pac_bit = 64 - 8 * param.tbi;
-
-    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
-}
-
 static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
 {
-    uint64_t mask = pauth_ptr_mask_internal(param);
+    uint64_t mask = pauth_ptr_mask(param);
 
     /* Note that bit 55 is used whether or not the regime has 2 ranges. */
     if (extract64(ptr, 55, 1)) {
@@ -359,14 +351,6 @@ static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
     }
 }
 
-uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data)
-{
-    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
-    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
-
-    return pauth_ptr_mask_internal(param);
-}
-
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                            ARMPACKey *key, bool data, int keynumber)
 {
-- 
2.38.1


