Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9115F1CA6
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:20:20 +0200 (CEST)
Received: from localhost ([::1]:48946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedLn-0005pf-Tg
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBu-0002cg-IZ
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:06 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:40839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBq-0003zX-Tc
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:06 -0400
Received: by mail-qv1-xf30.google.com with SMTP id h10so2804609qvq.7
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=j8Fqn52emtrc8wfKNsJ8wDq4Kg/BHk/sdQJpywsNASo=;
 b=FywkiZyDRT77Uw4bCcV5Q3LuTBgSSOpF2Kay84HRVaTrKJQH3mPsdGTHhfg4vDgvHU
 srdTqiBt+M6ZWkNZKqApx8s3pTJKDYqPEayZGF9eSrb8oEiD0D7ORnSIExXrBqWdIwtK
 9RvqdLdR4jsyNwUmqCjkdnxpu2P/m5kvqa7K0Z9SZyUwmCterzbOJcVB0F1bavffYhDa
 zaOpbLwg2rV8ugiVbdPxIpkpyW+LHR7QbzEC8SqprmskFR3BXzrzB8jEcVxJx1OncROQ
 jEO59rWyD5vFEUM6wNMLCski6QoKPacK1SCiD8iRI/w55Uz2IXOF9VXWafbC8yZe38VW
 Smjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=j8Fqn52emtrc8wfKNsJ8wDq4Kg/BHk/sdQJpywsNASo=;
 b=dX9J6LhEwGf3QuXKezAsJErm4sL1bwsxkiAVsQsaLi2LrOR4/Fz3AnfDRJ4/ltA5cx
 dTSWH48+dzoyEqZ0G6//mM5SoEu3aeuogVN8sdbEVs0Sy0qPsnDxN9aocjgWKVk7nyHz
 i9EzBQt/M//56z1mCDfYnZILkcTG7Pma3/sf+FMWWaBz6+bHipjXevshyeXjipgaRA9P
 Rc+WnUexxPE9RvdSCO9EeBIs3Udal9xXyRPnISzrrggd3Kr+9nsC/SRIAkeVXkqwWL95
 b4odJK+iEluaqGHCpDdY+Lxt6WBLwbgmA3wH07iVXPe9vhxQ/AC/ZWjAf2k3InmgVmAM
 2lrg==
X-Gm-Message-State: ACrzQf0hul8F7zZ0DcXQT0y0LfFMoP8Se5057rQgS6zoQbhdRXjk3QDN
 1Sl/TxC0da3bY2A16BquCc0Epfj0BybL64y4
X-Google-Smtp-Source: AMsMyM53BV1ErKW33WQ8cix4bnlTi4hmgoI3lXnbIVB81NvCog7q4c1Q6t6t//+mO0w2I4SkgSfs8g==
X-Received: by 2002:a05:6214:c21:b0:4ad:75e:93bb with SMTP id
 a1-20020a0562140c2100b004ad075e93bbmr11069848qvd.27.1664633385235; 
 Sat, 01 Oct 2022 07:09:45 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:09:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 02/26] target/i386: Return bool from disas_insn
Date: Sat,  1 Oct 2022 07:09:11 -0700
Message-Id: <20221001140935.465607-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of returning the new pc, which is present in
DisasContext, return true if an insn was translated.
This is false when we detect a page crossing and must
undo the insn under translation.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 44 +++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 16bf56dbc7..3f3e79c096 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4707,7 +4707,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
 
 /* convert one instruction. s->base.is_jmp is set if the translation must
    be stopped. Return the next pc value */
-static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
+static bool disas_insn(DisasContext *s, CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     int b, prefixes;
@@ -4734,15 +4734,16 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 1:
         gen_exception_gpf(s);
-        return s->pc;
+        return true;
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
@@ -8644,13 +8645,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -8815,7 +8816,6 @@ static void i386_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
-    target_ulong pc_next;
 
 #ifdef TARGET_VSYSCALL_PAGE
     /*
@@ -8828,21 +8828,23 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
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


