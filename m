Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD13E6F6972
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:04:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puWk0-0004zT-6r; Thu, 04 May 2023 07:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1puWjK-0004tq-FE
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:02:36 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1puWim-0002xP-3C
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:02:03 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3062c1e7df8so201995f8f.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 04:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1683198112; x=1685790112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UeyzLGvhwf+0zSoJoIX/SLBR3YlVINWW4YP2V7vzC5c=;
 b=byPFTuI/krhnLah5Zx5tkiandDKxEsGKOHycdsGxFtwxhyGSVp7pxOSpjZGQysQHR9
 2pO4VocEGYm3dJz/wpdVXpVAinly6VEXa1XbCZXaHDl/xniwC4eXsQgj3xttUEZ/pcDX
 wocSqZw72t0v/dgVswsrS1j6gz5Ge1G8bkSCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683198112; x=1685790112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UeyzLGvhwf+0zSoJoIX/SLBR3YlVINWW4YP2V7vzC5c=;
 b=GjCZyfDaDEOtYCSPMWXebRnxnWu1J0S3cIoG//XACRAPVVHQBk8niouvcQ1vm5J2L+
 wescbOnCjTlrKp7myQ/tKlrmEi6MVpxRjY+BXpdaFvMbGNi10VEx6bcXns+zVUL4tkmQ
 jfgWp3GthjHrUFU00jXnzty0HiHgfwfxr5hNIHxjB3wVmCOJvypvBNx+S6OVm3U2zx5f
 eJz9LvSxKdLdwu4dKeL/30gujIbtur1F32t6uABTnzWL+Hv07x+ZtOhs1e9MCz1B35Pk
 j/4hXAhD82q8JCmIz5RBfH/6lc3hM5H7ObxtBeXTJXEpiNIhFm8dYqjZE02qhwkjlshr
 Dw9w==
X-Gm-Message-State: AC+VfDzGfMy/7iVB+U4/Vw43JTKfGpPnQdxmT7Mr7enSMwZOVrjsEw1/
 NBJVjpJjafbSKO/4Wy+zCkmwTWTPiBVmv84x+Zw=
X-Google-Smtp-Source: ACHHUZ4LuPMBUJDZ6sKp6yede+16wlD34GazclMqTjJrORiP+7RlkA18zNleFcCOCqpWM7MYMvpmrw==
X-Received: by 2002:adf:ed42:0:b0:2f9:4fe9:74de with SMTP id
 u2-20020adfed42000000b002f94fe974demr2384678wro.16.1683198112076; 
 Thu, 04 May 2023 04:01:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6749:5fda:5dc0:e535])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a05600c21d000b003f318be9442sm4645582wmj.40.2023.05.04.04.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:01:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH] target/ppc: Fix fallback to MFSS for MFFSCRN, MFFSCRNI,
 MFFSCE and MFFSL
Date: Thu,  4 May 2023 12:01:50 +0100
Message-Id: <20230504110150.3044402-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.purdie@linuxfoundation.org;
 helo=mail-wr1-x432.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following commits changed the code such that these instructions became invalid
on pre 3.0 ISAs:

  bf8adfd88b547680aa857c46098f3a1e94373160 - target/ppc: Move mffscrn[i] to decodetree
  394c2e2fda70da722f20fb60412d6c0ca4bfaa03 - target/ppc: Move mffsce to decodetree
  3e5bce70efe6bd1f684efbb21fd2a316cbf0657e - target/ppc: Move mffsl to decodetree

The hardware will handle them as a MFFS instruction as the code did previously.
Restore that behaviour. This means applications that were segfaulting under qemu
when encountering these instructions now operate correctly. The instruction
is used in glibc libm functions for example.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 target/ppc/translate/fp-impl.c.inc | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 57d8437851..cb86381c3f 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -584,7 +584,10 @@ static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
 {
     TCGv_i64 fpscr;
 
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
+        return trans_MFFS(ctx, a);
+    }
+
     REQUIRE_FPU(ctx);
 
     gen_reset_fpstatus();
@@ -597,7 +600,10 @@ static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
 {
     TCGv_i64 t1, fpscr;
 
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
+        return trans_MFFS(ctx, a);
+    }
+
     REQUIRE_FPU(ctx);
 
     t1 = tcg_temp_new_i64();
@@ -631,7 +637,10 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
 {
     TCGv_i64 t1, fpscr;
 
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
+        return trans_MFFS(ctx, a);
+    }
+
     REQUIRE_FPU(ctx);
 
     t1 = tcg_temp_new_i64();
@@ -661,7 +670,10 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
 
 static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
 {
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
+        return trans_MFFS(ctx, a);
+    }
+
     REQUIRE_FPU(ctx);
 
     gen_reset_fpstatus();


