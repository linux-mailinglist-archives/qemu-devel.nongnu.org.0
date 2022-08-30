Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6765A6A56
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 19:28:13 +0200 (CEST)
Received: from localhost ([::1]:46124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT524-00041S-0n
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 13:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT4uG-0006R1-Cd
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 13:20:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT4uD-0005vX-8B
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 13:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661880004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QRJLjfV3bDE0kdD2RZ3saNQ53b+vWbLbBXtOhjtgAPE=;
 b=BKWK1vtamL9Dz4Uzby4tfNpWORTW9BYka6BuwvFhFXF+wSHPP8DjFpKSIm+vEIYD6kuJCA
 fQHVGF+wRemqNJlp2y7IHfSGij/Fy6PXpc53o228PxdrYqt8Y8k64eZWCPXC8El02wngOe
 9ZWg/LaowmVedfvb2nPceEanpNzJrso=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-9xRBlqEvPv-JmOy9z4PtPA-1; Tue, 30 Aug 2022 13:20:01 -0400
X-MC-Unique: 9xRBlqEvPv-JmOy9z4PtPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DABB1801231;
 Tue, 30 Aug 2022 17:20:00 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C8FB1121314;
 Tue, 30 Aug 2022 17:19:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-s390x@nongnu.org
Subject: [PULL 6/6] util/mmap-alloc: Remove qemu_mempath_getpagesize()
Date: Tue, 30 Aug 2022 19:19:47 +0200
Message-Id: <20220830171947.71464-7-thuth@redhat.com>
In-Reply-To: <20220830171947.71464-1-thuth@redhat.com>
References: <20220830171947.71464-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The last user of this function has just been removed, so we can
drop this function now, too.

Message-Id: <20220810125720.3849835-4-thuth@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/mmap-alloc.h |  2 --
 util/mmap-alloc.c         | 31 -------------------------------
 2 files changed, 33 deletions(-)

diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
index 5076695cc8..2825e231a7 100644
--- a/include/qemu/mmap-alloc.h
+++ b/include/qemu/mmap-alloc.h
@@ -4,8 +4,6 @@
 
 size_t qemu_fd_getpagesize(int fd);
 
-size_t qemu_mempath_getpagesize(const char *mem_path);
-
 /**
  * qemu_ram_mmap: mmap anonymous memory, the specified file or device.
  *
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 5b90cb68ea..5ed7d29183 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -53,37 +53,6 @@ size_t qemu_fd_getpagesize(int fd)
     return qemu_real_host_page_size();
 }
 
-size_t qemu_mempath_getpagesize(const char *mem_path)
-{
-#ifdef CONFIG_LINUX
-    struct statfs fs;
-    int ret;
-
-    if (mem_path) {
-        do {
-            ret = statfs(mem_path, &fs);
-        } while (ret != 0 && errno == EINTR);
-
-        if (ret != 0) {
-            fprintf(stderr, "Couldn't statfs() memory path: %s\n",
-                    strerror(errno));
-            exit(1);
-        }
-
-        if (fs.f_type == HUGETLBFS_MAGIC) {
-            /* It's hugepage, return the huge page size */
-            return fs.f_bsize;
-        }
-    }
-#ifdef __sparc__
-    /* SPARC Linux needs greater alignment than the pagesize */
-    return QEMU_VMALLOC_ALIGN;
-#endif
-#endif
-
-    return qemu_real_host_page_size();
-}
-
 #define OVERCOMMIT_MEMORY_PATH "/proc/sys/vm/overcommit_memory"
 static bool map_noreserve_effective(int fd, uint32_t qemu_map_flags)
 {
-- 
2.31.1


