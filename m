Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A34943071E
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 09:52:14 +0200 (CEST)
Received: from localhost ([::1]:55950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mc0xp-0000OV-6D
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 03:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <benh@kernel.crashing.org>)
 id 1mc0wP-0007rm-QO; Sun, 17 Oct 2021 03:50:45 -0400
Received: from gate.crashing.org ([63.228.1.57]:35541)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <benh@kernel.crashing.org>)
 id 1mc0wN-00036Q-Hb; Sun, 17 Oct 2021 03:50:45 -0400
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 19H7mXLp021689;
 Sun, 17 Oct 2021 02:48:34 -0500
Message-ID: <5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
Subject: [PATCH 1/2] hw/misc/bcm2835_property: Fix framebuffer with recent
 RPi kernels
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: qemu-devel@nongnu.org
Date: Sun, 17 Oct 2021 18:48:32 +1100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.228.1.57;
 envelope-from=benh@kernel.crashing.org; helo=gate.crashing.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: qemu-arm@nongnu.org,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The framebuffer driver fails to initialize with recent Raspberry Pi
kernels, such as the ones shipped in the current RaspiOS images
(with the out of tree bcm2708_fb.c driver)

The reason is that this driver uses a new firmware call to query the
number of displays, and the fallback when this call fails is broken.

So implement the call and claim we have exactly one display

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 hw/misc/bcm2835_property.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 73941bdae9..b958fa6a5c 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -269,6 +269,10 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             stl_le_phys(&s->dma_as, value + 12, 0);
             resplen = 4;
             break;
+        case 0x00040013: /* Get num displays */
+            stl_le_phys(&s->dma_as, value + 12, 1);
+            resplen = 4;
+            break;
 
         case 0x00060001: /* Get DMA channels */
             /* channels 2-5 */



