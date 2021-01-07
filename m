Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3822EE70F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:41:50 +0100 (CET)
Received: from localhost ([::1]:40088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxc6P-0000SN-VB
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhW-0001Xa-7J
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:06 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:32771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhK-0001hg-Mw
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:05 -0500
Received: by mail-pg1-x536.google.com with SMTP id n25so5760342pgb.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CTx1bMRPoVCbR9ZXrYADDGmrgIOCMd4LcuRPi7m2xvc=;
 b=eEzHqFkNXxQK3AZfGsvtETijjXQyuPxAH3CzL/wwMbdj+HHms8zgEZhXBSXFbvX/9y
 jJaEdnY5/OiNTSmiHTMw9wY3rtTyhpN3/ZYwF1cqF9sfExSibFe8KfLcF1OsB5wyd4cO
 Xn+NY0+z3EzYHt7TcUQBNxe9JBOtm7p0Zn7EyVoGmrT1YWJHQnMs/C9vFDyavAOidd5G
 Ql5I7qG61J9OPHS0O9vnm2i62uHqld43wDptt9m6RflBmTWUMj95DdJ20ClB8+Hav49n
 k/H7XeqrppGWHdU63NWH8ILDfZIAfqcGWCAbJMyVsPF+1941SSQGq65VJbiBHo/1oHRE
 TgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CTx1bMRPoVCbR9ZXrYADDGmrgIOCMd4LcuRPi7m2xvc=;
 b=QrfATgQVuJKGC42uZOAsPTlS2b7kOQhKSemiMMwHM+WW0UC7zDsOEpjNmBjgfs1VrV
 aqE5Ivd86envPreOsz5DcSif0VceVi+6M4xl8fbizuwFS1qYug3a/g6Aphs6ys41MXtn
 uLBo06L7TsEs46Y164WDeg8ikMwnWHzd5Iozs1Djx8645Jo1knCE0jJq5Y9WseuxcV9v
 3850gedwWAszgz+uQh/u5038eMvNnRthpCRo4Z1B8L0uZanflnk9uuQZ0Y74S+gjLuTa
 G0NTRQEjfVqC54Fv1qGKiMp7lhT4wuIndOmb70DDX5JrLmxkonAii6HWGSTXsN98uJQI
 n9oQ==
X-Gm-Message-State: AOAM533i/VfqtZVChvq8CT8jsCLGmEGQwo5wdp1VgRyd7aZVO9dckmD4
 mJwEJCnjrdAXMqErsQlBkt645BIVjBP7KA==
X-Google-Smtp-Source: ABdhPJyfPVCClPx2RVOaDXeqWlaMpO9QmDns3pM8Cs1ekk2Hg0dJu+maItziFx4d7TMohmPQigPYJw==
X-Received: by 2002:aa7:868e:0:b029:19e:3ac9:f622 with SMTP id
 d14-20020aa7868e0000b029019e3ac9f622mr408508pfo.37.1610050552477; 
 Thu, 07 Jan 2021 12:15:52 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/47] tcg/sparc: Support split-wx code generation
Date: Thu,  7 Jan 2021 10:14:36 -1000
Message-Id: <20210107201448.1152301-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.h     |  2 +-
 tcg/sparc/tcg-target.c.inc | 24 +++++++++++++-----------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 6f6cefaa15..6426e24f17 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -172,6 +172,6 @@ extern bool use_vis3_instructions;
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       0
+#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 8f04fdf981..182124b96c 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -291,14 +291,15 @@ static inline int check_fit_i32(int32_t val, unsigned int bits)
 # define check_fit_ptr  check_fit_i32
 #endif
 
-static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
+static bool patch_reloc(tcg_insn_unit *src_rw, int type,
                         intptr_t value, intptr_t addend)
 {
-    uint32_t insn = *code_ptr;
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    uint32_t insn = *src_rw;
     intptr_t pcrel;
 
     value += addend;
-    pcrel = tcg_ptr_byte_diff((tcg_insn_unit *)value, code_ptr);
+    pcrel = tcg_ptr_byte_diff((tcg_insn_unit *)value, src_rx);
 
     switch (type) {
     case R_SPARC_WDISP16:
@@ -315,7 +316,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
         g_assert_not_reached();
     }
 
-    *code_ptr = insn;
+    *src_rw = insn;
     return true;
 }
 
@@ -868,8 +869,8 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
 }
 
 #ifdef CONFIG_SOFTMMU
-static tcg_insn_unit *qemu_ld_trampoline[16];
-static tcg_insn_unit *qemu_st_trampoline[16];
+static const tcg_insn_unit *qemu_ld_trampoline[16];
+static const tcg_insn_unit *qemu_st_trampoline[16];
 
 static void emit_extend(TCGContext *s, TCGReg r, int op)
 {
@@ -930,7 +931,7 @@ static void build_trampolines(TCGContext *s)
         while ((uintptr_t)s->code_ptr & 15) {
             tcg_out_nop(s);
         }
-        qemu_ld_trampoline[i] = s->code_ptr;
+        qemu_ld_trampoline[i] = tcg_splitwx_to_rx(s->code_ptr);
 
         if (SPARC64 || TARGET_LONG_BITS == 32) {
             ra = TCG_REG_O3;
@@ -958,7 +959,7 @@ static void build_trampolines(TCGContext *s)
         while ((uintptr_t)s->code_ptr & 15) {
             tcg_out_nop(s);
         }
-        qemu_st_trampoline[i] = s->code_ptr;
+        qemu_st_trampoline[i] = tcg_splitwx_to_rx(s->code_ptr);
 
         if (SPARC64) {
             emit_extend(s, TCG_REG_O2, i);
@@ -1038,7 +1039,8 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out_nop(s);
 
     /* Epilogue for goto_ptr.  */
-    tcg_code_gen_epilogue = s->code_ptr;
+    /* TODO: Cast goes away when all hosts converted */
+    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
     /* delay slot */
     tcg_out_movi_imm13(s, TCG_REG_O0, 0);
@@ -1163,7 +1165,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
 #ifdef CONFIG_SOFTMMU
     unsigned memi = get_mmuidx(oi);
     TCGReg addrz, param;
-    tcg_insn_unit *func;
+    const tcg_insn_unit *func;
     tcg_insn_unit *label_ptr;
 
     addrz = tcg_out_tlb_load(s, addr, memi, memop,
@@ -1245,7 +1247,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
 #ifdef CONFIG_SOFTMMU
     unsigned memi = get_mmuidx(oi);
     TCGReg addrz, param;
-    tcg_insn_unit *func;
+    const tcg_insn_unit *func;
     tcg_insn_unit *label_ptr;
 
     addrz = tcg_out_tlb_load(s, addr, memi, memop,
-- 
2.25.1


