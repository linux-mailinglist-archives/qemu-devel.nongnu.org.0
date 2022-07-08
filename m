Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD9456B156
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 06:24:40 +0200 (CEST)
Received: from localhost ([::1]:34066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9fXj-0002AW-SN
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 00:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9fSr-0003gU-3b
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 00:19:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9fSp-0000MT-C8
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 00:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657253973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+uLPCMNUisDw58MHbGAjYx3doQt6Uk+rRiNr5fVsqg=;
 b=aUNnp7ZhKq1akkfympnd+14oxO7TQ+1rwOXUuhDb0BubiJN3FI/ZrSaETMvIQUgQlEYjid
 OTTlxfcR7hGOAT/wuy4nGs8PjII6WcRpCMvqoaY/ulUqSBHURA2cV5Jcb4a42DHx971XgA
 JW0JIcesQnj+4kejL75TY/UKZCLZqFM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-fd1yKlhINxOjZUUlXw_NQg-1; Fri, 08 Jul 2022 00:19:31 -0400
X-MC-Unique: fd1yKlhINxOjZUUlXw_NQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10EE1181E06C;
 Fri,  8 Jul 2022 04:19:31 +0000 (UTC)
Received: from localhost (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C8F52026D64;
 Fri,  8 Jul 2022 04:19:30 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alberto Faria <afaria@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [RFC v3 5/8] block: add BlockRAMRegistrar
Date: Fri,  8 Jul 2022 05:17:34 +0100
Message-Id: <20220708041737.1768521-6-stefanha@redhat.com>
In-Reply-To: <20220708041737.1768521-1-stefanha@redhat.com>
References: <20220708041737.1768521-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

Emulated devices and other BlockBackend users wishing to take advantage
of blk_register_buf() all have the same repetitive job: register
RAMBlocks with the BlockBackend using RAMBlockNotifier.

Add a BlockRAMRegistrar API to do this. A later commit will use this
from hw/block/virtio-blk.c.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS                          |  1 +
 include/sysemu/block-ram-registrar.h | 30 +++++++++++++++++++++
 block/block-ram-registrar.c          | 39 ++++++++++++++++++++++++++++
 block/meson.build                    |  1 +
 4 files changed, 71 insertions(+)
 create mode 100644 include/sysemu/block-ram-registrar.h
 create mode 100644 block/block-ram-registrar.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 50f340d9ee..d16189449f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2490,6 +2490,7 @@ F: block*
 F: block/
 F: hw/block/
 F: include/block/
+F: include/sysemu/block-*.h
 F: qemu-img*
 F: docs/tools/qemu-img.rst
 F: qemu-io*
diff --git a/include/sysemu/block-ram-registrar.h b/include/sysemu/block-ram-registrar.h
new file mode 100644
index 0000000000..09d63f64b2
--- /dev/null
+++ b/include/sysemu/block-ram-registrar.h
@@ -0,0 +1,30 @@
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
+ * BLK_REQ_REGISTERED_BUF flag set.
+ */
+typedef struct {
+    BlockBackend *blk;
+    RAMBlockNotifier notifier;
+} BlockRAMRegistrar;
+
+void blk_ram_registrar_init(BlockRAMRegistrar *r, BlockBackend *blk);
+void blk_ram_registrar_destroy(BlockRAMRegistrar *r);
+
+#endif /* BLOCK_RAM_REGISTRAR_H */
diff --git a/block/block-ram-registrar.c b/block/block-ram-registrar.c
new file mode 100644
index 0000000000..32a14b69ae
--- /dev/null
+++ b/block/block-ram-registrar.c
@@ -0,0 +1,39 @@
+/*
+ * BlockBackend RAM Registrar
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/block-ram-registrar.h"
+
+static void ram_block_added(RAMBlockNotifier *n, void *host, size_t size,
+                            size_t max_size)
+{
+    BlockRAMRegistrar *r = container_of(n, BlockRAMRegistrar, notifier);
+    blk_register_buf(r->blk, host, max_size);
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
+    };
+
+    ram_block_notifier_add(&r->notifier);
+}
+
+void blk_ram_registrar_destroy(BlockRAMRegistrar *r)
+{
+    ram_block_notifier_remove(&r->notifier);
+}
diff --git a/block/meson.build b/block/meson.build
index 787667384a..b315593054 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -46,6 +46,7 @@ block_ss.add(files(
 ), zstd, zlib, gnutls)
 
 softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('blkreplay.c'))
+softmmu_ss.add(files('block-ram-registrar.c'))
 
 if get_option('qcow1').allowed()
   block_ss.add(files('qcow.c'))
-- 
2.36.1


