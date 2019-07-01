Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CF836F1E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 10:50:55 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYo6o-0001QS-Kr
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 04:50:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hYnyf-0003nK-5M
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 04:42:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hYnsM-0003YH-Fa
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 04:35:59 -0400
Received: from mga14.intel.com ([192.55.52.115]:4990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hYnsM-0003TJ-80
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 04:35:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jun 2019 01:35:57 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jun 2019 01:35:57 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 16:35:00 +0800
Message-Id: <20190606083501.2087-6-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190606083501.2087-1-richardw.yang@linux.intel.com>
References: <20190606083501.2087-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-devel] [PATCH 5/6] migration/multifd: use boolean for
 pending_job is enough
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

After synchronization request is handled in another case, there only
could be one pending_job for one send thread at most.

This is fine to use boolean to represent this behavior.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 3e48795608..831b15833b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -645,7 +645,7 @@ typedef struct {
     /* should this thread finish */
     bool quit;
     /* thread has work to do */
-    int pending_job;
+    bool pending_job;
     /* array of pages to sent */
     MultiFDPages_t *pages;
     /* packet allocated len */
@@ -942,7 +942,7 @@ static void multifd_send_pages(void)
 
         qemu_mutex_lock(&p->mutex);
         if (!p->pending_job) {
-            p->pending_job++;
+            p->pending_job = true;
             next_channel = (i + 1) % migrate_multifd_channels();
             break;
         }
@@ -1126,7 +1126,7 @@ static void *multifd_send_thread(void *opaque)
             }
 
             qemu_mutex_lock(&p->mutex);
-            p->pending_job--;
+            p->pending_job = false;
             qemu_mutex_unlock(&p->mutex);
 
             qemu_sem_post(&multifd_send_state->channels_ready);
@@ -1213,8 +1213,7 @@ int multifd_save_setup(void)
 
         qemu_mutex_init(&p->mutex);
         qemu_sem_init(&p->sem, 0);
-        p->sync = p->quit = false;
-        p->pending_job = 0;
+        p->sync = p->quit = p->pending_job = false;
         p->id = i;
         p->pages = multifd_pages_init(page_count);
         p->packet_len = sizeof(MultiFDPacket_t)
-- 
2.19.1


