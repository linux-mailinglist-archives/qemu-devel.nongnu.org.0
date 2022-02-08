Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8123C4ADB2B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:32:00 +0100 (CET)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRXD-0006OQ-Fj
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:31:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOrS-000161-VS
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:44 -0500
Received: from [2a00:1450:4864:20::42b] (port=43870
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqw-0002GC-DA
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:16 -0500
Received: by mail-wr1-x42b.google.com with SMTP id i14so539190wrc.10
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=c5mg1sNC/wyzllW1lIoDZ1cl9qJaOMFNomNf1hGBhD4=;
 b=x54jSh9U4xwDFck+rAPimKknPhbgnufPpGvYvNdUahSwRAuWokmDzUVGl5LabxMPvt
 okgbCSlk2YrYT0u63ULLBip1+N6ruNak9OBUT2nkjeGtnuunGRwcCfVZ9FK6yNGI2+xq
 8Ms7fRx1Nuu5T+mV7vwQ4UIfZVZ3QS8lzhtRZKXzmeOv3qJAUj63j9Q6F2JYq9c5djp7
 tZYrv4NIrYk73aiXrrYhHzscliAqCXg/JAHPMUe5M1Twfh/I+9cjWp6mqjmCHg+rFyjL
 OPzanGDyCDNeSCaRSoBkCmMPCfkzSxkj3ifDfevOA5JNLs2vEM0dkuQOQs4InCmq52yx
 eJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c5mg1sNC/wyzllW1lIoDZ1cl9qJaOMFNomNf1hGBhD4=;
 b=8LqZToOYzLZvHWepm9dqESCH1Jj1YL5uY8qswC7lCQncSjvzxat8a9c0Nz12ymL2Nz
 ZpETHdeEyWfn3Lek/rFexdAFgUANxy95fWLVSYDyc8QG8xR5tzK22svj90G3OOSRUDGi
 6PWSCSy3Qe3kL+Zm3MXpgPL5F1+11x7rkeAjwGdqOFRWITXMSITZxbgpSDQ1Bpov/clC
 x0xWIGs3XEG+/bxSbE9wuJ+00WEuStEVp+XbVdy8+k3MgispoOoLTv9ABVBwLYHOcGzQ
 kHwo7UJCU4VcYgDr66PHshvnQk9nV4sYu7VlTJF4r5BoRK5c+4Kz0XWu9JLUGGZ/7CVw
 YQIQ==
X-Gm-Message-State: AOAM533jT+dcebRL32bkgwr/AH64Zs6WuhNh9zCSgRafaBLybEZFArNh
 EGwn/vKT0mxx+X9lt09XkNwQNyWU7wRIvw==
X-Google-Smtp-Source: ABdhPJzWZlq2jU0CQbr8/QHEBAmsKB0Ikg++a8RmPO8QTgofrzoPGqWgpjE4rTiHn8WCTaR3k5Wh6w==
X-Received: by 2002:a5d:500c:: with SMTP id e12mr3144354wrt.193.1644320407842; 
 Tue, 08 Feb 2022 03:40:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/39] hw/intc/arm_gicv3_its: Keep DTEs as a struct,
 not a raw uint64_t
Date: Tue,  8 Feb 2022 11:39:36 +0000
Message-Id: <20220208113948.3217356-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

In the ITS, a DTE is an entry in the device table, which contains
multiple fields. Currently the function get_dte() which reads one
entry from the device table returns it as a raw 64-bit integer,
which we then pass around in that form, only extracting fields
from it as we need them.

Create a real C struct with the same fields as the DTE, and
populate it in get_dte(), so that that function and update_dte()
are the only ones that need to care about the in-guest-memory
format of the DTE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220201193207.2771604-3-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 111 ++++++++++++++++++++--------------------
 1 file changed, 56 insertions(+), 55 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index b74753fb8fe..6d70d7d59e2 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -46,6 +46,12 @@ typedef struct {
     uint64_t itel;
 } IteEntry;
 
