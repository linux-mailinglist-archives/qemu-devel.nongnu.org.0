Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B2F6F45A9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 15:58:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptqVq-00018K-55; Tue, 02 May 2023 09:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVn-000182-6T
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:47 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVl-0003T8-H7
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:46 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so38427675e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 06:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683035864; x=1685627864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dfJMs6FCtKRZODwBO9HSA4c3kE+GfezaVHX9yu/D5TM=;
 b=t1t2vSCW4zQx8saFIiwbvyg4iXI/Y8dDrOxEV8q5bv+UQxqDpmZnwsmOTsJMJ0Unm1
 9+iyFES5QoVEqdLN8+JXj1jYjXrUhX/d759MIWsmf18TOfEpzjrYqLaiSQ7hWB2a37m2
 lYwSPE6aBa9JQfq99soTCFMO6MK+7wtan2/2XwlFMXuOckY+PtZRPXI0VxU+D7Ulc4xD
 kA8+Ufnq1pulvQDysvYA03ii/Oeg7uM38e9ZJe1AvY47RNzXxSK04HwWogqDXr1Z/gzZ
 vZP+7aUINsIZ0wjH52e0yRsHxEZemGUaIa9archDdXR10n71Xfb0pUyWUVND7YNb1eBr
 h2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683035864; x=1685627864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dfJMs6FCtKRZODwBO9HSA4c3kE+GfezaVHX9yu/D5TM=;
 b=I9gAToJsqTyGMMvt6ZkspkV+HIF5oT83ZVW/KVZ4GZqFNxxyIUanriXquTP4roDlaS
 ghAOiwEknGs+vkbn10Ly3koOhndDQo/X5T5Ok90WK1yDM1bMoV7qPvThKk70INRIIxLt
 Egm9ZqT12+V+eUZFrLfIAx/wFqlCE72yCYfewS3UO3K5WcWyJEG+A96OcsmgaA21lFrW
 x1+e3mdvUBitvAhFwthmktf4eqSKkXez0jui8/Ly8TnCRIllZBAoEnpLfIMZyaZHnFZY
 ks+nXbQP5KjoTbuXisXlMIzT5QMQ3a5TW+R5IMRVYx71y1ZejrmPL2kyCR5Ur4iGXAFt
 aGuA==
X-Gm-Message-State: AC+VfDw7mXFl6umlKpqXByeffVWQ3uPoHztlJwMeT3Uvx8LQR6I+bewG
 LKJEuvUBfzZqFkrpo+rb7WfIFeQHi8OL1iCXwlfalg==
X-Google-Smtp-Source: ACHHUZ7CSDpL+9r1KD9mNwzKkYrWJfv9aphm08jlr5XhMF6Y+ta8dUhrVls7EIqouS2rm35E0eT45Q==
X-Received: by 2002:a7b:c408:0:b0:3f2:5999:4f47 with SMTP id
 k8-20020a7bc408000000b003f259994f47mr12723218wmi.14.1683035863997; 
 Tue, 02 May 2023 06:57:43 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003f173987ec2sm39461140wms.22.2023.05.02.06.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 06:57:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, edgar.iglesias@gmail.com, tsimpson@quicinc.com,
 ale@rev.ng, anjo@rev.ng, laurent@vivier.eu, philmd@linaro.org,
 jiaxun.yang@flygoat.com, david@redhat.com, iii@linux.ibm.com,
 thuth@redhat.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 jcmvbkbc@gmail.com
Subject: [PATCH 1/9] target/avr: Finish conversion to tcg_gen_qemu_{ld,st}_*
Date: Tue,  2 May 2023 14:57:33 +0100
Message-Id: <20230502135741.1158035-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502135741.1158035-1-richard.henderson@linaro.org>
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Convert away from the old interface with the implicit
MemOp argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index a6aeae6dfa..cd82f5d591 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1492,7 +1492,7 @@ static void gen_data_store(DisasContext *ctx, TCGv data, TCGv addr)
     if (ctx->base.tb->flags & TB_FLAGS_FULL_ACCESS) {
         gen_helper_fullwr(cpu_env, data, addr);
     } else {
-        tcg_gen_qemu_st8(data, addr, MMU_DATA_IDX); /* mem[addr] = data */
+        tcg_gen_qemu_st_tl(data, addr, MMU_DATA_IDX, MO_UB);
     }
 }
 
@@ -1501,7 +1501,7 @@ static void gen_data_load(DisasContext *ctx, TCGv data, TCGv addr)
     if (ctx->base.tb->flags & TB_FLAGS_FULL_ACCESS) {
         gen_helper_fullrd(data, cpu_env, addr);
     } else {
-        tcg_gen_qemu_ld8u(data, addr, MMU_DATA_IDX); /* data = mem[addr] */
+        tcg_gen_qemu_ld_tl(data, addr, MMU_DATA_IDX, MO_UB);
     }
 }
 
@@ -1979,7 +1979,7 @@ static bool trans_LPM1(DisasContext *ctx, arg_LPM1 *a)
 
     tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
     tcg_gen_or_tl(addr, addr, L);
-    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+    tcg_gen_qemu_ld_tl(Rd, addr, MMU_CODE_IDX, MO_UB);
     return true;
 }
 
@@ -1996,7 +1996,7 @@ static bool trans_LPM2(DisasContext *ctx, arg_LPM2 *a)
 
     tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
     tcg_gen_or_tl(addr, addr, L);
-    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+    tcg_gen_qemu_ld_tl(Rd, addr, MMU_CODE_IDX, MO_UB);
     return true;
 }
 
@@ -2013,7 +2013,7 @@ static bool trans_LPMX(DisasContext *ctx, arg_LPMX *a)
 
     tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
     tcg_gen_or_tl(addr, addr, L);
-    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+    tcg_gen_qemu_ld_tl(Rd, addr, MMU_CODE_IDX, MO_UB);
     tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
     tcg_gen_andi_tl(L, addr, 0xff);
     tcg_gen_shri_tl(addr, addr, 8);
@@ -2045,7 +2045,7 @@ static bool trans_ELPM1(DisasContext *ctx, arg_ELPM1 *a)
     TCGv Rd = cpu_r[0];
     TCGv addr = gen_get_zaddr();
 
-    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+    tcg_gen_qemu_ld_tl(Rd, addr, MMU_CODE_IDX, MO_UB);
     return true;
 }
 
@@ -2058,7 +2058,7 @@ static bool trans_ELPM2(DisasContext *ctx, arg_ELPM2 *a)
     TCGv Rd = cpu_r[a->rd];
     TCGv addr = gen_get_zaddr();
 
-    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+    tcg_gen_qemu_ld_tl(Rd, addr, MMU_CODE_IDX, MO_UB);
     return true;
 }
 
@@ -2071,7 +2071,7 @@ static bool trans_ELPMX(DisasContext *ctx, arg_ELPMX *a)
     TCGv Rd = cpu_r[a->rd];
     TCGv addr = gen_get_zaddr();
 
-    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+    tcg_gen_qemu_ld_tl(Rd, addr, MMU_CODE_IDX, MO_UB);
     tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
     gen_set_zaddr(addr);
     return true;
-- 
2.34.1


