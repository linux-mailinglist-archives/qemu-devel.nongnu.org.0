Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B191C3DA249
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:39:40 +0200 (CEST)
Received: from localhost ([::1]:35462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94O3-00081w-Ok
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941R-0001If-7r
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:18 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940y-0001MX-Mf
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:16 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 f18-20020a05600c4e92b0290253c32620e7so6335441wmq.5
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+4FNPh8wWx4RXyOj6ISacCnC2M23ncHaene1C3j/YaM=;
 b=OLIv2jd2M+H/HHSmFzJHUZDbUlbGmLk/F5MFwmVvPoLSpSfFRVZerT34z86zGyRqIs
 KkkmKGdtdgLOvEdh8WK7PgE5HEEbq3kaRw92Ii2PY0ESHyqOvY/HPGPpziY9bt2eiYP5
 gVsHWhCWEDbLKRmKs9GLDIlQjVjL/96VpK9B+VDozYpaMWUXphpPPT7zR+Jq0jTYWDD1
 p+V4auKPmnx9WjxRNIy25RRhhoLI6UFJF4X+o2O9EroIJbMc4QcwLKdpkuuWIpybC8D8
 S2T9PEZzbaM+8mPhK+pE+oZV2NydLXLRgj7h4qg1SX/Y/GAYD8B98cYRkWqKiQ+6UnXO
 rokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+4FNPh8wWx4RXyOj6ISacCnC2M23ncHaene1C3j/YaM=;
 b=pwbMtiCSWMI1c1Lhx3jJUavVkHj+vSVuyxGIAyCsisVThbHx7b7/8cdP6KnZ/Ws6p4
 BL8vJlp2//a/9CcSafbe01UB1OuKakCNejsRhXhkW7svEci3GhzG/ihxjWHZ1HIVf6a9
 j4vM/0RSwGNfYr9hQ9nJT8CGFO0poSwd5D0A6eSYW6cMs8cfBIwsooyOFiQIanMb0e9i
 hc6bGnQjZRULXdgTOrO53pdyZNY7JnoycT2ZbciWXTdLmi+eXMZMMWZSTAR14j7DJj2C
 fHuZZHoFTZ9OvqLY1VrVTG/Soqe92B/IH50oCO/By+fUOuoHB/o8DB11yn9xQ2m5Vk/M
 bdDA==
X-Gm-Message-State: AOAM531g0VMuwl8iUgqJVujWky0Nk5xhUP8blV4+gxuJM+iVjRbPwZcD
 rV+y3HxR7jLR9JexpH06G/Z+qECZWTJxFQ==
X-Google-Smtp-Source: ABdhPJyY4KcfwvKiiWmkc5Y17bIu4dt0r3JZT2TtlS1gtJhhOQuJLTagBDCGYz+AqhqL7sn0MixK0g==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr4225734wmk.51.1627557346740; 
 Thu, 29 Jul 2021 04:15:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 38/53] target/arm: Implement MVE VCADD
Date: Thu, 29 Jul 2021 12:14:57 +0100
Message-Id: <20210729111512.16541-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VCADD insn.  Note that here the size bit is the
opposite sense to the other 2-operand fp insns.

