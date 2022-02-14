Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726D04B40A1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 05:11:21 +0100 (CET)
Received: from localhost ([::1]:50462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJShs-0005Yv-9n
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 23:11:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJSXg-0006ZV-TW
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 23:00:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJSXe-0000AF-Ot
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 23:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644811246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k1NJAYuxbBU0g4T+irextBwXVyFw4TEr/n6y5h1xTD4=;
 b=BlJtDM6rbkZ6WhMpIrmxsyzdavVZj50OKRBYPEnSztU0J/TJfdSWjX+k7ec53AzfRBnHBM
 GDOBrFkhfOVJ00OcE2kHGWUKqe0gX2AYgYfoskiHLjU3SGfxsfPZjkAEeg7/lZWn7RUDK+
 IeilDWf8QWV46hUkpx3jAdKjCtDrhMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-FSIoZ-IzNhihwM4Pa8LbNA-1; Sun, 13 Feb 2022 23:00:45 -0500
X-MC-Unique: FSIoZ-IzNhihwM4Pa8LbNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBF4718397BE;
 Mon, 14 Feb 2022 04:00:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-241.pek2.redhat.com
 [10.72.13.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7359610A6;
 Mon, 14 Feb 2022 04:00:41 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 6/8] net/filter: Optimize filter_send to coroutine
Date: Mon, 14 Feb 2022 11:59:55 +0800
Message-Id: <20220214035957.71339-7-jasowang@redhat.com>
In-Reply-To: <20220214035957.71339-1-jasowang@redhat.com>
References: <20220214035957.71339-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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
Cc: Jason Wang <jasowang@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Rao Lei <lei.rao@intel.com>, qemu-devel@nongnu.org,
 Li Zhijian <lizhijian@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rao Lei <lei.rao@intel.com>

This patch is to improve the logic of QEMU main thread sleep code in
qemu_chr_write_buffer() where it can be blocked and can't run other
coroutines during COLO IO stress test.

Our approach is to put filter_send() in a coroutine. In this way,
filter_send() will call qemu_coroutine_yield() in qemu_co_sleep_ns(),
so that it can be scheduled out and QEMU main thread has opportunity to
run other tasks.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/filter-mirror.c | 66 ++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 53 insertions(+), 13 deletions(-)

diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index f20240c..34a63b5 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -20,6 +20,7 @@
 #include "chardev/char-fe.h"
 #include "qemu/iov.h"
 #include "qemu/sockets.h"
+#include "block/aio-wait.h"
 
 #define TYPE_FILTER_MIRROR "filter-mirror"
 typedef struct MirrorState MirrorState;
@@ -42,20 +43,21 @@ struct MirrorState {
     bool vnet_hdr;
 };
 
-static int filter_send(MirrorState *s,
-                       const struct iovec *iov,
-                       int iovcnt)
+typedef struct FilterSendCo {
+    MirrorState *s;
+    char *buf;
+    ssize_t size;
+    bool done;
+    int ret;
+} FilterSendCo;
+
+static int _filter_send(MirrorState *s,
+                       char *buf,
+                       ssize_t size)
 {
     NetFilterState *nf = NETFILTER(s);
     int ret = 0;
-    ssize_t size = 0;
     uint32_t len = 0;
-    char *buf;
-
-    size = iov_size(iov, iovcnt);
-    if (!size) {
-        return 0;
-    }
 
     len = htonl(size);
     ret = qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)&len, sizeof(len));
@@ -80,10 +82,7 @@ static int filter_send(MirrorState *s,
         }
     }
 
-    buf = g_malloc(size);
-    iov_to_buf(iov, iovcnt, 0, buf, size);
     ret = qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)buf, size);
-    g_free(buf);
     if (ret != size) {
         goto err;
     }
@@ -94,6 +93,47 @@ err:
     return ret < 0 ? ret : -EIO;
 }
 
+static void coroutine_fn filter_send_co(void *opaque)
+{
+    FilterSendCo *data = opaque;
+
+    data->ret = _filter_send(data->s, data->buf, data->size);
+    data->done = true;
+    g_free(data->buf);
+    aio_wait_kick();
+}
+
+static int filter_send(MirrorState *s,
+                       const struct iovec *iov,
+                       int iovcnt)
+{
+    ssize_t size = iov_size(iov, iovcnt);
+    char *buf = NULL;
+
+    if (!size) {
+        return 0;
+    }
+
+    buf = g_malloc(size);
+    iov_to_buf(iov, iovcnt, 0, buf, size);
+
+    FilterSendCo data = {
+        .s = s,
+        .size = size,
+        .buf = buf,
+        .ret = 0,
+    };
+
+    Coroutine *co = qemu_coroutine_create(filter_send_co, &data);
+    qemu_coroutine_enter(co);
+
+    while (!data.done) {
+        aio_poll(qemu_get_aio_context(), true);
+    }
+
+    return data.ret;
+}
+
 static void redirector_to_filter(NetFilterState *nf,
                                  const uint8_t *buf,
                                  int len)
-- 
2.7.4


