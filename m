Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734F2260477
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 20:24:14 +0200 (CEST)
Received: from localhost ([::1]:45144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLoL-0002I2-Ct
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 14:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLky-0004xT-2y
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:20:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54222
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLkr-0004SX-TI
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:20:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599502835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iHxPf4E6nv7ka0kIDLdkyKT+jqwegwlf8eihiZP8g1Q=;
 b=Ur+Rcv2OakffbI4jwfO11lJqtBwqr1goLa7mmb20GXHCLCq6wuzT2Wxgu4Jm1xq820wTrn
 npW03AM71OfAFLBOm5j05h/rsBnwxTVnFm6jxEDTl8XNhMwL3vO7leVxO9XMKj2fYdFYrB
 yf15oAX8T9vimDbNjUQP9vF7gj0Q30Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-G7lL6fLzOTGqRP_Av18Wvw-1; Mon, 07 Sep 2020 14:20:34 -0400
X-MC-Unique: G7lL6fLzOTGqRP_Av18Wvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39A83393B1;
 Mon,  7 Sep 2020 18:20:33 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 187E360BF3;
 Mon,  7 Sep 2020 18:20:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 06/29] qemu-nbd: Use raw block driver for --offset
Date: Mon,  7 Sep 2020 20:19:48 +0200
Message-Id: <20200907182011.521007-7-kwolf@redhat.com>
In-Reply-To: <20200907182011.521007-1-kwolf@redhat.com>
References: <20200907182011.521007-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:19:10
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

Instead of implementing qemu-nbd --offset in the NBD code, just put a
raw block node with the requested offset on top of the user image and
rely on that doing the job.

This does not only simplify the nbd_export_new() interface and bring it
closer to the set of options that the nbd-server-add QMP command offers,
but in fact it also eliminates a potential source for bugs in the NBD
code which previously had to add the offset manually in all relevant
places.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h |  4 ++--
 blockdev-nbd.c      |  9 +--------
 nbd/server.c        | 33 ++++++++++++++++-----------------
 qemu-nbd.c          | 27 ++++++++++++---------------
 4 files changed, 31 insertions(+), 42 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 7698453fb2..451f399b0a 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -331,8 +331,8 @@ typedef struct NBDExport NBDExport;
 typedef struct NBDClient NBDClient;
 
 BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp);
-NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
-                          uint64_t size, const char *name, const char *desc,
+NBDExport *nbd_export_new(BlockDriverState *bs,
+                          const char *name, const char *desc,
                           const char *bitmap, bool readonly, bool shared,
                           void (*close)(NBDExport *), bool writethrough,
                           BlockBackend *on_eject_blk, Error **errp);
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 47b04f166a..96cb0100e9 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -154,7 +154,6 @@ BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
     BlockDriverState *bs = NULL;
     BlockBackend *on_eject_blk;
     NBDExport *exp = NULL;
-    int64_t len;
     AioContext *aio_context;
 
     assert(exp_args->type == BLOCK_EXPORT_TYPE_NBD);
@@ -192,12 +191,6 @@ BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
 
     aio_context = bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
-    len = bdrv_getlength(bs);
-    if (len < 0) {
-        error_setg_errno(errp, -len,
-                         "Failed to determine the NBD export's length");
-        goto out;
-    }
 
     if (!arg->has_writable) {
         arg->writable = false;
@@ -206,7 +199,7 @@ BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
         arg->writable = false;
     }
 
