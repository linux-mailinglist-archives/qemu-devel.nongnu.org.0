Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A8C53C0E4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:44:08 +0200 (CEST)
Received: from localhost ([::1]:34914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtXz-00026Q-FJ
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskI-0001dE-8x
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:49 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:46793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskF-0000vY-W6
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:45 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so5860855pjf.5
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cId+jl3LafbTbLYlOOg+jSuzH9qsoTjBGOokKriD7lU=;
 b=RGtVoUAnKrmiHcDWN7aPbAVtWMmBhVS5coJOccPDEAuospGyYwi2VCYSzMwM/L9GV9
 Sa208Knn4EWbKmj1vf1yujxA4fRU1Ir7dJ8tHjHQaBmpSM+bhwTrgiz5kggi8Wa6sASN
 lL6dbIwoB6blkANJFFVxvvRmKCuuP3KZqpHJlgO4KD0Y4eRZbcPadMj1kJR+vfWpabxg
 pmvQmXnd5KcsxVFTxFhXUjPGp1F88FhZH6hXXDgppj3g7JIztU/UAfThFuoZPDFSLA6K
 7n0XAvRjFCG6MRRfuaIy1kkPMxBWpIihD7rCxkoJmuhm5IL7Mpp7+BMU93xOUBvMGNHk
 Dvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cId+jl3LafbTbLYlOOg+jSuzH9qsoTjBGOokKriD7lU=;
 b=VmuFj/GHhzdrq9wVdWvMfWYEzGH7Is+sF2ggE2I1jvs9XZO8YYdJRTn9dBptPE5o8s
 DL2DCxWsoL+Bn/qpMfkr6yCVClOe6207ARvUfF/0PRp4k5HNvkQ8UG7bljHSYUg7xBXF
 vl8ikMUrtzfCOAA51/zeX1qqR5uJd3KM9GYX7BDGyjRugWFxUVL0ftJl9MYbhIEJTX3Z
 XRWJDyzRNVHKFk1J5rUKv4L4JTlHcIskma1H/SuTL0mMAgd3nnS9BR5bftHZ1LavlV5w
 rHhnnjIi0IRjpiX54EKbFHnprhgIXdHIu1Rtd8FaKNi4xLWoi38tvbARUQ2ITqqIOMH2
 LW2g==
X-Gm-Message-State: AOAM5317uYBWPnHsDcUxj6hjWsDY2Znms/rRMJlx595O0BinRRIDNbeD
 qvnNMI+hSY//HBqGcutn85MbQoWVoOnOFA==
X-Google-Smtp-Source: ABdhPJxyjwzEGirAjm0ZjD9Q6FP2eyznf8VNDAbwI8h6hGh22yol6vGj9/TUbI0Ko7Ala4UMzG6rlw==
X-Received: by 2002:a17:902:c2d8:b0:15e:fa17:56cc with SMTP id
 c24-20020a170902c2d800b0015efa1756ccmr6997819pla.40.1654206762721; 
 Thu, 02 Jun 2022 14:52:42 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 55/71] target/arm: Implement REVD
Date: Thu,  2 Jun 2022 14:48:37 -0700
Message-Id: <20220602214853.496211-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  2 ++
 target/arm/sve.decode      |  1 +
 target/arm/sve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-sve.c |  2 ++
 4 files changed, 21 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ab0333400f..cc4e1d8948 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -719,6 +719,8 @@ DEF_HELPER_FLAGS_4(sve_revh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve_revw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sme_revd_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_rbit_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index bf561c270a..d1e229fd6e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -652,6 +652,7 @@ REVB            00000101 .. 1001 00 100 ... ..... .....         @rd_pg_rn
 REVH            00000101 .. 1001 01 100 ... ..... .....         @rd_pg_rn
 REVW            00000101 .. 1001 10 100 ... ..... .....         @rd_pg_rn
 RBIT            00000101 .. 1001 11 100 ... ..... .....         @rd_pg_rn
+REVD            00000101 00 1011 10 100 ... ..... .....         @rd_pg_rn_e0
 
 # SVE vector splice (predicated, destructive)
 SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 9a26f253e0..5de82696b5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -931,6 +931,22 @@ DO_ZPZ_D(sve_revh_d, uint64_t, hswap64)
 
 DO_ZPZ_D(sve_revw_d, uint64_t, wswap64)
 
+void HELPER(sme_revd_q)(void *vd, void *vn, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 2) {
+        if (pg[H1(i)] & 1) {
+            uint64_t n0 = n[i + 0];
+            uint64_t n1 = n[i + 1];
+            d[i + 0] = n1;
+            d[i + 1] = n0;
+        }
+    }
+}
+
 DO_ZPZ(sve_rbit_b, uint8_t, H1, revbit8)
 DO_ZPZ(sve_rbit_h, uint16_t, H1_2, revbit16)
 DO_ZPZ(sve_rbit_s, uint32_t, H1_4, revbit32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 58d0894e15..1129f1fc56 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2896,6 +2896,8 @@ TRANS_FEAT(REVH, aa64_sve, gen_gvec_ool_arg_zpz, revh_fns[a->esz], a, 0)
 TRANS_FEAT(REVW, aa64_sve, gen_gvec_ool_arg_zpz,
            a->esz == 3 ? gen_helper_sve_revw_d : NULL, a, 0)
 
+TRANS_FEAT(REVD, aa64_sme, gen_gvec_ool_arg_zpz, gen_helper_sme_revd_q, a, 0)
+
 TRANS_FEAT(SPLICE, aa64_sve, gen_gvec_ool_arg_zpzz,
            gen_helper_sve_splice, a, a->esz)
 
-- 
2.34.1


