Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B47C364B34
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:36:53 +0200 (CEST)
Received: from localhost ([::1]:54200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYadY-0002xK-EN
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQZ-0007MO-Td
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:27 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:46699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQX-0002Z9-Ek
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:27 -0400
Received: by mail-qk1-x732.google.com with SMTP id v7so9116528qkj.13
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NvWPQV4xvO1L8h7zcVc9dinU9c9HeGRd57GCvcd1vwA=;
 b=SuvKMXzJEh4gZcsyjNBDoX939oulss6EdCuEtHTf3bNma455ARcV7bwPoR2sazjZMK
 YYZYjjsjcIzrFCldRpDt70l2TX+IllIVia4o7uwf8RWFY3miO2O7YVf9obxgc9s6NJtR
 bV7ewDF1XADLWacs7W/VfPtZ4vQjaA0C6v3C+wsIZphj2BunHfXpgWZTtAP6t5FRdrJr
 QFy7Gc5yR7H/x6oFEQDr80Lvu8WBnpDf0Y2WqOgEqqG1WL0A6F/OA4IxyqcEHHv+tEjt
 mnQnxS9C/vyBIrjN+ZgXWFRoKKW23CnN4Gwd9TatCYPtRiEmY+Ncq4NbTC0DLVLlGAF4
 0qQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NvWPQV4xvO1L8h7zcVc9dinU9c9HeGRd57GCvcd1vwA=;
 b=QdiENXSWpwOuG5oWDATGIp4Q3QJz2NMjBMX/5EwQv3d44fVtklxm/zrjAKoxA1Z5Pq
 HGPOjhZ8Yd1s7o/6uCFITeg2M1d4j4aPIZWriacGs05a97M0oehykXPVL5pqzOm9/aac
 XayxzRMaH18XbOOI0Lrlk/ZVqnfEuXghMRswG/dAVOLFAShS8rbLTZVDstvWwHAj/NBa
 bz8HIun4AcJLEAwYXUSYtXogkWSDBkhHBTpi4RRIaYLu1nBWSHuTg7UqP20bQSHOt6Pw
 ygDlOgb3s0HVzJ0igq3Q7L9+uDxthVQFXsL6Vr95dHjODqHLUymd8vzbP1pgVQ1qQ1kF
 kPrw==
X-Gm-Message-State: AOAM531BOPo+sa/3kRB0BKxDaSwNKIVxTTG49tTb+6IdkWECJ53v0dn6
 AqbN0jdUF/0qohgYYK1yTV00HXyulrmipOul
X-Google-Smtp-Source: ABdhPJwbxYrEvAlpYW/dhIb4VQ/Lw9kf/FNszrVdrbtNSZm2brbxL2FZqWohkzl/uttFnP9HpdrEAA==
X-Received: by 2002:a05:620a:66a:: with SMTP id
 a10mr8863074qkh.272.1618863804616; 
 Mon, 19 Apr 2021 13:23:24 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/31] target/arm: Fix SCTLR_B test for TCGv_i64 load/store
Date: Mon, 19 Apr 2021 13:22:39 -0700
Message-Id: <20210419202257.161730-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just because operating on a TCGv_i64 temporary does not
mean that we're performing a 64-bit operation.  Restrict
the frobbing to actual 64-bit operations.

This bug is not currently visible because all current
users of these two functions always pass MO_64.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b47a58ee9a..d37a3dfa4a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -982,7 +982,7 @@ static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         tcg_gen_rotri_i64(val, val, 32);
     }
 
@@ -1001,7 +1001,7 @@ static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     TCGv addr = gen_aa32_addr(s, a32, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         TCGv_i64 tmp = tcg_temp_new_i64();
         tcg_gen_rotri_i64(tmp, val, 32);
         tcg_gen_qemu_st_i64(tmp, addr, index, opc);
-- 
2.25.1


