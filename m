Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B9E5241B2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 02:52:14 +0200 (CEST)
Received: from localhost ([::1]:38730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nox3t-0007Sv-OE
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 20:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nox1N-0005Kg-BO
 for qemu-devel@nongnu.org; Wed, 11 May 2022 20:49:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nox1K-0006rq-NH
 for qemu-devel@nongnu.org; Wed, 11 May 2022 20:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652316574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1c7B+cLf0ngBG8GErfdIcUmivlFcPdZ4CK8YgkwdHxw=;
 b=gAqhz5FdgYyZdCZfDdAS4aABEaiWi1JNRi3lDStS/t8+850+TQZYqR+wV2yX5e051o6AsT
 hSLolaxCWK/fVVDRlqgEv6mSsaM9ogqr+We1qFZIXzF6R1ksw/H/TOmSHsos+5MQwWcXCA
 YLQynurL46nuSjCwhOU8cUmdW8dU+30=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-nWS4HRSFNe-gB9eDUTLBJA-1; Wed, 11 May 2022 20:49:29 -0400
X-MC-Unique: nWS4HRSFNe-gB9eDUTLBJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFE3085A5BE;
 Thu, 12 May 2022 00:49:27 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.22.32.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73E731121314;
 Thu, 12 May 2022 00:49:27 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: v.sementsov-og@mail.ru, kwolf@redhat.com, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v4 1/2] qemu-nbd: Pass max connections to blockdev layer
Date: Wed, 11 May 2022 19:49:23 -0500
Message-Id: <20220512004924.417153-2-eblake@redhat.com>
In-Reply-To: <20220512004924.417153-1-eblake@redhat.com>
References: <20220512004924.417153-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
2.36.1


