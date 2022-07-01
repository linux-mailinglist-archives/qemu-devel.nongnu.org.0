Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1B556304D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 11:38:29 +0200 (CEST)
Received: from localhost ([::1]:55564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7D6a-0003v6-5J
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 05:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o7D2c-0001iS-Rv
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:34:22 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39348 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o7D2a-0003Ec-H5
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:34:22 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKeGPv75iutYAAA--.2820S6;
 Fri, 01 Jul 2022 17:34:08 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH 04/11] hw/rtc/ls7a_rtc: Add reset function
Date: Fri,  1 Jul 2022 17:34:00 +0800
Message-Id: <20220701093407.2150607-5-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxKeGPv75iutYAAA--.2820S6
X-Coremail-Antispam: 1UD129KBjvJXoWrKr1fGF13Cw1Duw18JF1rXrb_yoW8Jr1kpr
 4xZ3Z5KF1UGFnrJrZ3Jr1DWF45JFn7JFWIgr47Aw429a43Ar1DXFn5W3yjyrsrGFZ5Xw4a
 va43J3WagF47u3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

Add ls7a rtc reset function to delete timers and clear regs when rtc reset.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/rtc/ls7a_rtc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
index f1e7a660e9..eb10cdb451 100644
--- a/hw/rtc/ls7a_rtc.c
+++ b/hw/rtc/ls7a_rtc.c
@@ -463,6 +463,25 @@ static void ls7a_rtc_realize(DeviceState *dev, Error **errp)
 
 }
 
+/* delete timer and clear reg when reset */
+static void ls7a_rtc_reset(DeviceState *dev)
+{
+    int i;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    LS7ARtcState *d = LS7A_RTC(sbd);
+    for (i = 0; i < TIMER_NUMS; i++) {
+        if (toy_enabled(d)) {
+            timer_del(d->toy_timer[i]);
+        }
+        if (rtc_enabled(d)) {
+            timer_del(d->rtc_timer[i]);
+        }
+        d->toymatch[i] = 0;
+        d->rtcmatch[i] = 0;
+    }
+    d->cntrctl = 0;
+}
+
 static int ls7a_rtc_pre_save(void *opaque)
 {
     LS7ARtcState *s = LS7A_RTC(opaque);
@@ -511,6 +530,7 @@ static void ls7a_rtc_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     dc->vmsd = &vmstate_ls7a_rtc;
     dc->realize = ls7a_rtc_realize;
+    dc->reset = ls7a_rtc_reset;
     dc->desc = "ls7a rtc";
 }
 
-- 
2.31.1


