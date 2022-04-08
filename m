Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A0F4F984F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:39:55 +0200 (CEST)
Received: from localhost ([::1]:48604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpmE-00036r-8b
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPW-0007A0-NR
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:26 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPS-0002PG-Jb
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:24 -0400
Received: by mail-wr1-x433.google.com with SMTP id r13so13047748wrr.9
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+omF+kOgFeDIOatldLPHb3t7gwzCgkn9rUffahPiAzQ=;
 b=ZjSC53qAsJbRwlVwtiYBqqzVDMWef3YSZvRGUNnFi5Ez/EcTlROrwYYm1uD/13PQ7y
 V/z3m1TeS/1msYwLnsamLUEd1JV+qhGbpFBxo7snU46cqbXBr2fzWirRN4Y0xJpx9JGX
 Uod0lQwOrAa5J6HvxApH/8sqZNi+QwVKFK6V5RXfQVLuVV2W4OKShZ5KNDdDosvO6XpB
 E4JGyGi3qd6AFfaKmnHGoMkl9OsMJjQd3fT8N7QbExGvuZ344yVH1YMyP+rUgZ9ITsEC
 qzaOcMcMBdpGO8+iIgOap595MPqQZHKYYPv0OGiUudJ8FbI3TNrrQGgTlzpSvooMgYAK
 nRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+omF+kOgFeDIOatldLPHb3t7gwzCgkn9rUffahPiAzQ=;
 b=0TYy1JVoQ1iD4SyzwFfujCdi3ZXzzlfa8zczZqxTYAYg3wLAxExlwqQcpB+CMT46bu
 5eODfGUl1RM2R5dHceanwMv1b/os3KzCEoXL63dctFfgtL42nal0THlGzjezotxYiUW+
 b1LP8QpWp9Qcn9oqH26K0pN+yxmGrVdW3QP/jrWw1eEufHcEF2ePb2XFqUeCmbw7HkaM
 XKXNkuNslvv6I0OQjipbk8WWQ1LHI7Iux1oLcc6zJ8HCNwXfivu0N2El4FRBZpr2+NCZ
 thv4smqzwNT+Lgu7lJeWgomWXy/HrURem2JFAWL65/k3zJQpyDU/jTTA+01xqoV/uddN
 /70g==
X-Gm-Message-State: AOAM530CgaG/OagnzKlED0OH9me6J5cA94C9WLjOzHze41n9qKTo9MPc
 kw7/M2LPogaszSiDERG8H37ATA==
X-Google-Smtp-Source: ABdhPJyrTXiENoMx3xj+b4HpVwvXjCXg1O2Sl/5HT4N9mJr45Dy9kKHEdnJSwuWJalhPiss99tZMPg==
X-Received: by 2002:a5d:53c8:0:b0:206:1c8e:2a4b with SMTP id
 a8-20020a5d53c8000000b002061c8e2a4bmr14517171wrw.370.1649427381168; 
 Fri, 08 Apr 2022 07:16:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 30/41] hw/intc/arm_gicv3_redist: Factor out "update bit in
 pending table" code
Date: Fri,  8 Apr 2022 15:15:39 +0100
Message-Id: <20220408141550.1271295-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Factor out the code which sets a single bit in an LPI pending table.
We're going to need this for handling vLPI tables, not just the
physical LPI table.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 49 +++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index bfdde36a206..64e5d96ac36 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -145,6 +145,34 @@ static void update_for_all_lpis(GICv3CPUState *cs, uint64_t ptbase,
     }
 }
 
+/**
+ * set_lpi_pending_bit: Set or clear pending bit for an LPI
+ *
+ * @cs: GICv3CPUState
+ * @ptbase: physical address of LPI Pending table
+ * @irq: LPI to change pending state for
+ * @level: 0 to clear pending state, 1 to set
+ *
+ * Returns true if we needed to do something, false if the pending bit
+ * was already at @level.
+ */
+static bool set_pending_table_bit(GICv3CPUState *cs, uint64_t ptbase,
+                                  int irq, int level)
+{
+    AddressSpace *as = &cs->gic->dma_as;
+    uint64_t addr = ptbase + irq / 8;
+    uint8_t pend;
+
+    address_space_read(as, addr, MEMTXATTRS_UNSPECIFIED, &pend, 1);
+    if (extract32(pend, irq % 8, 1) == level) {
+        /* Bit already at requested state, no action required */
+        return false;
+    }
+    pend = deposit32(pend, irq % 8, 1, level ? 1 : 0);
+    address_space_write(as, addr, MEMTXATTRS_UNSPECIFIED, &pend, 1);
+    return true;
+}
+
 static uint8_t gicr_read_ipriorityr(GICv3CPUState *cs, MemTxAttrs attrs,
                                     int irq)
 {
@@ -809,30 +837,13 @@ void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
      * This function updates the pending bit in lpi pending table for
      * the irq being activated or deactivated.
      */
-    AddressSpace *as = &cs->gic->dma_as;
     uint64_t lpipt_baddr;
-    bool ispend = false;
-    uint8_t pend;
 
-    /*
-     * get the bit value corresponding to this irq in the
-     * lpi pending table
-     */
     lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
-
-    address_space_read(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
-                       MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
-
-    ispend = extract32(pend, irq % 8, 1);
-
-    /* no change in the value of pending bit, return */
-    if (ispend == level) {
+    if (!set_pending_table_bit(cs, lpipt_baddr, irq, level)) {
+        /* no change in the value of pending bit, return */
         return;
     }
-    pend = deposit32(pend, irq % 8, 1, level ? 1 : 0);
-
-    address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
-                        MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
 
     /*
      * check if this LPI is better than the current hpplpi, if yes
-- 
2.25.1


