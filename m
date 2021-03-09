Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDA7332E21
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:21:43 +0100 (CET)
Received: from localhost ([::1]:40656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgzG-0007hu-7O
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf8D-0000hf-Si
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:49 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:36530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7x-0002rb-Lz
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:49 -0500
Received: by mail-ot1-x333.google.com with SMTP id t16so13350850ott.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bptJGYx73w0iLgXPC0ahsEqU5HiDk0G0B7MTmQ2AFnA=;
 b=yCkrIyVpXMuyWp5Xowa6qQlOP7GAwLSF0pBCvOIrcEChHqsauXQ1Fko5mdQ/HWkbCy
 aWwuPk+3tKdzCoKp7oodAayj/RzcZkzznjksMRSiLoWKvIK9r/33kx7XaBvt5ERq1aSB
 gpWPaAB4jphBMsBQTKSITpPWdHg5B+R049fKa1qAn+GLSXgCKgxXnf3xOoYSoEtN7J45
 E+r4uTpfKIk2dsqvSNwuHbM1mID9QP3VucEUiB2mRXn+J21w6Kc1d2RQJKP1zLK2BW+x
 vvCxWX3uoIZX0c2FRzajmUqB4OCikmhkPXN5bDCKSAAKsT/a8k4NDfRBEqtpK80HuCkp
 yP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bptJGYx73w0iLgXPC0ahsEqU5HiDk0G0B7MTmQ2AFnA=;
 b=mz7dbn7qkYwnWVPOPVrZJhwgcXyL+zvnn/x3Xsy1dvfEqpJu2cjiMrxG5xMcLvKN7V
 J8tCjE/x9Nu8OGWxZG5ipJMIMLxhQFaWbQneZfCGJyPTSx/1xWOLd13UR454yqxmIsi2
 OTUV0gynCufS/inhKRc8m2Tzq+lu6ZF+5+BWnRBBsFQ8RHr1+kMZbEQR9R8Qcu2BxOHY
 da2Ne974pZFqSs9n8AWM75QnIFIcd6sicDF/JfTnbWEVTwGMeWLokyYtQJ7NWarZB1wS
 +6dorLZzN2ZL863lstDuwx6kGbISfFj2atXT5Tc9zmzB9/n6o3Fsg3z5eC09TSwWV+us
 iAmA==
X-Gm-Message-State: AOAM530xS0ZopduuIWOV0sThh5A+hqqI9y78EwZehgIESBeiFDteyKlO
 ogXF481N9cS+vaBAWU7f/7sy7SSNNilwynV1
X-Google-Smtp-Source: ABdhPJzqBl7DRttyKS28ge+8mbAlJXU3BvaiuhaF771LAqH62bIN1JGkCpAb4jKrd8J+StQhaS/rFA==
X-Received: by 2002:a05:6830:3495:: with SMTP id
 c21mr24550583otu.97.1615306952107; 
 Tue, 09 Mar 2021 08:22:32 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 69/78] target/arm: Implement SVE2 FCVTLT
Date: Tue,  9 Mar 2021 08:20:32 -0800
Message-Id: <20210309162041.23124-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428174332.17162-3-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 23 +++++++++++++++++++++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index eedb70eb50..8569d384b9 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2739,3 +2739,8 @@ DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_fcvtlt_hs, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_fcvtlt_sd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 2c38fe4691..d152193e89 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1576,4 +1576,6 @@ RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
 
 ### SVE2 floating-point convert precision odd elements
 FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
+FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
+FCVTLT_sd       01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b719a3aacf..3b3f1eca5d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7620,3 +7620,26 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
 
 DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
 DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t, H1_4, H1_2, float64_to_float32)
+
+#define DO_FCVTLT(NAME, TYPEW, TYPEN, HW, HN, OP)                             \
+void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
+{                                                                             \
+    intptr_t i = simd_oprsz(desc);                                            \
+    uint64_t *g = vg;                                                         \
+    do {                                                                      \
+        uint64_t pg = g[(i - 1) >> 6];                                        \
+        do {                                                                  \
+            i -= sizeof(TYPEW);                                               \
+            if (likely((pg >> (i & 63)) & 1)) {                               \
+                TYPEN nn = *(TYPEN *)(vn + HN(i + sizeof(TYPEN)));            \
+                *(TYPEW *)(vd + HW(i)) = OP(nn, status);                      \
+            }                                                                 \
+        } while (i & 63);                                                     \
+    } while (i != 0);                                                         \
+}
+
+DO_FCVTLT(sve2_fcvtlt_hs, uint32_t, uint16_t, H1_4, H1_2, sve_f16_to_f32)
+DO_FCVTLT(sve2_fcvtlt_sd, uint64_t, uint32_t, H1_4, H1_2, float32_to_float64)
+
+#undef DO_FCVTLT
+#undef DO_FCVTNT
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 83fab9a6fc..c29984d244 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8237,3 +8237,19 @@ static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
     }
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_ds);
 }
+
+static bool trans_FCVTLT_hs(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_hs);
+}
+
+static bool trans_FCVTLT_sd(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_sd);
+}
-- 
2.25.1


