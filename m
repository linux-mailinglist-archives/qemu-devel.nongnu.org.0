Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060953E072E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:07:06 +0200 (CEST)
Received: from localhost ([::1]:58998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLIH-0000i9-2a
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBJ9a-0000vw-Sg
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:50:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBJ9Y-0006Wu-Pc
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:49:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628092194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5eIj6utw+10uqzqEZ8tEFlEZN+cB3RuLY7qFxboABWg=;
 b=aJrW0+2WaZ/8PSoxh3OpN6nk5kFlSUfBaC+8BfiZtiozqMHebkPpJeyqfy0J5/VrtIk04d
 xyGXhlCMGP7mSb4q0KKBqAMzylm6IoDZd42z7Ulw3NAK7Jxzz4/EZvV9dBcFh1h2jMr3Cx
 Unk3uar3Iu39p2BhapqT2+KfXfv/pA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-nDWsNukOOku8BRR8jo_-rw-1; Wed, 04 Aug 2021 11:49:53 -0400
X-MC-Unique: nDWsNukOOku8BRR8jo_-rw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B872FEC1A0
 for <qemu-devel@nongnu.org>; Wed,  4 Aug 2021 15:49:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30B545F724;
 Wed,  4 Aug 2021 15:49:47 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/11] chardev: fix fd_chr_add_watch() when in != out
Date: Wed,  4 Aug 2021 19:48:43 +0400
Message-Id: <20210804154848.557328-7-marcandre.lureau@redhat.com>
In-Reply-To: <20210804154848.557328-1-marcandre.lureau@redhat.com>
References: <20210804154848.557328-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Create child sources for the different streams, and dispatch on the
parent source with the synthesized conditions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/char-fd.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/chardev/char-fd.c b/chardev/char-fd.c
index 1cd62f2779..743d3989b4 100644
--- a/chardev/char-fd.c
+++ b/chardev/char-fd.c
@@ -28,6 +28,7 @@
 #include "qemu/sockets.h"
 #include "qapi/error.h"
 #include "chardev/char.h"
+#include "chardev/char-fe.h"
 #include "io/channel-file.h"
 
 #include "chardev/char-fd.h"
@@ -80,10 +81,85 @@ static int fd_chr_read_poll(void *opaque)
     return s->max_size;
 }
 
+typedef struct FDSource {
+    GSource parent;
+
+    GIOCondition cond;
+} FDSource;
+
+static gboolean
+fd_source_prepare(GSource *source,
+                  gint *timeout_)
+{
+    FDSource *src = (FDSource *)source;
+
+    return src->cond != 0;
+}
+
+static gboolean
+fd_source_check(GSource *source)
+{
+    FDSource *src = (FDSource *)source;
+
+    return src->cond != 0;
+}
+
+static gboolean
+fd_source_dispatch(GSource *source, GSourceFunc callback,
+                   gpointer user_data)
+{
+    FDSource *src = (FDSource *)source;
+    FEWatchFunc func = (FEWatchFunc)callback;
+    gboolean ret = G_SOURCE_CONTINUE;
+
+    if (src->cond) {
+        ret = func(NULL, src->cond, user_data);
+        src->cond = 0;
+    }
+
+    return ret;
+}
+
+static GSourceFuncs fd_source_funcs = {
+  fd_source_prepare,
+  fd_source_check,
+  fd_source_dispatch,
+  NULL, NULL, NULL
+};
+
+static GSource *fd_source_new(FDChardev *chr)
+{
+    return g_source_new(&fd_source_funcs, sizeof(FDSource));
+}
+
+static gboolean child_func(GIOChannel *source,
+                           GIOCondition condition,
+                           gpointer data)
+{
+    FDSource *parent = data;
+
+    parent->cond |= condition;
+
+    return G_SOURCE_CONTINUE;
+}
+
 static GSource *fd_chr_add_watch(Chardev *chr, GIOCondition cond)
 {
     FDChardev *s = FD_CHARDEV(chr);
-    return qio_channel_create_watch(s->ioc_out, cond);
+    g_autoptr(GSource) source = fd_source_new(s);
+
+    if (s->ioc_out) {
+        g_autoptr(GSource) child = qio_channel_create_watch(s->ioc_out, cond & ~G_IO_IN);
+        g_source_set_callback(child, (GSourceFunc)child_func, source, NULL);
+        g_source_add_child_source(source, child);
+    }
+    if (s->ioc_in) {
+        g_autoptr(GSource) child = qio_channel_create_watch(s->ioc_in, cond & ~G_IO_OUT);
+        g_source_set_callback(child, (GSourceFunc)child_func, source, NULL);
+        g_source_add_child_source(source, child);
+    }
+
+    return g_steal_pointer(&source);
 }
 
 static void fd_chr_update_read_handler(Chardev *chr)
-- 
2.32.0.264.g75ae10bc75


