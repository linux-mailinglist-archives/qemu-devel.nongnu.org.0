Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619233B3CF7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 09:01:55 +0200 (CEST)
Received: from localhost ([::1]:34082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwfqc-0000O2-E2
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 03:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwfjP-0005uI-KV
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 02:54:27 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:58744
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwfjI-0001sd-7x
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 02:54:27 -0400
Received: from host109-153-84-9.range109-153.btcentralplus.com ([109.153.84.9]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwfj4-0006FO-6A; Fri, 25 Jun 2021 07:54:06 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 jasowang@redhat.com, fthain@telegraphics.com.au, laurent@vivier.eu
Date: Fri, 25 Jun 2021 07:54:00 +0100
Message-Id: <20210625065401.30170-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 09/10] dp8393x: fix CAM descriptor entry index
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently when a LOAD CAM command is executed the entries are loaded into the
CAM from memory in order which is incorrect. According to the datasheet the
first entry in the CAM descriptor is the entry index which means that each
descriptor may update any single entry in the CAM rather than the Nth entry.

Decode the CAM entry index and use it store the descriptor in the appropriate
slot in the CAM. This fixes the issue where the MacOS toolbox loads a single
CAM descriptor into the final slot in order to perform a loopback test which
must succeed before the Ethernet port is enabled.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/dp8393x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 6789bcd3af..172fd06694 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -270,7 +270,7 @@ static void dp8393x_update_irq(dp8393xState *s)
 static void dp8393x_do_load_cam(dp8393xState *s)
 {
     int width, size;
-    uint16_t index = 0;
+    uint16_t index;
 
     width = (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
     size = sizeof(uint16_t) * 4 * width;
@@ -279,6 +279,7 @@ static void dp8393x_do_load_cam(dp8393xState *s)
         /* Fill current entry */
         address_space_read(&s->as, dp8393x_cdp(s),
                            MEMTXATTRS_UNSPECIFIED, s->data, size);
+        index = dp8393x_get(s, width, 0) & 0xf;
         s->cam[index][0] = dp8393x_get(s, width, 1) & 0xff;
         s->cam[index][1] = dp8393x_get(s, width, 1) >> 8;
         s->cam[index][2] = dp8393x_get(s, width, 2) & 0xff;
@@ -291,7 +292,6 @@ static void dp8393x_do_load_cam(dp8393xState *s)
         /* Move to next entry */
         s->regs[SONIC_CDC]--;
         s->regs[SONIC_CDP] += size;
-        index++;
     }
 
     /* Read CAM enable */
-- 
2.20.1


