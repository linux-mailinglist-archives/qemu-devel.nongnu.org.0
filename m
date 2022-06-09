Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D3D54566D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 23:22:45 +0200 (CEST)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPc4-0003ia-3s
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 17:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmS-0004Ah-Hp
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:24 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmO-0008Vu-7O
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:24 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so405327pjo.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IeebmSLreQJnSlKwobDxcpS2nsd5xpcDMdcYwPgpEJM=;
 b=whqkkro9cftREiAC8Mq2sut0YAw+cByAvKnVSeXwIx8imYxatRY0e3/HVk7Zz4Ypyc
 4eCgEC9rwzBDfj9cjqPRaAadq+rI+7a7CHelTgzcz7K4z8wD17/VAZIxzUjxTi4xLugq
 f+bLx1Mr0yIf+diyj61NtgYsHer8Ay/dExFFxh62+ZaVk94BCjHmFRek80oA+Sdpmbq0
 toYIgttzt1vg5J60kXwoTjLX4q9v2FUt4E6O3Nf+4fpSIITmJN60+H9W1TSlPrqN8bRe
 GgIzZfGBJ5s9OypYD0fmaWYVegTaGFVNhR4hY4upkt1OxgBNBWb1ACo+UE3yTY6kerTN
 o7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IeebmSLreQJnSlKwobDxcpS2nsd5xpcDMdcYwPgpEJM=;
 b=edd5s7hIzb5cRLIzpF1OgKiXZyTZFp62zsEbDFrgbF8KoSpgy50jpAib2w8D9/N0YY
 TvemS9lDC1+X+0go2iTH1ACgCdIMbUD+6Mk8GhTEEbFBwKKvt5KT3yHyxvrVX0xOQPD1
 JdSDGzqeGOoxQYtJIOK3Q5qiAYrDq1GM1AytOX5J4FwHJN8asNxhpukTfFxGTq7zVQ1E
 PohNegu9XyqvpYiiwWrwb29Fy4vYJzoKDVS/ROGWwI3zgGipgEbANnvRFRNHTlhUkc9Z
 5vSt5FcqFbuoo4TYLjWu6ZpKRJ7IVSuD4VejMNY0RoXxrg43RWdo/I9/CXuSnqEiN/VJ
 7J1A==
X-Gm-Message-State: AOAM531HvUkUtiTNSVIBFDgy0RFT/z/gWoF7NKIcAXVT40ahsvnvfmWY
 B5PxdHKi0c1p+/lU1UHBcvmE99BpAKgTLA==
X-Google-Smtp-Source: ABdhPJyxO/omPJgSMjIZY47Jh+y8wvEdMFyjL96fYt4DnRlCqNsLlNyAPSt11Q+qht7YDgTDTzUs2Q==
X-Received: by 2002:a17:902:dac3:b0:164:13b2:4914 with SMTP id
 q3-20020a170902dac300b0016413b24914mr41271421plx.135.1654806557881; 
 Thu, 09 Jun 2022 13:29:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 17/23] target/arm: Introduce gen_exception
Date: Thu,  9 Jun 2022 13:28:55 -0700
Message-Id: <20220609202901.1177572-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
exception target to gen_exception_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index edb7d3f394..5a48937ede 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1093,6 +1093,11 @@ static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
                                           tcg_constant_i32(target_el));
 }
 
+static void gen_exception(DisasContext *s, int excp, uint32_t syndrome)
+{
+    gen_exception_el(excp, syndrome, default_exception_el(s));
+}
+
 static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
                                     uint32_t syn, TCGv_i32 tcg_el)
 {
@@ -9758,8 +9763,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_SWI:
             gen_ss_advance(dc);
-            gen_exception_el(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
-                             default_exception_el(dc));
+            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_ss_advance(dc);
@@ -9828,8 +9832,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_SWI:
-            gen_exception_el(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
-                             default_exception_el(dc));
+            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_exception_el(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
-- 
2.34.1


