Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68400307515
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:46:54 +0100 (CET)
Received: from localhost ([::1]:42868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55lF-0006Yp-FD
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gT-00018l-Ie
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:41:59 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gO-000659-Fv
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:41:57 -0500
Received: by mail-wr1-x436.google.com with SMTP id 7so5082485wrz.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p7OK2Ltq3LcHT8jmiWMB0NuP9bP3FPom3Sa8lyw278I=;
 b=gCGquRP0Tq7iLV2+thH/SHMnbU0DmXPsCQFJBliQwiegVnuo+8SgdBKCRXffaVjgUz
 fguVSICbaKxF8x9apRR8SalcuuPmJGz1+mXPpyptKYSbKDx1IfNVghD1Yadia5WuM+6Q
 qzbRex3U8lZCMrU53+eeRKP+NpL2IrxVznCYpKsQE4a/pV97wVhU2MFbWS8RWGaPN/6K
 4cuQOaGiVgadLm+z+y7BN51sV87w0Ok5ggMNdWZNRSpz7Cdvmd2ROGGmFkH8dI+m255a
 9zs0/Wg6gu2EdT2qDW4hVwVpW+cHWU+hERhlwl85nlxJ7CGP2ptsJ/IhnRh2WacIFCPB
 kP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p7OK2Ltq3LcHT8jmiWMB0NuP9bP3FPom3Sa8lyw278I=;
 b=PNy0QSfFd8b9o6jEuoQHSbc/8MbhXrzxjAHhSJx+m2prIeGz07T5/llojqpVx1xycM
 f1fR3MTY3T5Zua0npmwE/H8FXUpDNEQ+wUuNCG6Nah+0Ul8BjumFO1fG9tXeWSwmamp5
 NJV+0LoAWduhspKVVRim1qB1FHto1Tzga6cq0CXUP82QG/ZYewMacqAYP8VQ7RVw6psw
 nc4aelXzeG9ITekM/437eBhJmTBFh8AfNZlugNL1olj9xSVR1netwzwwd3/KOu+EoNQM
 qYIssc0eysTGqw8vZhCkYoFIiZBnO8vPuozLotlAJ9Vt/uL8TXYNyshWsNp/fxwVHar9
 30BQ==
X-Gm-Message-State: AOAM533RQ2QAQ8OAZufGYIGSVA/dI8YTeYQQSQYuiVfPsorZOVl0ya7P
 uXwbUev9uf6XHJuMrDLzCbFhnA==
X-Google-Smtp-Source: ABdhPJy6oNQQQxS14IMy81JnTrzMLx0/UDgWLRdLNX/PGAsU1++7AzHVtmObWtn1mrQkQvatsgf06A==
X-Received: by 2002:a05:6000:1547:: with SMTP id
 7mr15910116wry.301.1611834110398; 
 Thu, 28 Jan 2021 03:41:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/25] clock: Add new clock_has_source() function
Date: Thu, 28 Jan 2021 11:41:22 +0000
Message-Id: <20210128114145.20536-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a function for checking whether a clock has a source.  This is
useful for devices which have input clocks that must be wired up by
the board as it allows them to fail in realize rather than ploughing
on with a zero-period clock.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


