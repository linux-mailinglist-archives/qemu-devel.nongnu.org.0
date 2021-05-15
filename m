Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1DA381783
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:14:37 +0200 (CEST)
Received: from localhost ([::1]:49632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrJc-0000xl-Pe
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9K-00062R-PO; Sat, 15 May 2021 06:04:00 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:56187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9J-0006V7-46; Sat, 15 May 2021 06:03:58 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MFsd7-1li8g30TNv-00HMwA; Sat, 15
 May 2021 12:03:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/16] hw/timer/etraxfs_timer: Convert to 3-phase reset
 (Resettable interface)
Date: Sat, 15 May 2021 12:03:27 +0200
Message-Id: <20210515100335.1245468-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yqgfvg3KKGDk3mIT/ECmJpdyRQVSmirasttAUsDRh9iI+7cQrIm
 SXaOMbhYQc98D/2noTTSY0MH6R7xyAuN4Kd8vDnnmwDq9UkmGdOQLkZvlGMtR45w1zIFWh+
 zcr3l5sPXIArzSv0wvj6FiaP2FWyO2rAX+Ea2cMgLoo5vk7rFdYj3fFT5PxNOC7azsTQzTM
 G52DgCjRNE29mvkWxXrGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8+5LOmKOGt4=:cEPMLYU43xDtaJsZ9S3J6K
 lQIy/DxZm1wajCNW9kR/AhKuj1L4I6nuZDQHXR2YnWukpfDkvvcjK8+6hpG+jW6oKB5V1x2XI
 IcvYtecGdmng+AhD23OyfpQQT/oFth6o8mwMX6rDB5htB3uAg79Lhwc+NeKqowr7bQ4u/hNPR
 UtWRlYePC/CqlUzJ4dk0KqXVOcDsiiw5Q6/UW3o5hSrPVvnDNIIoV/p6VBADqXi7+YCgyiirL
 5c4p0I0k8QCv0/ygWcPBbbOakKzFv1+hYaHDGxK5oWiQuf97+YN0GdoByIj2irtQmmdwFnYKL
 3gogJD1NqH6TYSFXBfeD3X5Hw9Fa09pAT8rcZaox5jBXxb4lzOsQVNKxhAzPj7mtfi9tAf0bN
 0vKP8pKFgImMQUOXc1N72csx+1gm6X7pbRGssrgFEVHXQV81df8mFZ4FuejA0yFvicV4wqtVe
 XMMiQdkNB13ynpWpKZ/Jo8bPlqQ2pOWjiTuxelCiwa4VGPSRIpWfX2VgeRcieUmekoFUozTyG
 AVAc/g2KioAJ2KNtvum9DU=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

TYPE_ETRAX_FS_TIMER is a sysbus device, so its DeviceClass::reset()
handler is called automatically when its qbus parent is reset
(we don't need to register it manually).

Convert the generic reset to a enter/hold resettable ones, and
remove the qemu_register_reset() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-Id: <20210502163931.552675-2-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/timer/etraxfs_timer.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index 5379006086fb..4ba662190de3 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -309,9 +309,9 @@ static const MemoryRegionOps timer_ops = {
     }
 };
 
-static void etraxfs_timer_reset(void *opaque)
+static void etraxfs_timer_reset_enter(Object *obj, ResetType type)
 {
-    ETRAXTimerState *t = opaque;
+    ETRAXTimerState *t = ETRAX_TIMER(obj);
 
     ptimer_transaction_begin(t->ptimer_t0);
     ptimer_stop(t->ptimer_t0);
@@ -325,6 +325,12 @@ static void etraxfs_timer_reset(void *opaque)
     t->rw_wd_ctrl = 0;
     t->r_intr = 0;
     t->rw_intr_mask = 0;
+}
+
+static void etraxfs_timer_reset_hold(Object *obj)
+{
+    ETRAXTimerState *t = ETRAX_TIMER(obj);
+
     qemu_irq_lower(t->irq);
 }
 
@@ -343,14 +349,16 @@ static void etraxfs_timer_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t,
                           "etraxfs-timer", 0x5c);
     sysbus_init_mmio(sbd, &t->mmio);
-    qemu_register_reset(etraxfs_timer_reset, t);
 }
 
 static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     dc->realize = etraxfs_timer_realize;
+    rc->phases.enter = etraxfs_timer_reset_enter;
+    rc->phases.hold = etraxfs_timer_reset_hold;
 }
 
 static const TypeInfo etraxfs_timer_info = {
-- 
2.31.1


