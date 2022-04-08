Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325CA4F984E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:39:41 +0200 (CEST)
Received: from localhost ([::1]:47618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpm0-0002ST-8k
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPN-0006yt-On
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:18 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPL-0002LU-Ke
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:17 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 v20-20020a05600c15d400b0038e9a88aee7so2493684wmf.3
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4X5gt1qh1B1TGFcyO7ZbfSY/eEx5BCkyPS7Ts12JMq0=;
 b=jOXXMYgPL3yhnk1Vp7xvzHHBDDF34JuRGXI4WS2VmoIoyK+qeJqKxfp1oeNSDyOiev
 oJSn9Wq6jW3etOPvTK/K5x5K3KyLryPaUmjF0UbFzyaJcDEbWeeoItCAvrNJbJJv6797
 xeU7eh7Eoek6zESCgxBaa4gV5oNVQDR+VZd6D096YcMnngrOU3le3y1xBOXIZDpmuzRc
 nS4+LKIaYcp6K5yZJ6DZMFHG+ZH18IjTru+cX5wZA0oRkzQCODFrDT9SelUszlOeVGpT
 knq71e2GN3wl/xykeY34/6DYOpSeKSmo6GqDIlkzYtgXNWJxGPZTBV3UG16bBro+s0/e
 59hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4X5gt1qh1B1TGFcyO7ZbfSY/eEx5BCkyPS7Ts12JMq0=;
 b=DqXXQ+DtwaZ+5fgIPOTRFBmFVUiQ4jGKJAloZl8DkT0S3FiYjPpnCRxmtjz6euD1pe
 A2I7Dn70PPK9q/7GN4PkS+PJs+lHGKbuQBSoVJIwCEcQ0HGOaHTqPT2zrn8dOeoAKRZq
 hRXV42u00xVL7ESylQIJ4VfRcreicRVBXtKfFN12108iTlK1zWTT+46u89m9d7TH38q0
 kTJ77cnLV6xuVs/6aDRKBE4e+olzwy1P0icGjKaEpzPE1yjA7ko/vHfifgHFo1noMvhI
 0aPL2TLw6z3KL74633G06f6DlNjuAlHYkGL43TD5d1Zq28+aRjl7lLMiy/+HauBfBr2t
 7arQ==
X-Gm-Message-State: AOAM533m93vQK3kS0RbuEnrSN4tQxthfDMsW4mMnA6lvG9nGhrCQ98Bz
 AxphRT0juBXYWETS0iWzsQORqA==
X-Google-Smtp-Source: ABdhPJziRfzfzWKDKZSFkkIwGK/4a2Eb8FXD4R+4g97EEg0QgHj2g+ZF3DPGZeQeCVPrNUSQ1Neg/A==
X-Received: by 2002:a1c:f413:0:b0:37b:d1de:5762 with SMTP id
 z19-20020a1cf413000000b0037bd1de5762mr17267965wma.108.1649427374155; 
 Fri, 08 Apr 2022 07:16:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 22/41] hw/intc/arm_gicv3: Implement GICv4's new redistributor
 frame
Date: Fri,  8 Apr 2022 15:15:31 +0100
Message-Id: <20220408141550.1271295-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

The GICv4 extends the redistributor register map -- where GICv3
had two 64KB frames per CPU, GICv4 has four frames. Add support
for the extra frame by using a new gicv3_redist_size() function
in the places in the GIC implementation which currently use
a fixed constant size for the redistributor register block.
(Until we implement the extra registers they will RAZ/WI.)

Any board that wants to use a GICv4 will need to also adjust
to handle the different sized redistributor register block;
that will be done separately.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h           | 21 +++++++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  5 +++++
 hw/intc/arm_gicv3_common.c         |  2 +-
 hw/intc/arm_gicv3_redist.c         |  8 ++++----
 4 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 8d58d38836f..9720ccf7507 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -489,6 +489,27 @@ FIELD(VTE, RDBASE, 42, RDBASE_PROCNUM_LENGTH)
 
 /* Functions internal to the emulated GICv3 */
 
+/**
+ * gicv3_redist_size:
+ * @s: GICv3State
+ *
+ * Return the size of the redistributor register frame in bytes
+ * (which depends on what GIC version this is)
+ */
+static inline int gicv3_redist_size(GICv3State *s)
+{
+    /*
+     * Redistributor size is controlled by the redistributor GICR_TYPER.VLPIS.
+     * It's the same for every redistributor in the GIC, so arbitrarily
+     * use the register field in the first one.
+     */
+    if (s->cpu[0].gicr_typer & GICR_TYPER_VLPIS) {
+        return GICV4_REDIST_SIZE;
+    } else {
+        return GICV3_REDIST_SIZE;
+    }
+}
+
 /**
  * gicv3_intid_is_special:
  * @intid: interrupt ID
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 08b27789385..40bc404a652 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -38,7 +38,12 @@
 
 #define GICV3_LPI_INTID_START 8192
 
+/*
+ * The redistributor in GICv3 has two 64KB frames per CPU; in
+ * GICv4 it has four 64KB frames per CPU.
+ */
 #define GICV3_REDIST_SIZE 0x20000
+#define GICV4_REDIST_SIZE 0x40000
 
 /* Number of SGI target-list bits */
 #define GICV3_TARGETLIST_BITS 16
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index dcc5ce28c6a..18999e3c8bb 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -295,7 +295,7 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 
         memory_region_init_io(&region->iomem, OBJECT(s),
                               ops ? &ops[1] : NULL, region, name,
-                              s->redist_region_count[i] * GICV3_REDIST_SIZE);
+                              s->redist_region_count[i] * gicv3_redist_size(s));
         sysbus_init_mmio(sbd, &region->iomem);
         g_free(name);
     }
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 7c75dd6f072..9f1fe09a78e 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -442,8 +442,8 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
      * in the memory map); if so then the GIC has multiple MemoryRegions
      * for the redistributors.
      */
-    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
-    offset %= GICV3_REDIST_SIZE;
+    cpuidx = region->cpuidx + offset / gicv3_redist_size(s);
+    offset %= gicv3_redist_size(s);
 
     cs = &s->cpu[cpuidx];
 
@@ -501,8 +501,8 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
      * in the memory map); if so then the GIC has multiple MemoryRegions
      * for the redistributors.
      */
-    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
-    offset %= GICV3_REDIST_SIZE;
+    cpuidx = region->cpuidx + offset / gicv3_redist_size(s);
+    offset %= gicv3_redist_size(s);
 
     cs = &s->cpu[cpuidx];
 
-- 
2.25.1


