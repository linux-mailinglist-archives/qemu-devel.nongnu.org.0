Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7AC3EA8DE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 18:56:52 +0200 (CEST)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEE0h-0002FK-BL
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 12:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxq-0007kH-Fj
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:53:55 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:38772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxj-00061B-Ap
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:53:53 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id bl13so3502290qvb.5
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 09:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5p3T1psRSxN3EC4LcLnAjbPfIWdbypNPYnZp/MB2MiA=;
 b=KjvxGKb3xGrQGgRpu8bZGmURa1nFS0dcDul1bt77guj4i+iyAIqvavxNwVYbx2YtMG
 96eZWJZ4BmyahcYb+ztsYntqPg/fCXfl//7XJ88SGAS9ye4tD4JCSL1JTf1hBU1Nzz3c
 UMmas9NxtdC6bLVf7EB2HPugrU6d6ef/yKde856nGV5C2EFeGeUuWezLkGJtcZDXb6VM
 WG3M9Kty6Ukqlaw2HOXDXRyjJtPXNV40mJmU1t0BFkJZotV68BMbfy+UIZd+1CRL1fdd
 PRfiDdsii41/dFluSLULP8CLKE8kTmzokyp0VNuAzgmx2b+bJgSayG0OcExR1yz+OMx7
 CmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5p3T1psRSxN3EC4LcLnAjbPfIWdbypNPYnZp/MB2MiA=;
 b=mKmF23ig0O08QAuD3Wi5/GkmOtgtHcl84lliloj52R55JoOa76bI8z1ZIl3cv5SzBr
 5hjkT8nJF+pjLrP8rjt/b8QuvmHIkBWrbxlDPMZWduTQktKsCgZHuW1bN+jfj91ggFLC
 KiLyfizx5WUUxsOwhuuqyxmqyHQogbKGZB0LTQlz++IH9oNxyb4eCugsfc7k4QPy3cyJ
 Uq+Y8YDwYlbYX7wDNkCgGM0JrvsFJ9K0UGtRqjsqFfBY9fS5XmwN612qka+R6p5XcdHJ
 SY1n9YlOGa62ZK72MXldD82/o1MauvjVopQfD4/NcRgsj0Xi9AImGNFf7XDvktGNEuyF
 ZNSQ==
X-Gm-Message-State: AOAM533evH7dY1KT2ODli94bcsd3d+6fmj292VMGR3DNjnxMu2Ptb2Fn
 1JgVqPxP63aGuS9PjG2g2j8Tuw==
X-Google-Smtp-Source: ABdhPJxftmaM8shL6xe8uJ3ppE3V3b3EUry6Zyc9Y0NyF1lNGMOqF6F06il+LgJ8LPBXRja3uw/P3g==
X-Received: by 2002:a05:6214:e4e:: with SMTP id
 o14mr4832561qvc.55.1628787226260; 
 Thu, 12 Aug 2021 09:53:46 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id c69sm1714864qkg.1.2021.08.12.09.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 09:53:46 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v8 02/10] hw/intc: GICv3 ITS register definitions added
Date: Thu, 12 Aug 2021 12:53:33 -0400
Message-Id: <20210812165341.40784-3-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210812165341.40784-1-shashi.mallela@linaro.org>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2a.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Defined descriptors for ITS device table,collection table and ITS
command queue entities.Implemented register read/write functions,
extract ITS table parameters and command queue parameters,extended
gicv3 common to capture qemu address space(which host the ITS table
platform memories required for subsequent ITS processing) and
initialize the same in ITS device.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
---
 hw/intc/arm_gicv3_its.c                | 376 +++++++++++++++++++++++++
 hw/intc/gicv3_internal.h               |  29 ++
 include/hw/intc/arm_gicv3_common.h     |   3 +
 include/hw/intc/arm_gicv3_its_common.h |  23 ++
 4 files changed, 431 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 2286b3f757..b2210dffdc 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -29,6 +29,160 @@ struct GICv3ITSClass {
     void (*parent_reset)(DeviceState *dev);
 };
 
