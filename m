Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4404B67C3E8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:41:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2u-0000V4-I0; Wed, 25 Jan 2023 23:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2i-0000NW-35
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:21 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2f-0004W1-Cu
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:19 -0500
Received: by mail-pl1-x631.google.com with SMTP id p24so888548plw.11
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mnJae2XWTp6f4pv/OJfYN9Mm46ElpE4QE5RfX1Hhsh4=;
 b=T9jvk25eICILkOlhVCGcpPMr1fqEhzWGbFEinlpUPsUWK5/gjp/FhJA5AruZN9da6f
 L55nHHl8+Y4Lrg1IVEd8Od0q/Cukyb648/5WOFj3rlCmSAgDiYdR/ZPZP0u3QYIdlqAS
 uPrLsA5JlFytqEyAqXFhcZh0/LKg9AMBx+3q1XkjLfipVfb83oWMx3v6cUzDu8Uy1V62
 bBVdutScixTa8dgBICVyXUeYE/ZWW4a+hBmEGQyGbclWukQgECFswAXW7v4/scuYT8pb
 6H+Q3HgkW/m6oBfx9Ib1JBlCaLop/DFCNZPRU4qTQHmgN6EMiMA2YaGJIT/PTYc3x5cz
 FQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mnJae2XWTp6f4pv/OJfYN9Mm46ElpE4QE5RfX1Hhsh4=;
 b=UkI9jj5beQGjyAHvwOyA7tWa4ArUYecZOM+7ySuk2sEowiBaIni8C1LsQLL2e2+MdS
 gsTx6YlfZMs0FpiVtIcxJoAx8lNZMUX+LEKHYNmKVUXacqo0ireH4R44NJu6anTk1whl
 0WcUGmPaXycbc9YzqkF7ZANBPBN0nPP3pqttrhdf9yt6H8jtiEgwJGXq0Buu69+xT+iC
 JKxwrwYqIrTCJMNTwkRsZ414mA85ljG7sNqyYggOCZbFsUm3zT7RLuMmh9BukBPTXwaY
 bkLhGJI0zyT0bWLCNNIvS2dvdqQQFy9go0ukah2ASCnxrQxac6UVekOlai3U3ftzu8gW
 S77Q==
X-Gm-Message-State: AFqh2kpv5rNhEQWRwgdyVjkcb14JkMjl7jyMYSCKG7QC/JD8cQ2JOiXa
 +EeV2Ri4/1VSLFyYC/bj8reBx4eTl/WzoPpQeQk=
X-Google-Smtp-Source: AMrXdXuH9y8Uzaz7g02uGZ+GABTxY4mUCxm/yS+VlFADnlX+kslxcKKoSPuI0sblU+1XgwxP/NcF6A==
X-Received: by 2002:a17:90a:5913:b0:229:c282:77c0 with SMTP id
 k19-20020a17090a591300b00229c28277c0mr32324551pji.45.1674707955456; 
 Wed, 25 Jan 2023 20:39:15 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:39:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v5 30/36] target/s390x: Use Int128 for returning float128
Date: Wed, 25 Jan 2023 18:38:18 -1000
Message-Id: <20230126043824.54819-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Remove extraneous return_low128.
Cc: David Hildenbrand <david@redhat.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/helper.h            | 22 +++++++-------
 target/s390x/tcg/insn-data.h.inc | 20 ++++++-------
 target/s390x/tcg/fpu_helper.c    | 29 +++++++++---------
 target/s390x/tcg/translate.c     | 51 +++++++++++++++++---------------
 4 files changed, 63 insertions(+), 59 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index b4170a4256..d40aeb471f 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -31,32 +31,32 @@ DEF_HELPER_4(clcle, i32, env, i32, i64, i32)
 DEF_HELPER_4(clclu, i32, env, i32, i64, i32)
 DEF_HELPER_3(cegb, i64, env, s64, i32)
 DEF_HELPER_3(cdgb, i64, env, s64, i32)
-DEF_HELPER_3(cxgb, i64, env, s64, i32)
+DEF_HELPER_3(cxgb, i128, env, s64, i32)
 DEF_HELPER_3(celgb, i64, env, i64, i32)
 DEF_HELPER_3(cdlgb, i64, env, i64, i32)
