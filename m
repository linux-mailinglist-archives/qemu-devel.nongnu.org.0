Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D06936F312
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 01:53:11 +0200 (CEST)
Received: from localhost ([::1]:49512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcGT0-0000JQ-2p
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 19:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIX-0005nx-8u
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:21 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:39885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIJ-0004Kq-Ve
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:20 -0400
Received: by mail-qv1-xf32.google.com with SMTP id 3so8751058qvp.6
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 16:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kmLKIUuyZMlH3WhsqwhkjnzcBKObExgY6pdHTpLO2WA=;
 b=o0fUmg70HbvVqHaziu38wlsTAFlV4CINxWLJV8GEdvrUz+jnj6lfwE4znDMo0fPfdI
 AUC9aIM9YbkP6LV7OQRR/xlAJKqyTjl7Ckd3KRWBDROBi5A3aHsBaeaG6iMf42UW+yHC
 6gGSZVcfoKOmfaNaxAGmsVIcC7lIC1Deo8gAm14+dLICwie5EcMhmp0YBuKPrHyxRALd
 S3kSP3eJW2iYajskV1uAdaQpVteb33WKYn6Rr0h+ss+/IvaWAzuE93ZxmP8gjcMTVA6V
 acZLwGYRy1PKNb0+unENrSFO907J4dQ/uaNWv5YrJS3y6yv/vfEUmQQ1/yZ4FliSPQNq
 f+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kmLKIUuyZMlH3WhsqwhkjnzcBKObExgY6pdHTpLO2WA=;
 b=NQMH6T4h/H2jjV1LgzgLQPQRL54lhsrvEeShEWggzYReSKC4vuV8V67rqWFs1L0zG/
 Qyl4EJdi7ZPIa0+DlvKaIzH9QUiY5FdQ69a1D8OIWPZCE+c3ZCdcfctjxzsUuBTVpIfF
 AVzI8wZr385Wt19cySOjI691DZKlwex7lg9jgNCMqHwZzdVExii0feFkFC1kmvmStG0U
 Zj64Mh+ssf0WgoN9J08UhW5BlBVCkJ7TZFi5qzq32qdeWli4aHakR+QJLGKWfCupFkOV
 PLsiToVYnteG+T9LaQIu/M5urjEwCmjymlKmRJYk8X1xbbjTU4FbiR19DTq8kW/2n7tX
 zy5Q==
X-Gm-Message-State: AOAM530itXMOKt37UopGEhf94cKxYgn0z5hST43Gy0gfBms9UmbET+uR
 /CD+5OU47N2CHUsq81wdBCaRb4ak6S/Y0Q==
X-Google-Smtp-Source: ABdhPJyr7TOO3vqsWgr3KtsFTegpvWDF40MOaoNbtVS/8hsJz1HASMn9lkTykSTVaKNpNFiqCj45nA==
X-Received: by 2002:a05:6214:176a:: with SMTP id
 et10mr2642199qvb.23.1619739724892; 
 Thu, 29 Apr 2021 16:42:04 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id i2sm1093229qtg.0.2021.04.29.16.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:42:04 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v3 4/8] hw/intc: GICv3 ITS Command processing
Date: Thu, 29 Apr 2021 19:41:57 -0400
Message-Id: <20210429234201.125565-5-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210429234201.125565-1-shashi.mallela@linaro.org>
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added ITS command queue handling for MAPTI,MAPI commands,handled ITS
translation which triggers an LPI via INT command as well as write
to GITS_TRANSLATER register,defined enum to differentiate between ITS
command interrupt trigger and GITS_TRANSLATER based interrupt trigger.
Each of these commands make use of other functionalities implemented to
get device table entry,collection table entry or interrupt translation
table entry required for their processing.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_its.c            | 346 ++++++++++++++++++++++++++++-
 hw/intc/gicv3_internal.h           |  12 +
 include/hw/intc/arm_gicv3_common.h |   2 +
 3 files changed, 359 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 7cb465813a..98c984dd22 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -28,6 +28,156 @@ struct GICv3ITSClass {
     void (*parent_reset)(DeviceState *dev);
 };
 
