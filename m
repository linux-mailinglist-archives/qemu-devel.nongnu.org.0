Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13758647BFB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:07:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Sm7-00063t-Or; Thu, 08 Dec 2022 21:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sly-00060f-9i
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:58 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slw-0001sD-Lf
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:58 -0500
Received: by mail-oi1-x231.google.com with SMTP id c129so3306889oia.0
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJ/9NJKojCTI8IsyXCxUEUWPG0r5aG42tVuV9K2OrB0=;
 b=IeikftGKxmM+kN5WW2muamkPWmZCrd2qWF5R1W+bymjPgcBXQVQhmKsTdvt5PqfonY
 JXi+IjuSRUbFS+fiiDkpTEMwqvpIYuAAQVqGhpDtdxAL0uAXpi7jLB+fIRQvSuAVW9Uo
 fbBsVnboZtaga+s/8f6SxEQDT7oLzPhEr3jnEUvmP7qGnW4/NuaVpwMqODBpcZRHhTfh
 /GfGQBUh+AfPUsp7z2t0asgxyZ6ChmTU5YgThxm7ONsDH6kXHmL2XIyN9xU0R7iqdB/W
 l+J6wLreGVWM6h7xjk0vcY7o1Adf7ul2wxhZuKXWw98YP8wHtKZuoH88adqNtKsHnQK4
 7dAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CJ/9NJKojCTI8IsyXCxUEUWPG0r5aG42tVuV9K2OrB0=;
 b=x38APZ1ZiO11AOOQ4IVP+J7sdbyplTcqs6t8kEFgIW2qvZtZdIKQUZqodo9IcQRFtL
 XSDTK1yZ6KxGSF6WG0BJ2pOA7Zl0a+3j939T6G5t456hmoxO/uTkgP/OWzccgMrrkxI/
 arRfJITXTibwcLI3aw15osn5r3sQ/JlxqJoutYphR8lvMA7nRUrwjtRCzdSufp2UvgeZ
 tNgnC8zqbI4lxd4Ioggo89jX5pPAVdQ+FnWhJAfaN/G6Hy7viIBTR8y1F2PintHQB1L4
 F/v1jJ1FQE8z/7fbiw4UdIaOOAMtK5d1I0xRQ5ODz+92BKe9LWPeFoqLYtY4MqhxfTY3
 Hymg==
X-Gm-Message-State: ANoB5pkm5pbxxvnUyTH1Dt97jHX6Dx3WAupBzo5+D3bhIwcRJ2BrhIla
 DO6zmHaztR//+uJjJQPN7KNSEfVwCqPq4gNdsbY=
X-Google-Smtp-Source: AA0mqf7P+bmTqH8A71j6NdGWZMncFjjwrscLSvIib7FrjrcaoxzdqjWBOcaVizMPpjWp3vMXGCZD+Q==
X-Received: by 2002:a05:6808:3009:b0:355:1de9:6546 with SMTP id
 ay9-20020a056808300900b003551de96546mr2345954oib.40.1670551555966; 
 Thu, 08 Dec 2022 18:05:55 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 20/27] tcg/s390x: Create tgen_cmp2 to simplify movcond
Date: Thu,  8 Dec 2022 20:05:23 -0600
Message-Id: <20221209020530.396391-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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


