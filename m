Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A60953F44C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 05:06:56 +0200 (CEST)
Received: from localhost ([::1]:40040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPYV-0003eJ-Fx
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 23:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG3-00070O-Sk
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:51 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:36530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFz-0000LV-U2
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:51 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 15so14288625pfy.3
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SJsPBjgxAIzmv4HQ3HMK84E2HfNlE6G2yY4SYv05x4E=;
 b=b+jR/wV2UICJGjskdupGHqX8deboXE9IGmglenjvTepIYIQ6s3ecfOoTmYZ4z82p6V
 TgPsjRnoY3LmNmA3GPwdL5mqHgmU8WlwzMvKzYdvxGEpzLaljiEm79zKHyePRTn9TX+6
 6vgYM2qxFlcsImrnnN0nOes1RwvQI3n2Az/UwEm6YuZYrOQsSHGL/eF/CuBn6nsGKhAa
 2WP9kxGKyCLHEA4oWr9oFbvv2Toso1CecYh9BbQFnqHIc7GX8RpfJGB4dJUv0srGT0hM
 lnjbjydvdEkS8GMR6uqOz6jBBRRZ2M0b8xnxLHCD0SJL2+lDvnao0nr7LqM1ziYYCD9r
 Vtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SJsPBjgxAIzmv4HQ3HMK84E2HfNlE6G2yY4SYv05x4E=;
 b=M8R7wZGYMtRW34V6JQg9QZDb9gWEH+iYZGKy0BU4r1HyY6ZcBwS02Sr9FJMR7pbk8G
 rDTVDq+MJFoo5uz69AzTsToAz2JaNQcP3YFZ2Seftj0dFtw1x6e2RRWnqZcHk+UoG9cy
 7idk0GDS804o/hzf7R+PIULOXmwmQ4J3/GbDHDuDE3AATo1RYyXnM0u0BZJxVLkd+wLz
 tyRwi8sh/ome4CtG6l+5e8iUZMbarzIwMx6ZJBzIGYLIT1IHKOwVI2EtZhgQVnFp7ouB
 Fc532LC439FIAqMRF/kzFbWwRTPnwsDO9D0qzL1m4gIQj0w3xl3t7nPJ3nlQZNoIrqW3
 SE/g==
X-Gm-Message-State: AOAM533qSOtfc2FzHvUa3PTiXJpf7/OyajCFYV1wVSpLJ9i+Kt/J61Wu
 9UDmNRjKZ5Po82fjGMcqk3GoHnVk4p1Mzg==
X-Google-Smtp-Source: ABdhPJwlEvSQ7nXjrT/vESgImwPcwSIkcsiSsDeBDhIUUUBAI9N9rJqabKtDzPcFNlNOxEYWzZSEsg==
X-Received: by 2002:a05:6a00:23ce:b0:50d:823f:981 with SMTP id
 g14-20020a056a0023ce00b0050d823f0981mr27587412pfc.10.1654570066498; 
 Mon, 06 Jun 2022 19:47:46 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 13/25] target/arm: Introduce gen_exception_insn
Date: Mon,  6 Jun 2022 19:47:22 -0700
Message-Id: <20220607024734.541321-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Create a new wrapper function that passes the default
exception target to gen_exception_insn_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h        |  1 +
 target/arm/translate-a64.c    | 15 ++++++---------
 target/arm/translate-m-nocp.c |  3 +--
 target/arm/translate-mve.c    |  3 +--
 target/arm/translate.c        | 29 +++++++++++++----------------
 5 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index c54db51d70..04d45da54e 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -281,6 +281,7 @@ MemOp pow2_align(unsigned i);
 void unallocated_encoding(DisasContext *s);
 void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
                            uint32_t syn, uint32_t target_el);
+void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn);
 
 /* Return state of Alternate Half-precision flag, caller frees result */
 static inline TCGv_i32 get_ahp_flag(void)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index cc96535fae..a5c66ce085 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1815,8 +1815,7 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
     } else {
         syndrome = syn_uncategorized();
     }