+typedef enum ItsCmdType {
+    NONE = 0, /* internal indication for GITS_TRANSLATER write */
+    CLEAR = 1,
+    DISCARD = 2,
+    INT = 3,
+} ItsCmdType;
+
+static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
+    MemTxResult *res)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t l2t_addr;
+    uint64_t value;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t max_l2_entries;
+    bool status = false;
+
+    if (s->ct.indirect) {
+        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     s->ct.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, res);
+
+        if (*res == MEMTX_OK) {
+            valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+            if (valid_l2t) {
+                max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
+
+                l2t_addr = value & ((1ULL << 51) - 1);
+
+                *cte =  address_space_ldq_le(as, l2t_addr +
+                                    ((icid % max_l2_entries) * GITS_CTE_SIZE),
+                                    MEMTXATTRS_UNSPECIFIED, res);
+           }
+       }
+    } else {
+        /* Flat level table */
+        *cte =  address_space_ldq_le(as, s->ct.base_addr +
+                                     (icid * GITS_CTE_SIZE),
+                                      MEMTXATTRS_UNSPECIFIED, res);
+    }
+
+    if (*cte & VALID_MASK) {
+        status = true;
+    }
+
+    return status;
+}
+
+static MemTxResult update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
+    uint64_t itel, uint32_t iteh)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t itt_addr;
+    MemTxResult res = MEMTX_OK;
+
+    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
+    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
+
+    address_space_stq_le(as, itt_addr + (eventid * sizeof(uint64_t)),
+                         itel, MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res == MEMTX_OK) {
+        address_space_stl_le(as, itt_addr + ((eventid + sizeof(uint64_t)) *
+                             sizeof(uint32_t)), iteh, MEMTXATTRS_UNSPECIFIED,
+                             &res);
+    }
+   return res;
+}
+
+static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
+                      uint16_t *icid, uint32_t *pIntid, MemTxResult *res)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t itt_addr;
+    bool status = false;
+    uint64_t itel = 0;
+    uint32_t iteh = 0;
+
+    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
+    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
+
+    itel = address_space_ldq_le(as, itt_addr + (eventid * sizeof(uint64_t)),
+                                MEMTXATTRS_UNSPECIFIED, res);
+
+    if (*res == MEMTX_OK) {
+        iteh = address_space_ldl_le(as, itt_addr + ((eventid +
+                                    sizeof(uint64_t)) * sizeof(uint32_t)),
+                                    MEMTXATTRS_UNSPECIFIED, res);
+
+        if (*res == MEMTX_OK) {
+            if (itel & VALID_MASK) {
+                if ((itel >> ITE_ENTRY_INTTYPE_SHIFT) & GITS_TYPE_PHYSICAL) {
+                    *pIntid = (itel >> ITE_ENTRY_INTID_SHIFT) &
+                              ITE_ENTRY_INTID_MASK;
+                    *icid = iteh & ITE_ENTRY_ICID_MASK;
+                    status = true;
+                }
+            }
+        }
+    }
+    return status;
+}
+
+static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t l2t_addr;
+    uint64_t value;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t max_l2_entries;
+
+    if (s->dt.indirect) {
+        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     s->dt.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, res);
+
+        if (*res == MEMTX_OK) {
+            valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+            if (valid_l2t) {
+                max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
+
+                l2t_addr = value & ((1ULL << 51) - 1);
+
+                value = 0;
+                value =  address_space_ldq_le(as, l2t_addr +
+                                   ((devid % max_l2_entries) * GITS_DTE_SIZE),
+                                   MEMTXATTRS_UNSPECIFIED, res);
+            }
+        }
+    } else {
+        /* Flat level table */
+        value = 0;
+        value = address_space_ldq_le(as, s->dt.base_addr +
+                                           (devid * GITS_DTE_SIZE),
+                                    MEMTXATTRS_UNSPECIFIED, res);
+    }
+
+    return value;
+}
+
 static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
 {
     AddressSpace *as = &s->gicv3->dma_as;
@@ -55,6 +205,182 @@ static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
     return res;
 }
 