+static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
+{
+    uint64_t result = 0;
+
+    switch (page_sz) {
+    case GITS_PAGE_SIZE_4K:
+    case GITS_PAGE_SIZE_16K:
+        result = FIELD_EX64(value, GITS_BASER, PHYADDR) << 12;
+        break;
+
+    case GITS_PAGE_SIZE_64K:
+        result = FIELD_EX64(value, GITS_BASER, PHYADDRL_64K) << 16;
+        result |= FIELD_EX64(value, GITS_BASER, PHYADDRH_64K) << 48;
+        break;
+
+    default:
+        break;
+    }
+    return result;
+}
+
+/*
+ * This function extracts the ITS Device and Collection table specific
+ * parameters (like base_addr, size etc) from GITS_BASER register.
+ * It is called during ITS enable and also during post_load migration
+ */
+static void extract_table_params(GICv3ITSState *s)
+{
+    uint16_t num_pages = 0;
+    uint8_t  page_sz_type;
+    uint8_t type;
+    uint32_t page_sz = 0;
+    uint64_t value;
+
+    for (int i = 0; i < 8; i++) {
+        value = s->baser[i];
+
+        if (!value) {
+            continue;
+        }
+
+        page_sz_type = FIELD_EX64(value, GITS_BASER, PAGESIZE);
+
+        switch (page_sz_type) {
+        case 0:
+            page_sz = GITS_PAGE_SIZE_4K;
+            break;
+
+        case 1:
+            page_sz = GITS_PAGE_SIZE_16K;
+            break;
+
+        case 2:
+        case 3:
+            page_sz = GITS_PAGE_SIZE_64K;
+            break;
+
+        default:
+            g_assert_not_reached();
+        }
+
+        num_pages = FIELD_EX64(value, GITS_BASER, SIZE) + 1;
+
+        type = FIELD_EX64(value, GITS_BASER, TYPE);
+
+        switch (type) {
+
+        case GITS_BASER_TYPE_DEVICE:
+            memset(&s->dt, 0 , sizeof(s->dt));
+            s->dt.valid = FIELD_EX64(value, GITS_BASER, VALID);
+
+            if (!s->dt.valid) {
+                return;
+            }
+
+            s->dt.page_sz = page_sz;
+            s->dt.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
+            s->dt.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
+
+            if (!s->dt.indirect) {
+                s->dt.max_entries = (num_pages * page_sz) / s->dt.entry_sz;
+            } else {
+                s->dt.max_entries = (((num_pages * page_sz) /
+                                     L1TABLE_ENTRY_SIZE) *
+                                     (page_sz / s->dt.entry_sz));
+            }
+
+            s->dt.maxids.max_devids = (1UL << (FIELD_EX64(s->typer, GITS_TYPER,
+                                       DEVBITS) + 1));
+
+            s->dt.base_addr = baser_base_addr(value, page_sz);
+
+            break;
+
+        case GITS_BASER_TYPE_COLLECTION:
+            memset(&s->ct, 0 , sizeof(s->ct));
+            s->ct.valid = FIELD_EX64(value, GITS_BASER, VALID);
+
+            /*
+             * GITS_TYPER.HCC is 0 for this implementation
+             * hence writes are discarded if ct.valid is 0
+             */
+            if (!s->ct.valid) {
+                return;
+            }
+
+            s->ct.page_sz = page_sz;
+            s->ct.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
+            s->ct.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
+
+            if (!s->ct.indirect) {
+                s->ct.max_entries = (num_pages * page_sz) / s->ct.entry_sz;
+            } else {
+                s->ct.max_entries = (((num_pages * page_sz) /
+                                     L1TABLE_ENTRY_SIZE) *
+                                     (page_sz / s->ct.entry_sz));
+            }
+
+            if (FIELD_EX64(s->typer, GITS_TYPER, CIL)) {
+                s->ct.maxids.max_collids = (1UL << (FIELD_EX64(s->typer,
+                                            GITS_TYPER, CIDBITS) + 1));
+            } else {
+                /* 16-bit CollectionId supported when CIL == 0 */
+                s->ct.maxids.max_collids = (1UL << 16);
+            }
+
+            s->ct.base_addr = baser_base_addr(value, page_sz);
+
+            break;
+
+        default:
+            break;
+        }
+    }
+}
+
+static void extract_cmdq_params(GICv3ITSState *s)
+{
+    uint16_t num_pages = 0;
+    uint64_t value = s->cbaser;
+
+    num_pages = FIELD_EX64(value, GITS_CBASER, SIZE) + 1;
+
+    memset(&s->cq, 0 , sizeof(s->cq));
+    s->cq.valid = FIELD_EX64(value, GITS_CBASER, VALID);
+
+    if (s->cq.valid) {
+        s->cq.max_entries = (num_pages * GITS_PAGE_SIZE_4K) /
+                             GITS_CMDQ_ENTRY_SIZE;
+        s->cq.base_addr = FIELD_EX64(value, GITS_CBASER, PHYADDR);
+        s->cq.base_addr <<= R_GITS_CBASER_PHYADDR_SHIFT;
+    }
+}
+
 static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
                                                uint64_t data, unsigned size,
                                                MemTxAttrs attrs)
