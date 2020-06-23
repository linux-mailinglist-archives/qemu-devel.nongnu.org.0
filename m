Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED7720611C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 22:57:52 +0200 (CEST)
Received: from localhost ([::1]:33410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnpzL-00087X-BX
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 16:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jnpsF-0004Ha-B7; Tue, 23 Jun 2020 16:50:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56392
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jnpsD-0001cz-H4; Tue, 23 Jun 2020 16:50:30 -0400
Received: from host86-158-109-79.range86-158.btcentralplus.com
 ([86.158.109.79] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jnpsA-0007T1-Kr; Tue, 23 Jun 2020 21:50:31 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, laurent@vivier.eu,
 fthain@telegraphics.com.au
Date: Tue, 23 Jun 2020 21:49:22 +0100
Message-Id: <20200623204936.24064-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200623204936.24064-1-mark.cave-ayland@ilande.co.uk>
References: <20200623204936.24064-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.158.109.79
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 08/22] cuda: convert to use ADBBusState internal autopoll
 variables
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@telegraphics.com.au>
---
 hw/misc/macio/cuda.c         | 56 +++++++++++++++---------------------
 include/hw/misc/macio/cuda.h |  4 ---
 2 files changed, 23 insertions(+), 37 deletions(-)

diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index 01bf47327c..b7071e89d5 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -201,18 +201,16 @@ static void cuda_send_packet_to_host(CUDAState *s,
 static void cuda_adb_poll(void *opaque)
 {
     CUDAState *s = opaque;
+    ADBBusState *adb_bus = &s->adb_bus;
     uint8_t obuf[ADB_MAX_OUT_LEN + 2];
     int olen;
 
-    olen = adb_poll(&s->adb_bus, obuf + 2, s->adb_poll_mask);
+    olen = adb_poll(adb_bus, obuf + 2, adb_bus->autopoll_mask);
     if (olen > 0) {
         obuf[0] = ADB_PACKET;
         obuf[1] = 0x40; /* polled data */
         cuda_send_packet_to_host(s, obuf, olen + 2);
     }
-
-    timer_mod(s->adb_poll_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
-              s->autopoll_rate_ms);
 }
 
 /* description of commands */
@@ -228,23 +226,16 @@ static bool cuda_cmd_autopoll(CUDAState *s,
                               const uint8_t *in_data, int in_len,
                               uint8_t *out_data, int *out_len)
 {
-    int autopoll;
+    ADBBusState *adb_bus = &s->adb_bus;
+    bool autopoll;
 
     if (in_len != 1) {
         return false;
     }
 
-    autopoll = (in_data[0] != 0);
-    if (autopoll != s->autopoll) {
-        s->autopoll = autopoll;
-        if (autopoll) {
-            timer_mod(s->adb_poll_timer,
-                      qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
-                      s->autopoll_rate_ms);
-        } else {
-            timer_del(s->adb_poll_timer);
-        }
-    }
+    autopoll = (in_data[0] != 0) ? true : false;
+
+    adb_set_autopoll_enabled(adb_bus, autopoll);
     return true;
 }
 
@@ -252,6 +243,8 @@ static bool cuda_cmd_set_autorate(CUDAState *s,
                                   const uint8_t *in_data, int in_len,
                                   uint8_t *out_data, int *out_len)
 {
+    ADBBusState *adb_bus = &s->adb_bus;
+
     if (in_len != 1) {
         return false;
     }
@@ -262,12 +255,7 @@ static bool cuda_cmd_set_autorate(CUDAState *s,
         return false;
     }
 
-    s->autopoll_rate_ms = in_data[0];
-    if (s->autopoll) {
-        timer_mod(s->adb_poll_timer,
-                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
-                  s->autopoll_rate_ms);
-    }
+    adb_set_autopoll_rate_ms(adb_bus, in_data[0]);
     return true;
 }
 
@@ -275,11 +263,16 @@ static bool cuda_cmd_set_device_list(CUDAState *s,
                                      const uint8_t *in_data, int in_len,
                                      uint8_t *out_data, int *out_len)
 {
+    ADBBusState *adb_bus = &s->adb_bus;
+    uint16_t mask;
+
     if (in_len != 2) {
         return false;
     }
 
-    s->adb_poll_mask = (((uint16_t)in_data[0]) << 8) | in_data[1];
+    mask = (((uint16_t)in_data[0]) << 8) | in_data[1];
+
+    adb_set_autopoll_mask(adb_bus, mask);
     return true;
 }
 
@@ -490,8 +483,8 @@ static const MemoryRegionOps mos6522_cuda_ops = {
 
 static const VMStateDescription vmstate_cuda = {
     .name = "cuda",
-    .version_id = 5,
-    .minimum_version_id = 5,
+    .version_id = 6,
+    .minimum_version_id = 6,
     .fields = (VMStateField[]) {
         VMSTATE_STRUCT(mos6522_cuda.parent_obj, CUDAState, 0, vmstate_mos6522,
                        MOS6522State),
@@ -500,13 +493,9 @@ static const VMStateDescription vmstate_cuda = {
         VMSTATE_INT32(data_in_size, CUDAState),
         VMSTATE_INT32(data_in_index, CUDAState),
         VMSTATE_INT32(data_out_index, CUDAState),
-        VMSTATE_UINT8(autopoll, CUDAState),
-        VMSTATE_UINT8(autopoll_rate_ms, CUDAState),
-        VMSTATE_UINT16(adb_poll_mask, CUDAState),
         VMSTATE_BUFFER(data_in, CUDAState),
         VMSTATE_BUFFER(data_out, CUDAState),
         VMSTATE_UINT32(tick_offset, CUDAState),
-        VMSTATE_TIMER_PTR(adb_poll_timer, CUDAState),
         VMSTATE_TIMER_PTR(sr_delay_timer, CUDAState),
         VMSTATE_END_OF_LIST()
     }
@@ -515,11 +504,13 @@ static const VMStateDescription vmstate_cuda = {
 static void cuda_reset(DeviceState *dev)
 {
     CUDAState *s = CUDA(dev);
+    ADBBusState *adb_bus = &s->adb_bus;
 
     s->data_in_size = 0;
     s->data_in_index = 0;
     s->data_out_index = 0;
-    s->autopoll = 0;
+
+    adb_set_autopoll_enabled(adb_bus, false);
 }
 
 static void cuda_realize(DeviceState *dev, Error **errp)
@@ -527,6 +518,7 @@ static void cuda_realize(DeviceState *dev, Error **errp)
     CUDAState *s = CUDA(dev);
     Error *err = NULL;
     SysBusDevice *sbd;
+    ADBBusState *adb_bus = &s->adb_bus;
     struct tm tm;
 
     sysbus_realize(SYS_BUS_DEVICE(&s->mos6522_cuda), &err);
@@ -545,9 +537,7 @@ static void cuda_realize(DeviceState *dev, Error **errp)
     s->sr_delay_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, cuda_set_sr_int, s);
     s->sr_delay_ns = 20 * SCALE_US;
 
-    s->adb_poll_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL, cuda_adb_poll, s);
-    s->adb_poll_mask = 0xffff;
-    s->autopoll_rate_ms = 20;
+    adb_register_autopoll_callback(adb_bus, cuda_adb_poll, s);
 }
 
 static void cuda_init(Object *obj)
diff --git a/include/hw/misc/macio/cuda.h b/include/hw/misc/macio/cuda.h
index 5768075ac5..a8cf0be1ec 100644
--- a/include/hw/misc/macio/cuda.h
+++ b/include/hw/misc/macio/cuda.h
@@ -95,12 +95,8 @@ typedef struct CUDAState {
     int data_out_index;
 
     qemu_irq irq;
-    uint16_t adb_poll_mask;
-    uint8_t autopoll_rate_ms;
-    uint8_t autopoll;
     uint8_t data_in[128];
     uint8_t data_out[16];
-    QEMUTimer *adb_poll_timer;
 } CUDAState;
 
 #endif /* CUDA_H */
-- 
2.20.1


