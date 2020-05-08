Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5211CB3B8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 17:43:13 +0200 (CEST)
Received: from localhost ([::1]:37700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX59c-00050V-RH
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 11:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX4pU-0004kB-2J
 for qemu-devel@nongnu.org; Fri, 08 May 2020 11:22:24 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:43802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX4pQ-0007Cl-Ty
 for qemu-devel@nongnu.org; Fri, 08 May 2020 11:22:23 -0400
Received: by mail-pl1-x644.google.com with SMTP id z6so849477plk.10
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 08:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gc/m33i2xUJ86Yrdh+2LNrQ2J4l5DWq2aMDMhprlab0=;
 b=wXIErqxcZOpLpdxbx05NwoJz5pSTUsHZ4MIZI8VA/slJN11b5FK/qaEVT01oT9nDZW
 mZUPgL/1wnLQp14hhsY/9RVaU1Izuw4MzB40hGx6gWqSwIMsEo53F86f0LeJo45eiJgb
 iYHdxEgTYPlOHEeJ387C2YRk5IxqzyCv3hqGFXAEJ40cKfdVYVHJxy6uPB9Flo6QicWL
 uEd6MaZe92IuMpWNVCrAHgGkN+okOHXwmjXJgeVH3qk7vgmE3ke48WA5IpWszyWT1xM+
 chpv8t0OPo6M7Ra/yMFOQ8Iov2feXccbmoL86dO4dWeS2eioHOsR2RAHXAf52MDWuQx2
 yYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gc/m33i2xUJ86Yrdh+2LNrQ2J4l5DWq2aMDMhprlab0=;
 b=nUweff9/Vi0fXZunOc210DoX8pu8ntLq+1cx20ViDGSUnFSptxXJu0noqGgrXdnD5W
 O5xQVvWCaxw/Vr1I+meXM8vliI4VtKB7oJsVQQ36eZJbTgxGavM4N4AzDWClgiqyCaJT
 Z13s1hI2P5gJtW2961iWpKufGvhikdTHgrcHbXCcyC4+8Ko/caE/iwIgPO/Kw1EMz1Oe
 8VXM2mpwXIveoeWHfriwGlzGbQJLjHBEExtn8qjZzwYIiwWOdcNgncJ27MMrUqe5/Z32
 DDvW82hRvb867+5EIIXV7KoscESGZpVLvt9TUfJruafdLzyUubgq+64iAOi/FaJl5V4W
 GvoA==
X-Gm-Message-State: AGi0PubwyAQKFec5H5gnG5MRD9XBY3CM8vdBV9bAXwB4atMLsHWTGatp
 69JDwGZXActVi6Woz77XqlB6hW5X2lE=
X-Google-Smtp-Source: APiQypLYIpCvrguFrji0CiQowRjGtDs1VHbPbEGWq59Par37Z07WIPH0rz49K21ukBQq0q8KPNheTA==
X-Received: by 2002:a17:90a:7046:: with SMTP id
 f64mr5907405pjk.205.1588951338676; 
 Fri, 08 May 2020 08:22:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id n16sm2104575pfq.61.2020.05.08.08.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 08:22:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/16] target/arm: Create gen_gvec_{qrdmla,qrdmls}
Date: Fri,  8 May 2020 08:21:56 -0700
Message-Id: <20200508152200.6547-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508152200.6547-1-richard.henderson@linaro.org>
References: <20200508152200.6547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide a functional interface for the vector expansion.
This fits better with the existing set of helpers that
we provide for other operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     |  5 ++++
 target/arm/translate-a64.c | 34 ++----------------------
 target/arm/translate.c     | 54 +++++++++++++++++++-------------------
 3 files changed, 34 insertions(+), 59 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 4e1778c5e0..aea8a9759d 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -332,6 +332,11 @@ void gen_gvec_sri(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
 void gen_gvec_sli(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
                   int64_t shift, uint32_t opr_sz, uint32_t max_sz);
 
+void gen_gvec_sqrdmlah_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                          uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_sqrdmlsh_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                          uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+
 /*
  * Forward to the isar_feature_* tests given a DisasContext pointer.
  */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 367fa403ae..4577df3cf4 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -587,18 +587,6 @@ static void gen_gvec_op3_ool(DisasContext *s, bool is_q, int rd,
                        is_q ? 16 : 8, vec_full_reg_size(s), data, fn);
 }
 
-/* Expand a 3-operand + env pointer operation using
- * an out-of-line helper.
- */
-static void gen_gvec_op3_env(DisasContext *s, bool is_q, int rd,
-                             int rn, int rm, gen_helper_gvec_3_ptr *fn)
-{
-    tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
-                       vec_full_reg_offset(s, rn),
-                       vec_full_reg_offset(s, rm), cpu_env,
-                       is_q ? 16 : 8, vec_full_reg_size(s), 0, fn);
-}
-
 /* Expand a 3-operand + fpstatus pointer + simd data value operation using
  * an out-of-line helper.
  */
