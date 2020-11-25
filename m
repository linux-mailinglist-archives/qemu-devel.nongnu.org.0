Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E9A2C3D9B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 11:27:53 +0100 (CET)
Received: from localhost ([::1]:43150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khs1f-0001Ko-Kt
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 05:27:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khrj9-0007kI-W1
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:08:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khrj8-0003PJ-8I
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:08:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606298920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1WInulEBNYJrSEae5i+nZvQ2xAyWD7JOEfJhEKhriP0=;
 b=UVPR9u2ycv4SnOqhWnYjgoVIpGffpiLVYg/gCDNf4uLHMGLr6uof01gIOtLJjoFwgp3wJD
 5x94dWUcNTlB+JrNHSObN23X3zPkx59U6f8CBjBikK+ZaphNtKwVjnNC5eakzhCIfNXtGh
 tSgOEFpv87307dISbNdEDgV51suyIuc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-jbOmF7MHNNm4O_OsVV-QIw-1; Wed, 25 Nov 2020 05:08:38 -0500
X-MC-Unique: jbOmF7MHNNm4O_OsVV-QIw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82DE41005E46
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 10:08:37 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91F9619C78;
 Wed, 25 Nov 2020 10:08:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] libvhost-user: add a simple link test without glib
Date: Wed, 25 Nov 2020 14:06:39 +0400
Message-Id: <20201125100640.366523-8-marcandre.lureau@redhat.com>
In-Reply-To: <20201125100640.366523-1-marcandre.lureau@redhat.com>
References: <20201125100640.366523-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 subprojects/libvhost-user/link-test.c | 45 +++++++++++++++++++++++++++
 subprojects/libvhost-user/meson.build |  4 +++
 2 files changed, 49 insertions(+)
 create mode 100644 subprojects/libvhost-user/link-test.c

diff --git a/subprojects/libvhost-user/link-test.c b/subprojects/libvhost-user/link-test.c
new file mode 100644
index 0000000000..e01d6eb1fa
--- /dev/null
+++ b/subprojects/libvhost-user/link-test.c
@@ -0,0 +1,45 @@
+/*
+ * A trivial unit test to check linking without glib. A real test suite should
+ * probably based off libvhost-user-glib instead.
+ */
+#include <assert.h>
+#include <stdlib.h>
+#include "libvhost-user.h"
+
+static void
+panic(VuDev *dev, const char *err)
+{
+    abort();
+}
+
+static void
+set_watch(VuDev *dev, int fd, int condition,
+          vu_watch_cb cb, void *data)
+{
+    abort();
+}
+
+static void
+remove_watch(VuDev *dev, int fd)
+{
+    abort();
+}
+
+static const VuDevIface iface = {
+    0,
+};
+
+int
+main(int argc, const char *argv[])
+{
+    bool rc;
+    uint16_t max_queues = 2;
+    int socket = 0;
+    VuDev dev = { 0, };
+
+    rc = vu_init(&dev, max_queues, socket, panic, NULL, set_watch, remove_watch, &iface);
+    assert(rc == true);
+    vu_deinit(&dev);
+
+    return 0;
+}
diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
index ac228b5ba6..76e83c0cec 100644
--- a/subprojects/libvhost-user/meson.build
+++ b/subprojects/libvhost-user/meson.build
@@ -22,6 +22,10 @@ vhost_user = static_library('vhost-user',
                             include_directories: inc,
                             c_args: '-D_GNU_SOURCE')
 
+executable('link-test', files('link-test.c'),
+           link_whole: vhost_user,
+           include_directories: inc)
+
 vhost_user_glib = static_library('vhost-user-glib',
                                  files('libvhost-user-glib.c'),
                                  include_directories: inc,
-- 
2.29.0