+static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
+                                uint32_t offset, ItsCmdType cmd)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint32_t devid, eventid;
+    MemTxResult res = MEMTX_OK;
+    bool dte_valid;
+    uint64_t dte = 0;
+    uint32_t max_eventid;
+    uint16_t icid = 0;
+    uint32_t pIntid = 0;
+    bool ite_valid = false;
+    uint64_t cte = 0;
+    bool cte_valid = false;
+    uint64_t itel = 0;
+    uint32_t iteh = 0;
+
+    if (cmd == NONE) {
+        devid = offset;
+    } else {
+        devid = (value >> DEVID_SHIFT) & DEVID_MASK;
+
+        offset += NUM_BYTES_IN_DW;
+        value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    }
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+
+    eventid = (value & EVENTID_MASK);
+
+    dte = get_dte(s, devid, &res);
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+    dte_valid = dte & VALID_MASK;
+
+    if (dte_valid) {
+        max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
+
+        ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
+
+        if (res != MEMTX_OK) {
+            return res;
+        }
+
+        if (ite_valid) {
+            cte_valid = get_cte(s, icid, &cte, &res);
+        }
+
+        if (res != MEMTX_OK) {
+            return res;
+        }
+    }
+
+    if ((devid > s->dt.max_devids) || !dte_valid || !ite_valid ||
+            !cte_valid || (eventid > max_eventid)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: invalid interrupt translation table attributes "
+            "devid %d or eventid %d\n",
+            __func__, devid, eventid);
+        /*
+         * in this implementation,in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        /*
+         * Current implementation only supports rdbase == procnum
+         * Hence rdbase physical address is ignored
+         */
+        if (cmd == DISCARD) {
+            /* remove mapping from interrupt translation table */
+            res = update_ite(s, eventid, dte, itel, iteh);
+        }
+    }
+
+    if (cmd != NONE) {
+        offset += NUM_BYTES_IN_DW;
+        offset += NUM_BYTES_IN_DW;
+    }
+
+    return res;
+}
+
+static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
+                                    uint32_t offset, bool ignore_pInt)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint32_t devid, eventid;
+    uint32_t pIntid = 0;
+    uint32_t max_eventid, max_Intid;
+    bool dte_valid;
+    MemTxResult res = MEMTX_OK;
+    uint16_t icid = 0;
+    uint64_t dte = 0;
+    uint64_t itel = 0;
+    uint32_t iteh = 0;
+    uint32_t int_spurious = INTID_SPURIOUS;
+
+    devid = (value >> DEVID_SHIFT) & DEVID_MASK;
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+
+    eventid = (value & EVENTID_MASK);
+
+    if (!ignore_pInt) {
+        pIntid = (value >> pINTID_OFFSET) & pINTID_MASK;
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+
+    icid = value & ICID_MASK;
+
+    dte = get_dte(s, devid, &res);
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+    dte_valid = dte & VALID_MASK;
+
+    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
+
+    if (!ignore_pInt) {
+        max_Intid = (1UL << (FIELD_EX64(s->typer, GITS_TYPER, IDBITS) + 1));
+    }
+
+    if ((devid > s->dt.max_devids) || (icid > s->ct.max_collids) ||
+            !dte_valid || (eventid > max_eventid) ||
+            (!ignore_pInt && ((pIntid < GICV3_LPI_INTID_START) ||
+               (pIntid > max_Intid)))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: invalid interrupt translation table attributes "
+            "devid %d or icid %d or eventid %d or pIntid %d\n",
+            __func__, devid, icid, eventid, pIntid);
+        /*
+         * in this implementation,in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        /* add ite entry to interrupt translation table */
+        itel = (dte_valid & VALID_MASK) | (GITS_TYPE_PHYSICAL <<
+                                           ITE_ENTRY_INTTYPE_SHIFT);
+
+        if (ignore_pInt) {
+            itel |= (eventid << ITE_ENTRY_INTID_SHIFT);
+        } else {
+            itel |= (pIntid << ITE_ENTRY_INTID_SHIFT);
+        }
+        itel |= (int_spurious << ITE_ENTRY_INTSP_SHIFT);
+        iteh |= icid;
+
+        res = update_ite(s, eventid, dte, itel, iteh);
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    return res;
+}
+
 static MemTxResult update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
     uint64_t rdbase)
 {
@@ -217,7 +543,7 @@ static MemTxResult update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
 }
 
 static MemTxResult process_mapd(GICv3ITSState *s, uint64_t value,
-                                 uint32_t offset)
+                                  uint32_t offset)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid;
@@ -310,8 +636,10 @@ static MemTxResult process_cmdq(GICv3ITSState *s)
 
         switch (cmd) {
         case GITS_CMD_INT:
+            res = process_int(s, data, cq_offset, INT);
             break;
         case GITS_CMD_CLEAR:
+            res = process_int(s, data, cq_offset, CLEAR);
             break;
         case GITS_CMD_SYNC:
             res = process_sync(s, cq_offset);
@@ -323,10 +651,13 @@ static MemTxResult process_cmdq(GICv3ITSState *s)
             res = process_mapc(s, cq_offset);
             break;
         case GITS_CMD_MAPTI:
+            res = process_mapti(s, data, cq_offset, false);
             break;
         case GITS_CMD_MAPI:
+            res = process_mapti(s, data, cq_offset, true);
             break;
         case GITS_CMD_DISCARD:
+            res = process_int(s, data, cq_offset, DISCARD);
             break;
         default:
             break;
@@ -508,7 +839,20 @@ static void extract_cmdq_params(GICv3ITSState *s)
 static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
                                uint64_t data, unsigned size, MemTxAttrs attrs)
 {
+    GICv3ITSState *s = (GICv3ITSState *)opaque;
     MemTxResult result = MEMTX_OK;
+    uint32_t devid = 0;
+
+    switch (offset) {
+    case GITS_TRANSLATER:
+        if (s->ctlr & ITS_CTLR_ENABLED) {
+            devid = attrs.requester_id;
+            result = process_int(s, data, devid, NONE);
+        }
+        break;
+    default:
+        break;
+    }
 
     return result;
 }
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 3b8e1e85c6..e49370224f 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -325,6 +325,13 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define ITTADDR_MASK              ((1ULL << ITTADDR_LENGTH) - 1)
 #define SIZE_MASK                 0x1f
 
