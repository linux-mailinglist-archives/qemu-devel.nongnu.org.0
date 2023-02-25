Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5B16A348B
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:16:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPHy-0003Jy-7P; Sun, 26 Feb 2023 17:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPHv-0003H4-Ai; Sun, 26 Feb 2023 17:14:35 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPHs-00050K-Kw; Sun, 26 Feb 2023 17:14:35 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3D538746E5A;
 Sun, 26 Feb 2023 23:14:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1814D746E58; Sun, 26 Feb 2023 23:14:31 +0100 (CET)
Message-Id: <dfd40c3c45fa606e64c22d9010d43d3cf8bd32f8.1677445307.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1677445307.git.balaton@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sat, 25 Feb 2023 23:46:16 +0100
Subject: [PATCH v3 3/8] hw/display/sm501: Add debug property to control pixman
 usage
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 vr_qemu@t-online.de, ReneEngel80@emailn.de
X-Spam-Probability: 12%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add a property to allow disabling pixman and always use the fallbacks
for different operations which is useful for testing different drawing
methods or debugging pixman related issues.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 23c4418e19..f2f7f26751 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -464,6 +464,7 @@ typedef struct SM501State {
     uint32_t last_width;
     uint32_t last_height;
     bool do_full_update; /* perform a full update next time */
+    uint8_t use_pixman;
     I2CBus *i2c_bus;
 
     /* mmio registers */
@@ -826,7 +827,7 @@ static void sm501_2d_operation(SM501State *s)
                 de = db + (width + (height - 1) * dst_pitch) * bypp;
                 overlap = (db < se && sb < de);
             }
-            if (overlap) {
+            if (overlap && (s->use_pixman & BIT(2))) {
                 /* pixman can't do reverse blit: copy via temporary */
                 int tmp_stride = DIV_ROUND_UP(width * bypp, sizeof(uint32_t));
                 uint32_t *tmp = tmp_buf;
@@ -851,13 +852,15 @@ static void sm501_2d_operation(SM501State *s)
                 if (tmp != tmp_buf) {
                     g_free(tmp);
                 }
-            } else {
+            } else if (!overlap && (s->use_pixman & BIT(1))) {
                 fallback = !pixman_blt((uint32_t *)&s->local_mem[src_base],
                                        (uint32_t *)&s->local_mem[dst_base],
                                        src_pitch * bypp / sizeof(uint32_t),
                                        dst_pitch * bypp / sizeof(uint32_t),
                                        8 * bypp, 8 * bypp, src_x, src_y,
                                        dst_x, dst_y, width, height);
+            } else {
+                fallback = true;
             }
             if (fallback) {
                 uint8_t *sp = s->local_mem + src_base;
@@ -890,7 +893,7 @@ static void sm501_2d_operation(SM501State *s)
             color = cpu_to_le16(color);
         }
 
-        if ((width == 1 && height == 1) ||
+        if (!(s->use_pixman & BIT(0)) || (width == 1 && height == 1) ||
             !pixman_fill((uint32_t *)&s->local_mem[dst_base],
                          dst_pitch * bypp / sizeof(uint32_t), 8 * bypp,
                          dst_x, dst_y, width, height, color)) {
@@ -2039,6 +2042,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
 static Property sm501_sysbus_properties[] = {
     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
     DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
+    DEFINE_PROP_UINT8("x-pixman", SM501SysBusState, state.use_pixman, 7),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -2122,6 +2126,7 @@ static void sm501_realize_pci(PCIDevice *dev, Error **errp)
 
 static Property sm501_pci_properties[] = {
     DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),
+    DEFINE_PROP_UINT8("x-pixman", SM501PCIState, state.use_pixman, 7),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -2162,11 +2167,18 @@ static void sm501_pci_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_sm501_pci;
 }
 
+static void sm501_pci_init(Object *o)
+{
+    object_property_set_description(o, "x-pixman", "Use pixman for: "
+                                    "1: fill, 2: blit, 4: overlap blit");
+}
+
 static const TypeInfo sm501_pci_info = {
     .name          = TYPE_PCI_SM501,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(SM501PCIState),
     .class_init    = sm501_pci_class_init,
+    .instance_init = sm501_pci_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
-- 
2.30.7


