Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63248DDD0F
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Oct 2019 08:39:36 +0200 (CEST)
Received: from localhost ([::1]:52088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iM4sJ-0000TT-Dz
	for lists+qemu-devel@lfdr.de; Sun, 20 Oct 2019 02:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>) id 1iM4qz-0008DX-SG
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 02:38:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <svens@stackframe.org>) id 1iM4qy-00065m-I2
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 02:38:13 -0400
Received: from smtp.duncanthrax.net ([2001:470:70c5:1111::170]:37685)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <svens@stackframe.org>)
 id 1iM4qy-00064f-0k; Sun, 20 Oct 2019 02:38:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From;
 bh=qKAb18eIuousbFVAtmAKlNb+GEQxdTv5Etq0k88S7zw=; b=aELDLvmnGxAfnDse1dJhnNXCxU
 LF9/PeKOry3Z21pgynmX4UywgWNc4Pg8p+sBCCCuNv+Syi1WDJK4gycqOJ17n+6okj2Mj/7Q4rp8M
 uEIWdU0hO58PS6WNv0vlLeyrSLN5CGV86B9rAhdY+3LMA2iLGA/ZlsFfn59MxJfT3I5s=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de
 ([46.5.233.221] helo=x280.stackframe.org)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1iM4qw-00005V-4I; Sun, 20 Oct 2019 08:38:10 +0200
From: Sven Schnelle <svens@stackframe.org>
To: John Snow <jsnow@redhat.com>
Subject: [PATCH] fdc: support READ command with VERIFY DMA mode
Date: Sun, 20 Oct 2019 08:38:00 +0200
Message-Id: <20191020063800.29208-1-svens@stackframe.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:470:70c5:1111::170
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
Cc: Kevin Wolf <kwolf@redhat.com>, Sven Schnelle <svens@stackframe.org>,
 qemu-devel@nongnu.org, "open list:Floppy" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While working on the Tulip driver i tried to write some Teledisk images to
a floppy image which didn't work. Turned out that Teledisk checks the written
data by issuing a READ command to the FDC but running the DMA controller
in VERIFY mode. As we ignored the DMA request in that case, the DMA transfer
never finished, and Teledisk reported an error.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 hw/block/fdc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index ac5d31e8c1..8a1228df78 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -1733,7 +1733,8 @@ static void fdctrl_start_transfer(FDCtrl *fdctrl, int direction)
             dma_mode_ok = (dma_mode == ISADMA_TRANSFER_WRITE);
             break;
         case FD_DIR_READ:
-            dma_mode_ok = (dma_mode == ISADMA_TRANSFER_READ);
+            dma_mode_ok = (dma_mode == ISADMA_TRANSFER_READ) ||
+                          (dma_mode == ISADMA_TRANSFER_VERIFY);
             break;
         case FD_DIR_VERIFY:
             dma_mode_ok = true;
@@ -1835,8 +1836,11 @@ static int fdctrl_transfer_handler (void *opaque, int nchan,
         switch (fdctrl->data_dir) {
         case FD_DIR_READ:
             /* READ commands */
-            k->write_memory(fdctrl->dma, nchan, fdctrl->fifo + rel_pos,
-                            fdctrl->data_pos, len);
+            if (k->get_transfer_mode(fdctrl->dma, fdctrl->dma_chann) !=
+                ISADMA_TRANSFER_VERIFY) {
+                k->write_memory(fdctrl->dma, nchan, fdctrl->fifo + rel_pos,
+                        fdctrl->data_pos, len);
+            }
             break;
         case FD_DIR_WRITE:
             /* WRITE commands */
-- 
2.23.0


