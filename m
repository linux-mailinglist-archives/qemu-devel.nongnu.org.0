Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876542A474F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 15:08:53 +0100 (CET)
Received: from localhost ([::1]:41194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZwzU-0003X6-Hd
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 09:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZwu1-0006uX-P7
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:03:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZwtw-0003QZ-QI
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604412187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EdO7Xmkx5AxGvMekA6FOxYt0BTQFmYn0IIJC9+umdAg=;
 b=icShs/N5Ne073AMZ2WG9XtT44WXawTV5T7xpx9y28Z+tSwQ8AUy7qV9raaMP2mfSAnql9u
 jj10zDy3zVw0eZwzXDFZHnt17OZCrdvGCnqpP5jP38dtyMua4jbRQEHcQYtzi6+G1dL30a
 XuNCb1bk0fUhEPd0h8dihS4si3P5/tk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-NwNYX1UvNx2_841oMRHJGA-1; Tue, 03 Nov 2020 09:03:05 -0500
X-MC-Unique: NwNYX1UvNx2_841oMRHJGA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04765186DD26
 for <qemu-devel@nongnu.org>; Tue,  3 Nov 2020 14:03:04 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-115-87.ams2.redhat.com [10.36.115.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A6605B4C7;
 Tue,  3 Nov 2020 14:03:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] sockets: Fix socket_sockaddr_to_address_unix() for
 abstract sockets
Date: Tue,  3 Nov 2020 14:02:22 +0000
Message-Id: <20201103140225.496776-9-berrange@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 01:02:05
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Commit 776b97d360 "qemu-sockets: add abstract UNIX domain socket
support" neglected to update socket_sockaddr_to_address_unix().  The
function returns a non-abstract socket address for abstract
sockets (wrong) with a null @path (also wrong; a non-optional QAPI str
member must never be null).

The null @path is due to confused code going back all the way to
commit 17c55decec "sockets: add helpers for creating SocketAddress
from a socket".

Add the required special case, and simplify the confused code.

Fixes: 776b97d3605ed0fc94443048fdf988c7725e38a9
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 util/qemu-sockets.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 3ceaa81226..a578c434c2 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1270,10 +1270,20 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
 
     addr = g_new0(SocketAddress, 1);
     addr->type = SOCKET_ADDRESS_TYPE_UNIX;
-    if (su->sun_path[0]) {
-        addr->u.q_unix.path = g_strndup(su->sun_path, sizeof(su->sun_path));
+#ifdef CONFIG_LINUX
+    if (!su->sun_path[0]) {
+        /* Linux abstract socket */
+        addr->u.q_unix.path = g_strndup(su->sun_path + 1,
+                                        sizeof(su->sun_path) - 1);
+        addr->u.q_unix.has_abstract = true;
+        addr->u.q_unix.abstract = true;
+        addr->u.q_unix.has_tight = true;
+        addr->u.q_unix.tight = salen < sizeof(*su);
+        return addr;
     }
+#endif
 
+    addr->u.q_unix.path = g_strndup(su->sun_path, sizeof(su->sun_path));
     return addr;
 }
 #endif /* WIN32 */
-- 
2.28.0


