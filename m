Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD784023CA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:05:31 +0200 (CEST)
Received: from localhost ([::1]:38148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNVAg-0001zr-9H
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mNV41-0001Rc-44; Tue, 07 Sep 2021 02:58:37 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:36719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mNV3y-0001Iq-Om; Tue, 07 Sep 2021 02:58:36 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 60964BCB54E0;
 Tue,  7 Sep 2021 08:58:25 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 7 Sep
 2021 08:58:24 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002b076d2f1-fe67-481e-91df-00cce9b53478,
 984F41D2D9692A95DAA6D5E609006558D983FB00) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 02/10] aspeed/smc: Introduce aspeed_smc_error() helper
Date: Tue, 7 Sep 2021 08:58:14 +0200
Message-ID: <20210907065822.1152443-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907065822.1152443-1-clg@kaod.org>
References: <20210907065822.1152443-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: aa32182f-0359-446b-8179-91b90df68028
X-Ovh-Tracer-Id: 977281122754136937
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefgedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It unifies the errors reported by the Aspeed SMC model and also
removes some use of ctrl->name which will help us for the next
patches.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 97 +++++++++++++++++++++------------------------
 1 file changed, 45 insertions(+), 52 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index c9990f069ea4..b4d92d75a694 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -512,6 +512,9 @@ static void aspeed_2600_smc_reg_to_segment(const AspeedSMCState *s,
     }
 }
 
+#define aspeed_smc_error(fmt, ...)                                      \
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: " fmt "\n", __func__, ## __VA_ARGS__)
+
 static bool aspeed_smc_flash_overlap(const AspeedSMCState *s,
                                      const AspeedSegments *new,
                                      int cs)
@@ -528,11 +531,11 @@ static bool aspeed_smc_flash_overlap(const AspeedSMCState *s,
 
         if (new->addr + new->size > seg.addr &&
             new->addr < seg.addr + seg.size) {
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: new segment CS%d [ 0x%"
-                          HWADDR_PRIx" - 0x%"HWADDR_PRIx" ] overlaps with "
-                          "CS%d [ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\n",
-                          s->ctrl->name, cs, new->addr, new->addr + new->size,
-                          i, seg.addr, seg.addr + seg.size);
+            aspeed_smc_error("new segment CS%d [ 0x%"
+                             HWADDR_PRIx" - 0x%"HWADDR_PRIx" ] overlaps with "
+                             "CS%d [ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]",
+                             cs, new->addr, new->addr + new->size,
+                             i, seg.addr, seg.addr + seg.size);
             return true;
         }
     }
@@ -567,9 +570,8 @@ static void aspeed_smc_flash_set_segment(AspeedSMCState *s, int cs,
 
     /* The start address of CS0 is read-only */
     if (cs == 0 && seg.addr != s->ctrl->flash_window_base) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Tried to change CS0 start address to 0x%"
-                      HWADDR_PRIx "\n", s->ctrl->name, seg.addr);
+        aspeed_smc_error("Tried to change CS0 start address to 0x%"
+                         HWADDR_PRIx, seg.addr);
         seg.addr = s->ctrl->flash_window_base;
         new = s->ctrl->segment_to_reg(s, &seg);
     }
@@ -583,9 +585,8 @@ static void aspeed_smc_flash_set_segment(AspeedSMCState *s, int cs,
         cs == s->ctrl->max_peripherals &&
         seg.addr + seg.size != s->ctrl->segments[cs].addr +
         s->ctrl->segments[cs].size) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Tried to change CS%d end address to 0x%"
-                      HWADDR_PRIx "\n", s->ctrl->name, cs, seg.addr + seg.size);
+        aspeed_smc_error("Tried to change CS%d end address to 0x%"
+                         HWADDR_PRIx, cs, seg.addr + seg.size);
         seg.size = s->ctrl->segments[cs].addr + s->ctrl->segments[cs].size -
             seg.addr;
         new = s->ctrl->segment_to_reg(s, &seg);
