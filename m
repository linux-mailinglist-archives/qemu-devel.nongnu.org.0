Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298A66A3AF7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:54:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWMj-000114-Nb; Mon, 27 Feb 2023 00:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMQ-0007t3-EO
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:43 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWML-00073L-Tb
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:40 -0500
Received: by mail-pl1-x62c.google.com with SMTP id ky4so5588132plb.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8BcaG/n519i/UBItiVRrFltGPWM55r+QU3b/X76kpm8=;
 b=uBRKeu2Xmcd8eMU0ZConFG8KN7cYHLICJP4BWWLwIhy8BLztChKsQ3rqXClgEmg3Qt
 6ByFvOtp1TigauK7d6/Q3/vaRpTJMbJPSxagSUOUh+I0FBC1LyLdq4H+BuBELyBM+obF
 6+qCna20LN3HGmQr1cI59923FqwtjQE0lh9LfS9hX92tnY2oCK/IgJ4DDjn7wdq4ublX
 5eTdMv9G9HONpW5Ls9FEEpUKgE2fJRhwT409TgXX7OHm6yuAXdgXf6jkTSX0HSZTMnvS
 v0DXR65Pv+pp6Bsf1fCW46yIKBV39N5Rz5XGc6WhcBxRq1kQJ2ItrFBCmK3JXDwXlv4F
 nnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8BcaG/n519i/UBItiVRrFltGPWM55r+QU3b/X76kpm8=;
 b=BHjK1TBQ/qQiTPJCjXg0XmR09HTu7CLLfprFHcPfnyMOcqxET5lpB5JP0qnsjE7S5m
 StQxqlIFhoIKzudWz164HlbsnqHDsCRhsCTJJYgHR9fMIOHfytK/yJ8H6SZPba8jRvkr
 Z81Pmxj5IqrDxF9cFDVyKaTOV3A6cncFd65RQFfpkiEIBve22J05FrGT6ACs4SlNlNzl
 JkI3McaH8Y7ZxPvuGeqngHqc4Am1u8AdHceMYLN45G+M3mTjcC3IQ1JrDS4EfqJYCVsx
 HGKCrZurnaXZSPKUuVPZ1UJqyf1Wpi6v8OR7D8v9i8B17z56sygh61HqgUoGw138omld
 pQRg==
X-Gm-Message-State: AO0yUKWzpEzYf3fCv77Tf8EnLcCknhC7e6974geTQU5L6aoZxLS2aqyX
 AHQVPdAjEQLqfdcS9o1Yf9UMkIUYEjnJnNw8mRU=
X-Google-Smtp-Source: AK7set+Gubte4ly7kHRVjPlA80qOdge7fK9AyR6QjmTtuha/IENsP899GeCLb4XfpU5GpvGqyHpjSA==
X-Received: by 2002:a17:903:244c:b0:19a:95ab:6b63 with SMTP id
 l12-20020a170903244c00b0019a95ab6b63mr26740975pls.66.1677476856036; 
 Sun, 26 Feb 2023 21:47:36 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 42/70] target/ppc: Rewrite trans_ADDG6S
Date: Sun, 26 Feb 2023 19:42:05 -1000
Message-Id: <20230227054233.390271-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Compute all carry bits in parallel instead of a loop.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/fixedpoint-impl.c.inc | 44 +++++++++++-----------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 20ea484c3d..02d86b77a8 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -484,33 +484,35 @@ static bool trans_PEXTD(DisasContext *ctx, arg_X *a)
 
 static bool trans_ADDG6S(DisasContext *ctx, arg_X *a)
 {
-    const uint64_t carry_bits = 0x1111111111111111ULL;
-    TCGv t0, t1, carry, zero = tcg_constant_tl(0);
+    const target_ulong carry_bits = (target_ulong)-1 / 0xf;
+    TCGv in1, in2, carryl, carryh, tmp;
+    TCGv zero = tcg_constant_tl(0);
 
     REQUIRE_INSNS_FLAGS2(ctx, BCDA_ISA206);
 
-    t0 = tcg_temp_new();
-    t1 = tcg_const_tl(0);
-    carry = tcg_const_tl(0);
+    in1 = cpu_gpr[a->ra];
+    in2 = cpu_gpr[a->rb];
+    tmp = tcg_temp_new();
+    carryl = tcg_temp_new();
+    carryh = tcg_temp_new();
 
-    for (int i = 0; i < 16; i++) {
-        tcg_gen_shri_tl(t0, cpu_gpr[a->ra], i * 4);
-        tcg_gen_andi_tl(t0, t0, 0xf);
-        tcg_gen_add_tl(t1, t1, t0);
+    /* Addition with carry. */
+    tcg_gen_add2_tl(carryl, carryh, in1, zero, in2, zero);
+    /* Addition without carry. */
+    tcg_gen_xor_tl(tmp, in1, in2);
+    /* Difference between the two is carry in to each bit. */
+    tcg_gen_xor_tl(carryl, carryl, tmp);
 
-        tcg_gen_shri_tl(t0, cpu_gpr[a->rb], i * 4);
-        tcg_gen_andi_tl(t0, t0, 0xf);
-        tcg_gen_add_tl(t1, t1, t0);
+    /*
+     * The carry-out that we're looking for is the carry-in to
+     * the next nibble.  Shift the double-word down one nibble,
+     * which puts all of the bits back into one word.
+     */
+    tcg_gen_extract2_tl(carryl, carryl, carryh, 4);
 
-        tcg_gen_andi_tl(t1, t1, 0x10);
-        tcg_gen_setcond_tl(TCG_COND_NE, t1, t1, zero);
-
-        tcg_gen_shli_tl(t0, t1, i * 4);
-        tcg_gen_or_tl(carry, carry, t0);
-    }
-
-    tcg_gen_xori_tl(carry, carry, (target_long)carry_bits);
-    tcg_gen_muli_tl(cpu_gpr[a->rt], carry, 6);
+    /* Invert, isolate the carry bits, and produce 6's. */
+    tcg_gen_andc_tl(carryl, tcg_constant_tl(carry_bits), carryl);
+    tcg_gen_muli_tl(cpu_gpr[a->rt], carryl, 6);
     return true;
 }
 
-- 
2.34.1


