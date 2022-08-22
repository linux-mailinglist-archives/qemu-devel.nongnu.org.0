Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D2C59CC8E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:55:06 +0200 (CEST)
Received: from localhost ([::1]:42950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHG5-0006NV-Gf
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGv6-0005f2-Sl
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:26 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGv5-0007EC-6O
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:24 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso12913935pjr.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=nqq51of1Uw+NqxfwJPSf3L4cXjdgw4EFZNmf1jtw0gc=;
 b=H2JIp7N66noHLD+kY9DnbFTfQ7OSrU9aTw+QomlB5bmnMqJo2KPDtMDOhCSTQR40E6
 JPtm9doB6PpfS1+hCyu5OK0J26X85I5XfQOTI2tIomtxnFgVj4M7jlmBYA+y5Ck+DYnh
 eULXEFpmf2XCXg/CEPXnNUriYQ8nRlZVdubHTkV73GRMknwecEp8VcnGflmxMR5I0Zsn
 XncMacOS5KgrtbhbTh3++N0nf4IDBe7SbaC/FrVB/Cfoa+CzfOuI2tfRmvUNLsKgskAh
 brYM8Zr5NozGDkGuV793z8CuV6652IQgN2P4fqwuLSUAQznh77JT11BO+1hqReIKcaCR
 BoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=nqq51of1Uw+NqxfwJPSf3L4cXjdgw4EFZNmf1jtw0gc=;
 b=rtumStbEaB9KlCRBVIrzFDZxDyu/oe7htzVLAwQaUz72bvkzN5xFbDC9rD/CMk2wkY
 eXJR/meZ2F+gvXsCY94NGJSPeOjDB0JdPFawVffDcVFMf3ebnGA267gC4yUzDn+b0AxF
 8HXjmkDEjM75yJ9M7k4HD7JTw2NHs0p7oxrC3Xn72GZ7P4sUyD095fIoRf5VtXuPUNnt
 wg5Xa0nYntleLFXjKXjQXg+nlYnkR3xZWHKeYzHyaiMWH6V6JG7hjxUz2HbYjp/nGRyK
 pAEUSR0TeFgPiBpTK07tw9THFHTzArmmNLrDibQfvfzPRSG42S0xMiGHXcDzAe1B+ELU
 sIqQ==
X-Gm-Message-State: ACgBeo3T+s4lKzlrg+l5KOBVyoRFOrHh3xiN7DJcY2IQyYOeV28xZTeX
 UVsy0+NjmOu3eIPScfYGy3ATGfxhzfZm0Q==
X-Google-Smtp-Source: AA6agR6yDnFjCzgZnJvintH6dgMakjgp0tq0H1ZY8YVk+qtBzbmkOeqcC9gwVfMWZ6u/aOQxAksynw==
X-Received: by 2002:a17:902:f550:b0:172:fe5d:aa0a with SMTP id
 h16-20020a170902f55000b00172fe5daa0amr1484369plf.170.1661211201767; 
 Mon, 22 Aug 2022 16:33:21 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/22] target/i386: Return bool from disas_insn
Date: Mon, 22 Aug 2022 16:32:57 -0700
Message-Id: <20220822233318.1728621-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
index a9a9a9de6e..2bdbfc6ddf 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4552,7 +4552,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
 
 /* convert one instruction. s->base.is_jmp is set if the translation must
    be stopped. Return the next pc value */
-static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
+static bool disas_insn(DisasContext *s, CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     int b, prefixes;
@@ -4582,12 +4582,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -8496,13 +8497,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -8667,7 +8668,6 @@ static void i386_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
-    target_ulong pc_next;
 
 #ifdef TARGET_VSYSCALL_PAGE
     /*
@@ -8680,21 +8680,23 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
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


