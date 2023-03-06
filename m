Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBCE6ABF85
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 13:31:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ9yd-0000DX-Jr; Mon, 06 Mar 2023 07:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ9xX-0007m4-CN
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:28:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ9xV-0003O4-6L
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:28:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678105732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hmnVpN1pnMlbwAzSetIJsAtY9mzJIDmDABMnuHCGvIo=;
 b=IOrx4ZXNvj/eLGRZNgqr3xaGX3AGKhLREPp/jkoJ9w/vns9KW2Uc5LnTOxCRyHctatfocR
 KrUZu+x1NgKGBSOleFrnLaSo6Vq4GGeeMcV2gsPj7QWUULFBlloRF6M90qkLZk/8UOWivv
 /oZ+Y+OfBUSlxmqkUh/QyBk9jk9/CVw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-rO_DXviIMJabsmVB_8LLjg-1; Mon, 06 Mar 2023 07:28:49 -0500
X-MC-Unique: rO_DXviIMJabsmVB_8LLjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAD1685CCE1;
 Mon,  6 Mar 2023 12:28:48 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9CAF1121314;
 Mon,  6 Mar 2023 12:28:47 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v4 11/11] QMP/HMP: only actually implement getfd on
 CONFIG_POSIX
Date: Mon,  6 Mar 2023 16:27:51 +0400
Message-Id: <20230306122751.2355515-12-marcandre.lureau@redhat.com>
In-Reply-To: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
References: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

Currently, the function will simply fail if ancillary fds are not
provided, for ex on unsupported platforms.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qapi/misc.json     | 2 +-
 monitor/fds.c      | 2 ++
 monitor/hmp-cmds.c | 2 ++
 hmp-commands.hx    | 2 ++
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 031c94050c..96c053e305 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -273,7 +273,7 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'getfd', 'data': {'fdname': 'str'} }
+{ 'command': 'getfd', 'data': {'fdname': 'str'}, 'if': 'CONFIG_POSIX' }
 
 ##
 # @get-win32-socket:
diff --git a/monitor/fds.c b/monitor/fds.c
index 9ed4197358..d86c2c674c 100644
--- a/monitor/fds.c
+++ b/monitor/fds.c
@@ -98,6 +98,7 @@ static bool monitor_add_fd(Monitor *mon, int fd, const char *fdname, Error **err
     return true;
 }
 
+#ifdef CONFIG_POSIX
 void qmp_getfd(const char *fdname, Error **errp)
 {
     Monitor *cur_mon = monitor_cur();
@@ -111,6 +112,7 @@ void qmp_getfd(const char *fdname, Error **errp)
 
     monitor_add_fd(cur_mon, fd, fdname, errp);
 }
+#endif
 
 void qmp_closefd(const char *fdname, Error **errp)
 {
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 34bd8c67d7..6c559b48c8 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -192,6 +192,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
+#ifdef CONFIG_POSIX
 void hmp_getfd(Monitor *mon, const QDict *qdict)
 {
     const char *fdname = qdict_get_str(qdict, "fdname");
@@ -200,6 +201,7 @@ void hmp_getfd(Monitor *mon, const QDict *qdict)
     qmp_getfd(fdname, &err);
     hmp_handle_error(mon, err);
 }
+#endif
 
 void hmp_closefd(Monitor *mon, const QDict *qdict)
 {
diff --git a/hmp-commands.hx b/hmp-commands.hx
index b87c250e23..bb85ee1d26 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1486,6 +1486,7 @@ SRST
   Inject an MCE on the given CPU (x86 only).
 ERST
 
+#ifdef CONFIG_POSIX
     {
         .name       = "getfd",
         .args_type  = "fdname:s",
@@ -1501,6 +1502,7 @@ SRST
   mechanism on unix sockets, it is stored using the name *fdname* for
   later use by other monitor commands.
 ERST
+#endif
 
     {
         .name       = "closefd",
-- 
2.39.2


