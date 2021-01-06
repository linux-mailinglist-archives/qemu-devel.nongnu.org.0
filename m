Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBBB2EC5D7
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 22:42:11 +0100 (CET)
Received: from localhost ([::1]:39978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxGZG-0007UW-6n
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 16:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxGMa-0002xp-1E
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 16:29:04 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:22496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxGMT-0001kt-4A
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 16:29:03 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D7F267470F7;
 Wed,  6 Jan 2021 22:28:51 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3CC057470F9; Wed,  6 Jan 2021 22:28:51 +0100 (CET)
Message-Id: <cb44c64710ad233039fdfea523ec5fc4fad6a565.1609967638.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609967638.git.balaton@eik.bme.hu>
References: <cover.1609967638.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 08/12] vt82c686: Fix superio_cfg_{read,write}() functions
Date: Wed, 06 Jan 2021 22:13:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These functions are memory region callbacks so we have to check
against relative address not the mapped address. Also reduce
indentation by returning early and log unimplemented accesses.
Additionally we remove separate index value from SuperIOConfig and
store the index at reg 0 which is reserved and returns 0 on read. This
simpilifies object state.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c | 63 ++++++++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 28 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 3a45056226..1a876a1fbf 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -26,6 +26,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/i2c/pm_smbus.h"
 #include "qapi/error.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/range.h"
 #include "qemu/timer.h"
@@ -250,7 +251,6 @@ static const TypeInfo vt8231_pm_info = {
 
 typedef struct SuperIOConfig {
     uint8_t regs[0x100];
-    uint8_t index;
     MemoryRegion io;
 } SuperIOConfig;
 
@@ -258,42 +258,49 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
                               unsigned size)
 {
     SuperIOConfig *sc = opaque;
+    uint8_t idx = sc->regs[0];
 
-    if (addr == 0x3f0) { /* config index register */
-        sc->index = data & 0xff;
-    } else {
-        bool can_write = true;
-        /* 0x3f1, config data register */
-        trace_via_superio_write(sc->index, data & 0xff);
-        switch (sc->index) {
-        case 0x00 ... 0xdf:
-        case 0xe4:
-        case 0xe5:
-        case 0xe9 ... 0xed:
-        case 0xf3:
-        case 0xf5:
-        case 0xf7:
-        case 0xf9 ... 0xfb:
-        case 0xfd ... 0xff:
-            can_write = false;
-            break;
-        /* case 0xe6 ... 0xe8: Should set base port of parallel and serial */
-        default:
-            break;
+    if (addr == 0) { /* config index register */
+        sc->regs[0] = data;
+        return;
+    }
 
-        }
-        if (can_write) {
-            sc->regs[sc->index] = data & 0xff;
-        }
+    /* config data register */
+    trace_via_superio_write(idx, data);
+    switch (idx) {
+    case 0x00 ... 0xdf:
+    case 0xe4:
+    case 0xe5:
+    case 0xe9 ... 0xed:
+    case 0xf3:
+    case 0xf5:
+    case 0xf7:
+    case 0xf9 ... 0xfb:
+    case 0xfd ... 0xff:
+        /* ignore write to read only registers */
+        return;
+    /* case 0xe6 ... 0xe8: Should set base port of parallel and serial */
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "via_superio_cfg: unimplemented register 0x%x\n", idx);
+        break;
     }
+    sc->regs[idx] = data;
 }
 
 static uint64_t superio_cfg_read(void *opaque, hwaddr addr, unsigned size)
 {
     SuperIOConfig *sc = opaque;
-    uint8_t val = sc->regs[sc->index];
+    uint8_t idx = sc->regs[0];
+    uint8_t val = sc->regs[idx];
 
-    trace_via_superio_read(sc->index, val);
+    if (addr == 0) {
+        return idx;
+    }
+    if (addr == 1 && idx == 0) {
+        val = 0; /* reading reg 0 where we store index value */
+    }
+    trace_via_superio_read(idx, val);
     return val;
 }
 
-- 
2.21.3


