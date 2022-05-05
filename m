Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B9F51BAB0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 10:38:30 +0200 (CEST)
Received: from localhost ([::1]:59194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmX0H-0003dw-Sf
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 04:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmWeS-0006nV-2n
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:16:01 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:31786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmWeO-0007ss-Lm
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651738552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KlsHIrWV+HO7aeZTRbvh+8pSkcJ71kOwRP1Qu6+MR7M=;
 b=do9Hh2k5iaAkwjOB2jGxK/GhYQiiF5qAIQsLoj8B94/kZdk3GblR+SGWxO1MuzSsN/OUTg
 nucWYXO7yGAs4vMKP6jblNB3Cdu4KL/c1o5LFAT5tE7SQM9MF9o6F+4cYtUf/rw+Hqra3f
 Kgit7p9e5WjKURW2jad2ncl3FllATcA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-GkuFbQeTOmC53r62SEiAqg-1; Thu, 05 May 2022 04:15:51 -0400
X-MC-Unique: GkuFbQeTOmC53r62SEiAqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F74D803792;
 Thu,  5 May 2022 08:15:50 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC4AE1468D6B;
 Thu,  5 May 2022 08:15:49 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 06/15] osdep: export qemu_open_cloexec()
Date: Thu,  5 May 2022 12:14:22 +0400
Message-Id: <20220505081431.934739-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220505081431.934739-1-marcandre.lureau@redhat.com>
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.74;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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
index 67cc4654166b..64f51cfb7a62 100644
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
index 60fcbbaebe72..67541b7654ef 100644
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
+        error_setg_errno(errp, errno, "Could not open '%s'", name);
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
2.36.0.44.g0f828332d5ac


