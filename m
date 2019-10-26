Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC8AE57C5
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Oct 2019 03:27:23 +0200 (CEST)
Received: from localhost ([::1]:37828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOArS-0002eD-OH
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 21:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54967)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iOADB-0002Zz-F7
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 20:45:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iOADA-0004kg-DV
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 20:45:45 -0400
Received: from mga01.intel.com ([192.55.52.88]:5552)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iOADA-0004k9-66
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 20:45:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 17:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,230,1569308400"; d="scan'208";a="204705106"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Oct 2019 17:45:42 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v2 1/6] migration/multifd: move Params update and pages
 cleanup into multifd_send_fill_packet()
Date: Sat, 26 Oct 2019 08:45:15 +0800
Message-Id: <20191026004520.5515-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191026004520.5515-1-richardw.yang@linux.intel.com>
References: <20191026004520.5515-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
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
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fill data and update/cleanup related field in one place. Also make the
code a little clean.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 5876054195..35f147388b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -789,15 +789,16 @@ static void multifd_pages_clear(MultiFDPages_t *pages)
     g_free(pages);
 }
 
-static void multifd_send_fill_packet(MultiFDSendParams *p)
+static void multifd_send_fill_packet(MultiFDSendParams *p, uint32_t used)
 {
     MultiFDPacket_t *packet = p->packet;
+    uint32_t next_packet_size = used * qemu_target_page_size();
     int i;
 
     packet->flags = cpu_to_be32(p->flags);
     packet->pages_alloc = cpu_to_be32(p->pages->allocated);
     packet->pages_used = cpu_to_be32(p->pages->used);
-    packet->next_packet_size = cpu_to_be32(p->next_packet_size);
+    packet->next_packet_size = cpu_to_be32(next_packet_size);
     packet->packet_num = cpu_to_be64(p->packet_num);
 
     if (p->pages->block) {
@@ -807,6 +808,13 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
     for (i = 0; i < p->pages->used; i++) {
         packet->offset[i] = cpu_to_be64(p->pages->offset[i]);
     }
+
+    p->next_packet_size = next_packet_size;
+    p->flags = 0;
+    p->num_packets++;
+    p->num_pages += used;
+    p->pages->used = 0;
+    p->pages->block = NULL;
 }
 
 static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
@@ -1109,13 +1117,7 @@ static void *multifd_send_thread(void *opaque)
             uint64_t packet_num = p->packet_num;
             flags = p->flags;
 
-            p->next_packet_size = used * qemu_target_page_size();
-            multifd_send_fill_packet(p);
-            p->flags = 0;
-            p->num_packets++;
-            p->num_pages += used;
-            p->pages->used = 0;
-            p->pages->block = NULL;
+            multifd_send_fill_packet(p, used);
             qemu_mutex_unlock(&p->mutex);
 
             trace_multifd_send(p->id, packet_num, used, flags,
-- 
2.17.1


