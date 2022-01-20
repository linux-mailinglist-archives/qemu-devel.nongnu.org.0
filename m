Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A1849543E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:34:50 +0100 (CET)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAcGn-0001P9-AK
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:34:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgi-0004JE-MO
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:14 -0500
Received: from [2a00:1450:4864:20::331] (port=39742
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgZ-0003If-Vf
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:06 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso7093441wmh.4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7ld23nK8ASvRkvHvhF0mF43an93w9LT5/+5RX+ASHV8=;
 b=UkCm0ouCWr1ircHMZxZt1SqEXs3CvnwnMiwtFBTjAUwkJcDIPhiqqT1o610KED6R63
 Zl4gXo6wW/2czneIOU1xEUBy5o/CKgFERY0cf4xyZrR5D9gDOZf9OEI86Evzy4v7f3Li
 51bX2f6TXHYPZ8xtRit5apxYY5jep8MnQPp1ASkkZefKnV6sKAxq35iG4Tg7f4LW1cIp
 uJrVVm5GyQWfkfz6HKAmalSw4muKHvpXVj0L8glSahSS3WexVr5qOyT5fDPFWThaLbe+
 JLsUiu71NUcSOWVR0Uh7LbvysM2BJ5GDMtNYJiC6s3AIWEHlPTqqmQC4jpfDEwPJJzFZ
 O74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ld23nK8ASvRkvHvhF0mF43an93w9LT5/+5RX+ASHV8=;
 b=1ta0FZD6VM4zzGfwlddzIA5LNuL2Kak5LoDPY/r1+BJh+ASqtYsV4xPKpGQHIhoxLK
 TcVDVMGVw3y7tpFq5TN6pi2R4ua6OqtkUkjrlaqbeXepVbsBhTGy7b8suraHl/Nfrmu2
 6vbasKuLKt8ytU1Ug0vIXWN0q3/CpGacFjos4CwAlt46xtMB9P/zlvroMIfr6/3AXnI+
 Rjy+kBR1wziUpJSu5PO+Z2Ixx7CBbD0ZzaIkKWnZc2vCwFu0kI0MwQ3Ag+dT93IkYYQd
 5lyzokG7lzRnhnvabAAHrAhx3/2ViY9+9OulLGwdl1WfqINRuL5Ev/hRgw/0r6a0FY1J
 WX3A==
X-Gm-Message-State: AOAM531tuF78CW66Le6paKjPGv7sei6SgaVfcgozHF7y4e6S2fpNIcH+
 X3EwiH+iu1wRlEW51P4y6XXphi1zl5JeeQ==
X-Google-Smtp-Source: ABdhPJxFJ4/jsKc1uxBaKS7helVkyhMZP/P69NeXdFbyOODNkpAuvy9ekO0V1f7SUwwr7dley5YXnA==
X-Received: by 2002:adf:e2cc:: with SMTP id d12mr33056925wrj.107.1642682221896; 
 Thu, 20 Jan 2022 04:37:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.37.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/38] hw/intc/arm_gicv3_its: Fix event ID bounds checks
Date: Thu, 20 Jan 2022 12:36:17 +0000
Message-Id: <20220120123630.267975-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

In process_its_cmd() and process_mapti() we must check the
event ID against a limit defined by the size field in the DTE,
which specifies the number of ID bits minus one. Convert
this code to our num_foo convention:
 * change the variable names
 * use uint64_t and 1ULL when calculating the number
   of valid event IDs, because DTE.SIZE is 5 bits and
   so num_eventids may be up to 2^32
 * fix the off-by-one error in the comparison

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20220111171048.3545974-2-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index fa3cdb57554..6d11fa02040 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -225,7 +225,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     MemTxResult res = MEMTX_OK;
     bool dte_valid;
     uint64_t dte = 0;
-    uint32_t max_eventid;
+    uint64_t num_eventids;
     uint16_t icid = 0;
     uint32_t pIntid = 0;
     bool ite_valid = false;
@@ -258,7 +258,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     dte_valid = FIELD_EX64(dte, DTE, VALID);
 
     if (dte_valid) {
-        max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+        num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
 
         ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
 
@@ -299,10 +299,11 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
                       dte_valid ? "valid" : "invalid",
                       ite_valid ? "valid" : "invalid",
                       cte_valid ? "valid" : "invalid");
-    } else if (eventid > max_eventid) {
+    } else if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: eventid %d > %d\n",
-                      __func__, eventid, max_eventid);
+                      "%s: invalid command attributes: eventid %d >= %"
+                      PRId64 "\n",
+                      __func__, eventid, num_eventids);
     } else {
         /*
          * Current implementation only supports rdbase == procnum
@@ -336,7 +337,8 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid, eventid;
     uint32_t pIntid = 0;
-    uint32_t max_eventid, max_Intid;
+    uint64_t num_eventids;
+    uint32_t max_Intid;
     bool dte_valid;
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
@@ -376,11 +378,11 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         return result;
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
-    max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
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