@@ -595,17 +596,17 @@ static void aspeed_smc_flash_set_segment(AspeedSMCState *s, int cs,
     if (seg.size &&
         (seg.addr + seg.size <= s->ctrl->flash_window_base ||
          seg.addr > s->ctrl->flash_window_base + s->ctrl->flash_window_size)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: new segment for CS%d is invalid : "
-                      "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\n",
-                      s->ctrl->name, cs, seg.addr, seg.addr + seg.size);
+        aspeed_smc_error("new segment for CS%d is invalid : "
+                         "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]",
+                         cs, seg.addr, seg.addr + seg.size);
         return;
     }
 
     /* Check start address vs. alignment */
     if (seg.size && !QEMU_IS_ALIGNED(seg.addr, seg.size)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: new segment for CS%d is not "
-                      "aligned : [ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\n",
-                      s->ctrl->name, cs, seg.addr, seg.addr + seg.size);
+        aspeed_smc_error("new segment for CS%d is not "
+                         "aligned : [ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]",
+                         cs, seg.addr, seg.addr + seg.size);
     }
 
     /* And segments should not overlap (in the specs) */
@@ -618,16 +619,15 @@ static void aspeed_smc_flash_set_segment(AspeedSMCState *s, int cs,
 static uint64_t aspeed_smc_flash_default_read(void *opaque, hwaddr addr,
                                               unsigned size)
 {
-    qemu_log_mask(LOG_GUEST_ERROR, "%s: To 0x%" HWADDR_PRIx " of size %u"
-                  PRIx64 "\n", __func__, addr, size);
+    aspeed_smc_error("To 0x%" HWADDR_PRIx " of size %u" PRIx64, addr, size);
     return 0;
 }
 
 static void aspeed_smc_flash_default_write(void *opaque, hwaddr addr,
                                            uint64_t data, unsigned size)
 {
-    qemu_log_mask(LOG_GUEST_ERROR, "%s: To 0x%" HWADDR_PRIx " of size %u: 0x%"
-                  PRIx64 "\n", __func__, addr, size, data);
+    aspeed_smc_error("To 0x%" HWADDR_PRIx " of size %u: 0x%" PRIx64,
+                     addr, size, data);
 }
 
 static const MemoryRegionOps aspeed_smc_flash_default_ops = {
@@ -670,8 +670,8 @@ static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
     }
 
     if (!cmd) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: no command defined for mode %d\n",
-                      __func__, aspeed_smc_flash_mode(fl));
+        aspeed_smc_error("no command defined for mode %d",
+                         aspeed_smc_flash_mode(fl));
     }
 
     return cmd;
@@ -715,11 +715,9 @@ static uint32_t aspeed_smc_check_segment_addr(const AspeedSMCFlash *fl,
 
     s->ctrl->reg_to_segment(s, s->regs[R_SEG_ADDR0 + fl->id], &seg);
     if ((addr % seg.size) != addr) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid address 0x%08x for CS%d segment : "
-                      "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\n",
-                      s->ctrl->name, addr, fl->id, seg.addr,
-                      seg.addr + seg.size);
+        aspeed_smc_error("invalid address 0x%08x for CS%d segment : "
+                         "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]",
+                         addr, fl->id, seg.addr, seg.addr + seg.size);
         addr %= seg.size;
     }
 
@@ -795,8 +793,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
         aspeed_smc_flash_unselect(fl);
         break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid flash mode %d\n",
-                      __func__, aspeed_smc_flash_mode(fl));
+        aspeed_smc_error("invalid flash mode %d", aspeed_smc_flash_mode(fl));
     }
 
     trace_aspeed_smc_flash_read(fl->id, addr, size, ret,
@@ -913,8 +910,7 @@ static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
                                  aspeed_smc_flash_mode(fl));
 
     if (!aspeed_smc_is_writable(fl)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: flash is not writable at 0x%"
-                      HWADDR_PRIx "\n", __func__, addr);
+        aspeed_smc_error("flash is not writable at 0x%" HWADDR_PRIx, addr);
         return;
     }
 
@@ -939,8 +935,7 @@ static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
         aspeed_smc_flash_unselect(fl);
         break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid flash mode %d\n",
-                      __func__, aspeed_smc_flash_mode(fl));
+        aspeed_smc_error("invalid flash mode %d", aspeed_smc_flash_mode(fl));
     }
 }
 
@@ -1066,7 +1061,7 @@ static uint8_t aspeed_smc_hclk_divisor(uint8_t hclk_mask)
         }
     }
 
-    qemu_log_mask(LOG_GUEST_ERROR, "invalid HCLK mask %x", hclk_mask);
+    aspeed_smc_error("invalid HCLK mask %x", hclk_mask);
     return 0;
 }
 
