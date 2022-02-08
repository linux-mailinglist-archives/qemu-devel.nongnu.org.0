Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E824ADA82
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:58:21 +0100 (CET)
Received: from localhost ([::1]:45706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHR0e-0006rH-Lx
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:58:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOrS-000160-V1
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:44 -0500
Received: from [2a00:1450:4864:20::433] (port=46723
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqw-0002Kd-HQ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:17 -0500
Received: by mail-wr1-x433.google.com with SMTP id q7so2005619wrc.13
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pp3mTpA7sXqcSdEShjFPNL03srw1TL9PNunr5ys0FH4=;
 b=MSDAs6eGfdW7CXcqOWmCwB+DWXGL3PeRnM4a3ozP3UVJuxuXiqoNfNTQV9sp+r7SP3
 DQVjwXpeTbN2WUyhECV1uAITYtLQAg6SZPlsnQq98WU5F1QDulXak1D+ec8X/td+yJJy
 1tTnJROtcf7QQBBURtkBuv+OtODkebC/c7M2tZslK5Sf0OyNG7Nc59mnmBhK/0r55ZS0
 hagFT88eqs0MW5yMnNofOMrdtnFJyx4tmU8vx8mpInGgUvFziXbnHtoK5CnUtxDDl/L7
 YaoTY5md1QlyyDYrIZUa7A3Hlz9Q32J2WkJhGymsqdPfZIJwMC16nrs09AYLsk3nJo4J
 UpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pp3mTpA7sXqcSdEShjFPNL03srw1TL9PNunr5ys0FH4=;
 b=f5c8OVUQ/48fQYtVF738VRjfmDZCEqJ7kLELpTIrbc+ktxbD1nl8VOhjQT+/wMxP1h
 wupfNrkrj8Tfgc0qjyJyAG6YE+cVRT2uErB0HvR1EwOlH1OvuwV/OhKhdbNt7B6I60u2
 2sFo4LDH1HFlG5L/YN4gVGXLFDFc8EJu3nDxqI1BUO3hLwsclxFU7jjTynuziRGA3NKp
 2TaibpYboHgPzLam7WxVotuhZFvcdVYSWF7Cf4Abc5A+2lpcHzjMreJDEi3UF8fc40Sl
 Q6ixCrC5gKPOeSxUQ19NpwPz3owDd8SarFY5RQ4gOqSc8IIhjMLkBe7SSBCm/c98zwSl
 wO5Q==
X-Gm-Message-State: AOAM530yM4YVMMZNmvcpWH/Adh56LA3QmEdgCAnoBDK5mc8GiJLp9M26
 lTimEwfsa3XPBX+YRrdU8YTxXN4SAmtLdQ==
X-Google-Smtp-Source: ABdhPJyDDd7LKcQpGYUk4vNFpTsfSfJKlj9xgwA6l/8ufuK+uxnXDZO3FRdZshIe/qAOIUTGDoFrYw==
X-Received: by 2002:a05:6000:1846:: with SMTP id
 c6mr3187345wri.683.1644320409145; 
 Tue, 08 Feb 2022 03:40:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/39] hw/intc/arm_gicv3_its: Keep CTEs as a struct,
 not a raw uint64_t
Date: Tue,  8 Feb 2022 11:39:38 +0000
Message-Id: <20220208113948.3217356-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

In the ITS, a CTE is an entry in the collection table, which contains
multiple fields. Currently the function get_cte() which reads one
entry from the device table returns a success/failure boolean and
passes back the raw 64-bit integer CTE value via a pointer argument.
We then extract fields from the CTE as we need them.

Create a real C struct with the same fields as the CTE, and
populate it in get_cte(), so that that function and update_cte()
are the only ones which need to care about the in-guest-memory
format of the CTE.

This brings get_cte()'s API into line with get_dte().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220201193207.2771604-5-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 96 ++++++++++++++++++++++-------------------
 1 file changed, 52 insertions(+), 44 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 1856210e79a..482a71ba73c 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -52,6 +52,11 @@ typedef struct DTEntry {
     uint64_t ittaddr;
 } DTEntry;
 
+typedef struct CTEntry {
+    bool valid;
+    uint32_t rdbase;
+} CTEntry;
+
 /*
  * The ITS spec permits a range of CONSTRAINED UNPREDICTABLE options
  * if a command parameter is not correct. These include both "stall
@@ -135,18 +140,32 @@ static uint64_t table_entry_addr(GICv3ITSState *s, TableDesc *td,
     return (l2 & ((1ULL << 51) - 1)) + (idx % num_l2_entries) * td->entry_sz;
 }
 
-static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
-                    MemTxResult *res)
+/*
+ * Read the Collection Table entry at index @icid. On success (including
+ * successfully determining that there is no valid CTE for this index),
+ * we return MEMTX_OK and populate the CTEntry struct @cte accordingly.
+ * If there is an error reading memory then we return the error code.
+ */
+static MemTxResult get_cte(GICv3ITSState *s, uint16_t icid, CTEntry *cte)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t entry_addr = table_entry_addr(s, &s->ct, icid, res);
+    MemTxResult res = MEMTX_OK;
+    uint64_t entry_addr = table_entry_addr(s, &s->ct, icid, &res);
+    uint64_t cteval;
 
     if (entry_addr == -1) {
-        return false; /* not valid */
+        /* No L2 table entry, i.e. no valid CTE, or a memory error */
+        cte->valid = false;
+        return res;
     }
 
-    *cte = address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, res);
-    return FIELD_EX64(*cte, CTE, VALID);
+    cteval = address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        return res;
+    }
+    cte->valid = FIELD_EX64(cteval, CTE, VALID);
+    cte->rdbase = FIELD_EX64(cteval, CTE, RDBASE);
+    return MEMTX_OK;
 }
 
 static bool update_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
