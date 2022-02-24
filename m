Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11304C305C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 16:52:44 +0100 (CET)
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGQ7-0007PR-U9
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 10:52:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHU-0003dJ-7F
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:48 -0500
Received: from [2607:f8b0:4864:20::102b] (port=39933
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHS-0008KW-2h
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:47 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 h17-20020a17090acf1100b001bc68ecce4aso6034909pju.4
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 07:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R3zMtaGvE9+TQluaSTHCuvCn8MwOlKev5tBbaOg+Fco=;
 b=ivi8po2UngrV38xbvfGXWv0Tq4ciWrrLZl/b49RMnfy936Fksh9ndzXnw60sj04mya
 xdxCiF6C1dE2TJz+DERKctRj5DQqLhZYt5Z100p2cuTrZ8E0NZSSP10fimORTbY0AqE+
 8/ED/3FgnwANepkdiKks063fVzrFCT6d3AUSdI5N2OYbD41slGKeYWvNiGv7Zc6MElYV
 HjtFVFiahAL/DpMxx8cs3hOiKK8XPWnr3k/dUCE3dQ/6vMcBVHbyqqAng2Q8a21ykMSF
 zrZ+dhLiBrT7ps+zRNwT0DkZiTgEIg/JbOOHZ79ms5j4laWwdM9T+8XGCDF5oxBz/x52
 ir3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R3zMtaGvE9+TQluaSTHCuvCn8MwOlKev5tBbaOg+Fco=;
 b=IuFlQQED10VyxTlN8oWZfaqOoHUETv0K1toOl1xmlP3DxRJLjunKFxxZGDVIcjo0aD
 vK4rcoGXGj/87skAklZBbEbob1HtswL+fTNPle6dhSgXRiEPSzdfAzXRUJLiEQlpfokR
 CCaMZgonAMdtIcYB1/asxgJ4Fs9ThtP3bm+5rGvCDHJ/KmUCPwVT2AQV3dwDC3H5rj+r
 WAzzOsklgUUtIk+dkOn2lTpCYG5E/reKqxplapC9uGC5IcIUg7oZPVRlADzyyr7sJWlQ
 CglvZpJsgD2trxz20rlgvlVzqQQX1KD39sBCmBqUgrB0hhR7nrTDuggxAGMydnfbCCA2
 vSsw==
X-Gm-Message-State: AOAM532FmNOgqX/7nuAE+FwbHEeX6hHPWn3v3ekNxDwpFznnqciEFbmp
 2appY8wQSAi2TneJ1osmfaN2qtX+DAHjIw==
X-Google-Smtp-Source: ABdhPJz6NkZP+WoHWVghjeT+29vo6NEHRTd4R+ISpOCdCYwfQks9VKgVXXia9d82etN96705rD27Zw==
X-Received: by 2002:a17:902:d892:b0:14e:e074:7ff7 with SMTP id
 b18-20020a170902d89200b0014ee0747ff7mr3221532plz.29.1645717424811; 
 Thu, 24 Feb 2022 07:43:44 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id v20sm3198062pju.9.2022.02.24.07.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:43:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/10] tcg/s390x: Create tgen_cmp2 to simplify movcond
Date: Thu, 24 Feb 2022 05:43:29 -1000
Message-Id: <20220224154333.125185-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224154333.125185-1-richard.henderson@linaro.org>
References: <20220224154333.125185-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Return both regular and inverted condition codes from tgen_cmp2.
This lets us choose after the fact which comparision we want.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 58ebb925d9..18b8ca3132 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1376,10 +1376,11 @@ static void tgen_xori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     }
 }
 
-static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
-                    TCGArg c2, bool c2const, bool need_carry)
+static int tgen_cmp2(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
+                     TCGArg c2, bool c2const, bool need_carry, int *inv_cc)
 {
     bool is_unsigned = is_unsigned_cond(c);
+    TCGCond inv_c = tcg_invert_cond(c);
     S390Opcode op;
 
     if (c2const) {
@@ -1390,6 +1391,7 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
                 } else {
                     tcg_out_insn(s, RRE, LTGR, r1, r1);
                 }
+                *inv_cc = tcg_cond_to_ltr_cond[inv_c];
                 return tcg_cond_to_ltr_cond[c];
             }
         }
@@ -1453,9 +1455,17 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
     }
 
  exit:
+    *inv_cc = tcg_cond_to_s390_cond[inv_c];
     return tcg_cond_to_s390_cond[c];
 }
 
+static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
+                    TCGArg c2, bool c2const, bool need_carry)
+{
+    int inv_cc;
+    return tgen_cmp2(s, type, c, r1, c2, c2const, need_carry, &inv_cc);
+}
+
 static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
                          TCGReg dest, TCGReg c1, TCGArg c2, int c2const)
 {
@@ -1556,20 +1566,19 @@ static void tgen_movcond(TCGContext *s, TCGType type, TCGCond c, TCGReg dest,
                          TCGReg c1, TCGArg c2, int c2const,
                          TCGArg v3, int v3const)
 {
-    int cc;
+    int cc, inv_cc;
+
+    cc = tgen_cmp2(s, type, c, c1, c2, c2const, false, &inv_cc);
+
     if (HAVE_FACILITY(LOAD_ON_COND)) {
-        cc = tgen_cmp(s, type, c, c1, c2, c2const, false);
         if (v3const) {
             tcg_out_insn(s, RIEg, LOCGHI, dest, v3, cc);
         } else {
             tcg_out_insn(s, RRFc, LOCGR, dest, v3, cc);
         }
     } else {
-        c = tcg_invert_cond(c);
-        cc = tgen_cmp(s, type, c, c1, c2, c2const, false);
-
         /* Emit: if (cc) goto over; dest = r3; over:  */
-        tcg_out_insn(s, RI, BRC, cc, (4 + 4) >> 1);
+        tcg_out_insn(s, RI, BRC, inv_cc, (4 + 4) >> 1);
         tcg_out_insn(s, RRE, LGR, dest, v3);
     }
 }
-- 
2.25.1


