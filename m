Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F843215D3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 13:11:11 +0100 (CET)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEA3S-0002cP-U5
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 07:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lE9sJ-0008UT-IT
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:59:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lE9sD-0001kj-5p
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613995172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LwHAeY0imacXyN9k+gcTEwRbetXYrarv6niZbi0TXmg=;
 b=h5bw1H8QBA+631YtIshF1tTlrVIgFKqunfnqOxkE2R9vutDFsaGdYjOFmT89MSMkZE8ajg
 fMQPY5JeCC9GvYSsd/Bw5/fijybuP3ksVS+K4TQukP5mNUXHPMyhhXjAEHlRi2uTJS7GBd
 swWsWFlOlhwBFPBtbZyd6xrqeHB/4AY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-dqk9LODwMiSxaTtf8cqurQ-1; Mon, 22 Feb 2021 06:59:30 -0500
X-MC-Unique: dqk9LODwMiSxaTtf8cqurQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D854F801965;
 Mon, 22 Feb 2021 11:59:28 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D759919C45;
 Mon, 22 Feb 2021 11:59:19 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/12] softmmu/physmem: Extend
 ram_block_discard_(require|disable) by two discard types
Date: Mon, 22 Feb 2021 12:57:06 +0100
Message-Id: <20210222115708.7623-11-david@redhat.com>
In-Reply-To: <20210222115708.7623-1-david@redhat.com>
References: <20210222115708.7623-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to separate the two cases whereby we discard ram
- uncoordinated: e.g., virito-balloon
- coordinated: e.g., virtio-mem coordinated via the RamDiscardMgr

Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: teawater <teawaterz@linux.alibaba.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/exec/memory.h | 18 +++++++++++++--
 softmmu/physmem.c     | 54 ++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 64 insertions(+), 8 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6132910767..fa41c1aee8 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2818,6 +2818,12 @@ static inline MemOp devend_memop(enum device_endian end)
  */
 int ram_block_discard_disable(bool state);
 
+/*
+ * See ram_block_discard_disable(): only disable uncoordinated discards,
+ * keeping coordinated discards (via the RamDiscardMgr) enabled.
+ */
+int ram_block_uncoordinated_discard_disable(bool state);
+
 /*
  * Inhibit technologies that disable discarding of pages in RAM blocks.
  *
@@ -2827,12 +2833,20 @@ int ram_block_discard_disable(bool state);
 int ram_block_discard_require(bool state);
 
 /*
- * Test if discarding of memory in ram blocks is disabled.
+ * See ram_block_discard_require(): only inhibit technologies that disable
+ * uncoordinated discarding of pages in RAM blocks, allowing co-existance with
+ * technologies that only inhibit uncoordinated discards (via the
+ * RamDiscardMgr).
+ */
+int ram_block_coordinated_discard_require(bool state);
+
+/*
+ * Test if any discarding of memory in ram blocks is disabled.
  */
 bool ram_block_discard_is_disabled(void);
 
 /*
- * Test if discarding of memory in ram blocks is required to work reliably.
+ * Test if any discarding of memory in ram blocks is required to work reliably.
  */
 bool ram_block_discard_is_required(void);
 
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 6550217c26..19f19ad3a8 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3677,8 +3677,14 @@ void mtree_print_dispatch(AddressSpaceDispatch *d, MemoryRegion *root)
     }
 }
 
+/* Require any discards to work. */
 static unsigned int ram_block_discard_requirers;
+/* Require only coordinated discards to work. */
+static unsigned int ram_block_coordinated_discard_requirers;
+/* Disable any discards. */
 static unsigned int ram_block_discard_disablers;
+/* Disable only uncoordinated discards. */
+static unsigned int ram_block_uncoordinated_discard_disablers;
 static QemuMutex ram_block_discard_disable_mutex;
 
 static void ram_block_discard_disable_mutex_lock(void)
@@ -3704,10 +3710,27 @@ int ram_block_discard_disable(bool state)
     ram_block_discard_disable_mutex_lock();
     if (!state) {
         ram_block_discard_disablers--;
-    } else if (!ram_block_discard_requirers) {
-        ram_block_discard_disablers++;
+    } else if (ram_block_discard_requirers ||
+               ram_block_coordinated_discard_requirers) {
+        ret = -EBUSY;
     } else {
+        ram_block_discard_disablers++;
+    }
+    ram_block_discard_disable_mutex_unlock();
+    return ret;
+}
+
+int ram_block_uncoordinated_discard_disable(bool state)
+{
+    int ret = 0;
+
+    ram_block_discard_disable_mutex_lock();
+    if (!state) {
+        ram_block_uncoordinated_discard_disablers--;
+    } else if (ram_block_discard_requirers) {
         ret = -EBUSY;
+    } else {
+        ram_block_uncoordinated_discard_disablers++;
     }
     ram_block_discard_disable_mutex_unlock();
     return ret;
@@ -3720,10 +3743,27 @@ int ram_block_discard_require(bool state)
     ram_block_discard_disable_mutex_lock();
     if (!state) {
         ram_block_discard_requirers--;
-    } else if (!ram_block_discard_disablers) {
-        ram_block_discard_requirers++;
+    } else if (ram_block_discard_disablers ||
+               ram_block_uncoordinated_discard_disablers) {
+        ret = -EBUSY;
     } else {
+        ram_block_discard_requirers++;
+    }
+    ram_block_discard_disable_mutex_unlock();
+    return ret;
+}
+
+int ram_block_coordinated_discard_require(bool state)
+{
+    int ret = 0;
+
+    ram_block_discard_disable_mutex_lock();
+    if (!state) {
+        ram_block_coordinated_discard_requirers--;
+    } else if (ram_block_discard_disablers) {
         ret = -EBUSY;
+    } else {
+        ram_block_coordinated_discard_requirers++;
     }
     ram_block_discard_disable_mutex_unlock();
     return ret;
@@ -3731,10 +3771,12 @@ int ram_block_discard_require(bool state)
 
 bool ram_block_discard_is_disabled(void)
 {
-    return qatomic_read(&ram_block_discard_disablers);
+    return qatomic_read(&ram_block_discard_disablers) ||
+           qatomic_read(&ram_block_uncoordinated_discard_disablers);
 }
 
 bool ram_block_discard_is_required(void)
 {
-    return qatomic_read(&ram_block_discard_requirers);
+    return qatomic_read(&ram_block_discard_requirers) ||
+           qatomic_read(&ram_block_coordinated_discard_requirers);
 }
-- 
2.29.2


