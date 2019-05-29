Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101852DC99
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 14:23:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVxc5-0003a2-0E
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 08:23:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hVxas-0003Dh-DA
	for qemu-devel@nongnu.org; Wed, 29 May 2019 08:22:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hVxar-0002W5-JI
	for qemu-devel@nongnu.org; Wed, 29 May 2019 08:22:10 -0400
Received: from relay.sw.ru ([185.231.240.75]:35166)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
	id 1hVxar-0002Ud-D0; Wed, 29 May 2019 08:22:09 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <andrey.shinkevich@virtuozzo.com>)
	id 1hVxan-0003Qy-3f; Wed, 29 May 2019 15:22:05 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed, 29 May 2019 15:22:04 +0300
Message-Id: <1559132524-228613-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH] hw/block/fdc: floppy command FIFO memory
 initialization
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com,
	andrey.shinkevich@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The uninitialized memory allocated for the command FIFO of the
floppy controller during the VM hardware initialization incurs
many unwanted reports by Valgrind when VM state is being saved.
That verbosity hardens a search for the real memory issues when
the iotests run. Particularly, the patch eliminates 20 unnecessary
reports of the Valgrind tool in the iotest #169.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 hw/block/fdc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 6f19f12..54e470c 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -2647,6 +2647,10 @@ static void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl,
 
     FLOPPY_DPRINTF("init controller\n");
     fdctrl->fifo = qemu_memalign(512, FD_SECTOR_LEN);
+    if (fdctrl->fifo) {
+        /* To avoid using the uninitialized memory while saving VM state */
+        memset(fdctrl->fifo, 0, FD_SECTOR_LEN);
+    }
     fdctrl->fifo_size = 512;
     fdctrl->result_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                              fdctrl_result_timer, fdctrl);
-- 
1.8.3.1


