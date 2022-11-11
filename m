Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBB062552A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:25:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otP6P-0001In-Nl; Fri, 11 Nov 2022 03:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP5v-0001C5-76
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:09:10 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP5r-0002Gc-OQ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:08:58 -0500
Received: by mail-pf1-x42c.google.com with SMTP id q9so4284491pfg.5
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 00:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUeMJz7YsfgeDZUDYPTq+aCxSLyRdYdEOlFDHN4TAw0=;
 b=t1+4QotfiXPairJGPniz/rtX0aJ6z7gp9/yYJMEosahw2sUeKHPMFn9vmGSVVUPotE
 PsPunkzvLlQY6pzt3FWzshRmccsWHebji71GQNvNCj6A1Mydd/jCQBJ4b6oYHgi+2IMs
 YDEKwfaeyoq8eO1WR9krQ3meJlQs10ykUaM8lzxIqaYCzq2bWrl4krzIAab9SJF1wd7p
 rJP+D1Dhu5NUw6N9hxSgAMBJKXK2bX+i+FrciRBe3Hi+FOBhU0ecJo7OpANStFEDoxxE
 C8gVN2kPAOIxZao73TbDevyFCeEqHaq2P3VzxjZH2/Q45e8cLWK1LXeO9uiIZKMENzvf
 DNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uUeMJz7YsfgeDZUDYPTq+aCxSLyRdYdEOlFDHN4TAw0=;
 b=lsiamFg+PG0APE65av//iltgVpK3hsDBSfVXjL19QIhPZo6QQjuewMYxP0P01r8bdF
 1KqAyzUcBENeIX6yw2NyMqWsA5jcPKjqA3pNHqo2QPV8gMBks8xiEnUvoVRb3lhAS7iE
 qeQ+mLAt1LIr+gfaz0qCsvsNHu8Gagp6QLA+F6NSyA2OIP9Ez6PE2bwY7rO0YIWHkFrp
 pVIZKZsyyCm/Pfi70ZtBLXFQjfBqT+fj1JdQ4Ym/Pqh4140fF8S1tlbWCYmmKImHStkI
 +djIy7J7fG6Y4AsOZyJXQcZe1bYpBbNzbKEmQMk+zWkpbq9mc9zuPKQLrCbdo6Lh977A
 BHJA==
X-Gm-Message-State: ANoB5plzMeXxL9qJnD2uR9XnlW2BLXuxS4e7GeXWeKx4anBXEKOakpVw
 oRuuuBf27lMbJHd1npxiAoZXFQ2GgOq2FAQ8
X-Google-Smtp-Source: AA0mqf44LYLop9+pO8OO51Xa20KCC0Gy76EN7SyUZdgNggYhpT1t43SsTzKCNR2H+rlYwpxL5rxmfw==
X-Received: by 2002:a05:6a00:134c:b0:56c:31e:b0f6 with SMTP id
 k12-20020a056a00134c00b0056c031eb0f6mr1689958pfu.1.1668154133340; 
 Fri, 11 Nov 2022 00:08:53 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c3c400b00186a2dd3ffdsm1046341plj.15.2022.11.11.00.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 00:08:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com,
	david@redhat.com
Subject: [PATCH for-8.0 v2 09/13] target/s390x: Copy wout_x1 to wout_x1_P
Date: Fri, 11 Nov 2022 18:08:16 +1000
Message-Id: <20221111080820.2132412-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111080820.2132412-1-richard.henderson@linaro.org>
References: <20221111080820.2132412-1-richard.henderson@linaro.org>
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
 target/s390x/tcg/translate.c     |  8 ++++++++
 target/s390x/tcg/insn-data.h.inc | 12 ++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 4ad951a46f..3b9c9d3b3a 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5516,6 +5516,14 @@ static void wout_x1(DisasContext *s, DisasOps *o)
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
diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 7e952bdfc8..87c04f89da 100644
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
-- 
2.34.1


