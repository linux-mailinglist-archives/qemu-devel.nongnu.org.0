Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D6867C3F7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:43:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2u-0000V5-HM; Wed, 25 Jan 2023 23:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2g-0000KL-V5
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:19 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2e-0004ST-21
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:18 -0500
Received: by mail-pl1-x633.google.com with SMTP id k18so918410pll.5
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+jhW1VfMMjd/T4xu5tAsEJqCQwclAn0GfVV3GJNGabg=;
 b=rPKyx/y193LPwqefZ2OllQ5y4bYyQEomrA6/AV/ML6bLOFSQ56zLKps6Rm+qsPfFm3
 i33kwwr5lbh1EmHReRNE8Zos1nNPvUYYhrIvkuZdwy3e+ALAWg1SzTL9fWE+nelJQSTM
 255CQGgJIEAE6ZbuMd6VjpYr/ooT0Eh1bx/eMEPU4DVhwj2hq4Fo9IG4Ov9w5YrCcNJm
 B8EllEr8rfbNswnoE9yy8qkR4nWxC1kjP8vxdAUWMGsOtXE+xmuvvDpo1vom0f+fpKsH
 bgjILCe44cHrBmVJR742dvh9fqJ2RMDHT/dGZ0Lx6WrfUZTCPPySJhMMOIDeV+5GqK/s
 VJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+jhW1VfMMjd/T4xu5tAsEJqCQwclAn0GfVV3GJNGabg=;
 b=R+DGlPjDv9bPvPp/xtOhBn2R4PFvuoy0/I+kmcFL06AXvsRYipPjdgGItsgBB7Dhsj
 PIs0j9ICICGyDhKtXd8IgK3bD1T/vVFSmw3Mw/yOsrWLTDedn7U8KYxxke3l4T1brgzn
 zZ8EgdCZ9iOgObKS+E6qXUnq1IoSoMKq4BCuuU7MksLC9dcfbVaM7P4kdlaHRxsxMnS5
 VATdXCvjCwahzG5fnPy1Ddc7jFuBSkb6zkvdhKN66bDmKjAzrXFziwzbWXTbYGyprYFZ
 ib18eS5ilT5tlj4aL0CcmCzTXEc+uS3eDBZplMLtFgT6o+A2m3454lCHbFznu5OTBrzS
 auGw==
X-Gm-Message-State: AO0yUKW7Nwq7LGAY0YxMfZ5zd+deksHUcJh0J9lf/GZF1dLgQlqIbtrl
 b9qtlvUx+yjDwANpbF1DjTOwFi9/XtHNSJs6Co0=
X-Google-Smtp-Source: AK7set83dTR/2eUF1KCmySVTv6Yqf8JJQZieiw0p2IlR2nfB1njFJKcNbDqgpZT4/zpueKXRbbBVUw==
X-Received: by 2002:a17:90a:31a:b0:22b:b681:2bb3 with SMTP id
 26-20020a17090a031a00b0022bb6812bb3mr762459pje.38.1674707953703; 
 Wed, 25 Jan 2023 20:39:13 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:39:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v5 29/36] target/s390x: Copy wout_x1 to wout_x1_P
Date: Wed, 25 Jan 2023 18:38:17 -1000
Message-Id: <20230126043824.54819-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Make a copy of wout_x1 before modifying it, as wout_x1_P
emphasizing that it operates on the out/out2 pair.  The insns
that use x1_P are data movement that will not change to Int128.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/insn-data.h.inc | 12 ++++++------
 target/s390x/tcg/translate.c     |  8 ++++++++
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 79c6ab509a..d0814cb218 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -422,7 +422,7 @@
     F(0x3800, LER,     RR_a,  Z,   0, e2, 0, cond_e1e2, mov2, 0, IF_AFP1 | IF_AFP2)
     F(0x7800, LE,      RX_a,  Z,   0, m2_32u, 0, e1, mov2, 0, IF_AFP1)
     F(0xed64, LEY,     RXY_a, LD,  0, m2_32u, 0, e1, mov2, 0, IF_AFP1)
-    F(0xb365, LXR,     RRE,   Z,   x2h, x2l, 0, x1, movx, 0, IF_AFP1)
+    F(0xb365, LXR,     RRE,   Z,   x2h, x2l, 0, x1_P, movx, 0, IF_AFP1)
 /* LOAD IMMEDIATE */
     C(0xc001, LGFI,    RIL_a, EI,  0, i2, 0, r1, mov2, 0)
 /* LOAD RELATIVE LONG */
@@ -461,7 +461,7 @@
     C(0xe332, LTGF,    RXY_a, GIE, 0, a2, r1, 0, ld32s, s64)
     F(0xb302, LTEBR,   RRE,   Z,   0, e2, 0, cond_e1e2, mov2, f32, IF_BFP)
     F(0xb312, LTDBR,   RRE,   Z,   0, f2, 0, f1, mov2, f64, IF_BFP)
