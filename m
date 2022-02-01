Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200F44A688F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:33:41 +0100 (CET)
Received: from localhost ([::1]:51550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF2ea-0001Hy-53
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:33:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEytB-0001nT-5C
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:32 -0500
Received: from [2a00:1450:4864:20::432] (port=36663
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEysv-0002Vz-ND
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:16 -0500
Received: by mail-wr1-x432.google.com with SMTP id u15so34046500wrt.3
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YvlbklIZ7LuGPJG4Zm4kfWOMRWUOqrvxpxIx0INpC+I=;
 b=b5MI7hVuCU7CMJq1/5ZgjhCwOhZiRch9rB9ajlPXBD4USaQMt/KoPRu5oBQP10uVm8
 hD7zBbP3k910QUSIcaLTJAYVfSvnopCSV2mp7FO2uFM7CAY8b0Il7JIaoZ1GBl39F3Ey
 EW76NIHdxqE99h8haum6ysMTP8hBlxHl8GawVwWNd1P+3bsoF8NpRkNc0k+A+igLtuLu
 vso59g65EkBTdqDzcgSDeBeIyn4rDBR5kSE3r1R52B1eF9LDD9HSwsQEGlVsX691hQ/U
 Pl1In1FsY2lWx99V/EwV6d3W7wNaLuuMwKlD9znPkqNlPkuy7GnPfKdGZ2HfxF5+Y1nW
 PmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YvlbklIZ7LuGPJG4Zm4kfWOMRWUOqrvxpxIx0INpC+I=;
 b=d7i/ZbL+OzhFN7zKqkVXWOOPaSQPL27ua/nuLWMaq7jJdj+LzZSlSD1ZOabHEvQq21
 6ebIVGV6TKhEe0C38y/EzULW3+nhHy67xhSztE5lxetbY3Xzy69m32sOa/f4g8TsfEUr
 QZRNjZ8+zkZ7KB5yiORmW80ZdDUqDb6q09tyY1ZR1+dEhxXrbSeqhhfcUho/nsuUYRjX
 XFX12hjst8HMlIo2FWzr/9FHAf6yyGpzCq1rdb74CIOz4AVM3LmkumXc/Vg1tlPra0st
 kI4gUwPuP4HkjGpmKZevzhhboWJdgqqPOXkDfKjUiWvk2hmIsM2rsaxgsJoMuuc601ET
 Y2aA==
X-Gm-Message-State: AOAM533g1xo6vhRZaHehgHteEAnSgVyc1HE4WZKhWiB4UJEsgVrYWeYR
 uFVVHBWO4mCTGBPlL++Oca+iQda2/0wY9w==
X-Google-Smtp-Source: ABdhPJx47/q3lUDrFlqc0+nDFucO/xlcXZzCBzZWuyZLKWYQxC9wqmF2eWLRyLre5p+Vxv+bltfBcg==
X-Received: by 2002:a5d:64a9:: with SMTP id m9mr21965365wrp.661.1643743932299; 
 Tue, 01 Feb 2022 11:32:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:32:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/13] hw/intc/arm_gicv3_its: Pass DTEntry to update_dte()
Date: Tue,  1 Feb 2022 19:31:57 +0000
Message-Id: <20220201193207.2771604-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make update_dte() take a DTEntry struct rather than all the fields of
the new DTE as separate arguments.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


