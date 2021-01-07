Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869752ED113
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 14:44:31 +0100 (CET)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxVaY-0004dX-KV
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 08:44:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxVT4-0005nS-PQ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:36:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxVSn-0004cK-4i
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610026588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=efnjmySnLXG7z9W2Ni1BIKDyce5zh4iRiS+oo5bnSf4=;
 b=UV/UvzHBILOtQSZ847U9/b6cAtOrGluBya6GKrZrbLXxU+vboR0hH9gcXnkrwB6xAxqqg7
 s76gENfybwgyUEF0IOAECYTuBkDpSp+qflLACWrpIvfCIgyzbIHMv1zZ2/ZEq9ZEZXWrWz
 xOWPvey+2TxY39391/rGdu7HMGGMZfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-ivr0RCNkMaCGPgCw2Y5l2A-1; Thu, 07 Jan 2021 08:36:27 -0500
X-MC-Unique: ivr0RCNkMaCGPgCw2Y5l2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBDF2801817;
 Thu,  7 Jan 2021 13:36:24 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-161.ams2.redhat.com [10.36.114.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0C741724C;
 Thu,  7 Jan 2021 13:36:21 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/11] softmmu/physmem: Don't use atomic operations in
 ram_block_discard_(disable|require)
Date: Thu,  7 Jan 2021 14:34:20 +0100
Message-Id: <20210107133423.44964-9-david@redhat.com>
In-Reply-To: <20210107133423.44964-1-david@redhat.com>
References: <20210107133423.44964-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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
Cc: Marek Kedzierski <mkedzier@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have users in migration context that don't hold the BQL (when
finishing migration). To prepare for further changes, use a dedicated mutex
instead of atomic operations. Keep using qatomic_read ("READ_ONCE") for the
functions that only extract the current state (e.g., used by
virtio-balloon), locking isn't necessary.

While at it, split up the counter into two variables to make it easier
to understand.

Suggested-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
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
 softmmu/physmem.c | 70 ++++++++++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 31 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 8b9ffc41c2..dc61335b60 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3660,56 +3660,64 @@ void mtree_print_dispatch(AddressSpaceDispatch *d, MemoryRegion *root)
     }
 }
 
-/*
- * If positive, discarding RAM is disabled. If negative, discarding RAM is
- * required to work and cannot be disabled.
- */
-static int ram_block_discard_disabled;
+static unsigned int ram_block_discard_requirers;
+static unsigned int ram_block_discard_disablers;
+static QemuMutex ram_block_discard_disable_mutex;
+
+static void ram_block_discard_disable_mutex_lock(void)
+{
+    static gsize initialized;
+
+    if (g_once_init_enter(&initialized)) {
+        qemu_mutex_init(&ram_block_discard_disable_mutex);
+        g_once_init_leave(&initialized, 1);
+    }
+    qemu_mutex_lock(&ram_block_discard_disable_mutex);
+}
+
+static void ram_block_discard_disable_mutex_unlock(void)
+{
+    qemu_mutex_unlock(&ram_block_discard_disable_mutex);
+}
 
 int ram_block_discard_disable(bool state)
 {
-    int old;
+    int ret = 0;
 
+    ram_block_discard_disable_mutex_lock();
     if (!state) {
-        qatomic_dec(&ram_block_discard_disabled);
-        return 0;
+        ram_block_discard_disablers--;
+    } else if (!ram_block_discard_requirers) {
+        ram_block_discard_disablers++;
+    } else {
+        ret = -EBUSY;
     }
-
-    do {
-        old = qatomic_read(&ram_block_discard_disabled);
-        if (old < 0) {
-            return -EBUSY;
-        }
-    } while (qatomic_cmpxchg(&ram_block_discard_disabled,
-                             old, old + 1) != old);
-    return 0;
+    ram_block_discard_disable_mutex_unlock();
+    return ret;
 }
 
 int ram_block_discard_require(bool state)
 {
-    int old;
+    int ret = 0;
 
+    ram_block_discard_disable_mutex_lock();
     if (!state) {
-        qatomic_inc(&ram_block_discard_disabled);
-        return 0;
+        ram_block_discard_requirers--;
+    } else if (!ram_block_discard_disablers) {
+        ram_block_discard_requirers++;
+    } else {
+        ret = -EBUSY;
     }
-
-    do {
-        old = qatomic_read(&ram_block_discard_disabled);
-        if (old > 0) {
-            return -EBUSY;
-        }
-    } while (qatomic_cmpxchg(&ram_block_discard_disabled,
-                             old, old - 1) != old);
-    return 0;
+    ram_block_discard_disable_mutex_unlock();
+    return ret;
 }
 
 bool ram_block_discard_is_disabled(void)
 {
-    return qatomic_read(&ram_block_discard_disabled) > 0;
+    return qatomic_read(&ram_block_discard_disablers);
 }
 
 bool ram_block_discard_is_required(void)
 {
-    return qatomic_read(&ram_block_discard_disabled) < 0;
+    return qatomic_read(&ram_block_discard_requirers);
 }
-- 
2.29.2


