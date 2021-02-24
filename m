Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA2E323A19
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:04:10 +0100 (CET)
Received: from localhost ([::1]:39776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEr1d-0007G6-7O
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEqpM-0003De-U5
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:51:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEqpK-00084O-3D
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614160285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M8MBy0QvaCDUHqjlwyrbBJe1MItJtBUgM61QMZ+arQI=;
 b=DhaiieonNaKZueZ71FsZWXWc3Aen7eCwHQ/DuP/CVDLBUypXasiUY6wYIstaPHdUWZo18M
 USr+ZyMihpZEM8Y1dchNqutHMRpc6vUd1HKSy2Dthw54kc+h/f2cwI7l9wwsj4KCZyZmrj
 tnVkhsURSdjx6XhrBKa60qKYkpVOZ18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-nZXUfBHNNyOQ3uVFSJSp9Q-1; Wed, 24 Feb 2021 04:51:21 -0500
X-MC-Unique: nZXUfBHNNyOQ3uVFSJSp9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86A2480197B;
 Wed, 24 Feb 2021 09:51:20 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-83.ams2.redhat.com [10.36.114.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9BAE6F7E9;
 Wed, 24 Feb 2021 09:51:14 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/13] softmmu/physmem: Extend
 ram_block_discard_(require|disable) by two discard types
Date: Wed, 24 Feb 2021 10:49:07 +0100
Message-Id: <20210224094910.44986-12-david@redhat.com>
In-Reply-To: <20210224094910.44986-1-david@redhat.com>
References: <20210224094910.44986-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
- coordinated: e.g., virtio-mem coordinated via the RamDiscardManager

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
index ad5e0d6278..5ad7a274f6 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2849,6 +2849,12 @@ static inline MemOp devend_memop(enum device_endian end)
  */
 int ram_block_discard_disable(bool state);
 
+/*
+ * See ram_block_discard_disable(): only disable uncoordinated discards,
+ * keeping coordinated discards (via the RamDiscardManager) enabled.
+ */
+int ram_block_uncoordinated_discard_disable(bool state);
+
 /*
  * Inhibit technologies that disable discarding of pages in RAM blocks.
  *
@@ -2858,12 +2864,20 @@ int ram_block_discard_disable(bool state);
 int ram_block_discard_require(bool state);
 
 /*
- * Test if discarding of memory in ram blocks is disabled.
+ * See ram_block_discard_require(): only inhibit technologies that disable
+ * uncoordinated discarding of pages in RAM blocks, allowing co-existance with
+ * technologies that only inhibit uncoordinated discards (via the
+ * RamDiscardManager).
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
index 4388b2f4c7..a89f0f5b11 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3677,8 +3677,14 @@ void mtree_print_dispatch(AddressSpaceDispatch *d, MemoryRegion *root)
     }
 }
 
+/* Require any discards to work. */
 static unsigned int ram_block_discard_required_cnt;
+/* Require only coordinated discards to work. */
+static unsigned int ram_block_coordinated_discard_required_cnt;
+/* Disable any discards. */
 static unsigned int ram_block_discard_disabled_cnt;
+/* Disable only uncoordinated discards. */
+static unsigned int ram_block_uncoordinated_discard_disabled_cnt;
 static QemuMutex ram_block_discard_disable_mutex;
 
 static void ram_block_discard_disable_mutex_lock(void)
@@ -3704,10 +3710,27 @@ int ram_block_discard_disable(bool state)
     ram_block_discard_disable_mutex_lock();
     if (!state) {
         ram_block_discard_disabled_cnt--;
-    } else if (!ram_block_discard_required_cnt) {
-        ram_block_discard_disabled_cnt++;
+    } else if (ram_block_discard_required_cnt ||
+               ram_block_coordinated_discard_required_cnt) {
+        ret = -EBUSY;
     } else {
+        ram_block_discard_disabled_cnt++;
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
+        ram_block_uncoordinated_discard_disabled_cnt--;
+    } else if (ram_block_discard_required_cnt) {
         ret = -EBUSY;
+    } else {
+        ram_block_uncoordinated_discard_disabled_cnt++;
     }
     ram_block_discard_disable_mutex_unlock();
     return ret;
@@ -3720,10 +3743,27 @@ int ram_block_discard_require(bool state)
     ram_block_discard_disable_mutex_lock();
     if (!state) {
         ram_block_discard_required_cnt--;
-    } else if (!ram_block_discard_disabled_cnt) {
-        ram_block_discard_required_cnt++;
+    } else if (ram_block_discard_disabled_cnt ||
+               ram_block_uncoordinated_discard_disabled_cnt) {
+        ret = -EBUSY;
     } else {
+        ram_block_discard_required_cnt++;
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
+        ram_block_coordinated_discard_required_cnt--;
+    } else if (ram_block_discard_disabled_cnt) {
         ret = -EBUSY;
+    } else {
+        ram_block_coordinated_discard_required_cnt++;
     }
     ram_block_discard_disable_mutex_unlock();
     return ret;
@@ -3731,10 +3771,12 @@ int ram_block_discard_require(bool state)
 
 bool ram_block_discard_is_disabled(void)
 {
-    return qatomic_read(&ram_block_discard_disabled_cnt);
+    return qatomic_read(&ram_block_discard_disabled_cnt) ||
+           qatomic_read(&ram_block_uncoordinated_discard_disabled_cnt);
 }
 
 bool ram_block_discard_is_required(void)
 {
-    return qatomic_read(&ram_block_discard_required_cnt);
+    return qatomic_read(&ram_block_discard_required_cnt) ||
+           qatomic_read(&ram_block_coordinated_discard_required_cnt);
 }
-- 
2.29.2