@@ -42,7 +196,99 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
                               uint64_t value, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
+    int index;
 
+    switch (offset) {
+    case GITS_CTLR:
+        s->ctlr |= (value & ~(s->ctlr));
+
+        if (s->ctlr & ITS_CTLR_ENABLED) {
+            extract_table_params(s);
+            extract_cmdq_params(s);
+            s->creadr = 0;
+        }
+        break;
+    case GITS_CBASER:
+        /*
+         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
+         *                 already enabled
+         */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            s->cbaser = deposit64(s->cbaser, 0, 32, value);
+            s->creadr = 0;
+            s->cwriter = s->creadr;
+        }
+        break;
+    case GITS_CBASER + 4:
+        /*
+         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
+         *                 already enabled
+         */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            s->cbaser = deposit64(s->cbaser, 32, 32, value);
+            s->creadr = 0;
+            s->cwriter = s->creadr;
+        }
+        break;
+    case GITS_CWRITER:
+        s->cwriter = deposit64(s->cwriter, 0, 32,
+                               (value & ~R_GITS_CWRITER_RETRY_MASK));
+        break;
+    case GITS_CWRITER + 4:
+        s->cwriter = deposit64(s->cwriter, 32, 32, value);
+        break;
+    case GITS_CREADR:
+        if (s->gicv3->gicd_ctlr & GICD_CTLR_DS) {
+            s->creadr = deposit64(s->creadr, 0, 32,
+                                  (value & ~R_GITS_CREADR_STALLED_MASK));
+        } else {
+            /* RO register, ignore the write */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid guest write to RO register at offset "
+                          TARGET_FMT_plx "\n", __func__, offset);
+        }
+        break;
+    case GITS_CREADR + 4:
+        if (s->gicv3->gicd_ctlr & GICD_CTLR_DS) {
+            s->creadr = deposit64(s->creadr, 32, 32, value);
+        } else {
+            /* RO register, ignore the write */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid guest write to RO register at offset "
+                          TARGET_FMT_plx "\n", __func__, offset);
+        }
+        break;
+    case GITS_BASER ... GITS_BASER + 0x3f:
+        /*
+         * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
+         *                 already enabled
+         */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            index = (offset - GITS_BASER) / 8;
+
+            if (offset & 7) {
+                value <<= 32;
+                value &= ~GITS_BASER_RO_MASK;
+                s->baser[index] &= GITS_BASER_RO_MASK | MAKE_64BIT_MASK(0, 32);
+                s->baser[index] |= value;
+            } else {
+                value &= ~GITS_BASER_RO_MASK;
+                s->baser[index] &= GITS_BASER_RO_MASK | MAKE_64BIT_MASK(32, 32);
+                s->baser[index] |= value;
+            }
+        }
+        break;
+    case GITS_IIDR:
+    case GITS_IDREGS ... GITS_IDREGS + 0x2f:
+        /* RO registers, ignore the write */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest write to RO register at offset "
+                      TARGET_FMT_plx "\n", __func__, offset);
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
@@ -50,7 +296,55 @@ static MemTxResult its_readl(GICv3ITSState *s, hwaddr offset,
                              uint64_t *data, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
+    int index;
 
+    switch (offset) {
+    case GITS_CTLR:
+        *data = s->ctlr;
+        break;
+    case GITS_IIDR:
+        *data = gicv3_iidr();
+        break;
+    case GITS_IDREGS ... GITS_IDREGS + 0x2f:
+        /* ID registers */
+        *data = gicv3_idreg(offset - GITS_IDREGS);
+        break;
+    case GITS_TYPER:
+        *data = extract64(s->typer, 0, 32);
+        break;
+    case GITS_TYPER + 4:
+        *data = extract64(s->typer, 32, 32);
+        break;
+    case GITS_CBASER:
+        *data = extract64(s->cbaser, 0, 32);
+        break;
+    case GITS_CBASER + 4:
+        *data = extract64(s->cbaser, 32, 32);
+        break;
+    case GITS_CREADR:
+        *data = extract64(s->creadr, 0, 32);
+        break;
+    case GITS_CREADR + 4:
+        *data = extract64(s->creadr, 32, 32);
+        break;
+    case GITS_CWRITER:
+        *data = extract64(s->cwriter, 0, 32);
+        break;
+    case GITS_CWRITER + 4:
+        *data = extract64(s->cwriter, 32, 32);
+        break;
+    case GITS_BASER ... GITS_BASER + 0x3f:
+        index = (offset - GITS_BASER) / 8;
+        if (offset & 7) {
+            *data = extract64(s->baser[index], 32, 32);
+        } else {
+            *data = extract64(s->baser[index], 0, 32);
+        }
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
@@ -58,7 +352,54 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
                                uint64_t value, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
+    int index;
 
+    switch (offset) {
+    case GITS_BASER ... GITS_BASER + 0x3f:
+        /*
+         * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
+         *                 already enabled
+         */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            index = (offset - GITS_BASER) / 8;
+            s->baser[index] &= GITS_BASER_RO_MASK;
+            s->baser[index] |= (value & ~GITS_BASER_RO_MASK);
+        }
+        break;
+    case GITS_CBASER:
+        /*
+         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
+         *                 already enabled
+         */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            s->cbaser = value;
+            s->creadr = 0;
+            s->cwriter = s->creadr;
+        }
+        break;
+    case GITS_CWRITER:
+        s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
+        break;
+    case GITS_CREADR:
+        if (s->gicv3->gicd_ctlr & GICD_CTLR_DS) {
+            s->creadr = value & ~R_GITS_CREADR_STALLED_MASK;
+        } else {
+            /* RO register, ignore the write */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid guest write to RO register at offset "
+                          TARGET_FMT_plx "\n", __func__, offset);
+        }
+        break;
+    case GITS_TYPER:
+        /* RO registers, ignore the write */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest write to RO register at offset "
+                      TARGET_FMT_plx "\n", __func__, offset);
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
@@ -66,7 +407,29 @@ static MemTxResult its_readll(GICv3ITSState *s, hwaddr offset,
                               uint64_t *data, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
+    int index;
 
+    switch (offset) {
+    case GITS_TYPER:
+        *data = s->typer;
+        break;
+    case GITS_BASER ... GITS_BASER + 0x3f:
+        index = (offset - GITS_BASER) / 8;
+        *data = s->baser[index];
+        break;
+    case GITS_CBASER:
+        *data = s->cbaser;
+        break;
+    case GITS_CREADR:
+        *data = s->creadr;
+        break;
+    case GITS_CWRITER:
+        *data = s->cwriter;
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
@@ -170,6 +533,9 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
 
     gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_translation_ops);
 
+    address_space_init(&s->gicv3->dma_as, s->gicv3->dma,
+                       "gicv3-its-sysmem");
+
     /* set the ITS default features supported */
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
                           GITS_TYPE_PHYSICAL);
