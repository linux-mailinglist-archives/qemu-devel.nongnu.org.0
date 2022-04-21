Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EC050A18A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:06:08 +0200 (CEST)
Received: from localhost ([::1]:57646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXRf-0001nv-O6
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXDy-00054E-9b
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:51:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXDw-0006HG-Ab
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RPj4vdGD1IHh8x+TqjPJVuSuUxUc9g+12x2cb4vMPwA=;
 b=PwkndRVQFzqTlIqudrMsVxl6swkAuUGCZYlfBV4jJ+cO0L49vXyOuHVZxWx+zpsi5Rs10D
 6EdYCdSdZE2ty61nlD7L4qZAESlRMnOP+MWKt3kUNlENQh0k7wqIzFdesRC4tFAQks/0Pn
 XMGu90vT73XExr5077jhmtvnDRX3HLc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-RjMjpNW-P1Kfj06PrhGMsA-1; Thu, 21 Apr 2022 09:51:52 -0400
X-MC-Unique: RjMjpNW-P1Kfj06PrhGMsA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ADE21014A60;
 Thu, 21 Apr 2022 13:51:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 853142166B48;
 Thu, 21 Apr 2022 13:51:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 22/30] qga: move qga_get_host_name()
Date: Thu, 21 Apr 2022 17:49:32 +0400
Message-Id: <20220421134940.2887768-23-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
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
Cc: Stefan Weil <sw@weilnetz.de>, richard.henderson@linaro.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The function is specific to qemu-ga, no need to share it in QEMU.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Message-Id: <20220420132624.2439741-32-marcandre.lureau@redhat.com>
---
 include/qemu/osdep.h  | 10 ----------
 qga/commands-common.h | 11 +++++++++++
 qga/commands-posix.c  | 35 +++++++++++++++++++++++++++++++++++
 qga/commands-win32.c  | 13 +++++++++++++
 qga/commands.c        |  2 +-
 util/oslib-posix.c    | 35 -----------------------------------
 util/oslib-win32.c    | 13 -------------
 7 files changed, 60 insertions(+), 59 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index a87f1b7f32e6..4bf2883a60b3 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -656,16 +656,6 @@ int qemu_fdatasync(int fd);
  */
 int qemu_msync(void *addr, size_t length, int fd);
 
-/**
- * qemu_get_host_name:
- * @errp: Error object
- *
- * Operating system agnostic way of querying host name.
- *
- * Returns allocated hostname (caller should free), NULL on failure.
- */
-char *qemu_get_host_name(Error **errp);
-
 /**
  * qemu_get_host_physmem:
  *
diff --git a/qga/commands-common.h b/qga/commands-common.h
index 90785ed4bb7b..d0e4a9696f37 100644
--- a/qga/commands-common.h
+++ b/qga/commands-common.h
@@ -18,4 +18,15 @@ GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp);
 GuestFileRead *guest_file_read_unsafe(GuestFileHandle *gfh,
                                       int64_t count, Error **errp);
 
+/**
+ * qga_get_host_name:
+ * @errp: Error object
+ *
+ * Operating system agnostic way of querying host name.
+ * Compared to g_get_host_name(), it doesn't cache the result.
+ *
+ * Returns allocated hostname (caller should free), NULL on failure.
+ */
+char *qga_get_host_name(Error **errp);
+
 #endif
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 390c1560e1b5..77f4672ca2c9 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -3278,3 +3278,38 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
 
     return NULL;
 }
