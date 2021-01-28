Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F131B306BB8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 04:38:07 +0100 (CET)
Received: from localhost ([::1]:52722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4y8E-0000ae-IC
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 22:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l4y7B-00007u-NZ
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 22:37:01 -0500
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:38075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l4y79-00011z-UM
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 22:37:01 -0500
Received: by mail-il1-x12b.google.com with SMTP id a1so3976175ilr.5
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 19:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=modwiz-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2TvIvkeqlt7iKDLohob+JM0A4aIwF+QFrj6135CGq/o=;
 b=ezFEoVJlu1HONc/2FSW4Q07HerF6LF49Vt9zLypK7idXSS7Oc7Xu0o4cg/Wt/3+v63
 ic+bI2XVf6nreJfLDJFpXMESncFt+UAYOmHbt9Spxoyj+gj5xVsBQdAKFoSJntvA2UbV
 uY+3zMMFGzkXn4Oz49q6xwSoo8MXhgb3xNwKTkkpavxijm2OJoYI42utYpr3RLJQBBkG
 ligCLFGfPCWBX7VSvSt/2D3jsVfRyMo02UicHdKkiK96oZhMnEhRaI7dtrHOVugx5xlF
 6gTzf9thiByJzpzV/gRgC5gVjK3f2MAbcU63DVU/RoHGVGyvVuwEqha8GnKo6DQEgZbp
 O2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2TvIvkeqlt7iKDLohob+JM0A4aIwF+QFrj6135CGq/o=;
 b=pY3wP2hsJRGdw1U4ySykpTvtkeYsmQux7UTY6+9cxaENIIqwll8gu6gfpEI7hI8SCb
 i6W8FP5IW84Ei5Yze4X+Zu7vrb/nrnen/2m32n4LCDwDNwGGbkOJLXGV3Q6kroi58w0t
 LvcM5UCZkhSwCEln6xwXbHoHTvG83M/jWg1qteJsEPJtY0NLZoxeFbk2Yp/MmWcYqY6t
 arBqHoWszWvvTMk4t0qHipo41E54ForMypFstT2TxlhPMSkWrfpe9q8Rtm25TCcKWWdw
 dz9GoTKr8XwMd9VazkLpy/WnpaNhkTpPCqJ/GzRyOBjMPXkRohYVC3YwmKU+FW5zno3T
 ZmnQ==
X-Gm-Message-State: AOAM533gGzq7qRz/cKrfrEqhASFsxURxXzmieHogTI82AtAGrxQ7QRAa
 QG0svbnVaufukeGh7DKcaUX+pg==
X-Google-Smtp-Source: ABdhPJyRuXKVO4Nfhs0C7249adNGpLhnWPTYeYIQz6xBtvA22uFRfobeQsx+wTdO9v31djWbO11xrQ==
X-Received: by 2002:a92:bbcb:: with SMTP id x72mr10897395ilk.104.1611805018277; 
 Wed, 27 Jan 2021 19:36:58 -0800 (PST)
Received: from localhost.localdomain (c-98-223-182-45.hsd1.il.comcast.net.
 [98.223.182.45])
 by smtp.gmail.com with ESMTPSA id y1sm1984027ioj.32.2021.01.27.19.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 19:36:57 -0800 (PST)
From: Iris Johnson <iris@modwiz.com>
To: Iris Johnson <iris@modwiz.com>
Subject: [PATCH] hw/char/exynos4210_uart: Fix buffer size reporting with FIFO
 disabled
Date: Thu, 28 Jan 2021 03:36:55 +0000
Message-Id: <20210128033655.1029577-1-iris@modwiz.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=iris@modwiz.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Exynos" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the Exynos 4210 UART code always reports available FIFO space
when the backend checks for buffer space. When the FIFO is disabled this
is behavior causes the backend chardev code to replace the data before the
guest can read it.

This patch changes adds the logic to report the capacity properly when the
FIFO is not being used.

Buglink: https://bugs.launchpad.net/qemu/+bug/1913344
Signed-off-by: Iris Johnson <iris@modwiz.com>
---
 hw/char/exynos4210_uart.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 6361df2ad3..9b21d201b3 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -553,7 +553,11 @@ static int exynos4210_uart_can_receive(void *opaque)
 {
     Exynos4210UartState *s = (Exynos4210UartState *)opaque;
 
-    return fifo_empty_elements_number(&s->rx);
+    if (s->reg[I_(UFCON)] & UFCON_FIFO_ENABLE) {
+        return fifo_empty_elements_number(&s->rx);
+    } else {
+        return !(s->reg[I_(UTRSTAT)] & UTRSTAT_Rx_BUFFER_DATA_READY);
+    }
 }
 
 static void exynos4210_uart_receive(void *opaque, const uint8_t *buf, int size)
-- 
2.25.1


