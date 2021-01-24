Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92289301946
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 03:58:35 +0100 (CET)
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3Vbm-0003rn-6O
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 21:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWc-0006jT-7X
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 21:53:14 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWZ-00039Y-90
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 21:53:13 -0500
Received: by mail-wr1-x430.google.com with SMTP id l12so8834635wry.2
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 18:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vCib2bK8ZRs2GnL3ZDKcV/vqIXCDzjV3kKl0ikqzRig=;
 b=LLMgbORQec2Dr4WSi01vJWcBOvpgSpJQ2j3cj/NkQnSiXBP9kzw6HoB+MtzPw6zqVO
 gvftycDy3K+tD1XWM8vIR0Q/3NiggDJOnzpk1LOW8n6SlI8sDuqS/9kheDr335tPxOki
 BoCFY12rRUPOP9Jer+05qAkJpEWYxD0pj/trXJYNfTpuNygLws1vP65r7emrWeANfio4
 TqU4lwf3NgjjuULU6miWOBI3GgzJ/aJXL4Zr/QmT7NNzTKxGnVn54I6NN26jwd5QSBdW
 6WFDUc8UBk2cW89q7B6jAx7e/X+Qj8hNDbwJssNXVB5z8IkAbnGj+cJhItpLCXr1DeZd
 kV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vCib2bK8ZRs2GnL3ZDKcV/vqIXCDzjV3kKl0ikqzRig=;
 b=S7AiAA+KVculMg+6ChsI+xhh91uZ2G/hgLH0Rt16IXiSMzsQMh6MslTxRR8+4JOlOH
 HfaAsLdurp/Q0ZNeMaxmCkNu7yK/DwrL02xVEjHGa5ptgbca+dFD92xYrezLo4w5bVNe
 VnTyzSCHavlvja2OnYu3k7eahtTDR5Tyok2CXPW2bUzv8eVsFflwtjlm2PfYYh5pnXdd
 6+jAT6CgbRHmh8npzdFAGrD2ICNOj1dZKVRCi1QyLleDL5ZBMFq1rGvDJn5OZ9dwsU42
 ASXfvYPAPwDRhrukH/xkw2hRrW6ecY+ImL06mg8LsAo/K3K0zBrny02yzbRyMjMsV6xT
 UsPQ==
X-Gm-Message-State: AOAM530AwxhiQfiFTe2Ywmfg0pIKIRCcGMgsqLL09v0cxj2n6K9k1HWg
 fIuOxK/V7Bbne4Xu3b1C/yhxgA==
X-Google-Smtp-Source: ABdhPJyNzHATEC8dTuxFUFwDmfDzPV0676+iaT56j2ywiTDUteFdiwPgkdyO690XmVXalsZNHW+2bg==
X-Received: by 2002:a5d:6588:: with SMTP id q8mr1091823wru.294.1611456790038; 
 Sat, 23 Jan 2021 18:53:10 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id u17sm16189542wmj.35.2021.01.23.18.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:53:09 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [RFC PATCH 2/4] hw/intc: add helper function to determine gicv3
 redistributor size
Date: Sun, 24 Jan 2021 02:53:04 +0000
Message-Id: <20210124025306.3949-3-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210124025306.3949-1-leif@nuviainc.com>
References: <20210124025306.3949-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GICv3 sets aside 128K for each redistributor block, whereas GICv4 sets
aside 256K. To enable use of the gicv3 model for gicv4, abstract this
away as the helper function gicv3_redist_size() and replace the current
hardcoded locations with calls to this function.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 hw/intc/arm_gicv3_common.c         |  2 +-
 hw/intc/arm_gicv3_redist.c         | 13 +++++++++----
 include/hw/intc/arm_gicv3_common.h |  3 +++
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 7365d24873..a8510b39a1 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -299,7 +299,7 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 
         memory_region_init_io(&s->iomem_redist[i], OBJECT(s),
                               ops ? &ops[1] : NULL, s, name,
-                              s->redist_region_count[i] * GICV3_REDIST_SIZE);
+                              s->redist_region_count[i] * gicv3_redist_size(s));
         sysbus_init_mmio(sbd, &s->iomem_redist[i]);
         g_free(name);
     }
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 8645220d61..544f4d82ff 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -14,6 +14,11 @@
 #include "trace.h"
 #include "gicv3_internal.h"
 
+int gicv3_redist_size(GICv3State *s)
+{
+    return (s->revision == 3 ? GICV3_REDIST_SIZE : GICV4_REDIST_SIZE);
+}
+
 static uint32_t mask_group(GICv3CPUState *cs, MemTxAttrs attrs)
 {
     /* Return a 32-bit mask which should be applied for this set of 32
@@ -429,8 +434,8 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
      * want to allow splitting of redistributor pages into several
      * blocks so we can support more CPUs.
      */
-    cpuidx = offset / 0x20000;
-    offset %= 0x20000;
+    cpuidx = offset / gicv3_redist_size(s);
+    offset %= gicv3_redist_size(s);
     assert(cpuidx < s->num_cpu);
 
     cs = &s->cpu[cpuidx];
@@ -486,8 +491,8 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
      * want to allow splitting of redistributor pages into several
      * blocks so we can support more CPUs.
      */
-    cpuidx = offset / 0x20000;
-    offset %= 0x20000;
+    cpuidx = offset / gicv3_redist_size(s);
+    offset %= gicv3_redist_size(s);
     assert(cpuidx < s->num_cpu);
 
     cs = &s->cpu[cpuidx];
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 91491a2f66..ab88d14867 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -37,6 +37,7 @@
 #define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)
 
 #define GICV3_REDIST_SIZE 0x20000
+#define GICV4_REDIST_SIZE (GICV3_REDIST_SIZE + 0x20000)
 
 /* Number of SGI target-list bits */
 #define GICV3_TARGETLIST_BITS 16
@@ -295,4 +296,6 @@ struct ARMGICv3CommonClass {
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
                               const MemoryRegionOps *ops, Error **errp);
 
+int gicv3_redist_size(GICv3State *s);
+
 #endif
-- 
2.20.1