+typedef struct DTEntry {
+    bool valid;
+    unsigned size;
+    uint64_t ittaddr;
+} DTEntry;
+
 /*
  * The ITS spec permits a range of CONSTRAINED UNPREDICTABLE options
  * if a command parameter is not correct. These include both "stall
@@ -143,22 +149,18 @@ static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
     return FIELD_EX64(*cte, CTE, VALID);
 }
 
-static bool update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
+static bool update_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
                        IteEntry ite)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t itt_addr;
     MemTxResult res = MEMTX_OK;
 
-    itt_addr = FIELD_EX64(dte, DTE, ITTADDR);
-    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
-
-    address_space_stq_le(as, itt_addr + (eventid * (sizeof(uint64_t) +
+    address_space_stq_le(as, dte->ittaddr + (eventid * (sizeof(uint64_t) +
                          sizeof(uint32_t))), ite.itel, MEMTXATTRS_UNSPECIFIED,
                          &res);
 
     if (res == MEMTX_OK) {
-        address_space_stl_le(as, itt_addr + (eventid * (sizeof(uint64_t) +
+        address_space_stl_le(as, dte->ittaddr + (eventid * (sizeof(uint64_t) +
                              sizeof(uint32_t))) + sizeof(uint32_t), ite.iteh,
                              MEMTXATTRS_UNSPECIFIED, &res);
     }
@@ -169,24 +171,20 @@ static bool update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
     }
 }
 
-static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
+static bool get_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
                     uint16_t *icid, uint32_t *pIntid, MemTxResult *res)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t itt_addr;
     bool status = false;
     IteEntry ite = {};
 
-    itt_addr = FIELD_EX64(dte, DTE, ITTADDR);
-    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
-
-    ite.itel = address_space_ldq_le(as, itt_addr +
+    ite.itel = address_space_ldq_le(as, dte->ittaddr +
                                     (eventid * (sizeof(uint64_t) +
                                     sizeof(uint32_t))), MEMTXATTRS_UNSPECIFIED,
                                     res);
 
     if (*res == MEMTX_OK) {
-        ite.iteh = address_space_ldl_le(as, itt_addr +
+        ite.iteh = address_space_ldl_le(as, dte->ittaddr +
                                         (eventid * (sizeof(uint64_t) +
                                         sizeof(uint32_t))) + sizeof(uint32_t),
                                         MEMTXATTRS_UNSPECIFIED, res);
@@ -205,15 +203,33 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
     return status;
 }
 
-static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
+/*
+ * Read the Device Table entry at index @devid. On success (including
+ * successfully determining that there is no valid DTE for this index),
+ * we return MEMTX_OK and populate the DTEntry struct accordingly.
+ * If there is an error reading memory then we return the error code.
+ */
+static MemTxResult get_dte(GICv3ITSState *s, uint32_t devid, DTEntry *dte)
 {
+    MemTxResult res = MEMTX_OK;
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t entry_addr = table_entry_addr(s, &s->dt, devid, res);
+    uint64_t entry_addr = table_entry_addr(s, &s->dt, devid, &res);
+    uint64_t dteval;
 
     if (entry_addr == -1) {
-        return 0; /* a DTE entry with the Valid bit clear */
+        /* No L2 table entry, i.e. no valid DTE, or a memory error */
+        dte->valid = false;
+        return res;
     }
-    return address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, res);
+    dteval = address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        return res;
+    }
+    dte->valid = FIELD_EX64(dteval, DTE, VALID);
+    dte->size = FIELD_EX64(dteval, DTE, SIZE);
+    /* DTE word field stores bits [51:8] of the ITT address */
+    dte->ittaddr = FIELD_EX64(dteval, DTE, ITTADDR) << ITTADDR_SHIFT;
+    return MEMTX_OK;
 }
 
 /*
@@ -228,8 +244,6 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
                                        uint32_t eventid, ItsCmdType cmd)
 {
     MemTxResult res = MEMTX_OK;
-    bool dte_valid;
-    uint64_t dte = 0;
     uint64_t num_eventids;
     uint16_t icid = 0;
     uint32_t pIntid = 0;
@@ -237,6 +251,7 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
     uint64_t cte = 0;
     bool cte_valid = false;
     uint64_t rdbase;
+    DTEntry dte;
 
     if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -245,23 +260,17 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
         return CMD_CONTINUE;
     }
 
-    dte = get_dte(s, devid, &res);
-
-    if (res != MEMTX_OK) {
+    if (get_dte(s, devid, &dte) != MEMTX_OK) {
         return CMD_STALL;
     }
-    dte_valid = FIELD_EX64(dte, DTE, VALID);
-
-    if (!dte_valid) {
+    if (!dte.valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
-                      "invalid dte: %"PRIx64" for %d\n",
-                      __func__, dte, devid);
+                      "invalid dte for %d\n", __func__, devid);
         return CMD_CONTINUE;
     }
 
-    num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
-
+    num_eventids = 1ULL << (dte.size + 1);
     if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: eventid %d >= %"
@@ -270,7 +279,7 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
         return CMD_CONTINUE;
     }
 
-    ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
+    ite_valid = get_ite(s, eventid, &dte, &icid, &pIntid, &res);
     if (res != MEMTX_OK) {
         return CMD_STALL;
     }
@@ -320,7 +329,7 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
     if (cmd == DISCARD) {
         IteEntry ite = {};
         /* remove mapping from interrupt translation table */
