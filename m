Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E1F309795
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 19:44:23 +0100 (CET)
Received: from localhost ([::1]:48560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5vEM-0001aY-6r
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 13:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l5vCp-000155-Ap
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 13:42:47 -0500
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:46908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l5vCh-0006WD-8O
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 13:42:47 -0500
Received: by mail-io1-xd32.google.com with SMTP id u8so7894931ior.13
 for <qemu-devel@nongnu.org>; Sat, 30 Jan 2021 10:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=modwiz-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7xN3NWujt0MZ4nsv093+6CZQ4eRij5kiYXwtNg1RWPc=;
 b=PdIoDgAQ4rA9KCjUsfE2HvoJ9FJv9RY2tPeFVbHmrrMr74SihQhLuOq8TxWCNRidAD
 zhu+nPVScrV4mM+U+uARN5A6cTAQxXwMcq1SONj70pVGwk6yg2hX/HBWGXGtX1m5dnHo
 PkCwIn/8DYEZflLO5FPgLBdN2UUU+TQ/ydvhJ+sMauskJE6qLaMhedKGmGPnxPpdfCf8
 mYsClvyvH9NdiDtDfcF1ZJLuvRYBYrJB/nz93L7o7pPRR4xgd9IFVavGmfjizQUXVDMm
 HdDuTdg/8M1ruNJtUXstxNJX+JpNqtRJslCnjImizdgJZCWz9lH2Yfz3dKbkA/mh5zj0
 evnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7xN3NWujt0MZ4nsv093+6CZQ4eRij5kiYXwtNg1RWPc=;
 b=N35xndsZXaIJcX66SDy6uyO6RKVC1Sa0vjc2mt0FEiMxu98Tx0nEss43nMe6gMK1sn
 hTlrCd3t41kfL8wr9TqyhqDUvTG+dlBdiXavM2WLg1FbL4uKQM2BbbwflVH0bBvSqeqR
 f1qAgVceIjnrdhI9a3iEadhJMGyJ76LWHymnlTd/vwR9++uI0ugl2ESto2MS+uDiB5tR
 h9uJDdIATXEnuvjCehPkuWDGs1YZT4bFX1MF8ZR5ZSjZcqe95gJLkD1HCHISPrsWNPb1
 7q5y7vy9NR2DmcC1uqYctzKHv/gxuI+JSkGRiDXcaWmPaDIBO1+esxspfyJxjH9Mj8HL
 lwPA==
X-Gm-Message-State: AOAM5306ZAa0IrbuIaIXHI+vGPqZsO+uKA3JkX+2YvktHva8GGIU9DzG
 y3/XOhqQE9h4e6tXLgQngk3Xsw==
X-Google-Smtp-Source: ABdhPJxfE9/GMp7qpg8557Tvt8pHTUEI+jvAkCa2ybrT5cz7viIb7kkD+2mTBlObYL2zs8WOZkhhYA==
X-Received: by 2002:a05:6638:138e:: with SMTP id
 w14mr8281564jad.98.1612032153675; 
 Sat, 30 Jan 2021 10:42:33 -0800 (PST)
Received: from localhost.localdomain (c-98-223-182-45.hsd1.il.comcast.net.
 [98.223.182.45])
 by smtp.gmail.com with ESMTPSA id n193sm5662253iod.21.2021.01.30.10.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 10:42:33 -0800 (PST)
From: Iris Johnson <iris@modwiz.com>
To: 
Subject: [PATCH] hw/char/exynos4210_uart: Fix missing call to report ready for
 input
Date: Sat, 30 Jan 2021 18:40:17 +0000
Message-Id: <20210130184016.1787097-1-iris@modwiz.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=iris@modwiz.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Iris Johnson <iris@modwiz.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Exynos" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the frontend device has no space for a read the fd is removed
from polling to allow time for the guest to read and clear the buffer.
Without the call to qemu_chr_fe_accept_input(), the poll will not be
broken out of when the guest has cleared the buffer causing significant
IO delays that get worse with smaller buffers.

Buglink: https://bugs.launchpad.net/qemu/+bug/1913341
Signed-off-by: Iris Johnson <iris@modwiz.com>
---
 hw/char/exynos4210_uart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 6361df2ad3..51ba862d0b 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -519,6 +519,7 @@ static uint64_t exynos4210_uart_read(void *opaque, hwaddr offset,
             s->reg[I_(UTRSTAT)] &= ~UTRSTAT_Rx_BUFFER_DATA_READY;
             res = s->reg[I_(URXH)];
         }
+        qemu_chr_fe_accept_input(&s->chr);
         exynos4210_uart_update_dmabusy(s);
         trace_exynos_uart_read(s->channel, offset,
                                exynos4210_uart_regname(offset), res);
-- 
2.25.1


