Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF42142D4D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 15:24:13 +0100 (CET)
Received: from localhost ([::1]:37420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itXyN-00039T-Jj
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 09:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1itXuS-0006w3-9T
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:20:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1itXuN-00067Q-8b
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:20:08 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57376
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1itXuN-000672-3C
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:20:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579530002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8flyhkXLoCsZeDDZsYXxO6bV6yW30YvEOfS7dv3ykmM=;
 b=hZptksBF66OPG9J+SGdLohszoAOJw7yequex4b28cFxcj6mIq7s82NKf5QiAdpayS98wfE
 Am+lS3FZOHUxawSWx6q6v7kbyh1pZNhcC4XNPFewduwKSFyNHO6DsPzd1exTnbXwqWKMh5
 WJP0E4FCB82phMgQEVUe0q5cycmsDfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-no0HF7rzNqO9jahRDX-uIw-1; Mon, 20 Jan 2020 09:20:01 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31D03DB60;
 Mon, 20 Jan 2020 14:19:59 +0000 (UTC)
Received: from localhost (ovpn-117-223.ams2.redhat.com [10.36.117.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B6FA5D9D6;
 Mon, 20 Jan 2020 14:19:50 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/15] stubs: add stubs for io_uring interface
Date: Mon, 20 Jan 2020 14:18:48 +0000
Message-Id: <20200120141858.587874-6-stefanha@redhat.com>
In-Reply-To: <20200120141858.587874-1-stefanha@redhat.com>
References: <20200120141858.587874-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: no0HF7rzNqO9jahRDX-uIw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: oleksandr@redhat.com, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Julia Suvorova <jusual@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Follow linux-aio.o and stub out the block/io_uring.o APIs that will be
missing when a binary is linked with obj-util-y but without
block-util-y (e.g. vhost-user-gpu).

For example, the stubs are necessary so that a binary using util/async.o
from obj-util-y for qemu_bh_new() links successfully.  In this case
block/io_uring.o from block-util-y isn't needed and we can avoid
dragging in the block layer by linking the stubs instead.  The stub
functions never get called.

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Acked-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS         |  1 +
 stubs/Makefile.objs |  1 +
 stubs/io_uring.c    | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 stubs/io_uring.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 11fbf0bd12..ee21b3567a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2627,6 +2627,7 @@ M: Stefan Hajnoczi <stefanha@redhat.com>
 L: qemu-block@nongnu.org
 S: Maintained
 F: block/io_uring.c
+F: stubs/io_uring.c
=20
 qcow2
 M: Kevin Wolf <kwolf@redhat.com>
diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index 8b0ff25508..7afbe5fb61 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -13,6 +13,7 @@ stub-obj-y +=3D iothread.o
 stub-obj-y +=3D iothread-lock.o
 stub-obj-y +=3D is-daemonized.o
 stub-obj-$(CONFIG_LINUX_AIO) +=3D linux-aio.o
+stub-obj-$(CONFIG_LINUX_IO_URING) +=3D io_uring.o
 stub-obj-y +=3D machine-init-done.o
 stub-obj-y +=3D migr-blocker.o
 stub-obj-y +=3D change-state-handler.o
diff --git a/stubs/io_uring.c b/stubs/io_uring.c
new file mode 100644
index 0000000000..622d1e4648
--- /dev/null
+++ b/stubs/io_uring.c
@@ -0,0 +1,32 @@
+/*
+ * Linux io_uring support.
+ *
+ * Copyright (C) 2009 IBM, Corp.
+ * Copyright (C) 2009 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "block/aio.h"
+#include "block/raw-aio.h"
+
+void luring_detach_aio_context(LuringState *s, AioContext *old_context)
+{
+    abort();
+}
+
+void luring_attach_aio_context(LuringState *s, AioContext *new_context)
+{
+    abort();
+}
+
+LuringState *luring_init(Error **errp)
+{
+    abort();
+}
+
+void luring_cleanup(LuringState *s)
+{
+    abort();
+}
--=20
2.24.1


