Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BCD29ED50
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 14:43:48 +0100 (CET)
Received: from localhost ([::1]:48448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY8DT-0002Qe-VM
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 09:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kY88h-0005uC-MV
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 09:38:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kY88d-0008JJ-2U
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 09:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603978726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EG8yK+UEMiZms/cfjid9unXye8eEYZE1eZxm7VRgSDE=;
 b=eH7d10oahBqBcqnHe19kuww+o0wXWdb5sgzdFzvCVy5vNSAmrFrOO14G6XrHzV5/tLOqb8
 fMtMmBi/Z3uSTbt17INpE+wcc2Ot7Q6bGuKNw40iCqgZgXY/Dt0J+PYHMHFPxPiu3zqAFW
 YWn8fYvMpVnVZjWHkESRCSneOOaIi5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-T83t0AX2P4KXIytgrGtABQ-1; Thu, 29 Oct 2020 09:38:43 -0400
X-MC-Unique: T83t0AX2P4KXIytgrGtABQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B22AE10E2186;
 Thu, 29 Oct 2020 13:38:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 305F15D98F;
 Thu, 29 Oct 2020 13:38:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A45071132FD3; Thu, 29 Oct 2020 14:38:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/11] test-util-sockets: Factor out
 test_socket_unix_abstract_one()
Date: Thu, 29 Oct 2020 14:38:26 +0100
Message-Id: <20201029133833.3450220-5-armbru@redhat.com>
In-Reply-To: <20201029133833.3450220-1-armbru@redhat.com>
References: <20201029133833.3450220-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 01:47:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, berrange@redhat.com, zxq_yx_007@163.com,
 kraxel@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/test-util-sockets.c | 48 ++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/tests/test-util-sockets.c b/tests/test-util-sockets.c
index b1b5628bd5..77fc51d6f5 100644
--- a/tests/test-util-sockets.c
+++ b/tests/test-util-sockets.c
@@ -259,6 +259,24 @@ static gpointer unix_client_thread_func(gpointer user_data)
     return NULL;
 }
 
+static void test_socket_unix_abstract_one(SocketAddress *addr)
+{
+    GThread *serv, *cli;
+
+    serv = g_thread_new("abstract_unix_server",
+                        unix_server_thread_func,
+                        addr);
+
+    sleep(1);
+
+    cli = g_thread_new("abstract_unix_client",
+                       unix_client_thread_func,
+                       addr);
+
+    g_thread_join(cli);
+    g_thread_join(serv);
+}
+
 static void test_socket_unix_abstract_good(void)
 {
     SocketAddress addr;
@@ -270,40 +288,14 @@ static void test_socket_unix_abstract_good(void)
     addr.u.q_unix.abstract = true;
 
     /* non tight socklen serv and cli */
-
     addr.u.q_unix.has_tight = false;
     addr.u.q_unix.tight = false;
-
-    GThread *serv = g_thread_new("abstract_unix_server",
-                                 unix_server_thread_func,
-                                 &addr);
-
-    sleep(1);
-
-    GThread *cli = g_thread_new("abstract_unix_client",
-                                unix_client_thread_func,
-                                &addr);
-
-    g_thread_join(cli);
-    g_thread_join(serv);
+    test_socket_unix_abstract_one(&addr);
 
     /* tight socklen serv and cli */
-
     addr.u.q_unix.has_tight = true;
     addr.u.q_unix.tight = true;
-
-    serv = g_thread_new("abstract_unix_server",
-                        unix_server_thread_func,
-                        &addr);
-
-    sleep(1);
-
-    cli = g_thread_new("abstract_unix_client",
-                       unix_client_thread_func,
-                       &addr);
-
-    g_thread_join(cli);
-    g_thread_join(serv);
+    test_socket_unix_abstract_one(&addr);
 
     g_free(addr.u.q_unix.path);
 }
-- 
2.26.2


