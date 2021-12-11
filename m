Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E24E4715AC
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:25:53 +0100 (CET)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw80G-00088C-CS
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:25:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mo-00050r-W2
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:00 -0500
Received: from [2a00:1450:4864:20::332] (port=53138
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mi-0006Fo-4F
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:56 -0500
Received: by mail-wm1-x332.google.com with SMTP id o29so9202406wms.2
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I3wAglRq0v7J28qeq3AcCdmuBqd8GqSly1K8jDYrRM4=;
 b=OBC8biFBeuU/siCqS1vhHI4uu4XzgzQg3UVG/lR+TlCYPM3dCHp1duFU46iiJSWcD8
 ucOjXIKtSwnqS1YAaIW0ogbTAz1gcu3lLbLviIdEY1JgYAgRgqvAKSkhAGBH8mOI/D7n
 cSnXIBawCds1F8TL+8tjyIsC+QCs8opIz1IppZcElySH3MQ/f5s+wIZxWJsx1AQk8a5C
 LFGFLr6LlTJTa8Zv0jYJWo0zRkhDG4aZm+JbelywUnqmftCDSkqRBkuHnwxcPXtI/pq+
 VHL/IzTQ1WZstYPTPV+DLA5rM5vcRWH5vZc5cyRlOoyhdW/VrCCAB88v858IzJBN4gly
 isVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I3wAglRq0v7J28qeq3AcCdmuBqd8GqSly1K8jDYrRM4=;
 b=V/hSdi+vTd0OgfRfV50HkjMd+Y3hZVrfcOfjyuB988KLg69GCLBqz2Y0hmWB8GnVVT
 L83TEFbaOICQps6SOnys7vCs+IMzc1a1rAMu66oQbMn6kKywSoGbxl2qgx3phiUgiL9h
 Rcwk0k4006kCOQMDPUusLfqc+kMsz4RWmCTcMRHkq76d7BucntaAqJyPZkRdqTegPzXK
 XuZw51mglpHMbkJtupTOtXdGACQ5heMWRImWqmD+latxn/buj+IVeua28/OXEa10oOYG
 MKVb67Q2kitgSwn+D1nyJWUAdhGsespOBKsvYnonQ7XRbo0Rleihy64YCn/awQcwZoBF
 eMcw==
X-Gm-Message-State: AOAM532me+mPtkX4Kq48ne84v24pxSDLuzz99by867IMJW6W6DvqzKzY
 op0fSKtC0K39vVPcqqLqYMDb2w==
X-Google-Smtp-Source: ABdhPJz49mMIsEzltdJe9rgj8tddo8bntoycyyVCNFq225zVlpjVt6tXbyTCdAEyii8POyDE8lTsUw==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr25310546wma.162.1639249910150; 
 Sat, 11 Dec 2021 11:11:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 16/26] hw/intc/arm_gicv3_its: Fix event ID bounds checks
Date: Sat, 11 Dec 2021 19:11:25 +0000
Message-Id: <20211211191135.1764649-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

In process_its_cmd() and process_mapti() we must check the
event ID against a limit defined by the size field in the DTE,
which specifies the number of ID bits minus one. Convert
this code to our num_foo convention, fixing the off-by-one error.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index e4105282b57..8561392fdbe 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -225,7 +225,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     MemTxResult res = MEMTX_OK;
     bool dte_valid;
     uint64_t dte = 0;
-    uint32_t max_eventid;
+    uint32_t num_eventids;
     uint16_t icid = 0;
     uint32_t pIntid = 0;
     bool ite_valid = false;
@@ -258,7 +258,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     dte_valid = FIELD_EX64(dte, DTE, VALID);
 
     if (dte_valid) {
-        max_eventid = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+        num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
 
         ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
 
@@ -299,10 +299,10 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
                       dte_valid ? "valid" : "invalid",
                       ite_valid ? "valid" : "invalid",
                       cte_valid ? "valid" : "invalid");
-    } else if (eventid > max_eventid) {
+    } else if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: eventid %d > %d\n",
-                      __func__, eventid, max_eventid);
+                      __func__, eventid, num_eventids);
     } else {
         /*
          * Current implementation only supports rdbase == procnum
@@ -336,7 +336,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid, eventid;
     uint32_t pIntid = 0;
-    uint32_t max_eventid, max_Intid;
+    uint32_t num_eventids, max_Intid;
     bool dte_valid;
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
@@ -376,11 +376,11 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         return result;
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
-    max_eventid = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+    num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
     max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
 
     if ((devid >= s->dt.num_ids) || (icid >= s->ct.num_ids)
-            || !dte_valid || (eventid > max_eventid) ||
+            || !dte_valid || (eventid >= num_eventids) ||
             (((pIntid < GICV3_LPI_INTID_START) || (pIntid > max_Intid)) &&
              (pIntid != INTID_SPURIOUS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
-- 
2.25.1


