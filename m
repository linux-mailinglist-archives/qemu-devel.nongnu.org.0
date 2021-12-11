Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1C34715D0
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:51:42 +0100 (CET)
Received: from localhost ([::1]:36292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw8PF-0001RV-Lo
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:51:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7n2-0005HX-CH
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:16 -0500
Received: from [2a00:1450:4864:20::32d] (port=39718
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mq-0006IW-Ra
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:05 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso11306238wmr.4
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FiPtBXS/9wev8s0ZT0mbwmcHwHHqvxjF8Ntnd/Pa1Ac=;
 b=BZnCuqAL7dJJcgheWCX06yDSdWcsRyZKyRaQXehwC22MSU2D2WBMyUxOAO+brSMPJl
 FAhlo7ELrsnoTH8hPlnD76LqOtIbmXKVTvMNaDjy/J0KdPg9hFrHIhcIqDpsjxVqAcAs
 2r+QrCvYvq6TuLs8yerQKRGy1uPrOA9hwedMY2/2q0kVYH+4xRiciwOL6ykliDRzNOPS
 rCFKFacYVNqqaXt4TvRfuTpvGURjIFqiSuZ2sGmN9TnZhiZbb5uqFNAkNq5QzqHrypP7
 dvZeLboId2MCmNFSPvKrT7pVM6ORu9Ekouipl25byjUYz6k9EUi+hbEXg+o39ZmXIRhX
 E40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FiPtBXS/9wev8s0ZT0mbwmcHwHHqvxjF8Ntnd/Pa1Ac=;
 b=1pFSVS2OVXWUs2rpRLMcHOF+O5afRZu5/2aGuMI8t79iyZ5KJuiYzILPE3qtyyuAlc
 xMhdpgrJF0jO6dR6wci/KLf4crMOj9BBivpxTLryAPvT2RPW0e0ei/37FPRwxaFrhwse
 UewuaMxsZvXOTtrA1saC7EdILk1S6oehFlj4kPeqCcAhYVexzmo49hVnZ3IQQLni+e3m
 P8Rt6mal4NSsLEf/GYz54uzWtwQV0uLdGuyEQKMQqPcOK+CfCOfau7hgz3x7ZHGMPHfS
 CgjzxMi/Jws1jXmzVwRtUSjnBuzfKQHuVRplCQB6K9UWhLxQBk0Vp+zOphQbVulC0kyC
 5qow==
X-Gm-Message-State: AOAM531/EC7MDm3WlDxrH8H1wcmvOtmzJGH82MjXP1bqY3PBIF82U7Aw
 J9X3qopfwuBSVi1GYD3M/0rwpA==
X-Google-Smtp-Source: ABdhPJx7Dtx9WUFSoEpQ0HZSJmu3JQU77QU5QZkV1Rrpsjz6a66Kkee/jbsCh+bdqaXXr7qF1xBdmQ==
X-Received: by 2002:a05:600c:35d2:: with SMTP id
 r18mr25526050wmq.166.1639249917292; 
 Sat, 11 Dec 2021 11:11:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 26/26] hw/intc/arm_gicv3_its: Factor out "find address of
 table entry" code
Date: Sat, 11 Dec 2021 19:11:35 +0000
Message-Id: <20211211191135.1764649-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ITS has several tables which all share a similar format,
described by the TableDesc struct: the guest may configure them
to be a single-level table or a two-level table. Currently we
open-code the process of finding the table entry in all the
functions which read or write the device table or the collection
table. Factor out the "get the address of the table entry"
logic into a new function, so that the code which needs to
read or write a table entry only needs to call table_entry_addr()
and then perform a suitable load or store to that address.

Note that the error handling is slightly complicated because
we want to handle two cases differently:
 * failure to read the L1 table entry should end up causing
   a command stall, like other kinds of DMA error
 * an L1 table entry that says there is no L2 table for this
   index (ie whose valid bit is 0) must result in us treating
   the table entry as not-valid on read, and discarding
   writes (this is mandated by the spec)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is a worthwhile refactoring on its own, but still more
so given that GICv4 adds another table in this format.
---
 hw/intc/arm_gicv3_its.c | 212 +++++++++++++---------------------------
 1 file changed, 70 insertions(+), 142 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 3bcc4c3db85..90a9fd3b3d4 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -83,44 +83,62 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
     return result;
 }
 
