Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2586B76ED
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:55:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgfc-0008Oj-Qx; Mon, 13 Mar 2023 07:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgfH-00073J-12
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:48:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgfF-0004re-Bn
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678708108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QVXYek2aD1GDbLaBzwM+PhSho8Hk9PdY3riLVXeSemU=;
 b=eBbvxRLkSXB9miBLNsFTFAv2e/oSGAdz+S8QltewdCMi0qlzCquVyLjwr9NwePdTV3W/Ec
 wTGTSnoWGv25vCaJFAo1KcAzGeWcS3EiE0Fh/WBR/qmYJEk7psECq12ch5baaaiy+OXMtF
 +090OgK8VHZ4OiQfCp+AfiF+5NleqeA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-hlgN0zGXMp6p_UK9W3nVbQ-1; Mon, 13 Mar 2023 07:48:25 -0400
X-MC-Unique: hlgN0zGXMp6p_UK9W3nVbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D66A811E9C;
 Mon, 13 Mar 2023 11:48:24 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9761C4042AC8;
 Mon, 13 Mar 2023 11:48:23 +0000 (UTC)
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
Subject: [PULL v2 20/25] qmp: 'add_client' actually expects sockets
Date: Mon, 13 Mar 2023 15:46:43 +0400
Message-Id: <20230313114648.426607-21-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
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

Whether it is SPICE, VNC, D-Bus, or the socket chardev, they all
actually expect a socket kind or will fail in different ways at runtime.

Throw an error early if the given 'add_client' fd is not a socket, and
close it to avoid leaks.

This allows to replace the close() call with a more correct & portable
closesocket() version.

(this will allow importing sockets on Windows with a specialized command
in the following patch, while keeping the remaining monitor associated
sockets/add_client code & usage untouched)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230306122751.2355515-6-marcandre.lureau@redhat.com>
---
 qapi/misc.json     | 3 +++
 monitor/qmp-cmds.c | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/qapi/misc.json b/qapi/misc.json
index 27ef5a2b20..f0217cfba0 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -14,6 +14,9 @@
 # Allow client connections for VNC, Spice and socket based
 # character devices to be passed in to QEMU via SCM_RIGHTS.
 #
+# If the FD associated with @fdname is not a socket, the command will fail and
+# the FD will be closed.
+#
 # @protocol: protocol name. Valid names are "vnc", "spice", "@dbus-display" or
 #            the name of a character device (eg. from -chardev id=XXXX)
 #
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 859012aef4..b0f948d337 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -14,6 +14,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/sockets.h"
 #include "monitor-internal.h"
 #include "monitor/qdev.h"
 #include "monitor/qmp-helpers.h"
@@ -139,6 +140,12 @@ void qmp_add_client(const char *protocol, const char *fdname,
         return;
     }
 
+    if (!fd_is_socket(fd)) {
+        error_setg(errp, "parameter @fdname must name a socket");
+        close(fd);
+        return;
+    }
+
     for (i = 0; i < ARRAY_SIZE(protocol_table); i++) {
         if (!strcmp(protocol, protocol_table[i].name)) {
             if (!protocol_table[i].add_client(fd, has_skipauth, skipauth,
-- 
2.39.2