-    F(0xb342, LTXBR,   RRE,   Z,   x2h, x2l, 0, x1, movx, f128, IF_BFP)
+    F(0xb342, LTXBR,   RRE,   Z,   x2h, x2l, 0, x1_P, movx, f128, IF_BFP)
 /* LOAD AND TRAP */
     C(0xe39f, LAT,     RXY_a, LAT, 0, m2_32u, r1, 0, lat, 0)
     C(0xe385, LGAT,    RXY_a, LAT, 0, a2, r1, 0, lgat, 0)
@@ -483,7 +483,7 @@
     C(0xb913, LCGFR,   RRE,   Z,   0, r2_32s, r1, 0, neg, neg64)
     F(0xb303, LCEBR,   RRE,   Z,   0, e2, new, e1, negf32, f32, IF_BFP)
     F(0xb313, LCDBR,   RRE,   Z,   0, f2, new, f1, negf64, f64, IF_BFP)
-    F(0xb343, LCXBR,   RRE,   Z,   x2h, x2l, new_P, x1, negf128, f128, IF_BFP)
+    F(0xb343, LCXBR,   RRE,   Z,   x2h, x2l, new_P, x1_P, negf128, f128, IF_BFP)
     F(0xb373, LCDFR,   RRE,   FPSSH, 0, f2, new, f1, negf64, 0, IF_AFP1 | IF_AFP2)
 /* LOAD COUNT TO BLOCK BOUNDARY */
     C(0xe727, LCBB,    RXE,   V,   la2, 0, r1, 0, lcbb, 0)
@@ -552,7 +552,7 @@
     C(0xb911, LNGFR,   RRE,   Z,   0, r2_32s, r1, 0, nabs, nabs64)
     F(0xb301, LNEBR,   RRE,   Z,   0, e2, new, e1, nabsf32, f32, IF_BFP)
     F(0xb311, LNDBR,   RRE,   Z,   0, f2, new, f1, nabsf64, f64, IF_BFP)
-    F(0xb341, LNXBR,   RRE,   Z,   x2h, x2l, new_P, x1, nabsf128, f128, IF_BFP)
+    F(0xb341, LNXBR,   RRE,   Z,   x2h, x2l, new_P, x1_P, nabsf128, f128, IF_BFP)
     F(0xb371, LNDFR,   RRE,   FPSSH, 0, f2, new, f1, nabsf64, 0, IF_AFP1 | IF_AFP2)
 /* LOAD ON CONDITION */
     C(0xb9f2, LOCR,    RRF_c, LOC, r1, r2, new, r1_32, loc, 0)
@@ -577,7 +577,7 @@
     C(0xb910, LPGFR,   RRE,   Z,   0, r2_32s, r1, 0, abs, abs64)
     F(0xb300, LPEBR,   RRE,   Z,   0, e2, new, e1, absf32, f32, IF_BFP)
     F(0xb310, LPDBR,   RRE,   Z,   0, f2, new, f1, absf64, f64, IF_BFP)
-    F(0xb340, LPXBR,   RRE,   Z,   x2h, x2l, new_P, x1, absf128, f128, IF_BFP)
+    F(0xb340, LPXBR,   RRE,   Z,   x2h, x2l, new_P, x1_P, absf128, f128, IF_BFP)
     F(0xb370, LPDFR,   RRE,   FPSSH, 0, f2, new, f1, absf64, 0, IF_AFP1 | IF_AFP2)
 /* LOAD REVERSED */
     C(0xb91f, LRVR,    RRE,   Z,   0, r2_32u, new, r1_32, rev32, 0)
@@ -588,7 +588,7 @@
 /* LOAD ZERO */
     F(0xb374, LZER,    RRE,   Z,   0, 0, 0, e1, zero, 0, IF_AFP1)
     F(0xb375, LZDR,    RRE,   Z,   0, 0, 0, f1, zero, 0, IF_AFP1)
-    F(0xb376, LZXR,    RRE,   Z,   0, 0, 0, x1, zero2, 0, IF_AFP1)
+    F(0xb376, LZXR,    RRE,   Z,   0, 0, 0, x1_P, zero2, 0, IF_AFP1)
 
 /* LOAD FPC */
     F(0xb29d, LFPC,    S,     Z,   0, m2_32u, 0, 0, sfpc, 0, IF_BFP)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f3e4b70ed9..d25b6f3c03 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5518,6 +5518,14 @@ static void wout_x1(DisasContext *s, DisasOps *o)
 }
 #define SPEC_wout_x1 SPEC_r1_f128
 
+static void wout_x1_P(DisasContext *s, DisasOps *o)
+{
+    int f1 = get_field(s, r1);
+    store_freg(f1, o->out);
+    store_freg(f1 + 2, o->out2);
+}
+#define SPEC_wout_x1_P SPEC_r1_f128
+
 static void wout_cond_r1r2_32(DisasContext *s, DisasOps *o)
 {
     if (get_field(s, r1) != get_field(s, r2)) {
-- 
2.34.1


