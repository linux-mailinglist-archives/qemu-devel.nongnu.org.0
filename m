Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43AD53F440
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 05:01:26 +0200 (CEST)
Received: from localhost ([::1]:59090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPTB-0005hC-SE
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 23:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG6-0007Ar-O2
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:54 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG3-0000Gj-6I
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:54 -0400
Received: by mail-pg1-x52c.google.com with SMTP id e66so14528830pgc.8
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hm5AJJ9rtEtZQmXdNnCESF6lpmFEuqmd0isJFAw5U8U=;
 b=MVRno+eqO4SRy4l0C6F0k4YFvNPNBKAM+OKGYSC5g6gg5W1m4DVSXTxX9AvUQFpxoS
 eVjCLEMQk28m/Z5xgFkjeFeLEbrh87ZT+PbM0f9Yq84GOdEduveCfRK591kUGJJu5vU8
 VyNvReASNbxpB4PTEdKTbxhb1iG1k3KBco/itnzySI4zNpjylODZHTKaOc6JWOgRVW5r
 Ii6qQ1+sIxo1S+vjZRv9hl3kdiogg/AMBB6bv/rvWWYInJyGt1cjL6+LL6x5FGBUrr8c
 xykpdQXwvnprbTPsLxiBpoZ522Me7QMbWKd28Wtki2Y2gBXfq3hEmDUmPVcb4K1dZk2M
 WFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hm5AJJ9rtEtZQmXdNnCESF6lpmFEuqmd0isJFAw5U8U=;
 b=Dg1enLLKJ62up908KFXW7NxMiNkRAbtzFnfRBuGWphWA67KIr41fyEHl/cux7x3iNT
 Prd3wQ20cBzZM3DoDlaYWyEUcRHIWeWXlK2VZmdJM1qnXLgQEjTvwWxtN6fm8iQGDQES
 YyU9pemDXPmireG7lS8YvbNBaauz48cvF69YEq9Dj+tJkCZXYMgvHk1P2NlTPTRsh0wq
 yr7pEopssQPpRWIokfqt38jcskPCGm6zKzYGiyRNMAj3ec+vAzCIX4FJWITHXZBRYqsP
 cJdgWSYQ2jnRdpycmpjNFXqAaOuxawGaJRyHvWoBhkewlTpf1TSmymBiAyZS5lHQZZua
 TMuQ==
X-Gm-Message-State: AOAM533aRzO6Z70cuvpYRNaJ9EVtq2ScW8JKn6vKoNWP/0lAeN1SoM8A
 arc8jGtLSKHcMp5T4DJQpnnjZUY1JKSyqg==
X-Google-Smtp-Source: ABdhPJyPodWX7XxznhRyPRFeJ9BfEnAv88uR+na13ewS6U6S4jlfcRBNceuayyxy1iivGmOmdJcCqQ==
X-Received: by 2002:a05:6a00:88f:b0:510:7a49:b72f with SMTP id
 q15-20020a056a00088f00b005107a49b72fmr27102115pfj.21.1654570070368; 
 Mon, 06 Jun 2022 19:47:50 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 17/25] target/arm: Rename gen_exception to gen_exception_el
Date: Mon,  6 Jun 2022 19:47:26 -0700
Message-Id: <20220607024734.541321-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fc5eafaeeb..edb7d3f394 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1086,7 +1086,7 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception(int excp, uint32_t syndrome, uint32_t target_el)
+static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
 {
     gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
                                           tcg_constant_i32(syndrome),
@@ -9758,16 +9758,16 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_SWI:
             gen_ss_advance(dc);
-            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
-                          default_exception_el(dc));
+            gen_exception_el(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
+                             default_exception_el(dc));
             break;
         case DISAS_HVC:
             gen_ss_advance(dc);
-            gen_exception(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
+            gen_exception_el(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
             break;
         case DISAS_SMC:
             gen_ss_advance(dc);
-            gen_exception(EXCP_SMC, syn_aa32_smc(), 3);
+            gen_exception_el(EXCP_SMC, syn_aa32_smc(), 3);
             break;
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
@@ -9828,14 +9828,14 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_SWI:
-            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
-                          default_exception_el(dc));
+            gen_exception_el(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
+                             default_exception_el(dc));
             break;
         case DISAS_HVC:
-            gen_exception(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
+            gen_exception_el(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
             break;
         case DISAS_SMC:
-            gen_exception(EXCP_SMC, syn_aa32_smc(), 3);
+            gen_exception_el(EXCP_SMC, syn_aa32_smc(), 3);
             break;
         }
     }
-- 
2.34.1


