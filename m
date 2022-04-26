Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4383C510A5D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:23:05 +0200 (CEST)
Received: from localhost ([::1]:34440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRiC-00066B-CX
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRap-0008J5-0W
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRan-0007fv-12
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651004124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GyKFRQl8K+vCh2wHyoKF/XUWbtVjAWreTLvYFs7nIvk=;
 b=MnhRJfjUxiWJn3hhg5cHBryfkshBb3SphxUudKs4ZvkYY0o93qQ8sJkjEfMj6S4XFjfP1o
 9Qif4Jb85S16UXCSDvpO/Ssaa6y+IvNdSyArxN5u7OeC+A1MtZ/S+YV8aGbfZdjM5Lgpe2
 KFy2qfO1k13Tb+On6asG+UmcevsH4F4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-OTAbCjaMMZ-UxqlsTPARhA-1; Tue, 26 Apr 2022 16:15:22 -0400
X-MC-Unique: OTAbCjaMMZ-UxqlsTPARhA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B405833969;
 Tue, 26 Apr 2022 20:15:22 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B43C9556200;
 Tue, 26 Apr 2022 20:15:21 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/13] nbd: mark more coroutine_fns
Date: Tue, 26 Apr 2022 15:15:06 -0500
Message-Id: <20220426201514.170410-6-eblake@redhat.com>
In-Reply-To: <20220426201514.170410-1-eblake@redhat.com>
References: <20220426201514.170410-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Several coroutine functions in block/nbd.c are not marked as such.  This
patch adds a few more markers; it is not exhaustive, but it focuses
especially on:

- places that wake other coroutines, because aio_co_wake() has very
different semantics inside a coroutine (queuing after yield vs. entering
immediately);

- functions with _co_ in their names, to avoid confusion

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220414175756.671165-3-pbonzini@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 64 ++++++++++++++++++++++++++---------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 1f9716094924..3a6e60920304 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -132,7 +132,7 @@ static bool nbd_client_connected(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED;
 }

-static bool nbd_recv_coroutine_wake_one(NBDClientRequest *req)
+static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)
 {
     if (req->receiving) {
         req->receiving = false;
@@ -143,7 +143,7 @@ static bool nbd_recv_coroutine_wake_one(NBDClientRequest *req)
     return false;
 }

-static void nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
+static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
 {
     int i;

@@ -154,7 +154,7 @@ static void nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
     }
 }

-static void nbd_channel_error(BDRVNBDState *s, int ret)
+static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
 {
     if (nbd_client_connected(s)) {
         qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
@@ -466,9 +466,9 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
     }
 }

-static int nbd_co_send_request(BlockDriverState *bs,
-                               NBDRequest *request,
-                               QEMUIOVector *qiov)
+static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
+                                            NBDRequest *request,
+                                            QEMUIOVector *qiov)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int rc, i = -1;
@@ -721,9 +721,9 @@ static int nbd_parse_error_payload(NBDStructuredReplyChunk *chunk,
     return 0;
 }

-static int nbd_co_receive_offset_data_payload(BDRVNBDState *s,
-                                              uint64_t orig_offset,
-                                              QEMUIOVector *qiov, Error **errp)
+static int coroutine_fn
+nbd_co_receive_offset_data_payload(BDRVNBDState *s, uint64_t orig_offset,
+                                   QEMUIOVector *qiov, Error **errp)
 {
     QEMUIOVector sub_qiov;
     uint64_t offset;
@@ -1039,8 +1039,8 @@ break_loop:
     return false;
 }

-static int nbd_co_receive_return_code(BDRVNBDState *s, uint64_t handle,
-                                      int *request_ret, Error **errp)
+static int coroutine_fn nbd_co_receive_return_code(BDRVNBDState *s, uint64_t handle,
+                                                   int *request_ret, Error **errp)
 {
     NBDReplyChunkIter iter;

@@ -1053,9 +1053,9 @@ static int nbd_co_receive_return_code(BDRVNBDState *s, uint64_t handle,
     return iter.ret;
 }

-static int nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t handle,
-                                        uint64_t offset, QEMUIOVector *qiov,
-                                        int *request_ret, Error **errp)
+static int coroutine_fn nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t handle,
+                                                     uint64_t offset, QEMUIOVector *qiov,
+                                                     int *request_ret, Error **errp)
 {
     NBDReplyChunkIter iter;
     NBDReply reply;
@@ -1105,10 +1105,10 @@ static int nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t handle,
     return iter.ret;
 }

-static int nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
-                                            uint64_t handle, uint64_t length,
-                                            NBDExtent *extent,
-                                            int *request_ret, Error **errp)
+static int coroutine_fn nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
+                                                         uint64_t handle, uint64_t length,
+                                                         NBDExtent *extent,
+                                                         int *request_ret, Error **errp)
 {
     NBDReplyChunkIter iter;
     NBDReply reply;
@@ -1165,8 +1165,8 @@ static int nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
     return iter.ret;
 }

-static int nbd_co_request(BlockDriverState *bs, NBDRequest *request,
-                          QEMUIOVector *write_qiov)
+static int coroutine_fn nbd_co_request(BlockDriverState *bs, NBDRequest *request,
+                                       QEMUIOVector *write_qiov)
 {
     int ret, request_ret;
     Error *local_err = NULL;
@@ -1202,9 +1202,9 @@ static int nbd_co_request(BlockDriverState *bs, NBDRequest *request,
     return ret ? ret : request_ret;
 }

-static int nbd_client_co_preadv(BlockDriverState *bs, int64_t offset,
-                                int64_t bytes, QEMUIOVector *qiov,
-                                BdrvRequestFlags flags)
+static int coroutine_fn nbd_client_co_preadv(BlockDriverState *bs, int64_t offset,
+                                             int64_t bytes, QEMUIOVector *qiov,
+                                             BdrvRequestFlags flags)
 {
     int ret, request_ret;
     Error *local_err = NULL;
@@ -1261,9 +1261,9 @@ static int nbd_client_co_preadv(BlockDriverState *bs, int64_t offset,
     return ret ? ret : request_ret;
 }

-static int nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
-                                 int64_t bytes, QEMUIOVector *qiov,
-                                 BdrvRequestFlags flags)
+static int coroutine_fn nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                              int64_t bytes, QEMUIOVector *qiov,
+                                              BdrvRequestFlags flags)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
@@ -1286,8 +1286,8 @@ static int nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
     return nbd_co_request(bs, &request, qiov);
 }

-static int nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
-                                       int64_t bytes, BdrvRequestFlags flags)
+static int coroutine_fn nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
+                                                    int64_t bytes, BdrvRequestFlags flags)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
@@ -1321,7 +1321,7 @@ static int nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
     return nbd_co_request(bs, &request, NULL);
 }

-static int nbd_client_co_flush(BlockDriverState *bs)
+static int coroutine_fn nbd_client_co_flush(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = { .type = NBD_CMD_FLUSH };
@@ -1336,8 +1336,8 @@ static int nbd_client_co_flush(BlockDriverState *bs)
     return nbd_co_request(bs, &request, NULL);
 }

-static int nbd_client_co_pdiscard(BlockDriverState *bs, int64_t offset,
-                                  int64_t bytes)
+static int coroutine_fn nbd_client_co_pdiscard(BlockDriverState *bs, int64_t offset,
+                                               int64_t bytes)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
@@ -1913,7 +1913,7 @@ fail:
     return ret;
 }

-static int nbd_co_flush(BlockDriverState *bs)
+static int coroutine_fn nbd_co_flush(BlockDriverState *bs)
 {
     return nbd_client_co_flush(bs);
 }
-- 
2.35.1


