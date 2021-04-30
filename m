Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301DA3702EC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:23:26 +0200 (CEST)
Received: from localhost ([::1]:46114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcabd-0000RW-6T
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmf-0004xE-Md
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:45 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlw-0007oi-Vn
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:45 -0400
Received: by mail-pf1-x42e.google.com with SMTP id p4so1772908pfo.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kpdZDVpYUbdNl8Imm7Lczl+8zIvDSosqNuzK4QWcI1g=;
 b=XYkNSFN9n4cMNNKaT3b9EIefAaRzAvv5I3veEoRh388TteTKFy+89BfDEdl8/mENM6
 RIUuDk1I0xly0pXO/ZzJninYSYOawoEz7yqzJ4KwGEotaxzlBGs+embmjGFY151J7NV2
 b/QkcTShBQcgreKJ6aSd4ZG6m4GdkYAyueOuq0zCBMP7EAE6w8kQDXcnrajMWdsrOyjh
 qPs73VFdXQvPuFRCMpDAp9FzqpP0XJ7jwqVTs/C/1Et9mjrPwLYSdaXHYrqrAEIcil8q
 kmxK+/ODyQIS8kmPxnBSR327KHc3ExfJJlHKR5vdk6xO39YpwP6gc/5nxfaAK/snSkR5
 PiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kpdZDVpYUbdNl8Imm7Lczl+8zIvDSosqNuzK4QWcI1g=;
 b=XSbGQ5yt/PFkNWcs8k+yIYR5Qu8S0KqG6R24fN8UNlV4OVGWX9g9l+38xrBvuctBt8
 +YK7K0KbMI19ogzVKh416zkAf55WKiqNhm6IRcQ7d1OYAvYs0G4FlevIwM8zTRyAWWpN
 6sf97I4f3S3Escxbwmn793zIS8rqc39UN34lhrd1hCx7tUyf+R4HhZ0F8I2fdINMDFeh
 1jJmeULFR2pDOTQplt2qACfjd4SzOqevcvmFIzrbZokiUsfkJ29kXqsywzFFx5tVmDhc
 RCJ5ICHuJwrzRYlGFHSJRvza78mEqBeQ8Pibm52gzh3m7wxjMpx+p1y9hWzSNsis9I0W
 FDnw==
X-Gm-Message-State: AOAM53352qVN7FToo0U/QBSFXmFcDX9Tkchgj/Es+w09SsQrnJ6YfQNU
 dZ4t+lsdM1hACRvmDcODvQRxoNx0cJGwzg==
X-Google-Smtp-Source: ABdhPJyf0mQAGw98vMz7PMn5NYoVLX+84sgczvt0dryKAnu31O5uHjZnMmI0m0f2e/JmEBM1E3Ulsg==
X-Received: by 2002:aa7:8103:0:b029:247:74a8:e54d with SMTP id
 b3-20020aa781030000b029024774a8e54dmr6540683pfi.60.1619814598857; 
 Fri, 30 Apr 2021 13:29:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 77/82] target/arm: Fix decode for VDOT (indexed)
Date: Fri, 30 Apr 2021 13:26:05 -0700
Message-Id: <20210430202610.1136687-78-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

We were extracting the M register twice, once incorrectly
as M:vm and once correctly as rm.  Remove the incorrect
name and remove the incorrect decode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-shared.decode |  4 +-
 target/arm/translate-neon.c   | 90 +++++++++++++++--------------------
 2 files changed, 40 insertions(+), 54 deletions(-)

diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index ca0c699072..facb621450 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -61,8 +61,8 @@ VCMLA_scalar   1111 1110 0 . rot:2 .... .... 1000 . q:1 index:1 0 vm:4 \
 VCMLA_scalar   1111 1110 1 . rot:2 .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp size=2 index=0
 
-VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 rm:4 \
-               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 vm:4 \
+               vn=%vn_dp vd=%vd_dp
 
 %vfml_scalar_q0_rm 0:3 5:1
 %vfml_scalar_q1_index 5:1 3:1
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index a0e267694b..52b75ff76f 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -151,6 +151,36 @@ static void neon_store_element64(int reg, int ele, MemOp size, TCGv_i64 var)
     }
 }
 
+static bool do_neon_ddda(DisasContext *s, int q, int vd, int vn, int vm,
+                         int data, gen_helper_gvec_4 *fn_gvec)
+{
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (((vd | vn | vm) & 0x10) && !dc_isar_feature(aa32_simd_r32, s)) {
+        return false;
+    }
+
+    /*
+     * UNDEF accesses to odd registers for each bit of Q.
+     * Q will be 0b111 for all Q-reg instructions, otherwise
+     * when we have mixed Q- and D-reg inputs.
+     */
+    if (((vd & 1) * 4 | (vn & 1) * 2 | (vm & 1)) & q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    int opr_sz = q ? 16 : 8;
+    tcg_gen_gvec_4_ool(vfp_reg_offset(1, vd),
+                       vfp_reg_offset(1, vn),
+                       vfp_reg_offset(1, vm),
+                       vfp_reg_offset(1, vd),
+                       opr_sz, opr_sz, data, fn_gvec);
+    return true;
+}
+
 static bool do_neon_ddda_fpst(DisasContext *s, int q, int vd, int vn, int vm,
                               int data, ARMFPStatusFlavour fp_flavor,
                               gen_helper_gvec_4_ptr *fn_gvec_ptr)
@@ -241,35 +271,13 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
 
 static bool trans_VDOT(DisasContext *s, arg_VDOT *a)
 {
-    int opr_sz;
-    gen_helper_gvec_4 *fn_gvec;
-
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
     }
-
-    /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) &&
-        ((a->vd | a->vn | a->vm) & 0x10)) {
-        return false;
-    }
-
-    if ((a->vn | a->vm | a->vd) & a->q) {
-        return false;
-    }
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    opr_sz = (1 + a->q) * 8;
-    fn_gvec = a->u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b;
-    tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
-                       vfp_reg_offset(1, a->vn),
-                       vfp_reg_offset(1, a->vm),
-                       vfp_reg_offset(1, a->vd),
-                       opr_sz, opr_sz, 0, fn_gvec);
-    return true;
+    return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
+                        a->u
+                        ? gen_helper_gvec_udot_b
+                        : gen_helper_gvec_sdot_b);
 }
 
 static bool trans_VFML(DisasContext *s, arg_VFML *a)
@@ -323,35 +331,13 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
 
 static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 {
-    gen_helper_gvec_4 *fn_gvec;
-    int opr_sz;
-
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
     }
-
-    /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) &&
-        ((a->vd | a->vn) & 0x10)) {
-        return false;
-    }
-
-    if ((a->vd | a->vn) & a->q) {
-        return false;
-    }
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    fn_gvec = a->u ? gen_helper_gvec_udot_idx_b : gen_helper_gvec_sdot_idx_b;
-    opr_sz = (1 + a->q) * 8;
-    tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
-                       vfp_reg_offset(1, a->vn),
-                       vfp_reg_offset(1, a->rm),
-                       vfp_reg_offset(1, a->vd),
-                       opr_sz, opr_sz, a->index, fn_gvec);
-    return true;
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        a->u
+                        ? gen_helper_gvec_udot_idx_b
+                        : gen_helper_gvec_sdot_idx_b);
 }
 
 static bool trans_VFML_scalar(DisasContext *s, arg_VFML_scalar *a)
-- 
2.25.1


