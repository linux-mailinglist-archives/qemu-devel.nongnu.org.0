Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA47C6D4D06
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:02:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjMcm-00059z-09; Mon, 03 Apr 2023 12:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjMcX-00055T-UF
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:01:25 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjMcU-0002B4-47
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:01:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id e18so29879522wra.9
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 09:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680537679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9qKn2wV1XDVR3SsQesMAZyZNUv+n21KbBYflwsxycVM=;
 b=tQaGA8+tUINDUEQ7sB1JEdJtWnDGF4JKlrrRQ7t/i4BGg6vguEoEKQjvORYDPhxwYU
 JgBF0UwIDxAV/Nv5rLN1+//Z3n2krE6ztg8ytTlku7c28jChLYtDINoJ18E3Kmup4VM4
 ZcG+qwc7XkI/Fp+cL8IWgVthpEPdIKZy2TQOvUX7fAEeXmAdqBhevOwYyJXZ2WnU5uWn
 BfoucsNvoyBemVtzQtvRsEgvM0VQXyc64FEdBVk7Zrkj/ZPPSqfmJ8h+Kno/vAQUBEtx
 Kck4/jaZ1IjLJahOttfbsrxULo5ZNVbyCEwVw4+wadQW6rKTayyx+SQ2Jf3MYzNJosdg
 LBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680537679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9qKn2wV1XDVR3SsQesMAZyZNUv+n21KbBYflwsxycVM=;
 b=xsdOGT/wxuCvQk7yV9dFHBE6wNftQEmvkrLBUdsPuNRfQiVrSaNLBZxe9ZGoXGa7te
 Vfvds+JO0Md3+7WaKn1yjO7k8odfevAG0wbNKBjFGdnwX97439x7rpqfuu++6djy18DF
 otFPz8kT0zuywUQ1NM0wHhAvayfjAXSvPeJqzAypHEIREOWtxAuantokrxAH5eniImJL
 BJziG/SmI7UYme8TDcx+Fj75daUe0NWC3KvYQ3fMc2iwop4L4aeiCsWd4sx5X7rGeUeU
 F1pGKSz8mgJugoECnbsQxFzvT4zkzNbI1rUkohDkHV3Jqx7uF1gCNfZwCaU5zIDiQXaB
 twlg==
X-Gm-Message-State: AAQBX9ePW0UkBTY0qhaTr5JTsf6FiaRJrFNaM8ffLJdClvEXPVWwONPz
 wb9P4oahI44XWDxIRlJOjVN19WONxup60eXMh7A=
X-Google-Smtp-Source: AKy350ZXUlF21TCGFU4wuCOuM5mmzY8fUh/6aXOq5mxdom9TpQG0gaJiZCm21FN0BIo6pbsGFFcPPw==
X-Received: by 2002:adf:d84e:0:b0:2ce:c982:5e4b with SMTP id
 k14-20020adfd84e000000b002cec9825e4bmr27040210wrl.57.1680537679180; 
 Mon, 03 Apr 2023 09:01:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d68c1000000b002c59f18674asm10088668wrw.22.2023.04.03.09.01.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 09:01:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] target/arm: Fix non-TCG build failure by inlining
 pauth_ptr_mask()
Date: Mon,  3 Apr 2023 17:01:14 +0100
Message-Id: <20230403160117.3034102-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403160117.3034102-1-peter.maydell@linaro.org>
References: <20230403160117.3034102-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

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
Message-id: 20230328212516.29592-1-philmd@linaro.org
[PMM: reinstated doc comment]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h        | 15 ++++++++++-----
 target/arm/gdbstub64.c        |  7 +++++--
 target/arm/tcg/pauth_helper.c | 18 +-----------------
 3 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 673519a24a0..c2c70d5918d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1391,13 +1391,18 @@ bool arm_generate_debug_exceptions(CPUARMState *env);
 
 /**
  * pauth_ptr_mask:
- * @env: cpu context
- * @ptr: selects between TTBR0 and TTBR1
- * @data: selects between TBI and TBID
+ * @param: parameters defining the MMU setup
  *
- * Return a mask of the bits of @ptr that contain the authentication code.
+ * Return a mask of the address bits that contain the authentication code,
+ * given the MMU config defined by @param.
  */
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
index ec1e07f1399..c1f7e8c934b 100644
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
index 20f347332dc..de067fa7168 100644
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
2.34.1


