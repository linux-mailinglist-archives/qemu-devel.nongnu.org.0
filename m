Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C9950B4C7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:14:53 +0200 (CEST)
Received: from localhost ([::1]:41308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqJQ-0004zR-IL
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9c-0004EA-JP
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:47 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9a-0002aA-Lr
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:44 -0400
Received: by mail-wm1-x334.google.com with SMTP id bg25so4090795wmb.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I+8r6HdyLDfSMNsAkocsqcRvO9Us4MwlveyivyaGjRg=;
 b=CA7xS+kSriE4laVRHcBgz5HnjlEsFovIwHepM6V6sMnggiKTjwS4ubnLMhwM4MiIng
 2jnT7MlHPo+HaTUszasL/UlWuq/atYmFFbtF0I2z3tvDkaoH78JKeLi0JCZ32btqEE0W
 Mw0IkOo8fLswR3L3/hZAU/8Bp4FSJ+5/sUkQ2Ib5aNgi3I/hwzmQjzUDgI3gkck+AimZ
 /+VdAQ2rKQZ3mDRZx/LU8CYPctEcX5Dpm4yF0h8Wo6nV415KpGm4gbdWpCv9t+C8s5iZ
 91VjF1GUBLUScyoI1Tq7wYswMIM8anIRw3dygL5kvWLXABm6Ohr1GWX6QDVPA/EpTqiq
 nGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I+8r6HdyLDfSMNsAkocsqcRvO9Us4MwlveyivyaGjRg=;
 b=VXvnQTwUaeBN3jN9uRdTx7kI+wVt2e/lUAY7xPoD7ecgY2n1N2eZ4Nf6cLktUHor2I
 pUwp2iVXavSF3chOpOT5xuwiix274zRJ3HjPY+J2xs9j37Yz7yPnTA/XYOlOBEbXHX61
 wQvV/qDpwCN7LST9G7vIT2D1WMb8pU/q0yd5qhMCdPMBvt1haipB9NG4qJaJa/Lawzzn
 fPaZAC51HOgGkJ5l1+sWBB5OJmIBWUWFwOeaofmAOCPl0FpdTNB+n/FUWQtm39ttLLAx
 XPH3rV8Ke+j/APmhg74JgpKH+0xkNsG+t00f+jLIuWWsY0R0fFiNVhNCTMdBnK1AKfEW
 iBMA==
X-Gm-Message-State: AOAM530YHnKbT6rCA6/HgPpEGOfdc1XMAjoFkylPaczmTwSYN6ZUAM1f
 piSHkEoT9waaleCDHpa6qII+dz6sZ4vq+Q==
X-Google-Smtp-Source: ABdhPJz1ZQx0QhkqmhLyd+VbM19ATHAgkAwnEvlCWeGrN1vJQVH8hAlQ6ufZ3IgLvMTtVN8Oq8b04Q==
X-Received: by 2002:a05:600c:25c5:b0:38f:f0b9:4c8c with SMTP id
 5-20020a05600c25c500b0038ff0b94c8cmr3536873wml.20.1650621881097; 
 Fri, 22 Apr 2022 03:04:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/61] hw/intc/arm_gicv3_its: Implement GITS_BASER2 for GICv4
Date: Fri, 22 Apr 2022 11:03:38 +0100
Message-Id: <20220422100432.2288247-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GICv4 defines a new in-guest-memory table for the ITS: this is
the vPE table.  Implement the new GITS_BASER2 register which the
guest uses to tell the ITS where the vPE table is located, including
the decode of the register fields into the TableDesc structure which
we do for the GITS_BASER<n> when the guest enables the ITS.

We guard provision of the new register with the its_feature_virtual()
function, which does a check of the GITS_TYPER.Virtual bit which
indicates presence of ITS support for virtual LPIs.  Since this bit
is currently always zero, GICv4-specific features will not be
accessible to the guest yet.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-8-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h               | 16 ++++++++++++++++
 include/hw/intc/arm_gicv3_its_common.h |  1 +
 hw/intc/arm_gicv3_its.c                | 25 +++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index dec413f7cfa..4613b9e59ba 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -280,6 +280,7 @@ FIELD(GITS_CTLR, ENABLED, 0, 1)
 FIELD(GITS_CTLR, QUIESCENT, 31, 1)
 
 FIELD(GITS_TYPER, PHYSICAL, 0, 1)
