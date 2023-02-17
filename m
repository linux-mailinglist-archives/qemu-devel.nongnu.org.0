Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFDC69ADC9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 15:20:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT1Zt-00050U-8d; Fri, 17 Feb 2023 09:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT1Ze-0004kj-7B
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:18:56 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT1ZZ-0005Wp-4M
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:18:53 -0500
Received: by mail-wr1-x435.google.com with SMTP id bw20so1333577wrb.12
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 06:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DCCPE7r2euKSyBUC8DVFJ0uB3bn50uLLJ1J1YYpZfwY=;
 b=jgGdMQ0Kq7t1U5JJ7sdZVGI8/iKScCD72zBl7YXlmXFbFx1xcpGqiuwWTfqU9nIeP0
 8dq3vHW8xSSk4r3oNiIOZ4JcGFFVxkQBG+EAgi8IlpYeiH/cjljN7JpVTu4c6OG/0oza
 dyeEeCYnjV53Ggv+xtGqwDOztQXIRgC4b9H0uoq1p//D8lohqv3Q129e8Pk65UYlyAMc
 tMb3O+f9PDAdGBy0liqrUA5ebSU1SUPgp48yzVxZI6ORXuttM09jpAzuwSxxw5h6nAFv
 evfFXT6WG9sJDaIQhfHDAVnYfHy2q8OTWzfWDdqYiyxQu2g/I6FHT0+psI5gQDL6GF9g
 ZWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DCCPE7r2euKSyBUC8DVFJ0uB3bn50uLLJ1J1YYpZfwY=;
 b=oG/m4uOmlDjOdsE7mFWvyPp7RNgwMNTwNmrHp5btmTuJs85si1KUnRktm2rRkoqzoo
 0DPIPBvJ0eso/7BlmUUmGd1uy4odgPt41dYSMvvn6HzSUnwgCFwy41um8TR34ptWZ3XL
 BlYRlwBTjjXB/8jqfGV7y+VnMdSREJEn/VtODKuTkQHBD0radhAJdHzdCl7ecLIXUHjB
 6b73FBSqaPTDubQtzBRw4nh+e4kdsrQA4HEBqDrW25NE0h84aCeWOknYUno8ghgIasDe
 25dYuNqjXgkYcj21f2/ZVKTluCxJqH9KBtXDinvIhdFcAguDhzK27DB9SahZlY60mlGl
 j9ig==
X-Gm-Message-State: AO0yUKWldh+YjPEFclvQUUaSp349K5ChU2LGdSzqqdzaQAP4BIwbcFPD
 KxbD00WXjGVJF48+bt7ZuICHUsDEpzvOAwA8
X-Google-Smtp-Source: AK7set9LRHZWuM8QPIZoPm0d2fHJZY9qnGlptflA6W5CKm7hSyibgCK1bxTRsF7SSa6rRkCj3LJNbg==
X-Received: by 2002:a5d:4bc5:0:b0:2c5:579e:1a2c with SMTP id
 l5-20020a5d4bc5000000b002c5579e1a2cmr7306724wrt.48.1676643526724; 
 Fri, 17 Feb 2023 06:18:46 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f2-20020adffcc2000000b002c5691f13eesm4511725wrs.50.2023.02.17.06.18.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Feb 2023 06:18:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vikram Garhwal <vikram.garhwal@amd.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Jason Wang <jasowang@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antony Pavlov <antonynpavlov@gmail.com>
Subject: [PATCH 2/2] hw/timer: Reduce 'hw/ptimer.h' inclusion
Date: Fri, 17 Feb 2023 15:18:32 +0100
Message-Id: <20230217141832.24777-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230217141832.24777-1-philmd@linaro.org>
References: <20230217141832.24777-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"hw/ptimer.h" API is mostly used by timer / watchdog device
models. Since the SoC / machines only access the ptimer via
reference, they don't need its definition: the declartion is
enough.

