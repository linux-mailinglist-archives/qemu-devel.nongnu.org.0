Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AA029368D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 10:15:43 +0200 (CEST)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUmo2-0007rA-LR
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 04:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kUmlq-0006N9-Dt
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 04:13:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kUmlk-0001Ze-9a
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 04:13:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603181599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oC06nz2LgSApPVAE0UdU3X/ockXF5+7JzZSINGGlJo8=;
 b=X0RyLtSYMi1CvQFUETfM/0vMpUvi8mRA9e4wQAvbT3xcrHkccSdwcBABU0zyNDfnI/IOKM
 p1n/WFBSffo8jaZGySc+mytY4ogYDNqISUuSiw+qZmMPgpaNrtLZnYsmEZLK7dtRqEw050
 sHTcWpSQGpe7nmufj07VwvR11zazrig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-lonXw_QhNQG4qyFloTPW_w-1; Tue, 20 Oct 2020 04:13:14 -0400
X-MC-Unique: lonXw_QhNQG4qyFloTPW_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3E40108E1A9;
 Tue, 20 Oct 2020 08:13:13 +0000 (UTC)
Received: from localhost (unknown [10.36.110.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE7A827CD1;
 Tue, 20 Oct 2020 08:13:09 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] glib-compat: add g_unix_get_passwd_entry_qemu()
Date: Tue, 20 Oct 2020 12:12:51 +0400
Message-Id: <20201020081257.2054548-2-marcandre.lureau@redhat.com>
In-Reply-To: <20201020081257.2054548-1-marcandre.lureau@redhat.com>
References: <20201020081257.2054548-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: berrange@redhat.com, Michael Roth <mdroth@linux.vnet.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The glib function was introduced in 2.64. It's a safer version of
getpwnam, and also simpler to use than getpwnam_r.

Currently, it's only use by the next patch in qemu-ga, which doesn't
(well well...) need the thread safety guarantees. Since the fallback
version is still unsafe, I would rather keep the _qemu postfix, to make
sure it's not being misused by mistake. When/if necessary, we can
implement a safer fallback and drop the _qemu suffix.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
---
 include/glib-compat.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/glib-compat.h b/include/glib-compat.h
index 0b0ec76299..64e68aa730 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -30,6 +30,11 @@
 #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
 
 #include <glib.h>
+#if defined(G_OS_UNIX)
+#include <glib-unix.h>
+#include <sys/types.h>
+#include <pwd.h>
+#endif
 
 /*
  * Note that because of the GLIB_VERSION_MAX_ALLOWED constant above, allowing
@@ -72,6 +77,27 @@
 gint g_poll_fixed(GPollFD *fds, guint nfds, gint timeout);
 #endif
 
+#if defined(G_OS_UNIX)
+/* Note: The fallback implementation is not MT-safe, and it returns a copy of
+ * the libc passwd (must be g_free() after use) but not the content. Because of
+ * these important differences the caller must be aware of, it's not #define for
+ * GLib API substitution. */
+static inline struct passwd *
+g_unix_get_passwd_entry_qemu(const gchar *user_name, GError **error)
+{
+#if GLIB_CHECK_VERSION(2, 64, 0)
+    return g_unix_get_passwd_entry(user_name, error);
+#else
+    struct passwd *p = getpwnam(user_name);
+    if (!p) {
+        g_set_error_literal(error, G_UNIX_ERROR, 0, g_strerror(errno));
+        return NULL;
+    }
+    return (struct passwd *)g_memdup(p, sizeof(*p));
+#endif
+}
+#endif /* G_OS_UNIX */
+
 #pragma GCC diagnostic pop
 
 #endif
-- 
2.28.0


