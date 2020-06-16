Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0091FA53B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 02:42:32 +0200 (CEST)
Received: from localhost ([::1]:49950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkzgN-0004oW-Lc
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 20:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkzZv-0004fI-7j
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 20:35:51 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:46226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkzZr-0003z0-Ic
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 20:35:50 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 218C8748DE0;
 Tue, 16 Jun 2020 02:35:41 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7CA94748DCB; Tue, 16 Jun 2020 02:35:40 +0200 (CEST)
Message-Id: <a972d774b01c3fa1b6f65eeeb35e8ff71a893deb.1592266950.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1592266950.git.balaton@eik.bme.hu>
References: <cover.1592266950.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 8/8] sm501: Convert debug printfs to traces
Date: Tue, 16 Jun 2020 02:22:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Sebastian Bauer <mail@sebastianbauer.info>,
 Magnus Damm <magnus.damm@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c      | 50 +++++++++++------------------------------
 hw/display/trace-events | 12 ++++++++++
 2 files changed, 25 insertions(+), 37 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 583a0ff6b5..abe75f21dc 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -39,15 +39,7 @@
 #include "qemu/range.h"
 #include "ui/pixel_ops.h"
 #include "qemu/bswap.h"
-
-/*#define DEBUG_SM501*/
-/*#define DEBUG_BITBLT*/
-
-#ifdef DEBUG_SM501
-#define SM501_DPRINTF(fmt, ...) printf(fmt, ## __VA_ARGS__)
-#else
-#define SM501_DPRINTF(fmt, ...) do {} while (0)
-#endif
+#include "trace.h"
 
 #define MMIO_BASE_OFFSET 0x3e00000
 #define MMIO_SIZE 0x200000