@@ -248,10 +267,8 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
     uint16_t icid = 0;
     uint32_t pIntid = 0;
     bool ite_valid = false;
-    uint64_t cte = 0;
-    bool cte_valid = false;
-    uint64_t rdbase;
     DTEntry dte;
+    CTEntry cte;
 
     if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -298,15 +315,13 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
         return CMD_CONTINUE;
     }
 
-    cte_valid = get_cte(s, icid, &cte, &res);
-    if (res != MEMTX_OK) {
+    if (get_cte(s, icid, &cte) != MEMTX_OK) {
         return CMD_STALL;
     }
-    if (!cte_valid) {
+    if (!cte.valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: "
-                      "invalid cte: %"PRIx64"\n",
-                      __func__, cte);
+                      "%s: invalid command attributes: invalid CTE\n",
+                      __func__);
         return CMD_CONTINUE;
     }
 
@@ -314,16 +329,14 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
      * Current implementation only supports rdbase == procnum
      * Hence rdbase physical address is ignored
      */
-    rdbase = FIELD_EX64(cte, CTE, RDBASE);
-
-    if (rdbase >= s->gicv3->num_cpu) {
+    if (cte.rdbase >= s->gicv3->num_cpu) {
         return CMD_CONTINUE;
     }
 
     if ((cmd == CLEAR) || (cmd == DISCARD)) {
-        gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
+        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], pIntid, 0);
     } else {
-        gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
+        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], pIntid, 1);
     }
 
     if (cmd == DISCARD) {
@@ -564,12 +577,11 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
     MemTxResult res = MEMTX_OK;
     uint32_t devid, eventid, intid;
     uint16_t old_icid, new_icid;
-    uint64_t old_cte, new_cte;
-    uint64_t old_rdbase, new_rdbase;
-    bool ite_valid, cte_valid;
+    bool ite_valid;
     uint64_t num_eventids;
     IteEntry ite = {};
     DTEntry dte;
+    CTEntry old_cte, new_cte;
 
     devid = FIELD_EX64(cmdpkt[0], MOVI_0, DEVICEID);
     eventid = FIELD_EX64(cmdpkt[1], MOVI_1, EVENTID);
@@ -627,50 +639,46 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    cte_valid = get_cte(s, old_icid, &old_cte, &res);
-    if (res != MEMTX_OK) {
+    if (get_cte(s, old_icid, &old_cte) != MEMTX_OK) {
         return CMD_STALL;
     }
-    if (!cte_valid) {
+    if (!old_cte.valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
-                      "invalid cte: %"PRIx64"\n",
-                      __func__, old_cte);
+                      "invalid CTE for old ICID 0x%x\n",
+                      __func__, old_icid);
         return CMD_CONTINUE;
     }
 
-    cte_valid = get_cte(s, new_icid, &new_cte, &res);
-    if (res != MEMTX_OK) {
+    if (get_cte(s, new_icid, &new_cte) != MEMTX_OK) {
         return CMD_STALL;
     }
-    if (!cte_valid) {
+    if (!new_cte.valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
-                      "invalid cte: %"PRIx64"\n",
-                      __func__, new_cte);
+                      "invalid CTE for new ICID 0x%x\n",
+                      __func__, new_icid);
         return CMD_CONTINUE;
     }
 
-    old_rdbase = FIELD_EX64(old_cte, CTE, RDBASE);
-    if (old_rdbase >= s->gicv3->num_cpu) {
+    if (old_cte.rdbase >= s->gicv3->num_cpu) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: CTE has invalid rdbase 0x%"PRIx64"\n",
-                      __func__, old_rdbase);
+                      "%s: CTE has invalid rdbase 0x%x\n",
+                      __func__, old_cte.rdbase);
         return CMD_CONTINUE;
     }
 
-    new_rdbase = FIELD_EX64(new_cte, CTE, RDBASE);
-    if (new_rdbase >= s->gicv3->num_cpu) {
+    if (new_cte.rdbase >= s->gicv3->num_cpu) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: CTE has invalid rdbase 0x%"PRIx64"\n",
-                      __func__, new_rdbase);
+                      "%s: CTE has invalid rdbase 0x%x\n",
+                      __func__, new_cte.rdbase);
         return CMD_CONTINUE;
     }
 
-    if (old_rdbase != new_rdbase) {
+    if (old_cte.rdbase != new_cte.rdbase) {
         /* Move the LPI from the old redistributor to the new one */
-        gicv3_redist_mov_lpi(&s->gicv3->cpu[old_rdbase],
-                             &s->gicv3->cpu[new_rdbase],
+        gicv3_redist_mov_lpi(&s->gicv3->cpu[old_cte.rdbase],
+                             &s->gicv3->cpu[new_cte.rdbase],
                              intid);
     }
 
-- 
2.25.1


