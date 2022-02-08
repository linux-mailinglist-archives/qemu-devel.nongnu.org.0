Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E704ADB90
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:51:15 +0100 (CET)
Received: from localhost ([::1]:33210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRpq-00016n-Tp
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:51:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOrS-00015z-V0
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:45 -0500
Received: from [2a00:1450:4864:20::434] (port=34311
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqx-0002Ki-6K
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:18 -0500
Received: by mail-wr1-x434.google.com with SMTP id f17so30223584wrx.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=keqKBjLZSfQavofr1KknVuxPyJINzN8sPoLRoq5UyvA=;
 b=kcAFY7XfPoqIpwJ7AFrdsf2bJ7ikzNuX2y88fHQPtxHTB69kQdE2PQoJT/erqF4e+6
 rZrFFyfYgjEytPoOFpPpi1QJouDAwTKuGkqJWQTGclinD6X+NOhUgNYbd0BAoauH3qs5
 XrTNlTal/N2cN+A+qnpRJCPyrGwbxYXgys8+PitmbnCUVQk9+hB4God9Koadx599ChAc
 sA1mbsrVbJmEtlUtUDSRiP7rRkkaytSmo6Li66AJTCFrwziTrwZC616ymzfckyY0C0/j
 reCOrLyDGzSxBIoVB5AHc2wqwONEogA0CRpbR6fdX76xrCu5d5W+3o8jjLqZKLqvDiP+
 ZlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=keqKBjLZSfQavofr1KknVuxPyJINzN8sPoLRoq5UyvA=;
 b=Re8/ANCAbRoFfiEQp98QVoEVqVfV+cc7R59n6SxPI6O8f3yTGto0CblHjDv/jwlkoA
 Ra2RcfWgrQfzU4bsFrvSNtaz+G62+ouEY5GFUzUceTbpFPKUyLFfT2V8hWxDDJQLY7bZ
 bGJXcvOSj3JQSVamV2pUkSPQNK0+KSiSZL2iy+KS1T5oWRd9QP179VSEMCgk/QpIqVIp
 y3ZC7bbVYJonsQri82WQvCe5rhErBlkK6y/ZiznCFBtGPLKuzCGINEXU/bas4yEqm6/p
 veGMc+xP2dFIZANdC18KcQxdvizcVe2VRAU6WN8nVxNABBPnzl+rx0CqQ45rsrUAJMs5
 r6OQ==
X-Gm-Message-State: AOAM532HjiwHXghTMFbWjwWaag6mcJ/2o/BuDOKUcFMEfddYL17PRONQ
 UUOIDG2MB2g2zEfbgU1CMlomv6J0BHY7ug==
X-Google-Smtp-Source: ABdhPJx1c4jkL+oTIkIRrO0z+D5UefntZXzkt1+YNE/Y/cQIgjB18M/auV1ucbWwpmx4fZ3TJyNdIA==
X-Received: by 2002:a05:6000:1564:: with SMTP id
 4mr3273789wrz.56.1644320409819; 
 Tue, 08 Feb 2022 03:40:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/39] hw/intc/arm_gicv3_its: Pass CTEntry to update_cte()
Date: Tue,  8 Feb 2022 11:39:39 +0000
Message-Id: <20220208113948.3217356-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Make update_cte() take a CTEntry struct rather than all the fields
of the new CTE as separate arguments.

This brings it into line with the update_dte() API.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220201193207.2771604-6-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 482a71ba73c..b94775fd379 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -418,22 +418,25 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
-static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
-                       uint64_t rdbase)
+/*
+ * Update the Collection Table entry for @icid to @cte. Returns true
+ * on success, false if there was a memory access error.
+ */
+static bool update_cte(GICv3ITSState *s, uint16_t icid, const CTEntry *cte)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint64_t entry_addr;
-    uint64_t cte = 0;
+    uint64_t cteval = 0;
     MemTxResult res = MEMTX_OK;
 
     if (!s->ct.valid) {
         return true;
     }
 
-    if (valid) {
+    if (cte->valid) {
         /* add mapping entry to collection table */
-        cte = FIELD_DP64(cte, CTE, VALID, 1);
-        cte = FIELD_DP64(cte, CTE, RDBASE, rdbase);
+        cteval = FIELD_DP64(cteval, CTE, VALID, 1);
+        cteval = FIELD_DP64(cteval, CTE, RDBASE, cte->rdbase);
     }
 
     entry_addr = table_entry_addr(s, &s->ct, icid, &res);
@@ -446,27 +449,26 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
         return true;
     }
 
-    address_space_stq_le(as, entry_addr, cte, MEMTXATTRS_UNSPECIFIED, &res);
+    address_space_stq_le(as, entry_addr, cteval, MEMTXATTRS_UNSPECIFIED, &res);
     return res == MEMTX_OK;
 }
 
 static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint16_t icid;
-    uint64_t rdbase;
-    bool valid;
+    CTEntry cte;
 
     icid = cmdpkt[2] & ICID_MASK;
 
-    rdbase = (cmdpkt[2] & R_MAPC_RDBASE_MASK) >> R_MAPC_RDBASE_SHIFT;
-    rdbase &= RDBASE_PROCNUM_MASK;
+    cte.rdbase = (cmdpkt[2] & R_MAPC_RDBASE_MASK) >> R_MAPC_RDBASE_SHIFT;
+    cte.rdbase &= RDBASE_PROCNUM_MASK;
 
-    valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
+    cte.valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
 
-    if ((icid >= s->ct.num_entries) || (rdbase >= s->gicv3->num_cpu)) {
+    if ((icid >= s->ct.num_entries) || (cte.rdbase >= s->gicv3->num_cpu)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPC: invalid collection table attributes "
-                      "icid %d rdbase %" PRIu64 "\n",  icid, rdbase);
+                      "icid %d rdbase %u\n",  icid, cte.rdbase);
         /*
          * in this implementation, in case of error
          * we ignore this command and move onto the next
@@ -475,7 +477,7 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    return update_cte(s, icid, valid, rdbase) ? CMD_CONTINUE : CMD_STALL;
+    return update_cte(s, icid, &cte) ? CMD_CONTINUE : CMD_STALL;
 }
 
 /*
-- 
2.25.1


