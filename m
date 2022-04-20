Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E830508ABB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:24:21 +0200 (CEST)
Received: from localhost ([::1]:43124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBFk-0002QW-Ak
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAO9-0000H7-F1
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:28:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhANz-0004k3-Md
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HhvVyZyiSWgMcMXj4xTc2YQk4RSEFWp50yiEiIWNNZY=;
 b=DB20951QvzxNmzeFAPx/jTH/xjSuPwP3QRhpIlUxZ1EICCv7bkDoAHkIB/hxJ0Qk3qmD+o
 t8JoMvIHdvknE41SRvDGYBnogWtBYd3FXa7/xkNTh5bmvZbvxEm+ouh8GCsp6mCDKPpHu8
 ylwVPikpwdBUGWPYgyymhmI9SqpmdNE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-sXIzUeloPW6clcp132ooRw-1; Wed, 20 Apr 2022 09:28:46 -0400
X-MC-Unique: sXIzUeloPW6clcp132ooRw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B18FF1C0513C;
 Wed, 20 Apr 2022 13:28:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F17246A3BB;
 Wed, 20 Apr 2022 13:28:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 20/41] include: move qemu_msync() to osdep
Date: Wed, 20 Apr 2022 17:26:03 +0400
Message-Id: <20220420132624.2439741-21-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The implementation depends on the OS. (and longer-term goal is to move
cutils to a common subproject)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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
2.35.1.693.g805e0a68082a


