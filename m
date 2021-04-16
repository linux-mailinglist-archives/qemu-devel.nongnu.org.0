Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 139F9362AAD
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 00:01:53 +0200 (CEST)
Received: from localhost ([::1]:47070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWXA-0001nj-5Q
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 18:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdy-0006vd-TZ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:50 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:41719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVde-0001sK-PP
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:50 -0400
Received: by mail-pl1-x62d.google.com with SMTP id e2so10328511plh.8
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JwuGS1PiLu9HVQcfTsdjpr9pKvjxyw9I/bAPxOgmgZ0=;
 b=YnIT1Hkm3P7fhbmLtKoUyLfAkcKd6hBN9pcjOmdOKU+Tu6i9UmPALnFj3ksaJSMQ25
 f4/LLVVhiaY1qTZSg/yw9bISLC/1eFXr55MkAdvUgxtMibZblBYnFK+JOq6N+fc6+YIp
 iViCgNgmvY8YfKEEiz3ANZE7fENGDcEDhCzcsvyg1NGgxI0CA4iCnEojbvh4VFOEMJC6
 aGjUCKg/p7fQpxoWRLp4085F4ARSszqSaB24yjjnAkl7tRUE0v3+rMVRqOugIX843vMI
 TQhhHcw1BdF+czyFdxEbYIFhzJY6ngOEYh0xBJPyyU2Q+r7Wh6em7Ej840NSdSitiLBr
 MFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JwuGS1PiLu9HVQcfTsdjpr9pKvjxyw9I/bAPxOgmgZ0=;
 b=N3CUZsOlb/RSLNXrFGiEEaml7NsheeHisdrKYC0Oc+UBlB3zlN9vfGAdQSaYwLA845
 id97UobYPJxrb7MxsFsBifiO1SHYJBxcalndw2y9d9uuetw2ObqvsaSitctNaUgk4YBs
 vlzhnm6oWTkMVxf2GJ+k2EBdAlcDA+J9JLx/zAG43QE6LreIOl715c8n3cwxT3BjNnZZ
 l5fEIUjmeSAu7oMGkGWhZhpPLko8O7VF05rSqz165/8V8WedGilnQ3fagpb56ig7G2Gb
 /5ETe7QN1UfXt0J9/MqMXNibLrJ71QyFnZMQS0JfjPqzu1vl1VGR5UEJr9sZDoZLsuN3
 n/Fw==
X-Gm-Message-State: AOAM531nIk+tHYK5Jinn9iWy3Xlw15KS67pOqk+0jb1M2M/0c59r13HZ
 FaGTY1AGUIs1pol5VleMoBGHY8+HjTTZRQ==
X-Google-Smtp-Source: ABdhPJxn8icCmxgi+fLBwt9t4CcE9wuMhuyGJLCbP7LiAmA6Mhapec46w2leYTRUYZot1lP+1Zvuxw==
X-Received: by 2002:a17:90a:df17:: with SMTP id
 gp23mr11206111pjb.7.1618607069495; 
 Fri, 16 Apr 2021 14:04:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 79/81] target/arm: Implement aarch32 VSUDOT, VUSDOT
Date: Fri, 16 Apr 2021 14:02:38 -0700
Message-Id: <20210416210240.1591291-80-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h                |  5 +++++
 target/arm/neon-shared.decode   |  6 ++++++
 target/arm/translate-neon.c.inc | 27 +++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a0865e224c..134dc65e34 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3783,6 +3783,11 @@ static inline bool isar_feature_aa32_predinv(const ARMISARegisters *id)
     return FIELD_EX32(id->id_isar6, ID_ISAR6, SPECRES) != 0;
 }
 
+static inline bool isar_feature_aa32_i8mm(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_isar6, ID_ISAR6, I8MM) != 0;
+}
+
 static inline bool isar_feature_aa32_ras(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_pfr0, ID_PFR0, RAS) != 0;
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index 2d94369750..5befaec87b 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -50,6 +50,8 @@ VSDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
 VUDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 1 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VUSDOT         1111 110 01 . 10 .... .... 1101 . q:1 . 0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
 # VFM[AS]L
 VFML           1111 110 0 s:1 . 10 .... .... 1000 . 0 . 1 .... \
@@ -66,6 +68,10 @@ VSDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 0 vm:4 \
                vn=%vn_dp vd=%vd_dp
 VUDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 1 vm:4 \
                vn=%vn_dp vd=%vd_dp
+VUSDOT_scalar  1111 1110 1 . 00 .... .... 1101 . q:1 index:1 0 vm:4 \
+               vn=%vn_dp vd=%vd_dp
+VSUDOT_scalar  1111 1110 1 . 00 .... .... 1101 . q:1 index:1 1 vm:4 \
+               vn=%vn_dp vd=%vd_dp
 
 %vfml_scalar_q0_rm 0:3 5:1
 %vfml_scalar_q1_index 5:1 3:1
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 2fd6478d3c..c322615915 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -278,6 +278,15 @@ static bool trans_VUDOT(DisasContext *s, arg_VUDOT *a)
                         gen_helper_gvec_udot_b);
 }
 
+static bool trans_VUSDOT(DisasContext *s, arg_VUSDOT *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_usdot_b);
+}
+
 static bool trans_VFML(DisasContext *s, arg_VFML *a)
 {
     int opr_sz;
@@ -345,6 +354,24 @@ static bool trans_VUDOT_scalar(DisasContext *s, arg_VUDOT_scalar *a)
                         gen_helper_gvec_udot_idx_b);
 }
 
+static bool trans_VUSDOT_scalar(DisasContext *s, arg_VUSDOT_scalar *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        gen_helper_gvec_usdot_idx_b);
+}
+
+static bool trans_VSUDOT_scalar(DisasContext *s, arg_VSUDOT_scalar *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        gen_helper_gvec_sudot_idx_b);
+}
+
 static bool trans_VFML_scalar(DisasContext *s, arg_VFML_scalar *a)
 {
     int opr_sz;
-- 
2.25.1


