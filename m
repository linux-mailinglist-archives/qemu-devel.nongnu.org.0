Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB6530C917
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:10:23 +0100 (CET)
Received: from localhost ([::1]:41706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7086-0003RE-JI
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztw-0005OI-TN
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:44 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztc-0002Ej-Io
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:44 -0500
Received: by mail-wr1-x435.google.com with SMTP id m13so21434596wro.12
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qJW4Rh2q+aOMI66Q4KJNJOGwXK6nRxykiRTqLJ1IjHU=;
 b=pDx+H2/U4a9YnkYvzMVREYJEU4rKX6s7SA1YEscfzkBdNZluUanuEsHt6S48YzMIMl
 YdN/2emV0O+s0/DDwxkClwlflB7R5mTYKa2y4I2X3mGdajVhPvuZvgW363uh6CtrnR6s
 XFnUowsWd5wMQaK+6Jlegny2KUqyC35HZ77ze4F8oRgd4EQz6siD7+Rht/OEqB7uFn7f
 40sE3taUyByqoPP9iIsrN04lfDs5CgsmeKmWeRnBegzx1b0e2Ug/Ze68ezDm2tQy1x6c
 qGq28fUk+WEgDu8VywjokDVKk033PRiObgMMfVuZQY1WCgEie2yzQdkdO+OTdxlhgffL
 k7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qJW4Rh2q+aOMI66Q4KJNJOGwXK6nRxykiRTqLJ1IjHU=;
 b=IE/7KCnXnLOWtQOlcQ8JdDAUOYkoDjXV7ISAtyH+tFYU9AITyt+4gNnFl7IdUAc80N
 VF9pIAsozRsq4iL8UIUpnqJqLotEUNd2DaH9bFZlt8Eo0Q++8x2vEeTxSAo4t0ID2fVb
 D/Mj5GY1lBaYQuEhpL51yIgViQ+ZDnvv0tV3nM1blztVNJ/Z6wPnoQG/Mxvx/BhoMQa+
 pXk+FxtTB5u4yrLuCasCX8zo/Hlsb77Alcl30NPrg5/NyWkMi+PQaMlZ+397zlWakhsj
 wXWNq4Nyk37pFe9Zvi6rHMtFdyyR+iLPgTOn+5AN5DYbTA86/rnQlipZgcv5AKPkF1Mn
 wn4g==
X-Gm-Message-State: AOAM5303FIYLMx7ePOFDPzXpq9Kc+hei8hYCvJVXKIgNrm2J1TdcrV/6
 j3VRhVkhgLSS6jVEAn+RuCmBfOzXGJ4yrQ==
X-Google-Smtp-Source: ABdhPJyCS/MHBvvXfahQAwrT5foNJRf06uv8x4MkwYKQrW3obH4HMYkcRXhqT4Fdxn6kTggnvlZJFw==
X-Received: by 2002:a5d:4dd0:: with SMTP id f16mr24861933wru.304.1612288521868; 
 Tue, 02 Feb 2021 09:55:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/21] hw/char/exynos4210_uart: Fix buffer size reporting with
 FIFO disabled
Date: Tue,  2 Feb 2021 17:54:58 +0000
Message-Id: <20210202175517.28729-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

From: Iris Johnson <iris@modwiz.com>

Currently the Exynos 4210 UART code always reports available FIFO space
when the backend checks for buffer space. When the FIFO is disabled this
is behavior causes the backend chardev code to replace the data before the
guest can read it.

This patch changes adds the logic to report the capacity properly when the
FIFO is not being used.

Buglink: https://bugs.launchpad.net/qemu/+bug/1913344
Signed-off-by: Iris Johnson <iris@modwiz.com>
Message-id: 20210128033655.1029577-1-iris@modwiz.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/exynos4210_uart.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 6361df2ad3c..9b21d201b34 100644
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
2.20.1


