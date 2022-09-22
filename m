Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9125E699F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:28:52 +0200 (CEST)
Received: from localhost ([::1]:39958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQ0J-0005ap-50
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAu-00029y-42
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:47 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAr-0005Nr-9e
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id g3so16366022wrq.13
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=WMTybDGJFpIIsx2/QiH+5Roxvq0KadU/gkG/e5cvyQc=;
 b=yKcIDV0QAeEV328ZjxOTTVxv7Qku8ukwc2S8ZbybWBYqo+9LJaDoYbpAbyW3tNvk6o
 wAeBWGluEfUVM/LDV8SWtk7zhfqdY2zm8RIr4GTJt4JbuOcrhOU+YItFdueWIoN/1bpu
 8mvtce9e5mW5AYPYHTmDFqF3J5oeaNhw3ZbGDx0Pb+h3Lgx2rg0LPcZufFwp00YGnM2C
 2IviZvmxgXlQE+1C0x3iFHc9OMdBD1NbDTlyn3mLoDNvQAJ9/kFK8BgK5/D3fdlQQEBC
 S48KIdEnMV7U0gEzoHrKxO2KC88H9+ba7A7eb+U5AINUxccC0kvt44nY6Be4PTD+ZWWL
 cUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WMTybDGJFpIIsx2/QiH+5Roxvq0KadU/gkG/e5cvyQc=;
 b=pcBvFePfxNBPyQQddIAyrYp5PEJXlQ2IC2UxQ3Ekyx3r6V21Q/ydL74kJJZv/I2oGa
 jri/X0Zi3WjCMUbSCDAEHwA6RZKi7o3ut6rjm3QkIqgy0z3YGY8oWkphykHpukdItfFr
 pSXmJysRXHn10xqpwbhGAZUnyeCwYOgeEkIDivA1vytrcmtaXrfq1RErdN0F89qr5l+H
 kHbQ/4BGjLBTGGYVg1G7cT352qQKQWy5BQjG+3lkwKyK6j5xNsB+iU+44n/wpV8hCDCG
 l1kwG9GJ34BbaKESkUkxthTInlXLGxTRvFCRp/uhALcs7Ks1qM3Vjstd+6+f05gVmh+W
 I47A==
X-Gm-Message-State: ACrzQf057nb1oYfqpWmuF+6dF9C5LvcBeKGqCMFlv4ZJlpIVE0QvQ3sM
 zAlA+8w/PD8LXeowRl2RjZIO5zUU1dxoWA==
X-Google-Smtp-Source: AMsMyM7ub6JhuJ8A11oXagb3hXRkLkcmwN1oUDOHMaOYL7ZMHUP18RX0qF6GYqOMLjqAyc/L03MjjQ==
X-Received: by 2002:adf:e0c3:0:b0:226:d598:85ee with SMTP id
 m3-20020adfe0c3000000b00226d59885eemr2535169wri.589.1663864538783; 
 Thu, 22 Sep 2022 09:35:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/39] hw/net/can: fix Xilinx ZynqMP CAN RX FIFO logic
Date: Thu, 22 Sep 2022 17:34:58 +0100
Message-Id: <20220922163536.1096175-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anton Kochkov <anton.kochkov@proton.me>

For consistency, function "update_rx_fifo()" should use the RX FIFO
register field names, not the TX FIFO ones, even if they refer to the
same bit positions in the register.

Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-id: 20220817141754.2105981-1-anton.kochkov@proton.me
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1123
[PMM: tweaked commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/can/xlnx-zynqmp-can.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
index 82ac48cee24..e93e6c5e194 100644
--- a/hw/net/can/xlnx-zynqmp-can.c
+++ b/hw/net/can/xlnx-zynqmp-can.c
@@ -696,30 +696,30 @@ static void update_rx_fifo(XlnxZynqMPCANState *s, const qemu_can_frame *frame)
                                                timestamp));
 
             /* First 32 bit of the data. */
-            fifo32_push(&s->rx_fifo, deposit32(0, R_TXFIFO_DATA1_DB3_SHIFT,
-                                               R_TXFIFO_DATA1_DB3_LENGTH,
+            fifo32_push(&s->rx_fifo, deposit32(0, R_RXFIFO_DATA1_DB3_SHIFT,
+                                               R_RXFIFO_DATA1_DB3_LENGTH,
                                                frame->data[0]) |
-                                     deposit32(0, R_TXFIFO_DATA1_DB2_SHIFT,
-                                               R_TXFIFO_DATA1_DB2_LENGTH,
+                                     deposit32(0, R_RXFIFO_DATA1_DB2_SHIFT,
+                                               R_RXFIFO_DATA1_DB2_LENGTH,
                                                frame->data[1]) |
-                                     deposit32(0, R_TXFIFO_DATA1_DB1_SHIFT,
-                                               R_TXFIFO_DATA1_DB1_LENGTH,
+                                     deposit32(0, R_RXFIFO_DATA1_DB1_SHIFT,
+                                               R_RXFIFO_DATA1_DB1_LENGTH,
                                                frame->data[2]) |
-                                     deposit32(0, R_TXFIFO_DATA1_DB0_SHIFT,
-                                               R_TXFIFO_DATA1_DB0_LENGTH,
+                                     deposit32(0, R_RXFIFO_DATA1_DB0_SHIFT,
+                                               R_RXFIFO_DATA1_DB0_LENGTH,
                                                frame->data[3]));
             /* Last 32 bit of the data. */
-            fifo32_push(&s->rx_fifo, deposit32(0, R_TXFIFO_DATA2_DB7_SHIFT,
-                                               R_TXFIFO_DATA2_DB7_LENGTH,
+            fifo32_push(&s->rx_fifo, deposit32(0, R_RXFIFO_DATA2_DB7_SHIFT,
+                                               R_RXFIFO_DATA2_DB7_LENGTH,
                                                frame->data[4]) |
-                                     deposit32(0, R_TXFIFO_DATA2_DB6_SHIFT,
-                                               R_TXFIFO_DATA2_DB6_LENGTH,
+                                     deposit32(0, R_RXFIFO_DATA2_DB6_SHIFT,
+                                               R_RXFIFO_DATA2_DB6_LENGTH,
                                                frame->data[5]) |
-                                     deposit32(0, R_TXFIFO_DATA2_DB5_SHIFT,
-                                               R_TXFIFO_DATA2_DB5_LENGTH,
+                                     deposit32(0, R_RXFIFO_DATA2_DB5_SHIFT,
+                                               R_RXFIFO_DATA2_DB5_LENGTH,
                                                frame->data[6]) |
-                                     deposit32(0, R_TXFIFO_DATA2_DB4_SHIFT,
-                                               R_TXFIFO_DATA2_DB4_LENGTH,
+                                     deposit32(0, R_RXFIFO_DATA2_DB4_SHIFT,
+                                               R_RXFIFO_DATA2_DB4_LENGTH,
                                                frame->data[7]));
 
             ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 1);
-- 
2.25.1


