Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F606F50DB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:12:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6bO-00020P-9V; Wed, 03 May 2023 03:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ah-000836-LB
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:55 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aA-0005nr-Hh
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:55 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so47412355e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097640; x=1685689640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YyONh+q6+JPHpqSgz1eedz8qFY8evuyzGRq8DlknugQ=;
 b=eifodROGaa0Bfuhjwal6HwptkmXiePiHlatVwhte2HnZkZxsMBg1HBzDd5MRjcGkOj
 qu+218ldrcNI+iRVB8Wyz2dMbZYitSEzgpXTzIcFGGrre2824oRMOCvvXsepG1yC31lH
 Hl++jWNsCShHsKk24eOISDX1Iz13VbN6YwIIgDBwmznV/UDnIsuJeqC4mJU9Ti4hDmt6
 lGDGp3rUaDa/IiH/L5y6GhAPT6FfgaGs9aZ6SJlmnRs3yRko2Tm5kPKGHluh8r2jaVOo
 iX4a7S/JxxBNkCbA7viIsdeonJj6vYoWozXtgMJrQ6xnEiMKGzequExKnaWeL5ZtaZYL
 Ualg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097640; x=1685689640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YyONh+q6+JPHpqSgz1eedz8qFY8evuyzGRq8DlknugQ=;
 b=hkVcCFncoUfvV5XY+J8d3Wvj9wIcWQCog9B1N33EYp5HQprODiD6U8mK4HWz0tvL2E
 24RP6O+6qiRZ2YG+jhNTHfDiOgWAIWQi5WVP+PM18T6TICGMeSuQlbUScsyZmvs/CqMl
 Ta8jyLYA8olIh2oB8hggnizgMbhL2uKd2QM5scZSzrfZbzLdC5BQhbNdvtSeyjO7k38o
 4+F2oin6Dpele4+O+1AXBHuddTsnL8C8gUluuHKRx88FYwi45KbsraHDq+JhyTtTi3dw
 F8AD9FA0bapRH/kBTSrgY8U9angca4KN2tkfSmUAUHmcQWXaxk2Bb5LQdcrav0Qg4mub
 cZTw==
X-Gm-Message-State: AC+VfDzX02afeY5acObmGp5UaJCUfBDFp9bb65yNNlVuxleZoGzCtOv0
 H7rbqCHXPxwtF3hjtIVJo/kTfLRYuh+pxTl/rip07g==
X-Google-Smtp-Source: ACHHUZ5Guv9QYtmGol8HcDPL0k/slTF50wEbOyljn2jDf8EvGxMGbZgV+B9VHFrMvB53a2yio2PCNg==
X-Received: by 2002:a1c:7317:0:b0:3f0:46ca:f201 with SMTP id
 d23-20020a1c7317000000b003f046caf201mr13847663wmb.1.1683097640102; 
 Wed, 03 May 2023 00:07:20 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 30/57] tcg/sparc64: Allocate %g2 as a third temporary
Date: Wed,  3 May 2023 08:06:29 +0100
Message-Id: <20230503070656.1746170-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index e997db2645..64464ab363 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -83,9 +83,10 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
 #define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 
-/* Define some temporary registers.  T2 is used for constant generation.  */
+/* Define some temporary registers.  T3 is used for constant generation.  */
 #define TCG_REG_T1  TCG_REG_G1
-#define TCG_REG_T2  TCG_REG_O7
+#define TCG_REG_T2  TCG_REG_G2
+#define TCG_REG_T3  TCG_REG_O7
 
 #ifndef CONFIG_SOFTMMU
 # define TCG_GUEST_BASE_REG TCG_REG_I5
@@ -110,7 +111,6 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_I4,
     TCG_REG_I5,
 
-    TCG_REG_G2,
     TCG_REG_G3,
     TCG_REG_G4,
     TCG_REG_G5,
@@ -492,8 +492,8 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg)
 {
-    tcg_debug_assert(ret != TCG_REG_T2);
-    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
+    tcg_debug_assert(ret != TCG_REG_T3);
+    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T3);
 }
 
 static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
@@ -885,10 +885,8 @@ static void tcg_out_jmpl_const(TCGContext *s, const tcg_insn_unit *dest,
 {
     uintptr_t desti = (uintptr_t)dest;
 
-    /* Be careful not to clobber %o7 for a tail call. */
     tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_REG_T1,
-                     desti & ~0xfff, in_prologue,
-                     tail_call ? TCG_REG_G2 : TCG_REG_O7);
+                     desti & ~0xfff, in_prologue, TCG_REG_T2);
     tcg_out_arithi(s, tail_call ? TCG_REG_G0 : TCG_REG_O7,
                    TCG_REG_T1, desti & 0xfff, JMPL);
 }
@@ -1856,6 +1854,7 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_O6); /* stack pointer */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_T1); /* for internal use */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_T2); /* for internal use */
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_T3); /* for internal use */
 }
 
 #define ELF_HOST_MACHINE  EM_SPARCV9
-- 
2.34.1


