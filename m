Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A972815FF
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 17:04:03 +0200 (CEST)
Received: from localhost ([::1]:53756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOMbK-0008Qk-0w
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 11:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMIJ-0001ol-LP
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMIH-0004a2-4x
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601649860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZdTgbWjqsdZNmRVMdGq5dSYtFGbool9a9phsYuSVZ9o=;
 b=byy6FlQIZvfvF/M/hyvoQxyjhYPSlC62HZs6/p72b/Dy0s/nuW5zwrxrPyoCJ3S0ZJc0rm
 Pp5It910OLJ4T1n1ET0nmVje+3GflAFw8mlMvo9ZdR/uE2BZDvhixkAezeLSkVWzbOLVyZ
 yjDJAT+rGLOlR/gmHEGThnemDCYZ3Dw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-y67zRyVkNDSqYOUXGOdwlA-1; Fri, 02 Oct 2020 10:44:14 -0400
X-MC-Unique: y67zRyVkNDSqYOUXGOdwlA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A838E192AB62;
 Fri,  2 Oct 2020 14:44:12 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-112-139.ams2.redhat.com
 [10.36.112.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3E7F5D9D3;
 Fri,  2 Oct 2020 14:44:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 15/37] qemu-nbd: Use blk_exp_add() to create the export
Date: Fri,  2 Oct 2020 16:43:23 +0200
Message-Id: <20201002144345.253865-16-kwolf@redhat.com>
In-Reply-To: <20201002144345.253865-1-kwolf@redhat.com>
References: <20201002144345.253865-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 01:13:31
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
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
Message-Id: <20200924152717.287415-12-kwolf@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
index abbed8f87e..fc6e68a797 100644
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


