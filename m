Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA5B4A692A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 01:23:34 +0100 (CET)
Received: from localhost ([::1]:59044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF3Qr-0003i0-KO
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 19:23:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEysx-0001iF-5t
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:15 -0500
Received: from [2a00:1450:4864:20::429] (port=36654
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEysu-0002VV-27
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:14 -0500
Received: by mail-wr1-x429.google.com with SMTP id u15so34046369wrt.3
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aM2+UxPzWjA1KpVbRhblTipNTCf1EvXdXhK2XLBnlnc=;
 b=cmYg+OQ8z2OdmPuinq74oZGjk4RWMD9i4UbFO86Bn4KEdFcsr4/u8nzGw43CmxSTnO
 CaO8mrz7AcdStJU/mbisFriyjxY3b7ZxqfUv+1qL3teWGcyA9Voxj9SyzlwT5IYKLEzH
 UQMbuaBulbhd4wckHJo3C9w9lxd6jylliPjbAC86fTcwnYvBAGgfQPQ9qQNPJtWb7V+X
 b7U/4fS/au4A47TshBK9/iiSYpPbxK288TT/1eelX8sUrkt0aP+qU54MWqeyJ5PQtLDM
 Xdps1wnxrMB+8oZH7jx5H0Gln1rM+liQMbUWKEeSQP30Pt1rI1icyyq201RvmBME9d0S
 U7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aM2+UxPzWjA1KpVbRhblTipNTCf1EvXdXhK2XLBnlnc=;
 b=GpKBmtY0sUFvv7NmF6SvE956Dj/ebEBlh2hWFHP/ghA/f/Z+XRK2IzYtc5nruEeRm1
 pL+qyNObH3Ifr8k5BFz0eTeVEToQon3QbHoSQ5KXdZIpzVwtL120Nho8Kjo00+LZ/6RU
 lPRRsivv3bZuN8sK7gqSeNdI0/jfKA2Lg3SJbNPTb9RMws5bjTaiXYDmNq4NkWLXBJp1
 oqvTAOoA4jOH3wB+JssH1p9y8yqrfKNOOMhAfqbloI21OVOFx6h/iWgqXDX8OYjDq5Ef
 XMhWnrknWj6X7IoSxdNM2I/HviNhN3WIPMXJiqaxPnI23Ao7iEZCg4W67KK9EJ9dVMQU
 GJOQ==
X-Gm-Message-State: AOAM532WLvCYmmrlUoXA61GqXuVEpQueYS7nUDm+LAdy2w43ai49zIHe
 bxp54CwsOniovPT2tT4LVNrQhA==
X-Google-Smtp-Source: ABdhPJwujUlgVHDVZqcobTMPAGZ1v3DJm3ccUQokh2pxBDzKxKuVjOd0PSIT4mctT3SwuBvrw4I4JQ==
X-Received: by 2002:adf:e4cb:: with SMTP id v11mr22023959wrm.139.1643743930443; 
 Tue, 01 Feb 2022 11:32:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:32:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/13] hw/intc/arm_gicv3_its: Use address_space_map() to
 access command queue packets
Date: Tue,  1 Feb 2022 19:31:55 +0000
Message-Id: <20220201193207.2771604-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Currently the ITS accesses each 8-byte doubleword in a 4-doubleword
command packet with a separate address_space_ldq_le() call.  This is
awkward because the individual command processing functions have
ended up with code to handle "load more doublewords out of the
packet", which is both unwieldy and also a potential source of bugs
because it's not obvious when looking at a line that pulls a field
out of the 'value' variable which of the 4 doublewords that variable
currently holds.

Switch to using address_space_map() to map the whole command packet
at once and fish the four doublewords out of it.  Then each process_*
function can start with a few lines of code that extract the fields
it cares about.

This requires us to split out the guts of process_its_cmd() into a
new do_process_its_cmd(), because we were previously overloading the
value and offset arguments as a backdoor way to directly pass the
devid and eventid from a write to GITS_TRANSLATER.  The new
do_process_its_cmd() takes those arguments directly, and
process_its_cmd() is just a wrapper that does the "read fields from
command packet" part.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h |   4 +-
 hw/intc/arm_gicv3_its.c  | 208 +++++++++++----------------------------
 2 files changed, 62 insertions(+), 150 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index b1af26df9f4..60c8617e4e4 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -309,8 +309,8 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define LPI_CTE_ENABLED          TABLE_ENTRY_VALID_MASK
 #define LPI_PRIORITY_MASK         0xfc
 
-#define GITS_CMDQ_ENTRY_SIZE               32
-#define NUM_BYTES_IN_DW                     8
+#define GITS_CMDQ_ENTRY_WORDS 4
+#define GITS_CMDQ_ENTRY_SIZE  (GITS_CMDQ_ENTRY_WORDS * sizeof(uint64_t))
 
 #define CMD_MASK                  0xff
 
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 51d9be4ae6f..b74753fb8fe 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -224,11 +224,9 @@ static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
  * 3. handling of ITS CLEAR command
  * 4. handling of ITS DISCARD command
  */
-static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
-                                    uint32_t offset, ItsCmdType cmd)
+static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
+                                       uint32_t eventid, ItsCmdType cmd)
 {
-    AddressSpace *as = &s->gicv3->dma_as;
-    uint32_t devid, eventid;
     MemTxResult res = MEMTX_OK;
     bool dte_valid;
     uint64_t dte = 0;
@@ -240,22 +238,6 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
     bool cte_valid = false;
     uint64_t rdbase;
 
-    if (cmd == NONE) {
-        devid = offset;
-    } else {
-        devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
-
-        offset += NUM_BYTES_IN_DW;
-        value = address_space_ldq_le(as, s->cq.base_addr + offset,
-                                     MEMTXATTRS_UNSPECIFIED, &res);
-    }
-
-    if (res != MEMTX_OK) {
-        return CMD_STALL;
-    }
-
-    eventid = (value & EVENTID_MASK);
-
     if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: devid %d>=%d",
@@ -342,11 +324,19 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
     }
     return CMD_CONTINUE;
 }
