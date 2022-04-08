Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FAC4F9848
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:38:49 +0200 (CEST)
Received: from localhost ([::1]:43860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncplA-0008Oy-Ci
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPK-0006wO-N8
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:16 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPI-0002KE-S9
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:14 -0400
Received: by mail-wr1-x42f.google.com with SMTP id k23so13059390wrd.8
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IW3bX6iSTzjY92yAkhrP7T+aVrPKgsiAz2F7JAZ7pV8=;
 b=CLTVJ1sp7BlkRmFql0rYCrWbZ76QO3SI2benWXUE74Ugy6yH8XRMzLh2liS6wF5xuY
 5Y5V8gLlwXCudDcyQMKzSXMrY0qgArwNFh67gT8/jOD78I9Trn59CFBxKqHKuoqSaCYp
 SlSd8CVDrwUmdT/A5nanuHb3xtSvYdkYMDGmssmFsgjrVWcljbJNhSNRJ/tXfJtYaUSa
 fjI+o8r2ulP6eM82g+WMHqZDIcs3axM7gsHp/hVAz2hqOpSXLUAkE1NdoZlJnrcvtXuM
 +GWW2eepPCUTZlxoa2jUkucJNltMLkYqPYL6A6L2T2QUm1RPkvrXYK17YEFLbNpTcW3R
 XcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IW3bX6iSTzjY92yAkhrP7T+aVrPKgsiAz2F7JAZ7pV8=;
 b=sgy8WISr1g0qDT2hNVVdNET+wDIhgy5Peo980WkS0kM1d2x2hyDnRYglZt5Pr/pHia
 UG5htNp+fS10RTxEQkwq1GZjD/7jWquVWj6ddvwxHSJ1oOnxmiGrSJJsg7wsQk2UkQ9p
 I5W2EPDaD1VzKzk3KHAVijkW6Uu19A6+7CxEzgpjyIrVV+wdnVPkL9VF5HENd3BUZbLF
 3r+EO+FV4G7heobklR5pH5vM4o/HR4Zdvhg99lytJqiuhCQbmJrkzAl5bCdA/d3TPh2i
 X5HsoGuLVZG0V41CrDc/VIISlwAUwqOLtANyTyx+kyftYnDoDM7JEaNnUqAXXT5DX3z/
 NTfg==
X-Gm-Message-State: AOAM533aaihhW2QtYTwfB8icaNFqRdnmRA1+mYRkdpqnG6mL2hA0e+45
 l1PF5qutr7YvM5HajO+7tPOSHf1I4pEttA==
X-Google-Smtp-Source: ABdhPJzgVPkN5Jt4DzV/VEOQIMpapR0ywIwB748g4yscjb8HSbhFaE9D1MKZzbxHuCSwl3QCiqfP6g==
X-Received: by 2002:a5d:6da5:0:b0:207:9112:3fce with SMTP id
 u5-20020a5d6da5000000b0020791123fcemr3484870wrs.210.1649427371533; 
 Fri, 08 Apr 2022 07:16:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 19/41] hw/intc/arm_gicv3_its: Implement INV for virtual
 interrupts
Date: Fri,  8 Apr 2022 15:15:28 +0100
Message-Id: <20220408141550.1271295-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Implement the ITS side of the handling of the INV command for
virtual interrupts; as usual this calls into a redistributor
function which we leave as a stub to fill in later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h   |  9 +++++++++
 hw/intc/arm_gicv3_its.c    | 16 ++++++++++++++--
 hw/intc/arm_gicv3_redist.c |  8 ++++++++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 25ea19de385..2f653a9b917 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -585,6 +585,15 @@ void gicv3_redist_update_lpi_only(GICv3CPUState *cs);
  * Forget or update any cached information associated with this LPI.
  */
 void gicv3_redist_inv_lpi(GICv3CPUState *cs, int irq);
+/**
+ * gicv3_redist_inv_vlpi:
+ * @cs: GICv3CPUState
+ * @irq: vLPI to invalidate cached information for
+ * @vptaddr: (guest) address of vLPI table
+ *
+ * Forget or update any cached information associated with this vLPI.
+ */
+void gicv3_redist_inv_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr);
 /**
  * gicv3_redist_mov_lpi:
  * @src: source redistributor
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 6ba554c16ea..c8b90e6b0d9 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1090,6 +1090,7 @@ static ItsCmdResult process_inv(GICv3ITSState *s, const uint64_t *cmdpkt)
     ITEntry ite;
     DTEntry dte;
     CTEntry cte;
+    VTEntry vte;
     ItsCmdResult cmdres;
 
     devid = FIELD_EX64(cmdpkt[0], INV_0, DEVICEID);
@@ -1118,8 +1119,19 @@ static ItsCmdResult process_inv(GICv3ITSState *s, const uint64_t *cmdpkt)
                           __func__, ite.inttype);
             return CMD_CONTINUE;
         }
-        /* We will implement the vLPI invalidation in a later commit */
-        g_assert_not_reached();
+
+        cmdres = lookup_vte(s, __func__, ite.vpeid, &vte);
+        if (cmdres != CMD_CONTINUE_OK) {
+            return cmdres;
+        }
+        if (!intid_in_lpi_range(ite.intid) ||
+            ite.intid >= (1ULL << (vte.vptsize + 1))) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: intid 0x%x out of range\n",
+                          __func__, ite.intid);
+            return CMD_CONTINUE;
+        }
+        gicv3_redist_inv_vlpi(&s->gicv3->cpu[vte.rdbase], ite.intid,
+                              vte.vptaddr << 16);
         break;
     default:
         g_assert_not_reached();
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 78650a3bb4c..856494b4e8f 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -808,6 +808,14 @@ void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
      */
 }
 
+void gicv3_redist_inv_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr)
+{
+    /*
+     * The redistributor handling for invalidating cached information
+     * about a VLPI will be added in a subsequent commit.
+     */
+}
+
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
 {
     /* Update redistributor state for a change in an external PPI input line */
-- 
2.25.1


