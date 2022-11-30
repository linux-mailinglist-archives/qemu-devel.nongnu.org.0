Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD3063CE45
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 05:15:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0EU1-00031h-SC; Tue, 29 Nov 2022 23:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1p0ETz-000314-CX
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 23:14:03 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1p0ETw-00024y-GT
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 23:14:02 -0500
Received: by mail-lj1-x236.google.com with SMTP id h10so2839508ljk.11
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 20:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EbT+UVaeZt4w43R4RUSImS3lwlxemhcNRb3OmJo0aSM=;
 b=pKLaSbDvpcvvHjMnbQy1cxB62DC9psPP4oPlSIjMprnjqbEoa8AjH0iZtHPQVN3mrG
 byOv8qCU4B65oEmmjTUZeHMCXKOMiweF4sIsZTJQLbyIL0s4lmmpjAlsvtSnP3JvlnWJ
 tHP5fCPtg76nC5bvxJh2Ozmd7f049Ia0QzR6TDTpt1bdUc+z7g28163fBjNzHDryuPH3
 80p5vO6CnYa4mDORjECLXeYDEgh7dRZUGV4/AOt6w+ikncgjVutiElY3m+QW7kzlfN8f
 +FLhCz/U+8Pzq+aSnwJxfOyrIR206LIQtyxKVoUSFVnP45jq3lo60k8SoKW6Ub+rBPW9
 GKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EbT+UVaeZt4w43R4RUSImS3lwlxemhcNRb3OmJo0aSM=;
 b=cefCAZAo+dNCBrlko442aaPAfShFiteN9Kcf/NIhn4SdcYx34/P9U4Sq++X1tWpGOR
 0MA75OFSBMiIOSIU0ha5dPmGR6cOXm3pP+y8KNueEe65vzYI6iFQ/QZ+CttTRdnBNroV
 dgcqnnSw256v/92TE6ghD+4+h8uzDcz5pQiIDqU31S+N9R3/HwoMfPow5d49n1lSdLyS
 rUHtRongYJBweUDwfVAdCHci+KTHAqBC3AyBtWGeedpkoIY53eVJb6Xwy+E3A1yOS8D6
 wXRCv+hoEmjkz1zvFXhLpjdTFo2xM8VpqcP19K1llcvNONoayogAegDrFlkiTsva1FfV
 rCtw==
X-Gm-Message-State: ANoB5pnX8oI5vjv1382P7HeVGO5Km0A9Xms0LtjBpPxGHmgKW7KNEFz4
 D0G+OQ6SPeyTUa9OK8ouihBNpi26qYA=
X-Google-Smtp-Source: AA0mqf6qdhWsxkL2+94BMISq48N/eV1mIyQMmo0pWPIB4kvaruzEyfuwav3K3Np9dblHIlxuMh87Cw==
X-Received: by 2002:a2e:2c01:0:b0:279:926e:c9b9 with SMTP id
 s1-20020a2e2c01000000b00279926ec9b9mr7524417ljs.170.1669781638344; 
 Tue, 29 Nov 2022 20:13:58 -0800 (PST)
Received: from front.loc ([80.83.238.100])
 by smtp.googlemail.com with ESMTPSA id
 f27-20020a19381b000000b004a25468d86asm81737lfa.68.2022.11.29.20.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 20:13:58 -0800 (PST)
From: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
To: qemu-devel@nongnu.org
Cc: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
Subject: [PATCH 1/2] hw/char: Add STM32F7 peripheral: USART
Date: Wed, 30 Nov 2022 15:12:58 +1100
Message-Id: <20221130041259.12032-2-evgeny.v.ermakov@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130041259.12032-1-evgeny.v.ermakov@gmail.com>
References: <20221130041259.12032-1-evgeny.v.ermakov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=evgeny.v.ermakov@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
---
 include/hw/char/stm32f7xx_usart.h |  30 +++
 hw/char/stm32f7xx_usart.c         | 361 ++++++++++++++++++++++++++++++
 hw/arm/Kconfig                    |   1 +
 hw/char/Kconfig                   |   3 +
 hw/char/meson.build               |   1 +
 hw/char/trace-events              |   4 +
 6 files changed, 400 insertions(+)
 create mode 100644 include/hw/char/stm32f7xx_usart.h
 create mode 100644 hw/char/stm32f7xx_usart.c

