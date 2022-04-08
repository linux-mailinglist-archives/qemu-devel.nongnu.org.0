Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E29C4F97F0
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:22:54 +0200 (CEST)
Received: from localhost ([::1]:53022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpVl-00022f-Je
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPB-0006k2-9F
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP8-0002FP-Lo
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:04 -0400
Received: by mail-wr1-x435.google.com with SMTP id d29so13035776wra.10
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S+YvDc8DedNVliPTdGBNFfK23a5rnWxdXtkXVjY58mc=;
 b=npD8nl3z8IPnhyE6dhFkhj+k7C2alarkLJR100Ee8sBTcNVZxfy6AUjYiw1Yuw/tlS
 lPLXJwbpb91D/+xi5b54XUIUskJFXIcAFr8x75XbLDpZsG2uVdmbgG++HEFYRCTT5+It
 DRI9dX/uOpgjDpzg1/MdPk7QWX/1gwFg8E7rhOe3vQZAJJ7suKUrwk4yq21fh0Cfg9Zc
 hVFoZCxF0IjAXay3yVvj5lWM93AA87hpDwLPw8BUTKgyZ/TOIMH+Z/8Kc13Rw272xxo+
 H3uvnm2kijI3llF8ZSqRp9gQX69A20lzqOVPTRbpyJxYfokEr7LWsJw3+pPvVxT1HYH+
 uh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S+YvDc8DedNVliPTdGBNFfK23a5rnWxdXtkXVjY58mc=;
 b=khimjuyIz/EBus4gvUHeGRNp2fALf5cc8e5yHk5q32YuG6k4sfX35CtDMdRuzoIzEy
 peCIoqhzxAohvE8HRRkUlNb4fClA516unwnvGmxIJ5A9rr8l3siOS2gfsfnL62D26uQT
 EPLX/QLXhuXvFf8VyTBQx2LWjJbUuZ1hYBc8MSEn+oJtI3hvTR6+tdGepeq71w++qegY
 Cg9cLCgbx9Z9XbWnNP00Jp4eI/dW7XrftTpMbSDV5SNwEvIIUG/znPCXCbyD7f4aXGp/
 iqAQ843qGHmSvsu3gpAb7En0MaBb5+q9t+YZ2b292UeJjOiSLFq6cjsTLikKML5P/nlI
 VW6A==
X-Gm-Message-State: AOAM533QnyJI8w5aD7fFxQ0PE4RDJpajwUSQWBaQloCF88fpZ3YMrhaJ
 eDKItkgx0ib8OEEaScaEwWOdcQ==
X-Google-Smtp-Source: ABdhPJwiP8hELAFfVUj5ZSzCwZu9yZ5CnWn7dp3cs//wAXfu0C2PRA5A6+gjQoTmDfDhEG6fGTYePA==
X-Received: by 2002:a5d:6da8:0:b0:205:8537:af57 with SMTP id
 u8-20020a5d6da8000000b002058537af57mr14533795wrs.80.1649427360723; 
 Fri, 08 Apr 2022 07:16:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/41] hw/intc/arm_gicv3_its: Implement GITS_BASER2 for GICv4
Date: Fri,  8 Apr 2022 15:15:16 +0100
Message-Id: <20220408141550.1271295-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
index 400cdf83794..609c29496a0 100644
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


