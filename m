Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8632546A4E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:23:17 +0200 (CEST)
Received: from localhost ([::1]:34784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhPo-0000cz-Tu
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB2-0007jH-3y
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:03 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB0-0007HD-KI
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:59 -0400
Received: by mail-wr1-x42f.google.com with SMTP id o8so9301307wro.3
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=63FUY/1rPI2w2M+FyPcYxzAypKtt0CQvZF/yULrCHLA=;
 b=Vd09zWVaAm4MW3rlhWX8b102yLl+95fkA4Xuc4NxH0SjOxPk9oVbNbo2Yc+YqcJox/
 sFURR1ui4NmaH8UwRHqN1stdniE6YU/eqTn2igzVlgQAMtrSJiDDAX17XB+27/e99pOb
 ywy9kaH4nIfdxbwbf2LplH64mN1zYlJpN9n3icVRhHr7OASpfMKSoi+GX5GI3WsVKZrv
 Mh8mJ4jkxaKR0+SBjAJ0L+LsEKdE4q3kdL8QT357A+YlXA5RwUDouBbidchWSPwHfiYu
 LBzGiQPaeXVhHYdfum4jLKNtr2pWc833Jh38JowDGyCvqTLD+OD6pGpcMuEvGxlGThvi
 n5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=63FUY/1rPI2w2M+FyPcYxzAypKtt0CQvZF/yULrCHLA=;
 b=fXFq8Xm0FNTVu9do1oJrnWbfVSn9iRfqSQKZjPS/xzCVtZHjUF2tLovLisst4fNWlR
 X8saFQYy7a/Gw5JIDcPqzd5tPRCeQmcPopMMEIP2BRcJhcaJ1yyKd56tzywYn2rGhB7z
 96s46Ws6G0DdPxU5csCSRz4EG/AfY/nAmLdhXIrI9ypyLDG/OAuVZ5cjb3ujHHPEJl8T
 lG6lmpo+6sC64M1x9J0WnfMSpJ6k94glBMEh3OpAKxluiaH/eipBlz6njgWSm5sewdTu
 1291IfmczYjBiVmVzxbQ5AClbRsuc8ofCLtujAzCx58ghTYCQxFr9zwvE/xooOtlIJxM
 o0mA==
X-Gm-Message-State: AOAM5316TjybppbsRSiYvEUnmot31hTmdIAJPhGdCFUnacLCWVr8ToAV
 WyR2xTAa/5a0A5c6qsVESb1xABMeHRqJNw==
X-Google-Smtp-Source: ABdhPJxSfW0/lpWoHTESu/Hmaj4cMBByvv08REp+F1xLVjdWQGQzTQwPipRjdpHbNbvNDsCW9y+iwg==
X-Received: by 2002:a5d:47a8:0:b0:217:b5ea:bdfb with SMTP id
 8-20020a5d47a8000000b00217b5eabdfbmr30558207wrb.492.1654877276573; 
 Fri, 10 Jun 2022 09:07:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/28] target/arm: Introduce gen_exception_el_v
Date: Fri, 10 Jun 2022 17:07:28 +0100
Message-Id: <20220610160738.2230762-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Split out a common helper function for gen_exception_el
and gen_exception_insn_el_v.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-19-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5a48937eded..fcb6ee648b5 100644
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
2.25.1


