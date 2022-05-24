Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234075327F4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 12:40:28 +0200 (CEST)
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntRxj-0002C4-5V
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 06:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntRtP-0007nm-7L
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:36:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntRtB-0007YE-Rv
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653388503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=emdcjJUpQsgc/evSN7aMroQ6CWqJ8sT8WbJACxGdcWE=;
 b=WFA+riVgYjd2fcMQFBoLtV1PY3Or1FUxMIOQXhhryLKHfl7LDUkZcPNXNxwVrIRl3PahW+
 D7HGzxBwGrZi46jK7r1Uic88qJyFxxABA9brYCi05jOmkeX7wbgdP8/AFEZp72rw9aOQCA
 HO9ZkQ8UgJwwdmYNA44QF7fnBKWcIVQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-2iLs2fhtM-ipEVNT0xJyYQ-1; Tue, 24 May 2022 06:35:00 -0400
X-MC-Unique: 2iLs2fhtM-ipEVNT0xJyYQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 473C33831C44;
 Tue, 24 May 2022 10:35:00 +0000 (UTC)
Received: from localhost (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA92EC08087;
 Tue, 24 May 2022 10:34:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v4 05/15] qga: add qga_open_cloexec() helper
Date: Tue, 24 May 2022 12:34:43 +0200
Message-Id: <20220524103453.162665-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220524103453.162665-1-marcandre.lureau@redhat.com>
References: <20220524103453.162665-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

QGA calls qemu_open_old() in various places. Calling qemu_open() instead
isn't a great alternative, as it has special "/dev/fdset" handling and
depends on QEMU internal monitor data structures.

Instead, provide a simple helper for QGA needs, with Error* support. The
following patches will make use of it.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/cutils.c    | 37 +++++++++++++++++++++++++++++++++++++
 qga/cutils.h    |  8 ++++++++
 qga/meson.build |  1 +
 3 files changed, 46 insertions(+)
 create mode 100644 qga/cutils.c
 create mode 100644 qga/cutils.h

diff --git a/qga/cutils.c b/qga/cutils.c
new file mode 100644
index 0000000000..37dd877451
--- /dev/null
+++ b/qga/cutils.c
@@ -0,0 +1,37 @@
+/*
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "cutils.h"
+
+#include "qapi/error.h"
+
+/**
+ * qga_open_cloexec:
+ * @name: the pathname to open
+ * @flags: as in open()
+ * @mode: as in open()
+ * @errp: pointer to Error*, or NULL
+ *
+ * A wrapper for open() function which sets O_CLOEXEC.
+ *
+ * On error, -1 is returned and @errp is set.
+ */
+int qga_open_cloexec(const char *name, int flags, mode_t mode, Error **errp)
+{
+    int ret;
+
+#ifdef O_CLOEXEC
+    ret = open(name, flags | O_CLOEXEC, mode);
+#else
+    ret = open(name, flags, mode);
+    if (ret >= 0) {
+        qemu_set_cloexec(ret);
+    }
+#endif
+    if (ret == -1) {
+        error_setg_errno(errp, errno, "Failed to open file '%s'", name);
+    }
+
+    return ret;
+}
diff --git a/qga/cutils.h b/qga/cutils.h
new file mode 100644
index 0000000000..caccf79e45
--- /dev/null
+++ b/qga/cutils.h
@@ -0,0 +1,8 @@
+#ifndef CUTILS_H_
+#define CUTILS_H_
+
+#include "qemu/osdep.h"
+
+int qga_open_cloexec(const char *name, int flags, mode_t mode, Error **errp);
+
+#endif /* CUTILS_H_ */
diff --git a/qga/meson.build b/qga/meson.build
index 6d9f39bb32..35fe2229e9 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -65,6 +65,7 @@ qga_ss.add(files(
   'commands.c',
   'guest-agent-command-state.c',
   'main.c',
+  'cutils.c',
 ))
 qga_ss.add(when: 'CONFIG_POSIX', if_true: files(
   'channel-posix.c',
-- 
2.36.1


