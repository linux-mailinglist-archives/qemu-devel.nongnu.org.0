Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F6150A181
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:05:36 +0200 (CEST)
Received: from localhost ([::1]:56686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXR9-00019w-AV
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXDH-0004JN-P5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:51:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXDE-0006BG-Ab
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZYdr60VTU1fGmbB4U3PxqLlInbmHwQzTYhPv4hKl6I=;
 b=RDOb+ByzK2unCDgsfz9telPIekR9vHHVoqbEhVeuTZ9FiAGFZg2v4UAkKVeDWji8AZkQnC
 Yy9MlhCWFRAq0EjQi4GLiM4rs+xFdmRnJw/XlLa2giUhMgrHsUwInDfmxlHrYKd+nrclhf
 njkmLR7iFqUatDff269+io/XG04yGwY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-vNiUZengO5-y9F1GwlBXbA-1; Thu, 21 Apr 2022 09:51:10 -0400
X-MC-Unique: vNiUZengO5-y9F1GwlBXbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 366B7811E7A;
 Thu, 21 Apr 2022 13:51:10 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7024A111E3EC;
 Thu, 21 Apr 2022 13:50:56 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 14/30] include: move qemu_msync() to osdep
Date: Thu, 21 Apr 2022 17:49:24 +0400
Message-Id: <20220421134940.2887768-15-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The implementation depends on the OS. (and longer-term goal is to move
cutils to a common subproject)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-21-marcandre.lureau@redhat.com>
---
 include/qemu/cutils.h |  1 -
 include/qemu/osdep.h  | 13 +++++++++++++
 util/cutils.c         | 38 --------------------------------------
 util/oslib-posix.c    | 18 ++++++++++++++++++
 util/oslib-win32.c    | 10 ++++++++++
 5 files changed, 41 insertions(+), 39 deletions(-)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index e873bad36674..fb47ec931876 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -130,7 +130,6 @@ const char *qemu_strchrnul(const char *s, int c);
 #endif
 time_t mktimegm(struct tm *tm);
 int qemu_fdatasync(int fd);
-int qemu_msync(void *addr, size_t length, int fd);
 int qemu_parse_fd(const char *param);
 int qemu_strtoi(const char *nptr, const char **endptr, int base,
                 int *result);
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 14b6b65a5fa9..bf4f75dcde8f 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -641,6 +641,19 @@ static inline void qemu_reset_optind(void)
 #endif
 }
 
+/**
+ * Sync changes made to the memory mapped file back to the backing
+ * storage. For POSIX compliant systems this will fallback
+ * to regular msync call. Otherwise it will trigger whole file sync
+ * (including the metadata case there is no support to skip that otherwise)
+ *
+ * @addr   - start of the memory area to be synced
+ * @length - length of the are to be synced
+ * @fd     - file descriptor for the file to be synced
+ *           (mandatory only for POSIX non-compliant systems)
+ */
+int qemu_msync(void *addr, size_t length, int fd);
+
 /**
  * qemu_get_host_name:
  * @errp: Error object
diff --git a/util/cutils.c b/util/cutils.c
index a01a3a754049..c0775bb53c29 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -160,44 +160,6 @@ int qemu_fdatasync(int fd)
 #endif
 }
 
-/**
- * Sync changes made to the memory mapped file back to the backing
- * storage. For POSIX compliant systems this will fallback
- * to regular msync call. Otherwise it will trigger whole file sync
- * (including the metadata case there is no support to skip that otherwise)
- *
- * @addr   - start of the memory area to be synced
- * @length - length of the are to be synced
- * @fd     - file descriptor for the file to be synced
- *           (mandatory only for POSIX non-compliant systems)
- */
-int qemu_msync(void *addr, size_t length, int fd)
-{
-#ifdef CONFIG_POSIX
-    size_t align_mask = ~(qemu_real_host_page_size() - 1);
-
-    /**
-     * There are no strict reqs as per the length of mapping
-     * to be synced. Still the length needs to follow the address
-     * alignment changes. Additionally - round the size to the multiple
-     * of PAGE_SIZE
-     */
-    length += ((uintptr_t)addr & (qemu_real_host_page_size() - 1));
-    length = (length + ~align_mask) & align_mask;
-
-    addr = (void *)((uintptr_t)addr & align_mask);
-
-    return msync(addr, length, MS_SYNC);
-#else /* CONFIG_POSIX */
-    /**
-     * Perform the sync based on the file descriptor
-     * The sync range will most probably be wider than the one
-     * requested - but it will still get the job done
-     */
-    return qemu_fdatasync(fd);
-#endif /* CONFIG_POSIX */
-}
-
 static int64_t suffix_mul(char suffix, int64_t unit)
 {
     switch (qemu_toupper(suffix)) {
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index c471c5bc9f8d..161f1123259f 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -950,3 +950,21 @@ int fcntl_setfl(int fd, int flag)
     }
     return 0;
 }
+
+int qemu_msync(void *addr, size_t length, int fd)
+{
+    size_t align_mask = ~(qemu_real_host_page_size() - 1);
+
+    /**
+     * There are no strict reqs as per the length of mapping
+     * to be synced. Still the length needs to follow the address
+     * alignment changes. Additionally - round the size to the multiple
+     * of PAGE_SIZE
+     */
+    length += ((uintptr_t)addr & (qemu_real_host_page_size() - 1));
+    length = (length + ~align_mask) & align_mask;
+
+    addr = (void *)((uintptr_t)addr & align_mask);
+
+    return msync(addr, length, MS_SYNC);
+}
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index f38b06914e12..1e05c316b311 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -596,3 +596,13 @@ size_t qemu_get_host_physmem(void)
     }
     return 0;
 }
+
+int qemu_msync(void *addr, size_t length, int fd)
+{
+    /**
+     * Perform the sync based on the file descriptor
+     * The sync range will most probably be wider than the one
+     * requested - but it will still get the job done
+     */
+    return qemu_fdatasync(fd);
+}
-- 
2.36.0


