Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A86350CC7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 04:46:56 +0200 (CEST)
Received: from localhost ([::1]:52266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRnMF-000811-9N
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 22:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHX-0002mN-V1
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 22:42:04 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:45708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHS-000396-CW
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 22:42:03 -0400
Received: by mail-qk1-x730.google.com with SMTP id q3so853617qkq.12
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 19:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oUllfF8CUAQznaw9J4vMHWhjv+WxmuQIU0bgqJF76zY=;
 b=JAi4JupszjmWh1D1Rzp6GObouhoWgs7RIYErycQqFmq4Y9h4Hmo3qekqFQb4HwfXk6
 S5vdu24GwBQdB/mC1XowKvHCq8HZbD0NmhI5KEb+OnbBHJ7Utoay1C+Mb1dIrFd01qss
 5TXPUR2m2ighSU/JRmagpPpFoiQSO07JUoMiIx/ITrZ+xBTzP/JCJZ8a2TH9RpWwHWX8
 yUshldpLxw5zmUokFxTvbTO9UyGITtNV1P4B1aU5L414MIxWtcdZODyOPJHBmZy+/vgA
 ua5lNoL+zY9+MYJezf5mHapXXblgAFpeEPqcdSXSvbCTKGeiJAhS6H68qmzsQWAyAFUy
 LG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oUllfF8CUAQznaw9J4vMHWhjv+WxmuQIU0bgqJF76zY=;
 b=Ho4LfnkVNE+iVCtiCaHqoC/7gmJz9iLDwHsw15gW8rhM5awnizOK0cXDWZXO784zbw
 lMtunrUcofodx4XrCGDXgLeVFtTt0iMRH45H0aX+U8s8UV5VYVf2US0AWwe+NqkqUKt1
 Dg52Y/NVj5D1s/uTRlyExSPaf+dgT1GdIzLpngD3hs9NtPulTKwtS7HQ+hGJzHh29iQT
 jhoXaqhqohcCjPVCfOeX36jiPSDTSJRi3h/z71fWnUiMRTyGdRq8rXePRmW16sgQWo7a
 em0vPTBc/t31/B+2hwW/yYT34zo28HibPRpgzJ1ccKvnKUZTq7WXaoJd9ZRtxSt/RVqp
 mfkQ==
X-Gm-Message-State: AOAM532vJN49V2P8gCcqiKgwuU8THNSLWL94tjm1cX7+Ejid48qT7Y0M
 DOLFLNZa1XsXFpjxSNES032PzQ==
X-Google-Smtp-Source: ABdhPJyRfcF0NOIxvGN2jRANCQK2my5b2euXylqpA4ExScuktE6TbqijmTzt3FJK9TEpfdvg3CtLMg==
X-Received: by 2002:a37:7c8:: with SMTP id 191mr6274003qkh.53.1617244917260;
 Wed, 31 Mar 2021 19:41:57 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id a8sm2525707qtx.9.2021.03.31.19.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 19:41:57 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v2 4/8] hw/intc: GICv3 ITS Command processing
Date: Wed, 31 Mar 2021 22:41:48 -0400
Message-Id: <20210401024152.203896-5-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210401024152.203896-1-shashi.mallela@linaro.org>
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x730.google.com
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
 hw/intc/arm_gicv3_its.c            | 360 ++++++++++++++++++++++++++++-
 hw/intc/gicv3_internal.h           |   7 +
 include/hw/intc/arm_gicv3_common.h |   2 +
 3 files changed, 368 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index fcac33c836..0e3f176809 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -28,6 +28,152 @@ struct GICv3ITSClass {
     void (*parent_reset)(DeviceState *dev);
 };
 
