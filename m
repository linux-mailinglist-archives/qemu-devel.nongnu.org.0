Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C7250B39C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:08:20 +0200 (CEST)
Received: from localhost ([::1]:38340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpH1-0005nE-N2
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhoo5-0007Pq-I2
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:38:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhoo4-0006NU-0X
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650616703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4BZGulrL0ywqD6A7XDK2DpkSa6omxztAc/aQytVDpZw=;
 b=bxkIXYxUZ2BWORLXaSAlESbEVr7Js86eyOZkJWgJerAk5/7awkMnksgUqGWCUqkVDGLbhd
 eOmNqj3Ve4d/hnq+5qngNAtwts44PuQToC4P2yjOdELuqr+1y9w8R9pIMVq4gbXfcOFjRj
 e01lqADVxzFSYcvj1XvVntX9UJH7Z6w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-U3Szs7AaMdWaTeLaj6rbBw-1; Fri, 22 Apr 2022 04:38:21 -0400
X-MC-Unique: U3Szs7AaMdWaTeLaj6rbBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB0611C07392;
 Fri, 22 Apr 2022 08:38:20 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF65C200C0E2;
 Fri, 22 Apr 2022 08:38:16 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 09/10] block: move fcntl_setfl()
Date: Fri, 22 Apr 2022 12:36:38 +0400
Message-Id: <20220422083639.3156978-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
References: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "open list:raw" <qemu-block@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It is only used by block/file-posix.c, move it there.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/sysemu/os-posix.h |  2 --
 block/file-posix.c        | 15 +++++++++++++++
 util/oslib-posix.c        | 15 ---------------
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index adbe19d3e468..58de7c994d85 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -96,8 +96,6 @@ static inline void qemu_funlockfile(FILE *f)
     funlockfile(f);
 }
 
-int fcntl_setfl(int fd, int flag);
-
 #ifdef __cplusplus
 }
 #endif
diff --git a/block/file-posix.c b/block/file-posix.c
index bfd9b2111143..1164ca9e1c6d 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1022,6 +1022,21 @@ static int raw_handle_perm_lock(BlockDriverState *bs,
     return ret;
 }
 
+/* Sets a specific flag */
+static int fcntl_setfl(int fd, int flag)
+{
+    int flags;
+
+    flags = fcntl(fd, F_GETFL);
+    if (flags == -1)
+        return -errno;
+
+    if (fcntl(fd, F_SETFL, flags | flag) == -1)
+        return -errno;
+
+    return 0;
+}
+
 static int raw_reconfigure_getfd(BlockDriverState *bs, int flags,
                                  int *open_flags, uint64_t perm, bool force_dup,
                                  Error **errp)
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 543c9944b083..1c231087408f 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -794,21 +794,6 @@ size_t qemu_get_host_physmem(void)
     return 0;
 }
 
-/* Sets a specific flag */
-int fcntl_setfl(int fd, int flag)
-{
-    int flags;
-
-    flags = fcntl(fd, F_GETFL);
-    if (flags == -1) {
-        return -errno;
-    }
-    if (fcntl(fd, F_SETFL, flags | flag) == -1) {
-        return -errno;
-    }
-    return 0;
-}
-
 int qemu_msync(void *addr, size_t length, int fd)
 {
     size_t align_mask = ~(qemu_real_host_page_size() - 1);
-- 
2.36.0


