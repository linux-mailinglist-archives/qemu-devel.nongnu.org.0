Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478F839062B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:05:44 +0200 (CEST)
Received: from localhost ([::1]:43242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZYt-00066C-9u
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYcG-0004uU-TF
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:05:09 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYcB-00052c-Mi
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:05:08 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so13009544wmf.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hoipgAflkNr1W+vOdL8bm3OYjOftc160Exkzny2m9fc=;
 b=Pml8BNbS2/b6Hs1f2qGal1JKnVSUIojSITYZqTBwGCYjBdySjdJLSAZbx1gRP5Vo3p
 J7sILkW3HjPGwH6iDHZGohGdgCj9HoatiwjAWltcV8I15+mKgQJ1Muo0ID39XfEfDQuF
 e99tI/1xz7Xy5NP15XjLSO3/X6e1aK6VZt9+hPdE0Vtn/I0NPsfBjfYEaGTretN/EXO3
 1+nh3zw34jsBFKMAqXqcN6gDqhNAEC35UYPc2TV+YyUt03OWzLfaxRRgk3xMDRfuFPiS
 4/w0nQ3V55CosiN/BINCIvaBPaR6ER5CzaSJ2QZ0FJYu9ugMV/CIgMHx2tDNVkEpjHur
 RJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hoipgAflkNr1W+vOdL8bm3OYjOftc160Exkzny2m9fc=;
 b=MhIQLoYbcyGCFvHgh+SFg3s2DrxkAuBug9Y1/Wjdr9Eln5z3f3uJaXzt8d/Q1J2Ubp
 LmVkthPXxANj1eWSUwVSEvfW9nZtV2YkbOwIadlKxbCsO9tq8k/Rwk6e3IilgFuHj3Uc
 c73GRzpjzqKCg5fgl1Cs505j1HuLWxCleCauEzgzUdgDD/WO/CBVb9rlq+dp1sMmqFZC
 wrgSPFRqdyFTd2ctgvWOe/njZsLj1SWJcMeUgBtYvtU+b62OgiBeIYz1rZfRKtHZloCK
 NargTeF7Ldv0AV63vAw+GCl7g2kC9RBrVvb7ETH32xIErGNO+5PMHbCTa6tYHJBJLfry
 UY7g==
X-Gm-Message-State: AOAM532gasP0W+V7Wb2wdOdx7bvJi9GUR+2qBwxab1/Bm6Q4aXYpJDHN
 tc/Z8LvJN1wzgy1/TZTnEKZEA3YecrlX1fNv
X-Google-Smtp-Source: ABdhPJxPjxRYWTX51ahUGj9DIEDByz6GgPFTIQ4W5z+4IncVD7hWVSSpvbpkiYM4wWLvXeFISZgOWA==
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr4293859wmb.92.1621955100829;
 Tue, 25 May 2021 08:05:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.05.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:05:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 094/114] target/arm: Implement SVE2 FCVTNT
Date: Tue, 25 May 2021 16:03:04 +0100
Message-Id: <20210525150324.32370-95-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-73-richard.henderson@linaro.org
Message-Id: <20200428174332.17162-2-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/sve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index cdff155ead4..7aa365d5659 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2744,3 +2744,8 @@ DEF_HELPER_FLAGS_5(sve2_cdot_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_cdot_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index fdeb7b106b3..94cdc6ff15a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1580,3 +1580,7 @@ SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
 # SVE2 crypto constructive binary operations
 SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
+
+### SVE2 floating-point convert precision odd elements
+FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
+FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4b05e2e4276..d44bcfa44aa 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7602,3 +7602,23 @@ void HELPER(fmmla_d)(void *vd, void *vn, void *vm, void *va,
         d[3] = float64_add(a[3], float64_add(p0, p1, status), status);
     }
 }
+
+#define DO_FCVTNT(NAME, TYPEW, TYPEN, HW, HN, OP)                             \
+void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
+{                                                                             \
+    intptr_t i = simd_oprsz(desc);                                            \
+    uint64_t *g = vg;                                                         \
+    do {                                                                      \
+        uint64_t pg = g[(i - 1) >> 6];                                        \
+        do {                                                                  \
+            i -= sizeof(TYPEW);                                               \
+            if (likely((pg >> (i & 63)) & 1)) {                               \
+                TYPEW nn = *(TYPEW *)(vn + HW(i));                            \
+                *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, status);      \
+            }                                                                 \
+        } while (i & 63);                                                     \
+    } while (i != 0);                                                         \
+}
+
+DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
+DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t,     , H1_4, float64_to_float32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9a6f7c87c1e..700b02814c4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8246,3 +8246,19 @@ static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
     }
     return true;
 }
+
+static bool trans_FCVTNT_sh(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_sh);
+}
+
+static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_ds);
+}
-- 
2.20.1


