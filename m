Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAEB409957
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:36:31 +0200 (CEST)
Received: from localhost ([::1]:54820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPowY-00062K-Rm
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYs-00013y-4X
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:03 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYn-0008A7-Jw
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:01 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w29so14783588wra.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eUo7QUT/xI3d/p0AcuiFOVXMAjTUS3es5nCrI/CrjcY=;
 b=FnJXyz1iOvT1IRieNFihO6fgkjTnnB1MUxFM6h324YUDTHWngBhyyhXnLf5iRZldpI
 9Ndh8iP3nC01l/Tj3zNRDCq8wwvayRA5LrBW8EYdEK9vsTtn4u+Qe9L0xLwVYCmM0rSG
 LYcJ69F4rzlUeI8+ZBLRVfwmqOFxUKXuljgviKkb18BTJxoWQLEUt6AHFycPvpfL/yBA
 XNaiMhJ4P91ho7ll+9ZRdCm4amTKxWQU891b3z/RVTCvTWeiak4476TPLkcxFDuAqNID
 1T7yL4UesEYX1m8cFbaHwtVt9tvpwJaPDO8wP5RWGi5wa/QguwQma061i8CrKSNAQeEr
 e0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eUo7QUT/xI3d/p0AcuiFOVXMAjTUS3es5nCrI/CrjcY=;
 b=O6rXtXPemqx7oyVa3yhIcZ/4BjL+wBXg37LOr7w1ibKrC+BKTSPvi4uhTfWjfDJ7BR
 ivWjuxHztGdlDStn7/8+9btX+F/5FtGEf9322/GU6dkOLtToU0gZQW0ZyKy9rGIS0LxW
 Ejeiwu+AS9u4DeCQ7keJJ73ypvhlGkz7WVo+bMbUWLfktmwrxEwU85Yd7ZzPGZ/FikgZ
 W2/7w8EAqEaUsUCs5V7lTrZOc80ZjVCBRNsyLsZKDcMc0Qv7xauj12EwP/3pDsgGhPah
 lGNkQqMr+VjZqL3bG8Yr4Ri41czk5z+bgHOyH0FLg9PR+DcVjCCgjAj4HgjKTJP3+Cbt
 AKyA==
X-Gm-Message-State: AOAM53100ndM9BlbwdbMh9HVILuMebRRCD8Im0RZeGAC0zt6u6LSwPUc
 SwM3WLeVpf/zyGY1u5YyvJ0dLhiHGv+YBg==
X-Google-Smtp-Source: ABdhPJy31+wM3oW9dtvbCNMhbDmYQa4VAtwB/ae/m/tuj6n1QANU53puwJOxLL7UgYqtgAmrsKXe/g==
X-Received: by 2002:adf:fd92:: with SMTP id d18mr13648083wrr.28.1631549516164; 
 Mon, 13 Sep 2021 09:11:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.11.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:11:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/23] hw/intc: GICv3 ITS Command processing
Date: Mon, 13 Sep 2021 17:11:33 +0100
Message-Id: <20210913161144.12347-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shashi Mallela <shashi.mallela@linaro.org>