+FIELD(GITS_TYPER, VIRTUAL, 1, 1)
 FIELD(GITS_TYPER, ITT_ENTRY_SIZE, 4, 4)
 FIELD(GITS_TYPER, IDBITS, 8, 5)
 FIELD(GITS_TYPER, DEVBITS, 13, 5)
@@ -298,6 +299,7 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_BASER_PAGESIZE_64K               2
 
 #define GITS_BASER_TYPE_DEVICE               1ULL
+#define GITS_BASER_TYPE_VPE                  2ULL
 #define GITS_BASER_TYPE_COLLECTION           4ULL
 
 #define GITS_PAGE_SIZE_4K       0x1000
@@ -419,6 +421,20 @@ FIELD(DTE, ITTADDR, 6, 44)
 FIELD(CTE, VALID, 0, 1)
 FIELD(CTE, RDBASE, 1, RDBASE_PROCNUM_LENGTH)
 
+/*
+ * 8 bytes VPE table entry size:
+ * Valid = 1 bit, VPTsize = 5 bits, VPTaddr = 36 bits, RDbase = 16 bits
+ *
+ * Field sizes for Valid and size are mandated; field sizes for RDbase
+ * and VPT_addr are IMPDEF.
+ */
+#define GITS_VPE_SIZE 0x8ULL
+
+FIELD(VTE, VALID, 0, 1)
+FIELD(VTE, VPTSIZE, 1, 5)
+FIELD(VTE, VPTADDR, 6, 36)
+FIELD(VTE, RDBASE, 42, RDBASE_PROCNUM_LENGTH)
+
 /* Special interrupt IDs */
 #define INTID_SECURE 1020
 #define INTID_NONSECURE 1021
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 0f130494dd3..7d1cc0f7177 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -78,6 +78,7 @@ struct GICv3ITSState {
 
     TableDesc  dt;
     TableDesc  ct;
+    TableDesc  vpet;
     CmdQDesc   cq;
 
     Error *migration_blocker;
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index a2462098445..f9704c07591 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -79,6 +79,12 @@ typedef enum ItsCmdResult {
     CMD_CONTINUE = 1,
 } ItsCmdResult;
 
+/* True if the ITS supports the GICv4 virtual LPI feature */
+static bool its_feature_virtual(GICv3ITSState *s)
+{
+    return s->typer & R_GITS_TYPER_VIRTUAL_MASK;
+}
+
 static inline bool intid_in_lpi_range(uint32_t id)
 {
     return id >= GICV3_LPI_INTID_START &&
@@ -946,6 +952,15 @@ static void extract_table_params(GICv3ITSState *s)
                 idbits = 16;
             }
             break;
+        case GITS_BASER_TYPE_VPE:
+            td = &s->vpet;
+            /*
+             * For QEMU vPEIDs are always 16 bits. (GICv4.1 allows an
+             * implementation to implement fewer bits and report this
+             * via GICD_TYPER2.)
+             */
+            idbits = 16;
+            break;
         default:
             /*
              * GITS_BASER<n>.TYPE is read-only, so GITS_BASER_RO_MASK
@@ -1425,6 +1440,7 @@ static void gicv3_its_reset(DeviceState *dev)
     /*
      * setting GITS_BASER0.Type = 0b001 (Device)
      *         GITS_BASER1.Type = 0b100 (Collection Table)
+     *         GITS_BASER2.Type = 0b010 (vPE) for GICv4 and later
      *         GITS_BASER<n>.Type,where n = 3 to 7 are 0b00 (Unimplemented)
      *         GITS_BASER<0,1>.Page_Size = 64KB
      * and default translation table entry size to 16 bytes
@@ -1442,6 +1458,15 @@ static void gicv3_its_reset(DeviceState *dev)
                              GITS_BASER_PAGESIZE_64K);
     s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER, ENTRYSIZE,
                              GITS_CTE_SIZE - 1);
+
+    if (its_feature_virtual(s)) {
+        s->baser[2] = FIELD_DP64(s->baser[2], GITS_BASER, TYPE,
+                                 GITS_BASER_TYPE_VPE);
+        s->baser[2] = FIELD_DP64(s->baser[2], GITS_BASER, PAGESIZE,
+                                 GITS_BASER_PAGESIZE_64K);
+        s->baser[2] = FIELD_DP64(s->baser[2], GITS_BASER, ENTRYSIZE,
+                                 GITS_VPE_SIZE - 1);
+    }
 }
 
 static void gicv3_its_post_load(GICv3ITSState *s)
-- 
2.25.1


