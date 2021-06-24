Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47053B2B54
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 11:25:15 +0200 (CEST)
Received: from localhost ([::1]:53618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwLbm-0003Gn-Sj
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 05:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwLaX-0001BU-Fw
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:23:58 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwLaU-00023M-DP
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:23:57 -0400
Received: by mail-wr1-x432.google.com with SMTP id a13so5822386wrf.10
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 02:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZAJq8CIoFMc56ct/PWa/U5hvTM+cD0GZAFyIU8yQQH4=;
 b=SfO4UalgMyH1BZw+xDXx93mKuaxPzbRyvsVPNDc5sbnB99ga6QI4u+C4jFhtRvPnrr
 7RceB7SnxSKTEtn/KBVbJgN6Gqck2yNg175ArmbQWJzyDHaSS+kxzMHsR/01uw5/nLqH
 1hS2EgVLPOemo5512tABRngsbZNJWVVOdcfpUeMzOuteSkEbPlSI2RQGCm1ei36a3DU2
 e85FuWVkT1Nr2RF1iNoPcnUVuBH869PU6K3J4MdfZkuPXcIGmmEujSrg7S4/SR6nUQAu
 ANb0GrLafn1ByLDeBuElEd1QRDuqjreY7GNT3lMDSf0raYPbztIbF2j57kBzZq4XL5nh
 jC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZAJq8CIoFMc56ct/PWa/U5hvTM+cD0GZAFyIU8yQQH4=;
 b=M+CQkPzAk0YEh22v/sQ0MpZJKT7TODeCcDnssI3C9Ir9ZJJFvo5Sbux7sGUxFxyZ9z
 Ig2cfdpVyZ864tYhw2DlqzkvQyWR3KMod/r28LzEfetIlvbkxGnVxkkSQZrEX14C/VBQ
 jrQp6AAveBoRfk5MTp/MyqKIjhzMxWO6dXSQ/JSS1/2MofPZiusJr2obIJnfT3sv3K1g
 Sp6FcEF6xepd/oS70uAGgLz1TxmOhfI11m2p/wW9l5qJKozVowIgKjLfOE3HGlxESUdN
 2r8JUAVMWe7jE3G4teCKobCQgVxn+46h180WVPcjVFf+G30UpxBNM/MeXxE9uKPx0ZAm
 D34A==
X-Gm-Message-State: AOAM531U1HFTbkowFIAerbf5d/FEj0iN0gLeyRtwEfedCpzRFZiHioH7
 1vIpSSq6Lw2D4MnsVYuaMQO6ZnA4N4H0Fw==
X-Google-Smtp-Source: ABdhPJzoAdpiiMYIGri5oSVJCyJ6bfWcwOE3Ntv4k4nHzslrb3xPIABpbQNPzaMJ5mos7PFtmza41w==
X-Received: by 2002:adf:dd51:: with SMTP id u17mr3364288wrm.266.1624526632489; 
 Thu, 24 Jun 2021 02:23:52 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 61sm3009117wrp.4.2021.06.24.02.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 02:23:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] hw/timer: Remove RENESAS_TMR / RENESAS_CMT
Date: Thu, 24 Jun 2021 11:23:35 +0200
Message-Id: <20210624092336.1078504-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624092336.1078504-1-f4bug@amsat.org>
References: <20210624092336.1078504-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both RENESAS_TMR / RENESAS_CMT have been replaced by the
generic RENESAS_TIMER.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/timer/renesas_cmt.h |  43 ---
 include/hw/timer/renesas_tmr.h |  58 ----
 hw/timer/renesas_cmt.c         | 283 -------------------
 hw/timer/renesas_tmr.c         | 493 ---------------------------------
 hw/timer/Kconfig               |   6 -
 hw/timer/meson.build           |   2 -
 6 files changed, 885 deletions(-)
 delete mode 100644 include/hw/timer/renesas_cmt.h
 delete mode 100644 include/hw/timer/renesas_tmr.h
 delete mode 100644 hw/timer/renesas_cmt.c
 delete mode 100644 hw/timer/renesas_tmr.c

