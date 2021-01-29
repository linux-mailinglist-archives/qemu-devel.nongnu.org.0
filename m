Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CEF308827
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:17:18 +0100 (CET)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Rm9-0001WF-0P
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:17:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWD-0004mQ-Tv
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:49 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW1-00072Z-6L
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:49 -0500
Received: by mail-wr1-x436.google.com with SMTP id 6so8390504wri.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iwK74lUuICgESOvqT1mx3LAnqkaSE1TGL5QtPXgrPPg=;
 b=U13BeTUygQH1XUvVHKP2dVtmcBwprYNBphmRFkmWXNHQJ/+cgbrS02dhqM02nER1aC
 Fx5ELd1zxFTEF86SjQ24iDktV+/9n9h+a1fgP10AcNy15hutD4EF1FjithCskA1sEu2V
 9/cDmOvghJwFACXolCishdhh4JQ7ImhQagYZEaNdnBMqm8Bc0DPiCj5l+pusSwUcWrJD
 /q2YrXWygRHGocmZhaAPlX5Oiroh/nN3X3zIJiEAfccrcDcy6udHVn1+kagZd5iKdUHa
 9SgrJ/7EXudk5JMK7vF8s/3l1h5ieidkBrRPHs43QbatogYHlMXRm9J9C7nWQXcqOqOL
 3rwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iwK74lUuICgESOvqT1mx3LAnqkaSE1TGL5QtPXgrPPg=;
 b=hnC7hqPiVytfl6qCwqDqIIRGIz2ix6DVo4oCTfnGDUKl/Oc4UU6bdgNtdHGQMnrG39
 dmCWRPb14sKKrgXh7liZBkj7T71a17siVkPhoFkPMl8sSmGKKD+Vs50sRQV/2ebmxexX
 Q9Vb13YXZQtvIj1jmHg+tqVO7x5m4jejHvltvfoKg3GkfZhN2X4mK+k8vN6SvhOjbSJo
 zoWr762aGzq0Lm+vqEWvaap/nkWc/UxrFQ6Lv0ipUDn3YckHr5aKwz3Coa3HLAr+Wwbz
 UR55QVv2EjvG9pEb4tufpaijIjv1MgC4symauZseIGAXPCzCRwqvYQdBj4vYZMc1hWVk
 ky5g==
X-Gm-Message-State: AOAM532uxryEpSua8HkFAt+A61LDLknchYN4YrHHUhn1T43jCzkVYc5I
 YIN3Js3PdcXPvD1Ue2GK7FBEScAqFcWkng==
X-Google-Smtp-Source: ABdhPJw7z6tbK5vBfiWW8DsxuF0PpjyAotORFNwiLQK9Uz0RiZY3N8wD6ZSYdzMLlFhWlsCvJHcihQ==
X-Received: by 2002:a05:6000:1105:: with SMTP id
 z5mr3875424wrw.15.1611918035941; 
 Fri, 29 Jan 2021 03:00:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/46] clock: Add new clock_has_source() function
Date: Fri, 29 Jan 2021 10:59:49 +0000
Message-Id: <20210129110012.8660-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Add a function for checking whether a clock has a source.  This is
useful for devices which have input clocks that must be wired up by
the board as it allows them to fail in realize rather than ploughing
on with a zero-period clock.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-3-peter.maydell@linaro.org
Message-id: 20210121190622.22000-3-peter.maydell@linaro.org
---
 docs/devel/clocks.rst | 16 ++++++++++++++++
 include/hw/clock.h    | 15 +++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index 2548d842322..c54bbb82409 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -235,6 +235,22 @@ object during device instance init. For example:
     /* set initial value to 10ns / 100MHz */
     clock_set_ns(clk, 10);
 
+To enforce that the clock is wired up by the board code, you can
+call ``clock_has_source()`` in your device's realize method:
+
+.. code-block:: c
+
+   if (!clock_has_source(s->clk)) {
+       error_setg(errp, "MyDevice: clk input must be connected");
+       return;
+   }
+
+Note that this only checks that the clock has been wired up; it is
+still possible that the output clock connected to it is disabled
+or has not yet been configured, in which case the period will be
+zero. You should use the clock callback to find out when the clock
+period changes.
+
 Fetching clock frequency/period
 -------------------------------
 
diff --git a/include/hw/clock.h b/include/hw/clock.h
index 6382f346569..e5f45e2626d 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -139,6 +139,21 @@ void clock_clear_callback(Clock *clk);
  */
 void clock_set_source(Clock *clk, Clock *src);
 
+/**
+ * clock_has_source:
+ * @clk: the clock
+ *
+ * Returns true if the clock has a source clock connected to it.
+ * This is useful for devices which have input clocks which must
+ * be connected by the board/SoC code which creates them. The
+ * device code can use this to check in its realize method that
+ * the clock has been connected.
+ */
+static inline bool clock_has_source(const Clock *clk)
+{
+    return clk->source != NULL;
+}
+
 /**
  * clock_set:
  * @clk: the clock to initialize.
-- 
2.20.1


