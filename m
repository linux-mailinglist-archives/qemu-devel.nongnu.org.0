Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7477045624C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 19:24:10 +0100 (CET)
Received: from localhost ([::1]:58334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnm4v-0007Gd-BZ
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 13:24:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mnlzn-0002FO-3H
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 13:18:52 -0500
Received: from [2001:41c9:1:41f::167] (port=45160
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mnlzl-0006SQ-PP
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 13:18:50 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mnlza-0001qH-H5; Thu, 18 Nov 2021 18:18:42 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Thu, 18 Nov 2021 18:18:34 +0000
Message-Id: <20211118181835.18497-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211118181835.18497-1-mark.cave-ayland@ilande.co.uk>
References: <20211118181835.18497-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH for-6.2 1/2] escc: always set STATUS_TXEMPTY in R_STATUS on
 device reset
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "Transmit Interrupts and Transmit Buffer Empty Bit" section of the ESCC
datasheet states the following about the STATUS_TXEMPTY bit: "After a hardware
reset (including a hardware reset by software), or a channel reset, this bit
is set to 1".

Update escc_reset() to set the STATUS_TXEMPTY bit in the R_STATUS register
on device reset as described which fixes a regression whereby the Sun PROM
checks this bit early on startup and gets stuck in an infinite loop if it is
not set.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/char/escc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index 0fce4f6324..a7d9050c83 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -354,6 +354,17 @@ static void escc_reset(DeviceState *d)
             cs->rregs[j] = 0;
             cs->wregs[j] = 0;
         }
+
+        /*
+         * ...but there is an exception. The "Transmit Interrupts and Transmit
+         * Buffer Empty Bit" section on page 50 of the ESCC datasheet says of
+         * the STATUS_TXEMPTY bit in R_STATUS: "After a hardware reset
+         * (including a hardware reset by software), or a channel reset, this
+         * bit is set to 1". The Sun PROM checks this bit early on startup and
+         * gets stuck in an infinite loop if it is not set.
+         */
+        cs->rregs[R_STATUS] |= STATUS_TXEMPTY;
+
         escc_reset_chn(cs);
     }
 }
-- 
2.20.1


