Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC0C6FDDAB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:23:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwiq6-0003Y3-VC; Wed, 10 May 2023 08:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipZ-0002TY-65
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:22:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipV-0007mQ-M6
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FGDsBO0hzAObUWgVBgpsrbM4FoKiPkMCuG+mecsfQE=;
 b=cqgUBFQKzZQpPC2IK9I109qk7vmZJNzhyQ56cmH+1u8x457PxJ2U1rj2TMIzbA5Az0Q9aJ
 yL/yPQRxqLHvZCLQuAdhZFHuZhWmFEPGRa0wb09bMtz01aiuFWUcKQN9YAoT1/3g4BSzmP
 AQpU5P1a2GOEaUMMBCQdFTDAgCNT5aI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-fqjPpu0hMTeG9l4ecJX2Pw-1; Wed, 10 May 2023 08:21:53 -0400
X-MC-Unique: fqjPpu0hMTeG9l4ecJX2Pw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D661281295A;
 Wed, 10 May 2023 12:21:53 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C32E163F8B;
 Wed, 10 May 2023 12:21:52 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 17/28] nbd: Mark nbd_co_do_establish_connection() and callers
 GRAPH_RDLOCK
Date: Wed, 10 May 2023 14:21:00 +0200
Message-Id: <20230510122111.46566-18-kwolf@redhat.com>
In-Reply-To: <20230510122111.46566-1-kwolf@redhat.com>
References: <20230510122111.46566-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

This adds GRAPH_RDLOCK annotations to declare that callers of
nbd_co_do_establish_connection() need to hold a reader lock for the
graph.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230504115750.54437-11-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/coroutines.h |  5 +++--
 block/nbd.c        | 39 +++++++++++++++++++++------------------
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index dd9f3d449b..f3226682d6 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -61,7 +61,7 @@ bdrv_co_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 int coroutine_fn GRAPH_RDLOCK
 bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 
-int coroutine_fn
+int coroutine_fn GRAPH_RDLOCK
 nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
                                Error **errp);
 
@@ -85,7 +85,8 @@ bdrv_common_block_status_above(BlockDriverState *bs,
                                int64_t *map,
                                BlockDriverState **file,
                                int *depth);
-int co_wrapper_mixed
+
+int co_wrapper_mixed_bdrv_rdlock
 nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 
 #endif /* BLOCK_COROUTINES_H */
diff --git a/block/nbd.c b/block/nbd.c
index d3ee256844..a3f8f8a9d5 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -322,6 +322,7 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
     int ret;
     IO_CODE();
 
+    assert_bdrv_graph_readable();
     assert(!s->ioc);
 
     s->ioc = nbd_co_establish_connection(s->conn, &s->info, blocking, errp);
@@ -369,7 +370,7 @@ static bool nbd_client_connecting(BDRVNBDState *s)
 }
 
 /* Called with s->requests_lock taken.  */
-static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
+static void coroutine_fn GRAPH_RDLOCK nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
     bool blocking = s->state == NBD_CLIENT_CONNECTING_WAIT;
@@ -480,9 +481,9 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
     }
 }
 
-static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
-                                            NBDRequest *request,
-                                            QEMUIOVector *qiov)
+static int coroutine_fn GRAPH_RDLOCK
+nbd_co_send_request(BlockDriverState *bs, NBDRequest *request,
+                    QEMUIOVector *qiov)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int rc, i = -1;
@@ -1171,8 +1172,9 @@ static int coroutine_fn nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
     return iter.ret;
 }
 
-static int coroutine_fn nbd_co_request(BlockDriverState *bs, NBDRequest *request,
-                                       QEMUIOVector *write_qiov)
+static int coroutine_fn GRAPH_RDLOCK
+nbd_co_request(BlockDriverState *bs, NBDRequest *request,
+               QEMUIOVector *write_qiov)
 {
     int ret, request_ret;
     Error *local_err = NULL;
@@ -1208,9 +1210,9 @@ static int coroutine_fn nbd_co_request(BlockDriverState *bs, NBDRequest *request
     return ret ? ret : request_ret;
 }
 
-static int coroutine_fn nbd_client_co_preadv(BlockDriverState *bs, int64_t offset,
-                                             int64_t bytes, QEMUIOVector *qiov,
-                                             BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+nbd_client_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                     QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int ret, request_ret;
     Error *local_err = NULL;
@@ -1266,9 +1268,9 @@ static int coroutine_fn nbd_client_co_preadv(BlockDriverState *bs, int64_t offse
     return ret ? ret : request_ret;
 }
 
-static int coroutine_fn nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
-                                              int64_t bytes, QEMUIOVector *qiov,
-                                              BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                      QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
@@ -1291,8 +1293,9 @@ static int coroutine_fn nbd_client_co_pwritev(BlockDriverState *bs, int64_t offs
     return nbd_co_request(bs, &request, qiov);
 }
 
-static int coroutine_fn nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
-                                                    int64_t bytes, BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                            BdrvRequestFlags flags)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
@@ -1326,7 +1329,7 @@ static int coroutine_fn nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_
     return nbd_co_request(bs, &request, NULL);
 }
 
-static int coroutine_fn nbd_client_co_flush(BlockDriverState *bs)
+static int coroutine_fn GRAPH_RDLOCK nbd_client_co_flush(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = { .type = NBD_CMD_FLUSH };
@@ -1341,8 +1344,8 @@ static int coroutine_fn nbd_client_co_flush(BlockDriverState *bs)
     return nbd_co_request(bs, &request, NULL);
 }
 
-static int coroutine_fn nbd_client_co_pdiscard(BlockDriverState *bs, int64_t offset,
-                                               int64_t bytes)
+static int coroutine_fn GRAPH_RDLOCK
+nbd_client_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
@@ -1361,7 +1364,7 @@ static int coroutine_fn nbd_client_co_pdiscard(BlockDriverState *bs, int64_t off
     return nbd_co_request(bs, &request, NULL);
 }
 
-static int coroutine_fn nbd_client_co_block_status(
+static int coroutine_fn GRAPH_RDLOCK nbd_client_co_block_status(
         BlockDriverState *bs, bool want_zero, int64_t offset, int64_t bytes,
         int64_t *pnum, int64_t *map, BlockDriverState **file)
 {
-- 
2.40.1


