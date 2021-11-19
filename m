Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147CD457281
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:11:34 +0100 (CET)
Received: from localhost ([::1]:38182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6U9-0006y5-6a
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:11:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OK-0005An-JB
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:32 -0500
Received: from [2a00:1450:4864:20::42f] (port=37439
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OJ-0004Bl-0i
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:32 -0500
Received: by mail-wr1-x42f.google.com with SMTP id b12so18962547wrh.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i+3SfBk4A8GyHprhfsRB3XJGml1looXGTmRLZvAnNJ4=;
 b=ypuLfJVVp0FPFTzqUAWOxOx/0pgzgZ4rrqKzmrOvyBzaHlebjFD1LpfTIhYJF7d+Il
 GvKajwIP6g5xnMrZ8GBolP3HKfjbtV4MFwEuR2slvL9KkPuqt7Dh5oyqi/ZJOslto6gm
 UqTyKj/92+vA4WNl783pZC/6n8+MANAugBG48sp08sDpzDYifYFSMfoMQsimv4OAQ5ql
 wK+w0LF7eEDh9OIaWcnhBUgRZ82aXQQgO1w0rdOxj6SkcOarrrH0Q/g5CT5Fxl89DXA8
 2fTCpxeV3P/baCwsKpJQL6DyxzSoJHD49KETu5Ycc/cQR0NWf+9ifbM5Ifk9i4ea7MLP
 Etvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i+3SfBk4A8GyHprhfsRB3XJGml1looXGTmRLZvAnNJ4=;
 b=kGkECY+DK13BmibdWq/t8QCWkFJwcXW9VJPSotCADuGFzBtaxHEhfK0xT+8zkgQ+yk
 kZQ8J5O4CJDdWwkIsE4qVzOGU7d0JFFaztrZrc8fCxbRlfSQW6A7BgxRT1aBNpHBaF7H
 YvYeUgVXbat4+ifx3VUwmICzFP/yfyyD4fZm/qtXEeN3Ytj/vg7fk+qHaxIpvqgIOJwH
 O/w9H0tPjxSdkX7wLPO3Fjk9Amp+nzEeDauPCi7y+jm8TCUl/8CjWHGycC2Di/nfs9KU
 Nr+XAukC/PKqSKmkvMin97XuqWQqq/6Kxb7xKjHLFdxy71XcWnSibudgLSmhmwtweMGT
 OonA==
X-Gm-Message-State: AOAM530Tz1/VpovLyYzh+N/TIOhdm1O02z8gNX5nBgSMHLfDP5V/EUhw
 Al8kIjVVhBnnnAE59sc15vsfbrDac1IFV5J43gQ=
X-Google-Smtp-Source: ABdhPJyK/b9LFFtXsQuI2xB/1Lt1lRhqJY2VUA/2ebeBIToFNXswgEp26LLVNOSAEG3Iz9gju851rQ==
X-Received: by 2002:adf:e882:: with SMTP id d2mr8743244wrm.389.1637337929604; 
 Fri, 19 Nov 2021 08:05:29 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/35] target/ppc: Update float_invalid_op_mul for new flags
Date: Fri, 19 Nov 2021 17:04:36 +0100
Message-Id: <20211119160502.17432-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that vximz and vxsnan are computed directly by
softfloat, we don't need to recompute it via classes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f0deada84b..23264e6528 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -486,13 +486,12 @@ float64 helper_fsub(CPUPPCState *env, float64 arg1, float64 arg2)
     return ret;
 }
 
-static void float_invalid_op_mul(CPUPPCState *env, bool set_fprc,
-                                 uintptr_t retaddr, int classes)
+static void float_invalid_op_mul(CPUPPCState *env, int flags,
+                                 bool set_fprc, uintptr_t retaddr)
 {
-    if ((classes & (is_zero | is_inf)) == (is_zero | is_inf)) {
-        /* Multiplication of zero by infinity */
+    if (flags & float_flag_invalid_imz) {
         float_invalid_op_vximz(env, set_fprc, retaddr);
-    } else if (classes & is_snan) {
+    } else if (flags & float_flag_invalid_snan) {
         float_invalid_op_vxsnan(env, retaddr);
     }
 }
@@ -501,12 +500,10 @@ static void float_invalid_op_mul(CPUPPCState *env, bool set_fprc,
 float64 helper_fmul(CPUPPCState *env, float64 arg1, float64 arg2)
 {
     float64 ret = float64_mul(arg1, arg2, &env->fp_status);
-    int status = get_float_exception_flags(&env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
 
-    if (unlikely(status & float_flag_invalid)) {
-        float_invalid_op_mul(env, 1, GETPC(),
-                             float64_classify(arg1) |
-                             float64_classify(arg2));
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_mul(env, flags, 1, GETPC());
     }
 
     return ret;
@@ -1687,9 +1684,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                            \
         env->fp_status.float_exception_flags |= tstat.float_exception_flags; \
                                                                              \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
-            float_invalid_op_mul(env, sfprf, GETPC(),                        \
-                                 tp##_classify(xa->fld) |                    \
-                                 tp##_classify(xb->fld));                    \
+            float_invalid_op_mul(env, tstat.float_exception_flags,           \
+                                 sfprf, GETPC());                            \
         }                                                                    \
                                                                              \
         if (r2sp) {                                                          \
@@ -1727,9 +1723,7 @@ void helper_xsmulqp(CPUPPCState *env, uint32_t opcode,
     env->fp_status.float_exception_flags |= tstat.float_exception_flags;
 
     if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
-        float_invalid_op_mul(env, 1, GETPC(),
-                             float128_classify(xa->f128) |
-                             float128_classify(xb->f128));
+        float_invalid_op_mul(env, tstat.float_exception_flags, 1, GETPC());
     }
     helper_compute_fprf_float128(env, t.f128);
 
-- 
2.25.1


