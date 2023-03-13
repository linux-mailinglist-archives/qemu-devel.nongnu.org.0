Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373176B7692
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:49:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgdA-0008Cs-Tk; Mon, 13 Mar 2023 07:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgcd-0007eS-BC
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:45:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgcb-0004At-5H
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678707938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vp9rOFLaZH6WrKVbY+L9GOftplQA17FCdmv9kLHK54I=;
 b=XRqcXi8Kb2N6SYB/UMiQUguMzHFu2JdCAFB4ugvmuPZZMYXWsdxbvJbRfDDuNZcuKazDFG
 1LepdnCNdD6P9t0zMkNo3nSZqT2PP7uSyMwfMHpYFtGKD+3oQc47HHE8UWr3lBagmj4uyu
 Dljvc6Ae1cjxn1DD6HF1E+/BVwKaMOc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-lKuvaSglPLmtycUmYYq1gw-1; Mon, 13 Mar 2023 07:45:35 -0400
X-MC-Unique: lKuvaSglPLmtycUmYYq1gw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9E221869B0F;
 Mon, 13 Mar 2023 11:45:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E3B9C15A0B;
 Mon, 13 Mar 2023 11:45:33 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 25/25] QMP/HMP: only actually implement getfd on CONFIG_POSIX
Date: Mon, 13 Mar 2023 15:43:35 +0400
Message-Id: <20230313114335.424093-26-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230306122751.2355515-12-marcandre.lureau@redhat.com>
---
 qapi/misc.json     | 2 +-
 monitor/fds.c      | 2 ++
 monitor/hmp-cmds.c | 2 ++
 hmp-commands.hx    | 2 ++
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 5ef6286af3..6ddd16ea28 100644
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