Added ITS command queue handling for MAPTI,MAPI commands,handled ITS
translation which triggers an LPI via INT command as well as write
to GITS_TRANSLATER register,defined enum to differentiate between ITS
command interrupt trigger and GITS_TRANSLATER based interrupt trigger.
Each of these commands make use of other functionalities implemented to
get device table entry,collection table entry or interrupt translation
table entry required for their processing.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210910143951.92242-5-shashi.mallela@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h           |  12 +
 include/hw/intc/arm_gicv3_common.h |   2 +
 hw/intc/arm_gicv3_its.c            | 365 ++++++++++++++++++++++++++++-
 3 files changed, 378 insertions(+), 1 deletion(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 034fadfebeb..19664447902 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -334,6 +334,13 @@ FIELD(MAPC, RDBASE, 16, 32)
 #define ITTADDR_MASK             MAKE_64BIT_MASK(ITTADDR_SHIFT, ITTADDR_LENGTH)
 #define SIZE_MASK                 0x1f
 
+/* MAPI command fields */
+#define EVENTID_MASK              ((1ULL << 32) - 1)
+
+/* MAPTI command fields */
+#define pINTID_SHIFT                 32
+#define pINTID_MASK               MAKE_64BIT_MASK(32, 32)
+
 #define DEVID_SHIFT                  32
 #define DEVID_MASK                MAKE_64BIT_MASK(32, 32)
 
@@ -359,6 +366,11 @@ FIELD(MAPC, RDBASE, 16, 32)
  *   Values:  |  vPEID    |  ICID   |
  */
 #define ITS_ITT_ENTRY_SIZE            0xC
+#define ITE_ENTRY_INTTYPE_SHIFT        1
+#define ITE_ENTRY_INTID_SHIFT          2
+#define ITE_ENTRY_INTID_MASK         MAKE_64BIT_MASK(2, 24)
+#define ITE_ENTRY_INTSP_SHIFT          26
+#define ITE_ENTRY_ICID_MASK          MAKE_64BIT_MASK(0, 16)
 
 /* 16 bits EventId */
 #define ITS_IDBITS                   GICD_TYPER_IDBITS
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 1fd5cedbbdb..0715b0bc2a7 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -36,6 +36,8 @@
 #define GICV3_MAXIRQ 1020
 #define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)
 
+#define GICV3_LPI_INTID_START 8192
+
 #define GICV3_REDIST_SIZE 0x20000
 
 /* Number of SGI target-list bits */
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index fcd152271a6..03c68009978 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -29,6 +29,22 @@ struct GICv3ITSClass {
     void (*parent_reset)(DeviceState *dev);
 };
 
+/*
+ * This is an internal enum used to distinguish between LPI triggered
+ * via command queue and LPI triggered via gits_translater write.
+ */
+typedef enum ItsCmdType {
+    NONE = 0, /* internal indication for GITS_TRANSLATER write */
+    CLEAR = 1,
+    DISCARD = 2,
+    INT = 3,
+} ItsCmdType;
+
+typedef struct {
+    uint32_t iteh;
+    uint64_t itel;
+} IteEntry;
+
 static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
 {
     uint64_t result = 0;
@@ -50,6 +66,329 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
     return result;
 }
 
+static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
+                    MemTxResult *res)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t l2t_addr;
+    uint64_t value;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t max_l2_entries;
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
+            valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
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
+    return (*cte & TABLE_ENTRY_VALID_MASK) != 0;
+}
+
+static bool update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
+                       IteEntry ite)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t itt_addr;
+    MemTxResult res = MEMTX_OK;
+
+    itt_addr = (dte & GITS_DTE_ITTADDR_MASK) >> GITS_DTE_ITTADDR_SHIFT;
+    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
+
+    address_space_stq_le(as, itt_addr + (eventid * (sizeof(uint64_t) +
+                         sizeof(uint32_t))), ite.itel, MEMTXATTRS_UNSPECIFIED,
+                         &res);
+
+    if (res == MEMTX_OK) {
+        address_space_stl_le(as, itt_addr + (eventid * (sizeof(uint64_t) +
+                             sizeof(uint32_t))) + sizeof(uint32_t), ite.iteh,
+                             MEMTXATTRS_UNSPECIFIED, &res);
+    }
+    if (res != MEMTX_OK) {
+        return false;
+    } else {
+        return true;
+    }
+}
+
+static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
+                    uint16_t *icid, uint32_t *pIntid, MemTxResult *res)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t itt_addr;
+    bool status = false;
+    IteEntry ite = {};
+
+    itt_addr = (dte & GITS_DTE_ITTADDR_MASK) >> GITS_DTE_ITTADDR_SHIFT;
+    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
+
+    ite.itel = address_space_ldq_le(as, itt_addr +
+                                    (eventid * (sizeof(uint64_t) +
+                                    sizeof(uint32_t))), MEMTXATTRS_UNSPECIFIED,
+                                    res);
+
+    if (*res == MEMTX_OK) {
+        ite.iteh = address_space_ldl_le(as, itt_addr +
+                                        (eventid * (sizeof(uint64_t) +
+                                        sizeof(uint32_t))) + sizeof(uint32_t),
+                                        MEMTXATTRS_UNSPECIFIED, res);
+
+        if (*res == MEMTX_OK) {
+            if (ite.itel & TABLE_ENTRY_VALID_MASK) {
+                if ((ite.itel >> ITE_ENTRY_INTTYPE_SHIFT) &
+                    GITS_TYPE_PHYSICAL) {
+                    *pIntid = (ite.itel & ITE_ENTRY_INTID_MASK) >>
+                               ITE_ENTRY_INTID_SHIFT;
+                    *icid = ite.iteh & ITE_ENTRY_ICID_MASK;
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
+            valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
+
+            if (valid_l2t) {
+                max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
+
+                l2t_addr = value & ((1ULL << 51) - 1);
+
+                value =  address_space_ldq_le(as, l2t_addr +
+                                   ((devid % max_l2_entries) * GITS_DTE_SIZE),
+                                   MEMTXATTRS_UNSPECIFIED, res);
+            }
+        }
+    } else {
+        /* Flat level table */
+        value = address_space_ldq_le(as, s->dt.base_addr +
+                                     (devid * GITS_DTE_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, res);
+    }
+
+    return value;
+}
+
+/*
+ * This function handles the processing of following commands based on
+ * the ItsCmdType parameter passed:-
+ * 1. triggering of lpi interrupt translation via ITS INT command
+ * 2. triggering of lpi interrupt translation via gits_translater register
+ * 3. handling of ITS CLEAR command
+ * 4. handling of ITS DISCARD command
+ */
+static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
+                            ItsCmdType cmd)
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
+    bool result = false;
+
+    if (cmd == NONE) {
+        devid = offset;
+    } else {
+        devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
+
+        offset += NUM_BYTES_IN_DW;
+        value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                     MEMTXATTRS_UNSPECIFIED, &res);
+    }
+
+    if (res != MEMTX_OK) {
+        return result;
+    }
+
+    eventid = (value & EVENTID_MASK);
+
+    dte = get_dte(s, devid, &res);
+
+    if (res != MEMTX_OK) {
+        return result;
+    }
+    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
+
+    if (dte_valid) {
+        max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
+
+        ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
+
+        if (res != MEMTX_OK) {
+            return result;
+        }
+
+        if (ite_valid) {
+            cte_valid = get_cte(s, icid, &cte, &res);
+        }
+
+        if (res != MEMTX_OK) {
+            return result;
+        }
+    }
+
+    if ((devid > s->dt.maxids.max_devids) || !dte_valid || !ite_valid ||
+            !cte_valid || (eventid > max_eventid)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes "
+                      "devid %d or eventid %d or invalid dte %d or"
+                      "invalid cte %d or invalid ite %d\n",
+                      __func__, devid, eventid, dte_valid, cte_valid,
+                      ite_valid);
+        /*
+         * in this implementation, in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        /*
+         * Current implementation only supports rdbase == procnum
+         * Hence rdbase physical address is ignored
+         */
+        if (cmd == DISCARD) {
+            IteEntry ite = {};
+            /* remove mapping from interrupt translation table */
+            result = update_ite(s, eventid, dte, ite);
+        }
+    }
+
+    return result;
+}
+
+static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
+                          bool ignore_pInt)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint32_t devid, eventid;
+    uint32_t pIntid = 0;
+    uint32_t max_eventid, max_Intid;
+    bool dte_valid;
+    MemTxResult res = MEMTX_OK;
+    uint16_t icid = 0;
+    uint64_t dte = 0;
+    IteEntry ite;
+    uint32_t int_spurious = INTID_SPURIOUS;
+    bool result = false;
+
+    devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res != MEMTX_OK) {
+        return result;
+    }
+
+    eventid = (value & EVENTID_MASK);
+
+    if (!ignore_pInt) {
+        pIntid = ((value & pINTID_MASK) >> pINTID_SHIFT);
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res != MEMTX_OK) {
+        return result;
+    }
+
+    icid = value & ICID_MASK;
+
+    dte = get_dte(s, devid, &res);
+
+    if (res != MEMTX_OK) {
+        return result;
+    }
+    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
+
+    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
+
+    if (!ignore_pInt) {
+        max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
+    }
+
+    if ((devid > s->dt.maxids.max_devids) || (icid > s->ct.maxids.max_collids)
+            || !dte_valid || (eventid > max_eventid) ||
+            (!ignore_pInt && (((pIntid < GICV3_LPI_INTID_START) ||
+            (pIntid > max_Intid)) && (pIntid != INTID_SPURIOUS)))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes "
+                      "devid %d or icid %d or eventid %d or pIntid %d or"
+                      "unmapped dte %d\n", __func__, devid, icid, eventid,
+                      pIntid, dte_valid);
+        /*
+         * in this implementation, in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        /* add ite entry to interrupt translation table */
+        ite.itel = (dte_valid & TABLE_ENTRY_VALID_MASK) |
+                    (GITS_TYPE_PHYSICAL << ITE_ENTRY_INTTYPE_SHIFT);
+
+        if (ignore_pInt) {
+            ite.itel |= (eventid << ITE_ENTRY_INTID_SHIFT);
+        } else {
+            ite.itel |= (pIntid << ITE_ENTRY_INTID_SHIFT);
+        }
+        ite.itel |= (int_spurious << ITE_ENTRY_INTSP_SHIFT);
+        ite.iteh = icid;
+
+        result = update_ite(s, eventid, dte, ite);
+    }
+
+    return result;
+}
+
 static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
                        uint64_t rdbase)
 {
@@ -316,8 +655,10 @@ static void process_cmdq(GICv3ITSState *s)
 
         switch (cmd) {
         case GITS_CMD_INT:
+            res = process_its_cmd(s, data, cq_offset, INT);
             break;
         case GITS_CMD_CLEAR:
+            res = process_its_cmd(s, data, cq_offset, CLEAR);
             break;
         case GITS_CMD_SYNC:
             /*
@@ -334,10 +675,13 @@ static void process_cmdq(GICv3ITSState *s)
             result = process_mapc(s, cq_offset);
             break;
         case GITS_CMD_MAPTI:
+            result = process_mapti(s, data, cq_offset, false);
             break;
         case GITS_CMD_MAPI:
+            result = process_mapti(s, data, cq_offset, true);
             break;
         case GITS_CMD_DISCARD:
+            result = process_its_cmd(s, data, cq_offset, DISCARD);
             break;
         case GITS_CMD_INV:
         case GITS_CMD_INVALL:
@@ -499,7 +843,26 @@ static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
                                                uint64_t data, unsigned size,
                                                MemTxAttrs attrs)
 {
-    return MEMTX_OK;
+    GICv3ITSState *s = (GICv3ITSState *)opaque;
+    bool result = true;
+    uint32_t devid = 0;
+
+    switch (offset) {
+    case GITS_TRANSLATER:
+        if (s->ctlr & ITS_CTLR_ENABLED) {
+            devid = attrs.requester_id;
+            result = process_its_cmd(s, data, devid, NONE);
+        }
+        break;
+    default:
+        break;
+    }
+
+    if (result) {
+        return MEMTX_OK;
+    } else {
+        return MEMTX_ERROR;
+    }
 }
 
 static bool its_writel(GICv3ITSState *s, hwaddr offset,
-- 
2.20.1