On order to reduce the inclusion on the source files,
forward-declare 'ptimer_state' in "qemu/typedefs.h".
Use the typedef in few place instead of the structure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
"30 files changed"... but since this is trivial, there is
no point in splitting per subsystem IMO.
---
 hw/display/xlnx_dp.c                     | 1 +
 hw/net/can/xlnx-zynqmp-can.c             | 1 +
 hw/net/fsl_etsec/etsec.h                 | 3 +--
 hw/timer/allwinner-a10-pit.c             | 1 +
 hw/timer/arm_mptimer.c                   | 4 ++--
 hw/timer/armv7m_systick.c                | 1 +
 hw/timer/cmsdk-apb-dualtimer.c           | 1 +
 hw/timer/cmsdk-apb-timer.c               | 1 +
 hw/timer/grlib_gptimer.c                 | 2 +-
 hw/timer/imx_epit.c                      | 1 +
 hw/timer/imx_gpt.c                       | 1 +
 hw/timer/mss-timer.c                     | 1 +
 hw/watchdog/cmsdk-apb-watchdog.c         | 1 +
 hw/watchdog/wdt_imx2.c                   | 1 +
 include/hw/display/xlnx_dp.h             | 1 -
 include/hw/dma/xlnx_csu_dma.h            | 1 -
 include/hw/net/xlnx-zynqmp-can.h         | 1 -
 include/hw/ptimer.h                      | 1 -
 include/hw/timer/allwinner-a10-pit.h     | 1 -
 include/hw/timer/arm_mptimer.h           | 2 +-
 include/hw/timer/armv7m_systick.h        | 1 -
 include/hw/timer/cmsdk-apb-dualtimer.h   | 3 +--
 include/hw/timer/cmsdk-apb-timer.h       | 3 +--
 include/hw/timer/digic-timer.h           | 1 -
 include/hw/timer/imx_epit.h              | 1 -
 include/hw/timer/imx_gpt.h               | 1 -
 include/hw/timer/mss-timer.h             | 1 -
 include/hw/watchdog/cmsdk-apb-watchdog.h | 3 +--
 include/hw/watchdog/wdt_imx2.h           | 5 ++---
 include/qemu/typedefs.h                  | 1 +
 30 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index b0828d65aa..d3e7696134 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -29,6 +29,7 @@
 #include "qemu/module.h"
 #include "hw/display/xlnx_dp.h"
 #include "hw/irq.h"
+#include "hw/ptimer.h"
 #include "migration/vmstate.h"
 
 #ifndef DEBUG_DP
diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
index e93e6c5e19..28b9db78d4 100644
--- a/hw/net/can/xlnx-zynqmp-can.c
+++ b/hw/net/can/xlnx-zynqmp-can.c
@@ -33,6 +33,7 @@
 #include "hw/sysbus.h"
 #include "hw/register.h"
 #include "hw/irq.h"
+#include "hw/ptimer.h"
 #include "qapi/error.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
diff --git a/hw/net/fsl_etsec/etsec.h b/hw/net/fsl_etsec/etsec.h
index 3c625c955c..9321a2f9a0 100644
--- a/hw/net/fsl_etsec/etsec.h
+++ b/hw/net/fsl_etsec/etsec.h
@@ -27,7 +27,6 @@
 
 #include "hw/sysbus.h"
 #include "net/net.h"
-#include "hw/ptimer.h"
 #include "qom/object.h"
 
 /* Buffer Descriptors */
@@ -142,7 +141,7 @@ struct eTSEC {
     uint16_t phy_control;
 
     /* Polling */
-    struct ptimer_state *ptimer;
+    ptimer_state *ptimer;
 
     /* Whether we should flush the rx queue when buffer becomes available. */
     bool need_flush;
diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
index 971f78462a..7cce098508 100644
--- a/hw/timer/allwinner-a10-pit.c
+++ b/hw/timer/allwinner-a10-pit.c
@@ -17,6 +17,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/irq.h"
+#include "hw/ptimer.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "hw/timer/allwinner-a10-pit.h"
diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index cdfca3000b..104c3d8af8 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -65,7 +65,7 @@ static inline uint32_t timerblock_scale(uint32_t control)
 }
 
 /* Must be called within a ptimer transaction block */
