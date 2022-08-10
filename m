Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7BA58ECF4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:20:17 +0200 (CEST)
Received: from localhost ([::1]:48996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLldA-0006Rf-9h
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oLlHE-0000GY-TD
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:57:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oLlHD-0000b5-GZ
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660136255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/hrPHfiodMopFBVOP+wSnp5t6vAjuyjDdcWGuVOGX0=;
 b=RqtNi7/lFHIFSsbI7nBg+f6Qo4gND7Pw6oH6HYaPitgi4mlJQPPeVIRA9fT/xHKztM11UI
 MlX29FXhrLdOlbvZu/yB7ZU0LHcFYUCEv1hgZDLS2x+7DzYH9TYwFb4BUbs5OeIgLEKZ1F
 4fg/szztxFx0x+0+LUEzWdkd2o5yKOo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-Sp-YcEjyOsW6xu4pIFpM8A-1; Wed, 10 Aug 2022 08:57:31 -0400
X-MC-Unique: Sp-YcEjyOsW6xu4pIFpM8A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D3FB805B72;
 Wed, 10 Aug 2022 12:57:31 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEE6A492C3B;
 Wed, 10 Aug 2022 12:57:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: [PATCH v2 3/3] util/mmap-alloc: Remove qemu_mempath_getpagesize()
Date: Wed, 10 Aug 2022 14:57:20 +0200
Message-Id: <20220810125720.3849835-4-thuth@redhat.com>
In-Reply-To: <20220810125720.3849835-1-thuth@redhat.com>
References: <20220810125720.3849835-1-thuth@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


