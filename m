Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CC16B2E95
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:23:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMeD-0001Vr-PA; Thu, 09 Mar 2023 15:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdl-0000Xd-9Z
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:31 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdZ-0002HK-41
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:21 -0500
Received: by mail-pg1-x529.google.com with SMTP id d8so1791288pgm.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZO9VzbHy5aZ0wcyLRUiQsptLXcCCcrZ7ORrEy0wl8E0=;
 b=S0SXP/UAhAPUanmKVdd23uKltrwxzUfanw8fuwhEiO9Rrek1ayt3WcLtlW1OgeHXmU
 HS9URe19LS0GyzPAXZ8bGIaDauz42nXdF5AFqxcwr/M0sHv2RYZs63TshcIpOmfR50Z2
 bNFwu+gz9UiLlds45aJxvcpwdyX1QfDf7XI06RrsTU+tPQ1n+D11dLOxFrvcQYRBs5es
 n2UqqyWkgyGVnFtZEt9/Was947Y6CnIOItVkJLdy8lwQ3CiUxupMTax+Z0kNjqo9a38I
 hrsf+l5KbBwgzPipX/1u8KaD1ry93MqLJri/6zJWbGLpqC2TQFnFWS2PQYJSF5m1evFf
 maIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZO9VzbHy5aZ0wcyLRUiQsptLXcCCcrZ7ORrEy0wl8E0=;
 b=4B1GdkS44/qdsfoc2YjssXKoMLx/8+V5yYEoKRwWxpWXNOVQ+TGKb+EL1Mue7dtOSc
 lFBSATlSMRIB0M5kljLsgvG10OmgzYr+ZnzAF50gBIaZbWWaNmgB2We2vZ8wnbokTBxg
 Dtasi3+iokIyhH05Qo8VjCloCo8i1yhtyPQSDQgvZKzU2Eu8P8yB1unL07ci/YPdHq1K
 lRoO3RdUeaFh3fMvo++zUhjKjACPAvr6/CffCELfjsRYHm0497zK/6Id0brDHvZM2IWO
 bUp5rAzdR2/8HCtl/rseZCVuveIYHPaW3NwrmEHuwpEcSan98otWElSSlRbBt72PcFBI
 248Q==
X-Gm-Message-State: AO0yUKWyYPIwIFy6cJmI1Av5JVJzIpyn0+xsSmvz4aQc/+o5CCAMoolA
 JgHNL6jw49L6pCwl7qzEjsF9Tf1/4MK4HyOeaJA=
X-Google-Smtp-Source: AK7set+3Vd0yN7TLVU+sUxLYyfEqhhpnQDHhtUrO06UF16xMNwVcQKfeeIviGG1ymMWlV3PbKktT/w==
X-Received: by 2002:a05:6a00:8d:b0:5a8:a82a:bd8b with SMTP id
 c13-20020a056a00008d00b005a8a82abd8bmr19933791pfj.20.1678392782945; 
 Thu, 09 Mar 2023 12:13:02 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a62a50f000000b005b02ddd852dsm11867744pfm.142.2023.03.09.12.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:13:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL v2 80/91] target/ppc: Avoid tcg_const_i64 in do_vcntmb
Date: Thu,  9 Mar 2023 12:05:39 -0800
Message-Id: <20230309200550.3878088-81-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Compute both partial results separately and accumulate
at the end, instead of accumulating in the middle.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/vmx-impl.c.inc | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 7af6d7217d..ca27c11d87 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2236,24 +2236,25 @@ static bool trans_MTVSRBMI(DisasContext *ctx, arg_DX_b *a)
 
 static bool do_vcntmb(DisasContext *ctx, arg_VX_mp *a, int vece)
 {
-    TCGv_i64 rt, vrb, mask;
-    rt = tcg_const_i64(0);
-    vrb = tcg_temp_new_i64();
+    TCGv_i64 r[2], mask;
+
+    r[0] = tcg_temp_new_i64();
+    r[1] = tcg_temp_new_i64();
     mask = tcg_constant_i64(dup_const(vece, 1ULL << ((8 << vece) - 1)));
 
     for (int i = 0; i < 2; i++) {
-        get_avr64(vrb, a->vrb, i);
+        get_avr64(r[i], a->vrb, i);
         if (a->mp) {
-            tcg_gen_and_i64(vrb, mask, vrb);
+            tcg_gen_and_i64(r[i], mask, r[i]);
         } else {
-            tcg_gen_andc_i64(vrb, mask, vrb);
+            tcg_gen_andc_i64(r[i], mask, r[i]);
         }
-        tcg_gen_ctpop_i64(vrb, vrb);
-        tcg_gen_add_i64(rt, rt, vrb);
+        tcg_gen_ctpop_i64(r[i], r[i]);
     }
 
-    tcg_gen_shli_i64(rt, rt, TARGET_LONG_BITS - 8 + vece);
-    tcg_gen_trunc_i64_tl(cpu_gpr[a->rt], rt);
+    tcg_gen_add_i64(r[0], r[0], r[1]);
+    tcg_gen_shli_i64(r[0], r[0], TARGET_LONG_BITS - 8 + vece);
+    tcg_gen_trunc_i64_tl(cpu_gpr[a->rt], r[0]);
     return true;
 }
 
-- 
2.34.1