+static uint64_t table_entry_addr(GICv3ITSState *s, TableDesc *td,
+                                 uint32_t idx, MemTxResult *res)
+{
+    /*
+     * Given a TableDesc describing one of the ITS in-guest-memory
+     * tables and an index into it, return the guest address
+     * corresponding to that table entry.
+     * If there was a memory error reading the L1 table of an
+     * indirect table, *res is set accordingly, and we return -1.
+     * If the L1 table entry is marked not valid, we return -1 with
+     * *res set to MEMTX_OK.
+     *
+     * The specification defines the format of level 1 entries of a
+     * 2-level table, but the format of level 2 entries and the format
+     * of flat-mapped tables is IMPDEF.
+     */
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint32_t l2idx;
+    uint64_t l2;
+    uint32_t num_l2_entries;
+
+    *res = MEMTX_OK;
+
+    if (!td->indirect) {
+        /* Single level table */
+        return td->base_addr + idx * td->entry_sz;
+    }
+
+    /* Two level table */
+    l2idx = idx / (td->page_sz / L1TABLE_ENTRY_SIZE);
+
+    l2 = address_space_ldq_le(as,
+                              td->base_addr + (l2idx * L1TABLE_ENTRY_SIZE),
+                              MEMTXATTRS_UNSPECIFIED, res);
+    if (*res != MEMTX_OK) {
+        return -1;
+    }
+    if (!(l2 & L2_TABLE_VALID_MASK)) {
+        return -1;
+    }
+
+    num_l2_entries = td->page_sz / td->entry_sz;
+    return (l2 & ((1ULL << 51) - 1)) + (idx % num_l2_entries) * td->entry_sz;
+}
+
 static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
                     MemTxResult *res)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t l2t_addr;
-    uint64_t value;
-    bool valid_l2t;
-    uint32_t l2t_id;
-    uint32_t num_l2_entries;
+    uint64_t entry_addr = table_entry_addr(s, &s->ct, icid, res);
 
-    if (s->ct.indirect) {
-        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
-
-        value = address_space_ldq_le(as,
-                                     s->ct.base_addr +
-                                     (l2t_id * L1TABLE_ENTRY_SIZE),
-                                     MEMTXATTRS_UNSPECIFIED, res);
-
-        if (*res == MEMTX_OK) {
-            valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
-
-            if (valid_l2t) {
-                num_l2_entries = s->ct.page_sz / s->ct.entry_sz;
-
-                l2t_addr = value & ((1ULL << 51) - 1);
-
-                *cte =  address_space_ldq_le(as, l2t_addr +
-                                    ((icid % num_l2_entries) * GITS_CTE_SIZE),
-                                    MEMTXATTRS_UNSPECIFIED, res);
-           }
-       }
-    } else {
-        /* Flat level table */
-        *cte =  address_space_ldq_le(as, s->ct.base_addr +
-                                     (icid * GITS_CTE_SIZE),
-                                      MEMTXATTRS_UNSPECIFIED, res);
+    if (entry_addr == -1) {
+        return false; /* not valid */
     }
 
+    *cte = address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, res);
     return FIELD_EX64(*cte, CTE, VALID);
 }
 
@@ -189,41 +207,12 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
 static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t l2t_addr;
-    uint64_t value;
-    bool valid_l2t;
-    uint32_t l2t_id;
-    uint32_t num_l2_entries;
+    uint64_t entry_addr = table_entry_addr(s, &s->dt, devid, res);
 
