Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9C1390C97
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:00:39 +0200 (CEST)
Received: from localhost ([::1]:60120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llg2P-00066M-Mn
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0Q-0002Y2-RA
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:34 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:47087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0D-0004nY-PU
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:34 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y15so13376876pfn.13
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 15:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0La4bELq+QRQvGpWtveOOb2coHQOmlKGzXDvXUy3i7s=;
 b=W4PIKBxrD+per+6GVtdQnBXuRfHCgnIuWI6kHj7YFnIe0tD18zKt4IvjDU+SvfZLVP
 bhWkYzTDJL6bxVPBgwswCURElfyxWRF4u3ErNHgd4lnf9n8xKdDhyIP7nCzwVsUTYkx/
 T5IIdckW5gu2OO6ohiTMjorcVmwrzzqZaE1/Xgr6wb+5jQz++umw5iNRq9mC1pRRMYAs
 kvEThWs0Vu4Vu8r2CqNd8PzCwZffiWXZj6PWaJ7G2Ybao44BPQ4wddgQ3sx1WQtRv5tE
 E1P3N73QNMJYcc4bOVfcDF4dIMHdIrQtWb3hE+0byekk35mn8u5PvdSSTM4Q+FBVtSzL
 6Y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0La4bELq+QRQvGpWtveOOb2coHQOmlKGzXDvXUy3i7s=;
 b=CqBKFNFO8z2gP60lKKby/p5DfvJh9LouiXTHcPxBowBNVfOytTg5BabzT7CO1jnxxg
 xDIwlxN6rmn6nZhNZd3NbhbYTfsdARWxf0uy9U7Ojsz9DtUYWt8kFoHjteT3/Nx/67B/
 1J3OqShRxFPN64ZIQllTC46OOlBtrXKJluPMbnxSCPxs3ki0e0D/EqHF5Mr/N7MIfMA3
 8Gd2aLtQk3bts4LWrqSHUERPvSvqE4rQZVlCqV4r1x6k+KjU6d67m6r56ZOXhQcqKedg
 IvH7EOfK6ahX3zExscOG7zefv48xJ1MmH0wgrO+ckL/kHQgWg51G38vim5y3lvprl4OB
 ANfQ==
X-Gm-Message-State: AOAM530PRXwNpUUPLOepdSTmbO6uHQ1y3DC0PNuLgySrMAU8zDLKO6MG
 MRjUhM5Y1GzdgqVQpMN3jdzKggk7XHFTLQ==
X-Google-Smtp-Source: ABdhPJzin7ccYFpFtLqDVyAwmueNbKQoit/6UR1UuAQBQwJ19qmo74GY1I586OfEaxJZa3mf/SC+Ug==
X-Received: by 2002:a05:6a00:1630:b029:2c0:a1eb:d77 with SMTP id
 e16-20020a056a001630b02902c0a1eb0d77mr32345282pfc.81.1621983500454; 
 Tue, 25 May 2021 15:58:20 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/12] target/arm: Implement scalar float32 to bfloat16
 conversion
Date: Tue, 25 May 2021 15:58:08 -0700
Message-Id: <20210525225817.400336-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the 64-bit BFCVT and the 32-bit VCVT{B,T}.BF16.F32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  1 +
 target/arm/vfp.decode      |  2 ++
 target/arm/translate-a64.c | 19 +++++++++++++++++++
 target/arm/translate-vfp.c | 24 ++++++++++++++++++++++++
 target/arm/vfp_helper.c    |  5 +++++
 5 files changed, 51 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 23ccb0f72f..9977a827e9 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -143,6 +143,7 @@ DEF_HELPER_3(vfp_cmped, void, f64, f64, env)
 
 DEF_HELPER_2(vfp_fcvtds, f64, f32, env)
 DEF_HELPER_2(vfp_fcvtsd, f32, f64, env)
+DEF_HELPER_FLAGS_2(bfcvt, TCG_CALL_NO_RWG, i32, f32, ptr)
 
 DEF_HELPER_2(vfp_uitoh, f16, i32, ptr)
 DEF_HELPER_2(vfp_uitos, f32, i32, ptr)
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 6f7f28f9a4..52535d9b0b 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -205,6 +205,8 @@ VCVT_f64_f16 ---- 1110 1.11 0010 .... 1011 t:1 1.0 .... \
 
 # VCVTB and VCVTT to f16: Vd format is always vd_sp;
 # Vm format depends on size bit
+VCVT_b16_f32 ---- 1110 1.11 0011 .... 1001 t:1 1.0 .... \
+             vd=%vd_sp vm=%vm_sp
 VCVT_f16_f32 ---- 1110 1.11 0011 .... 1010 t:1 1.0 .... \
              vd=%vd_sp vm=%vm_sp
 VCVT_f16_f64 ---- 1110 1.11 0011 .... 1011 t:1 1.0 .... \
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 510cb6ca5e..90605d7dce 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6273,6 +6273,9 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     case 0x3: /* FSQRT */
         gen_helper_vfp_sqrts(tcg_res, tcg_op, cpu_env);
         goto done;
+    case 0x6: /* BFCVT */
+        gen_fpst = gen_helper_bfcvt;
+        break;
     case 0x8: /* FRINTN */
     case 0x9: /* FRINTP */
     case 0xa: /* FRINTM */
@@ -6550,6 +6553,22 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
         }
         break;
 
+    case 0x6:
+        switch (type) {
+        case 1: /* BFCVT */
+            if (!dc_isar_feature(aa64_bf16, s)) {
+                goto do_unallocated;
+            }
+            if (!fp_access_check(s)) {
+                return;
+            }
+            handle_fp_1src_single(s, opcode, rd, rn);
+            break;
+        default:
+            goto do_unallocated;
+        }
+        break;
+
     default:
     do_unallocated:
         unallocated_encoding(s);
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 3da84f30a0..d8271dbaac 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -3025,6 +3025,30 @@ static bool trans_VCVT_f64_f16(DisasContext *s, arg_VCVT_f64_f16 *a)
     return true;
 }
 
+static bool trans_VCVT_b16_f32(DisasContext *s, arg_VCVT_b16_f32 *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i32 tmp;
+
+    if (!dc_isar_feature(aa32_bf16, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = fpstatus_ptr(FPST_FPCR);
+    tmp = tcg_temp_new_i32();
+
+    vfp_load_reg32(tmp, a->vm);
+    gen_helper_bfcvt(tmp, tmp, fpst);
+    tcg_gen_st16_i32(tmp, cpu_env, vfp_f16_offset(a->vd, a->t));
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(tmp);
+    return true;
+}
+
 static bool trans_VCVT_f16_f32(DisasContext *s, arg_VCVT_f16_f32 *a)
 {
     TCGv_ptr fpst;
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 01b9d8557f..fe7a2a5daa 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -408,6 +408,11 @@ float32 VFP_HELPER(fcvts, d)(float64 x, CPUARMState *env)
     return float64_to_float32(x, &env->vfp.fp_status);
 }
 
+uint32_t HELPER(bfcvt)(float32 x, void *status)
+{
+    return float32_to_bfloat16(x, status);
+}
+
 /*
  * VFP3 fixed point conversion. The AArch32 versions of fix-to-float
  * must always round-to-nearest; the AArch64 ones honour the FPSCR
-- 
2.25.1


