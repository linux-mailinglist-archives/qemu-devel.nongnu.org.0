Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD8926047B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 20:25:55 +0200 (CEST)
Received: from localhost ([::1]:53642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLpy-0005g2-Q7
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 14:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLl7-0005Hg-4N
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:20:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26872
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLkx-0004U3-Eo
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599502842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=798l8+hFqVoamxgVw7ZgCRsaMCCCrno9HHmFjmK7mOM=;
 b=b6fFqxWFjmmQUVK3wXLK/RrZrsxBnhJzcUEskuaW3CcT61yU6oCXkoCDOtzMS3vIJ2BGZu
 MaqXd95uWL7t/dozQWXT/jVFmyXaM0sfrGrCBfV0AYV9mSKaoYtMgU+oqcqAK6K2NvtY26
 RUyT1ysp5us328VFhoYoeCbcLGVrSLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-dkhMTY0HM9OZf1F6ug1bHw-1; Mon, 07 Sep 2020 14:20:41 -0400
X-MC-Unique: dkhMTY0HM9OZf1F6ug1bHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B2AF1084C85;
 Mon,  7 Sep 2020 18:20:40 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 336EB60BF3;
 Mon,  7 Sep 2020 18:20:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 11/29] qemu-nbd: Use blk_exp_add() to create the export
Date: Mon,  7 Sep 2020 20:19:53 +0200
Message-Id: <20200907182011.521007-12-kwolf@redhat.com>
In-Reply-To: <20200907182011.521007-1-kwolf@redhat.com>
References: <20200907182011.521007-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 02:54:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With this change, NBD exports are now only created through the
BlockExport interface. This allows us finally to move things from the
NBD layer to the BlockExport layer if they make sense for other export
types, too.

blk_exp_add() returns only a weak reference, so the explicit
nbd_export_put() goes away.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/nbd.h |  1 +
 blockdev-nbd.c      |  8 +++++++-
 qemu-nbd.c          | 28 ++++++++++++++++++++++------
 3 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 9449b3dac4..1dafe70615 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -352,6 +352,7 @@ void nbd_client_new(QIOChannelSocket *sioc,
 void nbd_client_get(NBDClient *client);
 void nbd_client_put(NBDClient *client);
 
+void nbd_server_is_qemu_nbd(bool value);
 void nbd_server_start(SocketAddress *addr, const char *tls_creds,
                       const char *tls_authz, uint32_t max_connections,
                       Error **errp);
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 3a51b3e792..7bb0b09697 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -28,9 +28,15 @@ typedef struct NBDServerData {
 } NBDServerData;
 
 static NBDServerData *nbd_server;
+static bool is_qemu_nbd;
 
 static void nbd_update_server_watch(NBDServerData *s);
 
+void nbd_server_is_qemu_nbd(bool value)
+{
+    is_qemu_nbd = value;
+}
+
 static void nbd_blockdev_client_closed(NBDClient *client, bool ignored)
 {
     nbd_client_put(client);
@@ -176,7 +182,7 @@ BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
 
     assert(exp_args->type == BLOCK_EXPORT_TYPE_NBD);
 
-    if (!nbd_server) {
+    if (!nbd_server && !is_qemu_nbd) {
         error_setg(errp, "NBD server not running");
         return NULL;
     }
diff --git a/qemu-nbd.c b/qemu-nbd.c
index cab65529a5..a863741e8f 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -65,7 +65,6 @@
 
 #define MBR_SIZE 512
 
-static NBDExport *export;
 static int verbose;
 static char *srcpath;
 static SocketAddress *saddr;
@@ -580,6 +579,7 @@ int main(int argc, char **argv)
     int old_stderr = -1;
     unsigned socket_activation;
     const char *pid_file_name = NULL;
+    BlockExportOptions *export_opts;
 
 #if HAVE_NBD_DEVICE
     /* The client thread uses SIGTERM to interrupt the server.  A signal
@@ -1059,9 +1059,27 @@ int main(int argc, char **argv)
 
     bs->detect_zeroes = detect_zeroes;
 
-    export = nbd_export_new(bs, export_name,
-                            export_description, bitmap, readonly, shared > 1,
-                            writethrough, &error_fatal);
+    nbd_server_is_qemu_nbd(true);
+
+    export_opts = g_new(BlockExportOptions, 1);
+    *export_opts = (BlockExportOptions) {
+        .type               = BLOCK_EXPORT_TYPE_NBD,
+        .has_writethrough   = true,
+        .writethrough       = writethrough,
+        .u.nbd = {
+            .device             = g_strdup(bdrv_get_node_name(bs)),
+            .has_name           = true,
+            .name               = g_strdup(export_name),
+            .has_description    = !!export_description,
+            .description        = g_strdup(export_description),
+            .has_writable       = true,
+            .writable           = !readonly,
+            .has_bitmap         = !!bitmap,
+            .bitmap             = g_strdup(bitmap),
+        },
+    };
+    blk_exp_add(export_opts, &error_fatal);
+    qapi_free_BlockExportOptions(export_opts);
 
     if (device) {
 #if HAVE_NBD_DEVICE
@@ -1101,9 +1119,7 @@ int main(int argc, char **argv)
     do {
         main_loop_wait(false);
         if (state == TERMINATE) {
-            nbd_export_put(export);
             nbd_export_close_all();
-            export = NULL;
             state = TERMINATED;
         }
     } while (state != TERMINATED);
-- 
2.25.4


