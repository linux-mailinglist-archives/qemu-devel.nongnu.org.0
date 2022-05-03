Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88835190CD
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:03:12 +0200 (CEST)
Received: from localhost ([::1]:57500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0bv-00032B-S4
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlz43-0008Jq-CS
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:24:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlz41-0005IK-GI
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651609444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Xp/ZOvdkijbH2N7bf2mEvklYqn1dhF7/XdVsGvDIAA=;
 b=Vqxbq0OZOBqliFuswrlnppOV+0A6d5ijMXVEyO1LzveSh9nMwSa8YJJHFFLS6JW0Hihtks
 pIR28c7eKNijGUYHONrCtU2t/kjML8JhdYtv62eQkhoCdaFEyZqKuUTCdDlGO99g6Fha7y
 FxzMNixPCMmOW9LPnsZRCC944802hCk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-D0qf7T2eOuONZ8hzSf9LEQ-1; Tue, 03 May 2022 11:45:12 -0400
X-MC-Unique: D0qf7T2eOuONZ8hzSf9LEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B363738FE7E5;
 Tue,  3 May 2022 13:13:32 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0702C27EB1;
 Tue,  3 May 2022 13:13:31 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 06/23] block: move fcntl_setfl()
Date: Tue,  3 May 2022 17:12:39 +0400
Message-Id: <20220503131256.187238-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220503131256.187238-1-marcandre.lureau@redhat.com>
References: <20220503131256.187238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It is only used by block/file-posix.c, move it there.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index bfd9b2111143..48cd0966249d 100644
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
+    if (flags == -1) {
+        return -errno;
+    }
+    if (fcntl(fd, F_SETFL, flags | flag) == -1) {
+        return -errno;
+    }
+    return 0;
+}
+
 static int raw_reconfigure_getfd(BlockDriverState *bs, int flags,
                                  int *open_flags, uint64_t perm, bool force_dup,
                                  Error **errp)
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index b8bf7d4070ce..289efca3fae1 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -897,21 +897,6 @@ size_t qemu_get_host_physmem(void)
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
2.36.0.44.g0f828332d5ac


