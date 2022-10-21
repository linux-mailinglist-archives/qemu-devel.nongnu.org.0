Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F9D607405
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:27:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloIq-0003cF-F5
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:26:57 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmVL-0004ak-JM
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUp-00045I-DH
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:12 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUi-0007wZ-Fn
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:10 -0400
Received: by mail-pf1-x430.google.com with SMTP id m6so1893864pfb.0
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ymTiddD9YzVqfnd9SVWz6I3uckRXrV+cPOe3DCe6XmU=;
 b=gx5zZcG3lJ82uRx91ftV0kyw5vEcKukIhQ92MFMxpH1rNDC9gmS4j5ICZIv5IuVzfs
 4ROSg5+tf2jN35KsQZFB9tvrBr3xY2hqfGXHP838cgP/fou/0SqrrGOVXj0yPrPl26oL
 2TgoutVh66RXWn4WQnDRYQIm++icktoar4pJCYXsacqFEvtbfCqtMqfQYiiid4rqoLw2
 IVlfPPRWDE+PMmwZIudhrhBS58Y7aGPFxPo7Ilx9KqvAdgdYAbmsnz6fn7xCQJU3BmFq
 DRVW8l9y4smFi0BleLg6rReTtUGYlAWlMjWEuWBo+uCByPhblEb3I+Z6+FJ5MoZ1QOfG
 gD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ymTiddD9YzVqfnd9SVWz6I3uckRXrV+cPOe3DCe6XmU=;
 b=U81MD6a4nSGSAeo2SRwBjxu0tmg3AGtAdvTvQQJAcmjinJrcG/S+n+X2EsWlc3fKKO
 srux9/liVpEmOwwHcMo5byOPdvffxabclgJnou2KMeqbUQXF7tjuVecry3YE8UFZTt+p
 gXxqpfkJ326LI+ZfKklYEf6jeBYH1xGkuqbakxLDAu1uL25sEz1sMV6GH07HI+Rnzjc3
 C68vD5Au69xtyJkHksQfD2NC4ImFyfp+pSNcdo9o/Eyrr2yuQkuF5Zwb9RNouKG1sJWQ
 WX2EFbQQ6WMg0sCPI6wMarmW4Wj335Dp6JKzIiG1i2EQBNOOP9Y+9vSbU6U9chlZkP9x
 OoEA==
X-Gm-Message-State: ACrzQf0nPO0FeOsBHMZTOhUNceJyErl7m8BNJdfZ0BZt2IqZ0a4PcChE
 Gl3i1Pf/Ghu4NTkSImIa8GmHt5mJa1qpveOY
X-Google-Smtp-Source: AMsMyM4gbD21DHpMDR7wwCpx0HP81FzWLuvMK8EMMxen96/iu31QJQChHAj/7kd3oqDd7uEc/inPqg==
X-Received: by 2002:a63:cf48:0:b0:439:7d1c:fedc with SMTP id
 b8-20020a63cf48000000b004397d1cfedcmr15411307pgj.281.1666337461010; 
 Fri, 21 Oct 2022 00:31:01 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a17090a6d8900b002008d0e5cb5sm1042721pjk.47.2022.10.21.00.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:31:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 6/9] target/s390x: Copy wout_x1 to wout_x1_P
Date: Fri, 21 Oct 2022 17:30:03 +1000
Message-Id: <20221021073006.2398819-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021073006.2398819-1-richard.henderson@linaro.org>
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Make a copy of wout_x1 before modifying it, as wout_x1_P
emphasizing that it operates on the out/out2 pair.  The insns
that use x1_P are data movement that will not change to Int128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c   |  8 ++++++++
 target/s390x/tcg/insn-data.def | 12 ++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 8dc4f4b5ec..15c1a2067e 100644
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
diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 6382ceabfc..83e246ab16 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
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


