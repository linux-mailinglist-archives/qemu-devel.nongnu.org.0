Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D89236EF8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 10:44:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYo0L-0004V7-3y
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 04:44:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hYnyD-0003ZF-Na
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 04:42:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hYnsI-0003V1-4h
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 04:35:54 -0400
Received: from mga14.intel.com ([192.55.52.115]:4990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hYnsH-0003TJ-Sd
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 04:35:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jun 2019 01:35:53 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jun 2019 01:35:52 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 16:34:57 +0800
Message-Id: <20190606083501.2087-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190606083501.2087-1-richardw.yang@linux.intel.com>
References: <20190606083501.2087-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-devel] [PATCH 2/6] migration/multifd: notify channels_ready
 when send thread starts
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

multifd_send_state->channels_ready is initialized to 0. It is proper to
let main thread know we are ready when thread start running.

Current implementation works since ram_save_setup() calls
multifd_send_sync_main() which wake up send thread and posts
channels_ready. This behavior will introduce some unpredictable
situation and disturb the semaphore value.

This is a preparation patch to use another mechanism to do send thread
synchronization to avoid post channels_ready in this case. So this patch
posts channels_ready when send threads start running.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index a4e7587648..f9e53ac413 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1093,6 +1093,8 @@ static void *multifd_send_thread(void *opaque)
     }
     /* initial packet */
     p->num_packets = 1;
+    /* let main thread know we are ready */
+    qemu_sem_post(&multifd_send_state->channels_ready);
 
     while (true) {
         qemu_sem_wait(&p->sem);
-- 
2.19.1


