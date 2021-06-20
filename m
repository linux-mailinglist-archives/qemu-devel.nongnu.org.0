Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899213AE0BD
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 23:37:55 +0200 (CEST)
Received: from localhost ([::1]:53090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv58c-0007KF-HI
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 17:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53t-0002Ny-QT
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:33:01 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53o-0008Ui-GE
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:33:01 -0400
Received: by mail-pl1-x632.google.com with SMTP id f10so5330936plg.0
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 14:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vWYGihdcluFmv+BkOCZIBqSaEk3uezdQ5EyW3tAoFv0=;
 b=xisxX7ZmFRXfhYfLb39miEUT9xHZaKsgF8uFQ89Yz6bTnRGFx9KOrArEzpv1h1Lemy
 CEmsDtIfsJE11RZMsVU7+vIGPOXDKjdGOJ6gucRHsA898BZ0fUmhxFDQHml3y18Ze3Jr
 npczjYL76FV733LPZftc1AXO/ASCd+QvT7ETItj/RbCTqp3cWbnpD0nkrZV6BPHKkxzw
 VB+svUb4iKV740olLMfH4dHY51mg9/vL+NtrpjL4d4gW++vbSNuiw+eeV92sNbg1nW66
 EeBeXCC9aOzW4wZ8MxQ1KgcedJxtWh15oWKgNolkEvMHK/lGzFcjKBzUFZopqa4MngLe
 BT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vWYGihdcluFmv+BkOCZIBqSaEk3uezdQ5EyW3tAoFv0=;
 b=DAIPxDJk+82w2++3gH7gCFCWakGuNc7iwu0AWZNqcQcqExwxZeSSmq0twVExC50Uaz
 LlYsgsTaPuKwzb6ZF0R7gvMHmg71uxqkuJidbpqH/p5/UjYW9dsgag3vVp/6fc8YhSiA
 jY/dURDKlCFdWvDSOgOxs5DdaFYiCxfWgCGFa7UeqtMGdbWa+pWxtmg+OaNde4O2xe54
 VCEHOT8m50rQX0YW7jcGWwiURNOVSyQRnvZFWp3oJCnHvNIPL+1rLSUVqMHEofUis+Cb
 phYExyjRVJ2dt6K5CAfkE5LAnIqhi/gR73EMMFaXN1mQdp1tw6I0HXusBIxPnYmVKabE
 OlNQ==
X-Gm-Message-State: AOAM530Goje+PAGJeegjRyartNXZMfyUKMoKPui0D2WpZJ/JOSbgaL1U
 ptvBzqi0hMPGXUB/d6Tqh1EJOcJb3cLWsQ==
X-Google-Smtp-Source: ABdhPJyn7H9YyjEwbTbgNdhffrmRs0GMZQ27vlHWWxx/83upV9rTNZMakw64jEKomHwv9KRMf7Ed4g==
X-Received: by 2002:a17:90b:197:: with SMTP id
 t23mr23094377pjs.61.1624224774851; 
 Sun, 20 Jun 2021 14:32:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w21sm13608329pfq.143.2021.06.20.14.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 14:32:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/11] target/cris: Move delayed branch handling to tb_stop
Date: Sun, 20 Jun 2021 14:32:47 -0700
Message-Id: <20210620213249.1494274-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620213249.1494274-1-richard.henderson@linaro.org>
References: <20210620213249.1494274-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By moving the code here, we can re-use other end-of-tb code,
e.g. the evaluation of flags.  Honor single stepping.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 82 ++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 37 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 83b20162f1..0e925320b3 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -55,6 +55,7 @@
 /* is_jmp field values */
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
+#define DISAS_DBRANCH DISAS_TARGET_2 /* pc update for delayed branch */
 
 /* Used by the decoder.  */
 #define EXTRACT_FIELD(src, start, end) \
@@ -3219,43 +3220,8 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
      * loop doing nothing for on this program location.
      */
     if (dc->delayed_branch && --dc->delayed_branch == 0) {
-        if (dc->base.tb->flags & 7) {
-            t_gen_movi_env_TN(dslot, 0);
-        }
-
-        if (dc->cpustate_changed
-            || !dc->flagx_known
-            || (dc->flags_x != (dc->base.tb->flags & X_FLAG))) {
-            cris_store_direct_jmp(dc);
-        }
-
-        if (dc->clear_locked_irq) {
-            dc->clear_locked_irq = 0;
-            t_gen_movi_env_TN(locked_irq, 0);
-        }
-
-        if (dc->jmp == JMP_DIRECT_CC) {
-            TCGLabel *l1 = gen_new_label();
-            cris_evaluate_flags(dc);
-
-            /* Conditional jmp.  */
-            tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, l1);
-            gen_goto_tb(dc, 1, dc->jmp_pc);
-            gen_set_label(l1);
-            gen_goto_tb(dc, 0, dc->pc);
-            dc->base.is_jmp = DISAS_NORETURN;
-            dc->jmp = JMP_NOJMP;
-        } else if (dc->jmp == JMP_DIRECT) {
-            cris_evaluate_flags(dc);
-            gen_goto_tb(dc, 0, dc->jmp_pc);
-            dc->base.is_jmp = DISAS_NORETURN;
-            dc->jmp = JMP_NOJMP;
-        } else {
-            TCGv c = tcg_const_tl(dc->pc);
-            t_gen_cc_jmp(env_btarget, c);
-            tcg_temp_free(c);
-            dc->base.is_jmp = DISAS_JUMP;
-        }
+        dc->base.is_jmp = DISAS_DBRANCH;
+        return;
     }
 
     /* Force an update if the per-tb cpu state has changed.  */
@@ -3303,6 +3269,48 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 
     cris_evaluate_flags(dc);
 
+    /* Evaluate delayed branch destination and fold to another is_jmp case. */
+    if (is_jmp == DISAS_DBRANCH) {
+        if (dc->base.tb->flags & 7) {
+            t_gen_movi_env_TN(dslot, 0);
+        }
+
+        switch (dc->jmp) {
+        case JMP_DIRECT:
+            npc = dc->jmp_pc;
+            is_jmp = DISAS_TOO_MANY;
+            break;
+
+        case JMP_DIRECT_CC:
+            /*
+             * Use a conditional branch if either taken or not-taken path
+             * can use goto_tb.  If neither can, then treat it as indirect.
+             */
+            if (likely(!dc->base.singlestep_enabled)
+                && (use_goto_tb(dc, dc->jmp_pc) || use_goto_tb(dc, npc))) {
+                TCGLabel *not_taken = gen_new_label();
+
+                tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, not_taken);
+                gen_goto_tb(dc, 1, dc->jmp_pc);
+                gen_set_label(not_taken);
+
+                /* not-taken case handled below. */
+                is_jmp = DISAS_TOO_MANY;
+                break;
+            }
+            tcg_gen_movi_tl(env_btarget, dc->jmp_pc);
+            /* fall through */
+
+        case JMP_INDIRECT:
+            t_gen_cc_jmp(env_btarget, tcg_constant_tl(npc));
+            is_jmp = DISAS_JUMP;
+            break;
+
+        default:
+            g_assert_not_reached();
+        }
+    }
+
     if (unlikely(dc->base.singlestep_enabled)) {
         switch (is_jmp) {
         case DISAS_TOO_MANY:
-- 
2.25.1


