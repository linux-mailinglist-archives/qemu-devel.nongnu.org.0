Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599064EF3D7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:28:08 +0200 (CEST)
Received: from localhost ([::1]:53004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naJC3-0000TX-BS
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:28:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naJ7h-000174-8b
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:23:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naJ7f-0000rL-Nt
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648826615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ddT7acmFZ86vqC/RzoUPKTSfDmWDhQhw4L4L5BvQtMQ=;
 b=Fb98RTgIC04JRgxgfYbUrvsBkeYmCAVAQJbk4uHEHMEFhHA08imHmW/BJblh+TdFhYic10
 CJFdlCxaSWmND+ZiyygE6vIfPehymH6lmAxjARLKddhHB6JxayAbzOPtmz3zv7rFKcrdBQ
 JgDKgcZ4ZWrWtMu6Xe7zPjF8rtf4aYA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-n7yltNsgN0exjOo-FW_NeA-1; Fri, 01 Apr 2022 11:23:34 -0400
X-MC-Unique: n7yltNsgN0exjOo-FW_NeA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBB80185A79C;
 Fri,  1 Apr 2022 15:23:33 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A138D2166B4E;
 Fri,  1 Apr 2022 15:23:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] 9p: move P9_XATTR_SIZE_MAX from 9p.h to 9p.c
Date: Fri,  1 Apr 2022 17:23:22 +0200
Message-Id: <20220401152323.52519-6-thuth@redhat.com>
In-Reply-To: <20220401152323.52519-1-thuth@redhat.com>
References: <20220401152323.52519-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: application/octet-stream; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, BODY_EMPTY=1.31,
 DKIMWL_WL_HIGH=-0.082, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Will Cohen <wwcohen@gmail.com>

The patch set adding 9p functionality to darwin introduced an issue
where limits.h, which defines XATTR_SIZE_MAX, is included in 9p.c,
though the referenced constant is needed in 9p.h. This commit fixes that
issue by moving the definition of P9_XATTR_SIZE_MAX, which uses
XATTR_SIZE_MAX, to also be in 9p.c.

Additionally, this commit moves the location of the system headers
include in 9p.c to occur before the project headers (except osdep.h).

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/950
Fixes: 38d7fd68b0 ("9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX")
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Message-Id: <20220331182651.887-1-wwcohen@gmail.com>
[thuth: Adjusted placement of osdep.h]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/9pfs/9p.h | 18 ------------------
 hw/9pfs/9p.c | 28 +++++++++++++++++++++++-----
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index af2635fae9..994f952600 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -479,22 +479,4 @@ struct V9fsTransport {
     void        (*push_and_notify)(V9fsPDU *pdu);
 };
 
-#if defined(XATTR_SIZE_MAX)
-/* Linux */
-#define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
-#elif defined(CONFIG_DARWIN)
-/*
- * Darwin doesn't seem to define a maximum xattr size in its user
- * space header, so manually configure it across platforms as 64k.
- *
- * Having no limit at all can lead to QEMU crashing during large g_malloc()
- * calls. Because QEMU does not currently support macOS guests, the below
- * preliminary solution only works due to its being a reflection of the limit of
- * Linux guests.
- */
-#define P9_XATTR_SIZE_MAX 65536
-#else
-#error Missing definition for P9_XATTR_SIZE_MAX for this host system
-#endif
-
 #endif
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index dcaa602d4c..225f31fc31 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -17,6 +17,11 @@
  */
 
 #include "qemu/osdep.h"
+#ifdef CONFIG_LINUX
+#include <linux/limits.h>
+#else
+#include <limits.h>
+#endif
 #include <glib/gprintf.h>
 #include "hw/virtio/virtio.h"
 #include "qapi/error.h"
@@ -33,11 +38,6 @@
 #include "migration/blocker.h"
 #include "qemu/xxhash.h"
 #include <math.h>
-#ifdef CONFIG_LINUX
-#include <linux/limits.h>
-#else
-#include <limits.h>
-#endif
 
 int open_fd_hw;
 int total_open_fd;
@@ -3925,6 +3925,24 @@ out_nofid:
     v9fs_string_free(&name);
 }
 
+#if defined(CONFIG_LINUX)
+/* Currently, only Linux has XATTR_SIZE_MAX */
+#define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
+#elif defined(CONFIG_DARWIN)
+/*
+ * Darwin doesn't seem to define a maximum xattr size in its user
+ * space header, so manually configure it across platforms as 64k.
+ *
+ * Having no limit at all can lead to QEMU crashing during large g_malloc()
+ * calls. Because QEMU does not currently support macOS guests, the below
+ * preliminary solution only works due to its being a reflection of the limit of
+ * Linux guests.
+ */
+#define P9_XATTR_SIZE_MAX 65536
+#else
+#error Missing definition for P9_XATTR_SIZE_MAX for this host system
+#endif
+
 static void coroutine_fn v9fs_xattrcreate(void *opaque)
 {
     int flags, rflags = 0;
-- 
2.27.0


