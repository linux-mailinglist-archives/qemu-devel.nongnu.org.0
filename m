Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A797C699B07
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:15:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnI-0008Aq-U8; Thu, 16 Feb 2023 12:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnH-00087o-C7
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:39 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnF-0007o5-Op
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:39 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v30so1349747wrv.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AerA0OknWJqQzriuIbTWlCJrYfPW5ifmeAoCsYc7SKg=;
 b=r7mTDzJAcr6woh0tuC5Fyaoqma8R1LH4HCS1p2687KkooPJd1oC5Qg41Nn3KPrCqhG
 vEz2EPls7oDlINufY8cXzpXC+eKj+haQTah3gZzAHvFJJjhx7EQgPHMdO3/MRvjnA5if
 Y0VYIvT25jf1Ce+xFYgG6HfWU14olDNIeyozI0XMMKMgnUWs525Br5nhVSBFVQpP3pNZ
 049QtALXefa1Lhh5jU2UhO8QZ1QZuHOSxRjlYdGHcgZAHQ4yo5MdiIBQNPrQR3cMi1z5
 PLEnedjGrwlU9iJeldubASZn4LFHZvOAq+VNYkhInZBiPLaI4hQ8fbdEC92rPY2sH6JO
 XmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AerA0OknWJqQzriuIbTWlCJrYfPW5ifmeAoCsYc7SKg=;
 b=codBWHWa9TrBIbNMzLCwMRpPISXYaw2zn2Uzazk4G1rlcommk6a0ZH8DA+ucmYcM1C
 CijhpLtrBxLMX+u3iEFYH3A/v1U63oQ6ZTCed2djHY9QrUehyW83JEY9C2HACaTPuvgE
 xhDwp5sjU1FAhDMMFs1p7odjkI8tQer4MJCieHyMk1zZCK2bTZhPWkJ2Ciw6eQAI3f3k
 /Jh0HJGv+dNecNDxSNkUes7NhgM9fsMkyFndJiObz489Dh30kl0RczhcHDkgfIGDe2xa
 Y2UtCWrAapNoQfUCIZ2Lbfw0yMFC1EesKpei857IbdOXtOVxhd0uQWLlpLhu1PkIPVzu
 k8kw==
X-Gm-Message-State: AO0yUKXhQWrYgrHlrhMQUXVmRJfUcs18iLSH/lBt0BjpDwWIFG7DIi2C
 c9+SBstGDeM9AqiW1RJQRa20Jsdjc/xGNTzI
X-Google-Smtp-Source: AK7set8h7l2sgFxaRKW1sLcBOrBgbSyLrPQW1Gyv6uD3FWxq23TYIBFuK6LtzX39/HctGcp9/Qohqw==
X-Received: by 2002:adf:f2c1:0:b0:2c3:f0a6:43e3 with SMTP id
 d1-20020adff2c1000000b002c3f0a643e3mr5274081wrp.39.1676567497123; 
 Thu, 16 Feb 2023 09:11:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/30] hw/arm: Add missing XLNX_ZYNQMP_ARM -> USB_DWC3 Kconfig
 dependency
Date: Thu, 16 Feb 2023 17:11:07 +0000
Message-Id: <20230216171123.2518285-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Since commit acc0b8b05a when running the ZynqMP ZCU102 board with
a QEMU configured using --without-default-devices, we get:

  $ qemu-system-aarch64 -M xlnx-zcu102
  qemu-system-aarch64: missing object type 'usb_dwc3'
  Abort trap: 6

Fix by adding the missing Kconfig dependency.

Fixes: acc0b8b05a ("hw/arm/xlnx-zynqmp: Connect ZynqMP's USB controllers")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230216092327.2203-1-philmd@linaro.org
Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d157de9b8b..b5aed4aff56 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -389,6 +389,7 @@ config XLNX_ZYNQMP_ARM
     select XLNX_CSU_DMA
     select XLNX_ZYNQMP
     select XLNX_ZDMA
+    select USB_DWC3
 
 config XLNX_VERSAL
     bool
-- 
2.34.1