+
+#ifndef HOST_NAME_MAX
+# ifdef _POSIX_HOST_NAME_MAX
+#  define HOST_NAME_MAX _POSIX_HOST_NAME_MAX
+# else
+#  define HOST_NAME_MAX 255
+# endif
+#endif
+
+char *qga_get_host_name(Error **errp)
+{
+    long len = -1;
+    g_autofree char *hostname = NULL;
+
+#ifdef _SC_HOST_NAME_MAX
+    len = sysconf(_SC_HOST_NAME_MAX);
+#endif /* _SC_HOST_NAME_MAX */
+
+    if (len < 0) {
+        len = HOST_NAME_MAX;
+    }
+
+    /* Unfortunately, gethostname() below does not guarantee a
+     * NULL terminated string. Therefore, allocate one byte more
+     * to be sure. */
+    hostname = g_new0(char, len + 1);
+
+    if (gethostname(hostname, len) < 0) {
+        error_setg_errno(errp, errno,
+                         "cannot get hostname");
+        return NULL;
+    }
+
+    return g_steal_pointer(&hostname);
+}
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 406e4072a012..d56b5fd2a71c 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2519,3 +2519,16 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
     }
     return head;
 }
+
+char *qga_get_host_name(Error **errp)
+{
+    wchar_t tmp[MAX_COMPUTERNAME_LENGTH + 1];
+    DWORD size = G_N_ELEMENTS(tmp);
+
+    if (GetComputerNameW(tmp, &size) == 0) {
+        error_setg_win32(errp, GetLastError(), "failed close handle");
+        return NULL;
+    }
+
+    return g_utf16_to_utf8(tmp, size, NULL, NULL, NULL);
+}
diff --git a/qga/commands.c b/qga/commands.c
index 4e9ce25b2e73..690da0073d6e 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -511,7 +511,7 @@ int ga_parse_whence(GuestFileWhence *whence, Error **errp)
 GuestHostName *qmp_guest_get_host_name(Error **errp)
 {
     GuestHostName *result = NULL;
-    g_autofree char *hostname = qemu_get_host_name(errp);
+    g_autofree char *hostname = qga_get_host_name(errp);
 
     /*
      * We want to avoid using g_get_host_name() because that
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 161f1123259f..fd2bdc9ac7b3 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -886,41 +886,6 @@ void sigaction_invoke(struct sigaction *action,
     action->sa_sigaction(info->ssi_signo, &si, NULL);
 }
 
-#ifndef HOST_NAME_MAX
-# ifdef _POSIX_HOST_NAME_MAX
-#  define HOST_NAME_MAX _POSIX_HOST_NAME_MAX
-# else
-#  define HOST_NAME_MAX 255
-# endif
-#endif
-
-char *qemu_get_host_name(Error **errp)
-{
-    long len = -1;
-    g_autofree char *hostname = NULL;
-
-#ifdef _SC_HOST_NAME_MAX
-    len = sysconf(_SC_HOST_NAME_MAX);
-#endif /* _SC_HOST_NAME_MAX */
-
-    if (len < 0) {
-        len = HOST_NAME_MAX;
-    }
-
-    /* Unfortunately, gethostname() below does not guarantee a
-     * NULL terminated string. Therefore, allocate one byte more
-     * to be sure. */
-    hostname = g_new0(char, len + 1);
-
-    if (gethostname(hostname, len) < 0) {
-        error_setg_errno(errp, errno,
-                         "cannot get hostname");
-        return NULL;
-    }
-
-    return g_steal_pointer(&hostname);
-}
-
 size_t qemu_get_host_physmem(void)
 {
 #ifdef _SC_PHYS_PAGES
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 1e05c316b311..b897d759365f 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -573,19 +573,6 @@ bool qemu_write_pidfile(const char *filename, Error **errp)
     return true;
 }
 
-char *qemu_get_host_name(Error **errp)
-{
-    wchar_t tmp[MAX_COMPUTERNAME_LENGTH + 1];
-    DWORD size = G_N_ELEMENTS(tmp);
-
-    if (GetComputerNameW(tmp, &size) == 0) {
-        error_setg_win32(errp, GetLastError(), "failed close handle");
-        return NULL;
-    }
-
-    return g_utf16_to_utf8(tmp, size, NULL, NULL, NULL);
-}
-
 size_t qemu_get_host_physmem(void)
 {
     MEMORYSTATUSEX statex;
-- 
2.36.0


