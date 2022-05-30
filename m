Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FCE5385FD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:18:51 +0200 (CEST)
Received: from localhost ([::1]:57344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvi6U-0006MR-2k
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvI-0002dr-NG
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:20 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvG-0007Aa-53
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:15 -0400
Received: by mail-wr1-x430.google.com with SMTP id p10so15256837wrg.12
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lKRJrIgeaUwwXJZeQ6utUWAPa0M3UoWr4zCBZlSuKrQ=;
 b=nnGJUoR1pe2AtKF4AS+uHIpw3GvqBm7CcyZQ7HecJvP5Tlgwq+NzJk2BjJDNZuNo6J
 czMpOxWFymuvMV8VOrskc7GEH5hECZy1Rj8nMjNIyGPlBZOPspmc5lMW4rn47ijVr0QW
 FKpVRx7Vnh9vlTB5XXa7Anz8Z9Pb3qvvSAjXa975DxRUzW4S49sVUNU7KbRHqg4DOtmF
 iI5AmF5MpE9kMXMSSYSugJSXx+QnX+fMw8TpdeRYeFVy+3X3cnCvfP5SJfrbep6QZfjN
 9VM3+McwbOpzZdATkJGPeqrxj7UCKPfOnRQlJq6fGFe9qqLpgv/kHz7QAhxXTj3XH2Ox
 CMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lKRJrIgeaUwwXJZeQ6utUWAPa0M3UoWr4zCBZlSuKrQ=;
 b=WgG35KXKgpXro9jyrRNEvQBaPcYt80zFxB4xbN/vJY7348ZkCnI65whmOJi68LvG2s
 lvRCq7yTlZlcQNH3tyjyIZemYhIKKFc0onFMuRWqeeYlLR6KGDYZaBQBWsMhmWyjiVKL
 IWawKnwMNHZucyvRBJDIuP5ZQ1udFPcBdaxGL3szaW1CXB4QSkRPmpYIf5mvRowsywIk
 epCc4hzaUYHzwfrptVpq0ZG8Es3UMe8QEBw0mnjp+TL/aCsef9FexqP1XpZFFGIExWge
 K4pI6uHEAWEEK23pKY1CAbxiZQUpNbZiAUmkB4uIp+eABOHjq7PjrRYI+TJ+ekq3Vd6Q
 p1ww==
X-Gm-Message-State: AOAM533eVlUvcogDbrnbwpCfzYeT/v43hZHA2FTogwp8nejfHOXUoJsg
 1cz0YeIoaTNt8WwJU8s31rMJ0rZNzt6xCA==
X-Google-Smtp-Source: ABdhPJxCTBETsum1AOL/Ay90ZyuunO+7KbiiE/fyk73ocQUV7/zSWakVXABYq2ifaEXvQfLaIS/Luw==
X-Received: by 2002:a5d:6c66:0:b0:20f:86f3:ea05 with SMTP id
 r6-20020a5d6c66000000b0020f86f3ea05mr40690832wrz.154.1653926832550; 
 Mon, 30 May 2022 09:07:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 003/117] hw/sd/allwinner-sdhost: report FIFO water level as 1
 when data ready
Date: Mon, 30 May 2022 17:05:14 +0100
Message-Id: <20220530160708.726466-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Icenowy Zheng <uwu@icenowy.me>

U-Boot queries the FIFO water level to reduce checking status register
when doing PIO SD card operation.

Report a FIFO water level of 1 when data is ready, to prevent the code
from trying to read 0 words from the FIFO each time.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Message-id: 20220520124200.2112699-1-uwu@icenowy.me
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/allwinner-sdhost.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index 041e45c6804..455d6eabf64 100644
--- a/hw/sd/allwinner-sdhost.c
+++ b/hw/sd/allwinner-sdhost.c
@@ -114,7 +114,9 @@ enum {
 };
 
 enum {
+    SD_STAR_FIFO_EMPTY      = (1 << 2),
     SD_STAR_CARD_PRESENT    = (1 << 8),
+    SD_STAR_FIFO_LEVEL_1    = (1 << 17),
 };
 
 enum {
@@ -467,6 +469,11 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
         break;
     case REG_SD_STAR:      /* Status */
         res = s->status;
+        if (sdbus_data_ready(&s->sdbus)) {
+            res |= SD_STAR_FIFO_LEVEL_1;
+        } else {
+            res |= SD_STAR_FIFO_EMPTY;
+        }
         break;
     case REG_SD_FWLR:      /* FIFO Water Level */
         res = s->fifo_wlevel;
-- 
2.25.1


