Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2615104C3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:58:49 +0200 (CEST)
Received: from localhost ([::1]:46100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOWW-0005f4-5K
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO62-0003B4-1W
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:39 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5z-0003wm-4L
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:24 -0400
Received: by mail-pl1-x632.google.com with SMTP id q8so7559462plx.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oLlyLVXV3hG+hIKKTiKR7bDdeXt4IImhA6gWDdbySgc=;
 b=UG2GBCIUB0iOzPtNQI9aXk2829MfXxjHiH14eY+0wNWq3R0wYKnfWWVPw28Lxb0bZF
 DINUy2Ev/OuR9dmfP/5KnOEE7kIRHipbYwLCIyGqrqn0g1ujz+t1wkJo1SCfIhp0IgT2
 9TAEHnaBikTHCTh3UUvY7RIF7cn7w6OLIzV0YqhoTnHavUg/Rgz8G5ZCegH4aPHPlDG6
 0V95Jhh94tFkf7pZKqX+I68/roWPy1ejw8pgdNXAFdIkVO4+tLTtuRtQ//77EjO8/JRH
 uOfSOrfoG+M6mvHePhlAP6NnYIjO+2QieEThY8pZVfOn44K8hgu7kgnfewByMQzpFW1l
 6U4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oLlyLVXV3hG+hIKKTiKR7bDdeXt4IImhA6gWDdbySgc=;
 b=tt4HBic8y5y5/ILKzxmS5UxtBT3Rtgn9dZXM2JjCNa1RwqgPtyRiBhLSk9EA4gZ7tg
 6iKxJBri6TRvUiELsic7hXxmKneC1BqkNlarqhd83ea6qRt6Gj9tzrzs6h3CCOpvfi8u
 tpEyoCeWhn8rfhjGeykaEHLfhzi5bNLKXdEi+7z1w8dJ5n4BzSPA8yPqBGi3d/WJJrR8
 jS54qZ8W99aUYpe9NUcoipJ3fZYti3+Fql75O8l/uDfYo0opuYSVZ0e1lZK/PQzIDWM9
 vPBlXvhQ39lO9bMXCvtNNwmfHLyjz1UERmCsejh0ThQ2iccolRc9NejrQsFhQ958/REs
 1DuQ==
X-Gm-Message-State: AOAM533pjBO+DWpdCZzaEsteVKkdp3QmnEr9S8W+s+eKjtdV9n18iqEN
 Pktp4UkkTgim7wb54tHTUXgq8CuqlfOrWA==
X-Google-Smtp-Source: ABdhPJznxTMPXEXzgo3ZCWEG6EfZxxuiO/QJVlgMUwxfL4HL+3geu+qPZ2uemTMuT+DhCLa8UM30gA==
X-Received: by 2002:a17:90b:688:b0:1d9:9ddd:1f71 with SMTP id
 m8-20020a17090b068800b001d99ddd1f71mr7845936pjz.207.1650990678413; 
 Tue, 26 Apr 2022 09:31:18 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 36/47] target/arm: Use tcg_constant for trans_INDEX_*
Date: Tue, 26 Apr 2022 09:30:32 -0700
Message-Id: <20220426163043.100432-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 726cf88d7c..8b173f5c4a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1266,11 +1266,9 @@ static void do_index(DisasContext *s, int esz, int rd,
 static bool trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a)
 {
     if (sve_access_check(s)) {
-        TCGv_i64 start = tcg_const_i64(a->imm1);
-        TCGv_i64 incr = tcg_const_i64(a->imm2);
+        TCGv_i64 start = tcg_constant_i64(a->imm1);
+        TCGv_i64 incr = tcg_constant_i64(a->imm2);
         do_index(s, a->esz, a->rd, start, incr);
-        tcg_temp_free_i64(start);
-        tcg_temp_free_i64(incr);
     }
     return true;
 }
@@ -1278,10 +1276,9 @@ static bool trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a)
 static bool trans_INDEX_ir(DisasContext *s, arg_INDEX_ir *a)
 {
     if (sve_access_check(s)) {
-        TCGv_i64 start = tcg_const_i64(a->imm);
+        TCGv_i64 start = tcg_constant_i64(a->imm);
         TCGv_i64 incr = cpu_reg(s, a->rm);
         do_index(s, a->esz, a->rd, start, incr);
-        tcg_temp_free_i64(start);
     }
     return true;
 }
@@ -1290,9 +1287,8 @@ static bool trans_INDEX_ri(DisasContext *s, arg_INDEX_ri *a)
 {
     if (sve_access_check(s)) {
         TCGv_i64 start = cpu_reg(s, a->rn);
-        TCGv_i64 incr = tcg_const_i64(a->imm);
+        TCGv_i64 incr = tcg_constant_i64(a->imm);
         do_index(s, a->esz, a->rd, start, incr);
-        tcg_temp_free_i64(incr);
     }
     return true;
 }
-- 
2.34.1


