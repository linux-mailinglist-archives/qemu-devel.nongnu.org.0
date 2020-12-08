Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930A62D3255
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:46:55 +0100 (CET)
Received: from localhost ([::1]:59228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmi0k-0002MF-I9
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:46:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmhWw-0005Iy-N2
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:16:07 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmhWu-0007wI-HM
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:16:06 -0500
Received: by mail-wr1-x429.google.com with SMTP id r14so1531613wrn.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rsusvVmbp8UtSIK1LPtaov69Vpog2i9qOUwwDMskU2I=;
 b=h2ATfoOfy+TtIs6mm776iESpSRHVWTZ9OCtpa/Rb2BGWsVFL7fU4/2KNuemzORIpkX
 8WtDp7+z7EGEmVX2mrwEL9smse3P8N6VhoPb1IVmp5yB5W12ScYrDTlTydmB5WprOuh/
 8vZIybbxHBOK12AXmcMZCZKkPDWCl7Al6Q6aPLdNqOjp97O5gFttEuwGdmv9SoPzllEe
 pcHo3gspjfb9Hx+T0kv75OOmIuztlEvD7cOIosJGs01XfXxWR56h1ME6kCZ3UIcrmO9R
 D9mdJNthUDhuNEtoChLPN02j8Atd7aWzcGEYnHozi9ER6cW5Hb/bL8v4QODiWBRv645z
 omCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rsusvVmbp8UtSIK1LPtaov69Vpog2i9qOUwwDMskU2I=;
 b=DGNHEwtwnUlCT4o98dLD4ijv21F8cZ3/NrFXWVeJo89et5xIedg7bi9an+sMPY4ct3
 MzbbphCaqCHohi9A90TMTfl0i2SR/WaOwhimwHMCMefn8B4S8JhrKex/tT8Gapo/4Lve
 XsclFf1jp8ciNHi6ZmUXDtFECeMu2sJswlokuvp7ctXXsguFOnvfmgWqaWCKOutFep1d
 jKEfu6xZTKjv7iS7FQoYdwNXJirh+FvljSkZs6n5YVITDft2XJqr/AxexDVFhvJ5nCEt
 AHiQRdr2+w67g/57ghICKteATDc9xbKVUhC6jOPnY+L8+LbRlHvc4U9VgcwXhTkUqy6G
 z5CA==
X-Gm-Message-State: AOAM530xZvpQNn6gK4ZkWvaXkNfBModz3eRFElE/cw72ua5zF+OkPzwv
 UnvadfftqQFkV2WWqKdyLbqpeuUDNR4SFQ==
X-Google-Smtp-Source: ABdhPJx4cBKQMUYUxJRttpZJJdyw+ZuXFGXNfImKdemxxc6qeVdfNqKbNtL9aFSmcMmDQVxDNK/ltw==
X-Received: by 2002:adf:9525:: with SMTP id 34mr3378591wrs.389.1607451361253; 
 Tue, 08 Dec 2020 10:16:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u12sm4978873wmu.28.2020.12.08.10.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:16:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] clock: Define and use new clock_display_freq()
Date: Tue,  8 Dec 2020 18:15:54 +0000
Message-Id: <20201208181554.435-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208181554.435-1-peter.maydell@linaro.org>
References: <20201208181554.435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Luc Michel <luc.michel@greensocs.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
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
index 9a93d1361b4..cf8067542a1 100644
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
index 9c0b1eb4c3f..7bc9afb0800 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -252,4 +252,16 @@ static inline bool clock_is_enabled(const Clock *clk)
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
index bf79d0bbcd9..6263d600026 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -747,11 +747,11 @@ static void qdev_print(Monitor *mon, DeviceState *dev, int indent)
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


