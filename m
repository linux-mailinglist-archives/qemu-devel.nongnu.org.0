Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B366D55B366
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:12:32 +0200 (CEST)
Received: from localhost ([::1]:48930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WkJ-00051u-Pv
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WM1-0003Rg-Jg
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:47:25 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLz-000069-4m
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=64HO1bV36j5AyTcnfECUSqVUIdsjQZjYmqhIwl1K0/0=; b=EWgOR8Z0AzepBFfKuO/Gd/O4fT
 Iq87KlUCNhcBsWCwRePSJkJ1GyxeUYL9Lpq0KMpbLSK20mljVP10LfS8lJLHrT1PQl/GArDtpGNeZ
 YTnT3TzvnMaT1icgR/wD7eytuD9uYiSCw6QsWb26rwh1G3mQINR5ij2IddpoDbBYtqSoxJOCR6143
 E+75KkGkWGIllLwT/v7NCLjqiSJIjPfUqgcKQStX0BcDAoYxfPs6lrQiQkZvmNn8SQjExq2xTcpmA
 h7UpzNYnpdTHtWSDHqY4kLsA50+LU69s5f1cq3op4VH5Yn3q9AE601S5/RsWh7QBUE4exD0etjrdM
 YRO1P1H7rGK40XvtlvUWG1ILgw737CRuncWEG3M9gVLvRSFyJfWtDefhjiNj6ziKrib9WdgvcSXZn
 CzsDOAMNb8frTxtn/kCm3xwpRRIHL/WfWah248bx9LaHry3blcZBuEkqj89QrO6cd20mndgRwjbrW
 +n+/uA7youqolJgT2tc4ciwp/dgW+Db+FhhOXXuQys4uTJeo1EufVoq5q7VBpMdCEdSGHc6Ww/rPx
 mpHD7m2d1y3LStM46B4OWjO19hpOB0+YfQirVqDrwPZS3IlILNVGJEMYPKz3UY/yztVVrrHp4KefH
 RAiVPYJpjGkzmO06PPbYWrRYI4G2JwUijPSQSvWF0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKb-0007KY-0k; Sun, 26 Jun 2022 18:46:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:00 +0100
Message-Id: <20220626174531.969187-25-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 24/55] pckbd: add size qdev property to I8042_MMIO device
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
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220624134109.881989-25-mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c         | 2 ++
 include/hw/input/i8042.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index c04a2c587e..a70442e0f8 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -675,6 +675,7 @@ static void i8042_mmio_reset(DeviceState *dev)
 
 static Property i8042_mmio_properties[] = {
     DEFINE_PROP_UINT64("mask", MMIOKBDState, kbd.mask, UINT64_MAX),
+    DEFINE_PROP_UINT32("size", MMIOKBDState, size, -1),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -696,6 +697,7 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 
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
2.30.2


