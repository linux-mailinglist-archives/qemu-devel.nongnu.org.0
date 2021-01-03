Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ED82E8E4B
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:08:22 +0100 (CET)
Received: from localhost ([::1]:55232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAbt-0005VH-MH
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMH-00048o-6R
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:13 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMF-0006D6-M5
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:12 -0500
Received: by mail-wm1-x32f.google.com with SMTP id e25so16678418wme.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S5HsQlYCUdheC9WapV12I7REW2HWT9Eel8KOz7tCI0c=;
 b=Q9sViTLFYRhYMAAbN8Cn4mDn+uY5yzyxxGNl/LjYddodG4eLWGGsu6tEaaiHgaUxKV
 CaAWQHJPTbzzWRaNZsOBCZ1ERF7txS8dedr3q0d4RZwVLOZiVYR6MEDtdUMmIn4zAJGB
 eRWKuFGGIzTzKUt768P2SjYrI861/L7rr4tbzzz4Po1YYCANHwi2v210K52gHoVHWSkp
 bJIBOjLOrVJCCiOS8SaIVVJase97JURDngN6bF5faaj20E6Ks2eDB3KTuQpNIwBj1ksk
 rKEho9y4hZfE90rQwuV42/9n++/dGQ+Ae96JxiGw1856HiXjPbS1qTAwJ8FsjsOHGrHL
 9ADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S5HsQlYCUdheC9WapV12I7REW2HWT9Eel8KOz7tCI0c=;
 b=sAe4NT1TSeQQPk2T1wpy2IkkP3uVek/pm+9ilaVPwtWcDP7NpNlmfoAZxtDAC90T06
 GdN8Y2axFEllERwpnlxtwzmLoDQIrxSkOzWC3gJKYAq890kdxj/A3VRME2T+0Ih+p//W
 CHStK3nRGXdJKdER+UlMgdeOqDQJisCBKBJyF4RH/Mv3V+dFeWYkZMmH8mX1EsovqTfh
 VxN97t51mlRLj8QTW7sQHCc/8Ec8jsi4RYsKAx2n9Uk1ob05VNq1F+pWrYbFqhjwwOyj
 Cx8HwYpqJ9Kf/QOJLuJiNxpY1bW+LLcVehXKV5ouR+Yi5CUdKU/uAVBccXqFKvRBv2VB
 624Q==
X-Gm-Message-State: AOAM531hVh4kWf0Dsq3oege29vlhyhwMbCRQ5hIWHpA7mFF8zJpoQbiJ
 JyRR/aoA6WEkRuBwpgGxoSnla/HwRJc=
X-Google-Smtp-Source: ABdhPJwErC5L6MiANUu0xARI9uwlt37n/DW206JgJzDU+QfAGziyfib0zaJvpPTQuHCAdn94IAD3vw==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr23732194wmr.179.1609707130251; 
 Sun, 03 Jan 2021 12:52:10 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id g5sm85018363wro.60.2021.01.03.12.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:52:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/35] clock: Define and use new clock_display_freq()
Date: Sun,  3 Jan 2021 21:50:08 +0100
Message-Id: <20210103205021.2837760-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

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
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201215150929.30311-5-peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 2c57e36c9ae..8dc656becca 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -736,11 +736,11 @@ static void qdev_print(Monitor *mon, DeviceState *dev, int indent)
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
2.26.2


