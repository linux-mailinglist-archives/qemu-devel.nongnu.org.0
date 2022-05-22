Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3A353055C
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 21:09:38 +0200 (CEST)
Received: from localhost ([::1]:57446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqxN-0006pv-QJ
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 15:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBi-0007y9-J0; Sun, 22 May 2022 14:20:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBX-0003c8-Gp; Sun, 22 May 2022 14:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ccWy+DLbu1PIuWO3Y6JNkCW/BApqMBOppBBa7UTUAAw=; b=GzBSn1n4ZdSSSnm1Y8JRWWX2UO
 BUuNy61ZlKq4U0ppF2Z0TPcURFRQIXs9Uw2Jp0n6aa7uZGBUH5Oqrt+cDhQjd8hP8bJUOYziR1oy2
 leE03xgaopBIMiPbwdFqZzv4fp28nL+BfgiId3ueGgOF9d5Ra3C/J0YaX1KJAwLr9O+bqBKQ6IGq8
 rvqvXH/s+KPCqC8J2WyFoeSJG58T42qwL6Ov2DmzYtG+w87VUzYmQkZ2WYSe1x0pPEBWGUdwPu8M2
 PcPpAI/7u+1nb5mczPnImuboVVzdWgIPMyBKOhX5gg01dLg0/3FquQdmIo2yFGn+BRvRvhofoM8EQ
 +WWKyH8wmDN0+DRajKhBm3VW7qcHO3pRPLsFtROq3QRxkgcavdbJPUHcfCvfMuwA2BQpd3K+SFmyH
 jkNxuBL8iOkdyxfAHEvQLwbfnv89SMGZCQAutrHIKNHDggTJV8sjlgf0WtbR4DtrZnGBXwwo24EOm
 ujuKbXYTwuz79R2d6VI6/v2QSfpCejZXwnHnoAwZvYIRSfvkQDVG8sbTxsnWGEEa3+ZudpPAQ2c1y
 DpDTyj3fUjejiu3rn0/v3TqSpu0slSJA1CSZzzxDiztf6/TXm2iuxbtC/FJTw5XB7K1MBnHTFh5Nb
 v2R6P+z2pJ28l8fpC6wG2y0bKpMmMbtF6dEVEwE4I=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqA7-0007pH-4g; Sun, 22 May 2022 19:18:43 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:10 +0100
Message-Id: <20220522181836.864-25-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 24/50] pckbd: add size qdev property to I8042_MMIO device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This will soon be used to set the size of the register memory region using a
qdev property.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c         | 2 ++
 include/hw/input/i8042.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 9da602fb47..e13a62bd4f 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -676,6 +676,7 @@ static void i8042_mmio_reset(DeviceState *dev)
 
 static Property i8042_mmio_properties[] = {
     DEFINE_PROP_UINT64("mask", MMIOKBDState, kbd.mask, UINT64_MAX),
+    DEFINE_PROP_UINT32("size", MMIOKBDState, size, -1),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -697,6 +698,7 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 
     dev = qdev_new(TYPE_I8042_MMIO);
     qdev_prop_set_uint64(dev, "mask", mask);
+    qdev_prop_set_uint32(dev, "size", size);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     s = &I8042_MMIO(dev)->kbd;
 
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index b7df9ace6e..ac4098b957 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -57,6 +57,7 @@ struct MMIOKBDState {
     SysBusDevice parent_obj;
 
     KBDState kbd;
+    uint32_t size;
 };
 
 #define I8042_A20_LINE "a20"
-- 
2.20.1


