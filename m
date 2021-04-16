Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B94362A93
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:49:57 +0200 (CEST)
Received: from localhost ([::1]:36340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWLc-0002td-3F
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdo-0006Vs-Dm
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:40 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdV-0001jU-KJ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:40 -0400
Received: by mail-pj1-x1035.google.com with SMTP id nk8so1511949pjb.3
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6+bWqDpe9bFb8HpI6D4DHTRWk4CTefRX0cnIpSJEYXs=;
 b=xLr+k5PZgpuOZBW90nsmRSiaL1uAfsb3ytPt0y4sZoB0K2hxDMbkRwgOgW/OTD5UkG
 Cp0TV77e8kxJda06niIshs6BY9r1gcSSIU0bzXVS9Y4h5k3sUznGZynNTTkq12f2P2zZ
 q5WJu6EhVW+D0j+t53TdK4Jt5CNG97BPAu2uUQOOnsDGBQByeHsewNbHz9u4Hy/hnPER
 v3cGvusFZuwrE9FVeohCQmBMinjf2qsbcdg12+hARsLh0zI3tGKo34KRUqIAa7w9GJIZ
 p5+zBqte8iGaXgkuEAyQKHoEEryjDjw8JaXh+buKj1EiW+osA6+OcrhXPZrFfK5Ga0pQ
 Gg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6+bWqDpe9bFb8HpI6D4DHTRWk4CTefRX0cnIpSJEYXs=;
 b=ARaWm+M/sxoXwQPyxC7JL1lGHxnk6TGZurGOhDdW5ffq7ij6OzS6w6mnijlj0LRs6+
 m90h/UDV+d+MJPWoklbQSIGXxKUY4WLGFoYnFELdp5wXxvWEjElLusUiOkPEjwP/tIR5
 m9DOz3oHaBI1zs8CCY35rTNzbmy+VyUiE7hrgh3H8WdoTSvuR+BlJrdfkBPDz/bqfWkr
 agamq4CTgtuscVXVB4yuZZc24O4vRw4bBcS1N0GDHPMgXEAljoTB1tLbwmobN9XicjP3
 d4mxPmgdNXNEg3rJde9eklUrl+rWQqAehyEi5751otumIY741y1ap0tXolRUSlpUdlc3
 9eIQ==
X-Gm-Message-State: AOAM531pH37mi1EeSB72sJOaO/HpfC1ZDvzOPaz6qGZTpI5ihf16tOWJ
 GGg+q5NVomkd8Dror6/PMNdp1X/NsnyXLQ==
X-Google-Smtp-Source: ABdhPJwAsepJQIRENh3n5T6EP3ss2o+XgZ6MgpRT4D2Z11LJ200hE9gOssf/CrwC/uJe/5+LHnc59Q==
X-Received: by 2002:a17:90b:388a:: with SMTP id
 mu10mr11202454pjb.203.1618607051049; 
 Fri, 16 Apr 2021 14:04:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 60/81] target/arm: Implement SVE mixed sign dot product
Date: Fri, 16 Apr 2021 14:02:19 -0700
Message-Id: <20210416210240.1591291-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  2 ++
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 target/arm/vec_helper.c    | 18 ++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index e4c6458f98..86f938c938 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -612,6 +612,8 @@ DEF_HELPER_FLAGS_5(gvec_sdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_udot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usdot_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_sdot_idx_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 05360e2608..73f1348313 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1481,6 +1481,10 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
+## SVE mixed sign dot product
+
+USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
+
 ### SVE2 floating point matrix multiply accumulate
 
 FMMLA           01100100 .. 1 ..... 111001 ..... .....  @rda_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1f07131cff..0da4a48199 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8056,3 +8056,19 @@ static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
     }
     return true;
 }
+
+static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
+{
+    if (a->esz != 2 || !dc_isar_feature(aa64_sve_i8mm, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           vsz, vsz, 0, gen_helper_gvec_usdot_b);
+    }
+    return true;
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 98b707f4f5..9b2a4d5b7e 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -579,6 +579,24 @@ void HELPER(gvec_udot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(gvec_usdot_b)(void *vd, void *vn, void *vm,
+                          void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *a = va;
+    uint8_t *n = vn;
+    int8_t *m = vm;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = (a[i] +
+                n[i * 4 + 0] * m[i * 4 + 0] +
+                n[i * 4 + 1] * m[i * 4 + 1] +
+                n[i * 4 + 2] * m[i * 4 + 2] +
+                n[i * 4 + 3] * m[i * 4 + 3]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
 void HELPER(gvec_sdot_h)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-- 
2.25.1