@@ -871,7 +863,6 @@ static uint64_t sm501_system_config_read(void *opaque, hwaddr addr,
 {
     SM501State *s = (SM501State *)opaque;
     uint32_t ret = 0;
-    SM501_DPRINTF("sm501 system config regs : read addr=%x\n", (int)addr);
 
     switch (addr) {
     case SM501_SYSTEM_CONTROL:
@@ -923,7 +914,7 @@ static uint64_t sm501_system_config_read(void *opaque, hwaddr addr,
         qemu_log_mask(LOG_UNIMP, "sm501: not implemented system config"
                       "register read. addr=%" HWADDR_PRIx "\n", addr);
     }
-
+    trace_sm501_system_config_read(addr, ret);
     return ret;
 }
 
@@ -931,9 +922,8 @@ static void sm501_system_config_write(void *opaque, hwaddr addr,
                                       uint64_t value, unsigned size)
 {
     SM501State *s = (SM501State *)opaque;
-    SM501_DPRINTF("sm501 system config regs : write addr=%x, val=%x\n",
-                  (uint32_t)addr, (uint32_t)value);
 
+    trace_sm501_system_config_write((uint32_t)addr, (uint32_t)value);
     switch (addr) {
     case SM501_SYSTEM_CONTROL:
         s->system_control &= 0x10DB0000;
@@ -1019,9 +1009,7 @@ static uint64_t sm501_i2c_read(void *opaque, hwaddr addr, unsigned size)
         qemu_log_mask(LOG_UNIMP, "sm501 i2c : not implemented register read."
                       " addr=0x%" HWADDR_PRIx "\n", addr);
     }
-
-    SM501_DPRINTF("sm501 i2c regs : read addr=%" HWADDR_PRIx " val=%x\n",
-                  addr, ret);
+    trace_sm501_i2c_read((uint32_t)addr, ret);
     return ret;
 }
 
@@ -1029,9 +1017,8 @@ static void sm501_i2c_write(void *opaque, hwaddr addr, uint64_t value,
                             unsigned size)
 {
     SM501State *s = (SM501State *)opaque;
-    SM501_DPRINTF("sm501 i2c regs : write addr=%" HWADDR_PRIx
-                  " val=%" PRIx64 "\n", addr, value);
 
+    trace_sm501_i2c_write((uint32_t)addr, (uint32_t)value);
     switch (addr) {
     case SM501_I2C_BYTE_COUNT:
         s->i2c_byte_count = value & 0xf;
@@ -1045,25 +1032,19 @@ static void sm501_i2c_write(void *opaque, hwaddr addr, uint64_t value,
                 s->i2c_status |= (res ? SM501_I2C_STATUS_ERROR : 0);
                 if (!res) {
                     int i;
-                    SM501_DPRINTF("sm501 i2c : transferring %d bytes to 0x%x\n",
-                                  s->i2c_byte_count + 1, s->i2c_addr >> 1);
                     for (i = 0; i <= s->i2c_byte_count; i++) {
                         res = i2c_send_recv(s->i2c_bus, &s->i2c_data[i],
                                             !(s->i2c_addr & 1));
                         if (res) {
-                            SM501_DPRINTF("sm501 i2c : transfer failed"
-                                          " i=%d, res=%d\n", i, res);
                             s->i2c_status |= SM501_I2C_STATUS_ERROR;
                             return;
                         }
                     }
                     if (i) {
-                        SM501_DPRINTF("sm501 i2c : transferred %d bytes\n", i);
                         s->i2c_status = SM501_I2C_STATUS_COMPLETE;
                     }
                 }
             } else {
-                SM501_DPRINTF("sm501 i2c : end transfer\n");
                 i2c_end_transfer(s->i2c_bus);
                 s->i2c_status &= ~SM501_I2C_STATUS_ERROR;
             }
@@ -1103,7 +1084,8 @@ static const MemoryRegionOps sm501_i2c_ops = {
 static uint32_t sm501_palette_read(void *opaque, hwaddr addr)
 {
     SM501State *s = (SM501State *)opaque;
-    SM501_DPRINTF("sm501 palette read addr=%x\n", (int)addr);
+
+    trace_sm501_palette_read((uint32_t)addr);
 
     /* TODO : consider BYTE/WORD access */
     /* TODO : consider endian */
@@ -1116,8 +1098,8 @@ static void sm501_palette_write(void *opaque, hwaddr addr,
                                 uint32_t value)
 {
     SM501State *s = (SM501State *)opaque;
-    SM501_DPRINTF("sm501 palette write addr=%x, val=%x\n",
-                  (int)addr, value);
+
+    trace_sm501_palette_write((uint32_t)addr, value);
 
     /* TODO : consider BYTE/WORD access */
     /* TODO : consider endian */
@@ -1132,7 +1114,6 @@ static uint64_t sm501_disp_ctrl_read(void *opaque, hwaddr addr,
 {
     SM501State *s = (SM501State *)opaque;
     uint32_t ret = 0;
-    SM501_DPRINTF("sm501 disp ctrl regs : read addr=%x\n", (int)addr);
 
     switch (addr) {
 
@@ -1237,7 +1218,7 @@ static uint64_t sm501_disp_ctrl_read(void *opaque, hwaddr addr,
         qemu_log_mask(LOG_UNIMP, "sm501: not implemented disp ctrl register "
                       "read. addr=%" HWADDR_PRIx "\n", addr);
     }
-
+    trace_sm501_disp_ctrl_read((uint32_t)addr, ret);
     return ret;
 }
 
@@ -1245,9 +1226,8 @@ static void sm501_disp_ctrl_write(void *opaque, hwaddr addr,
                                   uint64_t value, unsigned size)
 {
     SM501State *s = (SM501State *)opaque;
-    SM501_DPRINTF("sm501 disp ctrl regs : write addr=%x, val=%x\n",
-                  (unsigned)addr, (unsigned)value);
 
+    trace_sm501_disp_ctrl_write((uint32_t)addr, (uint32_t)value);
     switch (addr) {
     case SM501_DC_PANEL_CONTROL:
         s->dc_panel_control = value & 0x0FFF73FF;
@@ -1392,7 +1372,6 @@ static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
 {
     SM501State *s = (SM501State *)opaque;
     uint32_t ret = 0;
-    SM501_DPRINTF("sm501 2d engine regs : read addr=%x\n", (int)addr);
 
     switch (addr) {
     case SM501_2D_SOURCE:
@@ -1462,7 +1441,7 @@ static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
         qemu_log_mask(LOG_UNIMP, "sm501: not implemented disp ctrl register "
                       "read. addr=%" HWADDR_PRIx "\n", addr);
     }
-
+    trace_sm501_2d_engine_read((uint32_t)addr, ret);
     return ret;
 }
 
@@ -1470,9 +1449,8 @@ static void sm501_2d_engine_write(void *opaque, hwaddr addr,
                                   uint64_t value, unsigned size)
 {
     SM501State *s = (SM501State *)opaque;
-    SM501_DPRINTF("sm501 2d engine regs : write addr=%x, val=%x\n",
-                  (unsigned)addr, (unsigned)value);
 
+    trace_sm501_2d_engine_write((uint32_t)addr, (uint32_t)value);
     switch (addr) {
     case SM501_2D_SOURCE:
         s->twoD_source = value;
@@ -1830,8 +1808,6 @@ static void sm501_init(SM501State *s, DeviceState *dev,
                        uint32_t local_mem_bytes)
 {
     s->local_mem_size_index = get_local_mem_size_index(local_mem_bytes);
-    SM501_DPRINTF("sm501 local mem size=%x. index=%d\n", get_local_mem_size(s),
-                  s->local_mem_size_index);
 
     /* local memory */
     memory_region_init_ram(&s->local_mem_region, OBJECT(dev), "sm501.local",
diff --git a/hw/display/trace-events b/hw/display/trace-events
index 72d4c9812c..970d6bac5d 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -161,3 +161,15 @@ cg3_write(uint32_t addr, uint32_t val, unsigned size) "write addr:0x%06"PRIx32"
 # dpcd.c
 dpcd_read(uint32_t addr, uint8_t val) "read addr:0x%"PRIx32" val:0x%02x"
 dpcd_write(uint32_t addr, uint8_t val) "write addr:0x%"PRIx32" val:0x%02x"
+
+# sm501.c
+sm501_system_config_read(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
+sm501_system_config_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
+sm501_i2c_read(uint32_t addr, uint8_t val) "addr=0x%x, val=0x%x"
+sm501_i2c_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
+sm501_palette_read(uint32_t addr) "addr=0x%x"
+sm501_palette_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
+sm501_disp_ctrl_read(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
+sm501_disp_ctrl_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
+sm501_2d_engine_read(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
+sm501_2d_engine_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
-- 
2.21.3