-static inline void timerblock_set_count(struct ptimer_state *timer,
+static inline void timerblock_set_count(ptimer_state *timer,
                                         uint32_t control, uint64_t *count)
 {
     /* PTimer would trigger interrupt for periodic timer when counter set
@@ -78,7 +78,7 @@ static inline void timerblock_set_count(struct ptimer_state *timer,
 }
 
 /* Must be called within a ptimer transaction block */
-static inline void timerblock_run(struct ptimer_state *timer,
+static inline void timerblock_run(ptimer_state *timer,
                                   uint32_t control, uint32_t load)
 {
     if ((control & 1) && ((control & 0xff00) || load != 0)) {
diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 5dfe39afe3..36fba84f15 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -13,6 +13,7 @@
 #include "hw/timer/armv7m_systick.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
+#include "hw/ptimer.h"
 #include "hw/sysbus.h"
 #include "hw/qdev-clock.h"
 #include "qemu/timer.h"
diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
index d4a509c798..c967988035 100644
--- a/hw/timer/cmsdk-apb-dualtimer.c
+++ b/hw/timer/cmsdk-apb-dualtimer.c
@@ -23,6 +23,7 @@
 #include "qemu/module.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
+#include "hw/ptimer.h"
 #include "hw/qdev-properties.h"
 #include "hw/registerfields.h"
 #include "hw/qdev-clock.h"
diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index 68aa1a7636..cce9135eb1 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -34,6 +34,7 @@
 #include "trace.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
+#include "hw/ptimer.h"
 #include "hw/registerfields.h"
 #include "hw/qdev-clock.h"
 #include "hw/timer/cmsdk-apb-timer.h"
diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index 5c4923c1e0..8347e3047f 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -61,7 +61,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(GPTimerUnit, GRLIB_GPTIMER)
 typedef struct GPTimer     GPTimer;
 
 struct GPTimer {
-    struct ptimer_state *ptimer;
+    ptimer_state *ptimer;
 
     qemu_irq     irq;
     int          id;
diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 3a869782bc..6fab1be5cf 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -17,6 +17,7 @@
 #include "hw/timer/imx_epit.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
+#include "hw/ptimer.h"
 #include "hw/misc/imx_ccm.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 7222b1b387..ab2e13d3a0 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -14,6 +14,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/irq.h"
+#include "hw/ptimer.h"
 #include "hw/timer/imx_gpt.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
index ee7438f168..18174d0b8d 100644
--- a/hw/timer/mss-timer.c
+++ b/hw/timer/mss-timer.c
@@ -27,6 +27,7 @@
 #include "qemu/module.h"
 #include "qemu/log.h"
 #include "hw/irq.h"
+#include "hw/ptimer.h"
 #include "hw/qdev-properties.h"
 #include "hw/timer/mss-timer.h"
 #include "migration/vmstate.h"
diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
index 5a2cd46eb7..e30da55101 100644
--- a/hw/watchdog/cmsdk-apb-watchdog.c
+++ b/hw/watchdog/cmsdk-apb-watchdog.c
@@ -28,6 +28,7 @@
 #include "sysemu/watchdog.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
+#include "hw/ptimer.h"
 #include "hw/qdev-properties.h"
 #include "hw/registerfields.h"
 #include "hw/qdev-clock.h"
diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
index e776a2fbd4..316a959beb 100644
--- a/hw/watchdog/wdt_imx2.c
+++ b/hw/watchdog/wdt_imx2.c
@@ -15,6 +15,7 @@
 #include "sysemu/watchdog.h"
 #include "migration/vmstate.h"
 #include "hw/qdev-properties.h"
+#include "hw/ptimer.h"
 
 #include "hw/watchdog/wdt_imx2.h"
 
diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
index e86a87f235..f859da66f9 100644
--- a/include/hw/display/xlnx_dp.h
+++ b/include/hw/display/xlnx_dp.h
@@ -35,7 +35,6 @@
 #include "hw/dma/xlnx_dpdma.h"
 #include "audio/audio.h"
 #include "qom/object.h"
-#include "hw/ptimer.h"
 
 #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
 #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 922ab80eb6..2b3a52c58b 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -23,7 +23,6 @@
 
 #include "hw/sysbus.h"
 #include "hw/register.h"
-#include "hw/ptimer.h"
 #include "hw/stream.h"
 
 #define TYPE_XLNX_CSU_DMA "xlnx.csu_dma"
diff --git a/include/hw/net/xlnx-zynqmp-can.h b/include/hw/net/xlnx-zynqmp-can.h
index fd2aa77760..2cacaf6181 100644
--- a/include/hw/net/xlnx-zynqmp-can.h
+++ b/include/hw/net/xlnx-zynqmp-can.h
@@ -35,7 +35,6 @@
 #include "net/can_emu.h"
 #include "net/can_host.h"
 #include "qemu/fifo32.h"
-#include "hw/ptimer.h"
 #include "hw/qdev-clock.h"
 
 #define TYPE_XLNX_ZYNQMP_CAN "xlnx.zynqmp-can"
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 4dc02b0de4..30b7eac7ad 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -94,7 +94,6 @@
 #define PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT (1 << 5)
 
 /* ptimer.c */
-typedef struct ptimer_state ptimer_state;
 typedef void (*ptimer_cb)(void *opaque);
 
 /**
diff --git a/include/hw/timer/allwinner-a10-pit.h b/include/hw/timer/allwinner-a10-pit.h
index 8435758ad6..31054b231c 100644
--- a/include/hw/timer/allwinner-a10-pit.h
+++ b/include/hw/timer/allwinner-a10-pit.h
@@ -1,7 +1,6 @@
 #ifndef ALLWINNER_A10_PIT_H
 #define ALLWINNER_A10_PIT_H
 
-#include "hw/ptimer.h"
 #include "hw/sysbus.h"
 #include "qom/object.h"
 
diff --git a/include/hw/timer/arm_mptimer.h b/include/hw/timer/arm_mptimer.h
index 65a96e2a0d..339cb9fe4b 100644
--- a/include/hw/timer/arm_mptimer.h
+++ b/include/hw/timer/arm_mptimer.h
@@ -30,7 +30,7 @@
 typedef struct {
     uint32_t control;
     uint32_t status;
-    struct ptimer_state *timer;
+    ptimer_state *timer;
     qemu_irq irq;
     MemoryRegion iomem;
 } TimerBlock;
diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
index ee09b13881..deb1d66a51 100644
--- a/include/hw/timer/armv7m_systick.h
+++ b/include/hw/timer/armv7m_systick.h
@@ -14,7 +14,6 @@
 
 #include "hw/sysbus.h"
 #include "qom/object.h"
-#include "hw/ptimer.h"
 #include "hw/clock.h"
 
 #define TYPE_SYSTICK "armv7m_systick"
diff --git a/include/hw/timer/cmsdk-apb-dualtimer.h b/include/hw/timer/cmsdk-apb-dualtimer.h
index f3ec86c00b..5d8450eda1 100644
--- a/include/hw/timer/cmsdk-apb-dualtimer.h
+++ b/include/hw/timer/cmsdk-apb-dualtimer.h
@@ -27,7 +27,6 @@
 #define CMSDK_APB_DUALTIMER_H
 
 #include "hw/sysbus.h"
-#include "hw/ptimer.h"
 #include "hw/clock.h"
 #include "qom/object.h"
 
@@ -38,7 +37,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBDualTimer, CMSDK_APB_DUALTIMER)
 /* One of the two identical timer modules in the dual-timer module */
 typedef struct CMSDKAPBDualTimerModule {
     CMSDKAPBDualTimer *parent;
-    struct ptimer_state *timer;
+    ptimer_state *timer;
     qemu_irq timerint;
     /*
      * We must track the guest LOAD and VALUE register state by hand
diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index c4c7eae849..b61e254d4d 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -14,7 +14,6 @@
 
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
-#include "hw/ptimer.h"
 #include "hw/clock.h"
 #include "qom/object.h"
 
@@ -34,7 +33,7 @@ struct CMSDKAPBTimer {
     /*< public >*/
     MemoryRegion iomem;
     qemu_irq timerint;
-    struct ptimer_state *timer;
+    ptimer_state *timer;
     Clock *pclk;
 
     uint32_t ctrl;
diff --git a/include/hw/timer/digic-timer.h b/include/hw/timer/digic-timer.h
index da82fb4663..6c422a8451 100644
--- a/include/hw/timer/digic-timer.h
+++ b/include/hw/timer/digic-timer.h
@@ -19,7 +19,6 @@
 #define HW_TIMER_DIGIC_TIMER_H
 
 #include "hw/sysbus.h"
-#include "hw/ptimer.h"
 #include "qom/object.h"
 
 #define TYPE_DIGIC_TIMER "digic-timer"
diff --git a/include/hw/timer/imx_epit.h b/include/hw/timer/imx_epit.h
index 79aff0cec2..55f2611f79 100644
--- a/include/hw/timer/imx_epit.h
+++ b/include/hw/timer/imx_epit.h
@@ -30,7 +30,6 @@
 #define IMX_EPIT_H
 
 #include "hw/sysbus.h"
-#include "hw/ptimer.h"
 #include "hw/misc/imx_ccm.h"
 #include "qom/object.h"
 
diff --git a/include/hw/timer/imx_gpt.h b/include/hw/timer/imx_gpt.h
index 5a1230da35..d5743778e0 100644
--- a/include/hw/timer/imx_gpt.h
+++ b/include/hw/timer/imx_gpt.h
@@ -30,7 +30,6 @@
 #define IMX_GPT_H
 
 #include "hw/sysbus.h"
-#include "hw/ptimer.h"
 #include "hw/misc/imx_ccm.h"
 #include "qom/object.h"
 
diff --git a/include/hw/timer/mss-timer.h b/include/hw/timer/mss-timer.h
index da38512904..783cec30e3 100644
--- a/include/hw/timer/mss-timer.h
+++ b/include/hw/timer/mss-timer.h
@@ -26,7 +26,6 @@
 #define HW_MSS_TIMER_H
 
 #include "hw/sysbus.h"
-#include "hw/ptimer.h"
 #include "qom/object.h"
 
 #define TYPE_MSS_TIMER     "mss-timer"
diff --git a/include/hw/watchdog/cmsdk-apb-watchdog.h b/include/hw/watchdog/cmsdk-apb-watchdog.h
index c6b3e78731..d02bfd0dd7 100644
--- a/include/hw/watchdog/cmsdk-apb-watchdog.h
+++ b/include/hw/watchdog/cmsdk-apb-watchdog.h
@@ -32,7 +32,6 @@
 #define CMSDK_APB_WATCHDOG_H
 
 #include "hw/sysbus.h"
-#include "hw/ptimer.h"
 #include "hw/clock.h"
 #include "qom/object.h"
 
@@ -53,7 +52,7 @@ struct CMSDKAPBWatchdog {
     MemoryRegion iomem;
     qemu_irq wdogint;
     bool is_luminary;
-    struct ptimer_state *timer;
+    ptimer_state *timer;
     Clock *wdogclk;
 
     uint32_t control;
diff --git a/include/hw/watchdog/wdt_imx2.h b/include/hw/watchdog/wdt_imx2.h
index 600a552d2e..d4cddac352 100644
--- a/include/hw/watchdog/wdt_imx2.h
+++ b/include/hw/watchdog/wdt_imx2.h
@@ -15,7 +15,6 @@
 #include "qemu/bitops.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
-#include "hw/ptimer.h"
 #include "qom/object.h"
 
 #define TYPE_IMX2_WDT "imx2.wdt"
@@ -71,8 +70,8 @@ struct IMX2WdtState {
     MemoryRegion mmio;
     qemu_irq irq;
 
-    struct ptimer_state *timer;
-    struct ptimer_state *itimer;
+    ptimer_state *timer;
+    ptimer_state *itimer;
 
     bool pretimeout_support;
     bool wicr_locked;
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index df4b55ac65..effcba4bca 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -104,6 +104,7 @@ typedef struct PICCommonState PICCommonState;
 typedef struct PostcopyDiscardState PostcopyDiscardState;
 typedef struct Property Property;
 typedef struct PropertyInfo PropertyInfo;
+typedef struct ptimer_state ptimer_state;
 typedef struct QBool QBool;
 typedef struct QDict QDict;
 typedef struct QEMUBH QEMUBH;
-- 
2.38.1


