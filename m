Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BDC43BF2C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 03:44:08 +0200 (CEST)
Received: from localhost ([::1]:54236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfXz4-000423-Lu
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 21:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfXwL-0001TW-4j
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 21:41:17 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:62145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfXwI-0003GB-AY
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 21:41:16 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3F038756197;
 Wed, 27 Oct 2021 03:41:09 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B4D4375603A; Wed, 27 Oct 2021 03:41:08 +0200 (CEST)
Message-Id: <a24b35c3e5433ebe5a547cf097747facc90c3a73.1635298341.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635298341.git.balaton@eik.bme.hu>
References: <cover.1635298341.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 6/6] hw/char/sh_serial: Add device id to trace output
Date: Wed, 27 Oct 2021 03:32:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Normally there are at least two sh_serial instances. Add device id to
trace messages to make it clear which instance they belong to
otherwise its not possible to tell which serial device is accessed.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/char/sh_serial.c  | 6 ++++--
 hw/char/trace-events | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 91973affb5..c2dc51f7f0 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -94,9 +94,10 @@ static void sh_serial_write(void *opaque, hwaddr offs,
                             uint64_t val, unsigned size)
 {
     SHSerialState *s = opaque;
+    DeviceState *d = DEVICE(s);
     unsigned char ch;
 
-    trace_sh_serial("write", size, offs, val);
+    trace_sh_serial(d->id, "write", size, offs, val);
     switch (offs) {
     case 0x00: /* SMR */
         s->smr = val & ((s->feat & SH_SERIAL_FEAT_SCIF) ? 0x7b : 0xff);
@@ -213,6 +214,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
                                unsigned size)
 {
     SHSerialState *s = opaque;
+    DeviceState *d = DEVICE(s);
     uint32_t ret = ~0;
 
 #if 0
@@ -305,7 +307,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
             break;
         }
     }
-    trace_sh_serial("read ", size, offs, ret);
+    trace_sh_serial(d->id, "read ", size, offs, ret);
 
     if (ret & ~((1 << 16) - 1)) {
         qemu_log_mask(LOG_UNIMP, "sh_serial: unsupported read from 0x%02"
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 3e49860e7b..2f799c57ae 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -103,4 +103,4 @@ exynos_uart_rx_timeout(uint32_t channel, uint32_t stat, uint32_t intsp) "UART%d:
 cadence_uart_baudrate(unsigned baudrate) "baudrate %u"
 
 # sh_serial.c
-sh_serial(const char *op, unsigned size, uint64_t offs, uint64_t val) "%s size %d offs 0x%02" PRIx64 " val 0x%02" PRIx64
+sh_serial(char *id, const char *op, unsigned size, uint64_t offs, uint64_t val) "%s %s size %d offs 0x%02" PRIx64 " val 0x%02" PRIx64
-- 
2.21.4


