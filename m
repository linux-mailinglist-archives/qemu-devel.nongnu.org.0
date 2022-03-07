Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E24D04B1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:56:12 +0100 (CET)
Received: from localhost ([::1]:35930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGeZ-0005VA-5a
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:56:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW5-0001nP-AT
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:25 -0500
Received: from [2a00:1450:4864:20::42a] (port=40745
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW3-0007lG-Jx
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:25 -0500
Received: by mail-wr1-x42a.google.com with SMTP id k24so14823005wrd.7
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xPLWOc1ulzWD7BSXwRoC+kifzLTGlELDNs5HJiVO+oQ=;
 b=Qn8tf0s0iP9w00DfxAL7z5ec9TCgcDkpLGsS1+qmyr1ZBlGUut398ybjTRyNU6kVuU
 hKmd8LHg1K/gUr7Xe68aQYv37sFUzgXxhmf2e7Od+scyLKxXXZ0sR2wCJOzCmBohusWc
 qa148Kp2BrpLwRsbZWA6x5ZFuCItNonnhn1FExN7mtfw3MeaKHDqqt9oNgAGayAXA0Yj
 /r5ys4NwEWDucLfdh1IKELMTD+hUFluE14aDeXJF8NV7DQaa+I6nZbyAXFIzIcqIovQw
 wBdvXniqW71d5wC+fsw54qzuSyS1KYTIl38OdjxCmhgWHY8+PYR7Qg1HVXocYJnoZys/
 qAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xPLWOc1ulzWD7BSXwRoC+kifzLTGlELDNs5HJiVO+oQ=;
 b=zG4Lk1KNfBNVcrQfzzi0CKaZY14EEDnNa9WQnDxWsYNMLXP6NR4oBKiYhj32zVl8gL
 6IEXXHejxg0rGKL3ct3ozI+rz7PEhyDM6KxriFbaIfG/itsmCGx1s0i6Ov6aOab3q/1y
 KylHgqNPtnPgLUbxB41GkhKVBS/pkUoucu8mWA65+33OWCf0xcEGtrtZd+1H2xYa2tgr
 RBIZ271d6xl1mONL6M2aOXgYt42yuwXVbHf9Kh+SMDvRo8L31eF7D7J2yKo6+l39EtEw
 iAhbTteSgDgHKHfkBm3mVsaFlIPn/hPM6bXAtKvrXz7Js8FlMLjNGCHhNra+ibNP35yi
 6PlA==
X-Gm-Message-State: AOAM533DB/n3vYGi0nF58EA75f4DVPKjpyFvh1/yUd8Kwhhx07hB0B09
 VCnCf/R18jXDUFduPeHYx4dO72LaM2N3Gw==
X-Google-Smtp-Source: ABdhPJw0J6lhfKNUPihJbqZhrMTKnkIxdrWQJ5MoqnzeBinqD6m7Jl47jpn1piTEn68cegz5gGlmlA==
X-Received: by 2002:adf:f646:0:b0:1f0:4e5b:f423 with SMTP id
 x6-20020adff646000000b001f04e5bf423mr9422438wrp.2.1646671642211; 
 Mon, 07 Mar 2022 08:47:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/18] hw/intc/arm_gicv3_its: Add trace events for table reads
 and writes
Date: Mon,  7 Mar 2022 16:47:03 +0000
Message-Id: <20220307164709.2503250-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

For debugging guest use of the ITS, it can be helpful to trace
when the ITS reads and writes the in-memory tables.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220303202341.2232284-3-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 37 +++++++++++++++++++++++++++++++------
 hw/intc/trace-events    |  9 +++++++++
 2 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 77dc702734b..9f4df6a8cbb 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -161,16 +161,22 @@ static MemTxResult get_cte(GICv3ITSState *s, uint16_t icid, CTEntry *cte)
     if (entry_addr == -1) {
         /* No L2 table entry, i.e. no valid CTE, or a memory error */
         cte->valid = false;
-        return res;
+        goto out;
     }
 
     cteval = address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, &res);
     if (res != MEMTX_OK) {
-        return res;
+        goto out;
     }
     cte->valid = FIELD_EX64(cteval, CTE, VALID);
     cte->rdbase = FIELD_EX64(cteval, CTE, RDBASE);
-    return MEMTX_OK;
+out:
+    if (res != MEMTX_OK) {
+        trace_gicv3_its_cte_read_fault(icid);
+    } else {
+        trace_gicv3_its_cte_read(icid, cte->valid, cte->rdbase);
+    }
+    return res;
 }
 
 /*
@@ -187,6 +193,10 @@ static bool update_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
     uint64_t itel = 0;
     uint32_t iteh = 0;
 
+    trace_gicv3_its_ite_write(dte->ittaddr, eventid, ite->valid,
+                              ite->inttype, ite->intid, ite->icid,
+                              ite->vpeid, ite->doorbell);
+
     if (ite->valid) {
         itel = FIELD_DP64(itel, ITE_L, VALID, 1);
         itel = FIELD_DP64(itel, ITE_L, INTTYPE, ite->inttype);
@@ -221,11 +231,13 @@ static MemTxResult get_ite(GICv3ITSState *s, uint32_t eventid,
 
     itel = address_space_ldq_le(as, iteaddr, MEMTXATTRS_UNSPECIFIED, &res);
     if (res != MEMTX_OK) {
+        trace_gicv3_its_ite_read_fault(dte->ittaddr, eventid);
         return res;
     }
 
     iteh = address_space_ldl_le(as, iteaddr + 8, MEMTXATTRS_UNSPECIFIED, &res);
     if (res != MEMTX_OK) {
+        trace_gicv3_its_ite_read_fault(dte->ittaddr, eventid);
         return res;
     }
 
@@ -235,6 +247,9 @@ static MemTxResult get_ite(GICv3ITSState *s, uint32_t eventid,
     ite->icid = FIELD_EX64(itel, ITE_L, ICID);
     ite->vpeid = FIELD_EX64(itel, ITE_L, VPEID);
     ite->doorbell = FIELD_EX64(iteh, ITE_H, DOORBELL);
+    trace_gicv3_its_ite_read(dte->ittaddr, eventid, ite->valid,
+                             ite->inttype, ite->intid, ite->icid,
+                             ite->vpeid, ite->doorbell);
     return MEMTX_OK;
 }
 
@@ -254,17 +269,23 @@ static MemTxResult get_dte(GICv3ITSState *s, uint32_t devid, DTEntry *dte)
     if (entry_addr == -1) {
         /* No L2 table entry, i.e. no valid DTE, or a memory error */
         dte->valid = false;