-
-static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
-                                  uint32_t offset, bool ignore_pInt)
+static ItsCmdResult process_its_cmd(GICv3ITSState *s, const uint64_t *cmdpkt,
+                                    ItsCmdType cmd)
+{
+    uint32_t devid, eventid;
+
+    devid = (cmdpkt[0] & DEVID_MASK) >> DEVID_SHIFT;
+    eventid = cmdpkt[1] & EVENTID_MASK;
+    return do_process_its_cmd(s, devid, eventid, cmd);
+}
+
+static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
+                                  bool ignore_pInt)
 {
-    AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid, eventid;
     uint32_t pIntid = 0;
     uint64_t num_eventids;
@@ -357,32 +347,16 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
     uint64_t dte = 0;
     IteEntry ite = {};
 
-    devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
-    offset += NUM_BYTES_IN_DW;
-    value = address_space_ldq_le(as, s->cq.base_addr + offset,
-                                 MEMTXATTRS_UNSPECIFIED, &res);
-
-    if (res != MEMTX_OK) {
-        return CMD_STALL;
-    }
-
-    eventid = (value & EVENTID_MASK);
+    devid = (cmdpkt[0] & DEVID_MASK) >> DEVID_SHIFT;
+    eventid = cmdpkt[1] & EVENTID_MASK;
 
     if (ignore_pInt) {
         pIntid = eventid;
     } else {
-        pIntid = ((value & pINTID_MASK) >> pINTID_SHIFT);
+        pIntid = (cmdpkt[1] & pINTID_MASK) >> pINTID_SHIFT;
     }
 
-    offset += NUM_BYTES_IN_DW;
-    value = address_space_ldq_le(as, s->cq.base_addr + offset,
-                                 MEMTXATTRS_UNSPECIFIED, &res);
-
-    if (res != MEMTX_OK) {
-        return CMD_STALL;
-    }
-
-    icid = value & ICID_MASK;
+    icid = cmdpkt[2] & ICID_MASK;
 
     if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -459,31 +433,18 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
     return res == MEMTX_OK;
 }
 
-static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
+static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
-    AddressSpace *as = &s->gicv3->dma_as;
     uint16_t icid;
     uint64_t rdbase;
     bool valid;
-    MemTxResult res = MEMTX_OK;
-    uint64_t value;
 
-    offset += NUM_BYTES_IN_DW;
-    offset += NUM_BYTES_IN_DW;
+    icid = cmdpkt[2] & ICID_MASK;
 
-    value = address_space_ldq_le(as, s->cq.base_addr + offset,
-                                 MEMTXATTRS_UNSPECIFIED, &res);
-
-    if (res != MEMTX_OK) {
-        return CMD_STALL;
-    }
-
-    icid = value & ICID_MASK;
-
-    rdbase = (value & R_MAPC_RDBASE_MASK) >> R_MAPC_RDBASE_SHIFT;
+    rdbase = (cmdpkt[2] & R_MAPC_RDBASE_MASK) >> R_MAPC_RDBASE_SHIFT;
     rdbase &= RDBASE_PROCNUM_MASK;
 
-    valid = (value & CMD_FIELD_VALID_MASK);
+    valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
 
     if ((icid >= s->ct.num_entries) || (rdbase >= s->gicv3->num_cpu)) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -532,39 +493,17 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
     return res == MEMTX_OK;
 }
 