-    exp = nbd_export_new(bs, 0, len, arg->name, arg->description, arg->bitmap,
+    exp = nbd_export_new(bs, arg->name, arg->description, arg->bitmap,
                          !arg->writable, !arg->writable,
                          NULL, false, on_eject_blk, errp);
     if (!exp) {
diff --git a/nbd/server.c b/nbd/server.c
index f5af93c253..33aaca918c 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -89,7 +89,6 @@ struct NBDExport {
     BlockBackend *blk;
     char *name;
     char *description;
-    uint64_t dev_offset;
     uint64_t size;
     uint16_t nbdflags;
     QTAILQ_HEAD(, NBDClient) clients;
@@ -1507,8 +1506,8 @@ static void nbd_eject_notifier(Notifier *n, void *data)
     aio_context_release(aio_context);
 }
 
-NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
-                          uint64_t size, const char *name, const char *desc,
+NBDExport *nbd_export_new(BlockDriverState *bs,
+                          const char *name, const char *desc,
                           const char *bitmap, bool readonly, bool shared,
                           void (*close)(NBDExport *), bool writethrough,
                           BlockBackend *on_eject_blk, Error **errp)
@@ -1516,9 +1515,17 @@ NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
     AioContext *ctx;
     BlockBackend *blk;
     NBDExport *exp;
+    int64_t size;
     uint64_t perm;
     int ret;
 
+    size = bdrv_getlength(bs);
+    if (size < 0) {
+        error_setg_errno(errp, -size,
+                         "Failed to determine the NBD export's length");
+        return NULL;
+    }
+
     exp = g_new0(NBDExport, 1);
     exp->common = (BlockExport) {
         .drv = &blk_exp_nbd,
@@ -1553,8 +1560,6 @@ NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
     exp->refcount = 1;
     QTAILQ_INIT(&exp->clients);
     exp->blk = blk;
-    assert(dev_offset <= INT64_MAX);
-    exp->dev_offset = dev_offset;
     exp->name = g_strdup(name);
     assert(!desc || strlen(desc) <= NBD_MAX_STRING_SIZE);
     exp->description = g_strdup(desc);
@@ -1569,7 +1574,6 @@ NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
         exp->nbdflags |= (NBD_FLAG_SEND_TRIM | NBD_FLAG_SEND_WRITE_ZEROES |
                           NBD_FLAG_SEND_FAST_ZERO);
     }
-    assert(size <= INT64_MAX - dev_offset);
     exp->size = QEMU_ALIGN_DOWN(size, BDRV_SECTOR_SIZE);
 
     if (bitmap) {
@@ -1928,8 +1932,7 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
             stl_be_p(&chunk.length, pnum);
             ret = nbd_co_send_iov(client, iov, 1, errp);
         } else {
-            ret = blk_pread(exp->blk, offset + progress + exp->dev_offset,
-                            data + progress, pnum);
+            ret = blk_pread(exp->blk, offset + progress, data + progress, pnum);
             if (ret < 0) {
                 error_setg_errno(errp, -ret, "reading from file failed");
                 break;
@@ -2303,8 +2306,7 @@ static coroutine_fn int nbd_do_cmd_read(NBDClient *client, NBDRequest *request,
                                        data, request->len, errp);
     }
 
-    ret = blk_pread(exp->blk, request->from + exp->dev_offset, data,
-                    request->len);
+    ret = blk_pread(exp->blk, request->from, data, request->len);
     if (ret < 0) {
         return nbd_send_generic_reply(client, request->handle, ret,
                                       "reading from file failed", errp);
@@ -2339,7 +2341,7 @@ static coroutine_fn int nbd_do_cmd_cache(NBDClient *client, NBDRequest *request,
 
     assert(request->type == NBD_CMD_CACHE);
 
-    ret = blk_co_preadv(exp->blk, request->from + exp->dev_offset, request->len,
+    ret = blk_co_preadv(exp->blk, request->from, request->len,
                         NULL, BDRV_REQ_COPY_ON_READ | BDRV_REQ_PREFETCH);
 
     return nbd_send_generic_reply(client, request->handle, ret,
@@ -2370,8 +2372,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
         if (request->flags & NBD_CMD_FLAG_FUA) {
             flags |= BDRV_REQ_FUA;
         }
-        ret = blk_pwrite(exp->blk, request->from + exp->dev_offset,
-                         data, request->len, flags);
+        ret = blk_pwrite(exp->blk, request->from, data, request->len, flags);
         return nbd_send_generic_reply(client, request->handle, ret,
                                       "writing to file failed", errp);
 
@@ -2392,8 +2393,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
             int align = client->check_align ?: 1;
             int len = MIN(request->len, QEMU_ALIGN_DOWN(BDRV_REQUEST_MAX_BYTES,
                                                         align));
-            ret = blk_pwrite_zeroes(exp->blk, request->from + exp->dev_offset,
-                                    len, flags);
+            ret = blk_pwrite_zeroes(exp->blk, request->from, len, flags);
             request->len -= len;
             request->from += len;
         }
@@ -2416,8 +2416,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
             int align = client->check_align ?: 1;
             int len = MIN(request->len, QEMU_ALIGN_DOWN(BDRV_REQUEST_MAX_BYTES,
                                                         align));
-            ret = blk_co_pdiscard(exp->blk, request->from + exp->dev_offset,
-                                  len);
+            ret = blk_co_pdiscard(exp->blk, request->from, len);
             request->len -= len;
             request->from += len;
         }
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 33476a1000..1752daa4c4 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -524,7 +524,6 @@ int main(int argc, char **argv)
     const char *port = NULL;
     char *sockpath = NULL;
     char *device = NULL;
-    int64_t fd_size;
     QemuOpts *sn_opts = NULL;
     const char *sn_id_or_name = NULL;
     const char *sopt = "hVb:o:p:rsnc:dvk:e:f:tl:x:T:D:B:L";
@@ -1037,6 +1036,17 @@ int main(int argc, char **argv)
     }
     bs = blk_bs(blk);
 
+    if (dev_offset) {
+        QDict *raw_opts = qdict_new();
+        qdict_put_str(raw_opts, "driver", "raw");
+        qdict_put_str(raw_opts, "file", bs->node_name);
+        qdict_put_int(raw_opts, "offset", dev_offset);
+        bs = bdrv_open(NULL, NULL, raw_opts, flags, &error_fatal);
+        blk_remove_bs(blk);
+        blk_insert_bs(blk, bs, &error_fatal);
+        bdrv_unref(bs);
+    }
+
     blk_set_enable_write_cache(blk, !writethrough);
 
     if (sn_opts) {
@@ -1054,21 +1064,8 @@ int main(int argc, char **argv)
     }
 
     bs->detect_zeroes = detect_zeroes;
-    fd_size = blk_getlength(blk);
-    if (fd_size < 0) {
-        error_report("Failed to determine the image length: %s",
-                     strerror(-fd_size));
-        exit(EXIT_FAILURE);
-    }
-
-    if (dev_offset >= fd_size) {
-        error_report("Offset (%" PRIu64 ") has to be smaller than the image "
-                     "size (%" PRId64 ")", dev_offset, fd_size);
-        exit(EXIT_FAILURE);
-    }
-    fd_size -= dev_offset;
 
-    export = nbd_export_new(bs, dev_offset, fd_size, export_name,
+    export = nbd_export_new(bs, export_name,
                             export_description, bitmap, readonly, shared > 1,
                             nbd_export_closed, writethrough, NULL,
                             &error_fatal);
-- 
2.25.4


