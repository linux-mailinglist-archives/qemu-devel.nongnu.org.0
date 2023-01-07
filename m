Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D03B660CE8
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 09:05:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zb-0003q7-Ew; Sat, 07 Jan 2023 02:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zR-0003ii-FQ
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:41 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zP-0004FX-OY
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:41 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so4130362pjj.4
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJ/9NJKojCTI8IsyXCxUEUWPG0r5aG42tVuV9K2OrB0=;
 b=Zz63YDRYq8ZFIwJ6T/E8iNuuZXxCW+VHmapBatfcRFILS8WSy9V+cWib8KfG+0HOwn
 Kn15uauALlgYQc6cbqI39rZdtmzoGO6qvnTP6TmGCDTnZhe5qLnuZ8nEm/BgwovJW34U
 pwbCXSjHADCGD7jQ9ZzIIkAQrcBEg095kMXKvcFkUnHTSwgrEtnwzkd6+T/sA4yFfW5l
 13wDSByxVIGGBoxLkSNJkB1/H33wLsQeF95DOQmwzT3BwWgpFpFyDwjRLXxOYcpDlBOO
 nDsMFh6+qbyMEb5vl+D9NiWKrGeOs5wenDVmbTi7yKQEu9uaN3FLNMs4KYzglz5MtQjZ
 MUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CJ/9NJKojCTI8IsyXCxUEUWPG0r5aG42tVuV9K2OrB0=;
 b=Nohae2QCh2D9tQSVKjptF3/0ytxhMckTSKiucSlecsRx8NgWLLOLsR8uYy4vsfj1FM
 GdkMG6ONDJdjlsHUwNVt7JS8KBPayv0lbS5JEl2d1fcK2404uadUwkcK7/TYSxP1Gl6G
 8H3jxHiWLRdp4Tne0j6L5+Ii/IKMF8sqsKQV2+dx8NBKIk+IwfiBeyYQARu4fyJhWqdM
 yAqrTp+quLb64rjMZqU4faZK9nH33cRSpuj8KEzRhm6wbsqYLJC4j4O67+P/+jaEO+hq
 hkz4dwSDNroCEDLQWHK8yL/4jci4v4LnfIT70qD/37Xm2nEuM41OwcUl9kkejiPcjqi9
 hJpg==
X-Gm-Message-State: AFqh2kpGc0lx7ha8bO4br2OFNzI09CDSCBYiSVhB/3BNnwWx2IarliYh
 aUM5CcP5vK4n5yYEwjCgcxztzENIrSXucKkP
X-Google-Smtp-Source: AMrXdXuUEDxq6wRo6ca0yrDrfPnOD3hNOyGsx9oz1vmmY+S4/8id2t7ddeVkPzixMg2QvuDVSLDGug==
X-Received: by 2002:a05:6a20:158b:b0:af:6cc0:5b3d with SMTP id
 h11-20020a056a20158b00b000af6cc05b3dmr85463709pzj.7.1673077898475; 
 Fri, 06 Jan 2023 23:51:38 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 20/27] tcg/s390x: Create tgen_cmp2 to simplify movcond
Date: Fri,  6 Jan 2023 23:51:11 -0800
Message-Id: <20230107075118.1814503-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index bab2d679c2..a9e3b4a9b9 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1207,10 +1207,11 @@ static void tgen_xori(TCGContext *s, TCGReg dest, uint64_t val)
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
@@ -1221,6 +1222,7 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
                 } else {
                     tcg_out_insn(s, RRE, LTGR, r1, r1);
                 }
+                *inv_cc = tcg_cond_to_ltr_cond[inv_c];
                 return tcg_cond_to_ltr_cond[c];
             }
         }
@@ -1263,9 +1265,17 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
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
@@ -1348,7 +1358,10 @@ static void tgen_movcond(TCGContext *s, TCGType type, TCGCond c, TCGReg dest,
                          TCGReg c1, TCGArg c2, int c2const,
                          TCGArg v3, int v3const)
 {
-    int cc = tgen_cmp(s, type, c, c1, c2, c2const, false);
+    int cc, inv_cc;
+
+    cc = tgen_cmp2(s, type, c, c1, c2, c2const, false, &inv_cc);
+
     if (v3const) {
         tcg_out_insn(s, RIEg, LOCGHI, dest, v3, cc);
     } else {
-- 
2.34.1


