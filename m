Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66840513792
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:59:43 +0200 (CEST)
Received: from localhost ([::1]:53778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5cM-0002DM-Gp
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ju-0005ZJ-T4
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:40 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jn-0006Nj-3F
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso5452206wma.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=y0kwJP/iPVdJaEA344sDAv/Ij9ceNJt/PMRKXBvbIvI=;
 b=C/OaKhnO3RAvbLN2ux3DnqfItdvngP8wjqWMwFiJvB1k+O6ZQWG5bDaEmKUAJVimVZ
 Z5juux2ZK6ve+jmPQb0+fmk1rGGfl/qX92pJAJ8TP9ihAD+dvBBlQvK21+U5ajMVH2ef
 Qfnus8K1JbpTuY+b1Efd3XW4c9lCAqd9/TMDla3Tmz+qmytNs/T67LqTKy8NWGNWBcWh
 3HimZG+S+oi/U7byT8N4dArcPRvwb4oGmhv1g0O02rn0towquTmo3YItlD+OWVo7XHPq
 Nm7G46fe239zoeM14VZ6pxro6q0w3uHgx2Ftu19JUbpNvChMw3Ew6MhMdvEbzh2ufioR
 WhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y0kwJP/iPVdJaEA344sDAv/Ij9ceNJt/PMRKXBvbIvI=;
 b=y2xrLAzAAWeHUAo26uOHNg3vgf21l2m2RLX/yl84yxPxNE09xylQXYy/X+oiiGQa1b
 KV+gKqVMMSnuBPSt/y6XjOMGgohdl/5sjmFS3WfjPdIQsLBp2KzkYfRgpoB49cLiXdzv
 IQgt2+6Spe98QcT0O8WAHRJFqE7zn18wEIkcFcRZMsRGedCj7AoXmn1sjYlxc00QADKA
 cvzbap+xxkTIXjGmeo6Ql0MBj/cLWR2O8hF8lRrC7puYamcgqZan3rdWIYsPBxbai3KF
 lSjG6GooqrcCWynQQQmp1ojDHMEMsfphh4lVwrc7S2cW99X3QbxjT/T9Soyj67Jck+yA
 TYNw==
X-Gm-Message-State: AOAM531vs7CncmBUagKXdPaorYfPqdxNeRuX7Y6sN91SBtKtvTsRYH3F
 rP8WvchygzqQXhCRZYw/4yaNoIHUweSx2g==
X-Google-Smtp-Source: ABdhPJxn1xBmUzUz1dHgetUl0oSQxPafLRnKSLp5FEvFv/OxxotHXB2gsUIkGyWrnRLPHqKGT/iOCA==
X-Received: by 2002:a05:600c:3b97:b0:393:e653:61d4 with SMTP id
 n23-20020a05600c3b9700b00393e65361d4mr24502149wms.64.1651156829610; 
 Thu, 28 Apr 2022 07:40:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/54] target/arm: Use tcg_constant for op_s_{rri,rxi}_rot
Date: Thu, 28 Apr 2022 15:39:32 +0100
Message-Id: <20220428143958.2451229-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-29-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8476f259fcc..223fd5fdfe7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5495,18 +5495,16 @@ static bool op_s_rri_rot(DisasContext *s, arg_s_rri_rot *a,
                          void (*gen)(TCGv_i32, TCGv_i32, TCGv_i32),
                          int logic_cc, StoreRegKind kind)
 {
-    TCGv_i32 tmp1, tmp2;
+    TCGv_i32 tmp1;
     uint32_t imm;
 
     imm = ror32(a->imm, a->rot);
     if (logic_cc && a->rot) {
         tcg_gen_movi_i32(cpu_CF, imm >> 31);
     }
-    tmp2 = tcg_const_i32(imm);
     tmp1 = load_reg(s, a->rn);
 
-    gen(tmp1, tmp1, tmp2);
-    tcg_temp_free_i32(tmp2);
+    gen(tmp1, tmp1, tcg_constant_i32(imm));
 
     if (logic_cc) {
         gen_logic_CC(tmp1);
@@ -5525,9 +5523,10 @@ static bool op_s_rxi_rot(DisasContext *s, arg_s_rri_rot *a,
     if (logic_cc && a->rot) {
         tcg_gen_movi_i32(cpu_CF, imm >> 31);
     }
-    tmp = tcg_const_i32(imm);
 
-    gen(tmp, tmp);
+    tmp = tcg_temp_new_i32();
+    gen(tmp, tcg_constant_i32(imm));
+
     if (logic_cc) {
         gen_logic_CC(tmp);
     }
-- 
2.25.1


