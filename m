Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4736ECAF8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:06:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqtxM-0006TO-2f; Mon, 24 Apr 2023 07:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqtxI-0006R0-9C
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:02:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqtxG-00007V-BF
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682334117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ciIcbPI9hOjqUEVUJJbQtIKfDfIvPSrlIPnUOzP0G8A=;
 b=DY25rihmMPWUhhnQU7K+sLdoDqsrFKYg3KgZ/Ptv9AvGFQtqDzr16p7kJ1b9+y0bzHUO/g
 DkE86+EX0z4Q4G4jIfdQL9JBIYSHCKdrYYGe+z6q1bXJf6ASSLJow8zAqq6lzjBaAXg4kt
 liSpFhtqq+GZN/2ApFVe4tI/088+f1Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-AWv-ANPwM66GRJhnxVtN6g-1; Mon, 24 Apr 2023 07:01:56 -0400
X-MC-Unique: AWv-ANPwM66GRJhnxVtN6g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 054CB3813F50
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 11:01:37 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDC3B492C13;
 Mon, 24 Apr 2023 11:01:35 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 13/17] util/mmap-alloc: qemu_fd_getfs()
Date: Mon, 24 Apr 2023 13:01:15 +0200
Message-Id: <20230424110119.68520-14-quintela@redhat.com>
In-Reply-To: <20230424110119.68520-1-quintela@redhat.com>
References: <20230424110119.68520-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Xu <peterx@redhat.com>

This new helper fetches file system type for a fd.  Only Linux is
implemented so far.  Currently only tmpfs and hugetlbfs are defined,
but it can grow as needed.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/qemu/mmap-alloc.h |  7 +++++++
 util/mmap-alloc.c         | 28 ++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
index 2825e231a7..8344daaa03 100644
--- a/include/qemu/mmap-alloc.h
+++ b/include/qemu/mmap-alloc.h
@@ -1,8 +1,15 @@
 #ifndef QEMU_MMAP_ALLOC_H
 #define QEMU_MMAP_ALLOC_H
 
+typedef enum {
+    QEMU_FS_TYPE_UNKNOWN = 0,
+    QEMU_FS_TYPE_TMPFS,
+    QEMU_FS_TYPE_HUGETLBFS,
+    QEMU_FS_TYPE_NUM,
+} QemuFsType;
 
 size_t qemu_fd_getpagesize(int fd);
+QemuFsType qemu_fd_getfs(int fd);
 
 /**
  * qemu_ram_mmap: mmap anonymous memory, the specified file or device.
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 5ed7d29183..ed14f9c64d 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -27,8 +27,36 @@
 
 #ifdef CONFIG_LINUX
 #include <sys/vfs.h>
+#include <linux/magic.h>
 #endif
 
+QemuFsType qemu_fd_getfs(int fd)
+{
+#ifdef CONFIG_LINUX
+    struct statfs fs;
+    int ret;
+
+    if (fd < 0) {
+        return QEMU_FS_TYPE_UNKNOWN;
+    }
+
+    do {
+        ret = fstatfs(fd, &fs);
+    } while (ret != 0 && errno == EINTR);
+
+    switch (fs.f_type) {
+    case TMPFS_MAGIC:
+        return QEMU_FS_TYPE_TMPFS;
+    case HUGETLBFS_MAGIC:
+        return QEMU_FS_TYPE_HUGETLBFS;
+    default:
+        return QEMU_FS_TYPE_UNKNOWN;
+    }
+#else
+    return QEMU_FS_TYPE_UNKNOWN;
+#endif
+}
+
 size_t qemu_fd_getpagesize(int fd)
 {
 #ifdef CONFIG_LINUX
-- 
2.39.2