diff --git a/include/hw/char/stm32f7xx_usart.h b/include/hw/char/stm32f7xx_usart.h
new file mode 100644
index 0000000000..ec005be8d8
--- /dev/null
+++ b/include/hw/char/stm32f7xx_usart.h
@@ -0,0 +1,30 @@
+/*
+ * STM32F7XX Universal synchronous/asynchronous receiver transmitter (USART)
+ *
+ * Copyright (c) 2022 Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_CHAR_STM32F7XX_USART_H
+#define HW_CHAR_STM32F7XX_USART_H
+
+#include "hw/arm/stm32f.h"
+#include "chardev/char-fe.h"
+
+#define TYPE_STM32F7XX_USART "stm32f7xx-usart"
+OBJECT_DECLARE_SIMPLE_TYPE(STM32F7XXUSARTState, STM32F7XX_USART)
+
+#define STM32F7XX_USART_R_MAX 11
+
+struct STM32F7XXUSARTState {
+    /*< private >*/
+    STM32FPeripheralState parent_obj;
+
+    uint32_t regs[STM32F7XX_USART_R_MAX];
+
+    CharBackend chr;
+    qemu_irq irq;
+};
+
+#endif /* HW_CHAR_STM32F7XX_USART_H */
diff --git a/hw/char/stm32f7xx_usart.c b/hw/char/stm32f7xx_usart.c
new file mode 100644
index 0000000000..122781705a
--- /dev/null
+++ b/hw/char/stm32f7xx_usart.c
@@ -0,0 +1,361 @@
+/*
+ * STM32F7XX Universal synchronous/asynchronous receiver transmitter (USART)
+ *
+ * Reference documents:
+ *   - Reference manual RM0385
+ *       "STM32F75xxx and stm32f74xxx advanced Arm(R)-based 32-bit MCUs"
+ *   - Reference manual RM0410
+ *       "STM32F76xxx and STM32F77xxx advanced Arm(R)-based 32-bit MCUs"
+ *
+ * Copyright (c) 2022 Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/char/stm32f7xx_usart.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties-system.h"
+#include "hw/registerfields.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "trace.h"
+
+#ifndef STM_USART_ERR_DEBUG
+#define STM_USART_ERR_DEBUG 0
+#endif
+
+#define DB_PRINT_L(lvl, fmt, args...)                   \
+    do {                                                \
+        if (STM_USART_ERR_DEBUG >= lvl) {               \
+            qemu_log("%s: " fmt, __func__, ## args);    \
+        }                                               \
+    } while (0)
+
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
+
+REG32(CR1,         0x00)
+    /* reserved: 31:29, 1 */
+    FIELD(CR1,        M1,             28, 1)
+    FIELD(CR1,        EOBIE,          27, 1)
+    FIELD(CR1,        RTOIE,          26, 1)
+    FIELD(CR1,        DEAT,           21, 5)
+    FIELD(CR1,        DEDT,           16, 5)
+    FIELD(CR1,        OVER8,          15, 1)
+    FIELD(CR1,        CMIE,           14, 1)
+    FIELD(CR1,        MME,            13, 1)
+    FIELD(CR1,        M0,             12, 1)
+    FIELD(CR1,        WAKE,           11, 1)
+    FIELD(CR1,        PCE,            10, 1)
+    FIELD(CR1,        PS,              9, 1)
+    FIELD(CR1,        PEIE,            8, 1)
+    FIELD(CR1,        TXEIE,           7, 1)
+    FIELD(CR1,        TCIE,            6, 1)
+    FIELD(CR1,        RXNEIE,          5, 1)
+    FIELD(CR1,        IDLEIE,          4, 1)
+    FIELD(CR1,        TE,              3, 1)
+    FIELD(CR1,        RE,              2, 1)
+    FIELD(CR1,        UE,              0, 1)
+REG32(CR2,         0x04)
+    /* reserved: 7, 3:0 */
+    FIELD(CR2,        ADD,            24, 8)
+    FIELD(CR2,        RTOEN,          23, 1)
+    FIELD(CR2,        ABRMOD,         21, 2)
+    FIELD(CR2,        ABREN,          20, 1)
+    FIELD(CR2,        MSBFIRST,       19, 1)
+    FIELD(CR2,        DATAINV,        18, 1)
+    FIELD(CR2,        TXINV,          17, 1)
+    FIELD(CR2,        RXINV,          16, 1)
+    FIELD(CR2,        SWAP,           15, 1)
+    FIELD(CR2,        LINEN,          14, 1)
+    FIELD(CR2,        STOP,           12, 2)
+    FIELD(CR2,        CLKEN,          11, 1)
+    FIELD(CR2,        CPOL,           10, 1)
+    FIELD(CR2,        CPHA,            9, 1)
+    FIELD(CR2,        LBCL,            8, 1)
+    FIELD(CR2,        LBDIE,           6, 1)
+    FIELD(CR2,        LBDL,            5, 1)
+    FIELD(CR2,        ADDM7,           4, 1)
+REG32(CR3,         0x08)
+    /* reserved: 31:25, 16 */
+    FIELD(CR3,        TCBGTIE,        24, 1)
+    FIELD(CR3,        UCESM,          23, 1)
+    FIELD(CR3,        WUFIE,          22, 1)
+    FIELD(CR3,        WUS,            20, 2)
+    FIELD(CR3,        SCARCNT,        17, 3)
+    FIELD(CR3,        DEP,            15, 1)
+    FIELD(CR3,        DEM,            14, 1)
+    FIELD(CR3,        DDRE,           13, 1)
+    FIELD(CR3,        OVRDIS,         12, 1)
+    FIELD(CR3,        ONEBIT,         11, 1)
+    FIELD(CR3,        CTSIE,          10, 1)
+    FIELD(CR3,        CTSE,            9, 1)
+    FIELD(CR3,        RTSE,            8, 1)
+    FIELD(CR3,        DMAT,            7, 1)
+    FIELD(CR3,        DMAR,            6, 1)
+    FIELD(CR3,        SCEN,            5, 1)
+    FIELD(CR3,        NACK,            4, 1)
+    FIELD(CR3,        HDSEL,           3, 1)
+    FIELD(CR3,        IRLP,            2, 1)
+    FIELD(CR3,        IREN,            1, 1)
+    FIELD(CR3,        EIE,             0, 1)
+REG32(BRR,         0x0c)
+    /* reserved: 31:16 */
+    FIELD(BRR,        BRR,             0, 15)
+REG32(GTPR,        0x10)
+    /* reserved: 31:16 */
+    FIELD(GTPR,       GT,              8, 8)
+    FIELD(GTPR,       PSC,             0, 8)
+REG32(RTOR,        0x14)
+    FIELD(RTOR,       BLEN,           24, 8)
+    FIELD(RTOR,       RTO,             0, 24)
+REG32(RQR,         0x18)
+    /* reserved: 31:5 */
+    FIELD(RQR,        TXFRQ,           4, 1)
+    FIELD(RQR,        RXFRQ,           3, 1)
+    FIELD(RQR,        MMRQ,            2, 1)
+    FIELD(RQR,        SBKRQ,           1, 1)
+    FIELD(RQR,        ABRRQ,           0, 1)
+REG32(ISR,         0x1c)
+    /* reserved: 31:26, 24:23, 13 */
+    FIELD(ISR,        TCBGT,          25, 1)
+    FIELD(ISR,        REACK,          22, 1)
+    FIELD(ISR,        TEACK,          21, 1)
+    FIELD(ISR,        WUF,            20, 1)
+    FIELD(ISR,        RWU,            19, 1)
+    FIELD(ISR,        SBKF,           18, 1)
+    FIELD(ISR,        CMF,            17, 1)
+    FIELD(ISR,        BUSY,           16, 1)
+    FIELD(ISR,        ABRF,           15, 1)
+    FIELD(ISR,        ABRE,           14, 1)
+    FIELD(ISR,        EOBF,           12, 1)
+    FIELD(ISR,        RTOF,           11, 1)
+    FIELD(ISR,        CTS,            10, 1)
+    FIELD(ISR,        CTSIF,           9, 1)
+    FIELD(ISR,        LBDF,            8, 1)
+    FIELD(ISR,        TXE,             7, 1)
+    FIELD(ISR,        TC,              6, 1)
+    FIELD(ISR,        RXNE,            5, 1)
+    FIELD(ISR,        IDLE,            4, 1)
+    FIELD(ISR,        ORE,             3, 1)
+    FIELD(ISR,        NF,              2, 1)
+    FIELD(ISR,        FE,              1, 1)
+    FIELD(ISR,        PE,              0, 1)
+REG32(ICR,         0x20)
+    /* reserved: 31:21, 19:18, 16:13, 10, 5 */
+    FIELD(ICR,        WUCF,           20, 1)
+    FIELD(ICR,        CMCF,           17, 1)
+    FIELD(ICR,        EOBCF,          12, 1)
+    FIELD(ICR,        RTOCF,          11, 1)
+    FIELD(ICR,        CTSCF,           9, 1)
+    FIELD(ICR,        LBDCF,           8, 1)
+    FIELD(ICR,        TCBGTCF,         7, 1)
+    FIELD(ICR,        TCCF,            6, 1)
+    FIELD(ICR,        IDLECF,          4, 1)
+    FIELD(ICR,        ORECF,           3, 1)
+    FIELD(ICR,        NCF,             2, 1)
+    FIELD(ICR,        FECF,            1, 1)
+    FIELD(ICR,        PECF,            0, 1)
+REG32(RDR,         0x24)
+    /* reserved: 31:9 */
+    FIELD(RDR,        RDR,             0, 9)
+REG32(TDR,         0x28)
+    /* reserved: 31:9 */
+    FIELD(TDR,        TDR,             0, 9)
+
+
+static int stm32f7xx_usart_can_receive(void *opaque)
+{
+    /* STM32F7XXUSARTState *s = opaque; */
+
+    /* if (!(s->usart_sr & USART_SR_RXNE)) { */
+    /*     return 1; */
+    /* } */
+
+    return 0;
+}
+
+static void stm32f7xx_usart_receive(void *opaque, const uint8_t *buf, int size)
+{
+#if 0
+    STM32F7XXUSARTState *s = opaque;
+
+    if (!(s->usart_cr1 & USART_CR1_UE && s->usart_cr1 & USART_CR1_RE)) {
+        /* USART not enabled - drop the chars */
+        DB_PRINT("Dropping the chars\n");
+        return;
+    }
+
+    s->usart_dr = *buf;
+    s->usart_sr |= USART_SR_RXNE;
+
+    if (s->usart_cr1 & USART_CR1_RXNEIE) {
+        qemu_set_irq(s->irq, 1);
+    }
+
+    DB_PRINT("Receiving: %c\n", s->usart_dr);
+#endif
+}
+
+static uint32_t stm32f7xx_usart_read(void *opaque, hwaddr addr,
+                                     unsigned int size)
+{
+    STM32F7XXUSARTState *s = opaque;
+
+    trace_stm32f7xx_usart_read(addr);
+
+    switch (addr) {
+    case A_CR1:
+        return s->regs[R_CR1];
+    case A_CR2:
+        return s->regs[R_CR2];
+    case A_CR3:
+        return s->regs[R_CR3];
+    case A_BRR:
+        return s->regs[R_BRR];
+    case A_GTPR:
+        return s->regs[R_GTPR];
+    case A_RTOR:
+        return s->regs[R_RTOR];
+    case A_RQR:
+        return s->regs[R_RQR];
+    case A_ISR:
+        return s->regs[R_ISR];
+    case A_ICR:
+        return s->regs[R_ICR];
+    case A_RDR:
+        return s->regs[R_RDR];
+    case A_TDR:
+        return s->regs[R_TDR];
+    default:
+        STM32F_LOG_BAD_OFFSET();
+        break;
+    }
+
+    return 0;
+}
+
+static void stm32f7xx_usart_write(void *opaque, hwaddr addr,
+                                  uint32_t value, unsigned int size)
+{
+    STM32F7XXUSARTState *s = opaque;
+    /* unsigned char ch; */
+
+    trace_stm32f7xx_usart_write(addr, value);
+
+    switch (addr) {
+    case A_CR1:
+        s->regs[R_CR1] = value;
+        break;
+    case A_CR2:
+        s->regs[R_CR2] = value;
+        break;
+    case A_CR3:
+        s->regs[R_CR3] = value;
+        break;
+    case A_BRR:
+        s->regs[R_BRR] = value;
+        break;
+    case A_GTPR:
+        s->regs[R_GTPR] = value;
+        break;
+    case A_RTOR:
+        s->regs[R_RTOR] = value;
+        break;
+    case A_RQR:
+        s->regs[R_RQR] = value;
+        break;
+    case A_ISR:
+        s->regs[R_ISR] = value;
+        break;
+    case A_ICR:
+        s->regs[R_ICR] = value;
+        break;
+    case A_RDR:
+        s->regs[R_RDR] = value;
+        break;
+    case A_TDR:
+        if (value < 0xf000) {
+            uint8_t ch = value;
+            /* XXX this blocks entire thread. Rewrite to use
+             * qemu_chr_fe_write and background I/O callbacks */
+            qemu_chr_fe_write_all(&s->chr, &ch, 1);
+            /* XXX I/O are currently synchronous, making it impossible for
+               software to observe transient states where TXE or TC aren't
+               set. Unlike TXE however, which is read-only, software may
+               clear TC by writing 0 to the SR register, so set it again
+               on each write. */
+            /* s->usart_sr |= USART_SR_TC; */
+        }
+        break;
+    default:
+        STM32F_LOG_BAD_OFFSET();
+        break;
+    }
+}
+
+static void stm32f7xx_usart_reset_enter(Object *obj, ResetType type)
+{
+    STM32F7XXUSARTState *s = STM32F7XX_USART(obj);
+
+    memset(s->regs, 0, sizeof(s->regs));
+    s->regs[R_ISR] = 0x020000c0;
+}
+
+static void stm32f7xx_usart_reset_exit(Object *obj)
+{
+    STM32F7XXUSARTState *s = STM32F7XX_USART(obj);
+
+    qemu_set_irq(s->irq, 0);
+}
+
+static void stm32f7xx_usart_init(Object *obj)
+{
+    STM32F7XXUSARTState *s = STM32F7XX_USART(obj);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
+}
+
+static void stm32f7xx_usart_realize(DeviceState *dev, Error **errp)
+{
+    STM32F7XXUSARTState *s = STM32F7XX_USART(dev);
+
+    qemu_chr_fe_set_handlers(&s->chr, stm32f7xx_usart_can_receive,
+                             stm32f7xx_usart_receive, NULL, NULL,
+                             s, NULL, true);
+}
+
+static Property stm32f7xx_usart_properties[] = {
+    DEFINE_PROP_CHR("chardev", STM32F7XXUSARTState, chr),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void stm32f7xx_usart_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    STM32FPeripheralClass *pc = STM32F_PERIPHERAL_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    dc->realize = stm32f7xx_usart_realize;
+    device_class_set_props(dc, stm32f7xx_usart_properties);
+    rc->phases.enter = stm32f7xx_usart_reset_enter;
+    rc->phases.exit = stm32f7xx_usart_reset_exit;
+    pc->mmio_size = 0x400;
+    pc->mmio_read = stm32f7xx_usart_read;
+    pc->mmio_write = stm32f7xx_usart_write;
+}
+
+static const TypeInfo stm32f7xx_usart_info = {
+    .name          = TYPE_STM32F7XX_USART,
+    .parent        = TYPE_STM32F_PERIPHERAL,
+    .instance_size = sizeof(STM32F7XXUSARTState),
+    .instance_init = stm32f7xx_usart_init,
+    .class_init    = stm32f7xx_usart_class_init,
+};
+
+static void stm32f7xx_usart_register_types(void)
+{
+    type_register_static(&stm32f7xx_usart_info);
+}
+
+type_init(stm32f7xx_usart_register_types)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index c2f6e748b0..02dfbcb99a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -376,6 +376,7 @@ config STM32F405_SOC
 config STM32F7XX_SOC
     bool
     select STM32F
