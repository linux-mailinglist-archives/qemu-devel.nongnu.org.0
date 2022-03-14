Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29BE4D8E5E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 21:40:57 +0100 (CET)
Received: from localhost ([::1]:40438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTrUu-0002PR-Sa
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 16:40:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nTrSo-00089x-8I
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 16:38:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nTrSl-00021A-Ir
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 16:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647290322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pkvli4GkDi2DceW3HmUMbGzHHR4bxhzApB2ohz50Uqo=;
 b=hl5gM3nuZQT84N477DRG5R3zhrRgPS+kVLvV6mR816en0Q7AGDFLmwoNcqR9QdL1j1X+yq
 kgvcuCQhykCHPNFFbAqk/UPZIUOauYIHlSeUAu2fL4IuUwTZZHUBcHSR6b9HYZozUXhZ8q
 wrw2hEGb/Ap6frFVxU0xVsI39lrBjp4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-AAT4KJwvOECjj_wgqv00Hg-1; Mon, 14 Mar 2022 16:38:39 -0400
X-MC-Unique: AAT4KJwvOECjj_wgqv00Hg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4327E811E78;
 Mon, 14 Mar 2022 20:38:39 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.22.17.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D46E21402427;
 Mon, 14 Mar 2022 20:38:37 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] qemu-nbd: Pass max connections to blockdev layer
Date: Mon, 14 Mar 2022 15:38:17 -0500
Message-Id: <20220314203818.3681277-3-eblake@redhat.com>
In-Reply-To: <20220314203818.3681277-1-eblake@redhat.com>
References: <20220314203818.3681277-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 rjones@redhat.com, nsoffer@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 v.sementsov-og@ya.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next patch wants to adjust whether the NBD server code advertises
MULTI_CONN based on whether it is known if the server limits to
exactly one client.  For a server started by QMP, this information is
obtained through nbd_server_start (which can support more than one
export); but for qemu-nbd (which supports exactly one export), it is
controlled only by the command-line option -e/--shared.  Since we
already have a hook function used by qemu-nbd, it's easiest to just
alter its signature to fit our needs.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h | 2 +-
 blockdev-nbd.c      | 8 ++++----
 qemu-nbd.c          | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index a98eb665da04..c5a29ce1c61b 100644
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
index 9840d25a8298..add41a23af43 100644
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
index 713e7557a9eb..8c25ae93df83 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -1087,7 +1087,7 @@ int main(int argc, char **argv)

     bs->detect_zeroes = detect_zeroes;

-    nbd_server_is_qemu_nbd(true);
+    nbd_server_is_qemu_nbd(shared);

     export_opts = g_new(BlockExportOptions, 1);
     *export_opts = (BlockExportOptions) {
-- 
2.35.1


