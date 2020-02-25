Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F8B16F37F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 00:35:11 +0100 (CET)
Received: from localhost ([::1]:36096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6jjK-0008S0-7K
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 18:35:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48090)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <boyarsh@altlinux.org>) id 1j6gW0-0006yw-4T
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 15:09:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <boyarsh@altlinux.org>) id 1j6gVy-0005tl-PG
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 15:09:11 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:53056)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <boyarsh@altlinux.org>) id 1j6gVy-0005m9-HW
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 15:09:10 -0500
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id BC83572CCEF;
 Tue, 25 Feb 2020 23:09:07 +0300 (MSK)
Received: from x230.localdomain (109-252-52-89.nat.spd-mgts.ru [109.252.52.89])
 by imap.altlinux.org (Postfix) with ESMTPSA id 9F9A54A4A2A;
 Tue, 25 Feb 2020 23:09:07 +0300 (MSK)
Date: Tue, 25 Feb 2020 23:09:14 +0300
From: "Anton V. Boyarshinov" <boyarsh@altlinux.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] Arithmetic error fixed in EDID generation
Message-ID: <20200225200914.3ec2c07b@x230.localdomain>
Organization: ALT Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-alt-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 194.107.17.57
X-Mailman-Approved-At: Tue, 25 Feb 2020 18:34:07 -0500
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
Cc: shaba@altlinux.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To compute screen size in centimeters we should calculate:
pixels/dpi*2.54
but not
pixels*dpi/2540

Using wrong formula we actually get 65 DPI and very small fonts.

Signed-off-by: Anton V. Boyarshinov <boyarsh@altlinux.org>
---
 hw/display/edid-generate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index 75c945a948..537e063662 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -360,8 +360,8 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
     edid[20] = 0xa5;
 
     /* screen size: undefined */
-    edid[21] = info->prefx * info->dpi / 2540;
-    edid[22] = info->prefy * info->dpi / 2540;
+    edid[21] = (uint8_t) ((float) info->prefx / info->dpi * 2.54);
+    edid[22] = (uint8_t) ((float) info->prefy / info->dpi * 2.54);
 
     /* display gamma: 2.2 */
     edid[23] = 220 - 100;
-- 
2.21.0



