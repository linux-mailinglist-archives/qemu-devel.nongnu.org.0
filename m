Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6639A6982A8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:49:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLsP-00058J-2v; Wed, 15 Feb 2023 12:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSLsN-00055z-7r
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:47:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSLsL-0005Cr-KE
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:47:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676483244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=drAf2ZqbcEMpmG5RYs9TvH1b9uvNGa+eyhPOGwfB6JQ=;
 b=Fc97kRq45mw64Pm16RRWK401j5vIMlooxj6rayiPgvaBkWpv63bK/u2D4n3UG3u4nsZ9yu
 3fZJ+wWwyv1puBKOCkHrbJCyouDvpbG0hESACpDbrUl60Q2GuYU0NH9jzJc3Hu4SYUOJoN
 JLHGh3VWKEFlqezdz9ssXPS2AQSAH2c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-EWOO4m2DMke7sUzJ4M3M7A-1; Wed, 15 Feb 2023 12:47:20 -0500
X-MC-Unique: EWOO4m2DMke7sUzJ4M3M7A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0212285C713;
 Wed, 15 Feb 2023 17:47:20 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C4FD408573E;
 Wed, 15 Feb 2023 17:47:17 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, libvir-list@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Lieven <pl@kamp.de>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Antoine Damhet <antoine.damhet@shadow.tech>,
 Charles Frey <charles.frey@shadow.tech>
Subject: [PULL 2/5] io/channel-tls: fix handling of bigger read buffers
Date: Wed, 15 Feb 2023 17:47:09 +0000
Message-Id: <20230215174712.1894516-3-berrange@redhat.com>
In-Reply-To: <20230215174712.1894516-1-berrange@redhat.com>
References: <20230215174712.1894516-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 io/channel-tls.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/io/channel-tls.c b/io/channel-tls.c
index c730cb8ec5..8052945ba0 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -389,12 +389,76 @@ static void qio_channel_tls_set_aio_fd_handler(QIOChannel *ioc,
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
2.39.1