+typedef enum ItsCmdType {
+    NONE = 0, /* internal indication for GITS_TRANSLATER write */
+    CLEAR = 1,
+    DISCARD = 2,
+    INT = 3,
+} ItsCmdType;
+
+static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte)
+{
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint8_t  page_sz_type;
+    uint64_t l2t_addr;
+    uint64_t value;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t page_sz = 0;
+    uint32_t max_l2_entries;
+    bool status = false;
+
+    if (s->ct.indirect) {
+        /* 2 level table */
+        page_sz_type = FIELD_EX64(s->baser[1], GITS_BASER, PAGESIZE);
+
+        if (page_sz_type == 0) {
+            page_sz = GITS_ITT_PAGE_SIZE_0;
+        } else if (page_sz_type == 1) {
+            page_sz = GITS_ITT_PAGE_SIZE_1;
+        } else if (page_sz_type == 2) {
+            page_sz = GITS_ITT_PAGE_SIZE_2;
+        }
+
+        l2t_id = icid / (page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     s->ct.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, NULL);
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = page_sz / s->ct.entry_sz;
+
+            l2t_addr = (value >> page_sz_type) &
+                        ((1ULL << (51 - page_sz_type)) - 1);
+
+            address_space_read(as, l2t_addr +
+                                 ((icid % max_l2_entries) * GITS_CTE_SIZE),
+                                 MEMTXATTRS_UNSPECIFIED,
+                                 cte, sizeof(*cte));
+       }
+    } else {
+        /* Flat level table */
+        address_space_read(as, s->ct.base_addr + (icid * GITS_CTE_SIZE),
+                            MEMTXATTRS_UNSPECIFIED, cte,
+                            sizeof(*cte));
+    }
+
+    if (*cte & VALID_MASK) {
+        status = true;
+    }
+
+    return status;
+}
+
+static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
+                      uint16_t *icid, uint32_t *pIntid)
+{
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint8_t buff[ITS_ITT_ENTRY_SIZE];
+    uint64_t itt_addr;
+    bool status = false;
+
+    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
+    itt_addr <<= ITTADDR_OFFSET; /* 256 byte aligned */
+
+    address_space_read(as, itt_addr + (eventid * sizeof(buff)),
+                MEMTXATTRS_UNSPECIFIED, &buff,
+                sizeof(buff));
+
+    if (buff[0] & VALID_MASK) {
+        if ((buff[0] >> 1U) & GITS_TYPE_PHYSICAL) {
+            memcpy(pIntid, &buff[1], 3);
+            memcpy(icid, &buff[7], sizeof(*icid));
+            status = true;
+        }
+    }
+
+    return status;
+}
+
+static uint64_t get_dte(GICv3ITSState *s, uint32_t devid)
+{
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint8_t  page_sz_type;
+    uint64_t l2t_addr;
+    uint64_t value;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t page_sz = 0;
+    uint32_t max_l2_entries;
+
+    if (s->dt.indirect) {
+        /* 2 level table */
+        page_sz_type = FIELD_EX64(s->baser[0], GITS_BASER, PAGESIZE);
+
+        if (page_sz_type == 0) {
+            page_sz = GITS_ITT_PAGE_SIZE_0;
+        } else if (page_sz_type == 1) {
+            page_sz = GITS_ITT_PAGE_SIZE_1;
+        } else if (page_sz_type == 2) {
+            page_sz = GITS_ITT_PAGE_SIZE_2;
+        }
+
+        l2t_id = devid / (page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     s->dt.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, NULL);
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = page_sz / s->dt.entry_sz;
+
+            l2t_addr = (value >> page_sz_type) &
+                        ((1ULL << (51 - page_sz_type)) - 1);
+
+            value = 0;
+            address_space_read(as, l2t_addr +
+                                 ((devid % max_l2_entries) * GITS_DTE_SIZE),
+                                 MEMTXATTRS_UNSPECIFIED,
+                                 &value, sizeof(value));
+        }
+    } else {
+        /* Flat level table */
+        value = 0;
+        address_space_read(as, s->dt.base_addr + (devid * GITS_DTE_SIZE),
+                            MEMTXATTRS_UNSPECIFIED, &value,
+                            sizeof(value));
+    }
+
+    return value;
+}
+
 static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
 {
     AddressSpace *as = &s->gicv3->sysmem_as;
@@ -66,6 +212,187 @@ static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
     return res;
 }
 