-    if (s->dt.indirect) {
-        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
-
-        value = address_space_ldq_le(as,
-                                     s->dt.base_addr +
-                                     (l2t_id * L1TABLE_ENTRY_SIZE),
-                                     MEMTXATTRS_UNSPECIFIED, res);
-
-        if (*res == MEMTX_OK) {
-            valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
-
-            if (valid_l2t) {
-                num_l2_entries = s->dt.page_sz / s->dt.entry_sz;
-
-                l2t_addr = value & ((1ULL << 51) - 1);
-
-                value =  address_space_ldq_le(as, l2t_addr +
-                                   ((devid % num_l2_entries) * GITS_DTE_SIZE),
-                                   MEMTXATTRS_UNSPECIFIED, res);
-            }
-        }
-    } else {
-        /* Flat level table */
-        value = address_space_ldq_le(as, s->dt.base_addr +
-                                     (devid * GITS_DTE_SIZE),
-                                     MEMTXATTRS_UNSPECIFIED, res);
+    if (entry_addr == -1) {
+        return 0; /* a DTE entry with the Valid bit clear */
     }
-
-    return value;
+    return address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, res);
 }
 
 /*
@@ -424,11 +413,7 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
                        uint64_t rdbase)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t value;
-    uint64_t l2t_addr;
-    bool valid_l2t;
-    uint32_t l2t_id;
-    uint32_t num_l2_entries;
+    uint64_t entry_addr;
     uint64_t cte = 0;
     MemTxResult res = MEMTX_OK;
 
@@ -442,44 +427,18 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
         cte = FIELD_DP64(cte, CTE, RDBASE, rdbase);
     }
 
-    /*
-     * The specification defines the format of level 1 entries of a
-     * 2-level table, but the format of level 2 entries and the format
-     * of flat-mapped tables is IMPDEF.
-     */
-    if (s->ct.indirect) {
-        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
-
-        value = address_space_ldq_le(as,
-                                     s->ct.base_addr +
-                                     (l2t_id * L1TABLE_ENTRY_SIZE),
-                                     MEMTXATTRS_UNSPECIFIED, &res);
-
-        if (res != MEMTX_OK) {
-            return false;
-        }
-
-        valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
-
-        if (valid_l2t) {
-            num_l2_entries = s->ct.page_sz / s->ct.entry_sz;
-
-            l2t_addr = value & ((1ULL << 51) - 1);
-
-            address_space_stq_le(as, l2t_addr +
-                                 ((icid % num_l2_entries) * GITS_CTE_SIZE),
-                                 cte, MEMTXATTRS_UNSPECIFIED, &res);
-        }
-    } else {
-        /* Flat level table */
-        address_space_stq_le(as, s->ct.base_addr + (icid * GITS_CTE_SIZE),
-                             cte, MEMTXATTRS_UNSPECIFIED, &res);
-    }
+    entry_addr = table_entry_addr(s, &s->ct, icid, &res);
     if (res != MEMTX_OK) {
+        /* memory access error: stall */
         return false;
-    } else {
+    }
+    if (entry_addr == -1) {
+        /* No L2 table for this index: discard write and continue */
         return true;
     }
+
+    address_space_stq_le(as, entry_addr, cte, MEMTXATTRS_UNSPECIFIED, &res);
+    return res == MEMTX_OK;
 }
 
 static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
@@ -527,11 +486,7 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
                        uint8_t size, uint64_t itt_addr)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t value;
-    uint64_t l2t_addr;
-    bool valid_l2t;
-    uint32_t l2t_id;
-    uint32_t num_l2_entries;
+    uint64_t entry_addr;
     uint64_t dte = 0;
     MemTxResult res = MEMTX_OK;
 
@@ -546,44 +501,17 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
         return true;
     }
 
-    /*
-     * The specification defines the format of level 1 entries of a
-     * 2-level table, but the format of level 2 entries and the format
-     * of flat-mapped tables is IMPDEF.
-     */
-    if (s->dt.indirect) {
-        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
-
-        value = address_space_ldq_le(as,
-                                     s->dt.base_addr +
-                                     (l2t_id * L1TABLE_ENTRY_SIZE),
-                                     MEMTXATTRS_UNSPECIFIED, &res);
-
-        if (res != MEMTX_OK) {
-            return false;
-        }
-
-        valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
-
-        if (valid_l2t) {
-            num_l2_entries = s->dt.page_sz / s->dt.entry_sz;
-
-            l2t_addr = value & ((1ULL << 51) - 1);
-
-            address_space_stq_le(as, l2t_addr +
-                                 ((devid % num_l2_entries) * GITS_DTE_SIZE),
-                                 dte, MEMTXATTRS_UNSPECIFIED, &res);
-        }
-    } else {
-        /* Flat level table */
-        address_space_stq_le(as, s->dt.base_addr + (devid * GITS_DTE_SIZE),
-                             dte, MEMTXATTRS_UNSPECIFIED, &res);
-    }
+    entry_addr = table_entry_addr(s, &s->dt, devid, &res);
     if (res != MEMTX_OK) {
+        /* memory access error: stall */
         return false;
-    } else {
+    }
+    if (entry_addr == -1) {
+        /* No L2 table for this index: discard write and continue */
         return true;
     }
+    address_space_stq_le(as, entry_addr, dte, MEMTXATTRS_UNSPECIFIED, &res);
+    return res == MEMTX_OK;
 }
 
 static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
-- 
2.25.1


