Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DBE315016
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 14:23:53 +0100 (CET)
Received: from localhost ([::1]:51752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Szg-0004cA-H1
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 08:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Swp-0002mG-PS
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:20:55 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Swj-0000jL-Bw
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:20:55 -0500
Received: by mail-wm1-x332.google.com with SMTP id o24so3411264wmh.5
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 05:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v42h+/gUC/c3GqgbqA5jD8JSk9/EEyzsdB3W6E1Nn8k=;
 b=N8uu5k/v3/P+C0n1YKAMNItFrfsWkQHVBcmxzp0jIMagS+1Ldk2l5vQrjXZ5juGb5s
 juhn+lJOY0mOZBT2+Mytw1WwDwSEIXD+vYnpnshe6ZogN12lUegyWXmmg5vwN3zOChuy
 SGzcJGgcoa/ZUMmk5Nr9duXR2/CDGH7d2E/3eRxosIMCOrgxLHS3DR0O6o+U0E1aZ+iY
 pWIcaXay9gxukfzB5v9EatN7+H4rlfpd6efjfRk+FmLyJBekOWlXMN2G7i0qnlorrfmj
 XPmSWQKHVLPuNO7o4bidNx10hbYsp9de/v7aZ6V7HVkyFIwEa1ngyJACv94tmsPQC9Jo
 0oLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v42h+/gUC/c3GqgbqA5jD8JSk9/EEyzsdB3W6E1Nn8k=;
 b=Y2oQs+sSK3bogw4m68lQeEBqnX+620ReKrpJbNpN6BvEP58lKry5FLmOV24flZdYqS
 DOtpOAllgTTXEvaEFNrwFHBkynhvoh3ab+W4H4Aq/iEXjIOONpKkuq2zOOwhisLtyx2q
 sNkLlKVdtQDU0UDULfJydpsAOqzmUlbSGjYg8y9snGiX59pTwkakSdDSJl6SNh9wSSRa
 c5sqWf0tGx54K4NxJh9033DNWmn68ZXHCQtyMxf1HWc44R+fRt/20W7B91YSSNmQEdMR
 K4sqbUO/W7IHKcQR9csH4tnDZYi48YE0mX+eNJtjLu9Ure0lzCiAiqyC47PFKb5vLOtf
 wWNw==
X-Gm-Message-State: AOAM530ykRP5AfytBFax4O5rLEOcsm0kfV2AuAxdPsnVrr+kXIOJpv1u
 UUhsnoQprSbkJBqazh4Ihr5npQ==
X-Google-Smtp-Source: ABdhPJziVZ8+yOo9xPVU+H6KWkkMrsMchc3BZBTELLW3fVP4G6hYAARs7a8GEXuDgb5hgFQnrYWFcQ==
X-Received: by 2002:a1c:c6:: with SMTP id 189mr3498907wma.128.1612876845507;
 Tue, 09 Feb 2021 05:20:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm34752472wrh.16.2021.02.09.05.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 05:20:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] clock: Add ClockPreUpdate callback event type
Date: Tue,  9 Feb 2021 13:20:38 +0000
Message-Id: <20210209132040.5091-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209132040.5091-1-peter.maydell@linaro.org>
References: <20210209132040.5091-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new callback event type ClockPreUpdate, which is called on
period changes before the period is updated.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/clocks.rst | 9 ++++++++-
 include/hw/clock.h    | 1 +
 hw/core/clock.c       | 3 +++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index cd344e3fe5d..f0391e76b4f 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -181,7 +181,14 @@ events.
 
 The events currently supported are:
 
- * ``ClockUpdate`` : called after the input clock's period has changed
+ * ``ClockPreUpdate`` : called when the input clock's period is about to
+   update. This is useful if the device needs to do some action for
+   which it needs to know the old value of the clock period. During
+   this callback, Clock API functions like ``clock_get()`` or
+   ``clock_ticks_to_ns()`` will use the old period.
+ * ``ClockUpdate`` : called after the input clock's period has changed.
+   During this callback, Clock API functions like ``clock_ticks_to_ns()``
+   will use the new period.
 
 Note that a clock only has one callback: it is not possible to register
 different functions for different events. You must register a single
diff --git a/include/hw/clock.h b/include/hw/clock.h
index 5c73b4e7ae9..d7a6673c29e 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -30,6 +30,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
  */
 typedef enum ClockEvent {
     ClockUpdate = 1, /* Clock period has just updated */
+    ClockPreUpdate = 2, /* Clock period is about to update */
 } ClockEvent;
 
 typedef void ClockCallback(void *opaque, ClockEvent event);
diff --git a/hw/core/clock.c b/hw/core/clock.c
index 71dc1f4de65..2c86091d8a3 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -80,6 +80,9 @@ static void clock_propagate_period(Clock *clk, bool call_callbacks)
 
     QLIST_FOREACH(child, &clk->children, sibling) {
         if (child->period != clk->period) {
+            if (call_callbacks) {
+                clock_call_callback(child, ClockPreUpdate);
+            }
             child->period = clk->period;
             trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
                                CLOCK_PERIOD_TO_HZ(clk->period),
-- 
2.20.1


