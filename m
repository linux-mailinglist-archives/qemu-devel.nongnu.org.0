Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A965BF0D8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:07:34 +0200 (CEST)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamKy-0004z1-PJ
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8a-0001Pp-NN; Tue, 20 Sep 2022 15:42:34 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:35768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8W-0001qN-2s; Tue, 20 Sep 2022 15:42:29 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1225219ee46so5846120fac.2; 
 Tue, 20 Sep 2022 12:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WAJgHNP9xMmbGHWetcgLCFG0MsnclYQhqElRdhdXHqA=;
 b=eNDVi+Nb1UwN78WhRs5ChjtTeOIHz4wzSNcYw37O6Kh/HcqncaHKvsDepMvxE1N59j
 LQOM6+iFC/ZyT8/O+2xnMVJ3RUIb1x3Cs6bXe/jYtGJILY6NeE6Zr3x1D2D96R0xR3iP
 F+xuVqiCSQ0BG72Gi3RVI9ckbstbCSTveTI8+ekYWUFEoGTfyxriVD/cpGq3uX9ZbyGT
 Klfk30tSdDFI6kqgWzGPwty/tsPHRprTyyP2l8dB5y1/4qyL+GrXBSH1bniLbtZDh+vl
 SC7AdiCwvLl5O4WMsM6WTxkd5Nn+UE03w5S49DkxpBJ2nI7ATQzDh4St+PAxVlYDBVzh
 Q4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WAJgHNP9xMmbGHWetcgLCFG0MsnclYQhqElRdhdXHqA=;
 b=Qzb1tp9ivjpSgYDcpLyomHG5fEH/Q2xCJ7WjKp7xWsDAVouJMBD0EVqV2idlaQhElc
 aAxCXOTsDnXFDlTZZZp77NlQNPqvLjkQoJULJlgF2ddS/wHwMx4ST+iY/BZ7+BzO1MNY
 WSQKDYtP81crlfw4ulXz+boP0KHoaToeCWsbbdFLnmFPKRdleNDyfCUcpruyX8w+eHVt
 KPQixjRCOLoKH1uIFTVVOxSdQdRH/M03a1lBPObCv65oGN3/LOi6MtkiFGOPFl4DMUR3
 Xo8/RIu4QpWefto6mJMyKv/ZOt6blqrFUDUzEcP6ROppJyu+S+/qi3QhyvhHeswI9t9G
 r47A==
X-Gm-Message-State: ACrzQf3iNXEu647JLE5Y9raXmONaFnsCg6vs7Vw6PRn+rrXtEwdEgn3Y
 HlY9PXlJ1V1ZMYcZq9FYkOW291EMt2Y=
X-Google-Smtp-Source: AMsMyM6H+f0jVcmHCkkChpcqchXdNux6IoExtb3tprdMFATV4cgxg7o9ksLfBGaRTe0OLDXLF0JNaQ==
X-Received: by 2002:a05:6870:1719:b0:126:4acd:fc16 with SMTP id
 h25-20020a056870171900b001264acdfc16mr2991318oae.295.1663702946424; 
 Tue, 20 Sep 2022 12:42:26 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:25 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 06/17] target/ppc: Merge fsqrt and fsqrts helpers
Date: Tue, 20 Sep 2022 16:41:51 -0300
Message-Id: <20220920194202.82615-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

These two helpers are almost identical, differing only by the softfloat
operation it calls. Merge them into one using a macro.
Also, take this opportunity to capitalize the helper name as we moved
the instruction to decodetree in a previous patch.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220905123746.54659-4-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/fpu_helper.c            | 35 +++++++++++-------------------
 target/ppc/helper.h                |  4 ++--
 target/ppc/translate/fp-impl.c.inc |  4 ++--
 3 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 0f045b70f8..32995179b5 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -830,30 +830,21 @@ static void float_invalid_op_sqrt(CPUPPCState *env, int flags,
     }
 }
 
-/* fsqrt - fsqrt. */
-float64 helper_fsqrt(CPUPPCState *env, float64 arg)
-{
-    float64 ret = float64_sqrt(arg, &env->fp_status);
-    int flags = get_float_exception_flags(&env->fp_status);
-
-    if (unlikely(flags & float_flag_invalid)) {
-        float_invalid_op_sqrt(env, flags, 1, GETPC());
-    }
-
-    return ret;
+#define FPU_FSQRT(name, op)                                                   \
+float64 helper_##name(CPUPPCState *env, float64 arg)                          \
+{                                                                             \
+    float64 ret = op(arg, &env->fp_status);                                   \
+    int flags = get_float_exception_flags(&env->fp_status);                   \
+                                                                              \
+    if (unlikely(flags & float_flag_invalid)) {                               \
+        float_invalid_op_sqrt(env, flags, 1, GETPC());                        \
+    }                                                                         \
+                                                                              \
+    return ret;                                                               \
 }
 
-/* fsqrts - fsqrts. */
-float64 helper_fsqrts(CPUPPCState *env, float64 arg)
-{
-    float64 ret = float64r32_sqrt(arg, &env->fp_status);
-    int flags = get_float_exception_flags(&env->fp_status);
-
-    if (unlikely(flags & float_flag_invalid)) {
-        float_invalid_op_sqrt(env, flags, 1, GETPC());
-    }
-    return ret;
-}
+FPU_FSQRT(FSQRT, float64_sqrt)
+FPU_FSQRT(FSQRTS, float64r32_sqrt)
 
 /* fre - fre. */
 float64 helper_fre(CPUPPCState *env, float64 arg)
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 122b2e9359..57eee07256 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -120,8 +120,8 @@ DEF_HELPER_4(fmadds, i64, env, i64, i64, i64)
 DEF_HELPER_4(fmsubs, i64, env, i64, i64, i64)
 DEF_HELPER_4(fnmadds, i64, env, i64, i64, i64)
 DEF_HELPER_4(fnmsubs, i64, env, i64, i64, i64)
-DEF_HELPER_2(fsqrt, f64, env, f64)
-DEF_HELPER_2(fsqrts, f64, env, f64)
+DEF_HELPER_2(FSQRT, f64, env, f64)
+DEF_HELPER_2(FSQRTS, f64, env, f64)
 DEF_HELPER_2(fre, i64, env, i64)
 DEF_HELPER_2(fres, i64, env, i64)
 DEF_HELPER_2(frsqrte, i64, env, i64)
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 7a90c0e350..8d5cf0f982 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -280,8 +280,8 @@ static bool do_helper_fsqrt(DisasContext *ctx, arg_A_tb *a,
     return true;
 }
 
-TRANS(FSQRT, do_helper_fsqrt, gen_helper_fsqrt);
-TRANS(FSQRTS, do_helper_fsqrt, gen_helper_fsqrts);
+TRANS(FSQRT, do_helper_fsqrt, gen_helper_FSQRT);
+TRANS(FSQRTS, do_helper_fsqrt, gen_helper_FSQRTS);
 
 /***                     Floating-Point multiply-and-add                   ***/
 /* fmadd - fmadds */
-- 
2.37.3