@@ -11693,29 +11681,11 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
 
     switch (opcode) {
     case 0x0: /* SQRDMLAH (vector) */
-        switch (size) {
-        case 1:
-            gen_gvec_op3_env(s, is_q, rd, rn, rm, gen_helper_gvec_qrdmlah_s16);
-            break;
-        case 2:
-            gen_gvec_op3_env(s, is_q, rd, rn, rm, gen_helper_gvec_qrdmlah_s32);
-            break;
-        default:
-            g_assert_not_reached();
-        }
+        gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_sqrdmlah_qc, size);
         return;
 
     case 0x1: /* SQRDMLSH (vector) */
-        switch (size) {
-        case 1:
-            gen_gvec_op3_env(s, is_q, rd, rn, rm, gen_helper_gvec_qrdmlsh_s16);
-            break;
-        case 2:
-            gen_gvec_op3_env(s, is_q, rd, rn, rm, gen_helper_gvec_qrdmlsh_s32);
-            break;
-        default:
-            g_assert_not_reached();
-        }
+        gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_sqrdmlsh_qc, size);
         return;
 
     case 0x2: /* SDOT / UDOT */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 676701143b..8321644f25 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3629,20 +3629,26 @@ static const uint8_t neon_2rm_sizes[] = {
     [NEON_2RM_VCVT_UF] = 0x4,
 };
 
-
-/* Expand v8.1 simd helper.  */
-static int do_v81_helper(DisasContext *s, gen_helper_gvec_3_ptr *fn,
-                         int q, int rd, int rn, int rm)
+void gen_gvec_sqrdmlah_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                          uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
 {
-    if (dc_isar_feature(aa32_rdm, s)) {
-        int opr_sz = (1 + q) * 8;
-        tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
-                           vfp_reg_offset(1, rn),
-                           vfp_reg_offset(1, rm), cpu_env,
-                           opr_sz, opr_sz, 0, fn);
-        return 0;
-    }
-    return 1;
+    static gen_helper_gvec_3_ptr * const fns[2] = {
+        gen_helper_gvec_qrdmlah_s16, gen_helper_gvec_qrdmlah_s32
+    };
+    tcg_debug_assert(vece >= 1 && vece <= 2);
+    tcg_gen_gvec_3_ptr(rd_ofs, rn_ofs, rm_ofs, cpu_env,
+                       opr_sz, max_sz, 0, fns[vece - 1]);
+}
+
+void gen_gvec_sqrdmlsh_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                          uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static gen_helper_gvec_3_ptr * const fns[2] = {
+        gen_helper_gvec_qrdmlsh_s16, gen_helper_gvec_qrdmlsh_s32
+    };
+    tcg_debug_assert(vece >= 1 && vece <= 2);
+    tcg_gen_gvec_3_ptr(rd_ofs, rn_ofs, rm_ofs, cpu_env,
+                       opr_sz, max_sz, 0, fns[vece - 1]);
 }
 
 #define GEN_CMP0(NAME, COND)                                            \
@@ -5197,13 +5203,10 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 break;  /* VPADD */
             }
             /* VQRDMLAH */
-            switch (size) {
-            case 1:
-                return do_v81_helper(s, gen_helper_gvec_qrdmlah_s16,
-                                     q, rd, rn, rm);
-            case 2:
-                return do_v81_helper(s, gen_helper_gvec_qrdmlah_s32,
-                                     q, rd, rn, rm);
+            if (dc_isar_feature(aa32_rdm, s) && (size == 1 || size == 2)) {
+                gen_gvec_sqrdmlah_qc(size, rd_ofs, rn_ofs, rm_ofs,
+                                     vec_size, vec_size);
+                return 0;
             }
             return 1;
 
@@ -5216,13 +5219,10 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 break;
             }
             /* VQRDMLSH */
-            switch (size) {
-            case 1:
-                return do_v81_helper(s, gen_helper_gvec_qrdmlsh_s16,
-                                     q, rd, rn, rm);
-            case 2:
-                return do_v81_helper(s, gen_helper_gvec_qrdmlsh_s32,
-                                     q, rd, rn, rm);
+            if (dc_isar_feature(aa32_rdm, s) && (size == 1 || size == 2)) {
+                gen_gvec_sqrdmlsh_qc(size, rd_ofs, rn_ofs, rm_ofs,
+                                     vec_size, vec_size);
+                return 0;
             }
             return 1;
 
-- 
2.20.1


