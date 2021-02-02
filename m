Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A3530C8E1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:04:33 +0100 (CET)
Received: from localhost ([::1]:56330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l702S-0005Hr-6b
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztq-0005Mj-6c
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:38 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztc-0002Ev-DM
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:36 -0500
Received: by mail-wr1-x429.google.com with SMTP id l12so21439273wry.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PYXcmESVfoHGpmKd9uk67sd4tJIXB63SS0T0aA9+ufE=;
 b=af05IcL22bqjW1FlDCb5i6J2yVgnhiFzSCwFx97Ij9ottmSyTa7e0nyx/q14HW5MfU
 WJqyadfdlCvfGiudmv2FNYurC5AjnrXM380hgFgylOr41kfJdylC8RrJtzehbezCkfQX
 RIQu2/2OzmhdcLIIY2NBMn6V/+1eqN061E1JQQ/YcT0ToQ89bLvS8dBZQgelpbhyvCxX
 /PVpdrI0wAvby4EZzBXLaSPEtyus8gRtKcyjjIPidaT/viAplqqrrcosnV/Hd6uAzTTF
 6PnjqaNldrWuR61dMSL/3muPSHX4W/wDOcmod5+nMW/XZJqwC2VEsuui8ne8VfP1lbon
 r5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PYXcmESVfoHGpmKd9uk67sd4tJIXB63SS0T0aA9+ufE=;
 b=Q65/XOpOXIurMFimp5+xiFXaPi13LcCecu82NqTxmgJ14DPk1VmTF6LOJCzunEvvTo
 0bxSiyllmhqFUhb48JbeJAd0w6VhKbPmwNb5nibrB3QcnEn66D496U/Zj1LOAB/Tk2wJ
 icOKrMG9cDMtwA4rsV9Og7pMbAZYXcrIuwuI+5BiLFI4xxRB66PHJF5uMu15tG+RgtuN
 FzkR9cITkpwVHoWuyWQ5RzEZH+jayoY4CgEYuVj4xiVMwm1Ny5aBXZcOCywc4AyCetAX
 waAlf5sCd9xpXZGMp9I878iiGcO9UTT9opQNoMS8Ph0nXEfnvKw875zJDgi6HkRCmpfx
 KLhg==
X-Gm-Message-State: AOAM532JQR4AS+QLoJnLKaYRVomyWPUR4c0/+aAY4caSvg08r9p5B7Dc
 zYYJYbJHCBa2k0ah3zaFlb4OU/a+6gjNTQ==
X-Google-Smtp-Source: ABdhPJybarTjnxPh+95jtdr1PwrouEXY3UjgfNJTADooBQxdvLj0lfycM5aqlGHSv3sKzdn0Jj243Q==
X-Received: by 2002:a05:6000:1245:: with SMTP id
 j5mr12916554wrx.333.1612288522840; 
 Tue, 02 Feb 2021 09:55:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/21] hw/char/exynos4210_uart: Fix missing call to report
 ready for input
Date: Tue,  2 Feb 2021 17:54:59 +0000
Message-Id: <20210202175517.28729-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Iris Johnson <iris@modwiz.com>

When the frontend device has no space for a read the fd is removed
from polling to allow time for the guest to read and clear the buffer.
Without the call to qemu_chr_fe_accept_input(), the poll will not be
broken out of when the guest has cleared the buffer causing significant
IO delays that get worse with smaller buffers.

Buglink: https://bugs.launchpad.net/qemu/+bug/1913341
Signed-off-by: Iris Johnson <iris@modwiz.com>
Message-id: 20210130184016.1787097-1-iris@modwiz.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/exynos4210_uart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 9b21d201b34..80d401a3795 100644
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
2.20.1