@@ -1146,8 +1141,7 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *s)
     uint32_t data;
 
     if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid direction for DMA checksum\n",  __func__);
+        aspeed_smc_error("invalid direction for DMA checksum");
         return;
     }
 
@@ -1159,8 +1153,8 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *s)
         data = address_space_ldl_le(&s->flash_as, s->regs[R_DMA_FLASH_ADDR],
                                     MEMTXATTRS_UNSPECIFIED, &result);
         if (result != MEMTX_OK) {
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: Flash read failed @%08x\n",
-                          __func__, s->regs[R_DMA_FLASH_ADDR]);
+            aspeed_smc_error("Flash read failed @%08x",
+                             s->regs[R_DMA_FLASH_ADDR]);
             return;
         }
         trace_aspeed_smc_dma_checksum(s->regs[R_DMA_FLASH_ADDR], data);
@@ -1195,32 +1189,32 @@ static void aspeed_smc_dma_rw(AspeedSMCState *s)
             data = address_space_ldl_le(&s->dram_as, s->regs[R_DMA_DRAM_ADDR],
                                         MEMTXATTRS_UNSPECIFIED, &result);
             if (result != MEMTX_OK) {
-                qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM read failed @%08x\n",
-                              __func__, s->regs[R_DMA_DRAM_ADDR]);
+                aspeed_smc_error("DRAM read failed @%08x",
+                                 s->regs[R_DMA_DRAM_ADDR]);
                 return;
             }
 
             address_space_stl_le(&s->flash_as, s->regs[R_DMA_FLASH_ADDR],
                                  data, MEMTXATTRS_UNSPECIFIED, &result);
             if (result != MEMTX_OK) {
-                qemu_log_mask(LOG_GUEST_ERROR, "%s: Flash write failed @%08x\n",
-                              __func__, s->regs[R_DMA_FLASH_ADDR]);
+                aspeed_smc_error("Flash write failed @%08x",
+                                 s->regs[R_DMA_FLASH_ADDR]);
                 return;
             }
         } else {
             data = address_space_ldl_le(&s->flash_as, s->regs[R_DMA_FLASH_ADDR],
                                         MEMTXATTRS_UNSPECIFIED, &result);
             if (result != MEMTX_OK) {
-                qemu_log_mask(LOG_GUEST_ERROR, "%s: Flash read failed @%08x\n",
-                              __func__, s->regs[R_DMA_FLASH_ADDR]);
+                aspeed_smc_error("Flash read failed @%08x",
+                                 s->regs[R_DMA_FLASH_ADDR]);
                 return;
             }
 
             address_space_stl_le(&s->dram_as, s->regs[R_DMA_DRAM_ADDR],
                                  data, MEMTXATTRS_UNSPECIFIED, &result);
             if (result != MEMTX_OK) {
-                qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM write failed @%08x\n",
-                              __func__, s->regs[R_DMA_DRAM_ADDR]);
+                aspeed_smc_error("DRAM write failed @%08x",
+                                 s->regs[R_DMA_DRAM_ADDR]);
                 return;
             }
         }
@@ -1280,7 +1274,7 @@ static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint32_t dma_ctrl)
     }
 
     if (aspeed_smc_dma_in_progress(s)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA in progress\n",  __func__);
+        aspeed_smc_error("DMA in progress !");
         return;
     }
 
@@ -1302,7 +1296,7 @@ static inline bool aspeed_smc_dma_granted(AspeedSMCState *s)
     }
 
     if (!(s->regs[R_DMA_CTRL] & DMA_CTRL_GRANT)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA not granted\n",  __func__);
+        aspeed_smc_error("DMA not granted");
         return false;
     }
 
@@ -1327,7 +1321,7 @@ static void aspeed_2600_smc_dma_ctrl(AspeedSMCState *s, uint32_t dma_ctrl)
     }
 
     if (!aspeed_smc_dma_granted(s)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA not granted\n",  __func__);
+        aspeed_smc_error("DMA not granted");
         return;
     }
 
@@ -1433,8 +1427,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
     /* Enforce some real HW limits */
     if (s->num_cs > s->ctrl->max_peripherals) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: num_cs cannot exceed: %d\n",
-                      __func__, s->ctrl->max_peripherals);
+        aspeed_smc_error("num_cs cannot exceed: %d", s->ctrl->max_peripherals);
         s->num_cs = s->ctrl->max_peripherals;
     }
 
-- 
2.31.1


