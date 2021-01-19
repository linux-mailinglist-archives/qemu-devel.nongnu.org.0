Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9591A2FB63F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:10:02 +0100 (CET)
Received: from localhost ([::1]:55258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1qll-0002iM-K6
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1l1qeD-0006Uz-1r
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:02:14 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:42378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1l1qe4-0005vc-0I
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:02:12 -0500
Received: by mail-lj1-x233.google.com with SMTP id j3so2082102ljb.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xFkGVZT5LAaP1cSLjH/YT+DBh9Jxe/ABwDeVi+JdLe0=;
 b=gL5K9Zmt7ROthD+wyW1/UdrmagfT/iffRZXPpCvVJVOUugNdEzaoez1jUpy5XCKiMc
 nWWM0etmATYocwHh/BzWgDuvx0hRHy3961589LQ/qR/AUXy6x+uyHTRNGm1m7BmjkWV8
 lsBrF90bcySX+hgJlyt58MhSvZZ3upMsUR9Ibzhc7ypJ6tWPNDF+BKnNXk0uEEfd4ysu
 tqnc8ALtQ0Y4i0n+khXaOHGoRk+IgEA/qOmvqWSJuKWsvQuhJqIs9SrBT1nmleqa9SU9
 pZp/svZ+ALxsKwDVMJliBnnPNlc4SZGiJVTn8SHbhE0HX22ULs0Udm1ljlFnctJSLkg4
 qAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xFkGVZT5LAaP1cSLjH/YT+DBh9Jxe/ABwDeVi+JdLe0=;
 b=Ck2u1N5eQowURnRAkFki+s76C1XFfM2xryaT3EYyuxlrJLpx/Dd2WxLOSsxSsPpD9Z
 Uqixam3NkEtAz6uFcmhLWB34BVRDtKTFbHPvlbRVM6xUhQnlvXpcZEq7cUba+JPR+j/9
 cnEPRIi6cgJyiKbXUQsetBIqgBUup6MjYCkVdmNUTIQFdep0HknLmBAVMB6SmohxodY3
 g7U5/SdY2KwGEkS9RN51Oh3BhNWpGjOH2VKSRNOI/9yQiox9imiNJsVWzAV21OaF6jeR
 V+oWqKIGnarIYsOY5gd8gEJIvuMT9SIgOS3PcWjs4DDtKuABQ2P+mQrRIvXN11udchs4
 3jrQ==
X-Gm-Message-State: AOAM530Nh+VPkU4exq/NSWNo7E6errsyxt7vMkMMyTSup1E+uE9WA/P9
 2/Xc7JAo4Wxti+UZm1b1A+9jaH+OLcPq0g==
X-Google-Smtp-Source: ABdhPJxJpcU/+DY3qaI5Y3J0MckNDUExZO9j3RX/dE6Lil+8oDrZZU5dICGzpOe5JrFWonAaQAvaAg==
X-Received: by 2002:a2e:9410:: with SMTP id i16mr1798130ljh.183.1611061320229; 
 Tue, 19 Jan 2021 05:02:00 -0800 (PST)
Received: from localhost.localdomain (31-208-27-151.cust.bredband2.com.
 [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id e25sm2356745lfc.40.2021.01.19.05.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 05:01:59 -0800 (PST)
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	frasse.iglesias@gmail.com
Subject: [RFC PATCH v1 3/3] hw: ssi: xilinx_spi: Change to use
 ssi_txfifo_transfer
Date: Tue, 19 Jan 2021 14:01:55 +0100
Message-Id: <20210119130155.30194-4-frasse.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119130155.30194-1-frasse.iglesias@gmail.com>
References: <20210119130155.30194-1-frasse.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, alistair@alistair23.me,
 bin.meng@windriver.com, mreitz@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch changes the SPI controller to use the ssi_txfifo_transfer for
being able to support SPI flash commands requiring dummy clock cycles.

Signed-off-by: Francisco Iglesias <frasse.iglesias@gmail.com>
---
 hw/ssi/xilinx_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index 49ff275593..ae34cdc436 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -179,7 +179,7 @@ static void spi_flush_txfifo(XilinxSPI *s)
     while (!fifo8_is_empty(&s->tx_fifo)) {
         tx = (uint32_t)fifo8_pop(&s->tx_fifo);
         DB_PRINT("data tx:%x\n", tx);
-        rx = ssi_transfer(s->spi, tx);
+        rx = ssi_txfifo_transfer(s->spi, tx);
         DB_PRINT("data rx:%x\n", rx);
         if (fifo8_is_full(&s->rx_fifo)) {
             s->regs[R_IPISR] |= IRQ_DRR_OVERRUN;
-- 
2.20.1


