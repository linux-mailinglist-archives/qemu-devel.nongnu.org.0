Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54C12BA479
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 09:19:49 +0100 (CET)
Received: from localhost ([::1]:59990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg1e0-0000hk-Bw
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 03:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kg1cS-0000DE-BL
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 03:18:12 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:58722
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kg1cP-0005Xp-HV
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 03:18:11 -0500
Received: from host86-179-247-26.range86-179.btcentralplus.com
 ([86.179.247.26] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kg1ca-0005O1-2b; Fri, 20 Nov 2020 08:18:21 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: f4bug@amsat.org, gson@gson.org, 1892540@bugs.launchpad.net,
 qemu-devel@nongnu.org
Date: Fri, 20 Nov 2020 08:17:54 +0000
Message-Id: <20201120081754.18250-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.247.26
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH for-5.2] hw/display/tcx: add missing 64-bit access for
 framebuffer blitter
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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

Commit ae5643ecc6 "hw/display/tcx: Allow 64-bit accesses to framebuffer stippler
and blitter" enabled 64-bit access for the TCX framebuffer stippler and blitter
but missed applying the change to one of the blitter MemoryRegions.

Whilst the original change works for me on my local NetBSD test image, the latest
NetBSD ISO panics on startup without this fix.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: ae5643ecc6 ("hw/display/tcx: Allow 64-bit accesses to framebuffer stippler and blitter")
Buglink: https://bugs.launchpad.net/bugs/1892540
---
 hw/display/tcx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index 878ecc8c50..3799d29b75 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -649,10 +649,14 @@ static const MemoryRegionOps tcx_blit_ops = {
     .read = tcx_blit_readl,
     .write = tcx_blit_writel,
     .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
+    .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
 };
 
 static const MemoryRegionOps tcx_rblit_ops = {
-- 
2.20.1


