Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944A8409918
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:29:28 +0200 (CEST)
Received: from localhost ([::1]:36952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPoph-0002V3-Vf
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYr-00012t-D3
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:02 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYo-0008Bv-Cy
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:00 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w29so14783664wra.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sfxsKCUZyyxMMR541WiYb6hWKyYJy4Gknw3RAa8OGtg=;
 b=NXrH3u4u5u+SIX2aflYi4BhXskv+q6M3GT76dLCm0ZYxbbtq4PqDBlkLaDA+DvHB/q
 1M78FQnlhNjEgpNO6hKmYEXLZ01m1e+sHdGLAh/aRLU53AgKVhOe+/KrzfsdRAMzl7Hf
 409c3pe8aofKTfrhl67s85B7QKxpqqzk0K+8NCamk4DoYSit+dWUfBn7x+yJa19W0x0D
 XN1HaQq/xkP7urK51xEuYdii4tpqhcLWqCdTnPcu9uNfJmAHrt8L4ysFnyvPDnDp4kfo
 TJGiaE0NtcwkvIs595UM45cxqs2bYKw7LLyckx3ReeV+VcX9Mi3RIxdlCpSPwMJ+47Nq
 w0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sfxsKCUZyyxMMR541WiYb6hWKyYJy4Gknw3RAa8OGtg=;
 b=TX3y6pw1HjVyyfmRUdQyqNRIIOwfnguQoa0UcxtzES92S+lH/AC+3sTOdnYcSKFGDu
 txUXonKzgfA5Nk8hmUudbVfT/jrv5AOq0qYJhXkCxOYpv36yrnuewFC7FN7XXvf7AD+j
 f+fzNZO9TShKdCu5+tvqy5jTDSLMNLIRXZ+qZ0TYmZSPTWb4Z0kzz/eYumn7e/EyIgM3
 KeQxf64M4/eGVD5yErPOaqgP+VIGOcV5yhjfqxV4iHef8kz//2SU+eTniM3rMEJIXSv2
 cag4tmVpADc/bQexn7XBF0borI9fMHmoqTY1MU7zyIAXYz1rIOzXTgp3ZBzYe79EUUco
 Y/Pw==
X-Gm-Message-State: AOAM5339Aufn8Y+WduCecQ+Alu2W1biulrbyMdX/4LrjzJCEd1CX/APi
 sEqLcQhUs9Z9S0nONQ9a+SZ5gEtRAImDjQ==
X-Google-Smtp-Source: ABdhPJw1AAVShCmLgcPZ4raf+hoVdBBrKmwuedMYa9z/j3zwc9Gg/j4/w8LN/zo/BrvYl0gOHVAPKA==
X-Received: by 2002:a05:6000:374:: with SMTP id
 f20mr13590993wrf.129.1631549517141; 
 Mon, 13 Sep 2021 09:11:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.11.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:11:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/23] hw/intc: GICv3 ITS Feature enablement
Date: Mon, 13 Sep 2021 17:11:34 +0100
Message-Id: <20210913161144.12347-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Added properties to enable ITS feature and define qemu system
address space memory in gicv3 common,setup distributor and
redistributor registers to indicate LPI support.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Message-id: 20210910143951.92242-6-shashi.mallela@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h           |  2 ++
 include/hw/intc/arm_gicv3_common.h |  1 +
 hw/intc/arm_gicv3_common.c         | 12 ++++++++++++
 hw/intc/arm_gicv3_dist.c           |  5 ++++-
 hw/intc/arm_gicv3_redist.c         | 12 +++++++++---
 5 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 19664447902..530d1c17897 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -68,6 +68,8 @@
 #define GICD_CTLR_E1NWF             (1U << 7)
 #define GICD_CTLR_RWP               (1U << 31)
 
+#define GICD_TYPER_LPIS_SHIFT          17
+
 /* 16 bits EventId */
 #define GICD_TYPER_IDBITS            0xf
 
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 0715b0bc2a7..c1348cc60a1 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -221,6 +221,7 @@ struct GICv3State {
     uint32_t num_cpu;
     uint32_t num_irq;
     uint32_t revision;
+    bool lpi_enable;
     bool security_extn;
     bool irq_reset_nonsecure;
     bool gicd_no_migration_shift_bug;
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 58ef65f589e..53dea2a7756 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -345,6 +345,11 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->lpi_enable && !s->dma) {
+        error_setg(errp, "Redist-ITS: Guest 'sysmem' reference link not set");
+        return;
+    }
+
     s->cpu = g_new0(GICv3CPUState, s->num_cpu);
 
     for (i = 0; i < s->num_cpu; i++) {
@@ -381,6 +386,10 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
             (1 << 24) |
             (i << 8) |
             (last << 4);
+
+        if (s->lpi_enable) {
+            s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
+        }
     }
 }
 
@@ -494,9 +503,12 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", GICv3State, num_cpu, 1),
     DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
+    DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
     DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
                       redist_region_count, qdev_prop_uint32, uint32_t),
+    DEFINE_PROP_LINK("sysmem", GICv3State, dma, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 5beb7c4235a..4164500ea96 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -384,7 +384,9 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
          * A3V == 1 (non-zero values of Affinity level 3 supported)
          * IDbits == 0xf (we support 16-bit interrupt identifiers)
          * DVIS == 0 (Direct virtual LPI injection not supported)
-         * LPIS == 0 (LPIs not supported)
+         * LPIS == 1 (LPIs are supported if affinity routing is enabled)
+         * num_LPIs == 0b00000 (bits [15:11],Number of LPIs as indicated
+         *                      by GICD_TYPER.IDbits)
          * MBIS == 0 (message-based SPIs not supported)
          * SecurityExtn == 1 if security extns supported
          * CPUNumber == 0 since for us ARE is always 1
@@ -399,6 +401,7 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
         bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
 
         *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
+            (s->lpi_enable << GICD_TYPER_LPIS_SHIFT) |
             (0xf << 19) | itlinesnumber;
         return true;
     }
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 53da703ed84..2108abfe9c3 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -248,10 +248,16 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
     case GICR_CTLR:
         /* For our implementation, GICR_TYPER.DPGS is 0 and so all
          * the DPG bits are RAZ/WI. We don't do anything asynchronously,
-         * so UWP and RWP are RAZ/WI. And GICR_TYPER.LPIS is 0 (we don't
-         * implement LPIs) so Enable_LPIs is RES0. So there are no writable
-         * bits for us.
+         * so UWP and RWP are RAZ/WI. GICR_TYPER.LPIS is 1 (we
+         * implement LPIs) so Enable_LPIs is programmable.
          */
+        if (cs->gicr_typer & GICR_TYPER_PLPIS) {
+            if (value & GICR_CTLR_ENABLE_LPIS) {
+                cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
+            } else {
+                cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
+            }
+        }
         return MEMTX_OK;
     case GICR_STATUSR:
         /* RAZ/WI for our implementation */
-- 
2.20.1


