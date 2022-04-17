Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810CD5048B6
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 19:58:24 +0200 (CEST)
Received: from localhost ([::1]:52548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9AF-0001Wr-KS
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 13:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x3-0000h8-C0
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:45 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:41960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wz-0003IG-50
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:43 -0400
Received: by mail-pl1-x62f.google.com with SMTP id s14so10738174plk.8
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vG6RbvXKJEF7LRvBZL+ritf7+gssSLdu8vjdxGvJ4Ws=;
 b=H47D5x6Shn7fQGf+4FEQc6oC2xBpiuTUjJSGhhQf7fGGK/ZGJuURsYLJOwvB/YM6W/
 4KrGqKbGS5DyGW4XFoYZLL7WkebZauxspjQQ6+LoMUalKOf0isUx5xhGlB1TYGcmXazB
 uA0pjFk+IJYaEm9t1wAgTEEKj9zsnRKcfeL/zQHm4/C0IaLMR9lRfO8e02UeAWz17E7J
 3dOlnqUduqenGWONIp3hNVIkndOg1msT4Zil+7gW8aL4vL95y08/7aBipM/7Rt1ooaJD
 V5f1x0ljqVWMw9DM7GlqNTzHVvjffw7JrvtttwrsqqgGXsYRwddNUW94xIBVqJ5kfrBw
 p6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vG6RbvXKJEF7LRvBZL+ritf7+gssSLdu8vjdxGvJ4Ws=;
 b=r2VE+5uCnChaoS2gcEgI3HKQMO+uLP76yiG139mJNpFMiSSfHveP5P5oUjwMRrGNIi
 S03QDo2cuXV1bl4ulXx3CqbgOemBlL9r0Unv3H4HmkhMW7PRrjaBOxauSyyGeQ9pV2wr
 L44sIOrDNfCqdAq2eHNnQvFg/qKCtyZevPVrP4vjghyhHjLXfTcqop0Hg9O9V2vd1w2x
 tDivRvEfOBkgqoYg53YAwoZNSeK2IDQ6yo90KIxPPIuoE1bqAqQZBhH4GjKnzfjb00Zz
 AoEosf3E+sVpO2vfKm0A/zcisb0iNh1qfClYP+Iv7MMs4HICzcD/GBfVZbxhwcQOzmoX
 zHfw==
X-Gm-Message-State: AOAM533yqdas3Z2iqEg53lg21S9uKPsyatS30ohmtNK41SSO8Q1o4G/o
 nQD/yIQeKYa7ElM5bk0ed/o+Vu/fg+GAJw==
X-Google-Smtp-Source: ABdhPJwY2sIhSlxHP632cvTztUmEqt5dw7twamz93m/NpNRWt/GbS7nOr+7hL56CvdmMpVwVpq7T8w==
X-Received: by 2002:a17:90a:4bc2:b0:1b8:cdd3:53e2 with SMTP id
 u2-20020a17090a4bc200b001b8cdd353e2mr14253075pjl.219.1650217479905; 
 Sun, 17 Apr 2022 10:44:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/60] target/arm: Split out gen_rebuild_hflags
Date: Sun, 17 Apr 2022 10:43:38 -0700
Message-Id: <20220417174426.711829-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For aa32, the function has a parameter to use the new el.
For aa64, that never happens.
Use tcg_constant_i32 while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 21 +++++++++-----------
 target/arm/translate.c     | 40 +++++++++++++++++++++++---------------
 2 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a85ca380a9..a00a882145 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -341,6 +341,11 @@ static void a64_free_cc(DisasCompare64 *c64)
     tcg_temp_free_i64(c64->value);
 }
 
+static void gen_rebuild_hflags(DisasContext *s)
+{
+    gen_helper_rebuild_hflags_a64(cpu_env, tcg_constant_i32(s->current_el));
+}
+
 static void gen_exception_internal(int excp)
 {
     TCGv_i32 tcg_excp = tcg_const_i32(excp);
@@ -1667,9 +1672,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         } else {
             clear_pstate_bits(PSTATE_UAO);
         }
-        t1 = tcg_const_i32(s->current_el);
-        gen_helper_rebuild_hflags_a64(cpu_env, t1);
-        tcg_temp_free_i32(t1);
+        gen_rebuild_hflags(s);
         break;
 
     case 0x04: /* PAN */
@@ -1681,9 +1684,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         } else {
             clear_pstate_bits(PSTATE_PAN);
         }
