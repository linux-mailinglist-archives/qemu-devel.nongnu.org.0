Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89F5FDE4D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 18:36:52 +0200 (CEST)
Received: from localhost ([::1]:34066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj1CV-0002qS-4Z
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 12:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0pV-0000jL-DW; Thu, 13 Oct 2022 12:13:05 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0pR-0002du-RJ; Thu, 13 Oct 2022 12:13:05 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MpF132669z4xGx;
 Fri, 14 Oct 2022 03:12:55 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MpF0z6VCtz4xFy;
 Fri, 14 Oct 2022 03:12:51 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 01/10] m25p80: Add basic support for the SFDP command
Date: Thu, 13 Oct 2022 18:12:32 +0200
Message-Id: <20221013161241.2805140-2-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013161241.2805140-1-clg@kaod.org>
References: <20221013161241.2805140-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=HNeY=2O=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

JEDEC STANDARD JESD216 for Serial Flash Discovery Parameters (SFDP)
provides a mean to describe the features of a serial flash device
using a set of internal parameter tables.

This is the initial framework for the RDSFDP command giving access to
a private SFDP area under the flash. This area now needs to be
populated with the flash device characteristics, using a new
'sfdp_read' handler under FlashPartInfo.

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220722063602.128144-2-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80_sfdp.h | 18 ++++++++++++++++++
 hw/block/m25p80.c      | 27 +++++++++++++++++++++++++++
 MAINTAINERS            |  2 +-
 hw/block/trace-events  |  1 +
 4 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 hw/block/m25p80_sfdp.h

diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
new file mode 100644
index 000000000000..230b07ef3308
--- /dev/null
+++ b/hw/block/m25p80_sfdp.h
@@ -0,0 +1,18 @@
+/*
+ * M25P80 SFDP
+ *
+ * Copyright (c) 2020, IBM Corporation.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+
+#ifndef HW_M25P80_SFDP_H
+#define HW_M25P80_SFDP_H
+
+/*
+ * SFDP area has a 3 bytes address space.
+ */
+#define M25P80_SFDP_MAX_SIZE  (1 << 24)
+
+#endif
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index a8d2519141f7..abdc4c0b0da7 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -35,6 +35,7 @@
 #include "qapi/error.h"
 #include "trace.h"
 #include "qom/object.h"
+#include "m25p80_sfdp.h"
 
 /* 16 MiB max in 3 byte address mode */
 #define MAX_3BYTES_SIZE 0x1000000
@@ -72,6 +73,7 @@ typedef struct FlashPartInfo {
      * This field inform how many die is in the chip.
      */
     uint8_t die_cnt;
+    uint8_t (*sfdp_read)(uint32_t sfdp_addr);
 } FlashPartInfo;
 
 /* adapted from linux */
@@ -355,6 +357,7 @@ typedef enum {
     BULK_ERASE = 0xc7,
     READ_FSR = 0x70,
     RDCR = 0x15,
+    RDSFDP = 0x5a,
 
     READ = 0x03,
     READ4 = 0x13,
@@ -421,6 +424,7 @@ typedef enum {
     STATE_COLLECTING_DATA,
     STATE_COLLECTING_VAR_LEN_DATA,
     STATE_READING_DATA,
+    STATE_READING_SFDP,
 } CMDState;
 
 typedef enum {
@@ -679,6 +683,8 @@ static inline int get_addr_length(Flash *s)
     }
 
    switch (s->cmd_in_progress) {
+   case RDSFDP:
+       return 3;
    case PP4:
    case PP4_4:
    case QPP_4:
@@ -823,6 +829,11 @@ static void complete_collecting_data(Flash *s)
                           " by device\n");
         }
         break;
+
+    case RDSFDP:
+        s->state = STATE_READING_SFDP;
+        break;
+
     default:
         break;
     }
@@ -1431,6 +1442,16 @@ static void decode_new_cmd(Flash *s, uint32_t value)
             qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
         }
         break;
+    case RDSFDP:
+        if (s->pi->sfdp_read) {
+            s->needed_bytes = get_addr_length(s) + 1; /* SFDP addr + dummy */
+            s->pos = 0;
+            s->len = 0;
+            s->state = STATE_COLLECTING_DATA;
+            break;
+        }
+        /* Fallthrough */
+
     default:
         s->pos = 0;
         s->len = 1;
@@ -1538,6 +1559,12 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
             }
         }
         break;
+    case STATE_READING_SFDP:
+        assert(s->pi->sfdp_read);
+        r = s->pi->sfdp_read(s->cur_addr);
+        trace_m25p80_read_sfdp(s, s->cur_addr, (uint8_t)r);
+        s->cur_addr = (s->cur_addr + 1) & (M25P80_SFDP_MAX_SIZE - 1);
+        break;
 
     default:
     case STATE_IDLE:
diff --git a/MAINTAINERS b/MAINTAINERS
index e1530b51a2f3..64508412fc4f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1915,7 +1915,7 @@ SSI
 M: Alistair Francis <alistair@alistair23.me>
 S: Maintained
 F: hw/ssi/*
-F: hw/block/m25p80.c
+F: hw/block/m25p80*
 F: include/hw/ssi/ssi.h
 X: hw/ssi/xilinx_*
 F: tests/qtest/m25p80-test.c
diff --git a/hw/block/trace-events b/hw/block/trace-events
index d86b53520cc5..2c45a62bd59c 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -80,5 +80,6 @@ m25p80_page_program(void *s, uint32_t addr, uint8_t tx) "[%p] page program cur_a
 m25p80_transfer(void *s, uint8_t state, uint32_t len, uint8_t needed, uint32_t pos, uint32_t cur_addr, uint8_t t) "[%p] Transfer state 0x%"PRIx8" len 0x%"PRIx32" needed 0x%"PRIx8" pos 0x%"PRIx32" addr 0x%"PRIx32" tx 0x%"PRIx8
 m25p80_read_byte(void *s, uint32_t addr, uint8_t v) "[%p] Read byte 0x%"PRIx32"=0x%"PRIx8
 m25p80_read_data(void *s, uint32_t pos, uint8_t v) "[%p] Read data 0x%"PRIx32"=0x%"PRIx8
+m25p80_read_sfdp(void *s, uint32_t addr, uint8_t v) "[%p] Read SFDP 0x%"PRIx32"=0x%"PRIx8
 m25p80_binding(void *s) "[%p] Binding to IF_MTD drive"
 m25p80_binding_no_bdrv(void *s) "[%p] No BDRV - binding to RAM"
-- 
2.37.3


