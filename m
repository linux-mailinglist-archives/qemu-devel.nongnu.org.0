Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FA129ED2F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 14:41:34 +0100 (CET)
Received: from localhost ([::1]:40702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY8BJ-0007iR-7u
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 09:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kY88g-0005ss-Ui
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 09:38:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kY88e-0008JY-Gw
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 09:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603978727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2CcTRrLuVHym08uC7ic0BIJQGlah2N3jZECNEJQTcJg=;
 b=RDkpvHvvOcaUtKR9NvJUCru6G6f+MBjEvn3oFyGsKXJbolve7Bsp/AZ7CxNRszarTXb4z4
 lb1lDGN/MkZrsxDTsgZCNQemuSHhvlVY2Q566LRFzTE6jNJIqTcDPE+3HwZ12QlkC4981p
 Cf9g7uhskn04d6ljSRhyHuJ50DBncD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-xJIP-wbdObaVZBS5_0qoJg-1; Thu, 29 Oct 2020 09:38:43 -0400
X-MC-Unique: xJIP-wbdObaVZBS5_0qoJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B06641018F7A;
 Thu, 29 Oct 2020 13:38:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 740CB19930;
 Thu, 29 Oct 2020 13:38:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AF99511329BE; Thu, 29 Oct 2020 14:38:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] sockets: Fix socket_sockaddr_to_address_unix() for
 abstract sockets
Date: Thu, 29 Oct 2020 14:38:30 +0100
Message-Id: <20201029133833.3450220-9-armbru@redhat.com>
In-Reply-To: <20201029133833.3450220-1-armbru@redhat.com>
References: <20201029133833.3450220-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 00:47:54
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
Cc: kwolf@redhat.com, berrange@redhat.com, zxq_yx_007@163.com,
 kraxel@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 util/qemu-sockets.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index c802d5aa0a..801c5e3957 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1264,10 +1264,20 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
 
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
+        addr->u.q_unix.tight = !su->sun_path[sizeof(su->sun_path) - 1];
+        return addr;
     }
+#endif
 
+    addr->u.q_unix.path = g_strdup(su->sun_path);
     return addr;
 }
 #endif /* WIN32 */
-- 
2.26.2


