Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E31941A0F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 03:51:58 +0200 (CEST)
Received: from localhost ([::1]:56160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hasQf-0005sm-7f
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 21:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53985)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hasO1-0004M9-Dk
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 21:49:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hasJ6-0003tr-Gy
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 21:44:09 -0400
Received: from mga06.intel.com ([134.134.136.31]:41681)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hasJ6-0003tF-9F
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 21:44:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jun 2019 18:44:04 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga008.fm.intel.com with ESMTP; 11 Jun 2019 18:44:02 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Wed, 12 Jun 2019 09:43:37 +0800
Message-Id: <20190612014337.11255-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-devel] [PATCH] migration/multifd: call multifd_send_sync_main
 when sending RAM_SAVE_FLAG_EOS
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
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On receiving RAM_SAVE_FLAG_EOS, multifd_recv_sync_main() is called to
synchronize receive threads. Current synchronization mechanism is to wait
for each channel's sem_sync semaphore. This semaphore is triggered by a
packet with MULTIFD_FLAG_SYNC flag. While in current implementation, we
don't do multifd_send_sync_main() to send such packet when
blk_mig_bulk_active() is true.

This will leads to the receive threads won't notify
multifd_recv_sync_main() by sem_sync. And multifd_recv_sync_main() will
always wait there.

[Note]: normal migration test works, while didn't test the
blk_mig_bulk_active() case. Since not sure how to produce this
situation.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 3354944f39..bd356764ff 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3458,8 +3458,8 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
      */
     ram_control_after_iterate(f, RAM_CONTROL_ROUND);
 
-    multifd_send_sync_main();
 out:
+    multifd_send_sync_main();
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
     ram_counters.transferred += 8;
-- 
2.19.1


