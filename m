Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57B1536780
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:32:14 +0200 (CEST)
Received: from localhost ([::1]:37014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufgz-0002FT-BT
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec4-0003MR-U9
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:04 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueby-0004LV-1s
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:04 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so5022251pjt.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v0dbHEjrygu3dRjGRgtDOzl0m+0syasJU1U4At/8xUU=;
 b=jKhiu7gcaX7MkCcy2gy3AuIgaM8F3XZW4MuQAq+v9kHcHNNGXWM36S07PdYL5oYxAk
 x3cTnIevPdiYP4lktEvR8VhbaJQXlyM5nPlC+trrK+eTXsJm+yaEFNs7jKQzto4GAjJk
 7/zw3BmvbzY96VefcNo23EFuux8ThGTPX6kHUqNBiUpNMMqtGR12H47ejdm8yjTr67Vm
 irs9B447Gp4jzQ6UQ0RtCk1FugJamtrwf/8afYVFxiiNbTfZpVeIEtO1EzaoGXfNU9ff
 u1ggilCCxKmXeavWl7aXZV/oiVTt6G9+KWl4z6esl7wPZrJHHL6cV6EgUmbLKA/2Grpt
 FGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0dbHEjrygu3dRjGRgtDOzl0m+0syasJU1U4At/8xUU=;
 b=AMr+l1c7KZMu3WsvrkUoGNo84Tt2pqamHZY5kan2yPVWWy65yh7k+N+skU0jcq2pqv
 c0ltObYtrAh3XCEf3a6VwEIXzafcJq51vyyA33RtqrYoVLVY4zLc4GO+wpan8pOJXaA7
 nFtmUwOn19xt+hZ76U3QLNREUYd78MyRHCJT/RFafyCRrJSNOLryFglc8iUBtGkkZanZ
 1Y/LgiAYt6OqyRDb+OYg7Y0HpKF86p3WoifMISAxb6vMOB/NheOtGUPdINVKRfamc/Tp
 MY4S0h9ie9Uw9qcvN7lk6kBgpVpZVxzBeVF9PrlzPqnsY696UTUOE64BKcOr5HgUkxP4
 dsNQ==
X-Gm-Message-State: AOAM532Au8lgy9pEqStVOQFY7xaN//s/X0TnYXPdvmlfVCCKZVzD+SFH
 m7lnjCnAW+yio2ooE1yNDg24ptXcvNnYNw==
X-Google-Smtp-Source: ABdhPJwSWO/zIcpSqBJqy5mHuW5NEwe+jNjfADIMLcwipew+/cZLGpnvj1bNO/DEeOBdQEJ4PWmRCg==
X-Received: by 2002:a17:90b:4a90:b0:1df:e3af:c6ad with SMTP id
 lp16-20020a17090b4a9000b001dfe3afc6admr9593450pjb.41.1653675773242; 
 Fri, 27 May 2022 11:22:53 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 048/114] target/arm: Move sve check into do_index
Date: Fri, 27 May 2022 11:18:01 -0700
Message-Id: <20220527181907.189259-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
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
 target/arm/translate-sve.c | 53 ++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 52bbd1a4fa..44c2342923 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1087,12 +1087,20 @@ TRANS_FEAT(MLS, aa64_sve, do_zpzzz_ool, a, mls_fns[a->esz])
  *** SVE Index Generation Group
  */
 
-static void do_index(DisasContext *s, int esz, int rd,
+static bool do_index(DisasContext *s, int esz, int rd,
                      TCGv_i64 start, TCGv_i64 incr)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    TCGv_i32 desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
-    TCGv_ptr t_zd = tcg_temp_new_ptr();
+    unsigned vsz;
+    TCGv_i32 desc;
+    TCGv_ptr t_zd;
+
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    vsz = vec_full_reg_size(s);
+    desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
+    t_zd = tcg_temp_new_ptr();
 
     tcg_gen_addi_ptr(t_zd, cpu_env, vec_full_reg_offset(s, rd));
     if (esz == 3) {
@@ -1115,46 +1123,35 @@ static void do_index(DisasContext *s, int esz, int rd,
         tcg_temp_free_i32(i32);
     }
     tcg_temp_free_ptr(t_zd);
+    return true;
 }
 
 static bool trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a)
 {
-    if (sve_access_check(s)) {
-        TCGv_i64 start = tcg_constant_i64(a->imm1);
-        TCGv_i64 incr = tcg_constant_i64(a->imm2);
-        do_index(s, a->esz, a->rd, start, incr);
-    }
-    return true;
+    TCGv_i64 start = tcg_constant_i64(a->imm1);
+    TCGv_i64 incr = tcg_constant_i64(a->imm2);
+    return do_index(s, a->esz, a->rd, start, incr);
 }
 
 static bool trans_INDEX_ir(DisasContext *s, arg_INDEX_ir *a)
 {
-    if (sve_access_check(s)) {
-        TCGv_i64 start = tcg_constant_i64(a->imm);
-        TCGv_i64 incr = cpu_reg(s, a->rm);
-        do_index(s, a->esz, a->rd, start, incr);
-    }
-    return true;
+    TCGv_i64 start = tcg_constant_i64(a->imm);
+    TCGv_i64 incr = cpu_reg(s, a->rm);
+    return do_index(s, a->esz, a->rd, start, incr);
 }
 
 static bool trans_INDEX_ri(DisasContext *s, arg_INDEX_ri *a)
 {
-    if (sve_access_check(s)) {
-        TCGv_i64 start = cpu_reg(s, a->rn);
-        TCGv_i64 incr = tcg_constant_i64(a->imm);
-        do_index(s, a->esz, a->rd, start, incr);
-    }
-    return true;
+    TCGv_i64 start = cpu_reg(s, a->rn);
+    TCGv_i64 incr = tcg_constant_i64(a->imm);
+    return do_index(s, a->esz, a->rd, start, incr);
 }
 
 static bool trans_INDEX_rr(DisasContext *s, arg_INDEX_rr *a)
 {
-    if (sve_access_check(s)) {
-        TCGv_i64 start = cpu_reg(s, a->rn);
-        TCGv_i64 incr = cpu_reg(s, a->rm);
-        do_index(s, a->esz, a->rd, start, incr);
-    }
-    return true;
+    TCGv_i64 start = cpu_reg(s, a->rn);
+    TCGv_i64 incr = cpu_reg(s, a->rm);
+    return do_index(s, a->esz, a->rd, start, incr);
 }
 
 /*
-- 
2.34.1


