Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0192D305A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 17:58:20 +0100 (CET)
Received: from localhost ([::1]:47146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmgJf-0006PZ-Eu
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 11:58:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kmg3K-0005yC-J8
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:41:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kmg30-0005UE-F7
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:41:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607445663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nJfQvvlMC3rEwnGMXSmD4INkpiGypsQUmmHbyjHYKA=;
 b=ZBDsvHd9UkCwJEuEmuYxdELPxOfunHkh+FXZTGUwGyyzHXSe06T2qsV+AFqJFIj3JYUYyw
 eyBo+X8rwvwgYGgGa73Zd+o/WdXfVoQ00FtwwIzDf1f8MkueajhpCEUURs8r/06q+FA7dD
 Mg+/BJfIEoL20yMxnQ+E6Wx1dWalLZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-QdUBWzO8Oeyho1civzs4Yg-1; Tue, 08 Dec 2020 11:41:01 -0500
X-MC-Unique: QdUBWzO8Oeyho1civzs4Yg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A856EDD486;
 Tue,  8 Dec 2020 16:40:18 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE7805D6AB;
 Tue,  8 Dec 2020 16:40:15 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/10] softmmu/physmem: Extend
 ram_block_discard_(require|disable) by two discard types
Date: Tue,  8 Dec 2020 17:39:48 +0100
Message-Id: <20201208163950.29617-9-david@redhat.com>
In-Reply-To: <20201208163950.29617-1-david@redhat.com>
References: <20201208163950.29617-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to separate the two cases whereby we discard ram
- uncoordinated: e.g., virito-balloon
- coordinated: e.g., virtio-mem coordinated via the RamDiscardMgr

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
index 30d4fcd2c0..3f0942aa5b 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2804,6 +2804,12 @@ static inline MemOp devend_memop(enum device_endian end)
  */
 int ram_block_discard_disable(bool state);
 
+/*
+ * See ram_block_discard_disable(): only disable unccordinated discards,
+ * keeping coordinated discards (via the RamDiscardMgr) enabled.
+ */
+int ram_block_uncoordinated_discard_disable(bool state);
+
 /*
  * Inhibit technologies that disable discarding of pages in RAM blocks.
  *
@@ -2813,12 +2819,20 @@ int ram_block_discard_disable(bool state);
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
index 448e4e8c86..7a4f3db1b4 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3650,8 +3650,14 @@ void mtree_print_dispatch(AddressSpaceDispatch *d, MemoryRegion *root)
     }
 }
 
+/* Require any discards to work. */
 static unsigned int ram_block_discard_requirers;
+/* Require only coordinated discards to work. */
+static unsigned int ram_block_coordinated_discard_requirers;
+/* Disable any discards. */
 static unsigned int ram_block_discard_disablers;
+/* Disable only uncoordinated disards. */
+static unsigned int ram_block_uncoordinated_discard_disablers;
 static QemuMutex ram_block_discard_disable_mutex;
 
 static void ram_block_discard_disable_mutex_lock(void)
@@ -3677,10 +3683,27 @@ int ram_block_discard_disable(bool state)
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
@@ -3693,10 +3716,27 @@ int ram_block_discard_require(bool state)
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
@@ -3704,10 +3744,12 @@ int ram_block_discard_require(bool state)
 
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
2.28.0