-        return res;
+        goto out;
     }
     dteval = address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, &res);
     if (res != MEMTX_OK) {
-        return res;
+        goto out;
     }
     dte->valid = FIELD_EX64(dteval, DTE, VALID);
     dte->size = FIELD_EX64(dteval, DTE, SIZE);
     /* DTE word field stores bits [51:8] of the ITT address */
     dte->ittaddr = FIELD_EX64(dteval, DTE, ITTADDR) << ITTADDR_SHIFT;
-    return MEMTX_OK;
+out:
+    if (res != MEMTX_OK) {
+        trace_gicv3_its_dte_read_fault(devid);
+    } else {
+        trace_gicv3_its_dte_read(devid, dte->valid, dte->size, dte->ittaddr);
+    }
+    return res;
 }
 
 /*
@@ -465,6 +486,8 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, const CTEntry *cte)
     uint64_t cteval = 0;
     MemTxResult res = MEMTX_OK;
 
+    trace_gicv3_its_cte_write(icid, cte->valid, cte->rdbase);
+
     if (cte->valid) {
         /* add mapping entry to collection table */
         cteval = FIELD_DP64(cteval, CTE, VALID, 1);
@@ -524,6 +547,8 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, const DTEntry *dte)
     uint64_t dteval = 0;
     MemTxResult res = MEMTX_OK;
 
+    trace_gicv3_its_dte_write(devid, dte->valid, dte->size, dte->ittaddr);
+
     if (dte->valid) {
         /* add mapping entry to device table */
         dteval = FIELD_DP64(dteval, DTE, VALID, 1);
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index e92662b405c..53414aa1979 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -188,6 +188,15 @@ gicv3_its_cmd_inv(void) "GICv3 ITS: command INV or INVALL"
 gicv3_its_cmd_movall(uint64_t rd1, uint64_t rd2) "GICv3 ITS: command MOVALL RDbase1 0x%" PRIx64 " RDbase2 0x%" PRIx64
 gicv3_its_cmd_movi(uint32_t devid, uint32_t eventid, uint32_t icid) "GICv3 ITS: command MOVI DeviceID 0x%x EventID 0x%x ICID 0x%x"
 gicv3_its_cmd_unknown(unsigned cmd) "GICv3 ITS: unknown command 0x%x"
+gicv3_its_cte_read(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table read for ICID 0x%x: valid %d RDBase 0x%x"
+gicv3_its_cte_write(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table write for ICID 0x%x: valid %d RDBase 0x%x"
+gicv3_its_cte_read_fault(uint32_t icid) "GICv3 ITS: Collection Table read for ICID 0x%x: faulted"
+gicv3_its_ite_read(uint64_t ittaddr, uint32_t eventid, int valid, int inttype, uint32_t intid, uint32_t icid, uint32_t vpeid, uint32_t doorbell) "GICv3 ITS: Interrupt Table read for ITTaddr 0x%" PRIx64 " EventID 0x%x: valid %d inttype %d intid 0x%x ICID 0x%x vPEID 0x%x doorbell 0x%x"
+gicv3_its_ite_read_fault(uint64_t ittaddr, uint32_t eventid) "GICv3 ITS: Interrupt Table read for ITTaddr 0x%" PRIx64 " EventID 0x%x: faulted"
+gicv3_its_ite_write(uint64_t ittaddr, uint32_t eventid, int valid, int inttype, uint32_t intid, uint32_t icid, uint32_t vpeid, uint32_t doorbell) "GICv3 ITS: Interrupt Table write for ITTaddr 0x%" PRIx64 " EventID 0x%x: valid %d inttype %d intid 0x%x ICID 0x%x vPEID 0x%x doorbell 0x%x"
+gicv3_its_dte_read(uint32_t devid, int valid, uint32_t size, uint64_t ittaddr) "GICv3 ITS: Device Table read for DeviceID 0x%x: valid %d size 0x%x ITTaddr 0x%" PRIx64
+gicv3_its_dte_write(uint32_t devid, int valid, uint32_t size, uint64_t ittaddr) "GICv3 ITS: Device Table write for DeviceID 0x%x: valid %d size 0x%x ITTaddr 0x%" PRIx64
+gicv3_its_dte_read_fault(uint32_t devid) "GICv3 ITS: Device Table read for DeviceID 0x%x: faulted"
 
 # armv7m_nvic.c
 nvic_recompute_state(int vectpending, int vectpending_prio, int exception_prio) "NVIC state recomputed: vectpending %d vectpending_prio %d exception_prio %d"
-- 
2.25.1


