Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F18660CE0
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 08:59:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zQ-0003iO-ME; Sat, 07 Jan 2023 02:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zL-0003gb-E8
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:36 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zJ-0004Dz-KI
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:35 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so7573909pjq.1
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/GryLdVxy6DbC9JdLFOg5oT779WNfnXadHx5Ifz/fE=;
 b=ctq1IkvIhiD1pxXedDyrGmP5sNbMIgOIrCQ4JVL4V6j0cc8UrUsAkk+dpicu/e9UOS
 CF6sWJysABt9aUht7+MgzA4k6l5Hz5e0ZuIz9GB9axQicsNCO8t9QHC8r/6HC6KTcYvZ
 s5RK2nvwe/efMiqtlMVn/uWw0OZ/PTWTZtFWwy+wwuiwuyDnX6fU8oGd9O20WaoGBzrl
 17+x/RkhYw/xydAbMYjcxbVxSme2UaZ6e862yNKOL2TpnZjIbUrGcqsq3FXNaMw61IOZ
 /Y2zV96LUJjzNhl0kJAATvhlJIqD0ciHTaUqtMpkBUIcdwDdpAh9d9H0lIBXpUJV9iKl
 U1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R/GryLdVxy6DbC9JdLFOg5oT779WNfnXadHx5Ifz/fE=;
 b=dIakA3bx+200VnnFrtqHUBf648tq1DpZEK1JJc8OxGPyPH4xNQaD0ewJsxDjCVEdxF
 E+9CpeXeqcTNMmw2C7MKHNqMYqYZMFxsHwkiAxqnRoN3vr/OVcXE5QVHHzooYG8Qwumw
 /ns5l+dmhJQY9nMSXCP4czX3r/aFDeQuDKNA4mWWZ+hlEytT927D9NJsaObt/ctin4fP
 56zEJeWMQQk6s5yO9FMNnA54Q0OHqDNMKZxLEiUFu+8vOHfkt21xH0iLJx7nWs/jugyg
 Jvgn2vPD+QOrAefGKThCqDyHDtLRHAY/qR1xC0WG4TWblFVuy7/JvjcpmKGmm250P7P0
 dwIQ==
X-Gm-Message-State: AFqh2koBkcPeJJUfUsuXRtYlTCjSLbIpGQeLnHeW3N5cX3bBNAAkezqc
 XO5zSZlXKtrtin0kV6oQ5QSPWN+UWOkvg3Jl
X-Google-Smtp-Source: AMrXdXvasAiCVT2dNdS6j1+6wUA8SbLKwXaYOovnDZr2BBEDI/gTGo5XCXA69Phpw60CrMZqFRMKBQ==
X-Received: by 2002:a17:90a:664a:b0:223:ff2e:ca5c with SMTP id
 f10-20020a17090a664a00b00223ff2eca5cmr60388770pjm.42.1673077892266; 
 Fri, 06 Jan 2023 23:51:32 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 13/27] tcg/s390x: Distinguish RIE formats
Date: Fri,  6 Jan 2023 23:51:04 -0800
Message-Id: <20230107075118.1814503-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 47 +++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index d38a602dd9..a81a82c70b 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -128,16 +128,19 @@ typedef enum S390Opcode {
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
@@ -556,7 +559,7 @@ static void tcg_out_insn_RI(TCGContext *s, S390Opcode op, TCGReg r1, int i2)
     tcg_out32(s, (op << 16) | (r1 << 20) | (i2 & 0xffff));
 }
 
-static void tcg_out_insn_RIE(TCGContext *s, S390Opcode op, TCGReg r1,
+static void tcg_out_insn_RIEg(TCGContext *s, S390Opcode op, TCGReg r1,
                              int i2, int m3)
 {
     tcg_out16(s, (op & 0xff00) | (r1 << 4) | m3);
@@ -985,9 +988,9 @@ static inline void tcg_out_risbg(TCGContext *s, TCGReg dest, TCGReg src,
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
@@ -1266,7 +1269,7 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
         /* Emit: d = 0, d = (cc ? 1 : d).  */
         cc = tgen_cmp(s, type, cond, c1, c2, c2const, false);
         tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
-        tcg_out_insn(s, RIE, LOCGHI, dest, 1, cc);
+        tcg_out_insn(s, RIEg, LOCGHI, dest, 1, cc);
         return;
     }
 
@@ -1340,7 +1343,7 @@ static void tgen_movcond(TCGContext *s, TCGType type, TCGCond c, TCGReg dest,
 {
     int cc = tgen_cmp(s, type, c, c1, c2, c2const, false);
     if (v3const) {
-        tcg_out_insn(s, RIE, LOCGHI, dest, v3, cc);
+        tcg_out_insn(s, RIEg, LOCGHI, dest, v3, cc);
     } else {
         tcg_out_insn(s, RRFc, LOCGR, dest, v3, cc);
     }
@@ -1409,6 +1412,7 @@ static void tgen_compare_branch(TCGContext *s, S390Opcode opc, int cc,
                                 TCGReg r1, TCGReg r2, TCGLabel *l)
 {
     tcg_out_reloc(s, s->code_ptr + 1, R_390_PC16DBL, l, 2);
+    /* Format RIE-b */
     tcg_out16(s, (opc & 0xff00) | (r1 << 4) | r2);
     tcg_out16(s, 0);
     tcg_out16(s, cc << 12 | (opc & 0xff));
@@ -1418,6 +1422,7 @@ static void tgen_compare_imm_branch(TCGContext *s, S390Opcode opc, int cc,
                                     TCGReg r1, int i2, TCGLabel *l)
 {
     tcg_out_reloc(s, s->code_ptr + 1, R_390_PC16DBL, l, 2);
+    /* Format RIE-c */
     tcg_out16(s, (opc & 0xff00) | (r1 << 4) | cc);
     tcg_out16(s, 0);
     tcg_out16(s, (i2 << 8) | (opc & 0xff));
@@ -1435,8 +1440,8 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond c,
 
     if (!c2const) {
         opc = (type == TCG_TYPE_I32
-               ? (is_unsigned ? RIE_CLRJ : RIE_CRJ)
-               : (is_unsigned ? RIE_CLGRJ : RIE_CGRJ));
+               ? (is_unsigned ? RIEb_CLRJ : RIEb_CRJ)
+               : (is_unsigned ? RIEb_CLGRJ : RIEb_CGRJ));
         tgen_compare_branch(s, opc, cc, r1, c2, l);
         return;
     }
@@ -1449,18 +1454,18 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond c,
      */
     if (type == TCG_TYPE_I32) {
         if (is_unsigned) {
-            opc = RIE_CLIJ;
+            opc = RIEc_CLIJ;
             in_range = (uint32_t)c2 == (uint8_t)c2;
         } else {
-            opc = RIE_CIJ;
+            opc = RIEc_CIJ;
             in_range = (int32_t)c2 == (int8_t)c2;
         }
     } else {
         if (is_unsigned) {
-            opc = RIE_CLGIJ;
+            opc = RIEc_CLGIJ;
             in_range = (uint64_t)c2 == (uint8_t)c2;
         } else {
-            opc = RIE_CGIJ;
+            opc = RIEc_CGIJ;
             in_range = (int64_t)c2 == (int8_t)c2;
         }
     }
-- 
2.34.1