@@ -213,6 +579,14 @@ static void gicv3_its_reset(DeviceState *dev)
                              GITS_CTE_SIZE - 1);
 }
 
+static void gicv3_its_post_load(GICv3ITSState *s)
+{
+    if (s->ctlr & ITS_CTLR_ENABLED) {
+        extract_table_params(s);
+        extract_cmdq_params(s);
+    }
+}
+
 static Property gicv3_its_props[] = {
     DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "arm-gicv3",
                      GICv3State *),
@@ -223,10 +597,12 @@ static void gicv3_its_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     GICv3ITSClass *ic = ARM_GICV3_ITS_CLASS(klass);
+    GICv3ITSCommonClass *icc = ARM_GICV3_ITS_COMMON_CLASS(klass);
 
     dc->realize = gicv3_arm_its_realize;
     device_class_set_props(dc, gicv3_its_props);
     device_class_set_parent_reset(dc, gicv3_its_reset, &ic->parent_reset);
+    icc->post_load = gicv3_its_post_load;
 }
 
 static const TypeInfo gicv3_its_info = {
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index b99bf9db46..92e0a4fa68 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -258,6 +258,20 @@ FIELD(GITS_BASER, INNERCACHE, 59, 3)
 FIELD(GITS_BASER, INDIRECT, 62, 1)
 FIELD(GITS_BASER, VALID, 63, 1)
 
+FIELD(GITS_CBASER, SIZE, 0, 8)
+FIELD(GITS_CBASER, SHAREABILITY, 10, 2)
+FIELD(GITS_CBASER, PHYADDR, 12, 40)
+FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
+FIELD(GITS_CBASER, INNERCACHE, 59, 3)
+FIELD(GITS_CBASER, VALID, 63, 1)
+
+FIELD(GITS_CREADR, STALLED, 0, 1)
+FIELD(GITS_CREADR, OFFSET, 5, 15)
+
+FIELD(GITS_CWRITER, RETRY, 0, 1)
+FIELD(GITS_CWRITER, OFFSET, 5, 15)
+
+FIELD(GITS_CTLR, ENABLED, 0, 1)
 FIELD(GITS_CTLR, QUIESCENT, 31, 1)
 
 FIELD(GITS_TYPER, PHYSICAL, 0, 1)
@@ -269,6 +283,13 @@ FIELD(GITS_TYPER, PTA, 19, 1)
 FIELD(GITS_TYPER, CIDBITS, 32, 4)
 FIELD(GITS_TYPER, CIL, 36, 1)
 
+#define GITS_IDREGS           0xFFD0
+
+#define ITS_CTLR_ENABLED               (1U)  /* ITS Enabled */
+
+#define GITS_BASER_RO_MASK                  (R_GITS_BASER_ENTRYSIZE_MASK | \
+                                              R_GITS_BASER_TYPE_MASK)
+
 #define GITS_BASER_PAGESIZE_4K                0
 #define GITS_BASER_PAGESIZE_16K               1
 #define GITS_BASER_PAGESIZE_64K               2
