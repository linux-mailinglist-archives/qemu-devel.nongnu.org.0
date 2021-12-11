Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D494715A4
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:23:48 +0100 (CET)
Received: from localhost ([::1]:49336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw7yF-00052H-N1
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:23:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mg-0004yX-V8
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:52 -0500
Received: from [2a00:1450:4864:20::335] (port=34472
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7md-0006EW-M9
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:50 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so8956418wmi.1
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c1o4mDLZEUBKMimLD4cOggkbAQaeevicaB7Ui64CkcA=;
 b=cm7LZ2nLSSXFaQG2uEPioagcmhgdRRouvLtD9+Srv+OhsMUGXyvWYCsuAD5jjaZYOO
 c9R/u0AP/8FneAYZarqNTmA1AaRCFZl0uhR82w+lULBkKPKR8m3DsTOofO/SrpfbisGo
 0cdcDy3l5wGov2X6lOOE2gBlGU8XNNjgHMjhLHwY49LG4ZZqGayn6v/baopi92mDdqi8
 5FGI+8ugiO+aDPgOr+MXWbsL3sg2zdLU1owTXWOS5XheqyEFGO7brMw5mrZ3h2yL0/bz
 cXjtUgGgZXNeG274BB72tTzJWO/elOYVZuJuLINgnZzq71qHNUOVmJJlN/XaoY3DXgE0
 1Wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c1o4mDLZEUBKMimLD4cOggkbAQaeevicaB7Ui64CkcA=;
 b=BP8+sGE9DOcO2RVW9rGjsBxh9bbw/XemB/wvOXNd7Eks9q3TvH23VAe3uS0xA1qGUN
 FIqc1PsbR5HknYV28TI65/uI9c2eo3b7eZxiM4eNKhENvQOSH/AibU0PlSwji5Fz1Q9W
 1hAPfTavaMbcQMSBuyqkQ7F58gjQMjybNvPOdqYRLjemaYi8eY0RKd1SfsVmePC4KOBf
 6jF26I5wJUpC97px0sj79gpXvI+wDyu0H6OtSmi5SLRaEmx/J3Va+GAyjqjAdlXmaBPb
 OIDlLCJJG3hXydfKjdhK6PBvcLVRfsy5UgVWWuKxpz+rDBx9ZhVdo7qj5w1t3vvAjuZq
 Naug==
X-Gm-Message-State: AOAM530uXj185hPQXK1M3YlCQQkL1q2UOJHnfcBpTZM4ctdXBQrQ8gSc
 iNLPpL5JH/CADq9Pr65oyA2MSw==
X-Google-Smtp-Source: ABdhPJzqo5NCKvodjX4ja98EmGIcdRvfqMwdCZvhX6di+SU4DGmHSoRgHzm3dyCrDxHXLtFda+ZwLQ==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr25785958wmj.15.1639249906394; 
 Sat, 11 Dec 2021 11:11:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/26] hw/intc/arm_gicv3_its: Use FIELD macros for DTEs
Date: Sat, 11 Dec 2021 19:11:19 +0000
Message-Id: <20211211191135.1764649-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the ITS code that reads and writes DTEs uses open-coded
shift-and-mask to assemble the various fields into the 64-bit DTE
word.  The names of the macros used for mask and shift values are
also somewhat inconsistent, and don't follow our usual convention
that a MASK macro should specify the bits in their place in the word.
Replace all these with use of the FIELD macro.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h |  7 ++++---
 hw/intc/arm_gicv3_its.c  | 20 +++++++++-----------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 5a63e9ed5ce..6a3b145f377 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -393,9 +393,10 @@ FIELD(ITE_H, VPEID, 16, 16)
  * Valid = 1 bit,ITTAddr = 44 bits,Size = 5 bits
  */
 #define GITS_DTE_SIZE                 (0x8ULL)
-#define GITS_DTE_ITTADDR_SHIFT           6
-#define GITS_DTE_ITTADDR_MASK         MAKE_64BIT_MASK(GITS_DTE_ITTADDR_SHIFT, \
-                                                      ITTADDR_LENGTH)
+
+FIELD(DTE, VALID, 0, 1)
+FIELD(DTE, SIZE, 1, 5)
+FIELD(DTE, ITTADDR, 6, 44)
 
 /*
  * 8 bytes Collection Table Entry size
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 6f21c56fba2..7a217b00f89 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -114,7 +114,7 @@ static bool update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
     uint64_t itt_addr;
     MemTxResult res = MEMTX_OK;
 
-    itt_addr = (dte & GITS_DTE_ITTADDR_MASK) >> GITS_DTE_ITTADDR_SHIFT;
+    itt_addr = FIELD_EX64(dte, DTE, ITTADDR);
     itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
 
     address_space_stq_le(as, itt_addr + (eventid * (sizeof(uint64_t) +
@@ -141,7 +141,7 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
     bool status = false;
     IteEntry ite = {};
 
-    itt_addr = (dte & GITS_DTE_ITTADDR_MASK) >> GITS_DTE_ITTADDR_SHIFT;
+    itt_addr = FIELD_EX64(dte, DTE, ITTADDR);
     itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
 
     ite.itel = address_space_ldq_le(as, itt_addr +
@@ -255,10 +255,10 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     if (res != MEMTX_OK) {
         return result;
     }
-    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
+    dte_valid = FIELD_EX64(dte, DTE, VALID);
 
     if (dte_valid) {
-        max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
+        max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
 
         ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
 
@@ -375,10 +375,8 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     if (res != MEMTX_OK) {
         return result;
     }
-    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
-
-    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
-
+    dte_valid = FIELD_EX64(dte, DTE, VALID);
+    max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
     max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
 
     if ((devid > s->dt.max_ids) || (icid > s->ct.max_ids)
@@ -529,9 +527,9 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
     if (s->dt.valid) {
         if (valid) {
             /* add mapping entry to device table */
-            dte = (valid & TABLE_ENTRY_VALID_MASK) |
-                  ((size & SIZE_MASK) << 1U) |
-                  (itt_addr << GITS_DTE_ITTADDR_SHIFT);
+            dte = FIELD_DP64(dte, DTE, VALID, 1);
+            dte = FIELD_DP64(dte, DTE, SIZE, size);
+            dte = FIELD_DP64(dte, DTE, ITTADDR, itt_addr);
         }
     } else {
         return true;
-- 
2.25.1


