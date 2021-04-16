Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05642362AA8
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:58:33 +0200 (CEST)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWTw-0006Mb-29
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdx-0006tR-TK
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:49 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdc-0001qF-Kj
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:49 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so17057809pjb.4
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Ga4fLXN7AbcOvfFg3KvJnaRVScnkhscfervqpvFkDI=;
 b=QJAVayBNxp5z8raq5Fn66ONMBSlexsWAzBdmcqP7GPdEK7Dab0h61XzV9cM7LHvTEO
 k3ewNx12X0SNTH7y2eesb0xZeN7rxWLvPzw/uJfBoXG2PLSgalPclHxzCBqmjZzFJCdd
 RIDe2EqS9zuKez82ROxMJBu+iUp+OO+tvcOXhByyBjPo3c2RwGvimhjU1J7wr3NkUOPA
 vaV0J7MzJeoOm4Vg9IJ+rRoQfeLtmYki4f/9fVZ+ZtU7POMAqzc+ISERp9AueZDRcNTy
 GcQ5/yfIcKYrSd8swiEzHeElcrtYFk3my+I/vTKosDC1H96V+zMUf/GVrd3y5pE8P/w1
 OSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Ga4fLXN7AbcOvfFg3KvJnaRVScnkhscfervqpvFkDI=;
 b=IfVMcn6Qna3eFtMtoCgEVYWVPkRkMc4HZvx1nS6KtYxyg+k4U1M95V6x8/uT1LwI6D
 gVHMudbX2ZQ3XaQ1Pc+Udl32bhXdf8JK1J9zFu2qdUgdPimEdcCAkSoWrkOkoGOkP+zk
 Ph+NsoB3BHLff35WMaUsPyJoApm8rKZWWMNpE1ZEOoLq0+emCeCqO/VA6d0bzSguNLDg
 Z6rQ/AqQQVa1pMi9dbuUHUksQw6QMw98G0i3BOYzrWFmPKmE5uKs4vIMpMbHCHVI+Bzn
 jqxIsecT1TkTRf8HLfYynjWk2Z1XOwxO1c/BADk8uHKCvDmv0NkUW5CxnTdj4E5mW3ao
 JZhA==
X-Gm-Message-State: AOAM532uYtZpa4RsqydNscmDim3KK0THFM+sB2oFrefIV1UKzyhXkOZg
 DwV3QQvqgMGhv0PddRUmCSPyfxMHLsMzbw==
X-Google-Smtp-Source: ABdhPJzXNqIoXfM98ypk2Gupv+UAF5qoz9vuwoE6qDdJieuYn7ckY7wuzbv9SkDtNiX1nPnDgBExSw==
X-Received: by 2002:a17:90a:9511:: with SMTP id
 t17mr11847273pjo.235.1618607067265; 
 Fri, 16 Apr 2021 14:04:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 77/81] target/arm: Fix decode for VDOT (indexed)
Date: Fri, 16 Apr 2021 14:02:36 -0700
Message-Id: <20210416210240.1591291-78-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

We were extracting the M register twice, once incorrectly
as M:vm and once correctly as rm.  Remove the incorrect
name and remove the incorrect decode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-shared.decode   |  4 +-
 target/arm/translate-neon.c.inc | 90 ++++++++++++++-------------------
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
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index c1fbe21ae6..d9901c0153 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -142,6 +142,36 @@ static void neon_store_element64(int reg, int ele, MemOp size, TCGv_i64 var)
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
@@ -232,35 +262,13 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
 
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
@@ -314,35 +322,13 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
 
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