-    gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF, syndrome,
-                          default_exception_el(s));
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syndrome);
 }
 
 /* MRS - move from system register
@@ -2068,8 +2067,8 @@ static void disas_exc(DisasContext *s, uint32_t insn)
         switch (op2_ll) {
         case 1:                                                     /* SVC */
             gen_ss_advance(s);
-            gen_exception_insn_el(s, s->base.pc_next, EXCP_SWI,
-                                  syn_aa64_svc(imm16), default_exception_el(s));
+            gen_exception_insn(s, s->base.pc_next, EXCP_SWI,
+                               syn_aa64_svc(imm16));
             break;
         case 2:                                                     /* HVC */
             if (s->current_el == 0) {
@@ -14724,8 +14723,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
-                              syn_illegalstate(), default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -14756,9 +14754,8 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
             if (s->btype != 0
                 && s->guarded_page
                 && !btype_destination_ok(insn, s->bt, s->btype)) {
-                gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
-                                      syn_btitrap(s->btype),
-                                      default_exception_el(s));
+                gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                                   syn_btitrap(s->btype));
                 return;
             }
         } else {
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 636bfb1788..4029d7fdd4 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -765,8 +765,7 @@ static bool trans_NOCP(DisasContext *s, arg_nocp *a)
     }
 
     if (a->cp != 10) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
-                              syn_uncategorized(), default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_NOCP, syn_uncategorized());
         return true;
     }
 
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 5aec2a1555..0cf1b5ea4f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -100,8 +100,7 @@ bool mve_eci_check(DisasContext *s)
         return true;
     default:
         /* Reserved value: INVSTATE UsageFault */
-        gen_exception_insn_el(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                              default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
         return false;
     }
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 44f462a3a3..c7d422b541 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1106,6 +1106,11 @@ void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
     gen_exception_insn_el_v(s, pc, excp, syn, tcg_constant_i32(target_el));
 }
 
+void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn)
+{
+    gen_exception_insn_el(s, pc, excp, syn, default_exception_el(s));
+}
+
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 {
     gen_set_condexec(s);
@@ -1117,8 +1122,7 @@ static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 void unallocated_encoding(DisasContext *s)
 {
     /* Unallocated and reserved encodings are uncategorized */
-    gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-                          default_exception_el(s));
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized());
 }
 
 /* Force a TB lookup after an instruction that changes the CPU state.  */
@@ -2731,8 +2735,6 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
      * an exception and return false. Otherwise it will return true,
      * and set *tgtmode and *regno appropriately.
      */
-    int exc_target = default_exception_el(s);
-
     /* These instructions are present only in ARMv8, or in ARMv7 with the
      * Virtualization Extensions.
      */
@@ -2869,8 +2871,7 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
 
 undef:
     /* If we get here then some access check did not pass */
-    gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
-                          syn_uncategorized(), exc_target);
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized());
     return false;
 }
 
@@ -8583,8 +8584,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         tmp = load_cpu_field(v7m.ltpsize);
         tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc);
         tcg_temp_free_i32(tmp);
-        gen_exception_insn_el(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                              default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
         gen_set_label(skipexc);
     }
 
@@ -9054,8 +9054,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
      * UsageFault exception.
      */
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                              default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
         return;
     }
 
@@ -9064,8 +9063,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
-                              syn_illegalstate(), default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -9634,8 +9632,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn_el(dc, dc->pc_curr, EXCP_UDEF,
-                              syn_illegalstate(), default_exception_el(dc));
+        gen_exception_insn(dc, dc->pc_curr, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -9708,8 +9705,8 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          */
         tcg_remove_ops_after(dc->insn_eci_rewind);
         dc->condjmp = 0;
-        gen_exception_insn_el(dc, dc->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                              default_exception_el(dc));
+        gen_exception_insn(dc, dc->pc_curr, EXCP_INVSTATE,
+                           syn_uncategorized());
     }
 
     arm_post_translate_insn(dc);
-- 
2.34.1


