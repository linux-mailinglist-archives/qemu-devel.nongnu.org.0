Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5C959CB94
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:38:34 +0200 (CEST)
Received: from localhost ([::1]:57490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQG41-0004fv-L8
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQFqR-0001cS-7z
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:24:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQFqP-0004ak-CJ
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661207068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIPckBZmpoTVp+wpt7nwKoBLlGmerjHyTkZtDj8xxYg=;
 b=fHee9gQYBRpgfRkevBJFZ+/5q7UIUS76xvX85wXDtxVQzZJcRFcPCB2ETn2aVkkY6tAwu2
 o4FeFXyugmK+gm9Rn9rp964ZwlnEgxz1pgE2WXooKYk9dnmk0YPGssDdROJM7jCaQfwx17
 hpfNOb9u9PXzs8DCrkX2EntNmR4Yejg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-WfKUbgyjO9SbhBY2zkQISQ-1; Mon, 22 Aug 2022 18:24:25 -0400
X-MC-Unique: WfKUbgyjO9SbhBY2zkQISQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E221811E84;
 Mon, 22 Aug 2022 22:24:24 +0000 (UTC)
Received: from localhost (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 855C1492C3B;
 Mon, 22 Aug 2022 22:24:23 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Peter Xu <peterx@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, integration@gluster.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, sgarzare@redhat.com,
 Alberto Faria <afaria@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, Xie Changlong <xiechanglong.d@gmail.com>
Subject: [RFC v4 07/11] block: add BlockRAMRegistrar
Date: Mon, 22 Aug 2022 18:23:58 -0400
Message-Id: <20220822222402.176088-8-stefanha@redhat.com>
In-Reply-To: <20220822222402.176088-1-stefanha@redhat.com>
References: <20220822222402.176088-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Emulated devices and other BlockBackend users wishing to take advantage
of blk_register_buf() all have the same repetitive job: register
RAMBlocks with the BlockBackend using RAMBlockNotifier.

Add a BlockRAMRegistrar API to do this. A later commit will use this
from hw/block/virtio-blk.c.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS                          |  1 +
 include/sysemu/block-ram-registrar.h | 37 +++++++++++++++++++
 block/block-ram-registrar.c          | 54 ++++++++++++++++++++++++++++
 block/meson.build                    |  1 +
 4 files changed, 93 insertions(+)
 create mode 100644 include/sysemu/block-ram-registrar.h
 create mode 100644 block/block-ram-registrar.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f8ccd5954c..a3f74ab42a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2491,6 +2491,7 @@ F: block*
 F: block/
 F: hw/block/
 F: include/block/
+F: include/sysemu/block-*.h
 F: qemu-img*
 F: docs/tools/qemu-img.rst
 F: qemu-io*
diff --git a/include/sysemu/block-ram-registrar.h b/include/sysemu/block-ram-registrar.h
new file mode 100644
index 0000000000..d8b2f7942b
--- /dev/null
+++ b/include/sysemu/block-ram-registrar.h
@@ -0,0 +1,37 @@
+/*
+ * BlockBackend RAM Registrar
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef BLOCK_RAM_REGISTRAR_H
+#define BLOCK_RAM_REGISTRAR_H
+
+#include "exec/ramlist.h"
+
+/**
+ * struct BlockRAMRegistrar:
+ *
+ * Keeps RAMBlock memory registered with a BlockBackend using
+ * blk_register_buf() including hotplugged memory.
+ *
+ * Emulated devices or other BlockBackend users initialize a BlockRAMRegistrar
+ * with blk_ram_registrar_init() before submitting I/O requests with the
+ * BDRV_REQ_REGISTERED_BUF flag set.
+ */
+typedef struct {
+    BlockBackend *blk;
+    RAMBlockNotifier notifier;
+    bool ok;
+} BlockRAMRegistrar;
+
+void blk_ram_registrar_init(BlockRAMRegistrar *r, BlockBackend *blk);
+void blk_ram_registrar_destroy(BlockRAMRegistrar *r);
+
+/* Have all RAMBlocks been registered successfully? */
+static inline bool blk_ram_registrar_ok(BlockRAMRegistrar *r)
+{
+    return r->ok;
+}
+
+#endif /* BLOCK_RAM_REGISTRAR_H */
diff --git a/block/block-ram-registrar.c b/block/block-ram-registrar.c
new file mode 100644
index 0000000000..32935006c1
--- /dev/null
+++ b/block/block-ram-registrar.c
@@ -0,0 +1,54 @@
+/*
+ * BlockBackend RAM Registrar
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/block-ram-registrar.h"
+#include "qapi/error.h"
+
+static void ram_block_added(RAMBlockNotifier *n, void *host, size_t size,
+                            size_t max_size)
+{
+    BlockRAMRegistrar *r = container_of(n, BlockRAMRegistrar, notifier);
+    Error *err = NULL;
+
+    if (!blk_register_buf(r->blk, host, max_size, &err)) {
+        error_report_err(err);
+        ram_block_notifier_remove(&r->notifier);
+        r->ok = false;
+    }
+}
+
+static void ram_block_removed(RAMBlockNotifier *n, void *host, size_t size,
+                              size_t max_size)
+{
+    BlockRAMRegistrar *r = container_of(n, BlockRAMRegistrar, notifier);
+    blk_unregister_buf(r->blk, host, max_size);
+}
+
+void blk_ram_registrar_init(BlockRAMRegistrar *r, BlockBackend *blk)
+{
+    r->blk = blk;
+    r->notifier = (RAMBlockNotifier){
+        .ram_block_added = ram_block_added,
+        .ram_block_removed = ram_block_removed,
+
+        /*
+         * .ram_block_resized() is not necessary because we use the max_size
+         * value that does not change across resize.
+         */
+    };
+    r->ok = true;
+
+    ram_block_notifier_add(&r->notifier);
+}
+
+void blk_ram_registrar_destroy(BlockRAMRegistrar *r)
+{
+    if (r->ok) {
+        ram_block_notifier_remove(&r->notifier);
+    }
+}
diff --git a/block/meson.build b/block/meson.build
index 500878f082..b7c68b83a3 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -46,6 +46,7 @@ block_ss.add(files(
 ), zstd, zlib, gnutls)
 
 softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('blkreplay.c'))
+softmmu_ss.add(files('block-ram-registrar.c'))
 
 if get_option('qcow1').allowed()
   block_ss.add(files('qcow.c'))
-- 
2.37.2