-DEF_HELPER_3(cxlgb, i64, env, i64, i32)
+DEF_HELPER_3(cxlgb, i128, env, i64, i32)
 DEF_HELPER_4(cdsg, void, env, i64, i32, i32)
 DEF_HELPER_4(cdsg_parallel, void, env, i64, i32, i32)
 DEF_HELPER_4(csst, i32, env, i32, i64, i64)
 DEF_HELPER_4(csst_parallel, i32, env, i32, i64, i64)
 DEF_HELPER_FLAGS_3(aeb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(adb, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_5(axb, TCG_CALL_NO_WG, i64, env, i64, i64, i64, i64)
+DEF_HELPER_FLAGS_5(axb, TCG_CALL_NO_WG, i128, env, i64, i64, i64, i64)
 DEF_HELPER_FLAGS_3(seb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(sdb, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_5(sxb, TCG_CALL_NO_WG, i64, env, i64, i64, i64, i64)
+DEF_HELPER_FLAGS_5(sxb, TCG_CALL_NO_WG, i128, env, i64, i64, i64, i64)
 DEF_HELPER_FLAGS_3(deb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(ddb, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_5(dxb, TCG_CALL_NO_WG, i64, env, i64, i64, i64, i64)
+DEF_HELPER_FLAGS_5(dxb, TCG_CALL_NO_WG, i128, env, i64, i64, i64, i64)
 DEF_HELPER_FLAGS_3(meeb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(mdeb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(mdb, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_5(mxb, TCG_CALL_NO_WG, i64, env, i64, i64, i64, i64)
-DEF_HELPER_FLAGS_4(mxdb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_5(mxb, TCG_CALL_NO_WG, i128, env, i64, i64, i64, i64)
+DEF_HELPER_FLAGS_4(mxdb, TCG_CALL_NO_WG, i128, env, i64, i64, i64)
 DEF_HELPER_FLAGS_2(ldeb, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_4(ldxb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
-DEF_HELPER_FLAGS_2(lxdb, TCG_CALL_NO_WG, i64, env, i64)
-DEF_HELPER_FLAGS_2(lxeb, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_2(lxdb, TCG_CALL_NO_WG, i128, env, i64)
+DEF_HELPER_FLAGS_2(lxeb, TCG_CALL_NO_WG, i128, env, i64)
 DEF_HELPER_FLAGS_3(ledb, TCG_CALL_NO_WG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_4(lexb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
 DEF_HELPER_FLAGS_3(ceb, TCG_CALL_NO_WG_SE, i32, env, i64, i64)
@@ -79,7 +79,7 @@ DEF_HELPER_3(clfdb, i64, env, i64, i32)
 DEF_HELPER_4(clfxb, i64, env, i64, i64, i32)
 DEF_HELPER_FLAGS_3(fieb, TCG_CALL_NO_WG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_3(fidb, TCG_CALL_NO_WG, i64, env, i64, i32)
-DEF_HELPER_FLAGS_4(fixb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
+DEF_HELPER_FLAGS_4(fixb, TCG_CALL_NO_WG, i128, env, i64, i64, i32)
 DEF_HELPER_FLAGS_4(maeb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(madb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(mseb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
@@ -89,7 +89,7 @@ DEF_HELPER_FLAGS_3(tcdb, TCG_CALL_NO_RWG_SE, i32, env, i64, i64)
 DEF_HELPER_FLAGS_4(tcxb, TCG_CALL_NO_RWG_SE, i32, env, i64, i64, i64)
 DEF_HELPER_FLAGS_2(sqeb, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_2(sqdb, TCG_CALL_NO_WG, i64, env, i64)
-DEF_HELPER_FLAGS_3(sqxb, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(sqxb, TCG_CALL_NO_WG, i128, env, i64, i64)
 DEF_HELPER_FLAGS_1(cvd, TCG_CALL_NO_RWG_SE, i64, s32)
 DEF_HELPER_FLAGS_4(pack, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(pka, TCG_CALL_NO_WG, void, env, i64, i64, i32)
diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index d0814cb218..517a4500ae 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -306,10 +306,10 @@
 /* CONVERT FROM FIXED */
     F(0xb394, CEFBR,   RRF_e, Z,   0, r2_32s, new, e1, cegb, 0, IF_BFP)
     F(0xb395, CDFBR,   RRF_e, Z,   0, r2_32s, new, f1, cdgb, 0, IF_BFP)
-    F(0xb396, CXFBR,   RRF_e, Z,   0, r2_32s, new_P, x1, cxgb, 0, IF_BFP)
+    F(0xb396, CXFBR,   RRF_e, Z,   0, r2_32s, new_x, x1, cxgb, 0, IF_BFP)
     F(0xb3a4, CEGBR,   RRF_e, Z,   0, r2_o, new, e1, cegb, 0, IF_BFP)
     F(0xb3a5, CDGBR,   RRF_e, Z,   0, r2_o, new, f1, cdgb, 0, IF_BFP)
-    F(0xb3a6, CXGBR,   RRF_e, Z,   0, r2_o, new_P, x1, cxgb, 0, IF_BFP)
+    F(0xb3a6, CXGBR,   RRF_e, Z,   0, r2_o, new_x, x1, cxgb, 0, IF_BFP)
 /* CONVERT TO LOGICAL */
     F(0xb39c, CLFEBR,  RRF_e, FPE, 0, e2, new, r1_32, clfeb, 0, IF_BFP)
     F(0xb39d, CLFDBR,  RRF_e, FPE, 0, f2, new, r1_32, clfdb, 0, IF_BFP)
@@ -320,10 +320,10 @@
 /* CONVERT FROM LOGICAL */
     F(0xb390, CELFBR,  RRF_e, FPE, 0, r2_32u, new, e1, celgb, 0, IF_BFP)
     F(0xb391, CDLFBR,  RRF_e, FPE, 0, r2_32u, new, f1, cdlgb, 0, IF_BFP)
-    F(0xb392, CXLFBR,  RRF_e, FPE, 0, r2_32u, new_P, x1, cxlgb, 0, IF_BFP)
+    F(0xb392, CXLFBR,  RRF_e, FPE, 0, r2_32u, new_x, x1, cxlgb, 0, IF_BFP)
     F(0xb3a0, CELGBR,  RRF_e, FPE, 0, r2_o, new, e1, celgb, 0, IF_BFP)
     F(0xb3a1, CDLGBR,  RRF_e, FPE, 0, r2_o, new, f1, cdlgb, 0, IF_BFP)
-    F(0xb3a2, CXLGBR,  RRF_e, FPE, 0, r2_o, new_P, x1, cxlgb, 0, IF_BFP)
+    F(0xb3a2, CXLGBR,  RRF_e, FPE, 0, r2_o, new_x, x1, cxlgb, 0, IF_BFP)
 
 /* CONVERT UTF-8 TO UTF-16 */
     D(0xb2a7, CU12,    RRF_c, Z,   0, 0, 0, 0, cuXX, 0, 12)
@@ -597,15 +597,15 @@
 /* LOAD FP INTEGER */
     F(0xb357, FIEBR,   RRF_e, Z,   0, e2, new, e1, fieb, 0, IF_BFP)
     F(0xb35f, FIDBR,   RRF_e, Z,   0, f2, new, f1, fidb, 0, IF_BFP)
-    F(0xb347, FIXBR,   RRF_e, Z,   x2h, x2l, new_P, x1, fixb, 0, IF_BFP)
+    F(0xb347, FIXBR,   RRF_e, Z,   x2h, x2l, new_x, x1, fixb, 0, IF_BFP)
 
 /* LOAD LENGTHENED */
     F(0xb304, LDEBR,   RRE,   Z,   0, e2, new, f1, ldeb, 0, IF_BFP)
-    F(0xb305, LXDBR,   RRE,   Z,   0, f2, new_P, x1, lxdb, 0, IF_BFP)
-    F(0xb306, LXEBR,   RRE,   Z,   0, e2, new_P, x1, lxeb, 0, IF_BFP)
+    F(0xb305, LXDBR,   RRE,   Z,   0, f2, new_x, x1, lxdb, 0, IF_BFP)
+    F(0xb306, LXEBR,   RRE,   Z,   0, e2, new_x, x1, lxeb, 0, IF_BFP)
     F(0xed04, LDEB,    RXE,   Z,   0, m2_32u, new, f1, ldeb, 0, IF_BFP)
-    F(0xed05, LXDB,    RXE,   Z,   0, m2_64, new_P, x1, lxdb, 0, IF_BFP)
-    F(0xed06, LXEB,    RXE,   Z,   0, m2_32u, new_P, x1, lxeb, 0, IF_BFP)
+    F(0xed05, LXDB,    RXE,   Z,   0, m2_64, new_x, x1, lxdb, 0, IF_BFP)
+    F(0xed06, LXEB,    RXE,   Z,   0, m2_32u, new_x, x1, lxeb, 0, IF_BFP)
     F(0xb324, LDER,    RXE,   Z,   0, e2, new, f1, lde, 0, IF_AFP1)
     F(0xed24, LDE,     RXE,   Z,   0, m2_32u, new, f1, lde, 0, IF_AFP1)
 /* LOAD ROUNDED */
@@ -835,7 +835,7 @@
 /* SQUARE ROOT */
     F(0xb314, SQEBR,   RRE,   Z,   0, e2, new, e1, sqeb, 0, IF_BFP)
     F(0xb315, SQDBR,   RRE,   Z,   0, f2, new, f1, sqdb, 0, IF_BFP)
-    F(0xb316, SQXBR,   RRE,   Z,   x2h, x2l, new_P, x1, sqxb, 0, IF_BFP)
+    F(0xb316, SQXBR,   RRE,   Z,   x2h, x2l, new_x, x1, sqxb, 0, IF_BFP)
     F(0xed14, SQEB,    RXE,   Z,   0, m2_32u, new, e1, sqeb, 0, IF_BFP)
     F(0xed15, SQDB,    RXE,   Z,   0, m2_64, new, f1, sqdb, 0, IF_BFP)
 
diff --git a/target/s390x/tcg/fpu_helper.c b/target/s390x/tcg/fpu_helper.c
index be80b2373c..13be44499b 100644
--- a/target/s390x/tcg/fpu_helper.c
+++ b/target/s390x/tcg/fpu_helper.c
@@ -34,7 +34,10 @@
 #define HELPER_LOG(x...)
 #endif
 
-#define RET128(F) (env->retxl = F.low, F.high)
+static inline Int128 RET128(float128 f)
+{
+    return int128_make128(f.low, f.high);
+}
 
 uint8_t s390_softfloat_exc_to_ieee(unsigned int exc)
 {
@@ -224,7 +227,7 @@ uint64_t HELPER(adb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
 }
 
 /* 128-bit FP addition */
-uint64_t HELPER(axb)(CPUS390XState *env, uint64_t ah, uint64_t al,
+Int128 HELPER(axb)(CPUS390XState *env, uint64_t ah, uint64_t al,
                      uint64_t bh, uint64_t bl)
 {
     float128 ret = float128_add(make_float128(ah, al),
@@ -251,7 +254,7 @@ uint64_t HELPER(sdb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
 }
 
 /* 128-bit FP subtraction */
-uint64_t HELPER(sxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
+Int128 HELPER(sxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
                      uint64_t bh, uint64_t bl)
 {
     float128 ret = float128_sub(make_float128(ah, al),
@@ -278,7 +281,7 @@ uint64_t HELPER(ddb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
 }
 
 /* 128-bit FP division */
-uint64_t HELPER(dxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
+Int128 HELPER(dxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
                      uint64_t bh, uint64_t bl)
 {
     float128 ret = float128_div(make_float128(ah, al),
@@ -314,7 +317,7 @@ uint64_t HELPER(mdeb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
 }
 
 /* 128-bit FP multiplication */
-uint64_t HELPER(mxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
+Int128 HELPER(mxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
                      uint64_t bh, uint64_t bl)
 {
     float128 ret = float128_mul(make_float128(ah, al),
@@ -325,8 +328,7 @@ uint64_t HELPER(mxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
 }
 
 /* 128/64-bit FP multiplication */
-uint64_t HELPER(mxdb)(CPUS390XState *env, uint64_t ah, uint64_t al,
-                      uint64_t f2)
+Int128 HELPER(mxdb)(CPUS390XState *env, uint64_t ah, uint64_t al, uint64_t f2)
 {
     float128 ret = float64_to_float128(f2, &env->fpu_status);
     ret = float128_mul(make_float128(ah, al), ret, &env->fpu_status);
@@ -355,7 +357,7 @@ uint64_t HELPER(ldxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
 }
 
 /* convert 64-bit float to 128-bit float */
-uint64_t HELPER(lxdb)(CPUS390XState *env, uint64_t f2)
+Int128 HELPER(lxdb)(CPUS390XState *env, uint64_t f2)
 {
     float128 ret = float64_to_float128(f2, &env->fpu_status);
     handle_exceptions(env, false, GETPC());
@@ -363,7 +365,7 @@ uint64_t HELPER(lxdb)(CPUS390XState *env, uint64_t f2)
 }
 
 /* convert 32-bit float to 128-bit float */
-uint64_t HELPER(lxeb)(CPUS390XState *env, uint64_t f2)
+Int128 HELPER(lxeb)(CPUS390XState *env, uint64_t f2)
 {
     float128 ret = float32_to_float128(f2, &env->fpu_status);
     handle_exceptions(env, false, GETPC());
@@ -486,7 +488,7 @@ uint64_t HELPER(cdgb)(CPUS390XState *env, int64_t v2, uint32_t m34)
 }
 
 /* convert 64-bit int to 128-bit float */
-uint64_t HELPER(cxgb)(CPUS390XState *env, int64_t v2, uint32_t m34)
+Int128 HELPER(cxgb)(CPUS390XState *env, int64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     float128 ret = int64_to_float128(v2, &env->fpu_status);
@@ -519,7 +521,7 @@ uint64_t HELPER(cdlgb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 }
 
 /* convert 64-bit uint to 128-bit float */
-uint64_t HELPER(cxlgb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
+Int128 HELPER(cxlgb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     float128 ret = uint64_to_float128(v2, &env->fpu_status);
@@ -748,8 +750,7 @@ uint64_t HELPER(fidb)(CPUS390XState *env, uint64_t f2, uint32_t m34)
 }
 
 /* round to integer 128-bit */
-uint64_t HELPER(fixb)(CPUS390XState *env, uint64_t ah, uint64_t al,
-                      uint32_t m34)
+Int128 HELPER(fixb)(CPUS390XState *env, uint64_t ah, uint64_t al, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     float128 ret = float128_round_to_int(make_float128(ah, al),
@@ -890,7 +891,7 @@ uint64_t HELPER(sqdb)(CPUS390XState *env, uint64_t f2)
 }
 
 /* square root 128-bit */
-uint64_t HELPER(sqxb)(CPUS390XState *env, uint64_t ah, uint64_t al)
+Int128 HELPER(sqxb)(CPUS390XState *env, uint64_t ah, uint64_t al)
 {
     float128 ret = float128_sqrt(make_float128(ah, al), &env->fpu_status);
     handle_exceptions(env, false, GETPC());
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index d25b6f3c03..0a750a5467 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1103,6 +1103,7 @@ typedef struct {
     bool g_out, g_out2, g_in1, g_in2;
     TCGv_i64 out, out2, in1, in2;
     TCGv_i64 addr1;
+    TCGv_i128 out_128;
 } DisasOps;
 
 /* Instructions can place constraints on their operands, raising specification
@@ -1461,8 +1462,7 @@ static DisasJumpType op_adb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_axb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_axb(o->out, cpu_env, o->out, o->out2, o->in1, o->in2);
-    return_low128(o->out2);
+    gen_helper_axb(o->out_128, cpu_env, o->out, o->out2, o->in1, o->in2);
     return DISAS_NEXT;
 }
 
@@ -1995,9 +1995,8 @@ static DisasJumpType op_cxgb(DisasContext *s, DisasOps *o)
     if (!m34) {
         return DISAS_NORETURN;
     }
-    gen_helper_cxgb(o->out, cpu_env, o->in2, m34);
+    gen_helper_cxgb(o->out_128, cpu_env, o->in2, m34);
     tcg_temp_free_i32(m34);
-    return_low128(o->out2);
     return DISAS_NEXT;
 }
 
@@ -2032,9 +2031,8 @@ static DisasJumpType op_cxlgb(DisasContext *s, DisasOps *o)
     if (!m34) {
         return DISAS_NORETURN;
     }
-    gen_helper_cxlgb(o->out, cpu_env, o->in2, m34);
+    gen_helper_cxlgb(o->out_128, cpu_env, o->in2, m34);
     tcg_temp_free_i32(m34);
-    return_low128(o->out2);
     return DISAS_NEXT;
 }
 
@@ -2447,8 +2445,7 @@ static DisasJumpType op_ddb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_dxb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_dxb(o->out, cpu_env, o->out, o->out2, o->in1, o->in2);
-    return_low128(o->out2);
+    gen_helper_dxb(o->out_128, cpu_env, o->out, o->out2, o->in1, o->in2);
     return DISAS_NEXT;
 }
 
@@ -2553,8 +2550,7 @@ static DisasJumpType op_fixb(DisasContext *s, DisasOps *o)
     if (!m34) {
         return DISAS_NORETURN;
     }
-    gen_helper_fixb(o->out, cpu_env, o->in1, o->in2, m34);
-    return_low128(o->out2);
+    gen_helper_fixb(o->out_128, cpu_env, o->in1, o->in2, m34);
     tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
@@ -2866,15 +2862,13 @@ static DisasJumpType op_lexb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_lxdb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_lxdb(o->out, cpu_env, o->in2);
-    return_low128(o->out2);
+    gen_helper_lxdb(o->out_128, cpu_env, o->in2);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_lxeb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_lxeb(o->out, cpu_env, o->in2);
-    return_low128(o->out2);
+    gen_helper_lxeb(o->out_128, cpu_env, o->in2);
     return DISAS_NEXT;
 }
 
@@ -3590,15 +3584,13 @@ static DisasJumpType op_mdb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_mxb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_mxb(o->out, cpu_env, o->out, o->out2, o->in1, o->in2);
-    return_low128(o->out2);
+    gen_helper_mxb(o->out_128, cpu_env, o->out, o->out2, o->in1, o->in2);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_mxdb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_mxdb(o->out, cpu_env, o->out, o->out2, o->in2);
-    return_low128(o->out2);
+    gen_helper_mxdb(o->out_128, cpu_env, o->out, o->out2, o->in2);
     return DISAS_NEXT;
 }
 
@@ -4063,8 +4055,7 @@ static DisasJumpType op_sdb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_sxb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_sxb(o->out, cpu_env, o->out, o->out2, o->in1, o->in2);
-    return_low128(o->out2);
+    gen_helper_sxb(o->out_128, cpu_env, o->out, o->out2, o->in1, o->in2);
     return DISAS_NEXT;
 }
 
@@ -4082,8 +4073,7 @@ static DisasJumpType op_sqdb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_sqxb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_sqxb(o->out, cpu_env, o->in1, o->in2);
-    return_low128(o->out2);
+    gen_helper_sqxb(o->out_128, cpu_env, o->in1, o->in2);
     return DISAS_NEXT;
 }
 
@@ -5395,6 +5385,14 @@ static void prep_new_P(DisasContext *s, DisasOps *o)
 }
 #define SPEC_prep_new_P 0
 
+static void prep_new_x(DisasContext *s, DisasOps *o)
+{
+    o->out = tcg_temp_new_i64();
+    o->out2 = tcg_temp_new_i64();
+    o->out_128 = tcg_temp_new_i128();
+}
+#define SPEC_prep_new_x 0
+
 static void prep_r1(DisasContext *s, DisasOps *o)
 {
     o->out = regs[get_field(s, r1)];
@@ -5411,11 +5409,12 @@ static void prep_r1_P(DisasContext *s, DisasOps *o)
 }
 #define SPEC_prep_r1_P SPEC_r1_even
 
-/* Whenever we need x1 in addition to other inputs, we'll load it to out/out2 */
 static void prep_x1(DisasContext *s, DisasOps *o)
 {
     o->out = load_freg(get_field(s, r1));
     o->out2 = load_freg(get_field(s, r1) + 2);
+    o->out_128 = tcg_temp_new_i128();
+    tcg_gen_concat_i64_i128(o->out_128, o->out2, o->out);
 }
 #define SPEC_prep_x1 SPEC_r1_f128
 
@@ -5513,6 +5512,8 @@ static void wout_f1(DisasContext *s, DisasOps *o)
 static void wout_x1(DisasContext *s, DisasOps *o)
 {
     int f1 = get_field(s, r1);
+
+    tcg_gen_extr_i128_i64(o->out2, o->out, o->out_128);
     store_freg(f1, o->out);
     store_freg(f1 + 2, o->out2);
 }
@@ -6588,7 +6589,9 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     if (o.addr1) {
         tcg_temp_free_i64(o.addr1);
     }
-
+    if (o.out_128) {
+        tcg_temp_free_i128(o.out_128);
+    }
     /* io should be the last instruction in tb when icount is enabled */
     if (unlikely(icount && ret == DISAS_NEXT)) {
         ret = DISAS_TOO_MANY;
-- 
2.34.1


