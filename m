Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5155104FF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:13:26 +0200 (CEST)
Received: from localhost ([::1]:55482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOkf-0006Jj-MD
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5z-00039H-Mz
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:27 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:33018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5t-0003uQ-L7
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:20 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so2308268pjb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YpVs0/2D2cp0hUUGtxDD8k8vZGg2jdZBOZb+I5K1m6k=;
 b=jB0PpkXVDcFxRznSedfvgGZQIOEZ8l5W9TfuJgkltcOVu44+0DDGnwnHqOCMffWBpC
 I/gFzzD/G0Pk9jLDA0bbJIQVOhpG2NgkOuOLSgyEFLp3HmlXRnIcC3rq8evOEiww+CLF
 z598SFi1H3th36EmHMLZ5zDdP5w8XnCTPKLJNMj8QJmuny8wgQkNe8IWExfhvSnu6Ipr
 Mi23yiFsabWmVbO8jNbkHyqG3XPEd1nFVjmPuEOS97XYRJV0qeiUAgHNvzOMa6BPwBCX
 VayifpSJCCQ/ZC0T7AcfLM9AW+MA4YOjKDanhf57elLPz0SfuI7nVofuxy1Xj5Q/VxQ9
 6SrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YpVs0/2D2cp0hUUGtxDD8k8vZGg2jdZBOZb+I5K1m6k=;
 b=trfb8cG+M2+QshUsYppDUuWEIhM5CgPOqNqZFIuT1PERGB28WwY28o4wPAfrr6hJRu
 7sNGILFG6S5ui/k8t1P5eU7nHAfQoRyxwiBfVP4BSRDy2AjyiS30kKfAcZpDa7xM27j+
 QIDVxZdixYqPkZYaDwauvB3IrnqlZioKJ6QHE/tDRVQZLRgRK/v5zv0ba6yUq6ZvGiJ2
 QwSh1kp+yoATiXESVa4TpIS7TF6/19Z3xpoDCOF/MoT0V640oXw8EV1R/ae4bRTRU8mt
 lqV53hU0bq4AyvDdQo5TUq5jara3kth3DDdcsnVYgk2Sz59iBpENBWAZhqBo9B9VikfW
 jtEw==
X-Gm-Message-State: AOAM530oDN+z+N3AlrApXrefNtwP151l04pWZCR5Up3UHYCLyR4JUc6j
 taqF7FI+YDtJg1zpUx6Yk3DezvlVJQrcuA==
X-Google-Smtp-Source: ABdhPJxnN9ic50TDcy5aDQ553i7N9cOnxAMqU/TRoatJjE3gVk5V9NE4jDFLhIHdoxgR3QPBnLNbSA==
X-Received: by 2002:a17:90b:4c46:b0:1d9:f9e1:254 with SMTP id
 np6-20020a17090b4c4600b001d9f9e10254mr1634983pjb.24.1650990673596; 
 Tue, 26 Apr 2022 09:31:13 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/47] target/arm: Use tcg_constant for TT, SAT, SMMLA
Date: Tue, 26 Apr 2022 09:30:27 -0700
Message-Id: <20220426163043.100432-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
 target/arm/translate.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b604a820c0..24e522e1d6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6596,8 +6596,8 @@ static bool trans_TT(DisasContext *s, arg_TT *a)
     }
 
     addr = load_reg(s, a->rn);
-    tmp = tcg_const_i32((a->A << 1) | a->T);
-    gen_helper_v7m_tt(tmp, cpu_env, addr, tmp);
+    tmp = tcg_temp_new_i32();
+    gen_helper_v7m_tt(tmp, cpu_env, addr, tcg_constant_i32((a->A << 1) | a->T));
     tcg_temp_free_i32(addr);
     store_reg(s, a->rd, tmp);
     return true;
@@ -7564,7 +7564,7 @@ static bool trans_PKH(DisasContext *s, arg_PKH *a)
 static bool op_sat(DisasContext *s, arg_sat *a,
                    void (*gen)(TCGv_i32, TCGv_env, TCGv_i32, TCGv_i32))
 {
-    TCGv_i32 tmp, satimm;
+    TCGv_i32 tmp;
     int shift = a->imm;
 
     if (!ENABLE_ARCH_6) {
@@ -7578,9 +7578,7 @@ static bool op_sat(DisasContext *s, arg_sat *a,
         tcg_gen_shli_i32(tmp, tmp, shift);
     }
 
-    satimm = tcg_const_i32(a->satimm);
-    gen(tmp, cpu_env, tmp, satimm);
-    tcg_temp_free_i32(satimm);
+    gen(tmp, cpu_env, tmp, tcg_constant_i32(a->satimm));
 
     store_reg(s, a->rd, tmp);
     return true;
@@ -7915,9 +7913,7 @@ static bool op_smmla(DisasContext *s, arg_rrrr *a, bool round, bool sub)
              * a non-zero multiplicand lowpart, and the correct result
              * lowpart for rounding.
              */
-            TCGv_i32 zero = tcg_const_i32(0);
-            tcg_gen_sub2_i32(t2, t1, zero, t3, t2, t1);
-            tcg_temp_free_i32(zero);
+            tcg_gen_sub2_i32(t2, t1, tcg_constant_i32(0), t3, t2, t1);
         } else {
             tcg_gen_add_i32(t1, t1, t3);
         }
-- 
2.34.1


