Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B1A45F24F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 17:42:20 +0100 (CET)
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqeIk-0005it-Lu
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 11:42:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqeFt-0002MI-F5
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:39:21 -0500
Received: from [2a00:1450:4864:20::42c] (port=38601
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqeFr-00045F-Eu
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:39:21 -0500
Received: by mail-wr1-x42c.google.com with SMTP id u18so19850471wrg.5
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 08:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bhjDrhsvrUXt5l3q8ZZdjljlNarEl9ipYV1LbEcWSak=;
 b=qGOMVaNdqvhHAXikp16IX7mqVQElUQeazlaWlqbwGvR4NAe0KewNENn5hsNal55STy
 T9SmXu3XIwYIjmFerqoRfswhsxBhlPdX6FQ9LhMyHyt3Jq+VWvR7zgY1juiPXRie0imb
 8boazpIaB9x6ivwkyit2iEplqJCNRFnvSFL+R08j5/cNHGQrqmiY3Gs4FWLJJucpHyj3
 mtdoywl5gOjVqY3iwI9FVxf2kOoEa0eWAi4F1cuzYCyrzZ+ivoAHXBt8C+asH3410x9E
 918FF1NBwecFYycAxf0JFR9OXnoSf3uuu0XlGFRmRsdkL0C1Aw9wgz4B9Ld+XaIjaM/t
 9BHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bhjDrhsvrUXt5l3q8ZZdjljlNarEl9ipYV1LbEcWSak=;
 b=ZEcMgvqU+1QWzIox0q+2IKXfNQ64ngrbw3OQ+F7SLfIeHXngYmNohvMoTiVY4LLdBs
 NIGAg6oFcCj0Zw1Jtx7fDrfG0yN/cplfS95bxuE02by413djP1BuJ9QETzip+3sHJaN4
 GKt0vlzi1DhHRB/iD9jXSuJpwPwrCOjZhf/1AGH3yk7gvSjQmiwUESH8diCFl9Wz9uNl
 hh94myHAf+iZ+JOkc77Vj/66Bmn6TzgbNJDvcKVayoxfeVZwBb8mtcxOOV3CwwzwRuyB
 josBStuwD4gcxyR/2nwVo3CmX01qpnwj0QgY5fcGSKpNvElc7+w7gkL2LM1z+LOXZ5ah
 hNkA==
X-Gm-Message-State: AOAM530RHrzYaNEYzEpqRQnaj91CptYS9qcq0f5aPYsREMatPHxgZ6pD
 2EpmHxrNG9CJEsTF610Kfb//Mw==
X-Google-Smtp-Source: ABdhPJxvUu8ApXpepidUF2X/eZse6cnVkA0PAkDKEOS4K0hCEy2NXFmZTTnmzY4FB062sCXPe+RRtw==
X-Received: by 2002:a5d:52c3:: with SMTP id r3mr15191292wrv.115.1637944757709; 
 Fri, 26 Nov 2021 08:39:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id b14sm7837698wrd.24.2021.11.26.08.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:39:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2? 1/2] hw/intc/arm_gicv3: Add new
 gicv3_intid_is_special() function
Date: Fri, 26 Nov 2021 16:39:14 +0000
Message-Id: <20211126163915.1048353-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126163915.1048353-1-peter.maydell@linaro.org>
References: <20211126163915.1048353-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GICv3/v4 pseudocode has a function IsSpecial() which returns true
if passed a "special" interrupt ID number (anything between 1020 and
1023 inclusive).  We open-code this condition in a couple of places,
so abstract it out into a new function gicv3_intid_is_special().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h  | 13 +++++++++++++
 hw/intc/arm_gicv3_cpuif.c |  4 ++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 70f34ee4955..b9c37453b04 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -411,6 +411,19 @@ FIELD(MAPC, RDBASE, 16, 32)
 
 /* Functions internal to the emulated GICv3 */
 
+/**
+ * gicv3_intid_is_special:
+ * @intid: interrupt ID
+ *
+ * Return true if @intid is a special interrupt ID (1020 to
+ * 1023 inclusive). This corresponds to the GIC spec pseudocode
+ * IsSpecial() function.
+ */
+static inline bool gicv3_intid_is_special(int intid)
+{
+    return intid >= INTID_SECURE && intid <= INTID_SPURIOUS;
+}
+
 /**
  * gicv3_redist_update:
  * @cs: GICv3CPUState for this redistributor
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 3fe5de8ad7d..7fbc36ff41b 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -997,7 +997,7 @@ static uint64_t icc_iar0_read(CPUARMState *env, const ARMCPRegInfo *ri)
         intid = icc_hppir0_value(cs, env);
     }
 
-    if (!(intid >= INTID_SECURE && intid <= INTID_SPURIOUS)) {
+    if (!gicv3_intid_is_special(intid)) {
         icc_activate_irq(cs, intid);
     }
 
@@ -1020,7 +1020,7 @@ static uint64_t icc_iar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
         intid = icc_hppir1_value(cs, env);
     }
 
-    if (!(intid >= INTID_SECURE && intid <= INTID_SPURIOUS)) {
+    if (!gicv3_intid_is_special(intid)) {
         icc_activate_irq(cs, intid);
     }
 
-- 
2.25.1


