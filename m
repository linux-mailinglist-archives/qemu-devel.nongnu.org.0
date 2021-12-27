Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F3B47F9A2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 02:23:08 +0100 (CET)
Received: from localhost ([::1]:59490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1ejC-0002NU-Ed
	for lists+qemu-devel@lfdr.de; Sun, 26 Dec 2021 20:23:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1n1eh7-0001fa-Dv
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 20:20:57 -0500
Received: from mga14.intel.com ([192.55.52.115]:30323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1n1eh3-0001N2-TJ
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 20:20:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640568053; x=1672104053;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wTuL7RbPAYnr1ELlXpXsmL1orpxxXXivnFwXFV7IUZc=;
 b=WLAzztOfKOWfSEtoTPs6GU1jgFD3V0jdU5ls/fMJDlcjxKxofUj9PJnb
 3RrT2n+DhmNLP7AjyAk8KVy42Ki5bDchQGmUUAbn0j60+8eAO+n15/cLE
 1eU4/lkUsCm5Kz8+b4AEBrds0gt5gr7iQZQfhcqODqhd41QpbZ+RmXPOE
 X2tPHkF7FQCasbnIEuH3nX0Qh5tanM4Sd+ewTF4nkfPWz7QHd3kfJ3NSy
 C5FDoKWSh6WHTih56u2VbmO6eN5ed//Le23GhHR7PqHi26EE4TB7sFeeU
 3YTSrPk4CS5qQ3K6yXUWzUj7mD6FTQf/Jmn4kfp6B4kxf5/JATHbDW/kh Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="241363985"
X-IronPort-AV: E=Sophos;i="5.88,238,1635231600"; d="scan'208";a="241363985"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2021 17:20:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,238,1635231600"; d="scan'208";a="686137631"
Received: from unknown (HELO leirao-pc.bj.intel.com) ([10.238.156.139])
 by orsmga005.jf.intel.com with ESMTP; 26 Dec 2021 17:20:45 -0800
From: Rao Lei <lei.rao@intel.com>
To: chen.zhang@intel.com,
	lizhijian@cn.fujitsu.com,
	jasowang@redhat.com
Subject: [PATCH v2] net/filter: Optimize filter_send to coroutine
Date: Mon, 27 Dec 2021 09:20:28 +0800
Message-Id: <20211227012028.545526-1-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=lei.rao@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Rao Lei <lei.rao@intel.com>, qemu-devel@nongnu.org,
 Li Zhijian <lizhijian@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 net/filter-mirror.c | 66 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 53 insertions(+), 13 deletions(-)

diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index f20240cc9f..34a63b5dbb 100644
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
2.32.0


