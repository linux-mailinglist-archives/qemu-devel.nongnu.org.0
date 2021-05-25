Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DEC3906D1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:43:17 +0200 (CEST)
Received: from localhost ([::1]:42694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lla9E-0000oV-37
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYep-0002O7-IH
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:47 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYeh-0006r9-MJ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:47 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1817963wmc.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kVNZz+2QuIZQS7BFD2Hhss6WfXf34Ab8RAlK/vt4cBw=;
 b=SdD6rx0++n8Oe95+tx441lbHP7LrIK30S+nZF602YbC2s9JoKCU56FkDXNwuAdp8xk
 BW+qQyxk9bUXxotVAwHwTVEMJf2vGFVmPH3PxRBr4nW5azpp2d3J0LsJvXx522lKdtre
 wcGTvaYF0PJsuzXrt6VJX3cF/1k8KT+EAU1V1UVkwBwBw/M95PdjJL2s/4lGrWItp1D6
 zNrvL+OFd6xN6VZYndn5IRMoRljQaiW4cWH8QZ2uq+ZyfyvPMHNGIoEY3Mbbua6Ik9rg
 et4YLFAci9wkei5rV2lbzSsXVtufaK+H6w+DHuTs8OiI3VZkga/XTeHtlG4nMg3DQu/+
 TZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kVNZz+2QuIZQS7BFD2Hhss6WfXf34Ab8RAlK/vt4cBw=;
 b=mkALtLXSZfAAPxI2AsUyPe2k68y8c/aiQZMjsaq6ntNuDxz7yDjSXlnUpHU8JpYmxf
 rw0OcM1WMQbQ3dPB/B/uIjFUpnalvsTt9N6xAbPLUELGV79aiXj/XzeQ3wSRPCUkq5T8
 q2NBFeSUXXDdjrwv7KDNgXbqapGLjLODAuTcIFYfXRZWuyWW8QUJ+VGPEG7E93ufLjn0
 5Zg8pzJQuVuOfakaEsqBSGAAn9qxgH/f/sTKxOV30xgE68zoRm0yPQxqnua6JLRNpQDK
 N94mco/yUPzTqCW9JouTcFYUx9nAs48ETL9RFJbIxTGk7vx4f3QO9/Y50NE9ONWu6Nl0
 ZDEg==
X-Gm-Message-State: AOAM532PXOyXffnoLb3Kc3PXyxN6X2n5P9rFITdk56hFvxIrUiCVFnyR
 feoLp+CP2XFeTmjZIYwnAsFctMNf7nwelwBX
X-Google-Smtp-Source: ABdhPJxP9glpBIKzOTy5M9AksCPyatPGIdFn96eU40AExgpusVqUuprca0neCdrAHmMu3yYDZmGkTA==
X-Received: by 2002:a1c:4444:: with SMTP id r65mr4207532wma.127.1621955258234; 
 Tue, 25 May 2021 08:07:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 095/114] target/arm: Implement SVE2 FCVTLT
Date: Tue, 25 May 2021 16:07:17 +0100
Message-Id: <20210525150736.32695-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

From: Stephen Long <steplong@quicinc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-74-richard.henderson@linaro.org
Message-Id: <20200428174332.17162-3-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 23 +++++++++++++++++++++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 7aa365d5659..be4b17f1c2e 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2749,3 +2749,8 @@ DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_fcvtlt_hs, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_fcvtlt_sd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 94cdc6ff15a..1be35154708 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1583,4 +1583,6 @@ RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
 
 ### SVE2 floating-point convert precision odd elements
 FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
+FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
+FCVTLT_sd       01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index d44bcfa44aa..88823935156 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7622,3 +7622,26 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
 
 DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
 DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t,     , H1_4, float64_to_float32)
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
+DO_FCVTLT(sve2_fcvtlt_sd, uint64_t, uint32_t,     , H1_4, float32_to_float64)
+
+#undef DO_FCVTLT
+#undef DO_FCVTNT
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 700b02814c4..7490094d172 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8262,3 +8262,19 @@ static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
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
2.20.1


