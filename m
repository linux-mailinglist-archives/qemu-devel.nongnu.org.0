Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D388525162
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:37:36 +0200 (CEST)
Received: from localhost ([::1]:51456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npAsh-0001jV-6F
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApc-0006Aj-Ll
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApb-0003RS-3F
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652369661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S/ah9paPVxbBVZphrAhEc0BYKrdp2jOfBKGneKB97Rs=;
 b=QGWZV1XzRBWK/cdeoF8MfOssS9n0wbI/WvE9ExCcuIkPqyokjNzQhWcMYX3gYp6AM0+Rrm
 cpufRLd712V7lBun/wsYg7g0B9S4ndWdGSXfgoUCAM2sXjRZ6/I75RvoNWVz9Uhd6L6BW1
 u8DxHz2BOmdU4dDEw2RwepJW5OqYfts=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-FWAdukNeO0iLOeZB7RSywQ-1; Thu, 12 May 2022 11:34:20 -0400
X-MC-Unique: FWAdukNeO0iLOeZB7RSywQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0C9F802A5B;
 Thu, 12 May 2022 15:34:19 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AE5C416156;
 Thu, 12 May 2022 15:34:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 08/10] qemu-nbd: Pass max connections to blockdev layer
Date: Thu, 12 May 2022 17:33:59 +0200
Message-Id: <20220512153401.202863-9-kwolf@redhat.com>
In-Reply-To: <20220512153401.202863-1-kwolf@redhat.com>
References: <20220512153401.202863-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

The next patch wants to adjust whether the NBD server code advertises
MULTI_CONN based on whether it is known if the server limits to
exactly one client.  For a server started by QMP, this information is
obtained through nbd_server_start (which can support more than one
export); but for qemu-nbd (which supports exactly one export), it is
controlled only by the command-line option -e/--shared.  Since we
already have a hook function used by qemu-nbd, it's easiest to just
alter its signature to fit our needs.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20220512004924.417153-2-eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/nbd.h | 2 +-
 blockdev-nbd.c      | 8 ++++----
 qemu-nbd.c          | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index a98eb665da..c5a29ce1c6 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -344,7 +344,7 @@ void nbd_client_new(QIOChannelSocket *sioc,
 void nbd_client_get(NBDClient *client);
 void nbd_client_put(NBDClient *client);
 
-void nbd_server_is_qemu_nbd(bool value);
+void nbd_server_is_qemu_nbd(int max_connections);
 bool nbd_server_is_running(void);
 void nbd_server_start(SocketAddress *addr, const char *tls_creds,
                       const char *tls_authz, uint32_t max_connections,
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 7f6531cba0..711e0e72bd 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -30,18 +30,18 @@ typedef struct NBDServerData {
 } NBDServerData;
 
 static NBDServerData *nbd_server;
-static bool is_qemu_nbd;
+static int qemu_nbd_connections = -1; /* Non-negative if this is qemu-nbd */
 
 static void nbd_update_server_watch(NBDServerData *s);
 
-void nbd_server_is_qemu_nbd(bool value)
+void nbd_server_is_qemu_nbd(int max_connections)
 {
-    is_qemu_nbd = value;
+    qemu_nbd_connections = max_connections;
 }
 
 bool nbd_server_is_running(void)
 {
-    return nbd_server || is_qemu_nbd;
+    return nbd_server || qemu_nbd_connections >= 0;
 }
 
 static void nbd_blockdev_client_closed(NBDClient *client, bool ignored)
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 2382b5042a..0cd5aa6f02 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -1095,7 +1095,7 @@ int main(int argc, char **argv)
 
     bs->detect_zeroes = detect_zeroes;
 
-    nbd_server_is_qemu_nbd(true);
+    nbd_server_is_qemu_nbd(shared);
 
     export_opts = g_new(BlockExportOptions, 1);
     *export_opts = (BlockExportOptions) {
-- 
2.35.3


