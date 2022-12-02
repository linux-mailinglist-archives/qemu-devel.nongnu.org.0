Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83EB6400B1
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:53:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zuB-0007ay-Dj; Fri, 02 Dec 2022 01:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu9-0007Zr-5K
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:14 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu7-0003ha-I7
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:12 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 82so3706292pgc.0
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 22:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4sFX9yZOyM3r1MgjgBiirAQT8v3uQu+8pCAPlCWzIFM=;
 b=ra5DsSlWn/fRtlIkOKx5G1zuEUQd7IvkZzAb4bfpcN6vchWZoI/1n7RXKAS6YTNdM5
 QnmDHSBI0tZMsu4+3RyZ/NJHsyMkfA7r6x6q+aqywFXENFI3xctJeHGQ1E3fwc3fQDoG
 kfoAlT4sgzDwkt+uiYA1JfxyPQzNQYhoXLMTvzorlH3tuHUTx/O7C4Lwwo8rQfTiuoN0
 nRKErH7J4DD8vU0bH8zwzizGQOfNcwcmRVAt/hDAhmHvPbVdQkutc+zW/myOMFgHYJEw
 ocymuwgv8Dal8YCsmNk/1bmWOq2mcSfOMMURJBgw2PFo9NON/rV/WesyPeRhUvn3Krwi
 Gbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4sFX9yZOyM3r1MgjgBiirAQT8v3uQu+8pCAPlCWzIFM=;
 b=Elw2CSfAH0KJQcWxf1JRMUC+THoVijAhMYQDDgOFiP+AHYH+GSRx3xijkFPMcd2jsN
 lF3zBWVhOlvVFMnFacCuwmZfPzkS7wrl4dg8L4LbYMoP5ngFb9FUKvM4zA7NTk0h9PXz
 +mzNyeHhhvXYryQa3saKDp0vuXq1l+2sSDDJx0RbMhQ8uoo0uhWIJT919fHcJFBW0hR5
 HVYyro3KSWmMlpF6fKQnRgjYqLqwphVrH/UOQsxpCuJc18kKiNHhE/piNDYh8uZku69a
 zWBzReMEWBROMRkbe3xHazV14K56v+y5F3rTiiqw8KY0L04HWton0cqy3MztEYvNNTq2
 vROQ==
X-Gm-Message-State: ANoB5pkLExQ2++i46WNQWA1G2omJXnko1uuj9126jCksw8AmnivGi5eq
 KtLsLejSfkBDeci7aDr0CWSDIAqGi7lRyCj8
X-Google-Smtp-Source: AA0mqf5ucGRGKSDC2FG/4XKuCvHRecgWGEonWzKJmK7hBymh9O5zHf/Cb9cXC1kL7MgejSK3QrOpGQ==
X-Received: by 2002:a05:6a00:216e:b0:56e:7b62:bba with SMTP id
 r14-20020a056a00216e00b0056e7b620bbamr50992281pff.55.1669963930247; 
 Thu, 01 Dec 2022 22:52:10 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a17c300b00218d894fac3sm6056649pja.3.2022.12.01.22.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 22:52:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v3 09/13] tcg/s390x: Create tgen_cmp2 to simplify movcond
Date: Thu,  1 Dec 2022 22:51:56 -0800
Message-Id: <20221202065200.224537-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202065200.224537-1-richard.henderson@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Return both regular and inverted condition codes from tgen_cmp2.
This lets us choose after the fact which comparision we want.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 4dcdad04c5..fad86f01f3 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1288,10 +1288,11 @@ static void tgen_xori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
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
@@ -1302,6 +1303,7 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
                 } else {
                     tcg_out_insn(s, RRE, LTGR, r1, r1);
                 }
+                *inv_cc = tcg_cond_to_ltr_cond[inv_c];
                 return tcg_cond_to_ltr_cond[c];
             }
         }
@@ -1352,9 +1354,17 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
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
@@ -1455,20 +1465,19 @@ static void tgen_movcond(TCGContext *s, TCGType type, TCGCond c, TCGReg dest,
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
2.34.1


