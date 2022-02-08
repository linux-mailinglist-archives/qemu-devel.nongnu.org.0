Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876444AD885
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:09:05 +0100 (CET)
Received: from localhost ([::1]:56366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQEy-0002lW-Ju
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:09:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOrT-000164-2N
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:44 -0500
Received: from [2a00:1450:4864:20::436] (port=39811
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqz-0002Ld-7D
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:20 -0500
Received: by mail-wr1-x436.google.com with SMTP id d27so1899805wrc.6
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7NPk/GFLa2bDZPmnC/VZgNCWvHi+FsQr21PrNbAwHpY=;
 b=KPQXthcNeJhfk9sbacfaiaOCqDuteBRzg+IYuNL/4bz7Ti8tUDlPmbS4VaR8I8keuE
 VNMjFXKXfJuvpf60NTzV04oB907Q8dsqPsSDW6FKsPuTYHvUkMia4NBGBgaojeYR3bXp
 yFoMPiAD6bJ3pYisfQ4bA/TI9ZLY2v8tq52wIB7wV7dTyzk4NdyUuzTtEyvjqA9MftsY
 uVPHM+1xtDMF9mriEH0wkRPtYrIFFvpPRlOQIFGh+WpRnDiUuzvoM3iRsiHOsDicbnMZ
 0YW10X+9hQb9BwMKbRYUFPWqKWLaWzHlJXinSQUFWjxDXcpoIHUc6mIvih8x7UmD8OyM
 zsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7NPk/GFLa2bDZPmnC/VZgNCWvHi+FsQr21PrNbAwHpY=;
 b=kJCz8cVdPinxjOLNZM6GcDSydGnxtQ1TvMZ9bljUrfZtjvXUueErM9qvOwhKwU4F+3
 D7MXnq/eMI5nJt6ZszCqhAHPc17sNI0Fe4tma30V4C//nuv+hPHgDGUjzFPbbb/vo1lz
 8EI5qWlvIN/FGixLjoXsKRIG0d9QyUvEqmMC6RM/MR+PAaFPfdYT1/KuYqj8BcTCmxiv
 8VtIkGa50+1YPBPOGezGifsw3JPI/dQtt7uk6/0/zEVsk1iZSS8fAfeRJXVic0ichozt
 rnXi6vlzJV48I2UNDvKNnkbJxsnNMBKRWhz2dbmPy/uXMWW662MLSR+ZChsfFR0tUsyb
 7cTA==
X-Gm-Message-State: AOAM531bj6K4cKzXPEsUJXZ0UzJ7Uvg9S7plJxpVq8zISNml8rVH4dDm
 hXGQtX3NrfP3mhP0fJKh75Pi8hqnVYfSig==
X-Google-Smtp-Source: ABdhPJzNypfXG5rWPaXGSG0Jl+ihXQH/AwW/dLFD1xxPxJOrF44lO6D+9wt2gobmgBS+JRfbw6t4Uw==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr3311260wrr.488.1644320411987; 
 Tue, 08 Feb 2022 03:40:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/39] hw/intc/arm_gicv3_its: Pass ITE values back from
 get_ite() via a struct
Date: Tue,  8 Feb 2022 11:39:42 +0000
Message-Id: <20220208113948.3217356-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

In get_ite() we currently return the caller some of the fields of an
Interrupt Table Entry via a set of pointer arguments, and validate
some of them internally (interrupt type and valid bit) to return a
simple true/false 'valid' indication. Define a new ITEntry struct
which has all the fields that the in-memory ITE has, and bring the
get_ite() function in to line with get_dte() and get_cte().

This paves the way for handling virtual interrupts, which will want
a different subset of the fields in the ITE. Handling them under
the old "lots of pointer arguments" scheme would have meant a
confusingly large set of arguments for this function.

The new struct ITEntry is obviously confusably similar to the
existing IteEntry struct, whose fields are the raw 12 bytes
of the in-memory ITE. In the next commit we will make update_ite()
use ITEntry instead of IteEntry, which will allow us to delete
the IteEntry struct and remove the confusion.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220201193207.2771604-9-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 102 ++++++++++++++++++++++------------------
 1 file changed, 55 insertions(+), 47 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 6975a349f62..bd741085022 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -57,6 +57,16 @@ typedef struct CTEntry {
     uint32_t rdbase;
 } CTEntry;
 
+typedef struct ITEntry {
+    bool valid;
+    int inttype;
+    uint32_t intid;
+    uint32_t doorbell;
+    uint32_t icid;
+    uint32_t vpeid;
+} ITEntry;
+
+
 /*
  * The ITS spec permits a range of CONSTRAINED UNPREDICTABLE options
  * if a command parameter is not correct. These include both "stall
@@ -188,34 +198,38 @@ static bool update_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
     }
 }
 
-static bool get_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
-                    uint16_t *icid, uint32_t *pIntid, MemTxResult *res)
+/*
+ * Read the Interrupt Table entry at index @eventid from the table specified
+ * by the DTE @dte. On success, we return MEMTX_OK and populate the ITEntry
+ * struct @ite accordingly. If there is an error reading memory then we return
+ * the error code.
+ */
+static MemTxResult get_ite(GICv3ITSState *s, uint32_t eventid,
+                           const DTEntry *dte, ITEntry *ite)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    bool status = false;
-    IteEntry ite = {};
+    MemTxResult res = MEMTX_OK;
+    uint64_t itel;
+    uint32_t iteh;
     hwaddr iteaddr = dte->ittaddr + eventid * ITS_ITT_ENTRY_SIZE;
 
-    ite.itel = address_space_ldq_le(as, iteaddr, MEMTXATTRS_UNSPECIFIED, res);
-    if (*res != MEMTX_OK) {
-        return false;
+    itel = address_space_ldq_le(as, iteaddr, MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        return res;
     }
 
-    ite.iteh = address_space_ldl_le(as, iteaddr + 8,
-                                    MEMTXATTRS_UNSPECIFIED, res);
-    if (*res != MEMTX_OK) {
-        return false;
+    iteh = address_space_ldl_le(as, iteaddr + 8, MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        return res;
     }
 
-    if (FIELD_EX64(ite.itel, ITE_L, VALID)) {
-        int inttype = FIELD_EX64(ite.itel, ITE_L, INTTYPE);
-        if (inttype == ITE_INTTYPE_PHYSICAL) {
-            *pIntid = FIELD_EX64(ite.itel, ITE_L, INTID);
-            *icid = FIELD_EX64(ite.itel, ITE_L, ICID);
-            status = true;
-        }
-    }
-    return status;
+    ite->valid = FIELD_EX64(itel, ITE_L, VALID);
+    ite->inttype = FIELD_EX64(itel, ITE_L, INTTYPE);
+    ite->intid = FIELD_EX64(itel, ITE_L, INTID);
+    ite->icid = FIELD_EX64(itel, ITE_L, ICID);
+    ite->vpeid = FIELD_EX64(itel, ITE_L, VPEID);
+    ite->doorbell = FIELD_EX64(iteh, ITE_H, DOORBELL);
+    return MEMTX_OK;
 }
 
 /*
@@ -258,13 +272,10 @@ static MemTxResult get_dte(GICv3ITSState *s, uint32_t devid, DTEntry *dte)
 static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
                                        uint32_t eventid, ItsCmdType cmd)
 {
-    MemTxResult res = MEMTX_OK;
     uint64_t num_eventids;
-    uint16_t icid = 0;
-    uint32_t pIntid = 0;
-    bool ite_valid = false;
     DTEntry dte;
     CTEntry cte;
+    ITEntry ite;
 
     if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -292,26 +303,25 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
         return CMD_CONTINUE;
     }
 
-    ite_valid = get_ite(s, eventid, &dte, &icid, &pIntid, &res);
-    if (res != MEMTX_OK) {
+    if (get_ite(s, eventid, &dte, &ite) != MEMTX_OK) {
         return CMD_STALL;
     }
 
-    if (!ite_valid) {
+    if (!ite.valid || ite.inttype != ITE_INTTYPE_PHYSICAL) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: invalid ITE\n",
                       __func__);
         return CMD_CONTINUE;
     }
 
-    if (icid >= s->ct.num_entries) {
+    if (ite.icid >= s->ct.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid ICID 0x%x in ITE (table corrupted?)\n",
-                      __func__, icid);
+                      __func__, ite.icid);
         return CMD_CONTINUE;
     }
 
-    if (get_cte(s, icid, &cte) != MEMTX_OK) {
+    if (get_cte(s, ite.icid, &cte) != MEMTX_OK) {
         return CMD_STALL;
     }
     if (!cte.valid) {
@@ -330,15 +340,15 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
     }
 
     if ((cmd == CLEAR) || (cmd == DISCARD)) {
-        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], pIntid, 0);
+        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], ite.intid, 0);
     } else {
-        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], pIntid, 1);
+        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], ite.intid, 1);
     }
 
     if (cmd == DISCARD) {
-        IteEntry ite = {};
+        IteEntry itee = {};
         /* remove mapping from interrupt translation table */
-        return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
+        return update_ite(s, eventid, &dte, itee) ? CMD_CONTINUE : CMD_STALL;
     }
     return CMD_CONTINUE;
 }
