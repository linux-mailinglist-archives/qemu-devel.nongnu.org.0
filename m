Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB7D629BFD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:24:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwqu-0006wP-Dv; Tue, 15 Nov 2022 09:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pw4Z=3P=lse.epita.fr=xdbob@cri.epita.fr>)
 id 1ouwqs-0006u3-H3
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:23:50 -0500
Received: from mail.cri.epita.fr ([91.243.117.197]
 helo=mail-2.srv.cri.epita.fr)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pw4Z=3P=lse.epita.fr=xdbob@cri.epita.fr>)
 id 1ouwqq-0004jt-Mq
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:23:50 -0500
Received: from localhost (unknown [185.123.26.202])
 (Authenticated sender: damhet_a)
 by mail-2.srv.cri.epita.fr (Postfix) with ESMTPSA id DAA513FC86;
 Tue, 15 Nov 2022 15:23:44 +0100 (CET)
From: antoine.damhet@shadow.tech
To: qemu-devel@nongnu.org
Cc: vm@shadow.tech, Antoine Damhet <antoine.damhet@shadow.tech>,
 Charles Frey <charles.frey@shadow.tech>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/2] io/channel-tls: fix handling of bigger read buffers
Date: Tue, 15 Nov 2022 15:23:29 +0100
Message-Id: <20221115142329.92524-3-antoine.damhet@shadow.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115142329.92524-1-antoine.damhet@shadow.tech>
References: <20221115142329.92524-1-antoine.damhet@shadow.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=91.243.117.197;
 envelope-from=SRS0=Pw4Z=3P=lse.epita.fr=xdbob@cri.epita.fr;
 helo=mail-2.srv.cri.epita.fr
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Antoine Damhet <antoine.damhet@shadow.tech>

Since the TLS backend can read more data from the underlying QIOChannel
we introduce a minimal child GSource to notify if we still have more
data available to be read.

Signed-off-by: Antoine Damhet <antoine.damhet@shadow.tech>
Signed-off-by: Charles Frey <charles.frey@shadow.tech>
---
 io/channel-tls.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/io/channel-tls.c b/io/channel-tls.c
index 4ce890a538..4f2b8828f9 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -388,12 +388,76 @@ static void qio_channel_tls_set_aio_fd_handler(QIOChannel *ioc,
     qio_channel_set_aio_fd_handler(tioc->master, ctx, io_read, io_write, opaque);
 }
 
+typedef struct QIOChannelTLSSource QIOChannelTLSSource;
+struct QIOChannelTLSSource {
+    GSource parent;
+    QIOChannelTLS *tioc;
+};
+
+static gboolean
+qio_channel_tls_source_check(GSource *source)
+{
+    QIOChannelTLSSource *tsource = (QIOChannelTLSSource *)source;
+
+    return qcrypto_tls_session_check_pending(tsource->tioc->session) > 0;
+}
+
+static gboolean
+qio_channel_tls_source_prepare(GSource *source, gint *timeout)
+{
+    *timeout = -1;
+    return qio_channel_tls_source_check(source);
+}
+
+static gboolean
+qio_channel_tls_source_dispatch(GSource *source, GSourceFunc callback,
+                                gpointer user_data)
+{
+    return G_SOURCE_CONTINUE;
+}
+
+static void
+qio_channel_tls_source_finalize(GSource *source)
+{
+    QIOChannelTLSSource *tsource = (QIOChannelTLSSource *)source;
+
+    object_unref(OBJECT(tsource->tioc));
+}
+
+static GSourceFuncs qio_channel_tls_source_funcs = {
+    qio_channel_tls_source_prepare,
+    qio_channel_tls_source_check,
+    qio_channel_tls_source_dispatch,
+    qio_channel_tls_source_finalize
+};
+
+static void
+qio_channel_tls_read_watch(QIOChannelTLS *tioc, GSource *source)
+{
+    GSource *child;
+    QIOChannelTLSSource *tlssource;
+
+    child = g_source_new(&qio_channel_tls_source_funcs,
+                          sizeof(QIOChannelTLSSource));
+    tlssource = (QIOChannelTLSSource *)child;
+
+    tlssource->tioc = tioc;
+    object_ref(OBJECT(tioc));
+
+    g_source_add_child_source(source, child);
+}
+
 static GSource *qio_channel_tls_create_watch(QIOChannel *ioc,
                                              GIOCondition condition)
 {
     QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
+    GSource *source = qio_channel_create_watch(tioc->master, condition);
+
+    if (condition & G_IO_IN) {
+        qio_channel_tls_read_watch(tioc, source);
+    }
 
-    return qio_channel_create_watch(tioc->master, condition);
+    return source;
 }
 
 QCryptoTLSSession *
-- 
2.38.1


