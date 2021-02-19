Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F14F31FB4E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:50:54 +0100 (CET)
Received: from localhost ([::1]:33784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD77N-0004MQ-5V
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73B-0001zG-Ux
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:34 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD731-0003M4-Sz
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:33 -0500
Received: by mail-wm1-x32e.google.com with SMTP id w4so7288672wmi.4
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=X3f+n7+0c+b3Y+gX92OT7kIrAKPQDQz8ayoCWLv3PMg=;
 b=VWB/DUuyb0tBp9brES9dBytt3JuUlkTTvflMsghe8zbXYK/KDWXG/5dcW9ZLni+d6J
 p1+7liCbj+lUPfEYHczHGfDPeEUydDqzjtBd4Ysmdaj/hkeaVR5eZSbyuBWMeqsd9OMA
 Wu8HT4/8xfejbdong1R7gmLS/crm8EsjQwwYwulI2akcdZdQ/bFh+UtygqV2vt8CrKjP
 9R1zoCOpuavFzGrCxwNEz2vDLJuwnJnrekTE/pyOrBjQ2AxiTxwOSvq9xVP9I/cqjXcq
 IIKYgYm3MezguXA90cLT1Dxbps0tbAQMh3621omaiFtQJX1MHb1jukkNKvEfvrkWEJdQ
 DEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X3f+n7+0c+b3Y+gX92OT7kIrAKPQDQz8ayoCWLv3PMg=;
 b=e3yd6I+V1Tm+g1TOLH9iYwBHDwDFnN80A2asXJeOiBxnAq0d9bgxg3CAVz1X3Dfl74
 6kVs/whJAc6ZlQE+pq26VEWpqbycBjGwqpB2N94+qZRUiYLX2Ls4Ld81u/sKgmZwZ6J4
 Wc4Vf49FYYWGFlTNy52kdEKNW+Uh7sRJpJYo5y4CcG8Ov/Pgh8bZdZASfcEnVdhvpYtZ
 MC351QKCjAaorMFBYWs5pBkNlrWQhUsxfcdAdkHbIoyqDaO99aP/BmodhnCpMktcVjgh
 cGXVYIIXOqC8rBvRrP4eEpGeb8l7M8ftg/4KHQ6f1qRDjWogZx0ycDKDAzPF8LMVJJHI
 MDjg==
X-Gm-Message-State: AOAM531h/0GqqT4iHjzYIrEsXlOltDIEFue147ASyypYDyHCdCEoMRJf
 LILNqUaXXRWAe/nTE+LZdBoUUw==
X-Google-Smtp-Source: ABdhPJw6QMkaJvY0U9jbQz/dmTgs6wYmm6/85lBn6N1sRDqaXPqmKk6lBYhah6lTItsdPEXBewo1Fg==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr8582384wml.100.1613745982137; 
 Fri, 19 Feb 2021 06:46:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/44] clock: Add ClockPreUpdate callback event type
Date: Fri, 19 Feb 2021 14:45:35 +0000
Message-Id: <20210219144617.4782-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new callback event type ClockPreUpdate, which is called on
period changes before the period is updated.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 282a37f7c5a..2ba44e14424 100644
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
index 4479eff145b..fc5a99683f8 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -81,6 +81,9 @@ static void clock_propagate_period(Clock *clk, bool call_callbacks)
 
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