+/* MAPI command fields */
+#define EVENTID_MASK              ((1ULL << 32) - 1)
+
+/* MAPTI command fields */
+#define pINTID_OFFSET              32
+#define pINTID_MASK               ((1ULL << 32) - 1)
+
 #define VALID_SHIFT               63
 #define VALID_MASK                0x1
 
@@ -345,6 +352,11 @@ FIELD(GITS_TYPER, CIL, 36, 1)
  * vPEID = 16 bits
  */
 #define ITS_ITT_ENTRY_SIZE            0xC
+#define ITE_ENTRY_INTTYPE_SHIFT        1
+#define ITE_ENTRY_INTID_SHIFT          2
+#define ITE_ENTRY_INTID_MASK         ((1ULL << 24) - 1)
+#define ITE_ENTRY_INTSP_SHIFT          26
+#define ITE_ENTRY_ICID_MASK          ((1ULL << 16) - 1)
 
 /* 16 bits EventId */
 #define ITS_IDBITS                   GICD_TYPER_IDBITS
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 1fd5cedbbd..0715b0bc2a 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -36,6 +36,8 @@
 #define GICV3_MAXIRQ 1020
 #define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)
 
+#define GICV3_LPI_INTID_START 8192
+
 #define GICV3_REDIST_SIZE 0x20000
 
 /* Number of SGI target-list bits */
-- 
2.27.0


