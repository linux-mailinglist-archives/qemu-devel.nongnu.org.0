Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A7D60E6E1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 19:58:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onkcw-0008WH-FD; Wed, 26 Oct 2022 13:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkct-0008Rh-To
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkco-0005eU-QC
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666806934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2iUMF2Ut8nhKI3m5KrXUaUz+X7rgCqvtIoWEFoFpmAg=;
 b=WgXNzEYLSSAls8mTveBJO9JGC6+rBEN7azjKKVbNAe8vB9oZTVBQebvwyWs3nEnzqHdIiH
 NU9Fsy+qocmWyvqtGRWLimU52NjPjimlGaFYNbabZ22jIFcnrbYiPzG9Mdt8Q/BHDe0ogs
 ky2E20Q4aeMcYPnS/NntCptvf3q+GnY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-s6Vs0pC6MMKeam-F81ZSBQ-1; Wed, 26 Oct 2022 13:55:33 -0400
X-MC-Unique: s6Vs0pC6MMKeam-F81ZSBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4955857AAA;
 Wed, 26 Oct 2022 17:55:32 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (ovpn-192-17.brq.redhat.com
 [10.40.192.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00AF62166B41;
 Wed, 26 Oct 2022 17:55:23 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 1/8] qga: Add initial FreeBSD support
Date: Wed, 26 Oct 2022 20:55:11 +0300
Message-Id: <20221026175518.2636846-2-kkostiuk@redhat.com>
In-Reply-To: <20221026175518.2636846-1-kkostiuk@redhat.com>
References: <20221026175518.2636846-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

- Fix device path.
- Fix virtio-serial channel initialization.
- Make the code buildable in FreeBSD.

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 meson.build          |  2 +-
 qga/channel-posix.c  | 19 +++++++++++++++++++
 qga/commands-posix.c |  8 ++++++++
 qga/main.c           |  6 +++++-
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index b686dfef75..71fe72ea06 100644
--- a/meson.build
+++ b/meson.build
@@ -75,7 +75,7 @@ have_tools = get_option('tools') \
   .allowed()
 have_ga = get_option('guest_agent') \
   .disable_auto_if(not have_system and not have_tools) \
-  .require(targetos in ['sunos', 'linux', 'windows'],
+  .require(targetos in ['sunos', 'linux', 'windows', 'freebsd'],
            error_message: 'unsupported OS for QEMU guest agent') \
   .allowed()
 have_block = have_system or have_tools
diff --git a/qga/channel-posix.c b/qga/channel-posix.c
index 6796a02cff..568350ded4 100644
--- a/qga/channel-posix.c
+++ b/qga/channel-posix.c
@@ -149,6 +149,25 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
             return false;
         }
 #endif
+#ifdef __FreeBSD__
+        /*
+         * In the default state channel sends echo of every command to a
+         * client. The client programm doesn't expect this and raises an
+         * error. Suppress echo by resetting ECHO terminal flag.
+         */
+        struct termios tio;
+        if (tcgetattr(fd, &tio) < 0) {
+            error_setg_errno(errp, errno, "error getting channel termios attrs");
+            close(fd);
+            return false;
+        }
+        tio.c_lflag &= ~ECHO;
+        if (tcsetattr(fd, TCSAFLUSH, &tio) < 0) {
+            error_setg_errno(errp, errno, "error setting channel termios attrs");
+            close(fd);
+            return false;
+        }
+#endif /* __FreeBSD__ */
         ret = ga_channel_client_add(c, fd);
         if (ret) {
             error_setg(errp, "error adding channel to main loop");
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index eea819cff0..16d67e9f6d 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -51,6 +51,14 @@
 #endif
 #endif
 
+#ifdef __FreeBSD__
+/*
+ * The code under HAVE_GETIFADDRS condition can't be compiled in FreeBSD.
+ * Fix it in one of the following patches.
+ */
+#undef HAVE_GETIFADDRS
+#endif
+
 #ifdef HAVE_GETIFADDRS
 #include <arpa/inet.h>
 #include <sys/socket.h>
diff --git a/qga/main.c b/qga/main.c
index 5a9d8252e0..0d27c97d38 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -45,9 +45,13 @@
 #endif
 
 #ifndef _WIN32
+#ifdef __FreeBSD__
+#define QGA_VIRTIO_PATH_DEFAULT "/dev/vtcon/org.qemu.guest_agent.0"
+#else /* __FreeBSD__ */
 #define QGA_VIRTIO_PATH_DEFAULT "/dev/virtio-ports/org.qemu.guest_agent.0"
-#define QGA_STATE_RELATIVE_DIR  "run"
+#endif /* __FreeBSD__ */
 #define QGA_SERIAL_PATH_DEFAULT "/dev/ttyS0"
+#define QGA_STATE_RELATIVE_DIR  "run"
 #else
 #define QGA_VIRTIO_PATH_DEFAULT "\\\\.\\Global\\org.qemu.guest_agent.0"
 #define QGA_STATE_RELATIVE_DIR  "qemu-ga"
-- 
2.25.1