+    select STM32F7XX_USART
 
 config XLNX_ZYNQMP_ARM
     bool
diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 6b6cf2fc1d..22b1cf8062 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -41,6 +41,9 @@ config VIRTIO_SERIAL
 config STM32F2XX_USART
     bool
 
+config STM32F7XX_USART
+    bool
+
 config CMSDK_APB_UART
     bool
 
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 7b594f51b8..6230750375 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -31,6 +31,7 @@ softmmu_ss.add(when: 'CONFIG_RENESAS_SCI', if_true: files('renesas_sci.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_UART', if_true: files('sifive_uart.c'))
 softmmu_ss.add(when: 'CONFIG_SH_SCI', if_true: files('sh_serial.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_USART', if_true: files('stm32f2xx_usart.c'))
+softmmu_ss.add(when: 'CONFIG_STM32F7XX_USART', if_true: files('stm32f7xx_usart.c'))
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmuart.c'))
 
 specific_ss.add(when: 'CONFIG_HTIF', if_true: files('riscv_htif.c'))
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 2ecb36232e..41fa3c0b46 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -105,3 +105,7 @@ cadence_uart_baudrate(unsigned baudrate) "baudrate %u"
 # sh_serial.c
 sh_serial_read(char *id, unsigned size, uint64_t offs, uint64_t val) " %s size %d offs 0x%02" PRIx64 " -> 0x%02" PRIx64
 sh_serial_write(char *id, unsigned size, uint64_t offs, uint64_t val) "%s size %d offs 0x%02" PRIx64 " <- 0x%02" PRIx64
+
+# stm32f7xx_usart.c
+stm32f7xx_usart_read(uint64_t addr) " addr: 0x%02" PRIx64
+stm32f7xx_usart_write(uint64_t addr, uint64_t data) "addr: 0x%02" PRIx64 " val: 0x%" PRIx64
-- 
2.38.1


