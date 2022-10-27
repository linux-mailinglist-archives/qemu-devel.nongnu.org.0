Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6043610049
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:34:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7hJ-0002kj-PC; Thu, 27 Oct 2022 14:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gH-0001eF-Kh
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7g4-0002QH-AI
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bce3IqU54MwdZqgbgFQ2OZPjNcu1TW2aSnuUqBmNH0A=;
 b=FTCWBhuXHIjTZWK5L0ieTV9tjmOl0OfmKGqUsJWA/QLuBd867ImRiXC1Ql/DnoF9dZu7/H
 c0SsQH0yTONTFsNMfPRlw0MEuYBv5Wg2v6MYBeJ1OSu+iJctw3ybBZW8+alO0B/zzQFtdN
 n9JM8VyTzXUwbYy66oQYhobrVNwnAaw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-AoToc02KMvWdPuYiZQAnVQ-1; Thu, 27 Oct 2022 14:32:26 -0400
X-MC-Unique: AoToc02KMvWdPuYiZQAnVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5822C3C0F68C;
 Thu, 27 Oct 2022 18:32:15 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2AB8112C063;
 Thu, 27 Oct 2022 18:32:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 06/58] block/io_uring: revert "Use io_uring_register_ring_fd()
 to skip fd operations"
Date: Thu, 27 Oct 2022 20:30:54 +0200
Message-Id: <20221027183146.463129-7-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Sam Li <faithilikerun@gmail.com>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1193

The commit "Use io_uring_register_ring_fd() to skip fd operations" broke
when booting a guest with iothread and io_uring. That is because the
io_uring_register_ring_fd() call is made from the main thread instead of
IOThread where io_uring_submit() is called. It can not be guaranteed
to register the ring fd in the correct thread or unregister the same ring
fd if the IOThread is disabled. This optimization is not critical so we
will revert previous commit.

This reverts commit e2848bc574fe2715c694bf8fe9a1ba7f78a1125a
and 77e3f038af1764983087e3551a0fde9951952c4d.

Cc: qemu-stable@nongnu.org
Signed-off-by: Sam Li <faithilikerun@gmail.com>
Message-Id: <20220924144815.5591-1-faithilikerun@gmail.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Tested-by: Dario Faggioli <dfaggioli@suse.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io_uring.c | 13 +------------
 meson.build      |  1 -
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index a1760152e0..973e15d876 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -11,7 +11,6 @@
 #include "qemu/osdep.h"
 #include <liburing.h>
 #include "block/aio.h"
-#include "qemu/error-report.h"
 #include "qemu/queue.h"
 #include "block/block.h"
 #include "block/raw-aio.h"
@@ -19,7 +18,6 @@
 #include "qapi/error.h"
 #include "trace.h"
 
-
 /* io_uring ring size */
 #define MAX_ENTRIES 128
 
@@ -432,17 +430,8 @@ LuringState *luring_init(Error **errp)
     }
 
     ioq_init(&s->io_q);
-#ifdef CONFIG_LIBURING_REGISTER_RING_FD
-    if (io_uring_register_ring_fd(&s->ring) < 0) {
-        /*
-         * Only warn about this error: we will fallback to the non-optimized
-         * io_uring operations.
-         */
-        warn_report("failed to register linux io_uring ring file descriptor");
-    }
-#endif
-
     return s;
+
 }
 
 void luring_cleanup(LuringState *s)
diff --git a/meson.build b/meson.build
index b686dfef75..44c1f92697 100644
--- a/meson.build
+++ b/meson.build
@@ -1839,7 +1839,6 @@ config_host_data.set('CONFIG_LIBNFS', libnfs.found())
 config_host_data.set('CONFIG_LIBSSH', libssh.found())
 config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
 config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
-config_host_data.set('CONFIG_LIBURING_REGISTER_RING_FD', cc.has_function('io_uring_register_ring_fd', prefix: '#include <liburing.h>', dependencies:linux_io_uring))
 config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
 config_host_data.set('CONFIG_NUMA', numa.found())
 config_host_data.set('CONFIG_OPENGL', opengl.found())
-- 
2.37.3


