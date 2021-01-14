Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4592F573E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:32:45 +0100 (CET)
Received: from localhost ([::1]:47144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsRH-00043u-Lo
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:32:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCf-0003na-PP
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:37 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCc-0003WM-Sr
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:37 -0500
Received: by mail-pl1-x632.google.com with SMTP id j1so2150490pld.3
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0x8eNDWEM7nOVHNLi9Be+OYkh0XXgSMfT6fpLIKIzjI=;
 b=jRTi7E63sV8eOiHYjjzTxpKZp6ltG7JJ1kNrYDUu43VrfL913ONuRPey9sEJzAKgnl
 PkZeYmnrBEPzd4od21G7pvXCT4qjwU4apLZIr+VlkyQ3Q4Ts5RbE6okZEKc+AIU6D5KB
 SbOkKkhzdiIowcCJ9IWKnJre3pKcTKlNQI4Gha0LnHxw3gV03NOnLCxsQcHmHwhoeUxU
 cqYscZGQDi7+TLsyu6u1GJYTglffeQL2RFL2hg49iSOlqkBbRwH9bYsdodDfRHJDx9c+
 gOvZTFieqiwKWEW5QcVMVzLOo6b3lBwEsUlkOhS3a0fCEmY39Bi6EXNlY0qR+38CBe72
 JrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0x8eNDWEM7nOVHNLi9Be+OYkh0XXgSMfT6fpLIKIzjI=;
 b=fThCNB1qxlizKvq6guqCWLMGg0EEyUaQgqW81Lhf1xGS4uaxcwLGOVoCfLkhwKCtyv
 55odApCeqVNlbahERsomrvTgYF1j+lJkg58XyklLMFWeXJVGUiVmlQnaygi4dHmZK1mq
 sctDCuUKM0hMhptWDwgkC4p1CHB192k/Eydmq4+JQFZsWMTVycOksthT/t6R+/XE24dj
 wA4xKlbqnRCjYbebCFx5e4v+lbnZmsAu8y5WH8BV/y7Ji4PQrDq8L2Dzgz9bAjaTBm6G
 XBhVgN0BOcuRuDBBB0a+Wl/SJDKnMGAJKc/zBRelx6T475K6XsWZEsEhhJQnwC8QsdvO
 qhBQ==
X-Gm-Message-State: AOAM532Jki30kIa9c4zTVh0MpYVkxFw5EIRp2OxaRkT11ACleXPz366g
 74K6XY247IvIYNeqxodPEP/of8K17Zus8w==
X-Google-Smtp-Source: ABdhPJzsfbuucxZTCs12RfrLlEE+bsgdD/fD2tsEdWFbMLd3t0BWv9TIjmnk6pEExXoeJQt+m35F/Q==
X-Received: by 2002:a17:90a:df12:: with SMTP id
 gp18mr2448439pjb.43.1610590653364; 
 Wed, 13 Jan 2021 18:17:33 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:17:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/24] tcg: Remove tcg_gen_dup{8,16,32,64}i_vec
Date: Wed, 13 Jan 2021 16:16:51 -1000
Message-Id: <20210114021654.647242-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These interfaces have been replaced by tcg_gen_dupi_vec
and tcg_constant_vec.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  4 ----
 tcg/tcg-op-vec.c     | 20 --------------------
 2 files changed, 24 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index ed8de045e2..2cd1faf9c4 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -959,10 +959,6 @@ void tcg_gen_mov_vec(TCGv_vec, TCGv_vec);
 void tcg_gen_dup_i32_vec(unsigned vece, TCGv_vec, TCGv_i32);
 void tcg_gen_dup_i64_vec(unsigned vece, TCGv_vec, TCGv_i64);
 void tcg_gen_dup_mem_vec(unsigned vece, TCGv_vec, TCGv_ptr, tcg_target_long);
-void tcg_gen_dup8i_vec(TCGv_vec, uint32_t);
-void tcg_gen_dup16i_vec(TCGv_vec, uint32_t);
-void tcg_gen_dup32i_vec(TCGv_vec, uint32_t);
-void tcg_gen_dup64i_vec(TCGv_vec, uint64_t);
 void tcg_gen_dupi_vec(unsigned vece, TCGv_vec, uint64_t);
 void tcg_gen_add_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b);
 void tcg_gen_sub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b);
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index ce0d2f6e0e..d19aa7373e 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -241,26 +241,6 @@ TCGv_vec tcg_const_ones_vec_matching(TCGv_vec m)
     return tcg_const_ones_vec(t->base_type);
 }
 
-void tcg_gen_dup64i_vec(TCGv_vec r, uint64_t a)
-{
-    tcg_gen_dupi_vec(MO_64, r, a);
-}
-
-void tcg_gen_dup32i_vec(TCGv_vec r, uint32_t a)
-{
-    tcg_gen_dupi_vec(MO_32, r, a);
-}
-
-void tcg_gen_dup16i_vec(TCGv_vec r, uint32_t a)
-{
-    tcg_gen_dupi_vec(MO_16, r, a);
-}
-
-void tcg_gen_dup8i_vec(TCGv_vec r, uint32_t a)
-{
-    tcg_gen_dupi_vec(MO_8, r, a);
-}
-
 void tcg_gen_dupi_vec(unsigned vece, TCGv_vec r, uint64_t a)
 {
     TCGTemp *rt = tcgv_vec_temp(r);
-- 
2.25.1


