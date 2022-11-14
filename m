Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD149628D3A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:14:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouidw-0001y3-Po; Mon, 14 Nov 2022 18:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidm-0001df-Aj
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJP-00037V-Cy
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCUt/O3CrxGt8AYzN+fJa4btlP/Hy09Ns1XAwz9bEQg=;
 b=Hg5bxphW3PtokJ3wV5UnbVXbV+0olVSuQ0r7CP3hVQy5/yz/wGo/jT/JrLR9dQmSXW1TXx
 cmFCWByhh5WbFHU1D+41Jt7qrYBMl9EjJVTmH51p7iwrd+xE4ND9/PKEWfqhrQNjZymKhH
 vmUsFABQ8RDyv6ffcYu9M/EUmvzJ+Mc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-2WADOspJPHOgnCajqkSLzw-1; Mon, 14 Nov 2022 17:52:13 -0500
X-MC-Unique: 2WADOspJPHOgnCajqkSLzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C47F1C08982;
 Mon, 14 Nov 2022 22:52:13 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCE4540E9789;
 Mon, 14 Nov 2022 22:52:12 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 20/23] interop: Add test of 64-bit block status
Date: Mon, 14 Nov 2022 16:51:55 -0600
Message-Id: <20221114225158.2186742-21-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

Prove that we can round-trip a block status request larger than 4G
through a new-enough qemu-nbd.  Also serves as a unit test of our shim
for converting internal 64-bit representation back to the older 32-bit
nbd_block_status callback interface.
---
 interop/Makefile.am     |   6 ++
 interop/large-status.c  | 186 ++++++++++++++++++++++++++++++++++++++++
 interop/large-status.sh |  49 +++++++++++
 .gitignore              |   1 +
 4 files changed, 242 insertions(+)
 create mode 100644 interop/large-status.c
 create mode 100755 interop/large-status.sh

diff --git a/interop/Makefile.am b/interop/Makefile.am
index 5e0ea1ed..84c8fbbb 100644
--- a/interop/Makefile.am
+++ b/interop/Makefile.am
@@ -21,6 +21,7 @@ EXTRA_DIST = \
 	dirty-bitmap.sh \
 	interop-qemu-storage-daemon.sh \
 	interop-qemu-block-size.sh \
+	large-status.sh \
 	list-exports-nbd-config \
 	list-exports-test-dir/disk1 \
 	list-exports-test-dir/disk2 \
@@ -134,6 +135,7 @@ check_PROGRAMS += \
 	list-exports-qemu-nbd \
 	socket-activation-qemu-nbd \
 	dirty-bitmap \
+	large-status \
 	structured-read \
 	opt-extended-headers \
 	$(NULL)
@@ -144,6 +146,7 @@ TESTS += \
 	list-exports-qemu-nbd \
 	socket-activation-qemu-nbd \
 	dirty-bitmap.sh \
+	large-status.sh \
 	structured-read.sh \
 	interop-qemu-block-size.sh \
 	opt-extended-headers.sh \
@@ -235,6 +238,9 @@ socket_activation_qemu_nbd_LDADD = $(top_builddir)/lib/libnbd.la
 dirty_bitmap_SOURCES = dirty-bitmap.c
 dirty_bitmap_LDADD = $(top_builddir)/lib/libnbd.la

+large_status_SOURCES = large-status.c
+large_status_LDADD = $(top_builddir)/lib/libnbd.la
+
 structured_read_SOURCES = structured-read.c
 structured_read_LDADD = $(top_builddir)/lib/libnbd.la

