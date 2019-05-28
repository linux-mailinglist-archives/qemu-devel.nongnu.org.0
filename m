Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442472BCFC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 03:51:47 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVRHG-0003fH-F7
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 21:51:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hVRDU-00013N-Ut
	for qemu-devel@nongnu.org; Mon, 27 May 2019 21:47:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hVRDU-0003f7-19
	for qemu-devel@nongnu.org; Mon, 27 May 2019 21:47:52 -0400
Received: from mga11.intel.com ([192.55.52.93]:31236)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hVRDT-0003YP-No
	for qemu-devel@nongnu.org; Mon, 27 May 2019 21:47:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 May 2019 18:47:51 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga006.jf.intel.com with ESMTP; 27 May 2019 18:47:49 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 28 May 2019 09:47:02 +0800
Message-Id: <20190528014703.21030-4-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190528014703.21030-1-richardw.yang@linux.intel.com>
References: <20190528014703.21030-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH 3/4] migration/ram.c:
 MultiFDSendParams.sem_sync is not really used
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

Besides init and destroy, MultiFDSendParams.sem_sync is not really used.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index dcf4c54eb5..5d31f7bd4c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -661,8 +661,6 @@ typedef struct {
     uint64_t num_packets;
     /* pages sent through this channel */
     uint64_t num_pages;
-    /* syncs main thread and channels */
-    QemuSemaphore sem_sync;
 }  MultiFDSendParams;
 
 typedef struct {
@@ -1027,7 +1025,6 @@ void multifd_save_cleanup(void)
         p->c = NULL;
         qemu_mutex_destroy(&p->mutex);
         qemu_sem_destroy(&p->sem);
-        qemu_sem_destroy(&p->sem_sync);
         g_free(p->name);
         p->name = NULL;
         multifd_pages_clear(p->pages);
@@ -1201,7 +1198,6 @@ int multifd_save_setup(void)
 
         qemu_mutex_init(&p->mutex);
         qemu_sem_init(&p->sem, 0);
-        qemu_sem_init(&p->sem_sync, 0);
         p->quit = false;
         p->pending_job = 0;
         p->id = i;
-- 
2.19.1


