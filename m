Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9474612B7
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 11:42:21 +0100 (CET)
Received: from localhost ([::1]:33284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mre71-0005GU-V7
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 05:42:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mre4B-0002OD-6Z
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:39:23 -0500
Received: from [2a00:1450:4864:20::431] (port=33690
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mre48-0004n1-V4
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:39:22 -0500
Received: by mail-wr1-x431.google.com with SMTP id d24so35765598wra.0
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 02:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9VVdwPMx3U1bUUTF2DIPsdquwWCg5tAFq2w0+RD0yNQ=;
 b=Q8C6YpWbnBnzVsHhlgmeK8/AI1M9QdoyNJL/ME+603di3XWA2sC1vTrs9whARvooJT
 UEEEppNLGrM9h6JxKxrKf1HNvE8TauycgY9cMfSA1Rkuw9sADa0RrYaxxQgJpwheQIM3
 yAIihbu5rQ0ad6LJYoT/w9Y64StG/pLozI1QSGCxh7WM0WvTYU/WODNofVGwhg8SR621
 t1bL6tTH5KLcu3VPcEj8dBbDRRcBbbmy02kyOfVSvtTTXDqfVGRir0oeHuKEn/bb3I4k
 unO//6ssKkfnpHudgXu/1HBLkqIA4vIbrdXf1iCUhVjKouQVeYqZQs5isyo6hiCthoym
 tipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9VVdwPMx3U1bUUTF2DIPsdquwWCg5tAFq2w0+RD0yNQ=;
 b=vlh9FIzVkxfu8/Ix1kO76EEdZpt5iP7IGm+poHgA/EV1XDg1iz+t+dBz23Ko8XRopf
 47CH6e0ecLeE2+5QgfIlAq10c+A9z9rsTocDqxDK8ICfsXQ0Rdg7YkeFJD0c1Q8hsvBW
 HQeE5y6sVn8H5mpK7a3CbquYcoGK1aNeQJlU59K86dTsJGPwc2+QHHpJ+01+2iiNYIJh
 XSighzTuEgsloRtBzlZ5U7khSSwQFNNyc1EiawD97jx2JKT54xdsKzpXKzgGZrnCsKqm
 Ci+jgXWF4O0yPj+GAWWbl3QcUcjb3jIWgZiZ3lDYOM3qNmY7l+ExBZu1BGeZdm7jxaDW
 TQAg==
X-Gm-Message-State: AOAM531owky3jje3OqYIJAeEr3wgB951IMR2Du12OprFAscRPxHzR+3D
 kDiWO1s5Gj1sDvNQDidmzQxD3pDqnHSfyA==
X-Google-Smtp-Source: ABdhPJyH/i6raiL+Cty4gu9QYtiQFm3jNZANoM4B2jxtFfGrztAvpoy7mEGMw4/yPhwCSr2BUL00vw==
X-Received: by 2002:a5d:4843:: with SMTP id n3mr31867555wrs.335.1638182359696; 
 Mon, 29 Nov 2021 02:39:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t17sm18810912wmq.15.2021.11.29.02.39.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 02:39:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] hw/intc/arm_gicv3: Add new gicv3_intid_is_special()
 function
Date: Mon, 29 Nov 2021 10:39:14 +0000
Message-Id: <20211129103915.1162989-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129103915.1162989-1-peter.maydell@linaro.org>
References: <20211129103915.1162989-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GICv3/v4 pseudocode has a function IsSpecial() which returns true
if passed a "special" interrupt ID number (anything between 1020 and
1023 inclusive).  We open-code this condition in a couple of places,
so abstract it out into a new function gicv3_intid_is_special().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


