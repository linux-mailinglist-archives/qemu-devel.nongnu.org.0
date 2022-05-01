Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193CA51622F
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:22:23 +0200 (CEST)
Received: from localhost ([::1]:55352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl2yM-0002Jd-6I
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tp-0006t7-Bl
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:57 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:41550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tl-0001HQ-HR
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:48 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so10494077pjf.0
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=quTC6tTsjrVSG7RTQMFQxNix8MmA7vsc1c94ro1M6BU=;
 b=GAaMlrPsCUAKgd4ifuF74NLDzajJdiMSssMgoXVuxe/PhIqvNkznvXLkzcgSb4zIfS
 TeJbN30lQ2SEyg1HbpDIcTskbRUl0WXEA053PCs9ROdHLNm6btDswIXIThYYYSgdNAta
 qx3IgFdVR2lOd5wu6keMsZCiAhdIBpVfvl6e681283mImO7Dvo4PaANbaxpC/WnE57RI
 HXx9+66u6ZdDq8iJD2Ghfnjtmv1g4iykmK9vlIITE53NwY/ni5cGT6zLlYws9ve58UjC
 nxdgdeC4eX+qIDfZ8NO5bcHtK4UTwKaRVEtmHYwWRr8AzVvdECTVXIkx/F8/QS/cZehb
 s78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=quTC6tTsjrVSG7RTQMFQxNix8MmA7vsc1c94ro1M6BU=;
 b=gQex4dQkqPzaXJEqdHQAMeMG6e1RKd2/ZftsRC/Irx/eeflg1+w/Kzb2pG1TgXVNaA
 DqNNFRmt1vpI2HjtxJpvEQwP47QA2RNb3fiJr5sam0ETV0KcCuz8rYycDLuq6eQcr8ZK
 HBSjiCU2jjIi+leEwyzlTLCvyFyJneFTC2ikyjMEKy8vpHNGg8KHJoC+fLd+74bJgoB5
 mRg+gwaMG3mGMrb+guOJF2T4xIJxkWBxM+80zyUZF72B4c2XKHl1eygJ1xP36ruGVe7H
 4nnLur0R4v8bdG/s2TSwqWbXKndYQqwr+DJrbv0LIlD9VUChv2YZ2t4MA3BwPhJG054a
 FGGQ==
X-Gm-Message-State: AOAM530IeKeYFM0765N+nwNK3MeYzF62AyI9LJTjSqz7/lykGiOZtqvd
 9ODA92I7zZ/gCrlrfgcpDUdF3Db4Fzosyg==
X-Google-Smtp-Source: ABdhPJzrdAK/vBu3YruimULYIbmC3Ijz1FRo0BQs6l7dMMIHiHbdf1O9V+tKg0f2aMe7tMc1b4izbQ==
X-Received: by 2002:a17:90a:fac:b0:1ca:5eb8:f3b2 with SMTP id
 41-20020a17090a0fac00b001ca5eb8f3b2mr7145887pjz.37.1651384242469; 
 Sat, 30 Apr 2022 22:50:42 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/45] target/arm: Hoist computation of key in
 add_cpreg_to_hashtable
Date: Sat, 30 Apr 2022 22:49:55 -0700
Message-Id: <20220501055028.646596-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the computation of key to the top of the function.
Hoist the resolution of cp as well, as an input to the
computation of key.

This will be required by a subsequent patch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 49 +++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 44c05deb5b..118422d672 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8509,8 +8509,34 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     ARMCPRegInfo *r2;
     int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
     int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
+    int cp = r->cp;
     size_t name_len;
 
+    switch (state) {
+    case ARM_CP_STATE_AA32:
+        /* We assume it is a cp15 register if the .cp field is left unset. */
+        if (cp == 0 && r->state == ARM_CP_STATE_BOTH) {
+            cp = 15;
+        }
+        key = ENCODE_CP_REG(cp, is64, ns, r->crn, crm, opc1, opc2);
+        break;
+    case ARM_CP_STATE_AA64:
+        /*
+         * To allow abbreviation of ARMCPRegInfo definitions, we treat
+         * cp == 0 as equivalent to the value for "standard guest-visible
+         * sysreg".  STATE_BOTH definitions are also always "standard sysreg"
+         * in their AArch64 view (the .cp value may be non-zero for the
+         * benefit of the AArch32 view).
+         */
+        if (cp == 0 || r->state == ARM_CP_STATE_BOTH) {
+            cp = CP_REG_ARM64_SYSREG_CP;
+        }
+        key = ENCODE_AA64_CP_REG(cp, r->crn, crm, r->opc0, opc1, opc2);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
     /* Combine cpreg and name into one allocation. */
     name_len = strlen(name) + 1;
     r2 = g_malloc(sizeof(*r2) + name_len);
@@ -8554,12 +8580,6 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         }
 
         if (r->state == ARM_CP_STATE_BOTH) {
-            /* We assume it is a cp15 register if the .cp field is left unset.
-             */
-            if (r2->cp == 0) {
-                r2->cp = 15;
-            }
-
 #if HOST_BIG_ENDIAN
             if (r2->fieldoffset) {
                 r2->fieldoffset += sizeof(uint32_t);
@@ -8567,22 +8587,6 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
 #endif
         }
     }
-    if (state == ARM_CP_STATE_AA64) {
-        /* To allow abbreviation of ARMCPRegInfo
-         * definitions, we treat cp == 0 as equivalent to
-         * the value for "standard guest-visible sysreg".
-         * STATE_BOTH definitions are also always "standard
-         * sysreg" in their AArch64 view (the .cp value may
-         * be non-zero for the benefit of the AArch32 view).
-         */
-        if (r->cp == 0 || r->state == ARM_CP_STATE_BOTH) {
-            r2->cp = CP_REG_ARM64_SYSREG_CP;
-        }
-        key = ENCODE_AA64_CP_REG(r2->cp, r2->crn, crm,
-                                 r2->opc0, opc1, opc2);
-    } else {
-        key = ENCODE_CP_REG(r2->cp, is64, ns, r2->crn, crm, opc1, opc2);
-    }
     if (opaque) {
         r2->opaque = opaque;
     }
@@ -8593,6 +8597,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     /* Make sure reginfo passed to helpers for wildcarded regs
      * has the correct crm/opc1/opc2 for this reg, not CP_ANY:
      */
+    r2->cp = cp;
     r2->crm = crm;
     r2->opc1 = opc1;
     r2->opc2 = opc2;
-- 
2.34.1


