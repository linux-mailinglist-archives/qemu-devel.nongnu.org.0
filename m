Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05EC5912E0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 17:24:31 +0200 (CEST)
Received: from localhost ([::1]:46932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMWWU-0006Pv-VO
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 11:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Enrik.Berkhan@inka.de>)
 id 1oMVlC-0003ln-Au; Fri, 12 Aug 2022 10:35:38 -0400
Received: from mail.inka.de ([2a04:c9c7:0:1073:217:a4ff:fe3b:e77c]:32968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Enrik.Berkhan@inka.de>)
 id 1oMVl9-0007Od-KS; Fri, 12 Aug 2022 10:35:38 -0400
Received: from mail3.berkhan-weisser.de ([2a03:4000:54:b9a::4])
 by mail.inka.de with esmtpsa 
 id 1oMVl2-0069do-Le; Fri, 12 Aug 2022 16:35:28 +0200
Received: from 127.0.0.1 (helo=localhost.localdomain)
 by mail3.berkhan-weisser.de with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <Enrik.Berkhan@inka.de>)
 id 1oMVl3-006fIY-9i; Fri, 12 Aug 2022 16:35:27 +0200
From: Enrik Berkhan <Enrik.Berkhan@inka.de>
To: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Enrik Berkhan <Enrik.Berkhan@inka.de>
Subject: [PATCH] hw/arm/bcm2835_property: Add support for
 RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS
Date: Fri, 12 Aug 2022 16:35:19 +0200
Message-Id: <20220812143519.59134-1-Enrik.Berkhan@inka.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a04:c9c7:0:1073:217:a4ff:fe3b:e77c;
 envelope-from=Enrik.Berkhan@inka.de; helo=mail.inka.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 12 Aug 2022 11:17:32 -0400
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

In more recent Raspbian OS Linux kernels, the fb driver gives up
immediately if RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS fails or no
displays are reported.

This change simply always reports one display. It makes bcm2835_fb work
again with these more recent kernels.

Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
---
 hw/misc/bcm2835_property.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index e94e951057..890ae7bae5 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -270,6 +270,10 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             stl_le_phys(&s->dma_as, value + 12, 0);
             resplen = 4;
             break;
+        case 0x00040013: /* Get number of displays */
+            stl_le_phys(&s->dma_as, value + 12, 1);
+            resplen = 4;
+            break;
 
         case 0x00060001: /* Get DMA channels */
             /* channels 2-5 */
-- 
2.34.1


