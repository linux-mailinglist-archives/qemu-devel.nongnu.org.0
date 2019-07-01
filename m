Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560F836F23
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 10:52:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56704 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYo8i-0003IX-DH
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 04:52:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hYnyf-0003Zd-JU
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 04:42:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hYnsH-0003UA-LV
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 04:35:54 -0400
Received: from mga14.intel.com ([192.55.52.115]:4990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hYnsH-0003TJ-Cg
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 04:35:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jun 2019 01:35:52 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jun 2019 01:35:51 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 16:34:56 +0800
Message-Id: <20190606083501.2087-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190606083501.2087-1-richardw.yang@linux.intel.com>
References: <20190606083501.2087-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-devel] [PATCH 1/6] migration/multifd: move MultiFDSendParams
 handling into multifd_send_fill_packet()
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

Currently there is only one user of multifd_send_fill_packet(). We
enlarge the responsibility of it to adjust MultiFDSendParams.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index bd356764ff..a4e7587648 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -787,9 +787,11 @@ static void multifd_pages_clear(MultiFDPages_t *pages)
 static void multifd_send_fill_packet(MultiFDSendParams *p)
 {
     MultiFDPacket_t *packet = p->packet;
+    MultiFDPages_t *pages = p->pages;
     uint32_t page_max = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     int i;
 
+    p->next_packet_size = pages->used * qemu_target_page_size();
     packet->magic = cpu_to_be32(MULTIFD_MAGIC);
     packet->version = cpu_to_be32(MULTIFD_VERSION);
     packet->flags = cpu_to_be32(p->flags);
@@ -805,6 +807,10 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
     for (i = 0; i < p->pages->used; i++) {
         packet->offset[i] = cpu_to_be64(p->pages->offset[i]);
     }
+    p->flags = 0;
+    p->num_packets++;
+    p->num_pages += pages->used;
+    p->pages->used = 0;
 }
 
 static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
@@ -1097,12 +1103,7 @@ static void *multifd_send_thread(void *opaque)
             uint64_t packet_num = p->packet_num;
             uint32_t flags = p->flags;
 
-            p->next_packet_size = used * qemu_target_page_size();
             multifd_send_fill_packet(p);
-            p->flags = 0;
-            p->num_packets++;
-            p->num_pages += used;
-            p->pages->used = 0;
             qemu_mutex_unlock(&p->mutex);
 
             trace_multifd_send(p->id, packet_num, used, flags,
-- 
2.19.1


