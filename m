Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EBE526916
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:15:50 +0200 (CEST)
Received: from localhost ([::1]:46398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZpN-0002nd-F8
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1npZiR-0000cT-AX
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:08:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1npZiP-000703-MI
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652465317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+pDJbQ4xP8ZbW1GDaVXIl7W0jZ515k7FalXl/i1mqU=;
 b=Js9Qpn6hFtiH9jnGv+2IdEmQPLLtMQlOdS0FWsfyO9Zp0IEui1zTN1nXUz+ByI2XEFOBaJ
 8oUNR5aY8dy5yNcWzMPws6Ma76DpaleAJup4i52zh3Pbxn7JLSp4F0Dux7Rghv/obQZnX8
 Co6Qx5nIpMSSAC9emuH0QxE0woVqZ9k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-27Kd_EvrPGyRTqFaylnGxQ-1; Fri, 13 May 2022 14:08:35 -0400
X-MC-Unique: 27Kd_EvrPGyRTqFaylnGxQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 572581C01B43;
 Fri, 13 May 2022 18:08:35 +0000 (UTC)
Received: from localhost (unknown [10.39.192.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEC5340D1CF;
 Fri, 13 May 2022 18:08:34 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 05/15] osdep: export qemu_open_cloexec()
Date: Fri, 13 May 2022 20:08:11 +0200
Message-Id: <20220513180821.905149-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220513180821.905149-1-marcandre.lureau@redhat.com>
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
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

Used in the next patch, to simplify qga code.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/osdep.h |  1 +
 util/osdep.c         | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 67cc465416..64f51cfb7a 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -489,6 +489,7 @@ void sigaction_invoke(struct sigaction *action,
  */
 int qemu_open_old(const char *name, int flags, ...);
 int qemu_open(const char *name, int flags, Error **errp);
+int qemu_open_cloexec(const char *name, int flags, mode_t mode, Error **errp);
 int qemu_create(const char *name, int flags, mode_t mode, Error **errp);
 int qemu_close(int fd);
 int qemu_unlink(const char *name);
diff --git a/util/osdep.c b/util/osdep.c
index 60fcbbaebe..545a88e1fd 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -279,9 +279,11 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
 }
 #endif
 
-static int qemu_open_cloexec(const char *name, int flags, mode_t mode)
+int qemu_open_cloexec(const char *name, int flags, mode_t mode, Error **errp)
 {
+    ERRP_GUARD();
     int ret;
+
 #ifdef O_CLOEXEC
     ret = open(name, flags | O_CLOEXEC, mode);
 #else
@@ -290,6 +292,10 @@ static int qemu_open_cloexec(const char *name, int flags, mode_t mode)
         qemu_set_cloexec(ret);
     }
 #endif
+    if (ret == -1) {
+        error_setg_errno(errp, errno, "Failed to open file '%s'", name);
+    }
+
     return ret;
 }
 
@@ -327,7 +333,7 @@ qemu_open_internal(const char *name, int flags, mode_t mode, Error **errp)
     }
 #endif
 
-    ret = qemu_open_cloexec(name, flags, mode);
+    ret = qemu_open_cloexec(name, flags, mode, NULL);
 
     if (ret == -1) {
         const char *action = flags & O_CREAT ? "create" : "open";
-- 
2.36.1