-        t1 = tcg_const_i32(s->current_el);
-        gen_helper_rebuild_hflags_a64(cpu_env, t1);
-        tcg_temp_free_i32(t1);
+        gen_rebuild_hflags(s);
         break;
 
     case 0x05: /* SPSel */
@@ -1741,9 +1742,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
             } else {
                 clear_pstate_bits(PSTATE_TCO);
             }
-            t1 = tcg_const_i32(s->current_el);
-            gen_helper_rebuild_hflags_a64(cpu_env, t1);
-            tcg_temp_free_i32(t1);
+            gen_rebuild_hflags(s);
             /* Many factors, including TCO, go into MTE_ACTIVE. */
             s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
         } else if (dc_isar_feature(aa64_mte_insn_reg, s)) {
@@ -1990,9 +1989,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
          * A write to any coprocessor regiser that ends a TB
          * must rebuild the hflags for the next TB.
          */
-        TCGv_i32 tcg_el = tcg_const_i32(s->current_el);
-        gen_helper_rebuild_hflags_a64(cpu_env, tcg_el);
-        tcg_temp_free_i32(tcg_el);
+        gen_rebuild_hflags(s);
         /*
          * We default to ending the TB on a coprocessor register write,
          * but allow this to be suppressed by the register definition
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c745b7fc91..6b293f8279 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -351,6 +351,26 @@ void gen_set_cpsr(TCGv_i32 var, uint32_t mask)
     tcg_temp_free_i32(tmp_mask);
 }
 
+static void gen_rebuild_hflags(DisasContext *s, bool new_el)
+{
+    bool m_profile = arm_dc_feature(s, ARM_FEATURE_M);
+
+    if (new_el) {
+        if (m_profile) {
+            gen_helper_rebuild_hflags_m32_newel(cpu_env);
+        } else {
+            gen_helper_rebuild_hflags_a32_newel(cpu_env);
+        }
+    } else {
+        TCGv_i32 tcg_el = tcg_constant_i32(s->current_el);
+        if (m_profile) {
+            gen_helper_rebuild_hflags_m32(cpu_env, tcg_el);
+        } else {
+            gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
+        }
+    }
+}
+
 static void gen_exception_internal(int excp)
 {
     TCGv_i32 tcg_excp = tcg_const_i32(excp);
@@ -4885,17 +4905,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
              * A write to any coprocessor register that ends a TB
              * must rebuild the hflags for the next TB.
              */
-            TCGv_i32 tcg_el = tcg_const_i32(s->current_el);
-            if (arm_dc_feature(s, ARM_FEATURE_M)) {
-                gen_helper_rebuild_hflags_m32(cpu_env, tcg_el);
-            } else {
-                if (ri->type & ARM_CP_NEWEL) {
-                    gen_helper_rebuild_hflags_a32_newel(cpu_env);
-                } else {
-                    gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
-                }
-            }
-            tcg_temp_free_i32(tcg_el);
+            gen_rebuild_hflags(s, ri->type & ARM_CP_NEWEL);
             /*
              * We default to ending the TB on a coprocessor register write,
              * but allow this to be suppressed by the register definition
@@ -6445,7 +6455,7 @@ static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
     tcg_temp_free_i32(addr);
     tcg_temp_free_i32(reg);
     /* If we wrote to CONTROL, the EL might have changed */
-    gen_helper_rebuild_hflags_m32_newel(cpu_env);
+    gen_rebuild_hflags(s, true);
     gen_lookup_tb(s);
     return true;
 }
@@ -8897,7 +8907,7 @@ static bool trans_CPS(DisasContext *s, arg_CPS *a)
 
 static bool trans_CPS_v7m(DisasContext *s, arg_CPS_v7m *a)
 {
-    TCGv_i32 tmp, addr, el;
+    TCGv_i32 tmp, addr;
 
     if (!arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
@@ -8920,9 +8930,7 @@ static bool trans_CPS_v7m(DisasContext *s, arg_CPS_v7m *a)
         gen_helper_v7m_msr(cpu_env, addr, tmp);
         tcg_temp_free_i32(addr);
     }
-    el = tcg_const_i32(s->current_el);
-    gen_helper_rebuild_hflags_m32(cpu_env, el);
-    tcg_temp_free_i32(el);
+    gen_rebuild_hflags(s, false);
     tcg_temp_free_i32(tmp);
     gen_lookup_tb(s);
     return true;
-- 
2.25.1


