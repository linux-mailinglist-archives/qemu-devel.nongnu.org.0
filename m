Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC45C6400B9
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:55:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zuC-0007b5-BO; Fri, 02 Dec 2022 01:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu7-0007Zn-4K
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:14 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu4-0003fs-Sz
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:10 -0500
Received: by mail-pl1-x633.google.com with SMTP id w23so3806296ply.12
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 22:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Izp6/1cScQHTbPzRYt8a/mj2s7C9kjdu18CHy562wow=;
 b=O67t/Mt2axi4lKLDUPRAnAKsFNnqtbhiFlxYofuZf377WoXMZW0JzAm2fqkiC/lTQR
 6y5lYYTCg6tcKmNBbe/u7sWOSNBIrVDTtbXEvyOIcc8W22SZzHJ+U9mvTRhzCX5aZcOk
 JnX2M9Upx1mEQ2gUbuzHEF9P9D+FW9S2/X5+kE0zPfylGD3/cR/7HX+XSNw26m0DfwIX
 CPrL5n7s2ppbpn2q/+rXqQJxff4FcMAZhS0a559dRpZ4D2d6+qwAk2sH3yZUY2TkGKR9
 FnH3UMtNclu0zBGCplZ8yJ9u67m6Chi6HOEJURek5FnEy51R8HAhdmlCR+TYeRz2wCVH
 BckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Izp6/1cScQHTbPzRYt8a/mj2s7C9kjdu18CHy562wow=;
 b=3Wthfhp0KsOvUKl4ChgDUbOWlZhQCBBnExuYocUSJceyD3jTge/EjiUzNOhR9Y1Pww
 wVlPf6VHdWc1fUpMi8zltHoIrI3chxCQFXkUDHfn3bkZtCJjHt4Zv00Ukbsz0+3UujiW
 VH3E4W/aJFp3NQmvJRNH1yF1ffHcE0i+9Y4sB0O3kjlorZp7HZCcQIVjkNS9aJ/5VaV0
 AyflTR84jMtTCaHckfPtjTZjezhJ+/2np0K+fw03dURo3VIBhVmu7ueJ25fDSFXVUEyA
 GVo5JXuLbNk1Pv4Svfc1nLn2MHcdFhMPz9trlXIfMWmkn6UiN557mGpt9mY7YedEYzPY
 mmVg==
X-Gm-Message-State: ANoB5plBlSIzptJnov5+G2+4dDRRokv/2YC9bhiW481pNrfIGMhhTAUC
 xeiKD7+Gw7l16Hlxo9bzK564Mj8MKN2bU5+N
X-Google-Smtp-Source: AA0mqf5UZ65XoNYWNHLCZdefNK1aLzJvyztipWyJ3W0sd3dCZy87iUObvdgOfoZOtaj9l5PanwFs0w==
X-Received: by 2002:a17:902:8217:b0:186:a5a7:cc3d with SMTP id
 x23-20020a170902821700b00186a5a7cc3dmr50363486pln.42.1669963926519; 
 Thu, 01 Dec 2022 22:52:06 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a17c300b00218d894fac3sm6056649pja.3.2022.12.01.22.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 22:52:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v3 05/13] tcg/s390x: Distinguish RIE formats
Date: Thu,  1 Dec 2022 22:51:52 -0800
Message-Id: <20221202065200.224537-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202065200.224537-1-richard.henderson@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
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

There are multiple variations, with different fields.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 47 +++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index a489b3359e..d02b433271 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -133,16 +133,19 @@ typedef enum S390Opcode {
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
@@ -561,7 +564,7 @@ static void tcg_out_insn_RI(TCGContext *s, S390Opcode op, TCGReg r1, int i2)
     tcg_out32(s, (op << 16) | (r1 << 20) | (i2 & 0xffff));
 }
 
-static void tcg_out_insn_RIE(TCGContext *s, S390Opcode op, TCGReg r1,
+static void tcg_out_insn_RIEg(TCGContext *s, S390Opcode op, TCGReg r1,
                              int i2, int m3)
 {
     tcg_out16(s, (op & 0xff00) | (r1 << 4) | m3);
@@ -1008,9 +1011,9 @@ static inline void tcg_out_risbg(TCGContext *s, TCGReg dest, TCGReg src,
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
@@ -1350,7 +1353,7 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
         /* Emit: d = 0, d = (cc ? 1 : d).  */
         cc = tgen_cmp(s, type, cond, c1, c2, c2const, false);
         tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
-        tcg_out_insn(s, RIE, LOCGHI, dest, 1, cc);
+        tcg_out_insn(s, RIEg, LOCGHI, dest, 1, cc);
         return;
     }
 
@@ -1443,7 +1446,7 @@ static void tgen_movcond(TCGContext *s, TCGType type, TCGCond c, TCGReg dest,
     if (HAVE_FACILITY(LOAD_ON_COND)) {
         cc = tgen_cmp(s, type, c, c1, c2, c2const, false);
         if (v3const) {
-            tcg_out_insn(s, RIE, LOCGHI, dest, v3, cc);
+            tcg_out_insn(s, RIEg, LOCGHI, dest, v3, cc);
         } else {
             tcg_out_insn(s, RRFc, LOCGR, dest, v3, cc);
         }
@@ -1530,6 +1533,7 @@ static void tgen_compare_branch(TCGContext *s, S390Opcode opc, int cc,
                                 TCGReg r1, TCGReg r2, TCGLabel *l)
 {
     tcg_out_reloc(s, s->code_ptr + 1, R_390_PC16DBL, l, 2);
+    /* Format RIE-b */
     tcg_out16(s, (opc & 0xff00) | (r1 << 4) | r2);
     tcg_out16(s, 0);
     tcg_out16(s, cc << 12 | (opc & 0xff));
@@ -1539,6 +1543,7 @@ static void tgen_compare_imm_branch(TCGContext *s, S390Opcode opc, int cc,
                                     TCGReg r1, int i2, TCGLabel *l)
 {
     tcg_out_reloc(s, s->code_ptr + 1, R_390_PC16DBL, l, 2);
+    /* Format RIE-c */
     tcg_out16(s, (opc & 0xff00) | (r1 << 4) | cc);
     tcg_out16(s, 0);
     tcg_out16(s, (i2 << 8) | (opc & 0xff));
@@ -1558,8 +1563,8 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond c,
 
         if (!c2const) {
             opc = (type == TCG_TYPE_I32
-                   ? (is_unsigned ? RIE_CLRJ : RIE_CRJ)
-                   : (is_unsigned ? RIE_CLGRJ : RIE_CGRJ));
+                   ? (is_unsigned ? RIEb_CLRJ : RIEb_CRJ)
+                   : (is_unsigned ? RIEb_CLGRJ : RIEb_CGRJ));
             tgen_compare_branch(s, opc, cc, r1, c2, l);
             return;
         }
@@ -1570,18 +1575,18 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond c,
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
2.34.1


