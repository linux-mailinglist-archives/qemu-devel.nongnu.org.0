Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8FF30A7A9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:32:19 +0100 (CET)
Received: from localhost ([::1]:37956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6YNO-0005vN-54
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6YLZ-0004JS-CS
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:30:25 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6YLU-0003cH-9l
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:30:25 -0500
Received: by mail-wm1-x32e.google.com with SMTP id j18so12494588wmi.3
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 04:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dZnuCCfmvDgfaNUppjP1kLNGCewuh/sSis1yC+WzkTg=;
 b=WRgITgzCFFJWwzhIuStZKCghFmZ11to5z1rmMCG/cRipRKdpKfPMFlttmSnwmLCH1b
 FO+9Z0MeE3Z3n/B4+Jsv5ElyazR6uGY17C4du9HXCbAt9qvw25ZGx3/mkdOER3kGD30V
 cOjNWzC1dMDq2oZtusyJzVKUuum79jdxEbnnuRdQgEkB3EidQGrSFy1n8xamKSMbYGUv
 ehdWHnAPQAS3NqEDLgUYJL8FvtXiGe+gZdvNd4n4z8wdwjU6+w1vycyIak/p/Y07teS6
 bEci1mDZLcmrQdjQ4SiRf+UNm/DC7hhAAS2halLYW5frCVH7PbSPw9/XSIQcxsijprB0
 tKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dZnuCCfmvDgfaNUppjP1kLNGCewuh/sSis1yC+WzkTg=;
 b=WBSdh60ZAFTclS9kp5ZSxMZ8tS+quwHtleQ8LSKysMQ9ScFl2OWxyj3S220ibzqGDH
 Z8meV/LjIXg/GkbwZ2TqEIunF2roUtGvvXJn3fmOo0q+DT8VXhne9qJRdUBUsPfBMKsp
 2TBaRvxlDvrMZR35i+pUkkdoQjQvnJqfOosjl3m0N/T5m8CuZhJ4XJKab4sKT9W9oWlA
 Ek2SpgM2EBEM2Ld0Zy4mYUfaaLcQpyaRhW8NtTxeqhuNdrWitAceh6sufYBGCCnK7+Yw
 KOrdVtlpSkZD9VBKnUBW5bEaMetOPzO7bmE9vb1uZWEn/KS+HpyMy5cfVHjQ9X9EtBfg
 z+lw==
X-Gm-Message-State: AOAM532jZew3OYxizCZtAd2xKC3KJmyFWQhmlUYYxYe2ILEpM0PtSRhr
 I08ZhDhHx7hb4T5qGZt6tp5YMg==
X-Google-Smtp-Source: ABdhPJxNTv+hyuWH2gBspM7Kd8UiKTbJLweEUcKv5zxShCNkDueyeLecn7q5byp+WUiS+/0k6AE1Lg==
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr14443391wmh.131.1612182618716; 
 Mon, 01 Feb 2021 04:30:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm20466278wmj.32.2021.02.01.04.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 04:30:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC 2/4] clock: Add ClockPreUpdate callback event type
Date: Mon,  1 Feb 2021 12:30:11 +0000
Message-Id: <20210201123013.32308-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210201123013.32308-1-peter.maydell@linaro.org>
References: <20210201123013.32308-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Luc Michel <luc@lmichel.fr>, Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new callback event type ClockPreUpdate, which is called
on period changes before the period is updated.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/clocks.rst | 9 ++++++++-
 include/hw/clock.h    | 1 +
 hw/core/clock.c       | 3 +++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index 8d3b456561f..dea63742fb0 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -179,7 +179,14 @@ specific events they need to handle, so that if in future different
 events are added the callback code doesn't need to be updated.
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
 
 Retrieving clocks from a device
 -------------------------------
diff --git a/include/hw/clock.h b/include/hw/clock.h
index 323f8d49fed..7d0eb286faa 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -27,6 +27,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
  * has been called.
  */
 typedef enum ClockEvent {
+    ClockPreUpdate, /* Clock period is about to update */
     ClockUpdate, /* Clock period has just updated */
 } ClockEvent;
 
diff --git a/hw/core/clock.c b/hw/core/clock.c
index 772d03a2eb5..963fe83a363 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -68,6 +68,9 @@ static void clock_propagate_period(Clock *clk, bool call_callbacks)
 
     QLIST_FOREACH(child, &clk->children, sibling) {
         if (child->period != clk->period) {
+            if (call_callbacks && child->callback) {
+                child->callback(child->callback_opaque, ClockPreUpdate);
+            }
             child->period = clk->period;
             trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
                                CLOCK_PERIOD_TO_HZ(clk->period),
-- 
2.20.1