-static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
-                                 uint32_t offset)
+static ItsCmdResult process_mapd(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
-    AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid;
     uint8_t size;
     uint64_t itt_addr;
     bool valid;
-    MemTxResult res = MEMTX_OK;
 
-    devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
-
-    offset += NUM_BYTES_IN_DW;
-    value = address_space_ldq_le(as, s->cq.base_addr + offset,
-                                 MEMTXATTRS_UNSPECIFIED, &res);
-
-    if (res != MEMTX_OK) {
-        return CMD_STALL;
-    }
-
-    size = (value & SIZE_MASK);
-
-    offset += NUM_BYTES_IN_DW;
-    value = address_space_ldq_le(as, s->cq.base_addr + offset,
-                                 MEMTXATTRS_UNSPECIFIED, &res);
-
-    if (res != MEMTX_OK) {
-        return CMD_STALL;
-    }
-
-    itt_addr = (value & ITTADDR_MASK) >> ITTADDR_SHIFT;
-
-    valid = (value & CMD_FIELD_VALID_MASK);
+    devid = (cmdpkt[0] & DEVID_MASK) >> DEVID_SHIFT;
+    size = cmdpkt[1] & SIZE_MASK;
+    itt_addr = (cmdpkt[2] & ITTADDR_MASK) >> ITTADDR_SHIFT;
+    valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
 
     if ((devid >= s->dt.num_entries) ||
         (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
@@ -582,23 +521,13 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
     return update_dte(s, devid, valid, size, itt_addr) ? CMD_CONTINUE : CMD_STALL;
 }
 
-static ItsCmdResult process_movall(GICv3ITSState *s, uint64_t value,
-                                   uint32_t offset)
+static ItsCmdResult process_movall(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
-    AddressSpace *as = &s->gicv3->dma_as;
-    MemTxResult res = MEMTX_OK;
     uint64_t rd1, rd2;
 
-    /* No fields in dwords 0 or 1 */
-    offset += NUM_BYTES_IN_DW;
-    offset += NUM_BYTES_IN_DW;
-    value = address_space_ldq_le(as, s->cq.base_addr + offset,
-                                 MEMTXATTRS_UNSPECIFIED, &res);
-    if (res != MEMTX_OK) {
-        return CMD_STALL;
-    }
+    rd1 = FIELD_EX64(cmdpkt[2], MOVALL_2, RDBASE1);
+    rd2 = FIELD_EX64(cmdpkt[3], MOVALL_3, RDBASE2);
 
-    rd1 = FIELD_EX64(value, MOVALL_2, RDBASE1);
     if (rd1 >= s->gicv3->num_cpu) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: RDBASE1 %" PRId64
@@ -606,15 +535,6 @@ static ItsCmdResult process_movall(GICv3ITSState *s, uint64_t value,
                       __func__, rd1, s->gicv3->num_cpu);
         return CMD_CONTINUE;
     }
-
-    offset += NUM_BYTES_IN_DW;
-    value = address_space_ldq_le(as, s->cq.base_addr + offset,
-                                 MEMTXATTRS_UNSPECIFIED, &res);
-    if (res != MEMTX_OK) {
-        return CMD_STALL;
-    }
-
-    rd2 = FIELD_EX64(value, MOVALL_3, RDBASE2);
     if (rd2 >= s->gicv3->num_cpu) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: RDBASE2 %" PRId64
@@ -634,10 +554,8 @@ static ItsCmdResult process_movall(GICv3ITSState *s, uint64_t value,
     return CMD_CONTINUE;
 }
 
-static ItsCmdResult process_movi(GICv3ITSState *s, uint64_t value,
-                                 uint32_t offset)
+static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
-    AddressSpace *as = &s->gicv3->dma_as;
     MemTxResult res = MEMTX_OK;
     uint32_t devid, eventid, intid;
     uint16_t old_icid, new_icid;
@@ -648,23 +566,9 @@ static ItsCmdResult process_movi(GICv3ITSState *s, uint64_t value,
     uint64_t num_eventids;
     IteEntry ite = {};
 
-    devid = FIELD_EX64(value, MOVI_0, DEVICEID);
-
-    offset += NUM_BYTES_IN_DW;
-    value = address_space_ldq_le(as, s->cq.base_addr + offset,
-                                 MEMTXATTRS_UNSPECIFIED, &res);
-    if (res != MEMTX_OK) {
-        return CMD_STALL;
-    }
-    eventid = FIELD_EX64(value, MOVI_1, EVENTID);
-
-    offset += NUM_BYTES_IN_DW;
-    value = address_space_ldq_le(as, s->cq.base_addr + offset,
-                                 MEMTXATTRS_UNSPECIFIED, &res);
-    if (res != MEMTX_OK) {
-        return CMD_STALL;
-    }
-    new_icid = FIELD_EX64(value, MOVI_2, ICID);
+    devid = FIELD_EX64(cmdpkt[0], MOVI_0, DEVICEID);
+    eventid = FIELD_EX64(cmdpkt[1], MOVI_1, EVENTID);
+    new_icid = FIELD_EX64(cmdpkt[2], MOVI_2, ICID);
 
     if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -786,9 +690,7 @@ static void process_cmdq(GICv3ITSState *s)
     uint32_t wr_offset = 0;
     uint32_t rd_offset = 0;
     uint32_t cq_offset = 0;
-    uint64_t data;
     AddressSpace *as = &s->gicv3->dma_as;
-    MemTxResult res = MEMTX_OK;
     uint8_t cmd;
     int i;
 
@@ -816,28 +718,40 @@ static void process_cmdq(GICv3ITSState *s)
 
     while (wr_offset != rd_offset) {
         ItsCmdResult result = CMD_CONTINUE;
+        void *hostmem;
+        hwaddr buflen;
+        uint64_t cmdpkt[GITS_CMDQ_ENTRY_WORDS];
 
         cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
-        data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
-                                    MEMTXATTRS_UNSPECIFIED, &res);
-        if (res != MEMTX_OK) {
+
+        buflen = GITS_CMDQ_ENTRY_SIZE;
+        hostmem = address_space_map(as, s->cq.base_addr + cq_offset,
+                                    &buflen, false, MEMTXATTRS_UNSPECIFIED);
+        if (!hostmem || buflen != GITS_CMDQ_ENTRY_SIZE) {
+            if (hostmem) {
+                address_space_unmap(as, hostmem, buflen, false, 0);
+            }
             s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
             qemu_log_mask(LOG_GUEST_ERROR,
                           "%s: could not read command at 0x%" PRIx64 "\n",
                           __func__, s->cq.base_addr + cq_offset);
             break;
         }
+        for (i = 0; i < ARRAY_SIZE(cmdpkt); i++) {
+            cmdpkt[i] = ldq_le_p(hostmem + i * sizeof(uint64_t));
+        }
+        address_space_unmap(as, hostmem, buflen, false, 0);
 
-        cmd = (data & CMD_MASK);
+        cmd = cmdpkt[0] & CMD_MASK;
 
         trace_gicv3_its_process_command(rd_offset, cmd);
 
         switch (cmd) {
         case GITS_CMD_INT:
-            result = process_its_cmd(s, data, cq_offset, INTERRUPT);
+            result = process_its_cmd(s, cmdpkt, INTERRUPT);
             break;
         case GITS_CMD_CLEAR:
-            result = process_its_cmd(s, data, cq_offset, CLEAR);
+            result = process_its_cmd(s, cmdpkt, CLEAR);
             break;
         case GITS_CMD_SYNC:
             /*
@@ -848,19 +762,19 @@ static void process_cmdq(GICv3ITSState *s)
              */
             break;
         case GITS_CMD_MAPD:
-            result = process_mapd(s, data, cq_offset);
+            result = process_mapd(s, cmdpkt);
             break;
         case GITS_CMD_MAPC:
-            result = process_mapc(s, cq_offset);
+            result = process_mapc(s, cmdpkt);
             break;
         case GITS_CMD_MAPTI:
-            result = process_mapti(s, data, cq_offset, false);
+            result = process_mapti(s, cmdpkt, false);
             break;
         case GITS_CMD_MAPI:
-            result = process_mapti(s, data, cq_offset, true);
+            result = process_mapti(s, cmdpkt, true);
             break;
         case GITS_CMD_DISCARD:
-            result = process_its_cmd(s, data, cq_offset, DISCARD);
+            result = process_its_cmd(s, cmdpkt, DISCARD);
             break;
         case GITS_CMD_INV:
         case GITS_CMD_INVALL:
@@ -875,10 +789,10 @@ static void process_cmdq(GICv3ITSState *s)
             }
             break;
         case GITS_CMD_MOVI:
-            result = process_movi(s, data, cq_offset);
+            result = process_movi(s, cmdpkt);
             break;
         case GITS_CMD_MOVALL:
-            result = process_movall(s, data, cq_offset);
+            result = process_movall(s, cmdpkt);
             break;
         default:
             break;
@@ -1032,15 +946,13 @@ static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
 {
     GICv3ITSState *s = (GICv3ITSState *)opaque;
     bool result = true;
-    uint32_t devid = 0;
 
     trace_gicv3_its_translation_write(offset, data, size, attrs.requester_id);
 
     switch (offset) {
     case GITS_TRANSLATER:
         if (s->ctlr & R_GITS_CTLR_ENABLED_MASK) {
-            devid = attrs.requester_id;
-            result = process_its_cmd(s, data, devid, NONE);
+            result = do_process_its_cmd(s, attrs.requester_id, data, NONE);
         }
         break;
     default:
-- 
2.25.1