-        return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+        return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
     }
     return CMD_CONTINUE;
 }
@@ -341,11 +350,9 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     uint32_t pIntid = 0;
     uint64_t num_eventids;
     uint32_t num_intids;
-    bool dte_valid;
-    MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
-    uint64_t dte = 0;
     IteEntry ite = {};
+    DTEntry dte;
 
     devid = (cmdpkt[0] & DEVID_MASK) >> DEVID_SHIFT;
     eventid = cmdpkt[1] & EVENTID_MASK;
@@ -365,24 +372,21 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
         return CMD_CONTINUE;
     }
 
-    dte = get_dte(s, devid, &res);
-
-    if (res != MEMTX_OK) {
+    if (get_dte(s, devid, &dte) != MEMTX_OK) {
         return CMD_STALL;
     }
-    dte_valid = FIELD_EX64(dte, DTE, VALID);
-    num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+    num_eventids = 1ULL << (dte.size + 1);
     num_intids = 1ULL << (GICD_TYPER_IDBITS + 1);
 
     if ((icid >= s->ct.num_entries)
-            || !dte_valid || (eventid >= num_eventids) ||
+            || !dte.valid || (eventid >= num_eventids) ||
             (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)) &&
              (pIntid != INTID_SPURIOUS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes "
                       "icid %d or eventid %d or pIntid %d or"
                       "unmapped dte %d\n", __func__, icid, eventid,
-                      pIntid, dte_valid);
+                      pIntid, dte.valid);
         /*
          * in this implementation, in case of error
          * we ignore this command and move onto the next
@@ -392,13 +396,13 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     }
 
     /* add ite entry to interrupt translation table */
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, dte_valid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, true);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
     ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
 
-    return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+    return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
 static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
@@ -561,10 +565,10 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
     uint16_t old_icid, new_icid;
     uint64_t old_cte, new_cte;
     uint64_t old_rdbase, new_rdbase;
-    uint64_t dte;
-    bool dte_valid, ite_valid, cte_valid;
+    bool ite_valid, cte_valid;
     uint64_t num_eventids;
     IteEntry ite = {};
+    DTEntry dte;
 
     devid = FIELD_EX64(cmdpkt[0], MOVI_0, DEVICEID);
     eventid = FIELD_EX64(cmdpkt[1], MOVI_1, EVENTID);
@@ -576,21 +580,18 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
                       __func__, devid, s->dt.num_entries);
         return CMD_CONTINUE;
     }
-    dte = get_dte(s, devid, &res);
-    if (res != MEMTX_OK) {
+    if (get_dte(s, devid, &dte) != MEMTX_OK) {
         return CMD_STALL;
     }
 
-    dte_valid = FIELD_EX64(dte, DTE, VALID);
-    if (!dte_valid) {
+    if (!dte.valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
-                      "invalid dte: %"PRIx64" for %d\n",
-                      __func__, dte, devid);
+                      "invalid dte for %d\n", __func__, devid);
         return CMD_CONTINUE;
     }
 
-    num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+    num_eventids = 1ULL << (dte.size + 1);
     if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: eventid %d >= %"
@@ -599,7 +600,7 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    ite_valid = get_ite(s, eventid, dte, &old_icid, &intid, &res);
+    ite_valid = get_ite(s, eventid, &dte, &old_icid, &intid, &res);
     if (res != MEMTX_OK) {
         return CMD_STALL;
     }
@@ -678,7 +679,7 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, intid);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
     ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, new_icid);
-    return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+    return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
 /*
-- 
2.25.1


