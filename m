Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFC42B96B8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 16:52:59 +0100 (CET)
Received: from localhost ([::1]:59452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmF0-0006lL-Fp
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 10:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kfm4H-0001lg-RA
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:41:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kfm4D-0002AG-6R
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605800508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxknkBpzcCqAvxPep5/UTKmSs5aqzf9yCuENIE84wDk=;
 b=erAUHsiiKT9A1eNsuj5ufgnHqan2cm1M9ijSGtUBeXE2Vj3S3rtzgwLJD/xhutyZdTCoeH
 liAb8z3lxzpOTgnMy4eeg8ysH3Q7gUWzHUGYF+5bCSkTFgjzpqsq3C7ccUrRSR/hVLczYO
 wDUYsuev4SWwYpmttcP07hd6Gibhs2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-qxuEeDWgNcaCJN-d9UdKuQ-1; Thu, 19 Nov 2020 10:41:46 -0500
X-MC-Unique: qxuEeDWgNcaCJN-d9UdKuQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C64C1868404;
 Thu, 19 Nov 2020 15:41:45 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-158.ams2.redhat.com [10.36.114.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39A395C1A1;
 Thu, 19 Nov 2020 15:41:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 7/9] softmmu/physmem: Extend
 ram_block_discard_(require|disable) by two discard types
Date: Thu, 19 Nov 2020 16:39:16 +0100
Message-Id: <20201119153918.120976-8-david@redhat.com>
In-Reply-To: <20201119153918.120976-1-david@redhat.com>
References: <20201119153918.120976-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Luiz Capitulino <lcapitulino@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
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
index 468cbb53a4..a7ec211a60 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2798,6 +2798,12 @@ static inline MemOp devend_memop(enum device_endian end)
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
@@ -2807,12 +2813,20 @@ int ram_block_discard_disable(bool state);
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
2.26.2


