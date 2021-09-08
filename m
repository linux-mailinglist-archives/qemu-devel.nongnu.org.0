Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95787403CB3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:42:26 +0200 (CEST)
Received: from localhost ([::1]:42946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNziT-0000pM-Lk
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbu-0003kt-6M
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:38 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:40939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbs-0003q8-4D
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:37 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MxUfh-1n8EZz24ef-00xreI; Wed, 08
 Sep 2021 17:35:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/12] mac_via: move VIA1 realize logic from mac_via_realize()
 to mos6522_q800_via1_realize()
Date: Wed,  8 Sep 2021 17:35:25 +0200
Message-Id: <20210908153529.453843-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908153529.453843-1-laurent@vivier.eu>
References: <20210908153529.453843-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gF3wVc60yiZCRKtUGU4kdPSajqNNqo0mj5HGty1wYg+6Awm54QN
 Kc/WcwGZMEgCCueQzSAtASP2IVI8smo+DFAy+Vj390Mwq3AZjg1nGxOE32jF0VOz7MLSlfa
 68Z+Lv7YDYlVxIzDdJSOPtwJyQAHYxC5AQyYbo0lNgNxQnD5Z2PgPWBRjCwKjtGBWdMOyZu
 kuhnHgTZta79aQUHg6afA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1ef+iBawsIg=:ZX1guOWXoMlfFMflLCo+X+
 3ocAyXRmDV1Va0gOBZTwi/yaKkSrMroJH+RenhRnCCkk3Lvst1VrZ4hu31Y72V3/sBbQGq4R1
 D0ktLHuFVU2SttJzVaBpyoiK3n30/+nHqBFLVxGcBKtf+Fs83hBSkart4ufGHV4Bdf7itzpsD
 bCHjyry6/dAmXQomYuUQNAiNA4Ca7JLnhNVgtgkJI1rMQ6ZkmU5kY3uwR7N7d/f/vzS3Mi2Oq
 3Uay+0LrWJsFKDeqLhzA/LtulMjWrQUsecMDodkR2gmpXfKIKsfLfN4hnx+ZxY/oQyLPLUTI/
 B3770DyUd2MJQt0m5o5MUzOx7usBrM4wxyLPOVoBiP+duwEEDJvHVcbjQn9xPFzkUspjyy+Pa
 sh2poDgjo3gQa9n2jy2uukxFOiPk0PJ5Dk0zu9wxX0SuoKv9glSl3RonbmCngcfr7MnxkZG4i
 5IODRPGIkYcgs3r8UeQFFE/kGScWI9RxgwdvEDGMCLDxdW6GT1wS+peOv71hupS3usHY8Sw0s
 SzD5JfEiUoRCyfKex5bTXZu/8hgTxZAi7hQWSU2P7Kf1kEGUdXuK9VOKQ0bnMsk+rah6MITMe
 oPz2UqqWb4Ve0vY/DNhCVeOc2K9Acvwdpnkn+7v7DGHfKjOkiMj53zeq3SmAcRTYDOzGnNU71
 5pe6J/zqZHGSwx3uv0apU1kKMkBYCjDtX7znKW/9ZNvacPRAzWGIG0JHxgRWYDzG+ZehSy4lZ
 dj+iSksPi4eGY1YURM47EM+4DMohd5pyd+yvRQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210830102447.10806-9-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 86 ++++++++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 42 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index a2df17d9bed1..bb8d682ce98f 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -948,11 +948,7 @@ static const MemoryRegionOps mos6522_q800_via2_ops = {
 static void mac_via_realize(DeviceState *dev, Error **errp)
 {
     MacVIAState *m = MAC_VIA(dev);
-    MOS6522Q800VIA1State *v1s = &m->mos6522_via1;
     MOS6522State *ms;
-    ADBBusState *adb_bus = &v1s->adb_bus;
-    struct tm tm;
-    int ret;
 
     /* Pass through mos6522 output IRQs */
     ms = MOS6522(&m->mos6522_via1);
@@ -968,44 +964,6 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
     /* Pass through mos6522 input IRQs */
     qdev_pass_gpios(DEVICE(&m->mos6522_via1), dev, "via1-irq");
     qdev_pass_gpios(DEVICE(&m->mos6522_via2), dev, "via2-irq");
-
-    /* VIA 1 */
-    m->mos6522_via1.one_second_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
-                                                     via1_one_second,
-                                                     &m->mos6522_via1);
-    via1_one_second_update(&m->mos6522_via1);
-    m->mos6522_via1.sixty_hz_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                                  via1_sixty_hz,
-                                                  &m->mos6522_via1);
-    via1_sixty_hz_update(&m->mos6522_via1);
-
-    qemu_get_timedate(&tm, 0);
-    v1s->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
-
-    adb_register_autopoll_callback(adb_bus, adb_via_poll, v1s);
-    v1s->adb_data_ready = qdev_get_gpio_in_named(dev, "via1-irq",
-                                                 VIA1_IRQ_ADB_READY_BIT);
-
-    if (v1s->blk) {
-        int64_t len = blk_getlength(v1s->blk);
-        if (len < 0) {
-            error_setg_errno(errp, -len,
-                             "could not get length of backing image");
-            return;
-        }
-        ret = blk_set_perm(v1s->blk,
-                           BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
-                           BLK_PERM_ALL, errp);
-        if (ret < 0) {
-            return;
-        }
-
-        len = blk_pread(v1s->blk, 0, v1s->PRAM, sizeof(v1s->PRAM));
-        if (len != sizeof(v1s->PRAM)) {
-            error_setg(errp, "can't read PRAM contents");
-            return;
-        }
-    }
 }
 
 static void mac_via_init(Object *obj)
