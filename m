Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FF46B76DB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:53:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgfe-00005D-Gp; Mon, 13 Mar 2023 07:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgfM-0007eq-89
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgfK-0004u0-4b
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678708113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vY41lKMgTDFfWz8h2Umz3+YohajBmUcq3B29GCIk2wU=;
 b=eGpWyGxAlXl577MGocszuWgVYXs8J2CJ7Wa2dNPygfDJCDhsSYQiWwNVKAq1SQQOmBmeFG
 ZTtG6S8L44tNmwVRqm3cUkTGM/xCkBk6eJaA7XLTRhsZrQwTp9yxRHU7zM0ywdiwRZ/a+D
 HpmVwz9UQncRLRUuhPmhWxRC3kjSohs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-RswgkX12MMK-Jtkzq-9haQ-1; Mon, 13 Mar 2023 07:48:30 -0400
X-MC-Unique: RswgkX12MMK-Jtkzq-9haQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C684858F0E;
 Mon, 13 Mar 2023 11:48:29 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FE962A68;
 Mon, 13 Mar 2023 11:48:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL v2 21/25] monitor: release the lock before calling close()
Date: Mon, 13 Mar 2023 15:46:44 +0400
Message-Id: <20230313114648.426607-22-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

As per comment, presumably to avoid syscall in critical section.

Fixes: 0210c3b39bef08 ("monitor: Use LOCK_GUARD macros")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230306122751.2355515-7-marcandre.lureau@redhat.com>
---
 monitor/fds.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/monitor/fds.c b/monitor/fds.c
index 26b39a0ce6..7daf1064e1 100644
--- a/monitor/fds.c
+++ b/monitor/fds.c
@@ -80,7 +80,8 @@ void qmp_getfd(const char *fdname, Error **errp)
         return;
     }
 
-    QEMU_LOCK_GUARD(&cur_mon->mon_lock);
+    /* See close() call below. */
+    qemu_mutex_lock(&cur_mon->mon_lock);
     QLIST_FOREACH(monfd, &cur_mon->fds, next) {
         if (strcmp(monfd->name, fdname) != 0) {
             continue;
@@ -88,6 +89,7 @@ void qmp_getfd(const char *fdname, Error **errp)
 
         tmp_fd = monfd->fd;
         monfd->fd = fd;
+        qemu_mutex_unlock(&cur_mon->mon_lock);
         /* Make sure close() is outside critical section */
         close(tmp_fd);
         return;
@@ -98,6 +100,7 @@ void qmp_getfd(const char *fdname, Error **errp)
     monfd->fd = fd;
 
     QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
+    qemu_mutex_unlock(&cur_mon->mon_lock);
 }
 
 void qmp_closefd(const char *fdname, Error **errp)
-- 
2.39.2