@@ -572,14 +582,13 @@ static ItsCmdResult process_movall(GICv3ITSState *s, const uint64_t *cmdpkt)
 
 static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
-    MemTxResult res = MEMTX_OK;
-    uint32_t devid, eventid, intid;
-    uint16_t old_icid, new_icid;
-    bool ite_valid;
+    uint32_t devid, eventid;
+    uint16_t new_icid;
     uint64_t num_eventids;
     IteEntry ite = {};
     DTEntry dte;
     CTEntry old_cte, new_cte;
+    ITEntry old_ite;
 
     devid = FIELD_EX64(cmdpkt[0], MOVI_0, DEVICEID);
     eventid = FIELD_EX64(cmdpkt[1], MOVI_1, EVENTID);
@@ -611,22 +620,21 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    ite_valid = get_ite(s, eventid, &dte, &old_icid, &intid, &res);
-    if (res != MEMTX_OK) {
+    if (get_ite(s, eventid, &dte, &old_ite) != MEMTX_OK) {
         return CMD_STALL;
     }
 
-    if (!ite_valid) {
+    if (!old_ite.valid || old_ite.inttype != ITE_INTTYPE_PHYSICAL) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: invalid ITE\n",
                       __func__);
         return CMD_CONTINUE;
     }
 
-    if (old_icid >= s->ct.num_entries) {
+    if (old_ite.icid >= s->ct.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid ICID 0x%x in ITE (table corrupted?)\n",
-                      __func__, old_icid);
+                      __func__, old_ite.icid);
         return CMD_CONTINUE;
     }
 
@@ -637,14 +645,14 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    if (get_cte(s, old_icid, &old_cte) != MEMTX_OK) {
+    if (get_cte(s, old_ite.icid, &old_cte) != MEMTX_OK) {
         return CMD_STALL;
     }
     if (!old_cte.valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
                       "invalid CTE for old ICID 0x%x\n",
-                      __func__, old_icid);
+                      __func__, old_ite.icid);
         return CMD_CONTINUE;
     }
 
@@ -677,13 +685,13 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
         /* Move the LPI from the old redistributor to the new one */
         gicv3_redist_mov_lpi(&s->gicv3->cpu[old_cte.rdbase],
                              &s->gicv3->cpu[new_cte.rdbase],
-                             intid);
+                             old_ite.intid);
     }
 
     /* Update the ICID field in the interrupt translation table entry */
     ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, 1);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, intid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, old_ite.intid);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, ICID, new_icid);
     ite.iteh = FIELD_DP32(ite.iteh, ITE_H, DOORBELL, INTID_SPURIOUS);
     return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
-- 
2.25.1


