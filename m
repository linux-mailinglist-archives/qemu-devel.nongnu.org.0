Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9123368DAAE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:26:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOvG-0007VC-Lk; Tue, 07 Feb 2023 09:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pPOvF-0007Us-1q
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:26:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pPOvD-0006IZ-DI
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:26:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675779969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odFOL3cg61TDWscFaLr3f9+xIKavyEThhYBqETsyNZI=;
 b=X2i+yulHDr8TAq9fMCP1tqCBYfcxBkyUk/2CGOt/xqGkFN61gTwac/9FIzJYYzFslDV+Jq
 65n+zh6WvA3qTihJqrWkqXcsBqvaKzrny7obSW6R0wokG/ZrMHaYuMKQ/VhmNjAiSK4g5t
 kAJPdx1ahXAlAsYAEpS5YW1VcO8FGfg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-MNcM4QNeN1iXf5AelRjVAQ-1; Tue, 07 Feb 2023 09:26:06 -0500
X-MC-Unique: MNcM4QNeN1iXf5AelRjVAQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1BCD100F91B;
 Tue,  7 Feb 2023 14:26:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A97D21410F36;
 Tue,  7 Feb 2023 14:26:04 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 06/10] monitor: release the lock before calling close()
Date: Tue,  7 Feb 2023 18:25:31 +0400
Message-Id: <20230207142535.1153722-7-marcandre.lureau@redhat.com>
In-Reply-To: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 monitor/fds.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/monitor/fds.c b/monitor/fds.c
index 26b39a0ce6..03c5e97c35 100644
--- a/monitor/fds.c
+++ b/monitor/fds.c
@@ -80,7 +80,7 @@ void qmp_getfd(const char *fdname, Error **errp)
         return;
     }
 
-    QEMU_LOCK_GUARD(&cur_mon->mon_lock);
+    qemu_mutex_lock(&cur_mon->mon_lock);
     QLIST_FOREACH(monfd, &cur_mon->fds, next) {
         if (strcmp(monfd->name, fdname) != 0) {
             continue;
@@ -88,6 +88,7 @@ void qmp_getfd(const char *fdname, Error **errp)
 
         tmp_fd = monfd->fd;
         monfd->fd = fd;
+        qemu_mutex_unlock(&cur_mon->mon_lock);
         /* Make sure close() is outside critical section */
         close(tmp_fd);
         return;
@@ -98,6 +99,7 @@ void qmp_getfd(const char *fdname, Error **errp)
     monfd->fd = fd;
 
     QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
+    qemu_mutex_unlock(&cur_mon->mon_lock);
 }
 
 void qmp_closefd(const char *fdname, Error **errp)
-- 
2.39.1


