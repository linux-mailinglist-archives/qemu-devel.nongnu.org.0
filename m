Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 472604098DF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:22:42 +0200 (CEST)
Received: from localhost ([::1]:47678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPojB-0007YV-AH
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYj-0000l5-SO
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:53 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYi-00084d-5m
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:53 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w29so14783089wra.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8Qm2M6BsrBGMW4YGB9hfcLdqesFtIB+T41YhjY71TkM=;
 b=CUR3D0GGzatDLAWTLVswUS7Q7Gy7SYfAeyCdSLwYUNFaR0fggQOv/jlO9FI+gzoZ38
 w6h3qRdoAXM540eSLqqMB03g/qUwh/+jyYelHWozkt02DgWRjHxqIq7U8wKNQZn+huXb
 +ckaNQneUNWxjV/vSPNxJrarBqKxW0dk9uLBm9e7nGReAPIMT2xKSXFzi/1hSgJ3uONm
 xw3HYa8v0UYHaYlWSzyaD50PJvncP86OXvqKFR4N2kqFI7Qz41UUauJzsF3uEe2rs/Us
 c8K4zRLLTn//Nf1CISd1K35UW/SDJDOxCeyJbQ2ksNL3wiE0OsZXAnL/2WPVMdV8Efzh
 5YHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Qm2M6BsrBGMW4YGB9hfcLdqesFtIB+T41YhjY71TkM=;
 b=0sAY2sg1Twy29DKc0r9K5MA4XV/WcpgV9TIRyFVcgjZfzsO0XdZLhAJA92GPspeRrp
 YRFM2knArJAvI3PfnRcI/qRDqUMFdVlGxOzpHvWXZHGsTDEGqYJl0jqB3wcbTvByTyMP
 HBtajPzDNIN4WjxD19I3RAQ4AhUVCyQ4wMn8L0pLa0gqZiVr1OnLqHk5INaZiXSW4o+R
 e7Gou5+rSQuQhPSG6VbiHMMu9sXl5tzC9Bl2wp1aTnUtvSF7dLQaBTYC5+OA1WyYpmp8
 zQbETmvJrg8btwVrtbCGAxYPW1v8lUoKfQiHN2vEswLswXzn1otGEWfh3kvAt6YrK1nm
 fELQ==
X-Gm-Message-State: AOAM532eiRI3SVdPIn22U9PmSXeV6paZNbnI+SxIF5oSpDXJlf357pxX
 F2K8giAj3B54LRrLG8CNG5pBRCu6LA//Pw==
X-Google-Smtp-Source: ABdhPJw0sjiNK7Z/Lr4sZ3//UJt5urOvceQNVHXD8Z0FQOQ7ChpP3dgmYV4HxJw+dtK37EJ1yvWH7g==
X-Received: by 2002:adf:ce85:: with SMTP id r5mr13560399wrn.323.1631549510737; 
 Mon, 13 Sep 2021 09:11:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.11.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:11:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/23] hw/char: cadence_uart: Log a guest error when device is
 unclocked or in reset
Date: Mon, 13 Sep 2021 17:11:27 +0100
Message-Id: <20210913161144.12347-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Bin Meng <bmeng.cn@gmail.com>

We've got SW that expects FSBL (Bootlooader) to setup clocks and
resets. It's quite common that users run that SW on QEMU without
FSBL (FSBL typically requires the Xilinx tools installed). That's
fine, since users can stil use -device loader to enable clocks etc.

To help folks understand what's going, a log (guest-error) message
would be helpful here. In particular with the serial port since
things will go very quiet if they get things wrong.

Suggested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210901124521.30599-7-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/cadence_uart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 5f5a4645ac0..c069a30842e 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -240,6 +240,8 @@ static int uart_can_receive(void *opaque)
 
     /* ignore characters when unclocked or in reset */
     if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
+                      __func__);
         return 0;
     }
 
@@ -376,6 +378,8 @@ static void uart_event(void *opaque, QEMUChrEvent event)
 
     /* ignore characters when unclocked or in reset */
     if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
+                      __func__);
         return;
     }
 
@@ -413,6 +417,8 @@ static MemTxResult uart_write(void *opaque, hwaddr offset,
 
     /* ignore access when unclocked or in reset */
     if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
+                      __func__);
         return MEMTX_ERROR;
     }
 
@@ -478,6 +484,8 @@ static MemTxResult uart_read(void *opaque, hwaddr offset,
 
     /* ignore access when unclocked or in reset */
     if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
+                      __func__);
         return MEMTX_ERROR;
     }
 
-- 
2.20.1


