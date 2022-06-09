Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48695545661
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 23:16:41 +0200 (CEST)
Received: from localhost ([::1]:47918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPWC-0004bC-41
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 17:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmR-00047e-6S
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:23 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:52108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmN-0008QZ-Fj
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:22 -0400
Received: by mail-pj1-x1035.google.com with SMTP id cx11so22331417pjb.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XrwBHtaJMwMweCtn22KfTI+wKyoZs8cSGLm5AgDVmqM=;
 b=rG05RsYBVVZX4resqdsV4lWMMMoA/I6969GUg5VNcYfPayMV0AtXfIBQXQ1oYTQo+S
 P9XsKFcERVz+EgXSNN59wEeVFVlD8Z/YdJuBdxQkPg4+UbJHaT45PzOnWll++SAzbnz1
 AMey7Dg2hRtvS4EceJ+f5Yf1r5YdG1pAyzKYfqzwDj/khhbOKu5jkhnkpUZmL6n0yNZx
 /4ksd/YlmA00oo45Izr1wZDsIOdKVDP0e23DR3fgHJ503IcRBoUCssvEsYPYQEVzLMgT
 qy0hATtMMzXs4d/jNOTsGUi+VtogncXLoz8XWNIOtQxvfn4UUn6XTdRDTUU/kRkD7CJY
 yeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XrwBHtaJMwMweCtn22KfTI+wKyoZs8cSGLm5AgDVmqM=;
 b=X/NsDTg9JmPip5qqZJ3+D9PUNeupdvRvcctx+uWHRfEkCHazZpV6WAJY0ZRkVuYkKF
 TrT+MGvzYIR2dTv5D8SRKdu04OowVd68rM2HLNcpwuAQOorQ+xnusOQByrl/gsa/sQC5
 xIWb2iIterGXax1Q1Pf0xTfVRiZ8Wpwsc5F0ixGJz8XVlijzDFbYSqazWw9Lyom5NuxL
 FDxTZxplkyguL74zC7I1xhSdIwi/yvQbWn8FBVrBjgwp8AkKyscAJJPxnVe/Q7IejYFg
 R63sutrPtZCMCysdntjb1HzPjZk7T2jldmBSl0K56MfmsNt60Bx+ylzkmVsjit8k5gLu
 m8fA==
X-Gm-Message-State: AOAM533aeR6q7dn8AkoeBCzmiisN9koIQ4b53SAUWcPzG5qNVnxbWGlX
 HVOWWCqNjnNOhxznVJC9q0VZ+k5Untotzg==
X-Google-Smtp-Source: ABdhPJw7ApCQRkt73n6K6mJBKoXw5NOfnuEt65C6r2bRHwdFp7j0vrmFLGZ7eltNeWUFSJ3ynYS/qw==
X-Received: by 2002:a17:903:22d0:b0:164:ec0:178c with SMTP id
 y16-20020a17090322d000b001640ec0178cmr42012398plg.127.1654806558676; 
 Thu, 09 Jun 2022 13:29:18 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 18/23] target/arm: Introduce gen_exception_el_v
Date: Thu,  9 Jun 2022 13:28:56 -0700
Message-Id: <20220609202901.1177572-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Split out a common helper function for gen_exception_el
and gen_exception_insn_el_v.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5a48937ede..fcb6ee648b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1086,11 +1086,15 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
+static void gen_exception_el_v(int excp, uint32_t syndrome, TCGv_i32 tcg_el)
 {
     gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
-                                          tcg_constant_i32(syndrome),
-                                          tcg_constant_i32(target_el));
+                                          tcg_constant_i32(syndrome), tcg_el);
+}
+
+static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
+{
+    gen_exception_el_v(excp, syndrome, tcg_constant_i32(target_el));
 }
 
 static void gen_exception(DisasContext *s, int excp, uint32_t syndrome)
@@ -1107,8 +1111,7 @@ static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
         gen_set_condexec(s);
         gen_set_pc_im(s, pc);
     }
-    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
-                                          tcg_constant_i32(syn), tcg_el);
+    gen_exception_el_v(excp, syn, tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.34.1


