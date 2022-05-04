Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4105E51AAC5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 19:33:27 +0200 (CEST)
Received: from localhost ([::1]:43292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIsQ-0001gE-CD
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 13:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmIqn-0007E0-7k
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmIql-0003nR-J5
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651685502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KlsHIrWV+HO7aeZTRbvh+8pSkcJ71kOwRP1Qu6+MR7M=;
 b=FXzspmYFX7nNoN1uNSgJyFA8NISFMw/YdDibXdM31BDzn4C2uyjbjstyX4nijLqY0krwZ+
 JJc4Ys456/lZSYYMTRFPRJjRGD2WPO6bp6C6zxc+j6LNqya+lwgkYjWb9G2Bc6O29GjYAF
 aB1ZzoEB/mDFCFXetfQ3fRVM8udpAPY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-Ddscnnk6Nw2-9O4u3TzSMA-1; Wed, 04 May 2022 13:31:39 -0400
X-MC-Unique: Ddscnnk6Nw2-9O4u3TzSMA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9698811E76;
 Wed,  4 May 2022 17:31:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2C2C4643CE;
 Wed,  4 May 2022 17:31:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Bandan Das <bsd@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 08/16] osdep: export qemu_open_cloexec()
Date: Wed,  4 May 2022 21:30:17 +0400
Message-Id: <20220504173025.650167-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220504173025.650167-1-marcandre.lureau@redhat.com>
References: <20220504173025.650167-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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


