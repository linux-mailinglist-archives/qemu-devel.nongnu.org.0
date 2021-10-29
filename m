Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866664400FC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:11:03 +0200 (CEST)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVPC-00061j-5a
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUvq-00079c-9v
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:42 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:51108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUvm-0005z5-PN
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:42 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 181287561DA;
 Fri, 29 Oct 2021 18:40:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 89878756062; Fri, 29 Oct 2021 18:40:26 +0200 (CEST)
Message-Id: <6b119665f2603748cdfa9cd87a4bd1ece2d31a0a.1635524617.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635524616.git.balaton@eik.bme.hu>
References: <cover.1635524616.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 09/25] hw/char/sh_serial: Add device id to trace output
Date: Fri, 29 Oct 2021 18:23:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/sh_serial.c  | 6 ++++--
 hw/char/trace-events | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 808d4ebae7..355886ee3a 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -94,9 +94,10 @@ static void sh_serial_write(void *opaque, hwaddr offs,
                             uint64_t val, unsigned size)
 {
     SHSerialState *s = opaque;
+    DeviceState *d = DEVICE(s);
     unsigned char ch;
 
-    trace_sh_serial_write(size, offs, val);
+    trace_sh_serial_write(d->id, size, offs, val);
     switch (offs) {
     case 0x00: /* SMR */
         s->smr = val & ((s->feat & SH_SERIAL_FEAT_SCIF) ? 0x7b : 0xff);
@@ -212,6 +213,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
                                unsigned size)
 {
     SHSerialState *s = opaque;
+    DeviceState *d = DEVICE(s);
     uint32_t ret = UINT32_MAX;
 
 #if 0
@@ -304,7 +306,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
             break;
         }
     }
-    trace_sh_serial_read(size, offs, ret);
+    trace_sh_serial_read(d->id, size, offs, ret);
 
     if (ret > UINT16_MAX) {
         qemu_log_mask(LOG_GUEST_ERROR,
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 4a92e7674a..2ecb36232e 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -103,5 +103,5 @@ exynos_uart_rx_timeout(uint32_t channel, uint32_t stat, uint32_t intsp) "UART%d:
 cadence_uart_baudrate(unsigned baudrate) "baudrate %u"
 
 # sh_serial.c
-sh_serial_read(unsigned size, uint64_t offs, uint64_t val) " size %d offs 0x%02" PRIx64 " -> 0x%02" PRIx64
-sh_serial_write(unsigned size, uint64_t offs, uint64_t val) "size %d offs 0x%02" PRIx64 " <- 0x%02" PRIx64
+sh_serial_read(char *id, unsigned size, uint64_t offs, uint64_t val) " %s size %d offs 0x%02" PRIx64 " -> 0x%02" PRIx64
+sh_serial_write(char *id, unsigned size, uint64_t offs, uint64_t val) "%s size %d offs 0x%02" PRIx64 " <- 0x%02" PRIx64
-- 
2.21.4


