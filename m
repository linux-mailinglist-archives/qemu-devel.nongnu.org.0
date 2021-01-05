Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA2F2EB1AB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:45:49 +0100 (CET)
Received: from localhost ([::1]:47998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqOy-0001bY-4x
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:45:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0q-0002hO-Dp
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:52 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0o-0006eu-GC
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:52 -0500
Received: by mail-pg1-x52e.google.com with SMTP id c132so291134pga.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CTx1bMRPoVCbR9ZXrYADDGmrgIOCMd4LcuRPi7m2xvc=;
 b=yNttRrxwhILtIBkfbzbBANM51FzLoQJoaKzBvshw1HPg+Q79WiPUE8wn9iPTyND17t
 81StWsta2WLun07+69utmeYDu9eGVuqOO6lQ/ul7GC491+91RLAHePGKy8kR1PhREAuS
 hMpjs4i+IttbuLTvXkjyI7a+GquzOxSrRItMOqrzDjRn7OYN7bBnrB07nRLU3GKZu5ys
 sM0DyBtKZTc3458die2HFuPqbBtx03CCbiNoBRoHP+MCSMezxALtkv+pSKoulrbi8PZu
 kziAWbAjAzSorf70J+ZmUfuHbgh8m/JYHjj9eEUOYqjvG3hJsldQPrgel7YHGNohbXAC
 aHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CTx1bMRPoVCbR9ZXrYADDGmrgIOCMd4LcuRPi7m2xvc=;
 b=hDRraIwQGzS5uIfvVvWR4YWSmUwqfG6r8am3Nionjc1RGuRVuVdBYob5O29eCNnGax
 aUFnTBWlk04sfnoNWvfJuYEyx5GWFJ3e/4md2GeE97LlSrHtth6pX4p6EmELliK5DbLF
 Rm/96H4tocO7+RP9gg9iecB7P8GY1kPjZWVxNetm1u9WJgw5OvhK4DbhMeT/qlgNg021
 pp18QYAzLuKjYSzL79/SbzQttmSu8HIYlYtzVbpCMV+K8MKRhC5pLtWjaaGNcMZ9MKhX
 4kWkwxFeVuIsy6SHHseCnfJ1rehky7PzoTRDAauP994JGQAxvlTJTcYb9c/TJ25Xzb3I
 Cx5g==
X-Gm-Message-State: AOAM532jBXz5vAlEJ1L2xVviCShKG/VfwbtaoEAqntYcTSlEQNKLzmEF
 3/Jb41/1Z+Fd59NuO+qEEBkeC5AxCJm5rQ==
X-Google-Smtp-Source: ABdhPJxQlGCaGHmMRAIuwh8chizkSMwaIkXgzxZ7No86YRmxl4hJi6QM/Y2OlHA5VSExwbBaBuYDUQ==
X-Received: by 2002:a63:fb54:: with SMTP id w20mr316064pgj.419.1609867247700; 
 Tue, 05 Jan 2021 09:20:47 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 31/43] tcg/sparc: Support split-wx code generation
Date: Tue,  5 Jan 2021 07:19:38 -1000
Message-Id: <20210105171950.415486-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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