@@ -276,6 +297,14 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_BASER_TYPE_DEVICE               1ULL
 #define GITS_BASER_TYPE_COLLECTION           4ULL
 
+#define GITS_PAGE_SIZE_4K       0x1000
+#define GITS_PAGE_SIZE_16K      0x4000
+#define GITS_PAGE_SIZE_64K      0x10000
+
+#define L1TABLE_ENTRY_SIZE         8
+
+#define GITS_CMDQ_ENTRY_SIZE               32
+
 /**
  * Default features advertised by this version of ITS
  */
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 91491a2f66..1fd5cedbbd 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -226,6 +226,9 @@ struct GICv3State {
     int dev_fd; /* kvm device fd if backed by kvm vgic support */
     Error *migration_blocker;
 
+    MemoryRegion *dma;
+    AddressSpace dma_as;
+
     /* Distributor */
 
     /* for a GIC with the security extensions the NS banked version of this
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 65d1191db1..4e79145dde 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -41,6 +41,25 @@
 
 #define GITS_TRANSLATER  0x0040
 
+typedef struct {
+    bool valid;
+    bool indirect;
+    uint16_t entry_sz;
+    uint32_t page_sz;
+    uint32_t max_entries;
+    union {
+        uint32_t max_devids;
+        uint32_t max_collids;
+    } maxids;
+    uint64_t base_addr;
+} TableDesc;
+
+typedef struct {
+    bool valid;
+    uint32_t max_entries;
+    uint64_t base_addr;
+} CmdQDesc;
+
 struct GICv3ITSState {
     SysBusDevice parent_obj;
 
@@ -63,6 +82,10 @@ struct GICv3ITSState {
     uint64_t creadr;
     uint64_t baser[8];
 
+    TableDesc  dt;
+    TableDesc  ct;
+    CmdQDesc   cq;
+
     Error *migration_blocker;
 };
 
-- 
2.27.0


