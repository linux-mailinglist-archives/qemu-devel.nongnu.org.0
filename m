Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2247451526
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 21:24:52 +0100 (CET)
Received: from localhost ([::1]:56316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmiX5-00069j-Ul
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 15:24:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmiSI-0006P3-TS
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 15:19:57 -0500
Received: from [2a00:1450:4864:20::332] (port=38534
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmiSG-0001wj-1n
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 15:19:54 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso186910wms.3
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 12:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CFmTiNbFo097ebi7K9NxSL9BNaZOJ1x8cr0AzAxsLFE=;
 b=fmu+cbtnISakcs63Attx7wFpqMGLl3ofQs+kyDx81/YDbPpi2Bx/lqRckHPGcyz50V
 X/2NBIpuMl7N4UUBJPApR5o2mDfXaa9DGYwGp7T2TXoW8rzDkHar7xl2I0mT6BCRkgw3
 tKSqD0nwUrQMurNEnQFdCsh3peX10fFgpA0m/564A2n1PAgsJE8/gYJ+GpJZGN3FtQgF
 FbAPy+b49DV+Uszgqde53N2idGz+sQy46xQcQD13rGfmPPRrf5o4dwYamuYmj0xGbeqo
 ZgQ/+qqK89YyFQ/AtjcMwU7y5FyHQw1m+anckzVOU7vc0wHrbng/HPu2QrlBg32FAalH
 KvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CFmTiNbFo097ebi7K9NxSL9BNaZOJ1x8cr0AzAxsLFE=;
 b=WtCglg6FSUNPFz/M0xp0pXN75KgrvzpDA9C/9vQmETNd99mOlcwB6nLlglvpvkHjZj
 fYbXGqiY/+BZVtB38RV3z7e8q0IMYvl4kXmvKy6zR6dL6Q5GeVD87IQ+xuzsfGwXwtZv
 QYcMVjEVN49gmNdC4QRwjJGSfp5tjTCIoUMTFYb2bEYQQOrpQdoq6eq7LbD+gluYNnZk
 KGvUXaeyDX8vl623KNLNesXmsCU9BZye+zZhxYrl/peVAfn58LaHckHzQgiNaR52gbxD
 bcilfBDO4VCFIoPYCxXw4ekrXRWjr2S+rvQKsgTxrYJGcqjyvLJnXaWGN0qg79vkYwTZ
 AvwQ==
X-Gm-Message-State: AOAM530gPBe2hwcyrR+3Vh9bR8nCsmNoq8JjP88XFd9NBZQ9qD0ksS7Z
 QDo1ZhMLN6Moco2gsoyKUzLjd76tNMfNqQ==
X-Google-Smtp-Source: ABdhPJzfGuwGP5UPKlNYijluXwjN2Le1AKns7flRln5U1DCQJLyUXI4tZ65Y8J2wN9jmwINI3yfi7g==
X-Received: by 2002:a7b:c389:: with SMTP id s9mr1322722wmj.133.1637007590555; 
 Mon, 15 Nov 2021 12:19:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm15419033wrs.48.2021.11.15.12.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 12:19:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] hw/rtc/pl031: Send RTC_CHANGE QMP event
Date: Mon, 15 Nov 2021 20:19:46 +0000
Message-Id: <20211115201946.327770-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115201946.327770-1-peter.maydell@linaro.org>
References: <20211115201946.327770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

The PL031 currently is not able to report guest RTC change to the QMP
monitor as opposed to mc146818 or spapr RTCs. This patch adds the call
to qapi_event_send_rtc_change() when the Load Register is written. The
value which is reported corresponds to the difference between the guest
reference time and the reference time kept in softmmu/rtc.c.

For instance adding 20s to the guest RTC value will report 20. Adding
an extra 20s to the guest RTC value will report 20 + 20 = 40.

The inclusion of qapi/qapi-types-misc-target.h in hw/rtl/pl031.c
require to compile the PL031 with specific_ss.add() to avoid
./qapi/qapi-types-misc-target.h:18:13: error: attempt to use poisoned
"TARGET_<ARCH>".

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210920122535.269988-1-eric.auger@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/rtc/pl031.c     | 10 +++++++++-
 hw/rtc/meson.build |  2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
index 2bbb2062ac8..e7ced90b025 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -24,6 +24,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
+#include "qapi/qapi-events-misc-target.h"
 
 #define RTC_DR      0x00    /* Data read register */
 #define RTC_MR      0x04    /* Match register */
@@ -136,10 +137,17 @@ static void pl031_write(void * opaque, hwaddr offset,
     trace_pl031_write(offset, value);
 
     switch (offset) {
-    case RTC_LR:
+    case RTC_LR: {
+        struct tm tm;
+
         s->tick_offset += value - pl031_get_count(s);
+
+        qemu_get_timedate(&tm, s->tick_offset);
+        qapi_event_send_rtc_change(qemu_timedate_diff(&tm));
+
         pl031_set_alarm(s);
         break;
+    }
     case RTC_MR:
         s->mr = value;
         pl031_set_alarm(s);
diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
index 7cecdee5ddb..8fd8d8f9a71 100644
--- a/hw/rtc/meson.build
+++ b/hw/rtc/meson.build
@@ -2,7 +2,7 @@
 softmmu_ss.add(when: 'CONFIG_DS1338', if_true: files('ds1338.c'))
 softmmu_ss.add(when: 'CONFIG_M41T80', if_true: files('m41t80.c'))
 softmmu_ss.add(when: 'CONFIG_M48T59', if_true: files('m48t59.c'))
-softmmu_ss.add(when: 'CONFIG_PL031', if_true: files('pl031.c'))
+specific_ss.add(when: 'CONFIG_PL031', if_true: files('pl031.c'))
 softmmu_ss.add(when: 'CONFIG_TWL92230', if_true: files('twl92230.c'))
 softmmu_ss.add(when: ['CONFIG_ISA_BUS', 'CONFIG_M48T59'], if_true: files('m48t59-isa.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-rtc.c'))
-- 
2.25.1


