Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EB936F05
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 10:46:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56584 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYo29-00061M-BO
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 04:46:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hYnyf-0003nJ-60
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 04:42:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hYnsL-0003Wm-2G
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 04:35:57 -0400
Received: from mga14.intel.com ([192.55.52.115]:4990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hYnsK-0003TJ-PI
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 04:35:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jun 2019 01:35:56 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jun 2019 01:35:55 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 16:34:59 +0800
Message-Id: <20190606083501.2087-5-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190606083501.2087-1-richardw.yang@linux.intel.com>
References: <20190606083501.2087-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-devel] [PATCH 4/6] migration/multifd: used must not be 0 for
 a pending job
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
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
	quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After thread synchronization request is handled in another case, this
means when we only get pending_job when there is used pages.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 9982930392..3e48795608 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1118,12 +1118,11 @@ static void *multifd_send_thread(void *opaque)
                 break;
             }
 
-            if (used) {
-                ret = qio_channel_writev_all(p->c, p->pages->iov,
+            assert(used);
+            ret = qio_channel_writev_all(p->c, p->pages->iov,
                                              used, &local_err);
-                if (ret != 0) {
-                    break;
-                }
+            if (ret != 0) {
+                break;
             }
 
             qemu_mutex_lock(&p->mutex);
-- 
2.19.1


