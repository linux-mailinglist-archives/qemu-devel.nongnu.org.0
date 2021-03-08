Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB8833154D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:54:52 +0100 (CET)
Received: from localhost ([::1]:41714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJK5j-0005dW-HZ
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkS-0006KW-6g
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:32:52 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkQ-0006zq-1K
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:32:51 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a18so12282281wrc.13
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZaDTvaQiW6HmR9jZg8/+Dh4T9ld6iz8Wno9OhchiORM=;
 b=nFIHkGKbsmpjMr/8NMOOkv7yU+NpZ8Ol8xIxn9WIGkGNqQ/H7jOI1GJ1uGc3kaJJqf
 yrfN4SngKninrjtCOzKYyhKA9im2NOYfsZQCzmycfi2WlrvaOr4U57xEddpeUJehmAOk
 7oeh633VT2JM7bDCbu80JZ+qYrUQjIEiVn4YaezDq90f7nvZw75ylp4GjEz8abzt+sx/
 LBe8W6q6/HqLiBsPKc09VoJHW+SCwo+WxIVO5Yg6q8nq8ZG/u5NOoxN7WlsPYBC99TAo
 glvPHkWsnQrBEQ0GHrrq0J4JsAyyYEsUY3ownEDcGOGItqqNEzYWr3JBp4kEjxn3gBTX
 B1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZaDTvaQiW6HmR9jZg8/+Dh4T9ld6iz8Wno9OhchiORM=;
 b=tocqh1lwmLmfKcsTg9w1/IJMPNjZnwtj6K3B/MNWPs/ODK3909AJcDFDaz/G12Bjy/
 cSZuy/rk1L94iSaYaf6E/ttHVDBY/JvQRfHC5kKnQrtdm60UY/WMKApVnyuZ6cwif7vZ
 VFx/wu5vY7EiBT+LbjDaX34RJRso8RruuC7ogXFrSpF4utlwS5evnmBMSJhnPkPPck0t
 jBS80lHseGutArCb2Ws17xmCkcwlFGGepTZzUR8hkvFZZWFldyVW4UMBTtItBWxF3XUy
 RkV/UKPKWfmu1jua9OFL8Vv1XflshCXGGRWSw1yYabgpmBfQNk5MmyzNKRVw5yrZNGYH
 /nNw==
X-Gm-Message-State: AOAM530Qu4p0voyJcbV3nCfFyUt+hQZwnC8vjWZSex2iAhEp7UBB1Aqc
 VkuUWSZIJ+O3JKZsp1Iyhmio+WOrrETWEQ==
X-Google-Smtp-Source: ABdhPJwqeTL7S0UFKLhPhNo6Fy2Mq2snXF8jCCPs4cX4N94RMFzY8DeGjY2AMizu5hKVV6j6in4C1A==
X-Received: by 2002:adf:f7cc:: with SMTP id a12mr24030175wrq.54.1615224768381; 
 Mon, 08 Mar 2021 09:32:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/54] clock: Add ClockPreUpdate callback event type
Date: Mon,  8 Mar 2021 17:31:52 +0000
Message-Id: <20210308173244.20710-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Add a new callback event type ClockPreUpdate, which is called on
period changes before the period is updated.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210219144617.4782-3-peter.maydell@linaro.org
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


