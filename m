Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3BC2A4757
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 15:10:37 +0100 (CET)
Received: from localhost ([::1]:48868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZx1A-0006iH-D1
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 09:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZwtk-0006mH-SP
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:02:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZwte-0003KT-O7
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:02:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604412169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f2timKX3kYoLzqTmK3/PTTSCfa+DsK9FvWxwyfITMiA=;
 b=fdUc5uDnDrPU7BeB2W2vSEVmltDgb8doqSgdC6XzdfguWfWwmyCKJ2EfPPVmZQMt23qqly
 WjEp13PX8cazsrh5hQATtvF09N4keFRfAWZsqwdmZvChTQxMG+MLJ9J06kjWhzdGV5p3o9
 QmB0OP+q8RzCweOyEJsa76n9OYURF0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-3jCnUYG0Oi619MXKBtAqTw-1; Tue, 03 Nov 2020 09:02:48 -0500
X-MC-Unique: 3jCnUYG0Oi619MXKBtAqTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48BDC1009E25
 for <qemu-devel@nongnu.org>; Tue,  3 Nov 2020 14:02:47 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-115-87.ams2.redhat.com [10.36.115.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 688915B4D6;
 Tue,  3 Nov 2020 14:02:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/11] test-util-sockets: Factor out
 test_socket_unix_abstract_one()
Date: Tue,  3 Nov 2020 14:02:18 +0000
Message-Id: <20201103140225.496776-5-berrange@redhat.com>
In-Reply-To: <20201103140225.496776-1-berrange@redhat.com>
References: <20201103140225.496776-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/test-util-sockets.c | 48 ++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/tests/test-util-sockets.c b/tests/test-util-sockets.c
index a4792253ba..40ff893e64 100644
--- a/tests/test-util-sockets.c
+++ b/tests/test-util-sockets.c
@@ -261,6 +261,24 @@ static gpointer unix_client_thread_func(gpointer user_data)
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
@@ -272,40 +290,14 @@ static void test_socket_unix_abstract_good(void)
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
2.28.0


