Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C951A8365
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 15:10:37 +0200 (CEST)
Received: from localhost ([::1]:57632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5V3U-00010c-0C
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 09:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53742)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1i5Uph-0006cr-DM
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 08:56:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1i5Upf-0005du-JR
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 08:56:21 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:46006)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1i5Upa-0005ZX-RL; Wed, 04 Sep 2019 08:56:15 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 6ECE796F66;
 Wed,  4 Sep 2019 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1567601773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nxofqdzwalp2vEQOq4dTbBQ6QL66ivAoBoMwSi+rsdg=;
 b=jW7c9Fwu4u9XecB4vtwbsjT9Ed5qkG0GgbNPNaLFVdSpneqWb4HjErswe7n6+RJhlv3o5Y
 +yNCiRFIYSOfF/f9TKDZFghQYep5BbmGefYnAquBxHPKc0FuNhPwzZWgzoRy18XGP1QeHg
 mJZABzy/pe8oKuAyY8lLlYHrXr7F3uY=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 14:55:30 +0200
Message-Id: <20190904125531.27545-9-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904125531.27545-1-damien.hedde@greensocs.com>
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1567601773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nxofqdzwalp2vEQOq4dTbBQ6QL66ivAoBoMwSi+rsdg=;
 b=jpMbE6TkGG5AqLaHoCwv65DLVX96ZEga/l7qE5PSFZtLxPYTACu5f3+VWvToXFKA8sflCM
 b2I+txe+DxdH9NjsTPKBVL4oU8mjZxtsTui8vgDQ+DOw/W6IWULXj0ZNF2EkLV7QKrqs3o
 h0Jb4VA8WRo/3xSePGBo+dhj93zHHYg=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1567601773; a=rsa-sha256; cv=none;
 b=GZk4B5GY3xvsSu8PiPGq9P4JsSF9YAW9G5lmiqOCS/cO004y4ZfXcELGUAkFUORGuirP9V
 V6spt3dHF3qyKXD/Iman8TWO+nTA+DtLOJ8VkJxtKK6C9/zDtXG04lYIo2o5jU3uWkbrrP
 I1BC6aQD4kbwsLR2d8uw3RKIIBcrxiw=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-devel] [PATCH v6 8/9] hw/char/cadence_uart: add clock support
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com, alistair@alistair23.me,
 mark.burton@greensocs.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, edgar.iglesias@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch the cadence uart to multi-phase reset and add the
reference clock input.

The input clock frequency is added to the migration structure.

The reference clock controls the baudrate generation. If it disabled,
any input characters and events are ignored.

If this clock remains unconnected, the uart behaves as before
(it default to a 50MHz ref clock).

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/char/cadence_uart.c         | 85 ++++++++++++++++++++++++++++++----
 hw/char/trace-events           |  3 ++
 include/hw/char/cadence_uart.h |  1 +
 3 files changed, 79 insertions(+), 10 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 0e315b2376..bae43a9679 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -31,6 +31,8 @@
 #include "qemu/module.h"
 #include "hw/char/cadence_uart.h"
 #include "hw/irq.h"
+#include "hw/qdev-clock.h"
+#include "trace.h"
=20
 #ifdef CADENCE_UART_ERR_DEBUG
 #define DB_PRINT(...) do { \
@@ -97,7 +99,7 @@
 #define LOCAL_LOOPBACK         (0x2 << UART_MR_CHMODE_SH)
 #define REMOTE_LOOPBACK        (0x3 << UART_MR_CHMODE_SH)
=20
-#define UART_INPUT_CLK         50000000
+#define UART_DEFAULT_REF_CLK (50 * 1000 * 1000)
=20
 #define R_CR       (0x00/4)
 #define R_MR       (0x04/4)
