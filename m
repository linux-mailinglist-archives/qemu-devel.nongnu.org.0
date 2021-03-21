Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5968D3433AB
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 18:22:03 +0100 (CET)
Received: from localhost ([::1]:43156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO1m5-0000pU-Qo
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 13:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lO1j5-0007PS-32
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:18:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lO1ix-0005SO-6G
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616347124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FgR8P8LBujVI1zEdlxhu1f4ooV8WhIFRGs8Z2ivAdeM=;
 b=EDakf4oBIP26EMUd2toX3lUo+hePSCuuEt73lrnuc0IHqx1fmsLxdiDk4Bl6ps6uvLUHK0
 DbMCBr0yDC4PbJdkzUnsTc+cqj78hZaFXM2nkAyZRF0Wbs+z2PFqB2/sqnkSYTBNK9ivsX
 oxmGx5Rc7zxIcK0XXpo9dFSc4Lm0PZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-sgoBH2qiNAK-7QPYyeYBOQ-1; Sun, 21 Mar 2021 13:18:42 -0400
X-MC-Unique: sgoBH2qiNAK-7QPYyeYBOQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A6685700D;
 Sun, 21 Mar 2021 17:18:41 +0000 (UTC)
Received: from thuth.com (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FC2A5D9CD;
 Sun, 21 Mar 2021 17:18:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/5] contrib: ivshmem client and server build fix for SunOS.
Date: Sun, 21 Mar 2021 18:18:32 +0100
Message-Id: <20210321171833.20736-5-thuth@redhat.com>
In-Reply-To: <20210321171833.20736-1-thuth@redhat.com>
References: <20210321171833.20736-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David CARLIER <devnexen@gmail.com>

sun is a macro on these systems, thus renaming the variables on the
client and server.

Signed-off-by: David Carlier <devnexen@gmail.com>
Message-Id: <CA+XhMqzHPG5ezqY-YxbA+tMoadA3VDFWBX8_LaLC5YsQOMrz+A@mail.gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 contrib/ivshmem-client/ivshmem-client.c | 12 ++++++------
 contrib/ivshmem-server/ivshmem-server.c | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/contrib/ivshmem-client/ivshmem-client.c b/contrib/ivshmem-client/ivshmem-client.c
index b1274b236a..182c79d27c 100644
--- a/contrib/ivshmem-client/ivshmem-client.c
+++ b/contrib/ivshmem-client/ivshmem-client.c
@@ -178,7 +178,7 @@ ivshmem_client_init(IvshmemClient *client, const char *unix_sock_path,
 int
 ivshmem_client_connect(IvshmemClient *client)
 {
-    struct sockaddr_un sun;
+    struct sockaddr_un s_un;
     int fd, ret;
     int64_t tmp;
 
@@ -192,16 +192,16 @@ ivshmem_client_connect(IvshmemClient *client)
         return -1;
     }
 
-    sun.sun_family = AF_UNIX;
-    ret = snprintf(sun.sun_path, sizeof(sun.sun_path), "%s",
+    s_un.sun_family = AF_UNIX;
+    ret = snprintf(s_un.sun_path, sizeof(s_un.sun_path), "%s",
                    client->unix_sock_path);
-    if (ret < 0 || ret >= sizeof(sun.sun_path)) {
+    if (ret < 0 || ret >= sizeof(s_un.sun_path)) {
         IVSHMEM_CLIENT_DEBUG(client, "could not copy unix socket path\n");
         goto err_close;
     }
 
-    if (connect(client->sock_fd, (struct sockaddr *)&sun, sizeof(sun)) < 0) {
-        IVSHMEM_CLIENT_DEBUG(client, "cannot connect to %s: %s\n", sun.sun_path,
+    if (connect(client->sock_fd, (struct sockaddr *)&s_un, sizeof(s_un)) < 0) {
+        IVSHMEM_CLIENT_DEBUG(client, "cannot connect to %s: %s\n", s_un.sun_path,
                              strerror(errno));
         goto err_close;
     }
diff --git a/contrib/ivshmem-server/ivshmem-server.c b/contrib/ivshmem-server/ivshmem-server.c
index 88daee812d..39a6ffdb5d 100644
--- a/contrib/ivshmem-server/ivshmem-server.c
+++ b/contrib/ivshmem-server/ivshmem-server.c
@@ -288,7 +288,7 @@ ivshmem_server_init(IvshmemServer *server, const char *unix_sock_path,
 int
 ivshmem_server_start(IvshmemServer *server)
 {
-    struct sockaddr_un sun;
+    struct sockaddr_un s_un;
     int shm_fd, sock_fd, ret;
 
     /* open shm file */
@@ -327,15 +327,15 @@ ivshmem_server_start(IvshmemServer *server)
         goto err_close_shm;
     }
 
-    sun.sun_family = AF_UNIX;
-    ret = snprintf(sun.sun_path, sizeof(sun.sun_path), "%s",
+    s_un.sun_family = AF_UNIX;
+    ret = snprintf(s_un.sun_path, sizeof(s_un.sun_path), "%s",
                    server->unix_sock_path);
-    if (ret < 0 || ret >= sizeof(sun.sun_path)) {
+    if (ret < 0 || ret >= sizeof(s_un.sun_path)) {
         IVSHMEM_SERVER_DEBUG(server, "could not copy unix socket path\n");
         goto err_close_sock;
     }
-    if (bind(sock_fd, (struct sockaddr *)&sun, sizeof(sun)) < 0) {
-        IVSHMEM_SERVER_DEBUG(server, "cannot connect to %s: %s\n", sun.sun_path,
+    if (bind(sock_fd, (struct sockaddr *)&s_un, sizeof(s_un)) < 0) {
+        IVSHMEM_SERVER_DEBUG(server, "cannot connect to %s: %s\n", s_un.sun_path,
                              strerror(errno));
         goto err_close_sock;
     }
-- 
2.27.0


