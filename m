Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BCD681D34
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:50:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc29-0002ie-Kg; Mon, 30 Jan 2023 16:49:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1y-0002Y7-Vv
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:39 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1w-0005id-Uk
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:38 -0500
Received: by mail-pl1-x62b.google.com with SMTP id e6so4876205plg.12
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+jhW1VfMMjd/T4xu5tAsEJqCQwclAn0GfVV3GJNGabg=;
 b=HwKET3Vb1qJPQ+FHgP4nyXgjA1CyDShpprs1RA+gTUFiLn9VCl1dskM+ujYO922kac
 jyqyEdGV7I+lPtR4bGij822dviSpgzQPEPuXWGyf1MQ3qv0tPOz5wSkWyjIhimIxCK8I
 BPZC7/9rlvV7Ka7mzUKJR7VVc0S/VaiP/4UrUzJ0shHAjExilGwiEva4xcdd9FMTHuvB
 kXLf2qiE/osKJDvECOuCSmVVml3CdSRaMvDk92jT37sazeV+yuQbK3ThSJKwrBTx6BLG
 XWA0/q4wWfAHhg8Hrs623Nx820G8Gms84KwwBh6u9IcsAnG5jOSAdejHoV0Xp9T5Z9P3
 zGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+jhW1VfMMjd/T4xu5tAsEJqCQwclAn0GfVV3GJNGabg=;
 b=fxEaFG6Rqb1nxZaPVTg33RH/TmA10HmHEWPTnu6VX9GhMJrl29kyRo8V4d8tldY/d9
 yn4akfwKOxx6EPU6uI0JaB14qWk4yWmaNzSuNfLIQ8IujFfamRHTlptRwk1t+CQDLryh
 0l9K1ips6Q3tI+/26wkYhaUmJa/JhVXWc4hetV7UhDFjMm00Wl5D+5Zae2J59zPC9Ox2
 Mqpfpx+YDfTyMPYqICnmSXwWMrBt2Vb+6zpUGvf39v1mZsG0Av7CDTEmmul0OOU5GMJs
 SfQ6aVfvOSgsyBs1g19rYCCqs+ulYBdjCBsfdc18C3PBGgXdgnLdhPNsb3X1dZmrLdlE
 0ZlQ==
X-Gm-Message-State: AO0yUKXHFh5NO5gWd5YkcI40Nnhy092wbA+tUtYnKzii4rUwi8EpqhFn
 9/6Jd0prThMjm76nNmwDR911n30GnW6A9WQ5
X-Google-Smtp-Source: AK7set8pypnNHuQ8voSnVjgnwcUwjn7u6QrcDxAS6HEZkuA6d0+NKnA+iTsU9InzA1W5V20b+1WAfQ==
X-Received: by 2002:a17:90b:4a04:b0:22c:afa2:4783 with SMTP id
 kk4-20020a17090b4a0400b0022cafa24783mr4578518pjb.39.1675115375431; 
 Mon, 30 Jan 2023 13:49:35 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:49:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v6 29/36] target/s390x: Copy wout_x1 to wout_x1_P
Date: Mon, 30 Jan 2023 11:48:37 -1000
Message-Id: <20230130214844.1158612-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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


