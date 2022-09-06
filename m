Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A325AE63A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:12:00 +0200 (CEST)
Received: from localhost ([::1]:47918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWUp-0000Od-9O
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWX-00008r-47
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:42 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWU-0003YT-9T
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:39 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so7123766wms.5
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=U9wJch3Mr+80A8OpbD50uMdv9qALdIoa9hZoWWo8/ok=;
 b=b+WluHyVdZtDLJUDRxCEo/qh36hdPrFb74ix6gtSwrWO+rYhQrpGrrT6VzlWubVzfW
 AEWDWiAmHOQRVeyTyoeZY5OP+rGvVy9lZmEPZoubpXJipP7XrP2TFUS71vhDOkXc1Yf8
 017F7FSSUAuhLcC4ei3EQZvtIeNL8XO05mZhwIr3+m5MzkmFKzvDc3Ny5mbU+CH2j2CU
 2LiitMoi9ybtpa+r+HRAlyBiDLk7LcNwMKsSQIouBmngrl8iF9E+1OuPw+noOgX5pKMC
 o6YY82mLT4BHtLMS1MCYctpgM3jMyYjKRjLbwmLiPO4ET+3RL2kaAm/f6yHNr+UhKfic
 Zezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=U9wJch3Mr+80A8OpbD50uMdv9qALdIoa9hZoWWo8/ok=;
 b=AlaPT16g0UG/WzGj9JbsOREDiPHTlCyLw2oYyVDrGNzRz3Du2ISLMF4b36df+88uDd
 e6y73q1/mRyJzyrmvCmIjznr7BYKlBCeSrUzqSZWqZqAREa1FXUh5SIBEadDcqBcHz7y
 ezsfKYMSjPykHz0ND/OLueljED+FTlsNAIYIWXAPhvcDCXndifHo+TpaTAK8ifG64qa2
 cX6ckHsK0R3ZqRWp4oricBHGXFaH0rDOaHnregRtpa6Niad3vzbtamwVXxTJ2RLQ4DXz
 AKcE9BYhHfkVrIX5X3K364lLQiz2t72Phta7aRNCp8rTA+bTa/mpr1P6rPNylYcIOccC
 SNLA==
X-Gm-Message-State: ACgBeo2vsonevdhiwB0k3Bs3P52RT+sVatGd2dIbJpbq2Lo1DtQBPoEa
 k4DzpgVFprMPkyjQWImW9VU82Ojo17Y3gg74
X-Google-Smtp-Source: AA6agR5o9p3kHX198x13yGhYk38HygWEZyCEs6JuWxl1DmPU9i7hyJyt5zmb+W6vhPF0nj5Ss5gXwg==
X-Received: by 2002:a05:600c:228c:b0:3a8:3d5d:5729 with SMTP id
 12-20020a05600c228c00b003a83d5d5729mr13053921wmf.144.1662458976304; 
 Tue, 06 Sep 2022 03:09:36 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 02/23] target/i386: Return bool from disas_insn
Date: Tue,  6 Sep 2022 11:09:11 +0100
Message-Id: <20220906100932.343523-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of returning the new pc, which is present in
DisasContext, return true if an insn was translated.
This is false when we detect a page crossing and must
undo the insn under translation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 42 +++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 1e24bb2985..46300ffd91 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4665,7 +4665,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
 
 /* convert one instruction. s->base.is_jmp is set if the translation must
    be stopped. Return the next pc value */
-static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
+static bool disas_insn(DisasContext *s, CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     int b, prefixes;
@@ -4695,12 +4695,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         return s->pc;
     case 2:
         /* Restore state that may affect the next instruction. */
+        s->pc = s->base.pc_next;
         s->cc_op_dirty = orig_cc_op_dirty;
         s->cc_op = orig_cc_op;
         s->base.num_insns--;
         tcg_remove_ops_after(s->prev_insn_end);
         s->base.is_jmp = DISAS_TOO_MANY;
-        return s->base.pc_next;
+        return false;
     default:
         g_assert_not_reached();
     }
@@ -8609,13 +8610,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     default:
         goto unknown_op;
     }
-    return s->pc;
+    return true;
  illegal_op:
     gen_illegal_opcode(s);
-    return s->pc;
+    return true;
  unknown_op:
     gen_unknown_opcode(env, s);
-    return s->pc;
+    return true;
 }
 
 void tcg_x86_init(void)
@@ -8780,7 +8781,6 @@ static void i386_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
-    target_ulong pc_next;
 
 #ifdef TARGET_VSYSCALL_PAGE
     /*
@@ -8793,21 +8793,23 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 #endif
 
-    pc_next = disas_insn(dc, cpu);
-    dc->base.pc_next = pc_next;
+    if (disas_insn(dc, cpu)) {
+        target_ulong pc_next = dc->pc;
+        dc->base.pc_next = pc_next;
 
-    if (dc->base.is_jmp == DISAS_NEXT) {
-        if (dc->flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)) {
-            /*
-             * If single step mode, we generate only one instruction and
-             * generate an exception.
-             * If irq were inhibited with HF_INHIBIT_IRQ_MASK, we clear
-             * the flag and abort the translation to give the irqs a
-             * chance to happen.
-             */
-            dc->base.is_jmp = DISAS_TOO_MANY;
-        } else if (!is_same_page(&dc->base, pc_next)) {
-            dc->base.is_jmp = DISAS_TOO_MANY;
+        if (dc->base.is_jmp == DISAS_NEXT) {
+            if (dc->flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)) {
+                /*
+                 * If single step mode, we generate only one instruction and
+                 * generate an exception.
+                 * If irq were inhibited with HF_INHIBIT_IRQ_MASK, we clear
+                 * the flag and abort the translation to give the irqs a
+                 * chance to happen.
+                 */
+                dc->base.is_jmp = DISAS_TOO_MANY;
+            } else if (!is_same_page(&dc->base, pc_next)) {
+                dc->base.is_jmp = DISAS_TOO_MANY;
+            }
         }
     }
 }
-- 
2.34.1


