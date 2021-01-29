Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C42308824
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:16:05 +0100 (CET)
Received: from localhost ([::1]:52160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Rky-00083g-GJ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:16:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWC-0004iC-3z
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:48 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW0-00071G-BQ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:47 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 7so8419168wrz.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Esyq17HhYoFys0+3B05acQPqcZoziSiXEoUKmC7g+48=;
 b=ppfE9jGUMHi3cRnWGEcM7KxG2Y8Gopy+HcUlN/vYYVPA/t1n/0WPFxGp/zVmPATFBU
 C0txOn2kl4iXb7gr677/Ej5s2kM0qhRLlrg3pRgG7cPauMDMyjT0Qd0p0dKq2V9ilRgK
 cSJK+XOV1VrMolrUimmloF15dlM6+QJXPbGuUWDYGSEc2Z/AnggWlDqafoKEY6ICq5Nw
 iISNT3ZhkBXn9oxOGZhMy7Bt5djOuq3eWlqhi6PbGRn1BHuE8GEGfAYi7om41SM49+8T
 SkZjD7D+TgriC/RBy4mvxOvV+G5xjAxyaIoxGt6dRvxV2B7MvdJkAgjRGH21WQGPWIgi
 p/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Esyq17HhYoFys0+3B05acQPqcZoziSiXEoUKmC7g+48=;
 b=DI8Az8TgrLIj3bY2hmSnh8QsmodLqoF3s4NyoYVd+73tUqooIIhSNKd50fqQtE1FJU
 FtK3SJvyMNw81Swwsp8UxRl2bBuFNJId5tiNzU5NsC9om4QQXdwCRf3c+91Kf5MdpzBO
 QXL4JDkK1y3kbdlPhfRGlSvIiqg6IWA8v7n+ohidLuAuMoOCze7fIbr3d/nxlUHtnp5q
 jNKH2d+0d3lTOyPjXt9ieitx5OK7BonGZjQkMeduthc4iqrs5REQp3ocXoPaITTfVnpR
 Bdvd35mKQ313d42Aor3TJ9B7XbBMBXMr5LT3Rrqv7ayWPi7vqqq/yM+rS55mdCOXeEiQ
 jqmA==
X-Gm-Message-State: AOAM532IzK6od7fWm9zJE+fo0/L2YXKV0JlktIUScjr81SqUfQpjrWKo
 JfT/T3HqYlwogpJaoCIDgp5qZo25rG30zw==
X-Google-Smtp-Source: ABdhPJwmBViZZ5RaIGYC2giIIr8afiGIsrPSXdyxKEj6YuHFwQIirZXP4BwrQ20rkDfqNiXM7MMX7g==
X-Received: by 2002:adf:df12:: with SMTP id y18mr3929750wrl.141.1611918035157; 
 Fri, 29 Jan 2021 03:00:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/46] ptimer: Add new ptimer_set_period_from_clock() function
Date: Fri, 29 Jan 2021 10:59:48 +0000
Message-Id: <20210129110012.8660-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

The ptimer API currently provides two methods for setting the period:
ptimer_set_period(), which takes a period in nanoseconds, and
ptimer_set_freq(), which takes a frequency in Hz.  Neither of these
lines up nicely with the Clock API, because although both the Clock
and the ptimer track the frequency using a representation of whole
and fractional nanoseconds, conversion via either period-in-ns or
frequency-in-Hz will introduce a rounding error.

Add a new function ptimer_set_period_from_clock() which takes the
Clock object directly to avoid the rounding issues.  This includes a
facility for the user to specify that there is a frequency divider
between the Clock proper and the timer, as some timer devices like
the CMSDK APB dualtimer need this.

To avoid having to drag in clock.h from ptimer.h we add the Clock
type to typedefs.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-2-peter.maydell@linaro.org
Message-id: 20210121190622.22000-2-peter.maydell@linaro.org
---
 include/hw/ptimer.h     | 22 ++++++++++++++++++++++
 include/qemu/typedefs.h |  1 +
 hw/core/ptimer.c        | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 412763fffb2..c443218475b 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -165,6 +165,28 @@ void ptimer_transaction_commit(ptimer_state *s);
  */
 void ptimer_set_period(ptimer_state *s, int64_t period);
 
+/**
+ * ptimer_set_period_from_clock - Set counter increment from a Clock
+ * @s: ptimer to configure
+ * @clk: pointer to Clock object to take period from
+ * @divisor: value to scale the clock frequency down by
+ *
+ * If the ptimer is being driven from a Clock, this is the preferred
+ * way to tell the ptimer about the period, because it avoids any
+ * possible rounding errors that might happen if the internal
+ * representation of the Clock period was converted to either a period
+ * in ns or a frequency in Hz.
+ *
+ * If the ptimer should run at the same frequency as the clock,
+ * pass 1 as the @divisor; if the ptimer should run at half the
+ * frequency, pass 2, and so on.
+ *
+ * This function will assert if it is called outside a
+ * ptimer_transaction_begin/commit block.
+ */
+void ptimer_set_period_from_clock(ptimer_state *s, const Clock *clock,
+                                  unsigned int divisor);
+
 /**
  * ptimer_set_freq - Set counter frequency in Hz
  * @s: ptimer to configure
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 976b529dfb5..68deb74ef6f 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -34,6 +34,7 @@ typedef struct BlockDriverState BlockDriverState;
 typedef struct BusClass BusClass;
 typedef struct BusState BusState;
 typedef struct Chardev Chardev;
+typedef struct Clock Clock;
 typedef struct CompatProperty CompatProperty;
 typedef struct CoMutex CoMutex;
 typedef struct CPUAddressSpace CPUAddressSpace;
diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 2aa97cb665c..6ba19fd9658 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -15,6 +15,7 @@
 #include "sysemu/qtest.h"
 #include "block/aio.h"
 #include "sysemu/cpus.h"
+#include "hw/clock.h"
 
 #define DELTA_ADJUST     1
 #define DELTA_NO_ADJUST -1
@@ -348,6 +349,39 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
     }
 }
 
+/* Set counter increment interval from a Clock */
+void ptimer_set_period_from_clock(ptimer_state *s, const Clock *clk,
+                                  unsigned int divisor)
+{
+    /*
+     * The raw clock period is a 64-bit value in units of 2^-32 ns;
+     * put another way it's a 32.32 fixed-point ns value. Our internal
+     * representation of the period is 64.32 fixed point ns, so
+     * the conversion is simple.
+     */
+    uint64_t raw_period = clock_get(clk);
+    uint64_t period_frac;
+
+    assert(s->in_transaction);
+    s->delta = ptimer_get_count(s);
+    s->period = extract64(raw_period, 32, 32);
+    period_frac = extract64(raw_period, 0, 32);
+    /*
+     * divisor specifies a possible frequency divisor between the
+     * clock and the timer, so it is a multiplier on the period.
+     * We do the multiply after splitting the raw period out into
+     * period and frac to avoid having to do a 32*64->96 multiply.
+     */
+    s->period *= divisor;
+    period_frac *= divisor;
+    s->period += extract64(period_frac, 32, 32);
+    s->period_frac = (uint32_t)period_frac;
+
+    if (s->enabled) {
+        s->need_reload = true;
+    }
+}
+
 /* Set counter frequency in Hz.  */
 void ptimer_set_freq(ptimer_state *s, uint32_t freq)
 {
-- 
2.20.1


