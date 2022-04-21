Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5074150A163
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:57:24 +0200 (CEST)
Received: from localhost ([::1]:40460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXJD-0006fk-Dz
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXDN-0004Sr-C5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:51:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXDL-0006Bd-7k
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Cz/YdSgKkJlrV8fo1ydaOhEn1MafCaf9j4Mo7q1KUE=;
 b=GAAI4IHIuQDpVWEL0IXnukn4sq/DG9AH82rNXFrCfi8RUAnpqnW+NuyFIBshUYnl+xRtJt
 NO30/Sy8Tb5QJJWPYV8h1NDWUXAJHEpGM2ypMObfE0pgY3sIal+dhpcsR36yAAFMG3pRai
 qskygtIfTzgTI8yZW6B1VF5tOWIzgXM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-A3bdmXCxN52yBBHY7-RP8Q-1; Thu, 21 Apr 2022 09:51:14 -0400
X-MC-Unique: A3bdmXCxN52yBBHY7-RP8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9726C1C0E0E7;
 Thu, 21 Apr 2022 13:51:14 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C440E404D2E2;
 Thu, 21 Apr 2022 13:51:13 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 15/30] include: move qemu_fdatasync() to osdep
Date: Thu, 21 Apr 2022 17:49:25 +0400
Message-Id: <20220421134940.2887768-16-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Move QEMU-specific code to util/osdep.c, so cutils can become a common
subproject.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-22-marcandre.lureau@redhat.com>
---
 include/qemu/cutils.h |  1 -
 include/qemu/osdep.h  |  2 ++
 util/cutils.c         | 16 ----------------
 util/osdep.c          | 16 ++++++++++++++++
 4 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index fb47ec931876..5c6572d44422 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -129,7 +129,6 @@ static inline const char *qemu_strchrnul(const char *s, int c)
 const char *qemu_strchrnul(const char *s, int c);
 #endif
 time_t mktimegm(struct tm *tm);
-int qemu_fdatasync(int fd);
 int qemu_parse_fd(const char *param);
 int qemu_strtoi(const char *nptr, const char **endptr, int base,
                 int *result);
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index bf4f75dcde8f..a87f1b7f32e6 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -641,6 +641,8 @@ static inline void qemu_reset_optind(void)
 #endif
 }
 
+int qemu_fdatasync(int fd);
+
 /**
  * Sync changes made to the memory mapped file back to the backing
  * storage. For POSIX compliant systems this will fallback
diff --git a/util/cutils.c b/util/cutils.c
index c0775bb53c29..b2777210e7da 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -144,22 +144,6 @@ time_t mktimegm(struct tm *tm)
     return t;
 }
 
-/*
- * Make sure data goes on disk, but if possible do not bother to
- * write out the inode just for timestamp updates.
- *
- * Unfortunately even in 2009 many operating systems do not support
- * fdatasync and have to fall back to fsync.
- */
-int qemu_fdatasync(int fd)
-{
-#ifdef CONFIG_FDATASYNC
-    return fdatasync(fd);
-#else
-    return fsync(fd);
-#endif
-}
-
 static int64_t suffix_mul(char suffix, int64_t unit)
 {
     switch (qemu_toupper(suffix)) {
diff --git a/util/osdep.c b/util/osdep.c
index 1ea2398686ee..c7aec36f22c7 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -607,3 +607,19 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
     return readv_writev(fd, iov, iov_cnt, true);
 }
 #endif
+
+/*
+ * Make sure data goes on disk, but if possible do not bother to
+ * write out the inode just for timestamp updates.
+ *
+ * Unfortunately even in 2009 many operating systems do not support
+ * fdatasync and have to fall back to fsync.
+ */
+int qemu_fdatasync(int fd)
+{
+#ifdef CONFIG_FDATASYNC
+    return fdatasync(fd);
+#else
+    return fsync(fd);
+#endif
+}
-- 
2.36.0