diff --git a/include/hw/timer/renesas_cmt.h b/include/hw/timer/renesas_cmt.h
deleted file mode 100644
index 1c0b65c1d5a..00000000000
--- a/include/hw/timer/renesas_cmt.h
+++ /dev/null
@@ -1,43 +0,0 @@
-/*
- * Renesas Compare-match timer Object
- *
- * Copyright (c) 2019 Yoshinori Sato
- *
- * SPDX-License-Identifier: GPL-2.0-or-later
- */
-
-#ifndef HW_TIMER_RENESAS_CMT_H
-#define HW_TIMER_RENESAS_CMT_H
-
-#include "qemu/timer.h"
-#include "hw/sysbus.h"
-#include "qom/object.h"
-
-#define TYPE_RENESAS_CMT "renesas-cmt"
-typedef struct RCMTState RCMTState;
-DECLARE_INSTANCE_CHECKER(RCMTState, RCMT,
-                         TYPE_RENESAS_CMT)
-
-enum {
-    CMT_CH = 2,
-    CMT_NR_IRQ = 1 * CMT_CH
-};
-
-struct RCMTState {
-    /*< private >*/
-    SysBusDevice parent_obj;
-    /*< public >*/
-
-    uint64_t input_freq;
-    MemoryRegion memory;
-
-    uint16_t cmstr;
-    uint16_t cmcr[CMT_CH];
-    uint16_t cmcnt[CMT_CH];
-    uint16_t cmcor[CMT_CH];
-    int64_t tick[CMT_CH];
-    qemu_irq cmi[CMT_CH];
-    QEMUTimer timer[CMT_CH];
-};
-
-#endif
diff --git a/include/hw/timer/renesas_tmr.h b/include/hw/timer/renesas_tmr.h
deleted file mode 100644
index caf7eec0dca..00000000000
--- a/include/hw/timer/renesas_tmr.h
+++ /dev/null
@@ -1,58 +0,0 @@
-/*
- * Renesas 8bit timer Object
- *
- * Copyright (c) 2018 Yoshinori Sato
- *
- * SPDX-License-Identifier: GPL-2.0-or-later
- */
-
-#ifndef HW_TIMER_RENESAS_TMR_H
-#define HW_TIMER_RENESAS_TMR_H
-
-#include "qemu/timer.h"
-#include "hw/sysbus.h"
-#include "qom/object.h"
-
-#define TYPE_RENESAS_TMR "renesas-tmr"
-typedef struct RTMRState RTMRState;
-DECLARE_INSTANCE_CHECKER(RTMRState, RTMR,
-                         TYPE_RENESAS_TMR)
-
-enum timer_event {
-    cmia = 0,
-    cmib = 1,
-    ovi = 2,
-    none = 3,
-    TMR_NR_EVENTS = 4
-};
-
-enum {
-    TMR_CH = 2,
-    TMR_NR_IRQ = 3 * TMR_CH
-};
-
-struct RTMRState {
-    /*< private >*/
-    SysBusDevice parent_obj;
-    /*< public >*/
-
-    uint64_t input_freq;
-    MemoryRegion memory;
-
-    int64_t tick;
-    uint8_t tcnt[TMR_CH];
-    uint8_t tcora[TMR_CH];
-    uint8_t tcorb[TMR_CH];
-    uint8_t tcr[TMR_CH];
-    uint8_t tccr[TMR_CH];
-    uint8_t tcor[TMR_CH];
-    uint8_t tcsr[TMR_CH];
-    int64_t div_round[TMR_CH];
-    uint8_t next[TMR_CH];
-    qemu_irq cmia[TMR_CH];
-    qemu_irq cmib[TMR_CH];
-    qemu_irq ovi[TMR_CH];
-    QEMUTimer timer[TMR_CH];
-};
-
-#endif
diff --git a/hw/timer/renesas_cmt.c b/hw/timer/renesas_cmt.c
deleted file mode 100644
index 2e0fd21a36c..00000000000
--- a/hw/timer/renesas_cmt.c
+++ /dev/null
@@ -1,283 +0,0 @@
-/*
- * Renesas 16bit Compare-match timer
- *
- * Datasheet: RX62N Group, RX621 Group User's Manual: Hardware
- *            (Rev.1.40 R01UH0033EJ0140)
- *
- * Copyright (c) 2019 Yoshinori Sato
- *
- * SPDX-License-Identifier: GPL-2.0-or-later
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2 or later, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "qemu/log.h"
-#include "hw/irq.h"
-#include "hw/registerfields.h"
-#include "hw/qdev-properties.h"
-#include "hw/timer/renesas_cmt.h"
-#include "migration/vmstate.h"
-
-/*
- *  +0 CMSTR - common control
- *  +2 CMCR  - ch0
- *  +4 CMCNT - ch0
- *  +6 CMCOR - ch0
- *  +8 CMCR  - ch1
- * +10 CMCNT - ch1
- * +12 CMCOR - ch1
- * If we think that the address of CH 0 has an offset of +2,
- * we can treat it with the same address as CH 1, so define it like that.
- */
-REG16(CMSTR, 0)
-  FIELD(CMSTR, STR0, 0, 1)
-  FIELD(CMSTR, STR1, 1, 1)
-  FIELD(CMSTR, STR,  0, 2)
-/* This addeess is channel offset */
-REG16(CMCR, 0)
-  FIELD(CMCR, CKS,  0, 2)
-  FIELD(CMCR, CMIE, 6, 1)
-REG16(CMCNT, 2)
-REG16(CMCOR, 4)
-
-static void update_events(RCMTState *cmt, int ch)
-{
-    int64_t next_time;
-
-    if ((cmt->cmstr & (1 << ch)) == 0) {
-        /* count disable, so not happened next event. */
-        return ;
-    }
-    next_time = cmt->cmcor[ch] - cmt->cmcnt[ch];
-    next_time *= NANOSECONDS_PER_SECOND;
-    next_time /= cmt->input_freq;
-    /*
-     * CKS -> div rate
-     *  0 -> 8 (1 << 3)
-     *  1 -> 32 (1 << 5)
-     *  2 -> 128 (1 << 7)
-     *  3 -> 512 (1 << 9)
-     */
-    next_time *= 1 << (3 + FIELD_EX16(cmt->cmcr[ch], CMCR, CKS) * 2);
-    next_time += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    timer_mod(&cmt->timer[ch], next_time);
-}
-
-static int64_t read_cmcnt(RCMTState *cmt, int ch)
-{
-    int64_t delta, now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-
-    if (cmt->cmstr & (1 << ch)) {
-        delta = (now - cmt->tick[ch]);
-        delta /= NANOSECONDS_PER_SECOND;
-        delta /= cmt->input_freq;
-        delta /= 1 << (3 + FIELD_EX16(cmt->cmcr[ch], CMCR, CKS) * 2);
-        cmt->tick[ch] = now;
-        return cmt->cmcnt[ch] + delta;
-    } else {
-        return cmt->cmcnt[ch];
-    }
-}
-
-static uint64_t cmt_read(void *opaque, hwaddr offset, unsigned size)
-{
-    RCMTState *cmt = opaque;
-    int ch = offset / 0x08;
-    uint64_t ret;
-
-    if (offset == A_CMSTR) {
-        ret = 0;
-        ret = FIELD_DP16(ret, CMSTR, STR,
-                         FIELD_EX16(cmt->cmstr, CMSTR, STR));
-        return ret;
-    } else {
-        offset &= 0x07;
-        if (ch == 0) {
-            offset -= 0x02;
-        }
-        switch (offset) {
-        case A_CMCR:
-            ret = 0;
-            ret = FIELD_DP16(ret, CMCR, CKS,
-                             FIELD_EX16(cmt->cmstr, CMCR, CKS));
-            ret = FIELD_DP16(ret, CMCR, CMIE,
-                             FIELD_EX16(cmt->cmstr, CMCR, CMIE));
-            return ret;
-        case A_CMCNT:
-            return read_cmcnt(cmt, ch);
-        case A_CMCOR:
-            return cmt->cmcor[ch];
-        }
-    }
-    qemu_log_mask(LOG_UNIMP, "renesas_cmt: Register 0x%" HWADDR_PRIX " "
-                             "not implemented\n",
-                  offset);
-    return UINT64_MAX;
-}
-
-static void start_stop(RCMTState *cmt, int ch, int st)
-{
-    if (st) {
-        update_events(cmt, ch);
-    } else {
-        timer_del(&cmt->timer[ch]);
-    }
-}
-
-static void cmt_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
-{
-    RCMTState *cmt = opaque;
-    int ch = offset / 0x08;
-
-    if (offset == A_CMSTR) {
-        cmt->cmstr = FIELD_EX16(val, CMSTR, STR);
-        start_stop(cmt, 0, FIELD_EX16(cmt->cmstr, CMSTR, STR0));
-        start_stop(cmt, 1, FIELD_EX16(cmt->cmstr, CMSTR, STR1));
-    } else {
-        offset &= 0x07;
-        if (ch == 0) {
-            offset -= 0x02;
-        }
-        switch (offset) {
-        case A_CMCR:
-            cmt->cmcr[ch] = FIELD_DP16(cmt->cmcr[ch], CMCR, CKS,
-                                       FIELD_EX16(val, CMCR, CKS));
-            cmt->cmcr[ch] = FIELD_DP16(cmt->cmcr[ch], CMCR, CMIE,
-                                       FIELD_EX16(val, CMCR, CMIE));
-            break;
-        case 2:
-            cmt->cmcnt[ch] = val;
-            break;
-        case 4:
-            cmt->cmcor[ch] = val;
-            break;
-        default:
-            qemu_log_mask(LOG_UNIMP, "renesas_cmt: Register 0x%" HWADDR_PRIX " "
-                                     "not implemented\n",
-                          offset);
-            return;
-        }
-        if (FIELD_EX16(cmt->cmstr, CMSTR, STR) & (1 << ch)) {
-            update_events(cmt, ch);
-        }
-    }
-}
-
-static const MemoryRegionOps cmt_ops = {
-    .write = cmt_write,
-    .read  = cmt_read,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .impl = {
-        .min_access_size = 2,
-        .max_access_size = 2,
-    },
-    .valid = {
-        .min_access_size = 2,
-        .max_access_size = 2,
-    },
-};
-
-static void timer_events(RCMTState *cmt, int ch)
-{
-    cmt->cmcnt[ch] = 0;
-    cmt->tick[ch] = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    update_events(cmt, ch);
-    if (FIELD_EX16(cmt->cmcr[ch], CMCR, CMIE)) {
-        qemu_irq_pulse(cmt->cmi[ch]);
-    }
-}
-
-static void timer_event0(void *opaque)
-{
-    RCMTState *cmt = opaque;
-
-    timer_events(cmt, 0);
-}
-
-static void timer_event1(void *opaque)
-{
-    RCMTState *cmt = opaque;
-
-    timer_events(cmt, 1);
-}
-
-static void rcmt_reset(DeviceState *dev)
-{
-    RCMTState *cmt = RCMT(dev);
-    cmt->cmstr = 0;
-    cmt->cmcr[0] = cmt->cmcr[1] = 0;
-    cmt->cmcnt[0] = cmt->cmcnt[1] = 0;
-    cmt->cmcor[0] = cmt->cmcor[1] = 0xffff;
-}
-
-static void rcmt_init(Object *obj)
-{
-    SysBusDevice *d = SYS_BUS_DEVICE(obj);
-    RCMTState *cmt = RCMT(obj);
-    int i;
-
-    memory_region_init_io(&cmt->memory, OBJECT(cmt), &cmt_ops,
-                          cmt, "renesas-cmt", 0x10);
-    sysbus_init_mmio(d, &cmt->memory);
-
-    for (i = 0; i < ARRAY_SIZE(cmt->cmi); i++) {
-        sysbus_init_irq(d, &cmt->cmi[i]);
-    }
-    timer_init_ns(&cmt->timer[0], QEMU_CLOCK_VIRTUAL, timer_event0, cmt);
-    timer_init_ns(&cmt->timer[1], QEMU_CLOCK_VIRTUAL, timer_event1, cmt);
-}
-
-static const VMStateDescription vmstate_rcmt = {
-    .name = "rx-cmt",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT16(cmstr, RCMTState),
-        VMSTATE_UINT16_ARRAY(cmcr, RCMTState, CMT_CH),
-        VMSTATE_UINT16_ARRAY(cmcnt, RCMTState, CMT_CH),
-        VMSTATE_UINT16_ARRAY(cmcor, RCMTState, CMT_CH),
-        VMSTATE_INT64_ARRAY(tick, RCMTState, CMT_CH),
-        VMSTATE_TIMER_ARRAY(timer, RCMTState, CMT_CH),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static Property rcmt_properties[] = {
-    DEFINE_PROP_UINT64("input-freq", RCMTState, input_freq, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void rcmt_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->vmsd = &vmstate_rcmt;
-    dc->reset = rcmt_reset;
-    device_class_set_props(dc, rcmt_properties);
-}
-
-static const TypeInfo rcmt_info = {
-    .name = TYPE_RENESAS_CMT,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(RCMTState),
-    .instance_init = rcmt_init,
-    .class_init = rcmt_class_init,
-};
-
-static void rcmt_register_types(void)
-{
-    type_register_static(&rcmt_info);
-}
-
-type_init(rcmt_register_types)
diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
deleted file mode 100644
index d96002e1ee6..00000000000
--- a/hw/timer/renesas_tmr.c
+++ /dev/null
@@ -1,493 +0,0 @@
-/*
- * Renesas 8bit timer
- *
- * Datasheet: RX62N Group, RX621 Group User's Manual: Hardware
- *            (Rev.1.40 R01UH0033EJ0140)
- *
- * Copyright (c) 2019 Yoshinori Sato
- *
- * SPDX-License-Identifier: GPL-2.0-or-later
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2 or later, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "qemu/log.h"
-#include "hw/irq.h"
-#include "hw/registerfields.h"
-#include "hw/qdev-properties.h"
-#include "hw/timer/renesas_tmr.h"
-#include "migration/vmstate.h"
-
-REG8(TCR, 0)
-  FIELD(TCR, CCLR,  3, 2)
-  FIELD(TCR, OVIE,  5, 1)
-  FIELD(TCR, CMIEA, 6, 1)
-  FIELD(TCR, CMIEB, 7, 1)
-REG8(TCSR, 2)
-  FIELD(TCSR, OSA,  0, 2)
-  FIELD(TCSR, OSB,  2, 2)
-  FIELD(TCSR, ADTE, 4, 2)
-REG8(TCORA, 4)
-REG8(TCORB, 6)
-REG8(TCNT, 8)
-REG8(TCCR, 10)
-  FIELD(TCCR, CKS,   0, 3)
-  FIELD(TCCR, CSS,   3, 2)
-  FIELD(TCCR, TMRIS, 7, 1)
-
-#define CSS_EXTERNAL  0x00
-#define CSS_INTERNAL  0x01
-#define CSS_INVALID   0x02
-#define CSS_CASCADING 0x03
-#define CCLR_A    0x01
-#define CCLR_B    0x02
-
-static const int clkdiv[] = {0, 1, 2, 8, 32, 64, 1024, 8192};
-
-static uint8_t concat_reg(uint8_t *reg)
-{
-    return (reg[0] << 8) | reg[1];
-}
-
-static void update_events(RTMRState *tmr, int ch)
-{
-    uint16_t diff[TMR_NR_EVENTS], min;
-    int64_t next_time;
-    int i, event;
-
-    if (tmr->tccr[ch] == 0) {
-        return ;
-    }
-    if (FIELD_EX8(tmr->tccr[ch], TCCR, CSS) == 0) {
-        /* external clock mode */
-        /* event not happened */
-        return ;
-    }
-    if (FIELD_EX8(tmr->tccr[0], TCCR, CSS) == CSS_CASCADING) {
-        /* cascading mode */
-        if (ch == 1) {
-            tmr->next[ch] = none;
-            return ;
-        }
-        diff[cmia] = concat_reg(tmr->tcora) - concat_reg(tmr->tcnt);
-        diff[cmib] = concat_reg(tmr->tcorb) - concat_reg(tmr->tcnt);
-        diff[ovi] = 0x10000 - concat_reg(tmr->tcnt);
-    } else {
-        /* separate mode */
-        diff[cmia] = tmr->tcora[ch] - tmr->tcnt[ch];
-        diff[cmib] = tmr->tcorb[ch] - tmr->tcnt[ch];
-        diff[ovi] = 0x100 - tmr->tcnt[ch];
-    }
-    /* Search for the most recently occurring event. */
-    for (event = 0, min = diff[0], i = 1; i < none; i++) {
-        if (min > diff[i]) {
-            event = i;
-            min = diff[i];
-        }
-    }
-    tmr->next[ch] = event;
-    next_time = diff[event];
-    next_time *= clkdiv[FIELD_EX8(tmr->tccr[ch], TCCR, CKS)];
-    next_time *= NANOSECONDS_PER_SECOND;
-    next_time /= tmr->input_freq;
-    next_time += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    timer_mod(&tmr->timer[ch], next_time);
-}
-
-static int elapsed_time(RTMRState *tmr, int ch, int64_t delta)
-{
-    int divrate = clkdiv[FIELD_EX8(tmr->tccr[ch], TCCR, CKS)];
-    int et;
-
-    tmr->div_round[ch] += delta;
-    if (divrate > 0) {
-        et = tmr->div_round[ch] / divrate;
-        tmr->div_round[ch] %= divrate;
-    } else {
-        /* disble clock. so no update */
-        et = 0;
-    }
-    return et;
-}
-
-static uint16_t read_tcnt(RTMRState *tmr, unsigned size, int ch)
-{
-    int64_t delta, now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    int elapsed, ovf = 0;
-    uint16_t tcnt[2];
-    uint32_t ret;
-
-    delta = (now - tmr->tick) * NANOSECONDS_PER_SECOND / tmr->input_freq;
-    if (delta > 0) {
-        tmr->tick = now;
-
-        switch (FIELD_EX8(tmr->tccr[1], TCCR, CSS)) {
-        case CSS_INTERNAL:
-            /* timer1 count update */
-            elapsed = elapsed_time(tmr, 1, delta);
-            if (elapsed >= 0x100) {
-                ovf = elapsed >> 8;
-            }
-            tcnt[1] = tmr->tcnt[1] + (elapsed & 0xff);
-            break;
-        case CSS_INVALID: /* guest error to have set this */
-        case CSS_EXTERNAL: /* QEMU doesn't implement these */
-        case CSS_CASCADING:
-            tcnt[1] = tmr->tcnt[1];
-            break;
-        default:
-            g_assert_not_reached();
-        }
-        switch (FIELD_EX8(tmr->tccr[0], TCCR, CSS)) {
-        case CSS_INTERNAL:
-            elapsed = elapsed_time(tmr, 0, delta);
-            tcnt[0] = tmr->tcnt[0] + elapsed;
-            break;
-        case CSS_CASCADING:
-            tcnt[0] = tmr->tcnt[0] + ovf;
-            break;
-        case CSS_INVALID: /* guest error to have set this */
-        case CSS_EXTERNAL: /* QEMU doesn't implement this */
-            tcnt[0] = tmr->tcnt[0];
-            break;
-        default:
-            g_assert_not_reached();
-        }
-    } else {
-        tcnt[0] = tmr->tcnt[0];
-        tcnt[1] = tmr->tcnt[1];
-    }
-    if (size == 1) {
-        return tcnt[ch];
-    } else {
-        ret = 0;
-        ret = deposit32(ret, 0, 8, tcnt[1]);
-        ret = deposit32(ret, 8, 8, tcnt[0]);
-        return ret;
-    }
-}
-
-static uint8_t read_tccr(uint8_t r)
-{
-    uint8_t tccr = 0;
-    tccr = FIELD_DP8(tccr, TCCR, TMRIS,
-                     FIELD_EX8(r, TCCR, TMRIS));
-    tccr = FIELD_DP8(tccr, TCCR, CSS,
-                     FIELD_EX8(r, TCCR, CSS));
-    tccr = FIELD_DP8(tccr, TCCR, CKS,
-                     FIELD_EX8(r, TCCR, CKS));
-    return tccr;
-}
-
-static uint64_t tmr_read(void *opaque, hwaddr addr, unsigned size)
-{
-    RTMRState *tmr = opaque;
-    int ch = addr & 1;
-    uint64_t ret;
-
-    if (size == 2 && (ch != 0 || addr == A_TCR || addr == A_TCSR)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "renesas_tmr: Invalid read size 0x%"
-                                       HWADDR_PRIX "\n",
-                      addr);
-        return UINT64_MAX;
-    }
-    switch (addr & 0x0e) {
-    case A_TCR:
-        ret = 0;
-        ret = FIELD_DP8(ret, TCR, CCLR,
-                        FIELD_EX8(tmr->tcr[ch], TCR, CCLR));
-        ret = FIELD_DP8(ret, TCR, OVIE,
-                        FIELD_EX8(tmr->tcr[ch], TCR, OVIE));
-        ret = FIELD_DP8(ret, TCR, CMIEA,
-                        FIELD_EX8(tmr->tcr[ch], TCR, CMIEA));
-        ret = FIELD_DP8(ret, TCR, CMIEB,
-                        FIELD_EX8(tmr->tcr[ch], TCR, CMIEB));
-        return ret;
-    case A_TCSR:
-        ret = 0;
-        ret = FIELD_DP8(ret, TCSR, OSA,
-                        FIELD_EX8(tmr->tcsr[ch], TCSR, OSA));
-        ret = FIELD_DP8(ret, TCSR, OSB,
-                        FIELD_EX8(tmr->tcsr[ch], TCSR, OSB));
-        switch (ch) {
-        case 0:
-            ret = FIELD_DP8(ret, TCSR, ADTE,
-                            FIELD_EX8(tmr->tcsr[ch], TCSR, ADTE));
-            break;
-        case 1: /* CH1 ADTE unimplement always 1 */
-            ret = FIELD_DP8(ret, TCSR, ADTE, 1);
-            break;
-        }
-        return ret;
-    case A_TCORA:
-        if (size == 1) {
-            return tmr->tcora[ch];
-        } else if (ch == 0) {
-            return concat_reg(tmr->tcora);
-        }
-        /* fall through */
-    case A_TCORB:
-        if (size == 1) {
-            return tmr->tcorb[ch];
-        } else {
-            return concat_reg(tmr->tcorb);
-        }
-    case A_TCNT:
-        return read_tcnt(tmr, size, ch);
-    case A_TCCR:
-        if (size == 1) {
-            return read_tccr(tmr->tccr[ch]);
-        } else {
-            return read_tccr(tmr->tccr[0]) << 8 | read_tccr(tmr->tccr[1]);
-        }
-    default:
-        qemu_log_mask(LOG_UNIMP, "renesas_tmr: Register 0x%" HWADDR_PRIX
-                                 " not implemented\n",
-                      addr);
-        break;
-    }
-    return UINT64_MAX;
-}
-
-static void tmr_write_count(RTMRState *tmr, int ch, unsigned size,
-                            uint8_t *reg, uint64_t val)
-{
-    if (size == 1) {
-        reg[ch] = val;
-        update_events(tmr, ch);
-    } else {
-        reg[0] = extract32(val, 8, 8);
-        reg[1] = extract32(val, 0, 8);
-        update_events(tmr, 0);
-        update_events(tmr, 1);
-    }
-}
-
-static void tmr_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
-{
-    RTMRState *tmr = opaque;
-    int ch = addr & 1;
-
-    if (size == 2 && (ch != 0 || addr == A_TCR || addr == A_TCSR)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "renesas_tmr: Invalid write size 0x%" HWADDR_PRIX "\n",
-                      addr);
-        return;
-    }
-    switch (addr & 0x0e) {
-    case A_TCR:
-        tmr->tcr[ch] = val;
-        break;
-    case A_TCSR:
-        tmr->tcsr[ch] = val;
-        break;
-    case A_TCORA:
-        tmr_write_count(tmr, ch, size, tmr->tcora, val);
-        break;
-    case A_TCORB:
-        tmr_write_count(tmr, ch, size, tmr->tcorb, val);
-        break;
-    case A_TCNT:
-        tmr_write_count(tmr, ch, size, tmr->tcnt, val);
-        break;
-    case A_TCCR:
-        tmr_write_count(tmr, ch, size, tmr->tccr, val);
-        break;
-    default:
-        qemu_log_mask(LOG_UNIMP, "renesas_tmr: Register 0x%" HWADDR_PRIX
-                                 " not implemented\n",
-                      addr);
-        break;
-    }
-}
-
-static const MemoryRegionOps tmr_ops = {
-    .write = tmr_write,
-    .read  = tmr_read,
-    .endianness = DEVICE_LITTLE_ENDIAN,
-    .impl = {
-        .min_access_size = 1,
-        .max_access_size = 2,
-    },
-    .valid = {
-        .min_access_size = 1,
-        .max_access_size = 2,
-    },
-};
-
-static void timer_events(RTMRState *tmr, int ch);
-
-static uint16_t issue_event(RTMRState *tmr, int ch, int sz,
-                        uint16_t tcnt, uint16_t tcora, uint16_t tcorb)
-{
-    uint16_t ret = tcnt;
-
-    switch (tmr->next[ch]) {
-    case none:
-        break;
-    case cmia:
-        if (tcnt >= tcora) {
-            if (FIELD_EX8(tmr->tcr[ch], TCR, CCLR) == CCLR_A) {
-                ret = tcnt - tcora;
-            }
-            if (FIELD_EX8(tmr->tcr[ch], TCR, CMIEA)) {
-                qemu_irq_pulse(tmr->cmia[ch]);
-            }
-            if (sz == 8 && ch == 0 &&
-                FIELD_EX8(tmr->tccr[1], TCCR, CSS) == CSS_CASCADING) {
-                tmr->tcnt[1]++;
-                timer_events(tmr, 1);
-            }
-        }
-        break;
-    case cmib:
-        if (tcnt >= tcorb) {
-            if (FIELD_EX8(tmr->tcr[ch], TCR, CCLR) == CCLR_B) {
-                ret = tcnt - tcorb;
-            }
-            if (FIELD_EX8(tmr->tcr[ch], TCR, CMIEB)) {
-                qemu_irq_pulse(tmr->cmib[ch]);
-            }
-        }
-        break;
-    case ovi:
-        if ((tcnt >= (1 << sz)) && FIELD_EX8(tmr->tcr[ch], TCR, OVIE)) {
-            qemu_irq_pulse(tmr->ovi[ch]);
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    return ret;
-}
-
-static void timer_events(RTMRState *tmr, int ch)
-{
-    uint16_t tcnt;
-
-    tmr->tcnt[ch] = read_tcnt(tmr, 1, ch);
-    if (FIELD_EX8(tmr->tccr[0], TCCR, CSS) != CSS_CASCADING) {
-        tmr->tcnt[ch] = issue_event(tmr, ch, 8,
-                                    tmr->tcnt[ch],
-                                    tmr->tcora[ch],
-                                    tmr->tcorb[ch]) & 0xff;
-    } else {
-        if (ch == 1) {
-            return ;
-        }
-        tcnt = issue_event(tmr, ch, 16,
-                           concat_reg(tmr->tcnt),
-                           concat_reg(tmr->tcora),
-                           concat_reg(tmr->tcorb));
-        tmr->tcnt[0] = (tcnt >> 8) & 0xff;
-        tmr->tcnt[1] = tcnt & 0xff;
-    }
-    update_events(tmr, ch);
-}
-
-static void timer_event0(void *opaque)
-{
-    RTMRState *tmr = opaque;
-
-    timer_events(tmr, 0);
-}
-
-static void timer_event1(void *opaque)
-{
-    RTMRState *tmr = opaque;
-
-    timer_events(tmr, 1);
-}
-
-static void rtmr_reset(DeviceState *dev)
-{
-    RTMRState *tmr = RTMR(dev);
-    tmr->tcr[0]   = tmr->tcr[1]   = 0x00;
-    tmr->tcsr[0]  = 0x00;
-    tmr->tcsr[1]  = 0x10;
-    tmr->tcnt[0]  = tmr->tcnt[1]  = 0x00;
-    tmr->tcora[0] = tmr->tcora[1] = 0xff;
-    tmr->tcorb[0] = tmr->tcorb[1] = 0xff;
-    tmr->tccr[0]  = tmr->tccr[1]  = 0x00;
-    tmr->next[0]  = tmr->next[1]  = none;
-    tmr->tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-}
-
-static void rtmr_init(Object *obj)
-{
-    SysBusDevice *d = SYS_BUS_DEVICE(obj);
-    RTMRState *tmr = RTMR(obj);
-    int i;
-
-    memory_region_init_io(&tmr->memory, OBJECT(tmr), &tmr_ops,
-                          tmr, "renesas-tmr", 0x10);
-    sysbus_init_mmio(d, &tmr->memory);
-
-    for (i = 0; i < ARRAY_SIZE(tmr->ovi); i++) {
-        sysbus_init_irq(d, &tmr->cmia[i]);
-        sysbus_init_irq(d, &tmr->cmib[i]);
-        sysbus_init_irq(d, &tmr->ovi[i]);
-    }
-    timer_init_ns(&tmr->timer[0], QEMU_CLOCK_VIRTUAL, timer_event0, tmr);
-    timer_init_ns(&tmr->timer[1], QEMU_CLOCK_VIRTUAL, timer_event1, tmr);
-}
-
-static const VMStateDescription vmstate_rtmr = {
-    .name = "rx-tmr",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_INT64(tick, RTMRState),
-        VMSTATE_UINT8_ARRAY(tcnt, RTMRState, TMR_CH),
-        VMSTATE_UINT8_ARRAY(tcora, RTMRState, TMR_CH),
-        VMSTATE_UINT8_ARRAY(tcorb, RTMRState, TMR_CH),
-        VMSTATE_UINT8_ARRAY(tcr, RTMRState, TMR_CH),
-        VMSTATE_UINT8_ARRAY(tccr, RTMRState, TMR_CH),
-        VMSTATE_UINT8_ARRAY(tcor, RTMRState, TMR_CH),
-        VMSTATE_UINT8_ARRAY(tcsr, RTMRState, TMR_CH),
-        VMSTATE_INT64_ARRAY(div_round, RTMRState, TMR_CH),
-        VMSTATE_UINT8_ARRAY(next, RTMRState, TMR_CH),
-        VMSTATE_TIMER_ARRAY(timer, RTMRState, TMR_CH),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static Property rtmr_properties[] = {
-    DEFINE_PROP_UINT64("input-freq", RTMRState, input_freq, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void rtmr_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->vmsd = &vmstate_rtmr;
-    dc->reset = rtmr_reset;
-    device_class_set_props(dc, rtmr_properties);
-}
-
-static const TypeInfo rtmr_info = {
-    .name = TYPE_RENESAS_TMR,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(RTMRState),
-    .instance_init = rtmr_init,
-    .class_init = rtmr_class_init,
-};
-
-static void rtmr_register_types(void)
-{
-    type_register_static(&rtmr_info);
-}
-
-type_init(rtmr_register_types)
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 3f049512641..b1a87b0484e 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -40,12 +40,6 @@ config SH_TIMER
     bool
     select PTIMER
 
-config RENESAS_TMR
-    bool
-
-config RENESAS_CMT
-    bool
-
 config RENESAS_TIMER
     bool
     select PTIMER
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index 9019dce993a..5584185870c 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -8,8 +8,6 @@
 softmmu_ss.add(when: 'CONFIG_CADENCE', if_true: files('cadence_ttc.c'))
 softmmu_ss.add(when: 'CONFIG_CMSDK_APB_DUALTIMER', if_true: files('cmsdk-apb-dualtimer.c'))
 softmmu_ss.add(when: 'CONFIG_CMSDK_APB_TIMER', if_true: files('cmsdk-apb-timer.c'))
-softmmu_ss.add(when: 'CONFIG_RENESAS_TMR', if_true: files('renesas_tmr.c'))
-softmmu_ss.add(when: 'CONFIG_RENESAS_CMT', if_true: files('renesas_cmt.c'))
 softmmu_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic-timer.c'))
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_timer.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_mct.c'))
-- 
2.31.1


