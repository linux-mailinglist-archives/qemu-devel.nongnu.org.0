Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75851596433
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 23:07:28 +0200 (CEST)
Received: from localhost ([::1]:54900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3mZ-00062p-89
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 17:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3HL-0005NO-ON
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:35:13 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:47094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3HG-0004U1-4e
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:35:10 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1168e046c85so12929308fac.13
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=sptqSn2q1MUxoiSJ0oXgREmv1FSN9FwBedSu534JEYA=;
 b=QJkm7u5yuz/Z3unkMZbM3/+58u7EYXgzO/R1zTUHQVD7fBWD2VKZkmgRlxk77QZoCA
 mppM16SqURfNvT+8ekV35LGKQ6+FMqE8xKUt3SZs1eVDrI5m4AajVUi1jPA5ZQs9yxTD
 iI1Uc/rn28pme70vOvBbG0gOE11X2oxJQjTZ0nH8tSKdGfjrA9MpxFv7A+TkCrkt5TT+
 qgdJcoWMu0Yt75OemSxqNI55Af0v8+hv9cxwZd9LogmD1RvLJAkENjzU3C4D3ghHgOgT
 cvBFPL82PVbyMFvqQ24SZXfCtq8P3aXc+9il7H0iUTXtvYEK5/v18rv+I8VnH8v54ow7
 oe+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=sptqSn2q1MUxoiSJ0oXgREmv1FSN9FwBedSu534JEYA=;
 b=FWgeARLASGAWypMjKLwApco4VUwT52t0b6Kz4/UvL9tHlPoUOL8G9vaQmu4fwxrYBq
 XiJmyOV7c/MPNnS3IoLBILDT6Z4MdEgQ1MqSM/bit1ULseq5+JOxwDgQGSSzu7ZVbKD7
 GYRKy19bfc9i0CUDIHNET/RXJL6WQ2R3YqRLHYx0+wcZXOopRCQUkAhy6g5yHKohDsrq
 L3jcs62xldCTdC246VRU3DAUSvo0LxaTC0aHchJAlRPVegyYTRJMJFFGaDUi3pXfgxfK
 AbiGoAXXgvPqLlEM+AY143qSd4VF0Dvv50d0n8q+sZk72ej7CdI0nm01w4Lo1RIUbD5w
 s1zQ==
X-Gm-Message-State: ACgBeo0dxJ0GOjHQZtpqloGWbSvXsGlOFpbTlHE42tpMxoMVGZ4GO346
 91h8Vdeecsj0rXvrzanDzpgw0GY9MQb+9w==
X-Google-Smtp-Source: AA6agR6bjv33hZ0/vVhxE52+Firfvq/XvzgyksC1HZKgwTCfR+ZObduGr4BA99kW/LoZHZ4gM91r3Q==
X-Received: by 2002:a05:6870:ea9d:b0:112:cf7c:d06d with SMTP id
 s29-20020a056870ea9d00b00112cf7cd06dmr137244oap.295.1660682104404; 
 Tue, 16 Aug 2022 13:35:04 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:35:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 29/33] target/arm: Change gen_exception_internal to work on
 displacements
Date: Tue, 16 Aug 2022 15:33:56 -0500
Message-Id: <20220816203400.161187-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c |  6 +++---
 target/arm/translate.c     | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 422ce9288d..b777742643 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -340,9 +340,9 @@ static void gen_exception_internal(int excp)
     gen_helper_exception_internal(cpu_env, tcg_constant_i32(excp));
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int pc_diff, int excp)
 {
-    gen_a64_update_pc(s, pc - s->pc_curr);
+    gen_a64_update_pc(s, pc_diff);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -2229,7 +2229,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
                 break;
             }
 #endif
-            gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+            gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
         } else {
             unallocated_encoding(s);
         }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d441e31d3a..63a41ed438 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1078,10 +1078,10 @@ static inline void gen_smc(DisasContext *s)
     s->base.is_jmp = DISAS_SMC;
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int pc_diff, int excp)
 {
     gen_set_condexec(s);
-    gen_update_pc(s, pc - s->pc_curr);
+    gen_update_pc(s, pc_diff);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1175,7 +1175,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
         s->current_el != 0 &&
 #endif
         (imm == (s->thumb ? 0x3c : 0xf000))) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
         return;
     }
 
@@ -6565,7 +6565,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
         !IS_USER(s) &&
 #endif
         (a->imm == 0xab)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
     } else {
         gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
     }
@@ -8773,7 +8773,7 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
         !IS_USER(s) &&
 #endif
         (a->imm == semihost_imm)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
     } else {
         gen_update_pc(s, curr_insn_len(s));
         s->svc_imm = a->imm;
-- 
2.34.1


