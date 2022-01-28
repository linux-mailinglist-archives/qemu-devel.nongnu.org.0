Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEC049FDD1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:16:56 +0100 (CET)
Received: from localhost ([::1]:60274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTvj-0000Bk-H8
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:16:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDD-0002B6-ON
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:58 -0500
Received: from [2a00:1450:4864:20::42b] (port=37870
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD0-0006KU-2o
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:49 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w11so11577980wra.4
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gRZn6FSNPea9FydrN/095+qBdxZM1DTyJ5pjqceoBzc=;
 b=Z0YEnBesj0hNdyQaojj3DysHUHvFC4NYb2cAwyVb3qK8YwdeYkG+O6ACF+QakJJv9e
 G7mCtBMaEBycrBJEiBfPQmgOi3+UyuTpFK9sfk4+cungKiAHxZSc4jMT942oYDwGStXr
 TwFdH0prW5so3u6gcqCIJXiuI8KUDxGA+HuOUIZaStshbI0jV2sMkbsgAfJYHqLS/bof
 qQ17RhRTTIy9jEGQYqNoaIJ/bsDgNf4cuiR39Nx2FH3lPbKNLiQMcf6OC6zvnDkEP9Ec
 mpYrL/yEfBDZOsLH1fS1qWqzA8nCxKj1ZbOTckJ1lVgQ49wSwnl8BDvXrml2yh3oEcCh
 KNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRZn6FSNPea9FydrN/095+qBdxZM1DTyJ5pjqceoBzc=;
 b=RaQjwLBHRmS2TfpiUns721m9uLuuwi3mTrcu+t8FwoaqfsnfR0cDh3Z0tZuxCcAozw
 URgoN0/WmHbM6tUMSaoo6JAWD/ap5emfRgajSmlvFSKJeIUc/kBVf6W7zcpTmyH2NrJI
 MGnSGFlkDPrI9KJzQrcDpAe2aUyT2lKkFboJfnTr/yiptTsH6EUkFeRFFUPBb8m2tUBW
 FCec092RsSrFouQHO/jg9V3wyWLlsNLtAAuJdp7qAgkeM9IpsBIKqL39qHK9gXnsCR6y
 KjLjE6oVzvddOyRbM73pFUSD7oLpUYyEZr6K2MqEqc+8TWn4+gI8qxtM/qj3/Wcr0UKc
 rc8A==
X-Gm-Message-State: AOAM533RvINaiCipO4oas9SBUryN9mPoQfF/Xi4xySHyuEd+FcB2d/v1
 C54qdnJJRCirRAQZtOK/Wsbzg2ytm2uVKg==
X-Google-Smtp-Source: ABdhPJz8Bw5l10bcoT+v1By11ekBHRLdxTSL70Jdr/x+hFe3aqsZZixcecNE+vVgPLeyRxSum7tJzg==
X-Received: by 2002:a5d:6a12:: with SMTP id m18mr7256549wru.528.1643383818003; 
 Fri, 28 Jan 2022 07:30:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/32] rtc: Move RTC function prototypes to their own header
Date: Fri, 28 Jan 2022 15:29:41 +0000
Message-Id: <20220128153009.2467560-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

softmmu/rtc.c defines two public functions: qemu_get_timedate() and
qemu_timedate_diff().  Currently we keep the prototypes for these in
qemu-common.h, but most files don't need them.  Move them to their
own header, a new include/sysemu/rtc.h.

Since the C files using these two functions did not need to include
qemu-common.h for any other reason, we can remove those include lines
when we add the include of the new rtc.h.

The license for the .h file follows that of the softmmu/rtc.c
where both the functions are defined.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu-common.h    |  3 ---
 include/sysemu/rtc.h     | 58 ++++++++++++++++++++++++++++++++++++++++
 hw/arm/omap1.c           |  2 +-
 hw/arm/pxa2xx.c          |  2 +-
 hw/arm/strongarm.c       |  2 +-
 hw/misc/mac_via.c        |  2 +-
 hw/misc/macio/cuda.c     |  2 +-
 hw/misc/macio/pmu.c      |  2 +-
 hw/ppc/spapr_rtc.c       |  2 +-
 hw/rtc/allwinner-rtc.c   |  2 +-
 hw/rtc/aspeed_rtc.c      |  2 +-
 hw/rtc/ds1338.c          |  2 +-
 hw/rtc/exynos4210_rtc.c  |  2 +-
 hw/rtc/goldfish_rtc.c    |  2 +-
 hw/rtc/m41t80.c          |  2 +-
 hw/rtc/m48t59.c          |  2 +-
 hw/rtc/mc146818rtc.c     |  2 +-
 hw/rtc/pl031.c           |  2 +-
 hw/rtc/twl92230.c        |  2 +-
 hw/rtc/xlnx-zynqmp-rtc.c |  2 +-
 hw/s390x/tod-tcg.c       |  2 +-
 hw/scsi/megasas.c        |  2 +-
 net/dump.c               |  2 +-
 softmmu/rtc.c            |  2 +-
 24 files changed, 80 insertions(+), 25 deletions(-)
 create mode 100644 include/sysemu/rtc.h

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 0e7e7bab959..68b2e3bc109 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -26,9 +26,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-void qemu_get_timedate(struct tm *tm, int offset);
-int qemu_timedate_diff(struct tm *tm);
-
 void *qemu_oom_check(void *ptr);
 
 ssize_t qemu_write_full(int fd, const void *buf, size_t count)
diff --git a/include/sysemu/rtc.h b/include/sysemu/rtc.h
new file mode 100644
index 00000000000..159702b45b5
--- /dev/null
+++ b/include/sysemu/rtc.h
@@ -0,0 +1,58 @@
+/*
+ * RTC configuration and clock read
+ *
+ * Copyright (c) 2003-2021 QEMU contributors
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef SYSEMU_RTC_H
+#define SYSEMU_RTC_H
+
+/**
+ * qemu_get_timedate: Get the current RTC time
+ * @tm: struct tm to fill in with RTC time
+ * @offset: offset in seconds to adjust the RTC time by before
+ *          converting to struct tm format.
+ *
+ * This function fills in @tm with the current RTC time, as adjusted
+ * by @offset (for example, if @offset is 3600 then the returned time/date
+ * will be one hour further ahead than the current RTC time).
+ *
+ * The usual use is by RTC device models, which should call this function
+ * to find the time/date value that they should return to the guest
+ * when it reads the RTC registers.
+ *
+ * The behaviour of the clock whose value this function returns will
+ * depend on the -rtc command line option passed by the user.
+ */
+void qemu_get_timedate(struct tm *tm, int offset);
+
+/**
+ * qemu_timedate_diff: Return difference between a struct tm and the RTC
+ * @tm: struct tm containing the date/time to compare against
+ *
+ * Returns the difference in seconds between the RTC clock time
+ * and the date/time specified in @tm. For example, if @tm specifies
+ * a timestamp one hour further ahead than the current RTC time
+ * then this function will return 3600.
+ */
+int qemu_timedate_diff(struct tm *tm);
+
+#endif
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 180d3788f89..9852c2a07ec 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -21,7 +21,6 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "cpu.h"
 #include "exec/address-spaces.h"
 #include "hw/hw.h"
@@ -35,6 +34,7 @@
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
+#include "sysemu/rtc.h"
 #include "qemu/range.h"
 #include "hw/sysbus.h"
 #include "qemu/cutils.h"
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 15a247efae2..a6f938f1152 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
@@ -27,6 +26,7 @@
 #include "chardev/char-fe.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/qtest.h"
+#include "sysemu/rtc.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qom/object.h"
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 939a57dda55..39b8f01ac48 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -28,7 +28,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "cpu.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
@@ -41,6 +40,7 @@
 #include "chardev/char-fe.h"
 #include "chardev/char-serial.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/rtc.h"
 #include "hw/ssi/ssi.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index b378e6b3055..71b74c33721 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -16,7 +16,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "migration/vmstate.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
@@ -30,6 +29,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/rtc.h"
 #include "trace.h"
 #include "qemu/log.h"
 
diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index e917a6a095b..233daf1405f 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "hw/ppc/mac.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
@@ -34,6 +33,7 @@
 #include "qapi/error.h"
 #include "qemu/timer.h"
 #include "sysemu/runstate.h"
+#include "sysemu/rtc.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
index eb39c64694a..76c608ee19d 100644
--- a/hw/misc/macio/pmu.c
+++ b/hw/misc/macio/pmu.c
@@ -29,7 +29,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "hw/ppc/mac.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
@@ -41,6 +40,7 @@
 #include "qapi/error.h"
 #include "qemu/timer.h"
 #include "sysemu/runstate.h"
+#include "sysemu/rtc.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
diff --git a/hw/ppc/spapr_rtc.c b/hw/ppc/spapr_rtc.c
index fba4dfca358..94a5510e4eb 100644
--- a/hw/ppc/spapr_rtc.c
+++ b/hw/ppc/spapr_rtc.c
@@ -26,9 +26,9 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/timer.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/rtc.h"
 #include "hw/ppc/spapr.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
diff --git a/hw/rtc/allwinner-rtc.c b/hw/rtc/allwinner-rtc.c
index 5606a51d5c5..7e493f0e79d 100644
--- a/hw/rtc/allwinner-rtc.c
+++ b/hw/rtc/allwinner-rtc.c
@@ -23,9 +23,9 @@
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
-#include "qemu-common.h"
 #include "hw/qdev-properties.h"
 #include "hw/rtc/allwinner-rtc.h"
+#include "sysemu/rtc.h"
 #include "trace.h"
 
 /* RTC registers */
diff --git a/hw/rtc/aspeed_rtc.c b/hw/rtc/aspeed_rtc.c
index 3ca1183558b..f6da7b666d6 100644
--- a/hw/rtc/aspeed_rtc.c
+++ b/hw/rtc/aspeed_rtc.c
@@ -7,11 +7,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "hw/rtc/aspeed_rtc.h"
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/timer.h"
+#include "sysemu/rtc.h"
 
 #include "trace.h"
 
diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index bc5ce1a9f46..36d8121ddda 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -11,12 +11,12 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "hw/i2c/i2c.h"
 #include "migration/vmstate.h"
 #include "qemu/bcd.h"
 #include "qemu/module.h"
 #include "qom/object.h"
+#include "sysemu/rtc.h"
 
 /* Size of NVRAM including both the user-accessible area and the
  * secondary register area.
diff --git a/hw/rtc/exynos4210_rtc.c b/hw/rtc/exynos4210_rtc.c
index 45c0a951c44..ae67641de66 100644
--- a/hw/rtc/exynos4210_rtc.c
+++ b/hw/rtc/exynos4210_rtc.c
@@ -26,7 +26,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/sysbus.h"
@@ -39,6 +38,7 @@
 
 #include "hw/arm/exynos4210.h"
 #include "qom/object.h"
+#include "sysemu/rtc.h"
 
 #define DEBUG_RTC 0
 
diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
index e07ff0164e0..35e493be312 100644
--- a/hw/rtc/goldfish_rtc.c
+++ b/hw/rtc/goldfish_rtc.c
@@ -20,7 +20,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "hw/rtc/goldfish_rtc.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
@@ -29,6 +28,7 @@
 #include "qemu/bitops.h"
 #include "qemu/timer.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/rtc.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
 
diff --git a/hw/rtc/m41t80.c b/hw/rtc/m41t80.c
index 396d110ba2d..a00971a67e1 100644
--- a/hw/rtc/m41t80.c
+++ b/hw/rtc/m41t80.c
@@ -8,13 +8,13 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "qemu/bcd.h"
 #include "hw/i2c/i2c.h"
 #include "qom/object.h"
+#include "sysemu/rtc.h"
 
 #define TYPE_M41T80 "m41t80"
 OBJECT_DECLARE_SIMPLE_TYPE(M41t80State, M41T80)
diff --git a/hw/rtc/m48t59.c b/hw/rtc/m48t59.c
index 690f4e071a1..74345d9d900 100644
--- a/hw/rtc/m48t59.c
+++ b/hw/rtc/m48t59.c
@@ -24,12 +24,12 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/rtc/m48t59.h"
 #include "qemu/timer.h"
 #include "sysemu/runstate.h"
+#include "sysemu/rtc.h"
 #include "sysemu/sysemu.h"
 #include "hw/sysbus.h"
 #include "qapi/error.h"
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 4fbafddb226..e61a0cced4c 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 #include "qemu/bcd.h"
@@ -36,6 +35,7 @@
 #include "sysemu/replay.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
+#include "sysemu/rtc.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
index e7ced90b025..38d9d3c2f38 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "hw/rtc/pl031.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
@@ -20,6 +19,7 @@
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/rtc.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
diff --git a/hw/rtc/twl92230.c b/hw/rtc/twl92230.c
index 0922df5ad30..e8d5eda3fcf 100644
--- a/hw/rtc/twl92230.c
+++ b/hw/rtc/twl92230.c
@@ -20,13 +20,13 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/timer.h"
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/rtc.h"
 #include "qemu/bcd.h"
 #include "qemu/module.h"
 #include "qom/object.h"
diff --git a/hw/rtc/xlnx-zynqmp-rtc.c b/hw/rtc/xlnx-zynqmp-rtc.c
index 2bcd14d7795..3e7d61a41c1 100644
--- a/hw/rtc/xlnx-zynqmp-rtc.c
+++ b/hw/rtc/xlnx-zynqmp-rtc.c
@@ -25,7 +25,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "hw/sysbus.h"
 #include "hw/register.h"
 #include "qemu/bitops.h"
@@ -34,6 +33,7 @@
 #include "hw/irq.h"
 #include "qemu/cutils.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/rtc.h"
 #include "trace.h"
 #include "hw/rtc/xlnx-zynqmp-rtc.h"
 #include "migration/vmstate.h"
diff --git a/hw/s390x/tod-tcg.c b/hw/s390x/tod-tcg.c
index 9bb94ff72bc..7646b4aa380 100644
--- a/hw/s390x/tod-tcg.c
+++ b/hw/s390x/tod-tcg.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 #include "hw/s390x/tod.h"
 #include "qemu/timer.h"
@@ -17,6 +16,7 @@
 #include "qemu/module.h"
 #include "cpu.h"
 #include "tcg/tcg_s390x.h"
+#include "sysemu/rtc.h"
 
 static void qemu_s390_tod_get(const S390TODState *td, S390TOD *tod,
                               Error **errp)
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index c9da5ce0b57..f638ff8831d 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -19,11 +19,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/dma.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/rtc.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
 #include "qemu/iov.h"
diff --git a/net/dump.c b/net/dump.c
index a07ba624011..6a63b153595 100644
--- a/net/dump.c
+++ b/net/dump.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "clients.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
@@ -33,6 +32,7 @@
 #include "qapi/visitor.h"
 #include "net/filter.h"
 #include "qom/object.h"
+#include "sysemu/rtc.h"
 
 typedef struct DumpState {
     int64_t start_ts;
diff --git a/softmmu/rtc.c b/softmmu/rtc.c
index 5632684fc9d..7e2956f81e9 100644
--- a/softmmu/rtc.c
+++ b/softmmu/rtc.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
@@ -33,6 +32,7 @@
 #include "qom/object.h"
 #include "sysemu/replay.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/rtc.h"
 
 static enum {
     RTC_BASE_UTC,
-- 
2.25.1


