Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F144ADAD0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:07:43 +0100 (CET)
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHR9h-0004uO-Oq
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:07:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOrS-000162-Va
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:45 -0500
Received: from [2a00:1450:4864:20::42a] (port=37434
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqw-0002KW-DY
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:17 -0500
Received: by mail-wr1-x42a.google.com with SMTP id w11so30204855wra.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HSePLC3CQFBtM40/pCnr2cnwRaT/DzoxkqceSrf8Vpc=;
 b=aCscCFKQSmDyCzcPky81DcQWZQjBeD5JevWxSCR+rphNYh0lKaLu68fC9ARi2vjYqQ
 gGl1uUZ25OHBad5seaTsram+kp+xu4Y7j4mTPOOgIdhWhvmkarZcAqv33lLKwV/M0W8b
 2WJA7b8A6vO0TKMixtqWojDHlzkZLB7xgJ2ZH/G1gCeHJQSitcqInBnyD8K4/N0WuWAb
 ijhNUf7F9DrWT4tIdc5FlXL/+lpHkLUQQmyOXiD1rv+lIyO8rrv7LXXt2ANSwdtL1GBP
 TZlcBxHCIuMqOCs0UTviwutHldaN23/efRkxgj46BI96uffhkYyEvYe5E6K0bRYvWTik
 x9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HSePLC3CQFBtM40/pCnr2cnwRaT/DzoxkqceSrf8Vpc=;
 b=DiT5aZpin23nXj+f+0T2mMT3w4rdf6WUUeOdxUppaSGNgclo+ZqAiqLgIwrs9acsH7
 xuLyN4hqan2YF1m7UDWR3XarF8TvWS2rKFX+Rvehos46+BeQMiZxALVI/i9BTQdWzvVE
 AVBs8VzMvL1RQoeP/N1DfFAqu1o/In998mfdBuTeyItxHqRRvDRBq/m+5hRncskPN9G6
 OEr7loccKMxLbGxQ9ogP1PMilFT1h2HF69ISbrT4lAm9g7se9hidwguTeK78Wn0HSvvQ
 nSYFqFRUdEfJICh+QTx/LoJUvw1MwkF8Lwv8J9eoahVCOPENkm4JBwIBlYpr+rcQS1f0
 MDWQ==
X-Gm-Message-State: AOAM533kTLpBZksqAhY9/rpk9FrSCr5m8FntULrZV2cWvaMUClot1bIi
 NkMvI68POucB9dXz+BNOstZ0JivIB82Daw==
X-Google-Smtp-Source: ABdhPJxJv7u6WUP28GqUOyWVg61I+1XoUTjn3n8syc11THqLINMY2pv6VYe1qiYJ4Bgn+wJj9d2S3w==
X-Received: by 2002:adf:f981:: with SMTP id f1mr3183563wrr.651.1644320408482; 
 Tue, 08 Feb 2022 03:40:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/39] hw/intc/arm_gicv3_its: Pass DTEntry to update_dte()
Date: Tue,  8 Feb 2022 11:39:37 +0000
Message-Id: <20220208113948.3217356-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make update_dte() take a DTEntry struct rather than all the fields of
the new DTE as separate arguments.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220201193207.2771604-4-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 6d70d7d59e2..1856210e79a 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -465,20 +465,23 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
     return update_cte(s, icid, valid, rdbase) ? CMD_CONTINUE : CMD_STALL;
 }
 
-static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
-                       uint8_t size, uint64_t itt_addr)
+/*
+ * Update the Device Table entry for @devid to @dte. Returns true
+ * on success, false if there was a memory access error.
+ */
+static bool update_dte(GICv3ITSState *s, uint32_t devid, const DTEntry *dte)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint64_t entry_addr;
-    uint64_t dte = 0;
+    uint64_t dteval = 0;
     MemTxResult res = MEMTX_OK;
 
     if (s->dt.valid) {
-        if (valid) {
+        if (dte->valid) {
             /* add mapping entry to device table */
-            dte = FIELD_DP64(dte, DTE, VALID, 1);
-            dte = FIELD_DP64(dte, DTE, SIZE, size);
-            dte = FIELD_DP64(dte, DTE, ITTADDR, itt_addr);
+            dteval = FIELD_DP64(dteval, DTE, VALID, 1);
+            dteval = FIELD_DP64(dteval, DTE, SIZE, dte->size);
+            dteval = FIELD_DP64(dteval, DTE, ITTADDR, dte->ittaddr);
         }
     } else {
         return true;
@@ -493,27 +496,25 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
         /* No L2 table for this index: discard write and continue */
         return true;
     }
-    address_space_stq_le(as, entry_addr, dte, MEMTXATTRS_UNSPECIFIED, &res);
+    address_space_stq_le(as, entry_addr, dteval, MEMTXATTRS_UNSPECIFIED, &res);
     return res == MEMTX_OK;
 }
 
 static ItsCmdResult process_mapd(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint32_t devid;
-    uint8_t size;
-    uint64_t itt_addr;
-    bool valid;
+    DTEntry dte;
 
     devid = (cmdpkt[0] & DEVID_MASK) >> DEVID_SHIFT;
-    size = cmdpkt[1] & SIZE_MASK;
-    itt_addr = (cmdpkt[2] & ITTADDR_MASK) >> ITTADDR_SHIFT;
-    valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
+    dte.size = cmdpkt[1] & SIZE_MASK;
+    dte.ittaddr = (cmdpkt[2] & ITTADDR_MASK) >> ITTADDR_SHIFT;
+    dte.valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
 
     if ((devid >= s->dt.num_entries) ||
-        (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
+        (dte.size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPD: invalid device table attributes "
-                      "devid %d or size %d\n", devid, size);
+                      "devid %d or size %d\n", devid, dte.size);
         /*
          * in this implementation, in case of error
          * we ignore this command and move onto the next
@@ -522,7 +523,7 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    return update_dte(s, devid, valid, size, itt_addr) ? CMD_CONTINUE : CMD_STALL;
+    return update_dte(s, devid, &dte) ? CMD_CONTINUE : CMD_STALL;
 }
 
 static ItsCmdResult process_movall(GICv3ITSState *s, const uint64_t *cmdpkt)
-- 
2.25.1


