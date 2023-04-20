Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0346E95B4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:22:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUB6-0001lE-88; Thu, 20 Apr 2023 09:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAz-0001Zb-1L
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAw-0005gm-Ep
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681996693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ciIcbPI9hOjqUEVUJJbQtIKfDfIvPSrlIPnUOzP0G8A=;
 b=EV8GvC7e+6ct6xGZ7E7OZostxk23cMQFWeZm1dOkK6PKAQDKe/MaP9ZX7rTYadw74SLKo9
 ImfxQYNLcqeiV9UyGBqQ/RzEF4FZs2mH0xFU1SLZtkZBPsumUt/ATG12l/pHes8QkjYeXp
 5LFE7WG8nX3DsGnoTWilztBkX86JDlE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-2VWF7HUHNLOy6C5TO3UDcg-1; Thu, 20 Apr 2023 09:18:12 -0400
X-MC-Unique: 2VWF7HUHNLOy6C5TO3UDcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B49A800B35
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 13:18:12 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 200B2C16024;
 Thu, 20 Apr 2023 13:18:10 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 16/20] util/mmap-alloc: qemu_fd_getfs()
Date: Thu, 20 Apr 2023 15:17:47 +0200
Message-Id: <20230420131751.28534-17-quintela@redhat.com>
In-Reply-To: <20230420131751.28534-1-quintela@redhat.com>
References: <20230420131751.28534-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


