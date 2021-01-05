Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651312EB1D6
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:54:56 +0100 (CET)
Received: from localhost ([::1]:51400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqXn-0006On-D9
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0V-0002Nb-Hh
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:32 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0N-0006Yb-Tj
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:30 -0500
Received: by mail-pl1-x634.google.com with SMTP id j1so67817pld.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E8w1jAPv5ZMwC9hUfY2h/aIQICFcgu6SGeTKeYT6t3w=;
 b=P/JWR125xZFj2Zv/iq/7ZgYfeuPWJRBQaFtBy5Y29h4xw/fmkV8duqeBqIAlULnmFx
 2/wHPtrqEjcgjp7Oj3oqJM47gP1NKCoe9IwoogY7xVFrSDBrjyRNiIqIRLcRmpMNuw0v
 gDrfwIlEnecefBDjMzWHBF3a0V/O43lFa0/spPw1CH7i1E3ambeWUsz1bZDqAgz3quMl
 Ad1tBHyGLXpbSZqOl6KiZhcpeAKHnv1jEqowc9uTW6UgZ8+w4Gkntxp0dqxhD9Im/vKg
 NOgsynVl1ZFzX9Mi2+gY/Xta/CtZDxtURUzACfst8sW4PNtUR7pCAJiapxxzrcDkbARN
 Xs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E8w1jAPv5ZMwC9hUfY2h/aIQICFcgu6SGeTKeYT6t3w=;
 b=dizuD7cb3428/M2yFKcy4A/q7f+aKPyAxL/aO7GPD9s4BugO7uM74zOQuLbuqeoyBd
 8QaKvQtn9Un9mm+ABEAiu94u8Hlku3ksWlVlBtrPUsR1rIk9xTHWaoXqT6TaRIaLvoAr
 vdb8VpVGzpOJJf/RwKwY2oYIlRGPlwdlzEg4kQEF9HBDjQiWJFs23NC7PVJGReG6J8kk
 k5pfxLq73uHWwzfLXgJqGVUh89OYXuTPxDR4XmoSv7yAlZI7VxLGNS0cCXbFmRsGGbLi
 zCvpfisHhY9CXqfPDUjyrsU2oJYRclQRqYs/2bWUfPCZJKKcxLU6imWUY3hV91l09Wzw
 Q6rg==
X-Gm-Message-State: AOAM5315ZyuQj2U8DN0oakGoMxp9LRM6M2gxvf75jub00EgSLO3RbndP
 219B11xIL4lPh9eypbaR8ZDekjJMrJeX2A==
X-Google-Smtp-Source: ABdhPJyMWOjI17DpP+GDTap+fm8II6SQTA8JbiTZnrOYOITkKoMJGCf99/mQCoSLHsLQ6gshERGgfw==
X-Received: by 2002:a17:90a:bb91:: with SMTP id
 v17mr218078pjr.231.1609867221126; 
 Tue, 05 Jan 2021 09:20:21 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/43] tcg: Make DisasContextBase.tb const
Date: Tue,  5 Jan 2021 07:19:21 -1000
Message-Id: <20210105171950.415486-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: Joelle van Dyne <j@getutm.app>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is nothing within the translators that ought to be
changing the TranslationBlock data, so make it const.

This does not actually use the read-only copy of the
data structure that exists within the rx region.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h  | 4 ++--
 include/exec/translator.h  | 2 +-
 include/tcg/tcg-op.h       | 2 +-
 accel/tcg/translator.c     | 4 ++--
 target/arm/translate-a64.c | 2 +-
 tcg/tcg-op.c               | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 822c43cfd3..aa4b44354a 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -32,7 +32,7 @@ static inline void gen_io_end(void)
     tcg_temp_free_i32(tmp);
 }
 
-static inline void gen_tb_start(TranslationBlock *tb)
+static inline void gen_tb_start(const TranslationBlock *tb)
 {
     TCGv_i32 count, imm;
 
@@ -71,7 +71,7 @@ static inline void gen_tb_start(TranslationBlock *tb)
     tcg_temp_free_i32(count);
 }
 
-static inline void gen_tb_end(TranslationBlock *tb, int num_insns)
+static inline void gen_tb_end(const TranslationBlock *tb, int num_insns)
 {
     if (tb_cflags(tb) & CF_USE_ICOUNT) {
         /* Update the num_insn immediate parameter now that we know
diff --git a/include/exec/translator.h b/include/exec/translator.h
index 638e1529c5..24232ead41 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -67,7 +67,7 @@ typedef enum DisasJumpType {
  * Architecture-agnostic disassembly context.
  */
 typedef struct DisasContextBase {
-    TranslationBlock *tb;
+    const TranslationBlock *tb;
     target_ulong pc_first;
     target_ulong pc_next;
     DisasJumpType is_jmp;
diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 5b3bdacc39..901b19f32a 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -805,7 +805,7 @@ static inline void tcg_gen_insn_start(target_ulong pc, target_ulong a1,
  * be NULL and @idx should be 0.  Otherwise, @tb should be valid and
  * @idx should be one of the TB_EXIT_ values.
  */
-void tcg_gen_exit_tb(TranslationBlock *tb, unsigned idx);
+void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx);
 
 /**
  * tcg_gen_goto_tb() - output goto_tb TCG operation
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index fb1e19c585..a49a794065 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -133,8 +133,8 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     }
 
     /* The disas_log hook may use these values rather than recompute.  */
-    db->tb->size = db->pc_next - db->pc_first;
-    db->tb->icount = db->num_insns;
+    tb->size = db->pc_next - db->pc_first;
+    tb->icount = db->num_insns;
 
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2e3fdfdf6b..ef63edfc68 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -410,7 +410,7 @@ static inline bool use_goto_tb(DisasContext *s, int n, uint64_t dest)
 
 static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
 {
-    TranslationBlock *tb;
+    const TranslationBlock *tb;
 
     tb = s->base.tb;
     if (use_goto_tb(s, n, dest)) {
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index af7ce91ffa..19fa8e4691 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2664,7 +2664,7 @@ void tcg_gen_extr32_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg)
 
 /* QEMU specific operations.  */
 
-void tcg_gen_exit_tb(TranslationBlock *tb, unsigned idx)
+void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
 {
     uintptr_t val = (uintptr_t)tb + idx;
 
-- 
2.25.1


