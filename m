Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4DA4E5693
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:36:39 +0100 (CET)
Received: from localhost ([::1]:43544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3yP-0007D8-M4
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:36:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Qa-00064Z-Tm
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3QZ-0005h7-AS
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ITM/VQzJOjyxTy3ox9hS/WybioJOSsiqi7yexnEiSo=;
 b=cPwr+rvR3n06yGlXePEHEEop/ezy2HdWdyqp8cAlOx/IxtT8CWBuST5S2u5cNoYD+g+Sdu
 A4FPzWKhbnURuO1I1G3ZdO95BRnrZSotTu+7LxgqwFeJrhz27Z8Hry7epAEq3Z3QmUi0Ms
 62dayFQcqepxy0M84iZw0u2tSOwW6HQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-G4EQRINlP1KSQhO9WqNVwA-1; Wed, 23 Mar 2022 12:01:36 -0400
X-MC-Unique: G4EQRINlP1KSQhO9WqNVwA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACEDF1C09046
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 16:01:35 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE99C4B8D43;
 Wed, 23 Mar 2022 16:01:34 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 29/32] Move fcntl_setfl() to oslib-posix
Date: Wed, 23 Mar 2022 19:57:40 +0400
Message-Id: <20220323155743.1585078-30-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It is only implemented for POSIX anyway.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/cutils.h     |  1 -
 include/sysemu/os-posix.h |  2 ++
 util/cutils.c             | 17 -----------------
 util/oslib-posix.c        | 15 +++++++++++++++
 4 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 2137e6526087..e873bad36674 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -131,7 +131,6 @@ const char *qemu_strchrnul(const char *s, int c);
 time_t mktimegm(struct tm *tm);
 int qemu_fdatasync(int fd);
 int qemu_msync(void *addr, size_t length, int fd);
-int fcntl_setfl(int fd, int flag);
 int qemu_parse_fd(const char *param);
 int qemu_strtoi(const char *nptr, const char **endptr, int base,
                 int *result);
diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index a49c6848ff1a..e9deb9b0c4b6 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -99,6 +99,8 @@ static inline void qemu_funlockfile(FILE *f)
     funlockfile(f);
 }
 
+int fcntl_setfl(int fd, int flag);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/util/cutils.c b/util/cutils.c
index 1173ce3b88f3..aaf2ced29142 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -199,23 +199,6 @@ int qemu_msync(void *addr, size_t length, int fd)
 #endif /* CONFIG_POSIX */
 }
 
-#ifndef _WIN32
-/* Sets a specific flag */
-int fcntl_setfl(int fd, int flag)
-{
-    int flags;
-
-    flags = fcntl(fd, F_GETFL);
-    if (flags == -1)
-        return -errno;
-
-    if (fcntl(fd, F_SETFL, flags | flag) == -1)
-        return -errno;
-
-    return 0;
-}
-#endif
-
 static int64_t suffix_mul(char suffix, int64_t unit)
 {
     switch (qemu_toupper(suffix)) {
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 577c855612cb..fae25be3e779 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -936,3 +936,18 @@ size_t qemu_get_host_physmem(void)
 #endif
     return 0;
 }
+
+/* Sets a specific flag */
+int fcntl_setfl(int fd, int flag)
+{
+    int flags;
+
+    flags = fcntl(fd, F_GETFL);
+    if (flags == -1)
+        return -errno;
+
+    if (fcntl(fd, F_SETFL, flags | flag) == -1)
+        return -errno;
+
+    return 0;
+}
-- 
2.35.1.273.ge6ebfd0e8cbb