We don't check for the sz == 1 && Qd == Qm UNPREDICTABLE case,
because that would mean we can't use the DO_2OP_FP macro in
translate-mve.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  8 ++++++++
 target/arm/mve_helper.c    | 40 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 +++-
 4 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 370876d7934..42eba8ea96d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -428,6 +428,12 @@ DEF_HELPER_FLAGS_4(mve_vmaxnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminnmh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vfcadd90h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfcadd90s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vfcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfcadd270s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index cdbfaa4245b..c728c7089ac 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -29,6 +29,8 @@
 # 2 operand fp insns have size in bit 20: 1 for 16 bit, 0 for 32 bit,
 # like Neon FP insns.
 %2op_fp_size 20:1 !function=neon_3same_fp_size
+# VCADD is an exception, where bit 20 is 0 for 16 bit and 1 for 32 bit
+%2op_fp_size_rev 20:1 !function=plus_1
 
 # 1imm format immediate
 %imm_28_16_0 28:1 16:3 0:4
@@ -125,6 +127,9 @@
 @2op_fp .... .... .... .... .... .... .... .... &2op \
         qd=%qd qn=%qn qm=%qm size=%2op_fp_size
 
+@2op_fp_size_rev .... .... .... .... .... .... .... .... &2op \
+                 qd=%qd qn=%qn qm=%qm size=%2op_fp_size_rev
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -631,3 +636,6 @@ VABD_fp           1111 1111 0 . 1 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
 
 VMAXNM            1111 1111 0 . 0 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
 VMINNM            1111 1111 0 . 1 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
+
+VCADD90_fp        1111 1100 1 . 0 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
+VCADD270_fp       1111 1101 1 . 0 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index e0e3e30de68..fd6ff167849 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2859,3 +2859,43 @@ DO_2OP_FP(vmaxnmh, 2, uint16_t, float16_maxnum)
 DO_2OP_FP(vmaxnms, 4, uint32_t, float32_maxnum)
 DO_2OP_FP(vminnmh, 2, uint16_t, float16_minnum)
 DO_2OP_FP(vminnms, 4, uint32_t, float32_minnum)
+
+#define DO_VCADD_FP(OP, ESIZE, TYPE, FN0, FN1)                          \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, void *vm)           \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        TYPE r[16 / ESIZE];                                             \
+        uint16_t tm, mask = mve_element_mask(env);                      \
+        unsigned e;                                                     \
+        float_status *fpst;                                             \
+        float_status scratch_fpst;                                      \
+        /* Calculate all results first to avoid overwriting inputs */   \
+        for (e = 0, tm = mask; e < 16 / ESIZE; e++, tm >>= ESIZE) {     \
+            if ((tm & MAKE_64BIT_MASK(0, ESIZE)) == 0) {                \
+                r[e] = 0;                                               \
+                continue;                                               \
+            }                                                           \
+            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+                &env->vfp.standard_fp_status;                           \
+            if (!(tm & 1)) {                                            \
+                /* We need the result but without updating flags */     \
+                scratch_fpst = *fpst;                                   \
+                fpst = &scratch_fpst;                                   \
+            }                                                           \
+            if (!(e & 1)) {                                             \
+                r[e] = FN0(n[H##ESIZE(e)], m[H##ESIZE(e + 1)], fpst);   \
+            } else {                                                    \
+                r[e] = FN1(n[H##ESIZE(e)], m[H##ESIZE(e - 1)], fpst);   \
+            }                                                           \
+        }                                                               \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            mergemask(&d[H##ESIZE(e)], r[e], mask);                     \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VCADD_FP(vfcadd90h, 2, uint16_t, float16_sub, float16_add)
+DO_VCADD_FP(vfcadd90s, 4, uint32_t, float32_sub, float32_add)
+DO_VCADD_FP(vfcadd270h, 2, uint16_t, float16_add, float16_sub)
+DO_VCADD_FP(vfcadd270s, 4, uint32_t, float32_add, float32_sub)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 98282335820..6203e3ff916 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -852,6 +852,8 @@ DO_2OP_FP(VMUL_fp, vfmul)
 DO_2OP_FP(VABD_fp, vfabd)
 DO_2OP_FP(VMAXNM, vmaxnm)
 DO_2OP_FP(VMINNM, vminnm)
+DO_2OP_FP(VCADD90_fp, vfcadd90)
+DO_2OP_FP(VCADD270_fp, vfcadd270)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
@@ -883,7 +885,7 @@ static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
     return true;
 }
 
-#define DO_2OP_SCALAR(INSN, FN) \
+#define DO_2OP_SCALAR(INSN, FN)                                 \
     static bool trans_##INSN(DisasContext *s, arg_2scalar *a)   \
     {                                                           \
         static MVEGenTwoOpScalarFn * const fns[] = {            \
-- 
2.20.1


