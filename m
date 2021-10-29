Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D354400DE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:01:45 +0200 (CEST)
Received: from localhost ([::1]:36290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVGC-0007vJ-75
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUvo-000777-CW
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:40 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:51092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUvl-0005L2-HP
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:40 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0D5FF7561D9;
 Fri, 29 Oct 2021 18:40:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7FFA5756047; Fri, 29 Oct 2021 18:40:26 +0200 (CEST)
Message-Id: <3b3ba2a3063b4aec4f6344e082df67d372573068.1635524617.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635524616.git.balaton@eik.bme.hu>
References: <cover.1635524616.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 07/25] hw/char/sh_serial: Split off sh_serial_reset() from
 sh_serial_init()
Date: Fri, 29 Oct 2021 18:23:36 +0200
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/char/sh_serial.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 5ee93dc732..80a548d19d 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -381,18 +381,8 @@ static const MemoryRegionOps sh_serial_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-void sh_serial_init(MemoryRegion *sysmem,
-                    hwaddr base, int feat,
-                    uint32_t freq, Chardev *chr,
-                    qemu_irq eri_source,
-                    qemu_irq rxi_source,
-                    qemu_irq txi_source,
-                    qemu_irq tei_source,
-                    qemu_irq bri_source)
+static void sh_serial_reset(SHSerialState *s)
 {
-    SHSerialState *s = g_malloc0(sizeof(*s));
-
-    s->feat = feat;
     s->flags = SH_SERIAL_FLAG_TEND | SH_SERIAL_FLAG_TDE;
     s->rtrg = 1;
 
@@ -401,13 +391,28 @@ void sh_serial_init(MemoryRegion *sysmem,
     s->scr = 1 << 5; /* pretend that TX is enabled so early printk works */
     s->sptr = 0;
 
-    if (feat & SH_SERIAL_FEAT_SCIF) {
+    if (s->feat & SH_SERIAL_FEAT_SCIF) {
         s->fcr = 0;
     } else {
         s->dr = 0xff;
     }
 
     sh_serial_clear_fifo(s);
+}
+
+void sh_serial_init(MemoryRegion *sysmem,
+                    hwaddr base, int feat,
+                    uint32_t freq, Chardev *chr,
+                    qemu_irq eri_source,
+                    qemu_irq rxi_source,
+                    qemu_irq txi_source,
+                    qemu_irq tei_source,
+                    qemu_irq bri_source)
+{
+    SHSerialState *s = g_malloc0(sizeof(*s));
+
+    s->feat = feat;
+    sh_serial_reset(s);
 
     memory_region_init_io(&s->iomem, NULL, &sh_serial_ops, s,
                           "serial", 0x100000000ULL);
-- 
2.21.4


