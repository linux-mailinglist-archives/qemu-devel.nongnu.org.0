Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AB649555C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 21:22:37 +0100 (CET)
Received: from localhost ([::1]:42198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAdx6-0006LC-VJ
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 15:22:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAZBF-0007pv-DU
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:16:53 -0500
Received: from [2a00:1450:4864:20::32b] (port=53844
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAZBD-0003T5-LR
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:16:53 -0500
Received: by mail-wm1-x32b.google.com with SMTP id n8so12757457wmk.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 07:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dUP+xAeqwqhgnTkt7Pfw/iOMWfGPZPxV5IL8xzgDVz0=;
 b=G/QDk7j6SK0aygeX0/NWPq6ZS48SZn2xdwx4jOzKKBc5NCaDU5qkiEhjzdcm3veGOb
 X3cvNdDs8VuonPloXgUK6qPgIusJzBmW9XPPG7hSIMd+pydwSxGjtRreLN20Jqs3Q+7Z
 opLv1Xl5FZH0LjdTiN9+qdAZzR0DViiL3PDi5OaisoBig/GEN3Bl09XtxUizCrC7QNiC
 OLXiZWia/upq+B4iHHouApDPeAkJjOkQ9DZNmFn+hREaFN/usCtY+Qi/UqmSWStb9QmE
 MWR6Xt/BPdoZbmziC2tS+F4DKT0MdvqP2bRHzGakxzNQedVAJL/GHskqd82QwROrwLIG
 KHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dUP+xAeqwqhgnTkt7Pfw/iOMWfGPZPxV5IL8xzgDVz0=;
 b=waDJfyr+aGNb0CypdwIK1T/IWswTUXDFE/Js0DBtnRAgIYHWnvQg6hEbziW1tQJKNy
 TXCzTfjeAX43kJTgQchNQovdBLrfzOZF2xz45b8/YKwMt0+31GRIQjSMExZTgTTmMafg
 qqzooDtijiK8AEKS2hB3zC4nHYvA2fEkdX6VH51Q3eT0XtAz9HX828cIfjZCW6UsBeiG
 Z/kmHOIynb3L3+vCwFXgEPxovxTsO7+l/sc0uk2FldEwTICDzB2ED2s6ztUm/qr6LV4c
 mfZRx1K3TYBmgijMDIhfhbE2So/28Ec4VVAgX0qF+vQqJ/AfzWwlfDulmj41/YF2VxW3
 sHAg==
X-Gm-Message-State: AOAM531oEbsnmuUru70V7h67Z73W7oot3EAM9d4QZiM90duYqmbR0N0Z
 iblEyIlVs+flycLHP1lPxK5VXy988lGdig==
X-Google-Smtp-Source: ABdhPJwnb1WoxliAuHa+UPtHmUUmDIpPc1wLro4+yJmXLgX4oQHsDVJANaiwlJ4RzYJVXZNelIYBqg==
X-Received: by 2002:a05:600c:291:: with SMTP id
 17mr9291417wmk.123.1642691810003; 
 Thu, 20 Jan 2022 07:16:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w6sm1972079wmi.15.2022.01.20.07.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 07:16:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/char/exynos4210_uart: Fix crash on trying to load VM state
Date: Thu, 20 Jan 2022 15:16:48 +0000
Message-Id: <20220120151648.433736-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The exynos4210_uart_post_load() function assumes that it is passed
the Exynos4210UartState, but it has been attached to the
VMStateDescription for the Exynos4210UartFIFO type.  The result is a
SIGSEGV when attempting to load VM state for any machine type
including this device.

Fix the bug by attaching the post-load function to the VMSD for the
Exynos4210UartState.  This is the logical place for it, because the
actions it does relate to the entire UART state, not just the FIFO.

Thanks to the bug reporter @TrungNguyen1909 for the clear bug
description and the suggested fix.

Fixes: c9d3396d80fe7ece9b
   ("hw/char/exynos4210_uart: Implement post_load function")
Buglink: https://gitlab.com/qemu-project/qemu/-/issues/638
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/exynos4210_uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 80d401a3795..addcd59b028 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -628,7 +628,6 @@ static const VMStateDescription vmstate_exynos4210_uart_fifo = {
     .name = "exynos4210.uart.fifo",
     .version_id = 1,
     .minimum_version_id = 1,
-    .post_load = exynos4210_uart_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(sp, Exynos4210UartFIFO),
         VMSTATE_UINT32(rp, Exynos4210UartFIFO),
@@ -641,6 +640,7 @@ static const VMStateDescription vmstate_exynos4210_uart = {
     .name = "exynos4210.uart",
     .version_id = 1,
     .minimum_version_id = 1,
+    .post_load = exynos4210_uart_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_STRUCT(rx, Exynos4210UartState, 1,
                        vmstate_exynos4210_uart_fifo, Exynos4210UartFIFO),
-- 
2.25.1