@@ -1091,6 +1049,49 @@ static void mos6522_q800_via1_reset(DeviceState *dev)
     v1s->alt = REG_EMPTY;
 }
 
+static void mos6522_q800_via1_realize(DeviceState *dev, Error **errp)
+{
+    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(dev);
+    ADBBusState *adb_bus = &v1s->adb_bus;
+    struct tm tm;
+    int ret;
+
+    v1s->one_second_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL, via1_one_second,
+                                         v1s);
+    via1_one_second_update(v1s);
+    v1s->sixty_hz_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, via1_sixty_hz,
+                                       v1s);
+    via1_sixty_hz_update(v1s);
+
+    qemu_get_timedate(&tm, 0);
+    v1s->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
+
+    adb_register_autopoll_callback(adb_bus, adb_via_poll, v1s);
+    v1s->adb_data_ready = qdev_get_gpio_in_named(dev, "via1-irq",
+                                                 VIA1_IRQ_ADB_READY_BIT);
+
+    if (v1s->blk) {
+        int64_t len = blk_getlength(v1s->blk);
+        if (len < 0) {
+            error_setg_errno(errp, -len,
+                             "could not get length of backing image");
+            return;
+        }
+        ret = blk_set_perm(v1s->blk,
+                           BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
+                           BLK_PERM_ALL, errp);
+        if (ret < 0) {
+            return;
+        }
+
+        len = blk_pread(v1s->blk, 0, v1s->PRAM, sizeof(v1s->PRAM));
+        if (len != sizeof(v1s->PRAM)) {
+            error_setg(errp, "can't read PRAM contents");
+            return;
+        }
+    }
+}
+
 static void mos6522_q800_via1_init(Object *obj)
 {
     MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(obj);
@@ -1147,6 +1148,7 @@ static void mos6522_q800_via1_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
+    dc->realize = mos6522_q800_via1_realize;
     dc->reset = mos6522_q800_via1_reset;
     dc->vmsd = &vmstate_q800_via1;
     device_class_set_props(dc, mos6522_q800_via1_properties);
-- 
2.31.1


