Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65962DAFDC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:15:17 +0100 (CET)
Received: from localhost ([::1]:44120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpC2m-0002kP-Pd
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:15:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpBxM-0005Lt-0y
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:09:40 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpBxK-0000lE-81
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:09:39 -0500
Received: by mail-wr1-x42d.google.com with SMTP id i9so20194236wrc.4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nkq5zKbaVAWjdXkuGKd7o/1m+2dYVJpKL4l20M54fCI=;
 b=dbJJQvv6APgPeCzkFQjdX53UBN1sPUaSi4nLH9VM9xaed/iXHk9KqLZXLDOuuH9RQK
 EW77eIiQX27KD9RCe0f0DRcZe2k5FtdlmjZpDeMKf13Ivl9ZscDTLxaeQigac1E0OPD0
 JJjeernv3BbTX2qxfxnHunqadt/M28VcMHorQHJjZHcJTISOPKvM3HCqB0a6JjASiYBn
 /VVkMWo46OLG6KwqQW23Zcmo6Lj23/Jk2Q8p3mzMG1Zk9dEr9pJV40KhzhFCFNMGMVLp
 lMs3nIN/x03qHKRJTbYk/+K7IsCpVjx3FSrP+dMe78TslvPSaa9tn/NQaIrl2zTOushe
 Ed4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nkq5zKbaVAWjdXkuGKd7o/1m+2dYVJpKL4l20M54fCI=;
 b=LQTIrI8g+Zsap/hth6B6geIg8L6Z+MV3lz0mJdMCJWn5iW6thD4pmHKxEhevD0w5Ws
 ryU1kvuW/WgF+M/DFSoCfwMejwRM/p/2nBDSCXckzkds26gM13qRjYzKQjRcZllXFbu8
 qOeFPLjNhURIQ385XlkbRDWGLmoCYnEh4+E8jfUflPtXMWePRRbK4V8tBW4zZ472PVwG
 ybU91BgGGMNO+nUbK5z/KwrE8PVl4PxMM7pmXvFdQwsVVLhOtciJ3L0/Kyi4EnQJTe7K
 ADQzhuPBTNZlrKEdMe1jL5Oe6nJOMGAfuNMgpdX4g2+yrDc/rr0clxNA03J6L4Wx0tkO
 23vA==
X-Gm-Message-State: AOAM533Cu0VvDhDQCGZ19+QyV1eu2CCwF7pxzxzl/YNvmRVLAVWP9U1Z
 76guaJYJkVKF8h0GirCOSBEgzoUmODTc3Q==
X-Google-Smtp-Source: ABdhPJzJMnxtyvc8pMSU8z5t08Ox2EdT2GbV4wpcj9g5DWvaOESIsWVa+KYe9+CZXynKNXwhsJeLxw==
X-Received: by 2002:a5d:6a05:: with SMTP id m5mr3205573wru.96.1608044976547;
 Tue, 15 Dec 2020 07:09:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l1sm36930593wmi.15.2020.12.15.07.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 07:09:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] clock: Define and use new clock_display_freq()
Date: Tue, 15 Dec 2020 15:09:29 +0000
Message-Id: <20201215150929.30311-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215150929.30311-1-peter.maydell@linaro.org>
References: <20201215150929.30311-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Luc Michel <luc.michel@greensocs.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's common to want to print a human-readable indication of a clock's
frequency. Provide a utility function in the clock API to return a
string which is a displayable representation of the frequency,
and use it in qdev-monitor.c.

Before:



  (qemu) info qtree
  [...]
  dev: xilinx,zynq_slcr, id ""
    clock-in "ps_clk" freq_hz=3.333333e+07
    mmio 00000000f8000000/0000000000001000

After:

  dev: xilinx,zynq_slcr, id ""
    clock-in "ps_clk" freq_hz=33.3 MHz
    mmio 00000000f8000000/0000000000001000


Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
---
This is based on Philippe's patch
"qdev-monitor: Display frequencies scaled to SI unit"
but I have abstracted out the "prettified string" into the clock API.
---
 docs/devel/clocks.rst  |  5 +++++
 include/hw/clock.h     | 12 ++++++++++++
 hw/core/clock.c        |  6 ++++++
 softmmu/qdev-monitor.c |  6 +++---
 4 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index 2d317ff32f2..2548d842322 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -267,6 +267,11 @@ Here is an example:
                         clock_get(dev->my_clk_input));
     }
 
+If you are only interested in the frequency for displaying it to
+humans (for instance in debugging), use ``clock_display_freq()``,
+which returns a prettified string-representation, e.g. "33.3 MHz".
+The caller must free the string with g_free() after use.
+
 Calculating expiry deadlines
 ----------------------------
 
diff --git a/include/hw/clock.h b/include/hw/clock.h
index 852c636961e..6382f346569 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -264,4 +264,16 @@ static inline bool clock_is_enabled(const Clock *clk)
     return clock_get(clk) != 0;
 }
 
+/**
+ * clock_display_freq: return human-readable representation of clock frequency
+ * @clk: clock
+ *
+ * Return a string which has a human-readable representation of the
+ * clock's frequency, e.g. "33.3 MHz". This is intended for debug
+ * and display purposes.
+ *
+ * The caller is responsible for freeing the string with g_free().
+ */
+char *clock_display_freq(Clock *clk);
+
 #endif /* QEMU_HW_CLOCK_H */
diff --git a/hw/core/clock.c b/hw/core/clock.c
index 8c6af223e7c..76b5f468b6e 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "hw/clock.h"
 #include "trace.h"
 
@@ -111,6 +112,11 @@ static void clock_disconnect(Clock *clk)
     QLIST_REMOVE(clk, sibling);
 }
 
+char *clock_display_freq(Clock *clk)
+{
+    return freq_to_str(clock_get_hz(clk));
+}
+
 static void clock_initfn(Object *obj)
 {
     Clock *clk = CLOCK(obj);
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 832e2548424..fb6c94eaeaf 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -732,11 +732,11 @@ static void qdev_print(Monitor *mon, DeviceState *dev, int indent)
         }
     }
     QLIST_FOREACH(ncl, &dev->clocks, node) {
-        qdev_printf("clock-%s%s \"%s\" freq_hz=%e\n",
+        g_autofree char *freq_str = clock_display_freq(ncl->clock);
+        qdev_printf("clock-%s%s \"%s\" freq_hz=%s\n",
                     ncl->output ? "out" : "in",
                     ncl->alias ? " (alias)" : "",
-                    ncl->name,
-                    CLOCK_PERIOD_TO_HZ(1.0 * clock_get(ncl->clock)));
+                    ncl->name, freq_str);
     }
     class = object_get_class(OBJECT(dev));
     do {
-- 
2.20.1


