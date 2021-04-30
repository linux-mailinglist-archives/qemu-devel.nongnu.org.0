Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDE736F8A4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:45:35 +0200 (CEST)
Received: from localhost ([::1]:53688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQeM-0002m0-4H
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTz-0007Oo-Ad
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:51 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTx-0001F4-8n
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:50 -0400
Received: by mail-wr1-x429.google.com with SMTP id n2so16824754wrm.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nLzZ4/18hku2V8u9s3HUEscNlgpZzXbguvwT6XkaP6Y=;
 b=sHjTRKFfEL26xKQcn79qXGGKJbEOJnFKEX2dvXv5bkd7L9s42nRIWMGsSdm0FR04Su
 kwBWtbdfwFn4ui9yMLaliJpwKWEW/0qT7vSE0bLb6vtivbALpOJKwhQFAUVUiloFn5gn
 lXcB3D2oWkq//jSBbTjPdLY6GVwtTbkJ399ZhnKl2kMwbAC1ToHcGFqC0+K16eum1grS
 nw9fSn2izniORUyJ92mqLUsJgXXqx9GU8tiiGKHXLifn4I/W1TMe7ZGC5HJIeFmK8BMe
 h2/OFFBCNOgdYqs5hrQGiXYgaN7DTcGr/SOjXNEwMpL2zZx+X4ASNodqCzViGHgzc6aB
 w33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nLzZ4/18hku2V8u9s3HUEscNlgpZzXbguvwT6XkaP6Y=;
 b=qnaxJBl2Y5mxvGVZcKsoc47PlWfJKTzZwWoTY2JGVttstLyrMLIVVIDcV8reWTTFhm
 LdSm5W8ybPZ7dfnS4pqUheNUYwOj3XLLuTTDhwhqhwJ58rJVl8RFIfuoCmLrkk+kjUja
 lE12y9eF3Ure7nzcHKSciECkvY9OhNpHkv7EwTVEx00eh7ZdNfvctDQH+y3mO7CktRTK
 x4ZzU+mUGzf+rbAcXf2Vu+UZL4qbRD23411KAbVp15aPN4Sezem/c9mWFv/QFVimQMaa
 nonS/VYrPkGDfMyvLPiCqVnQIY/6fVGkF+XbQl0WR42wgeSZL+Fig9GKlI9sKQXV6wup
 3wsg==
X-Gm-Message-State: AOAM530zpTAJQVH5fVzzqMYxZEObfixqULcMLUM1kTuGvlXiE+sSlLsU
 EQ1G6amz31SHzDx4nMcYi+YL5gE0B1HwGOCW
X-Google-Smtp-Source: ABdhPJy+80eaxdzX0DwVWWyk8fkOR+rC2JG8FJ0fmZoTRH9Vux80KXR7mkDGA3t1MhZF5s+IxOxW1A==
X-Received: by 2002:a05:6000:1ac5:: with SMTP id
 i5mr5849911wry.412.1619778887658; 
 Fri, 30 Apr 2021 03:34:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/43] target/arm: Remove log2_esize parameter to gen_mte_checkN
Date: Fri, 30 Apr 2021 11:34:05 +0100
Message-Id: <20210430103437.4140-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The log2_esize parameter is not used except trivially.
Drop the parameter and the deferral to gen_mte_check1.

This fixes a bug in that the parameters as documented
in the header file were the reverse from those in the
implementation.  Which meant that translate-sve.c was
passing the parameters in the wrong order.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210416183106.1516563-10-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.h |  2 +-
 target/arm/translate-a64.c | 15 +++++++--------
 target/arm/translate-sve.c |  4 ++--
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 3668b671ddb..868d3550486 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -44,7 +44,7 @@ TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int count, int log2_esize);
+                        bool tag_checked, int size);
 
 /* We should have at some point before trying to access an FP register
  * done the necessary access check, so assert that
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a68d5dd5d13..f35a5e81746 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -295,9 +295,9 @@ TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
  * For MTE, check multiple logical sequential accesses.
  */
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int log2_esize, int total_size)
+                        bool tag_checked, int size)
 {
-    if (tag_checked && s->mte_active[0] && total_size != (1 << log2_esize)) {
+    if (tag_checked && s->mte_active[0]) {
         TCGv_i32 tcg_desc;
         TCGv_i64 ret;
         int desc = 0;
@@ -306,7 +306,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, total_size - 1);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, size - 1);
         tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
@@ -315,7 +315,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
 
         return ret;
     }
-    return gen_mte_check1(s, addr, is_write, tag_checked, log2_esize);
+    return clean_data_tbi(s, addr);
 }
 
 typedef struct DisasCompare64 {
@@ -2965,8 +2965,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     }
 
     clean_addr = gen_mte_checkN(s, dirty_addr, !is_load,
-                                (wback || rn != 31) && !set_tag,
-                                size, 2 << size);
+                                (wback || rn != 31) && !set_tag, 2 << size);
 
     if (is_vector) {
         if (is_load) {
@@ -3713,7 +3712,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
      * promote consecutive little-endian elements below.
      */
     clean_addr = gen_mte_checkN(s, tcg_rn, is_store, is_postidx || rn != 31,
-                                size, total);
+                                total);
 
     /*
      * Consecutive little-endian elements from a single register
@@ -3866,7 +3865,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     tcg_rn = cpu_reg_sp(s, rn);
 
     clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
-                                scale, total);
+                                total);
 
     tcg_ebytes = tcg_const_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5179c1f8363..584c4d047c8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4264,7 +4264,7 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
-    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len);
     tcg_temp_free_i64(dirty_addr);
 
     /*
@@ -4352,7 +4352,7 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
-    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len);
     tcg_temp_free_i64(dirty_addr);
 
     /* Note that unpredicated load/store of vector/predicate registers
-- 
2.20.1


