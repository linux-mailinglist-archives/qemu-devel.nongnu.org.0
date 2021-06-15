Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA983A8A77
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 22:53:47 +0200 (CEST)
Received: from localhost ([::1]:52614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltG4A-0003Qp-S9
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 16:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyp-0001mu-Bq
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyn-00010j-MV
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gsu8CgwCiI97eFuf0FJbJi4zkbnxu3TQaKxCTZSDDmM=;
 b=i3GyDeZQaNWT3jtVHly45Z1cur6Bm0YQiGG54kP3qZFl5KGmaAfQpY95vM4G50zZWHRilO
 macHlaVrtzten4J81DZkPovZWuxsAgZKp6Vdff1EYE0OcYTllmZe+Hdzi7h8DIftP3NAq3
 mPYvlDT2eJpHMhp+kSgA+Pdc09YDvqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-eAiwDzOjN0u2kytiUwkJFQ-1; Tue, 15 Jun 2021 16:48:11 -0400
X-MC-Unique: eAiwDzOjN0u2kytiUwkJFQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F9CC100C611;
 Tue, 15 Jun 2021 20:48:10 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF1175D9CA;
 Tue, 15 Jun 2021 20:48:06 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/34] qemu-sockets: introduce socket_address_parse_named_fd()
Date: Tue, 15 Jun 2021 15:47:29 -0500
Message-Id: <20210615204756.281505-8-eblake@redhat.com>
In-Reply-To: <20210615204756.281505-1-eblake@redhat.com>
References: <20210615204756.281505-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add function that transforms named fd inside SocketAddress structure
into number representation. This way it may be then used in a context
where current monitor is not available.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610100802.5888-6-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: comment tweak]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/qemu/sockets.h | 11 +++++++++++
 util/qemu-sockets.c    | 19 +++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 7d1f8135767d..0c34bf23987e 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -111,4 +111,15 @@ SocketAddress *socket_remote_address(int fd, Error **errp);
  */
 SocketAddress *socket_address_flatten(SocketAddressLegacy *addr);

+/**
+ * socket_address_parse_named_fd:
+ *
+ * Modify @addr, replacing a named fd by its corresponding number.
+ * Needed for callers that plan to pass @addr to a context where the
+ * current monitor is not available.
+ *
+ * Return 0 on success.
+ */
+int socket_address_parse_named_fd(SocketAddress *addr, Error **errp);
+
 #endif /* QEMU_SOCKETS_H */
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index c415c342c12b..080a240b74ee 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1164,6 +1164,25 @@ static int socket_get_fd(const char *fdstr, Error **errp)
     return fd;
 }

+int socket_address_parse_named_fd(SocketAddress *addr, Error **errp)
+{
+    int fd;
+
+    if (addr->type != SOCKET_ADDRESS_TYPE_FD) {
+        return 0;
+    }
+
+    fd = socket_get_fd(addr->u.fd.str, errp);
+    if (fd < 0) {
+        return fd;
+    }
+
+    g_free(addr->u.fd.str);
+    addr->u.fd.str = g_strdup_printf("%d", fd);
+
+    return 0;
+}
+
 int socket_connect(SocketAddress *addr, Error **errp)
 {
     int fd;
-- 
2.31.1


