Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E7B50A49E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:46:49 +0200 (CEST)
Received: from localhost ([::1]:60434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZ17-0002ud-0Q
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZH-0007Fo-4c
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:03 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZF-0006Fv-8i
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:02 -0400
Received: by mail-pf1-x435.google.com with SMTP id i24so5287820pfa.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pJcfgBv/PjlYWoRNQ2pxyLVSHhOLb8Gq0Wnr1KLfa4I=;
 b=QCDofGzd9oJTpdsx/7yuoXMGHjI61CcHmh9Nl8ayldtNyobVeFVOUhN5tbeXxzrDn6
 cxejSdVF79EWDc83GtMlS2LXe579stevfjDgg9m1TeqoF+mQuTj1Q0SizaFtlpQAkVOP
 ygPzng24/pjdRCvW6Fuar6Ub2zELHt9y5AdV83uMAMLS7TXSzbkt9WpL1sd6LSzgkcwU
 OnrxJqJmB26hUS4PQt0V11L2vnCXuriDdb/AaCper5EhK7aNE/v2Gxwn4iZ5tYvxd0q/
 iT1x74b73jrGaMs4w2y8RIwiMzz63KzbIYlPuy5HULu4RcNODt7E/GQB4IENSchd5bex
 LrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pJcfgBv/PjlYWoRNQ2pxyLVSHhOLb8Gq0Wnr1KLfa4I=;
 b=63EqRDf5pD4xlrVbRylphyfDfhC3wGdNPlrxNLU5iU3dRcHEEulCRGLfGeqTxrfUDo
 u9auaCWpfpXein4iPnDvtwhgvlPGlSWzXg+DvGvUggBvKV6lq7w9qnslt0aEBpRUYAvh
 7CVYhkSxI3VuDxpFhnvZQFydq/LaEaJ5WbBmRsGF+h+ZhA7r+7oIUi4GWE1jP0mG6oV4
 mgqXaJJEP6gjWmZsrb2mpFauGZc+vb+uVGj6N6/XwyHrorf4jdpkxTaUrpJ+aw8cJyxp
 ezeEDQxDQLfxHoVNwcoO00u1JjLRciXk9M/+qLL39XnrBDriQFTjPO3SI+BgJwlLQuHK
 ZMvg==
X-Gm-Message-State: AOAM532LJwuwwFlEhtUfUYJKbRal+6NTf+IFKs/h66ycL3X4gWExWDbU
 nsM7ycRYKmUjpR716MZQfDYk5CpuRATUXw==
X-Google-Smtp-Source: ABdhPJx6sGkUQ7bq7QP741LiP1m2QR1EdUTpvJZ5w8x+BIyDif3LH9MoK/ATMmb4qdTlCD/bd0ighQ==
X-Received: by 2002:a63:d758:0:b0:380:fba9:f6e5 with SMTP id
 w24-20020a63d758000000b00380fba9f6e5mr24288359pgi.330.1650554279945; 
 Thu, 21 Apr 2022 08:17:59 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:17:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 14/64] target/nios2: Stop generating code if
 gen_check_supervisor fails
Date: Thu, 21 Apr 2022 08:16:45 -0700
Message-Id: <20220421151735.31996-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Whether the cpu is in user-mode or not is something that we
know at translation-time.  We do not need to generate code
after having raised an exception.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index eb97e13feb..d61e349207 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -169,12 +169,14 @@ static void gen_excp(DisasContext *dc, uint32_t code, uint32_t flags)
     t_gen_helper_raise_exception(dc, flags);
 }
 
-static void gen_check_supervisor(DisasContext *dc)
+static bool gen_check_supervisor(DisasContext *dc)
 {
     if (dc->base.tb->flags & CR_STATUS_U) {
         /* CPU in user mode, privileged instruction called, stop. */
         t_gen_helper_raise_exception(dc, EXCP_SUPERI);
+        return false;
     }
+    return true;
 }
 
 /*
@@ -384,7 +386,9 @@ static const Nios2Instruction i_type_instructions[] = {
  */
 static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    gen_check_supervisor(dc);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
     tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
     tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
@@ -447,7 +451,9 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    gen_check_supervisor(dc);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
     if (unlikely(instr.c == R_ZERO)) {
         return;
@@ -474,9 +480,13 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 /* ctlN <- rA */
 static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    gen_check_supervisor(dc);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
     R_TYPE(instr, code);
     TCGv v = load_gpr(dc, instr.a);
 
-- 
2.34.1


