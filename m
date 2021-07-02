Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612323B9F33
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:42:46 +0200 (CEST)
Received: from localhost ([::1]:32908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGdB-00089r-Ci
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGaw-0004c8-Qi
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:27 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGat-0006Yp-Hk
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:26 -0400
Received: by mail-wr1-x431.google.com with SMTP id j2so11865362wrs.12
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 03:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyVR+RM9P0Fu8J9agxc+syCsAuN2LmIMWIgCF4vgRTg=;
 b=sdDsSJM3o8ByLAVGX+u7ux2gd3O5MnBkU/Qg9bXeucpPywXtLQNnMQIdOvJ3A0ecaI
 e5TSBB8re+kwEPdCH9hpzoGBiOigGy0L1mJAqpAxs51kk1IYu05ZXijTjBThmOq9NQqj
 PHPjivs9jOyikzNJAh16ui3KOwaNTu3LQrv+Q5c1UMwvSPtI6iJcQw3SlATAiqOELG0Q
 PLKu3KhuoYmdnNErCnF4qdkgqH85mpuY+NI/UNd01kOkM+i8ChiWbq0oV2xPfW/lE4B1
 5lohes8Or1THXOgHK0+Od3aaiNGvISi0YUQLp6pAWp55/lxNWnol/2o1oN5U/BrRFxar
 N4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyVR+RM9P0Fu8J9agxc+syCsAuN2LmIMWIgCF4vgRTg=;
 b=OFvfaXKqxTOqt4fo3vRIqZnseICg/kvW86qcmsN/k1SLSEbMVkcx9zh5joHfChPOSJ
 +jTTw+LDKapVqDlp3OG6uMUbu4c5zaPAAKf/66CftoNc9n3L0eldaa0/bYIeF6HYyu+T
 bw0aqJOGlZ3s1R3iqEAgta6BvXwcgb6DOxeLfbfg4UXKBEDBfdF89cNbFNHa+HRVHbGC
 hE1gVovxDBYNt/iPRKGvtt4ggYGCUBU9qz8MNgqEtWFZs9uWcwqZheCApoL7fvjmtq/Y
 ayKwrHYfHArm4KtBlnOd8pwli1FAjKe0BSif7pgst1ZflAS1sjGG0CERXl97pAtMQlic
 8z0Q==
X-Gm-Message-State: AOAM533+YCj8e97peb86LGPUsULK5/mM9bob4p8vyFFhlA4+heWPhuDr
 0j1CRcrDjaA1YWP9F7RbV8o9LA==
X-Google-Smtp-Source: ABdhPJw0BPQrnNs8gAxKbHD2/X6aczSpVFj1v0Zdpre1k9KiKDPAJFbQa99ZUDHhivKZcxMtlgYO+Q==
X-Received: by 2002:a5d:6742:: with SMTP id l2mr4983888wrw.202.1625222422232; 
 Fri, 02 Jul 2021 03:40:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/11] hw/gpio/pl061: Convert DPRINTF to tracepoints
Date: Fri,  2 Jul 2021 11:40:09 +0100
Message-Id: <20210702104018.19881-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the use of the DPRINTF debug macro in the PL061 model to
use tracepoints.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/pl061.c      | 27 +++++++++------------------
 hw/gpio/trace-events |  6 ++++++
 2 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index e72e77572a0..a6ace88895d 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -15,19 +15,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qom/object.h"
-
-//#define DEBUG_PL061 1
-
-#ifdef DEBUG_PL061
-#define DPRINTF(fmt, ...) \
-do { printf("pl061: " fmt , ## __VA_ARGS__); } while (0)
-#define BADF(fmt, ...) \
-do { fprintf(stderr, "pl061: error: " fmt , ## __VA_ARGS__); exit(1);} while (0)
-#else
-#define DPRINTF(fmt, ...) do {} while(0)
-#define BADF(fmt, ...) \
-do { fprintf(stderr, "pl061: error: " fmt , ## __VA_ARGS__);} while (0)
-#endif
+#include "trace.h"
 
 static const uint8_t pl061_id[12] =
   { 0x00, 0x00, 0x00, 0x00, 0x61, 0x10, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
@@ -107,7 +95,7 @@ static void pl061_update(PL061State *s)
     uint8_t out;
     int i;
 
-    DPRINTF("dir = %d, data = %d\n", s->dir, s->data);
+    trace_pl061_update(DEVICE(s)->canonical_path, s->dir, s->data);
 
     /* Outputs float high.  */
     /* FIXME: This is board dependent.  */
@@ -118,8 +106,9 @@ static void pl061_update(PL061State *s)
         for (i = 0; i < N_GPIOS; i++) {
             mask = 1 << i;
             if (changed & mask) {
-                DPRINTF("Set output %d = %d\n", i, (out & mask) != 0);
-                qemu_set_irq(s->out[i], (out & mask) != 0);
+                int level = (out & mask) != 0;
+                trace_pl061_set_output(DEVICE(s)->canonical_path, i, level);
+                qemu_set_irq(s->out[i], level);
             }
         }
     }
@@ -131,7 +120,8 @@ static void pl061_update(PL061State *s)
         for (i = 0; i < N_GPIOS; i++) {
             mask = 1 << i;
             if (changed & mask) {
-                DPRINTF("Changed input %d = %d\n", i, (s->data & mask) != 0);
+                trace_pl061_input_change(DEVICE(s)->canonical_path, i,
+                                         (s->data & mask) != 0);
 
                 if (!(s->isense & mask)) {
                     /* Edge interrupt */
@@ -150,7 +140,8 @@ static void pl061_update(PL061State *s)
     /* Level interrupt */
     s->istate |= ~(s->data ^ s->iev) & s->isense;
 
-    DPRINTF("istate = %02X\n", s->istate);
+    trace_pl061_update_istate(DEVICE(s)->canonical_path,
+                              s->istate, s->im, (s->istate & s->im) != 0);
 
     qemu_set_irq(s->irq, (s->istate & s->im) != 0);
 }
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index f0b664158e2..48ccbb183cc 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -13,6 +13,12 @@ nrf51_gpio_write(uint64_t offset, uint64_t value) "offset 0x%" PRIx64 " value 0x
 nrf51_gpio_set(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
 nrf51_gpio_update_output_irq(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
 
+# pl061.c
+pl061_update(const char *id, uint32_t dir, uint32_t data) "%s GPIODIR 0x%x GPIODATA 0x%x"
+pl061_set_output(const char *id, int gpio, int level) "%s setting output %d to %d"
+pl061_input_change(const char *id, int gpio, int level) "%s input %d changed to %d"
+pl061_update_istate(const char *id, uint32_t istate, uint32_t im, int level) "%s GPIORIS 0x%x GPIOIE 0x%x interrupt level %d"
+
 # sifive_gpio.c
 sifive_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" PRIx64
 sifive_gpio_write(uint64_t offset, uint64_t value) "offset 0x%" PRIx64 " value 0x%" PRIx64
-- 
2.20.1


