Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD00545665
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 23:20:01 +0200 (CEST)
Received: from localhost ([::1]:52204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPZQ-0007gY-Hs
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 17:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmR-00048F-DM
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:23 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmN-0008Vg-Gp
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:23 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so352588pjl.4
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkItDlBc/fej8rt3xUV6vGEsNdVvZUjvDsXBkPPMGQA=;
 b=I0CR6nhE9R69/brG+6Gi5BohVhQ2ktVzlSNVwXIaVoJv7jzCblref1KjLvAnsmXumH
 N7qljwrI06ykm2Y5eVIna4jOUWYg1d3cpwi3138hg35lC1O+hPIt6qjKVMMLjcD4lonh
 f120JpGSHJQkCCvATM0ZQkf59CG3nI9Z804BA01jG9BFNZutAvO/4af3D+xfTveHqXbH
 FzjCNMmKjgKBF0/LQyQvD1fuHPdC3aensF4LxNyqRVM+2JeczKId2YJpLLEBGMFOqhaf
 Ywp0uVbSGobSz/IotNJTgzyWqCoHQGyNA6ElwzXZAd6nfeHxaeSpgs/MFNTWxQh7sDn4
 p37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkItDlBc/fej8rt3xUV6vGEsNdVvZUjvDsXBkPPMGQA=;
 b=PAJ5O+Toxw03Aw6JYKejcTdMPpaNu/m1SOTaTnVDWYrCtLXqiq/JpP8JaCFFp4HXO1
 HDIyL2UCWbZAgyA0i9eC1Sp4z5JtREf6FZhWbQSVux3v9sbCIQMKvrUxWAcAnu7Fka/3
 8YiXlIUG79+Yn4rfAbi+4yrkqNBJAYXvnxxeeGgyLC22mPU7/OzzZZ3aQP+A4czEmd8U
 c3SR83xSQ4gG1BINFBhbRYaWQ1k8KBEQMkPRyXyY14R3jctO0C6/EQfAWZ6vIJw7URSz
 2lRg0jGj2D4z/DB8KRRWVuL42E0UldaxJV5rDwK8Ngtd8q1HLETVqTg0J2HirFcDcY6a
 onRg==
X-Gm-Message-State: AOAM532Y6aw/9Lo91eLQ4vzkI2imWKjCQDGV8EgIjDqNaTyXb5smO0dD
 S6Hr4+D0D75pzf5OJPB2KfiBmvHpLI/MOg==
X-Google-Smtp-Source: ABdhPJzpAqnVDJaoLS8xG5ab80KIbxB9kjB1QSHCj8Npbdv/WumGO4SYhJQpEEo584toCxK5H5WItQ==
X-Received: by 2002:a17:902:d509:b0:167:6ed8:af9e with SMTP id
 b9-20020a170902d50900b001676ed8af9emr25901469plg.140.1654806556998; 
 Thu, 09 Jun 2022 13:29:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 16/23] target/arm: Rename gen_exception to gen_exception_el
Date: Thu,  9 Jun 2022 13:28:54 -0700
Message-Id: <20220609202901.1177572-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