+static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
+                                uint32_t offset, ItsCmdType cmd)
+{
+    AddressSpace *as = &s->gicv3->sysmem_as;
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
+    uint8_t buff[ITS_ITT_ENTRY_SIZE];
+    uint64_t itt_addr;
+
+    if (cmd == NONE) {
+        devid = offset;
+    } else {
+        devid = (value >> DEVID_OFFSET) & DEVID_MASK;
+
+        offset += NUM_BYTES_IN_DW;
+        value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    }
+
+    eventid = (value & EVENTID_MASK);
+
+    dte = get_dte(s, devid);
+    dte_valid = dte & VALID_MASK;
+
+    if (dte_valid) {
+        max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
+
+        ite_valid = get_ite(s, eventid, dte, &icid, &pIntid);
+
+        if (ite_valid) {
+            cte_valid = get_cte(s, icid, &cte);
+        }
+    }
+
+    if ((devid > s->dt.max_devids) || !dte_valid || !ite_valid ||
+            !cte_valid || (eventid > max_eventid)) {
+        if (FIELD_EX64(s->typer, GITS_TYPER, SEIS)) {
+            /*
+             * Generate System Error here if supported
+             * for each of the individual error cases
+             */
+        }
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
+        if (FIELD_EX64(s->typer, GITS_TYPER, PTA)) {
+            /*
+             * only bits[47:16] are considered instead of bits [51:16]
+             * since with a physical address the target address must be
+             * 64KB aligned
+             */
+
+            /*
+             * Current implementation only supports rdbase == procnum
+             * Hence rdbase physical address is ignored
+             */
+        } else {
+
+            if (cmd == DISCARD) {
+                /* remove mapping from interrupt translation table */
+                memset(buff, 0, sizeof(buff));
+
+                itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
+                itt_addr <<= ITTADDR_OFFSET; /* 256 byte aligned */
+
+                address_space_write(as, itt_addr + (eventid * sizeof(buff)),
+                                    MEMTXATTRS_UNSPECIFIED, &buff,
+                                    sizeof(buff));
+            }
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
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint32_t devid, eventid;
+    uint32_t pIntid = 0;
+    uint32_t max_eventid, max_Intid;
+    bool dte_valid;
+    MemTxResult res = MEMTX_OK;
+    uint16_t icid = 0;
+    uint64_t dte = 0;
+    uint64_t itt_addr;
+    uint8_t buff[ITS_ITT_ENTRY_SIZE];
+    uint32_t int_spurious = INTID_SPURIOUS;
+
+    devid = (value >> DEVID_OFFSET) & DEVID_MASK;
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
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
+    icid = value & ICID_MASK;
+
+    dte = get_dte(s, devid);
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
+        if (FIELD_EX64(s->typer, GITS_TYPER, SEIS)) {
+            /*
+             * Generate System Error here if supported
+             * for each of the individual error cases
+             */
+        }
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
+        /* add entry to interrupt translation table */
+        memset(buff, 0, sizeof(buff));
+        buff[0] = (dte_valid & VALID_MASK) | (GITS_TYPE_PHYSICAL << 1U);
+        if (ignore_pInt) {
+            memcpy(&buff[1], &eventid, 3);
+        } else {
+            memcpy(&buff[1], &pIntid, 3);
+        }
+        memcpy(&buff[4], &int_spurious, 3);
+        memcpy(&buff[7], &icid, sizeof(icid));
+
+        itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
+        itt_addr <<= ITTADDR_OFFSET; /* 256 byte aligned */
+
+        address_space_write(as, itt_addr + (eventid * sizeof(buff)),
+                    MEMTXATTRS_UNSPECIFIED, &buff,
+                    sizeof(buff));
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    return res;
+}
+
 static void update_cte(GICv3ITSState *s, uint16_t icid, uint64_t cte)
 {
     AddressSpace *as = &s->gicv3->sysmem_as;
@@ -239,7 +566,7 @@ static void update_dte(GICv3ITSState *s, uint32_t devid, uint64_t dte)
 }
 
 static MemTxResult process_mapd(GICv3ITSState *s, uint64_t value,
-                                 uint32_t offset)
+                                  uint32_t offset)
 {
     AddressSpace *as = &s->gicv3->sysmem_as;
     uint32_t devid;
@@ -335,8 +662,10 @@ static MemTxResult process_cmdq(GICv3ITSState *s)
 
         switch (cmd) {
         case GITS_CMD_INT:
+            res = process_int(s, data, cq_offset, INT);
             break;
         case GITS_CMD_CLEAR:
+            res = process_int(s, data, cq_offset, CLEAR);
             break;
         case GITS_CMD_SYNC:
             res = process_sync(s, cq_offset);
@@ -348,10 +677,13 @@ static MemTxResult process_cmdq(GICv3ITSState *s)
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
@@ -498,7 +830,20 @@ static MemTxResult its_trans_writew(GICv3ITSState *s, hwaddr offset,
                                uint64_t value, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
+    uint32_t devid = 0;
 
+    switch (offset) {
+    case GITS_TRANSLATER:
+        if (s->ctlr & ITS_CTLR_ENABLED) {
+            s->translater = (value & 0x0000FFFFU);
+            devid = attrs.requester_id;
+            result = process_int(s, s->translater, devid, NONE);
+        }
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
@@ -506,7 +851,20 @@ static MemTxResult its_trans_writel(GICv3ITSState *s, hwaddr offset,
                                uint64_t value, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
+    uint32_t devid = 0;
 
+    switch (offset) {
+    case GITS_TRANSLATER:
+        if (s->ctlr & ITS_CTLR_ENABLED) {
+            s->translater = value;
+            devid = attrs.requester_id;
+            result = process_int(s, s->translater, devid, NONE);
+        }
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 7e1ff426ef..e9f9aa6722 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -323,6 +323,13 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define ITTADDR_MASK              ((1ULL << ITTADDR_LEN) - 1)
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
 
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index b0f2414fa3..3a710592a9 100644
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


