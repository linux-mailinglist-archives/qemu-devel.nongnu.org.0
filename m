Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD48536778
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:27:30 +0200 (CEST)
Received: from localhost ([::1]:56610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufcP-0004UW-Bv
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec3-0003J3-71
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:04 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueby-0004L4-0h
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:02 -0400
Received: by mail-pl1-x62d.google.com with SMTP id a13so4806371plh.6
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mktqF+6+9OzFitmHetNE5lmss8+JO7DHg/zzVi0naO4=;
 b=QX7/F/vV4GEMTnUrFJ+l/ReOlQhPDJiGyx8aDG8+VeLMLJLTLfRtmqLN7aC55P+Q3I
 sMBfTcLqBScJCB3RCmK9IdfybAX1r1prWpiROfQwR/XvD/N/jPfvYItPoNoXoWt34RIa
 KD6jPG6Wm0hA4yJvzh7sP+ppo/EeSyE2VD68Z84rb6/jBQclEh2OIUMYvVIZ1m9KcSk8
 2oAV2F5zcanHhhJCj7cwDw5LD7FPd8lJ+GZcMb7NItxeik8fPLwZ8XLubicT2stG2MOT
 asSisL9hz1pZDR7bhcXJd5k5MQo/IYfRohVsrwI1U6YCVdKPf/s7AxR57cWBEWF1hsWJ
 yoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mktqF+6+9OzFitmHetNE5lmss8+JO7DHg/zzVi0naO4=;
 b=rfIqtaamusy1JeU1jTU/gkhIjf67Xybe9e/d5TelucpvBrCp7YFp/5CTOydosTgYyS
 wEtrqFmjGKz2e5QtJhBDfTeEqgokL+Jh572bwbQY5IyGPStFQDtAyVp7RyNTJU7ZS3Kr
 a5BRR23ClIN0Z9HrUJHHe3Lulh2K3fchVIZaN0VkDq7ViR9xSgY7QnBHhPFLnpYpJxOs
 5pMyfn/FMFQ8fl0EeQ2Hak76Bb45GsqVM7wijGO53kSC52zv/UaXyyhBLvmuTgdV3SQv
 MeDcUUB5eUM1b1ArpQHd2Fkpb91u62eNQS2lan5m8u6Vw5Cfj9esgyTQLUqGe/EKX7jC
 hADQ==
X-Gm-Message-State: AOAM533iQeti40OfDO5UTWsJgQadtkBGzGbVo1NZZqzeAPCbpslxZlk9
 5w6CmjCCYyIRV3CyRJn0aeOXsuMM9H5dFQ==
X-Google-Smtp-Source: ABdhPJyhWoQVCWNB8wEk06nS5I+WX/EsfpE5ExGI9+TD+BTsrfh/hdm0kEW/mBK0peyvYFYz1qvBVg==
X-Received: by 2002:a17:90a:4f0a:b0:1df:b37b:75b1 with SMTP id
 p10-20020a17090a4f0a00b001dfb37b75b1mr9687078pjh.199.1653675770888; 
 Fri, 27 May 2022 11:22:50 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 045/114] target/arm: Introduce do_shift_zpzi
Date: Fri, 27 May 2022 11:17:58 -0700
Message-Id: <20220527181907.189259-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Share code between the various shifts using arg_rpri_esz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 68 +++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f15e9a30b3..c7c16863c0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -900,20 +900,39 @@ static bool do_movz_zpz(DisasContext *s, int rd, int rn, int pg,
     return gen_gvec_ool_zzp(s, fns[esz], rd, rn, pg, invert);
 }
 
+static bool do_shift_zpzi(DisasContext *s, arg_rpri_esz *a, bool asr,
+                          gen_helper_gvec_3 * const fns[4])
+{
+    int max;
+
+    if (a->esz < 0) {
+        /* Invalid tsz encoding -- see tszimm_esz. */
+        return false;
+    }
+
+    /*
+     * Shift by element size is architecturally valid.
+     * For arithmetic right-shift, it's the same as by one less.
+     * For logical shifts and ASRD, it is a zeroing operation.
+     */
+    max = 8 << a->esz;
+    if (a->imm >= max) {
+        if (asr) {
+            a->imm = max - 1;
+        } else {
+            return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
+        }
+    }
+    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
+}
+
 static bool trans_ASR_zpzi(DisasContext *s, arg_rpri_esz *a)
 {
     static gen_helper_gvec_3 * const fns[4] = {
         gen_helper_sve_asr_zpzi_b, gen_helper_sve_asr_zpzi_h,
         gen_helper_sve_asr_zpzi_s, gen_helper_sve_asr_zpzi_d,
     };
-    if (a->esz < 0) {
-        /* Invalid tsz encoding -- see tszimm_esz. */
-        return false;
-    }
-    /* Shift by element size is architecturally valid.  For
-       arithmetic right-shift, it's the same as by one less. */
-    a->imm = MIN(a->imm, (8 << a->esz) - 1);
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
+    return do_shift_zpzi(s, a, true, fns);
 }
 
 static bool trans_LSR_zpzi(DisasContext *s, arg_rpri_esz *a)
@@ -922,16 +941,7 @@ static bool trans_LSR_zpzi(DisasContext *s, arg_rpri_esz *a)
         gen_helper_sve_lsr_zpzi_b, gen_helper_sve_lsr_zpzi_h,
         gen_helper_sve_lsr_zpzi_s, gen_helper_sve_lsr_zpzi_d,
     };
-    if (a->esz < 0) {
-        return false;
-    }
-    /* Shift by element size is architecturally valid.
-       For logical shifts, it is a zeroing operation.  */
-    if (a->imm >= (8 << a->esz)) {
-        return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
-    } else {
-        return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-    }
+    return do_shift_zpzi(s, a, false, fns);
 }
 
 static bool trans_LSL_zpzi(DisasContext *s, arg_rpri_esz *a)
@@ -940,16 +950,7 @@ static bool trans_LSL_zpzi(DisasContext *s, arg_rpri_esz *a)
         gen_helper_sve_lsl_zpzi_b, gen_helper_sve_lsl_zpzi_h,
         gen_helper_sve_lsl_zpzi_s, gen_helper_sve_lsl_zpzi_d,
     };
-    if (a->esz < 0) {
-        return false;
-    }
-    /* Shift by element size is architecturally valid.
-       For logical shifts, it is a zeroing operation.  */
-    if (a->imm >= (8 << a->esz)) {
-        return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
-    } else {
-        return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-    }
+    return do_shift_zpzi(s, a, false, fns);
 }
 
 static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
@@ -958,16 +959,7 @@ static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
         gen_helper_sve_asrd_b, gen_helper_sve_asrd_h,
         gen_helper_sve_asrd_s, gen_helper_sve_asrd_d,
     };
-    if (a->esz < 0) {
-        return false;
-    }
-    /* Shift by element size is architecturally valid.  For arithmetic
-       right shift for division, it is a zeroing operation.  */
-    if (a->imm >= (8 << a->esz)) {
-        return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
-    } else {
-        return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-    }
+    return do_shift_zpzi(s, a, false, fns);
 }
 
 static gen_helper_gvec_3 * const sqshl_zpzi_fns[4] = {
-- 
2.34.1