@@ -171,12 +173,15 @@ static void uart_send_breaks(CadenceUARTState *s)
 static void uart_parameters_setup(CadenceUARTState *s)
 {
     QEMUSerialSetParams ssp;
-    unsigned int baud_rate, packet_size;
+    unsigned int baud_rate, packet_size, input_clk;
+    input_clk =3D clock_get_frequency(s->refclk);
=20
-    baud_rate =3D (s->r[R_MR] & UART_MR_CLKS) ?
-            UART_INPUT_CLK / 8 : UART_INPUT_CLK;
+    baud_rate =3D (s->r[R_MR] & UART_MR_CLKS) ? input_clk / 8 : input_cl=
k;
+    baud_rate /=3D (s->r[R_BRGR] * (s->r[R_BDIV] + 1));
+    trace_cadence_uart_baudrate(baud_rate);
+
+    ssp.speed =3D baud_rate;
=20
-    ssp.speed =3D baud_rate / (s->r[R_BRGR] * (s->r[R_BDIV] + 1));
     packet_size =3D 1;
=20
     switch (s->r[R_MR] & UART_MR_PAR) {
@@ -215,6 +220,13 @@ static void uart_parameters_setup(CadenceUARTState *=
s)
     }
=20
     packet_size +=3D ssp.data_bits + ssp.stop_bits;
+    if (ssp.speed =3D=3D 0) {
+        /*
+         * Avoid division-by-zero below.
+         * TODO: find something better
+         */
+        ssp.speed =3D 1;
+    }
     s->char_tx_time =3D (NANOSECONDS_PER_SECOND / ssp.speed) * packet_si=
ze;
     qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
 }
@@ -340,6 +352,11 @@ static void uart_receive(void *opaque, const uint8_t=
 *buf, int size)
     CadenceUARTState *s =3D opaque;
     uint32_t ch_mode =3D s->r[R_MR] & UART_MR_CHMODE;
=20
+    /* ignore characters when unclocked or in reset */
+    if (!clock_is_enabled(s->refclk) || device_is_resetting(DEVICE(s))) =
{
+        return;
+    }
+
     if (ch_mode =3D=3D NORMAL_MODE || ch_mode =3D=3D ECHO_MODE) {
         uart_write_rx_fifo(opaque, buf, size);
     }
@@ -353,6 +370,11 @@ static void uart_event(void *opaque, int event)
     CadenceUARTState *s =3D opaque;
     uint8_t buf =3D '\0';
=20
+    /* ignore characters when unclocked or in reset */
+    if (!clock_is_enabled(s->refclk) || device_is_resetting(DEVICE(s))) =
{
+        return;
+    }
+
     if (event =3D=3D CHR_EVENT_BREAK) {
         uart_write_rx_fifo(opaque, &buf, 1);
     }
@@ -462,9 +484,9 @@ static const MemoryRegionOps uart_ops =3D {
     .endianness =3D DEVICE_NATIVE_ENDIAN,
 };
=20
-static void cadence_uart_reset(DeviceState *dev)
+static void cadence_uart_reset_init(Object *obj, ResetType type)
 {
-    CadenceUARTState *s =3D CADENCE_UART(dev);
+    CadenceUARTState *s =3D CADENCE_UART(obj);
=20
     s->r[R_CR] =3D 0x00000128;
     s->r[R_IMR] =3D 0;
@@ -473,6 +495,11 @@ static void cadence_uart_reset(DeviceState *dev)
     s->r[R_BRGR] =3D 0x0000028B;
     s->r[R_BDIV] =3D 0x0000000F;
     s->r[R_TTRIG] =3D 0x00000020;
+}
+
+static void cadence_uart_reset_hold(Object *obj)
+{
+    CadenceUARTState *s =3D CADENCE_UART(obj);
=20
     uart_rx_reset(s);
     uart_tx_reset(s);
@@ -491,6 +518,14 @@ static void cadence_uart_realize(DeviceState *dev, E=
rror **errp)
                              uart_event, NULL, s, NULL, true);
 }
