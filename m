Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4B43926D6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 07:24:11 +0200 (CEST)
Received: from localhost ([::1]:39044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm8V8-0002hQ-Jy
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 01:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1lm8Sg-0008Ls-Sr
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:21:39 -0400
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:32926)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1lm8Sc-00063v-27
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:21:38 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail03.asahi-net.or.jp (Postfix) with ESMTPA id EEBFA385A6;
 Thu, 27 May 2021 14:21:29 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (y245018.dynamic.ppp.asahi-net.or.jp [118.243.245.18])
 by sakura.ysato.name (Postfix) with ESMTPSA id 77AA81C0643;
 Thu, 27 May 2021 14:21:29 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] hw/char: remove sh_serial.
Date: Thu, 27 May 2021 14:21:13 +0900
Message-Id: <20210527052122.97103-3-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210527052122.97103-1-ysato@users.sourceforge.jp>
References: <20210527052122.97103-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.15;
 envelope-from=ysato@users.sourceforge.jp; helo=mail03.asahi-net.or.jp
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Migrate to renesas_sci.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 hw/char/sh_serial.c | 431 --------------------------------------------
 MAINTAINERS         |   4 +-
 hw/char/Kconfig     |   3 -
 hw/char/meson.build |   1 -
 4 files changed, 2 insertions(+), 437 deletions(-)
 delete mode 100644 hw/char/sh_serial.c

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
deleted file mode 100644
index 167f4d8cb9..0000000000
--- a/hw/char/sh_serial.c
+++ /dev/null
@@ -1,431 +0,0 @@
-/*
- * QEMU SCI/SCIF serial port emulation
- *
- * Copyright (c) 2007 Magnus Damm
- *
- * Based on serial.c - QEMU 16450 UART emulation
- * Copyright (c) 2003-2004 Fabrice Bellard
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-
-#include "qemu/osdep.h"
-#include "hw/irq.h"
-#include "hw/sh4/sh.h"
-#include "chardev/char-fe.h"
-#include "qapi/error.h"
-#include "qemu/timer.h"
-
-//#define DEBUG_SERIAL
-
-#define SH_SERIAL_FLAG_TEND (1 << 0)
-#define SH_SERIAL_FLAG_TDE  (1 << 1)
-#define SH_SERIAL_FLAG_RDF  (1 << 2)
-#define SH_SERIAL_FLAG_BRK  (1 << 3)
-#define SH_SERIAL_FLAG_DR   (1 << 4)
-
-#define SH_RX_FIFO_LENGTH (16)
-
-typedef struct {
-    MemoryRegion iomem;
-    MemoryRegion iomem_p4;
-    MemoryRegion iomem_a7;
-    uint8_t smr;
-    uint8_t brr;
-    uint8_t scr;
-    uint8_t dr; /* ftdr / tdr */
-    uint8_t sr; /* fsr / ssr */
-    uint16_t fcr;
-    uint8_t sptr;
-
-    uint8_t rx_fifo[SH_RX_FIFO_LENGTH]; /* frdr / rdr */
-    uint8_t rx_cnt;
-    uint8_t rx_tail;
-    uint8_t rx_head;
-
-    int freq;
-    int feat;
-    int flags;
-    int rtrg;
-
-    CharBackend chr;
-    QEMUTimer *fifo_timeout_timer;
-    uint64_t etu; /* Elementary Time Unit (ns) */
-
-    qemu_irq eri;
-    qemu_irq rxi;
-    qemu_irq txi;
-    qemu_irq tei;
-    qemu_irq bri;
-} sh_serial_state;
-
-static void sh_serial_clear_fifo(sh_serial_state * s)
-{
-    memset(s->rx_fifo, 0, SH_RX_FIFO_LENGTH);
-    s->rx_cnt = 0;
-    s->rx_head = 0;
-    s->rx_tail = 0;
-}
-
-static void sh_serial_write(void *opaque, hwaddr offs,
-                            uint64_t val, unsigned size)
-{
-    sh_serial_state *s = opaque;
-    unsigned char ch;
-
-#ifdef DEBUG_SERIAL
-    printf("sh_serial: write offs=0x%02x val=0x%02x\n",
-           offs, val);
-#endif
-    switch(offs) {
-    case 0x00: /* SMR */
-        s->smr = val & ((s->feat & SH_SERIAL_FEAT_SCIF) ? 0x7b : 0xff);
-        return;
-    case 0x04: /* BRR */
-        s->brr = val;
-        return;
-    case 0x08: /* SCR */
-        /* TODO : For SH7751, SCIF mask should be 0xfb. */
-        s->scr = val & ((s->feat & SH_SERIAL_FEAT_SCIF) ? 0xfa : 0xff);
-        if (!(val & (1 << 5)))
-            s->flags |= SH_SERIAL_FLAG_TEND;
-        if ((s->feat & SH_SERIAL_FEAT_SCIF) && s->txi) {
-            qemu_set_irq(s->txi, val & (1 << 7));
-        }
-        if (!(val & (1 << 6))) {
-            qemu_set_irq(s->rxi, 0);
-        }
-        return;
-    case 0x0c: /* FTDR / TDR */
-        if (qemu_chr_fe_backend_connected(&s->chr)) {
-            ch = val;
-            /* XXX this blocks entire thread. Rewrite to use
-             * qemu_chr_fe_write and background I/O callbacks */
-            qemu_chr_fe_write_all(&s->chr, &ch, 1);
-        }
-        s->dr = val;
-        s->flags &= ~SH_SERIAL_FLAG_TDE;
-        return;
-#if 0
-    case 0x14: /* FRDR / RDR */
-        ret = 0;
-        break;
-#endif
-    }
-    if (s->feat & SH_SERIAL_FEAT_SCIF) {
-        switch(offs) {
-        case 0x10: /* FSR */
-            if (!(val & (1 << 6)))
-                s->flags &= ~SH_SERIAL_FLAG_TEND;
-            if (!(val & (1 << 5)))
-                s->flags &= ~SH_SERIAL_FLAG_TDE;
-            if (!(val & (1 << 4)))
-                s->flags &= ~SH_SERIAL_FLAG_BRK;
-            if (!(val & (1 << 1)))
-                s->flags &= ~SH_SERIAL_FLAG_RDF;
-            if (!(val & (1 << 0)))
-                s->flags &= ~SH_SERIAL_FLAG_DR;
-
-            if (!(val & (1 << 1)) || !(val & (1 << 0))) {
-                if (s->rxi) {
-                    qemu_set_irq(s->rxi, 0);
-                }
-            }
-            return;
-        case 0x18: /* FCR */
-            s->fcr = val;
-            switch ((val >> 6) & 3) {
-            case 0:
-                s->rtrg = 1;
-                break;
-            case 1:
-                s->rtrg = 4;
-                break;
-            case 2:
-                s->rtrg = 8;
-                break;
-            case 3:
-                s->rtrg = 14;
-                break;
-            }
-            if (val & (1 << 1)) {
-                sh_serial_clear_fifo(s);
-                s->sr &= ~(1 << 1);
-            }
-
-            return;
-        case 0x20: /* SPTR */
-            s->sptr = val & 0xf3;
-            return;
-        case 0x24: /* LSR */
-            return;
-        }
-    }
-    else {
-        switch(offs) {
-#if 0
-        case 0x0c:
-            ret = s->dr;
-            break;
-        case 0x10:
-            ret = 0;
-            break;
-#endif
-        case 0x1c:
-            s->sptr = val & 0x8f;
-            return;
-        }
-    }
-
-    fprintf(stderr, "sh_serial: unsupported write to 0x%02"
-            HWADDR_PRIx "\n", offs);
-    abort();
-}
-
-static uint64_t sh_serial_read(void *opaque, hwaddr offs,
-                               unsigned size)
-{
-    sh_serial_state *s = opaque;
-    uint32_t ret = ~0;
-
-#if 0
-    switch(offs) {
-    case 0x00:
-        ret = s->smr;
-        break;
-    case 0x04:
-        ret = s->brr;
-        break;
-    case 0x08:
-        ret = s->scr;
-        break;
-    case 0x14:
-        ret = 0;
-        break;
-    }
-#endif
-    if (s->feat & SH_SERIAL_FEAT_SCIF) {
-        switch(offs) {
-        case 0x00: /* SMR */
-            ret = s->smr;
-            break;
-        case 0x08: /* SCR */
-            ret = s->scr;
-            break;
-        case 0x10: /* FSR */
-            ret = 0;
-            if (s->flags & SH_SERIAL_FLAG_TEND)
-                ret |= (1 << 6);
-            if (s->flags & SH_SERIAL_FLAG_TDE)
-                ret |= (1 << 5);
-            if (s->flags & SH_SERIAL_FLAG_BRK)
-                ret |= (1 << 4);
-            if (s->flags & SH_SERIAL_FLAG_RDF)
-                ret |= (1 << 1);
-            if (s->flags & SH_SERIAL_FLAG_DR)
-                ret |= (1 << 0);
-
-            if (s->scr & (1 << 5))
-                s->flags |= SH_SERIAL_FLAG_TDE | SH_SERIAL_FLAG_TEND;
-
-            break;
-        case 0x14:
-            if (s->rx_cnt > 0) {
-                ret = s->rx_fifo[s->rx_tail++];
-                s->rx_cnt--;
-                if (s->rx_tail == SH_RX_FIFO_LENGTH)
-                    s->rx_tail = 0;
-                if (s->rx_cnt < s->rtrg)
-                    s->flags &= ~SH_SERIAL_FLAG_RDF;
-            }
-            break;
-        case 0x18:
-            ret = s->fcr;
-            break;
-        case 0x1c:
-            ret = s->rx_cnt;
-            break;
-        case 0x20:
-            ret = s->sptr;
-            break;
-        case 0x24:
-            ret = 0;
-            break;
-        }
-    }
-    else {
-        switch(offs) {
-#if 0
-        case 0x0c:
-            ret = s->dr;
-            break;
-        case 0x10:
-            ret = 0;
-            break;
-        case 0x14:
-            ret = s->rx_fifo[0];
-            break;
-#endif
-        case 0x1c:
-            ret = s->sptr;
-            break;
-        }
-    }
-#ifdef DEBUG_SERIAL
-    printf("sh_serial: read offs=0x%02x val=0x%x\n",
-           offs, ret);
-#endif
-
-    if (ret & ~((1 << 16) - 1)) {
-        fprintf(stderr, "sh_serial: unsupported read from 0x%02"
-                HWADDR_PRIx "\n", offs);
-        abort();
-    }
-
-    return ret;
-}
-
-static int sh_serial_can_receive(sh_serial_state *s)
-{
-    return s->scr & (1 << 4);
-}
-
-static void sh_serial_receive_break(sh_serial_state *s)
-{
-    if (s->feat & SH_SERIAL_FEAT_SCIF)
-        s->sr |= (1 << 4);
-}
-
-static int sh_serial_can_receive1(void *opaque)
-{
-    sh_serial_state *s = opaque;
-    return sh_serial_can_receive(s);
-}
-
-static void sh_serial_timeout_int(void *opaque)
-{
-    sh_serial_state *s = opaque;
-
-    s->flags |= SH_SERIAL_FLAG_RDF;
-    if (s->scr & (1 << 6) && s->rxi) {
-        qemu_set_irq(s->rxi, 1);
-    }
-}
-
-static void sh_serial_receive1(void *opaque, const uint8_t *buf, int size)
-{
-    sh_serial_state *s = opaque;
-
-    if (s->feat & SH_SERIAL_FEAT_SCIF) {
-        int i;
-        for (i = 0; i < size; i++) {
-            if (s->rx_cnt < SH_RX_FIFO_LENGTH) {
-                s->rx_fifo[s->rx_head++] = buf[i];
-                if (s->rx_head == SH_RX_FIFO_LENGTH) {
-                    s->rx_head = 0;
-                }
-                s->rx_cnt++;
-                if (s->rx_cnt >= s->rtrg) {
-                    s->flags |= SH_SERIAL_FLAG_RDF;
-                    if (s->scr & (1 << 6) && s->rxi) {
-                        timer_del(s->fifo_timeout_timer);
-                        qemu_set_irq(s->rxi, 1);
-                    }
-                } else {
-                    timer_mod(s->fifo_timeout_timer,
-                        qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 15 * s->etu);
-                }
-            }
-        }
-    } else {
-        s->rx_fifo[0] = buf[0];
-    }
-}
-
-static void sh_serial_event(void *opaque, QEMUChrEvent event)
-{
-    sh_serial_state *s = opaque;
-    if (event == CHR_EVENT_BREAK)
-        sh_serial_receive_break(s);
-}
-
-static const MemoryRegionOps sh_serial_ops = {
-    .read = sh_serial_read,
-    .write = sh_serial_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-void sh_serial_init(MemoryRegion *sysmem,
-                    hwaddr base, int feat,
-                    uint32_t freq, Chardev *chr,
-                    qemu_irq eri_source,
-                    qemu_irq rxi_source,
-                    qemu_irq txi_source,
-                    qemu_irq tei_source,
-                    qemu_irq bri_source)
-{
-    sh_serial_state *s;
-
-    s = g_malloc0(sizeof(sh_serial_state));
-
-    s->feat = feat;
-    s->flags = SH_SERIAL_FLAG_TEND | SH_SERIAL_FLAG_TDE;
-    s->rtrg = 1;
-
-    s->smr = 0;
-    s->brr = 0xff;
-    s->scr = 1 << 5; /* pretend that TX is enabled so early printk works */
-    s->sptr = 0;
-
-    if (feat & SH_SERIAL_FEAT_SCIF) {
-        s->fcr = 0;
-    }
-    else {
-        s->dr = 0xff;
-    }
-
-    sh_serial_clear_fifo(s);
-
-    memory_region_init_io(&s->iomem, NULL, &sh_serial_ops, s,
-                          "serial", 0x100000000ULL);
-
-    memory_region_init_alias(&s->iomem_p4, NULL, "serial-p4", &s->iomem,
-                             0, 0x28);
-    memory_region_add_subregion(sysmem, P4ADDR(base), &s->iomem_p4);
-
-    memory_region_init_alias(&s->iomem_a7, NULL, "serial-a7", &s->iomem,
-                             0, 0x28);
-    memory_region_add_subregion(sysmem, A7ADDR(base), &s->iomem_a7);
-
-    if (chr) {
-        qemu_chr_fe_init(&s->chr, chr, &error_abort);
-        qemu_chr_fe_set_handlers(&s->chr, sh_serial_can_receive1,
-                                 sh_serial_receive1,
-                                 sh_serial_event, NULL, s, NULL, true);
-    }
-
-    s->fifo_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                         sh_serial_timeout_int, s);
-    s->etu = NANOSECONDS_PER_SECOND / 9600;
-    s->eri = eri_source;
-    s->rxi = rxi_source;
-    s->txi = txi_source;
-    s->tei = tei_source;
-    s->bri = bri_source;
-}
diff --git a/MAINTAINERS b/MAINTAINERS
index a77f246569..ecfa97cefa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1410,7 +1410,7 @@ R2D
 R: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Odd Fixes
-F: hw/char/sh_serial.c
+F: hw/char/renesas_sci.c
 F: hw/sh4/r2d.c
 F: hw/intc/sh_intc.c
 F: hw/pci-host/sh_pci.c
@@ -1422,7 +1422,7 @@ R: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Odd Fixes
 F: hw/block/tc58128.c
-F: hw/char/sh_serial.c
+F: hw/char/reness_sci.c
 F: hw/sh4/shix.c
 F: hw/intc/sh_intc.c
 F: hw/timer/sh_timer.c
diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 4cf36ac637..a8bf0c6a77 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -50,9 +50,6 @@ config SCLPCONSOLE
 config TERMINAL3270
     bool
 
-config SH_SCI
-    bool
-
 config RENESAS_SCI
     bool
 
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 8361d0ab28..b9a88aa200 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -29,7 +29,6 @@ softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_uart.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_aux.c'))
 softmmu_ss.add(when: 'CONFIG_RENESAS_SCI', if_true: files('renesas_sci.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_UART', if_true: files('sifive_uart.c'))
-softmmu_ss.add(when: 'CONFIG_SH_SCI', if_true: files('sh_serial.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_USART', if_true: files('stm32f2xx_usart.c'))
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmuart.c'))
 
-- 
2.20.1


