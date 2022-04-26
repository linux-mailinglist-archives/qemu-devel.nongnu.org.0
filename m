Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C88751042A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:46:24 +0200 (CEST)
Received: from localhost ([::1]:43004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOKV-0000jy-7t
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5k-000304-KU
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:14 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5g-0003qC-V7
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:07 -0400
Received: by mail-pg1-x531.google.com with SMTP id k14so16528318pga.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6bRLZdi3rldJQhxVk4t5p5Sfqgb/tmNaqa3IEpWhsOc=;
 b=SuluE+jOKC5WdzeZb8Mte6IGipsin6nP9M27M2XIMGQ90nUiRqjHg/lZGgIKEm85cv
 TrdkU2GMCjc3gQ77qjkHd4vOqRgxpApMkZ2qoH5a6QiAecA/4B1+6mmVaH/VM1ty8opM
 xcj/yBSYQNlt4MGUMGo3c652UI5ZuosNreaeGp51KSvepyZW0KGJ5vF5/nXqGWgCGTVY
 dtqPoV24XTVi5iGNXTAORXCECVg9kuCN0xGogKqixYtKDf7kw0T5XPyKac/joBeVDfqH
 2i6dJMvsg5qXqhjORIJ/JLLjwZ1jEaCwCv+v177KDVYnA23YhOw9fw1v14bnZI271uMS
 8dHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6bRLZdi3rldJQhxVk4t5p5Sfqgb/tmNaqa3IEpWhsOc=;
 b=ghD2Y5pcJ+FSdl5aLUrXaksVGlf23eiT/nS+3pSOm3XSblzjHTObMbMlqCh9um9UTf
 6vWPCU6EZHcMdaHllmpdSy221KE8lhLVetdBTcdaPJodbV3oRgocn1SGIjjsBBGhYNJC
 BEw6FilI72W18QBSXZmb/Z7h8q7u68FzrOKyIHz2rFEsokGoe+fQMmfhuWBo0hS9+JfJ
 NEiyeTROzxndaQGUElhkEcxqwb0Hy8uwVx5redKQeUukJiUdSeHkqcmb+jto+ybrDbeS
 NCUyKjMgvlq9pRz7sZp5FAl5bkX/e4ABShQwEAWQolKSmlX1iSI9vn8BVJfNHLlXWMVR
 kI2w==
X-Gm-Message-State: AOAM532IPmscLxYeIGEE6M0XkaQBsyrqe0u7TglQPWeDRHW/Ngxj1gg3
 1s9A3U9iMxGoB6OKLHiZPEA0WU2l3w8xLg==
X-Google-Smtp-Source: ABdhPJykINug71gpMaNkfXZYkYSsPM1ipAuuDxAwGfnrmblSy3P1eBcHzHnIeqZs6ZbSglPH9kvqew==
X-Received: by 2002:a05:6a00:2d0:b0:4f4:1f34:e39d with SMTP id
 b16-20020a056a0002d000b004f41f34e39dmr25116632pft.14.1650990652986; 
 Tue, 26 Apr 2022 09:30:52 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/47] target/arm: Use tcg_constant in
 gen_compare_and_swap_pair
Date: Tue, 26 Apr 2022 09:30:04 -0700
Message-Id: <20220426163043.100432-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 68e3b5c1f8..af6844b4b6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2523,7 +2523,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
         tcg_temp_free_i64(cmp);
     } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
         if (HAVE_CMPXCHG128) {
-            TCGv_i32 tcg_rs = tcg_const_i32(rs);
+            TCGv_i32 tcg_rs = tcg_constant_i32(rs);
             if (s->be_data == MO_LE) {
                 gen_helper_casp_le_parallel(cpu_env, tcg_rs,
                                             clean_addr, t1, t2);
@@ -2531,7 +2531,6 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
                 gen_helper_casp_be_parallel(cpu_env, tcg_rs,
                                             clean_addr, t1, t2);
             }
-            tcg_temp_free_i32(tcg_rs);
         } else {
             gen_helper_exit_atomic(cpu_env);
             s->base.is_jmp = DISAS_NORETURN;
@@ -2542,7 +2541,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
         TCGv_i64 a2 = tcg_temp_new_i64();
         TCGv_i64 c1 = tcg_temp_new_i64();
         TCGv_i64 c2 = tcg_temp_new_i64();
-        TCGv_i64 zero = tcg_const_i64(0);
+        TCGv_i64 zero = tcg_constant_i64(0);
 
         /* Load the two words, in memory order.  */
         tcg_gen_qemu_ld_i64(d1, clean_addr, memidx,
@@ -2563,7 +2562,6 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
         tcg_temp_free_i64(a2);
         tcg_temp_free_i64(c1);
         tcg_temp_free_i64(c2);
-        tcg_temp_free_i64(zero);
 
         /* Write back the data from memory to Rs.  */
         tcg_gen_mov_i64(s1, d1);
-- 
2.34.1