=20
+static void cadence_uart_refclk_update(void *opaque)
+{
+    CadenceUARTState *s =3D opaque;
+
+    /* recompute uart's speed on clock change */
+    uart_parameters_setup(s);
+}
+
 static void cadence_uart_init(Object *obj)
 {
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
@@ -500,9 +535,23 @@ static void cadence_uart_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
=20
+    s->refclk =3D qdev_init_clock_in(DEVICE(obj), "refclk",
+            cadence_uart_refclk_update, s);
+    /* initialize the frequency in case the clock remains unconnected */
+    clock_init_frequency(s->refclk, UART_DEFAULT_REF_CLK);
+
     s->char_tx_time =3D (NANOSECONDS_PER_SECOND / 9600) * 10;
 }
=20
+static int cadence_uart_pre_load(void *opaque)
+{
+    CadenceUARTState *s =3D opaque;
+
+    /* the frequency will be overriden if the subsection is present */
+    clock_init_frequency(s->refclk, UART_DEFAULT_REF_CLK);
+    return 0;
+}
+
 static int cadence_uart_post_load(void *opaque, int version_id)
 {
     CadenceUARTState *s =3D opaque;
@@ -519,10 +568,21 @@ static int cadence_uart_post_load(void *opaque, int=
 version_id)
     return 0;
 }
=20
+static const VMStateDescription vmstate_cadence_uart_refclk =3D {
+    .name =3D "cadence_uart_refclk",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_CLOCKIN(refclk, CadenceUARTState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_cadence_uart =3D {
     .name =3D "cadence_uart",
     .version_id =3D 2,
     .minimum_version_id =3D 2,
+    .pre_load =3D cadence_uart_pre_load,
     .post_load =3D cadence_uart_post_load,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(r, CadenceUARTState, CADENCE_UART_R_MAX),
@@ -535,7 +595,10 @@ static const VMStateDescription vmstate_cadence_uart=
 =3D {
         VMSTATE_UINT32(rx_wpos, CadenceUARTState),
         VMSTATE_TIMER_PTR(fifo_trigger_handle, CadenceUARTState),
         VMSTATE_END_OF_LIST()
-    }
+    },
+    .subsections =3D (const VMStateDescription * []) {
+        &vmstate_cadence_uart_refclk,
+    },
 };
=20
 static Property cadence_uart_properties[] =3D {
@@ -546,12 +609,14 @@ static Property cadence_uart_properties[] =3D {
 static void cadence_uart_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
=20
     dc->realize =3D cadence_uart_realize;
     dc->vmsd =3D &vmstate_cadence_uart;
-    dc->reset =3D cadence_uart_reset;
     dc->props =3D cadence_uart_properties;
-  }
+    rc->phases.init =3D cadence_uart_reset_init;
+    rc->phases.hold =3D cadence_uart_reset_hold;
+}
=20
 static const TypeInfo cadence_uart_info =3D {
     .name          =3D TYPE_CADENCE_UART,
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 2ce7f2f998..502a7d0507 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -77,3 +77,6 @@ cmsdk_apb_uart_set_params(int speed) "CMSDK APB UART: p=
arams set to %d 8N1"
 # nrf51_uart.c
 nrf51_uart_read(uint64_t addr, uint64_t r, unsigned int size) "addr 0x%"=
 PRIx64 " value 0x%" PRIx64 " size %u"
 nrf51_uart_write(uint64_t addr, uint64_t value, unsigned int size) "addr=
 0x%" PRIx64 " value 0x%" PRIx64 " size %u"
+
+# hw/char/cadence_uart.c
+cadence_uart_baudrate(unsigned baudrate) "baudrate %u"
diff --git a/include/hw/char/cadence_uart.h b/include/hw/char/cadence_uar=
t.h
index 47cec956c4..a09afe4ed5 100644
--- a/include/hw/char/cadence_uart.h
+++ b/include/hw/char/cadence_uart.h
@@ -49,6 +49,7 @@ typedef struct {
     CharBackend chr;
     qemu_irq irq;
     QEMUTimer *fifo_trigger_handle;
+    ClockIn *refclk;
 } CadenceUARTState;
=20
 static inline DeviceState *cadence_uart_create(hwaddr addr,
--=20
2.22.0