diff --git a/interop/large-status.c b/interop/large-status.c
new file mode 100644
index 00000000..44a911d7
--- /dev/null
+++ b/interop/large-status.c
@@ -0,0 +1,186 @@
+/* NBD client library in userspace
+ * Copyright (C) 2013-2022 Red Hat Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+/* Test 64-bit block status with qemu. */
+
+#include <config.h>
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <assert.h>
+#include <stdbool.h>
+#include <errno.h>
+
+#include <libnbd.h>
+
+static const char *bitmap;
+
+struct data {
+  bool req_one;    /* input: true if req_one was passed to request */
+  int count;       /* input: count of expected remaining calls */
+  bool seen_base;  /* output: true if base:allocation encountered */
+  bool seen_dirty; /* output: true if qemu:dirty-bitmap encountered */
+};
+
+static int
+cb32 (void *opaque, const char *metacontext, uint64_t offset,
+      uint32_t *entries, size_t len, int *error)
+{
+  struct data *data = opaque;
+
+  assert (offset == 0);
+  assert (data->count-- > 0);
+
+  if (strcmp (metacontext, LIBNBD_CONTEXT_BASE_ALLOCATION) == 0) {
+    assert (!data->seen_base);
+    data->seen_base = true;
+
+    /* Data block offset 0 size 64k, remainder is hole */
+    assert (len == 4);
+    assert (entries[0] == 65536);
+    assert (entries[1] == 0);
+    /* libnbd had to truncate qemu's >4G answer */
+    assert (entries[2] == 4227858432);
+    assert (entries[3] == (LIBNBD_STATE_HOLE|LIBNBD_STATE_ZERO));
+  }
+  else if (strcmp (metacontext, bitmap) == 0) {
+    assert (!data->seen_dirty);
+    data->seen_dirty = true;
+
+    /* Dirty block at offset 5G-64k, remainder is clean */
+    /* libnbd had to truncate qemu's >4G answer */
+    assert (len == 2);
+    assert (entries[0] == 4227858432);
+    assert (entries[1] == 0);
+  }
+  else {
+    fprintf (stderr, "unexpected context %s\n", metacontext);
+    exit (EXIT_FAILURE);
+  }
+  return 0;
+}
+
+static int
+cb64 (void *opaque, const char *metacontext, uint64_t offset,
+      nbd_extent *entries, size_t len, int *error)
+{
+  struct data *data = opaque;
+
+  assert (offset == 0);
+  assert (data->count-- > 0);
+
+  if (strcmp (metacontext, LIBNBD_CONTEXT_BASE_ALLOCATION) == 0) {
+    assert (!data->seen_base);
+    data->seen_base = true;
+
+    /* Data block offset 0 size 64k, remainder is hole */
+    assert (len == 2);
+    assert (entries[0].length == 65536);
+    assert (entries[0].flags == 0);
+    assert (entries[1].length == 5368643584ULL);
+    assert (entries[1].flags == (LIBNBD_STATE_HOLE|LIBNBD_STATE_ZERO));
+  }
+  else if (strcmp (metacontext, bitmap) == 0) {
+    assert (!data->seen_dirty);
+    data->seen_dirty = true;
+
+    /* Dirty block at offset 5G-64k, remainder is clean */
+    assert (len == 2);
+    assert (entries[0].length == 5368643584ULL);
+    assert (entries[0].flags == 0);
+    assert (entries[1].length == 65536);
+    assert (entries[1].flags == 1);
+  }
+  else {
+    fprintf (stderr, "unexpected context %s\n", metacontext);
+    exit (EXIT_FAILURE);
+  }
+  return 0;
+}
+
+int
+main (int argc, char *argv[])
+{
+  struct nbd_handle *nbd;
+  int64_t exportsize;
+  struct data data;
+
+  if (argc < 3) {
+    fprintf (stderr, "%s bitmap qemu-nbd [args ...]\n", argv[0]);
+    exit (EXIT_FAILURE);
+  }
+  bitmap = argv[1];
+
+  nbd = nbd_create ();
+  if (nbd == NULL) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  nbd_add_meta_context (nbd, LIBNBD_CONTEXT_BASE_ALLOCATION);
+  nbd_add_meta_context (nbd, bitmap);
+
+  if (nbd_connect_systemd_socket_activation (nbd, &argv[2]) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  exportsize = nbd_get_size (nbd);
+  if (exportsize == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  if (nbd_get_extended_headers_negotiated (nbd) != 1) {
+    fprintf (stderr, "skipping: qemu-nbd lacks extended headers\n");
+    exit (77);
+  }
+
+  /* Prove that we can round-trip a >4G block status request */
+  data = (struct data) { .count = 2, };
+  if (nbd_block_status_64 (nbd, exportsize, 0,
+                           (nbd_extent64_callback) { .callback = cb64,
+                             .user_data = &data },
+                           0) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+  assert (data.seen_base && data.seen_dirty);
+
+  /* Check libnbd's handling of a >4G response through older interface  */
+  data = (struct data) { .count = 2, };
+  if (nbd_block_status (nbd, exportsize, 0,
+                        (nbd_extent_callback) { .callback = cb32,
+                          .user_data = &data },
+                        0) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+  assert (data.seen_base && data.seen_dirty);
+
+  if (nbd_shutdown (nbd, 0) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  nbd_close (nbd);
+
+  exit (EXIT_SUCCESS);
+}
diff --git a/interop/large-status.sh b/interop/large-status.sh
new file mode 100755
index 00000000..86271a41
--- /dev/null
+++ b/interop/large-status.sh
@@ -0,0 +1,49 @@
+#!/usr/bin/env bash
+# nbd client library in userspace
+# Copyright (C) 2019-2022 Red Hat Inc.
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, write to the Free Software
+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+
+# Test reading qemu dirty-bitmap.
+
+source ../tests/functions.sh
+set -e
+set -x
+
+requires qemu-img bitmap --help
+requires qemu-nbd --version
+
+# This test uses the qemu-nbd -B option.
+if ! qemu-nbd --help | grep -sq -- -B; then
+    echo "$0: skipping because qemu-nbd does not support the -B option"
+    exit 77
+fi
+
+files="large-status.qcow2"
+rm -f $files
+cleanup_fn rm -f $files
+
+# Create mostly-sparse file with intentionally different data vs. dirty areas
+# (64k data, 5G-64k hole,zero; 5G-64k clean, 64k dirty)
+qemu-img create -f qcow2 large-status.qcow2 5G
+qemu-img bitmap --add --enable -f qcow2 large-status.qcow2 bitmap0
+qemu-io -f qcow2 -c "w -z $((5*1024*1024*1024 - 64*1024)) 64k" \
+        large-status.qcow2
+qemu-img bitmap --disable -f qcow2 large-status.qcow2 bitmap0
+qemu-io -f qcow2 -c 'w 0 64k' large-status.qcow2
+
+# Run the test.
+$VG ./large-status qemu:dirty-bitmap:bitmap0 \
+    qemu-nbd -f qcow2 -B bitmap0 large-status.qcow2
diff --git a/.gitignore b/.gitignore
index 35e65335..67bcee58 100644
--- a/.gitignore
+++ b/.gitignore
@@ -109,6 +109,7 @@ Makefile.in
 /interop/interop-qemu-nbd
 /interop/interop-qemu-nbd-tls-certs
 /interop/interop-qemu-nbd-tls-psk
+/interop/large-status
 /interop/list-exports-nbd-server
 /interop/list-exports-nbdkit
 /interop/list-exports-qemu-nbd
-- 
2.38.1


