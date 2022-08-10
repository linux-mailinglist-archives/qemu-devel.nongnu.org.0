Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2C358E75E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 08:38:49 +0200 (CEST)
Received: from localhost ([::1]:42500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLfMe-0001vH-QJ
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 02:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oLfGK-0006h0-Lg
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 02:32:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oLfGF-0001tz-BS
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 02:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660113130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=knbzTr5MOnxaLKQAnxoWqVO8WJE/HRjE6vdrDc7zTwc=;
 b=X9iaFRRxYOO7P0vn3UkErWOg7DBwD/JkeB7Y8Fjar87eiH7dUjTs6e5MQuZ95LVKl2FjK2
 CXuO63fe0I513PmMR4wm+hOzev2v1AJBhaNsDFuY2nQ0q1i/VkHNQ9W7devnb0+ETmoTDf
 IW/5OtI5vsiZPV476HuHoLCMgUX7+oI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-PMPkUvtTNByAHbb6zaO-ug-1; Wed, 10 Aug 2022 02:32:09 -0400
X-MC-Unique: PMPkUvtTNByAHbb6zaO-ug-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE97D299E75F;
 Wed, 10 Aug 2022 06:32:08 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 413C7492C3B;
 Wed, 10 Aug 2022 06:32:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] backends/hostmem: Fix support of memory-backend-memfd in
 qemu_maxrampagesize()
Date: Wed, 10 Aug 2022 08:32:04 +0200
Message-Id: <20220810063204.3589543-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is currently not possible yet to use "memory-backend-memfd" on s390x
with hugepages enabled. This problem is caused by qemu_maxrampagesize()
not taking memory-backend-memfd objects into account yet, so the code
in s390_memory_init() fails to enable the huge page support there via
s390_set_max_pagesize(). Fix it by looking at the memory-backend-memfd
in the host_memory_backend_pagesize() function, too.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2116496
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/sysemu/hostmem.h |  8 +++++++-
 backends/hostmem-memfd.c |  2 --
 backends/hostmem.c       | 27 +++++++++++++++++----------
 3 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index 9ff5c16963..d983ae6c01 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -34,10 +34,16 @@ OBJECT_DECLARE_TYPE(HostMemoryBackend, HostMemoryBackendClass,
 /* hostmem-file.c */
 /**
  * @TYPE_MEMORY_BACKEND_FILE:
- * name of backend that uses mmap on a file descriptor
+ * name of backend that uses mmap on a file
  */
 #define TYPE_MEMORY_BACKEND_FILE "memory-backend-file"
 
+/* hostmem-memfd.c */
+/**
+ * @TYPE_MEMORY_BACKEND_MEMFD:
+ * name of backend that uses mmap on a memfd file descriptor
+ */
+#define TYPE_MEMORY_BACKEND_MEMFD "memory-backend-memfd"
 
 /**
  * HostMemoryBackendClass:
diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index 3fc85c3db8..1ab2085e49 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -18,8 +18,6 @@
 #include "qapi/error.h"
 #include "qom/object.h"
 
-#define TYPE_MEMORY_BACKEND_MEMFD "memory-backend-memfd"
-
 OBJECT_DECLARE_SIMPLE_TYPE(HostMemoryBackendMemfd, MEMORY_BACKEND_MEMFD)
 
 
diff --git a/backends/hostmem.c b/backends/hostmem.c
index 624bb7ecd3..ebce887105 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -306,22 +306,29 @@ bool host_memory_backend_is_mapped(HostMemoryBackend *backend)
     return backend->is_mapped;
 }
 
-#ifdef __linux__
 size_t host_memory_backend_pagesize(HostMemoryBackend *memdev)
 {
+    size_t pagesize = 0;
+
+#ifdef __linux__
     Object *obj = OBJECT(memdev);
-    char *path = object_property_get_str(obj, "mem-path", NULL);
-    size_t pagesize = qemu_mempath_getpagesize(path);
 
-    g_free(path);
+    if (object_dynamic_cast(obj, TYPE_MEMORY_BACKEND_FILE)) {
+        char *path = object_property_get_str(obj, "mem-path", NULL);
+        pagesize = qemu_mempath_getpagesize(path);
+        g_free(path);
+    } else if (object_dynamic_cast(obj, TYPE_MEMORY_BACKEND_MEMFD) &&
+               object_property_get_bool(obj, "hugetlb", &error_abort)) {
+        pagesize = object_property_get_int(obj, "hugetlbsize", &error_abort);
+    }
+#endif
+
+    if (!pagesize) {
+        pagesize = qemu_real_host_page_size();
+    }
+
     return pagesize;
 }
-#else
-size_t host_memory_backend_pagesize(HostMemoryBackend *memdev)
-{
-    return qemu_real_host_page_size();
-}
-#endif
 
 static void
 host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
-- 
2.31.1


