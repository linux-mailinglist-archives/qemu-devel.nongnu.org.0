Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD522FF3D7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:09:58 +0100 (CET)
Received: from localhost ([::1]:35086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fLB-0004uX-CG
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI1-0002AP-F3
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:06:41 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:32893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fHr-0005kk-G6
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:06:41 -0500
Received: by mail-wr1-x42f.google.com with SMTP id 7so2830908wrz.0
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=upN7NId7waDqdq/y54Hzrsu+F+aVKMHy5OMUTW9rDEw=;
 b=sn0dGRtex5P42T3hk2ht1eoYTF/07UWBYlpSpd3RZbe8zb9QSZ4BIdtMinLn+Uxt0o
 2bNlUqkjAroSzWDqS/6rvaOr93syDheLNOfwXaqpDFjyqAUzZMAx5n2I6Z77uZLuscUk
 79N2daVjLwtxNHbJDblLS2TpjR3w5P9KnUV5VPFKJrJQ7oAQiln3Sdny6I03xtjWfSO4
 t11S/3QGsYWV2BnugGlB8mLqViHSzPkgi6EKxlItt1LYZraJIecs90zfilH4+aWkuKq0
 I38sTjrCwRakEVEfu/kfI4s5wa9437NhcOlDxG/8ZT3UcBb3cHFFCxvMmYFYNVHbi3hw
 VNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=upN7NId7waDqdq/y54Hzrsu+F+aVKMHy5OMUTW9rDEw=;
 b=UfiEIhXYJWr4Sip5PRkV0/WRpbLj5c7dERpHdEAS8zjMbXRO8dE3SbM4aUQbUba67r
 xhF+DL2zPOwvm6mn81ut3RCkjqVojR81t8vIKagJrVBPeVTMhu5Vcwf4kGXPIDk0kPm5
 UUouPnUUEic0ita9AYwqW0IvMhsbnBrmZXV27NjNGAGLg/IEpBOtDIjI/5nglWUB5Gx5
 Hubq6hMiL1y7CVivsvhQdeGovItEsKhIUw5Jxns0jmhaHiplqTPsAFFYkHRLZCtjce0Y
 rHAoEKfZXNScmIV2VQTKlPXF28x4L+PEQK+EUJul17Hhf36kuSGU1J4QziT4J6FF8DMi
 fgjg==
X-Gm-Message-State: AOAM532nr3iw5a46/oo3sX6go6mXrbNHvjx6tzpl8RjpU3g+XCxxDJv7
 AX+P3EXHXb6GlV7ZFErjdqgTDQ==
X-Google-Smtp-Source: ABdhPJyYWPeD96pTaj0aV0nL8Ev8OprHynYHbCPzOpziSnqAewyJM8u5fh0paz6SPgIOA/xFqA9W+g==
X-Received: by 2002:adf:cc81:: with SMTP id p1mr858184wrj.339.1611255987447;
 Thu, 21 Jan 2021 11:06:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/25] clock: Add new clock_has_source() function
Date: Thu, 21 Jan 2021 19:05:59 +0000
Message-Id: <20210121190622.22000-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a function for checking whether a clock has a source.  This is
useful for devices which have input clocks that must be wired up by
the board as it allows them to fail in realize rather than ploughing
on with a zero-period clock.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


