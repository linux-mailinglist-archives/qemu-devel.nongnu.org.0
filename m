Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDA14C3036
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 16:46:28 +0100 (CET)
Received: from localhost ([::1]:50422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGK3-0006A6-SP
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 10:46:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHO-0003KL-I0
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:42 -0500
Received: from [2607:f8b0:4864:20::52a] (port=35761
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHM-0008Ij-6C
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:42 -0500
Received: by mail-pg1-x52a.google.com with SMTP id e6so652209pgn.2
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 07:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YTdK1uFf1oD/KGoQHOijSrzYKID7dMtbz7KPdNZzw4M=;
 b=Ec6d2mMVgBijXOWvHAmiAA8H1Iopag89DE/A8zvBKD6wM4koAXsjRN5kBHzTVRLUVT
 hyhWvKWM7n6uTZCfsvRRGeyzHfrNGX8csN0wOW6l0HRxpbAgrXAPwJjQcTctVgJtyuNv
 k//i7eXn7tROyvMoMmWASZsy01/nGRENzjtWk5YVf56O/xN2gJHeaU3nWgYIXuRUCPwT
 eDKAEMHyFQ1NB72He3SavAKs2zzESIiHT7s84qXQSqq+wUf8J8aPQDztw2yyeJkMpPpb
 cadOZwbC3+3EnVnz1AknHRYHwaENhMFJv1tObLa+Os6tOCKkHhZWubZiio1o1ToeGSIc
 GJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YTdK1uFf1oD/KGoQHOijSrzYKID7dMtbz7KPdNZzw4M=;
 b=CRPdKy1KXOIFdkETidHOuxwYtCgYc4IWHjYXZ+APymieJeSgUBWtJyvZRKwqB9Pe2+
 a38RLh6eHv8KBIFHF5aurc4ODub+dlyEa78ISnXik5nGzfS5PKwEQBauHN8+m+AWMaJ0
 RPqIIUAZrc+TT8EM15BCTBBBaCchyjasnhFwfy6cuHKMWOVf0C4RKborJ0hlVFdYcVWk
 nAE2Q5yl9XAry4jwyLac0iBQbyZrJLG7nz4lxuXhqXq1cRV/kE2hreZQ9QdpwkPjHOnv
 eZfWO4xWXBxKxHbvQgazubPZXj5FPpP8I8MyqjE8xhu8pw6vIkJ/snU8p9dv+xFQThPX
 ryjw==
X-Gm-Message-State: AOAM533Nm7n87ZzlUcFODPe/5+f/6w0WjtbTp8FfdWpeYyssvg2MkUOB
 RyRpHV+i6ghMczdX9rxL0WOtWLmyNEevlg==
X-Google-Smtp-Source: ABdhPJyhKUbNcc8BMnPVlgVwedsIg/Ux45+d6uoI1MBNmI0bQ3DSVfh+BQwkkAL+uufqdIL/kAfRoA==
X-Received: by 2002:a63:a510:0:b0:375:7af2:9c87 with SMTP id
 n16-20020a63a510000000b003757af29c87mr2711849pgf.498.1645717418999; 
 Thu, 24 Feb 2022 07:43:38 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id v20sm3198062pju.9.2022.02.24.07.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:43:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/10] tcg/s390x: Distinguish RIE formats
Date: Thu, 24 Feb 2022 05:43:25 -1000
Message-Id: <20220224154333.125185-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224154333.125185-1-richard.henderson@linaro.org>
References: <20220224154333.125185-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, david@redhat.com, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are multiple variations, with different fields.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 47 +++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index b9859251a4..c1cea8b1fe 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -139,16 +139,19 @@ typedef enum S390Opcode {
     RI_OILL     = 0xa50b,
     RI_TMLL     = 0xa701,
 
-    RIE_CGIJ    = 0xec7c,
-    RIE_CGRJ    = 0xec64,
-    RIE_CIJ     = 0xec7e,
-    RIE_CLGRJ   = 0xec65,
-    RIE_CLIJ    = 0xec7f,
-    RIE_CLGIJ   = 0xec7d,
-    RIE_CLRJ    = 0xec77,
-    RIE_CRJ     = 0xec76,
-    RIE_LOCGHI  = 0xec46,
-    RIE_RISBG   = 0xec55,
+    RIEb_CGRJ    = 0xec64,
+    RIEb_CLGRJ   = 0xec65,
+    RIEb_CLRJ    = 0xec77,
+    RIEb_CRJ     = 0xec76,
+
+    RIEc_CGIJ    = 0xec7c,
+    RIEc_CIJ     = 0xec7e,
+    RIEc_CLGIJ   = 0xec7d,
+    RIEc_CLIJ    = 0xec7f,
+
+    RIEf_RISBG   = 0xec55,
+
+    RIEg_LOCGHI  = 0xec46,
 
     RRE_AGR     = 0xb908,
     RRE_ALGR    = 0xb90a,
@@ -565,7 +568,7 @@ static void tcg_out_insn_RI(TCGContext *s, S390Opcode op, TCGReg r1, int i2)
     tcg_out32(s, (op << 16) | (r1 << 20) | (i2 & 0xffff));
 }
 
-static void tcg_out_insn_RIE(TCGContext *s, S390Opcode op, TCGReg r1,
+static void tcg_out_insn_RIEg(TCGContext *s, S390Opcode op, TCGReg r1,
                              int i2, int m3)
 {
     tcg_out16(s, (op & 0xff00) | (r1 << 4) | m3);
@@ -1058,9 +1061,9 @@ static inline void tcg_out_risbg(TCGContext *s, TCGReg dest, TCGReg src,
                                  int msb, int lsb, int ofs, int z)
 {
     /* Format RIE-f */
-    tcg_out16(s, (RIE_RISBG & 0xff00) | (dest << 4) | src);
+    tcg_out16(s, (RIEf_RISBG & 0xff00) | (dest << 4) | src);
     tcg_out16(s, (msb << 8) | (z << 7) | lsb);
-    tcg_out16(s, (ofs << 8) | (RIE_RISBG & 0xff));
+    tcg_out16(s, (ofs << 8) | (RIEf_RISBG & 0xff));
 }
 
 static void tgen_ext8s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
@@ -1451,7 +1454,7 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
         /* Emit: d = 0, d = (cc ? 1 : d).  */
         cc = tgen_cmp(s, type, cond, c1, c2, c2const, false);
         tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
-        tcg_out_insn(s, RIE, LOCGHI, dest, 1, cc);
+        tcg_out_insn(s, RIEg, LOCGHI, dest, 1, cc);
         return;
     }
 
@@ -1544,7 +1547,7 @@ static void tgen_movcond(TCGContext *s, TCGType type, TCGCond c, TCGReg dest,
     if (HAVE_FACILITY(LOAD_ON_COND)) {
         cc = tgen_cmp(s, type, c, c1, c2, c2const, false);
         if (v3const) {
-            tcg_out_insn(s, RIE, LOCGHI, dest, v3, cc);
+            tcg_out_insn(s, RIEg, LOCGHI, dest, v3, cc);
         } else {
             tcg_out_insn(s, RRFc, LOCGR, dest, v3, cc);
         }
@@ -1631,6 +1634,7 @@ static void tgen_compare_branch(TCGContext *s, S390Opcode opc, int cc,
                                 TCGReg r1, TCGReg r2, TCGLabel *l)
 {
     tcg_out_reloc(s, s->code_ptr + 1, R_390_PC16DBL, l, 2);
+    /* Format RIE-b */
     tcg_out16(s, (opc & 0xff00) | (r1 << 4) | r2);
     tcg_out16(s, 0);
     tcg_out16(s, cc << 12 | (opc & 0xff));
@@ -1640,6 +1644,7 @@ static void tgen_compare_imm_branch(TCGContext *s, S390Opcode opc, int cc,
                                     TCGReg r1, int i2, TCGLabel *l)
 {
     tcg_out_reloc(s, s->code_ptr + 1, R_390_PC16DBL, l, 2);
+    /* Format RIE-c */
     tcg_out16(s, (opc & 0xff00) | (r1 << 4) | cc);
     tcg_out16(s, 0);
     tcg_out16(s, (i2 << 8) | (opc & 0xff));
@@ -1659,8 +1664,8 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond c,
 
         if (!c2const) {
             opc = (type == TCG_TYPE_I32
-                   ? (is_unsigned ? RIE_CLRJ : RIE_CRJ)
-                   : (is_unsigned ? RIE_CLGRJ : RIE_CGRJ));
+                   ? (is_unsigned ? RIEb_CLRJ : RIEb_CRJ)
+                   : (is_unsigned ? RIEb_CLGRJ : RIEb_CGRJ));
             tgen_compare_branch(s, opc, cc, r1, c2, l);
             return;
         }
@@ -1671,18 +1676,18 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond c,
            larger comparison range afforded by COMPARE IMMEDIATE.  */
         if (type == TCG_TYPE_I32) {
             if (is_unsigned) {
-                opc = RIE_CLIJ;
+                opc = RIEc_CLIJ;
                 in_range = (uint32_t)c2 == (uint8_t)c2;
             } else {
-                opc = RIE_CIJ;
+                opc = RIEc_CIJ;
                 in_range = (int32_t)c2 == (int8_t)c2;
             }
         } else {
             if (is_unsigned) {
-                opc = RIE_CLGIJ;
+                opc = RIEc_CLGIJ;
                 in_range = (uint64_t)c2 == (uint8_t)c2;
             } else {
-                opc = RIE_CGIJ;
+                opc = RIEc_CGIJ;
                 in_range = (int64_t)c2 == (int8_t)c2;
             }
         }
-- 
2.25.1


