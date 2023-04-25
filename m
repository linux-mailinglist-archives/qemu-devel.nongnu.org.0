Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EE36EE2DB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:23:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIX5-0000Ks-Qu; Tue, 25 Apr 2023 09:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVN-0006l5-Ga
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVG-0006bv-HK
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fhyni0yQP+q7GmZm9HRoi5upQSbmFq+MED/2LTroyrk=;
 b=FhhyDLfYufEjJMuvQSeuHyyVYdwoNF/Pp7Hf0s9BbDYw4Gi9h4wor4G23KuiE6x7GE8kWz
 JhOxVB1DMlVkmCtKDe0tMx0SvVjkJwiHKJLM6Q1t5tEi74/nxBJTUgzPg/SvoUY/pjRobn
 bRrJERo4kX5k+sHi8/3m6gtoCgLVX3E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-PZvUZbWOMvSixG_ojSK13A-1; Tue, 25 Apr 2023 09:14:22 -0400
X-MC-Unique: PZvUZbWOMvSixG_ojSK13A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 667B028135A3;
 Tue, 25 Apr 2023 13:14:22 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA68840C201F;
 Tue, 25 Apr 2023 13:14:21 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 19/25] nbd: mark more coroutine_fns, do not use co_wrappers
Date: Tue, 25 Apr 2023 15:13:53 +0200
Message-Id: <20230425131359.259007-20-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 nbd/server.c | 48 ++++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 4f5c42f84d..e239c2890f 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1409,8 +1409,8 @@ nbd_read_eof(NBDClient *client, void *buffer, size_t size, Error **errp)
     return 1;
 }
 
-static int nbd_receive_request(NBDClient *client, NBDRequest *request,
-                               Error **errp)
+static int coroutine_fn nbd_receive_request(NBDClient *client, NBDRequest *request,
+                                            Error **errp)
 {
     uint8_t buf[NBD_REQUEST_SIZE];
     uint32_t magic;
@@ -1893,12 +1893,12 @@ static inline void set_be_simple_reply(NBDSimpleReply *reply, uint64_t error,
     stq_be_p(&reply->handle, handle);
 }
 
-static int nbd_co_send_simple_reply(NBDClient *client,
-                                    uint64_t handle,
-                                    uint32_t error,
-                                    void *data,
-                                    size_t len,
-                                    Error **errp)
+static int coroutine_fn nbd_co_send_simple_reply(NBDClient *client,
+                                                 uint64_t handle,
+                                                 uint32_t error,
+                                                 void *data,
+                                                 size_t len,
+                                                 Error **errp)
 {
     NBDSimpleReply reply;
     int nbd_err = system_errno_to_nbd_errno(error);
@@ -2036,8 +2036,8 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
             stl_be_p(&chunk.length, pnum);
             ret = nbd_co_send_iov(client, iov, 1, errp);
         } else {
-            ret = blk_pread(exp->common.blk, offset + progress, pnum,
-                            data + progress, 0);
+            ret = blk_co_pread(exp->common.blk, offset + progress, pnum,
+                               data + progress, 0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret, "reading from file failed");
                 break;
@@ -2196,9 +2196,9 @@ static int coroutine_fn blockalloc_to_extents(BlockBackend *blk,
  * @ea is converted to BE by the function
  * @last controls whether NBD_REPLY_FLAG_DONE is sent.
  */
-static int nbd_co_send_extents(NBDClient *client, uint64_t handle,
-                               NBDExtentArray *ea,
-                               bool last, uint32_t context_id, Error **errp)
+static int coroutine_fn
+nbd_co_send_extents(NBDClient *client, uint64_t handle, NBDExtentArray *ea,
+                    bool last, uint32_t context_id, Error **errp)
 {
     NBDStructuredMeta chunk;
     struct iovec iov[] = {
@@ -2275,10 +2275,10 @@ static void bitmap_to_extents(BdrvDirtyBitmap *bitmap,
     bdrv_dirty_bitmap_unlock(bitmap);
 }
 
-static int nbd_co_send_bitmap(NBDClient *client, uint64_t handle,
-                              BdrvDirtyBitmap *bitmap, uint64_t offset,
-                              uint32_t length, bool dont_fragment, bool last,
-                              uint32_t context_id, Error **errp)
+static int coroutine_fn nbd_co_send_bitmap(NBDClient *client, uint64_t handle,
+                                           BdrvDirtyBitmap *bitmap, uint64_t offset,
+                                           uint32_t length, bool dont_fragment, bool last,
+                                           uint32_t context_id, Error **errp)
 {
     unsigned int nb_extents = dont_fragment ? 1 : NBD_MAX_BLOCK_STATUS_EXTENTS;
     g_autoptr(NBDExtentArray) ea = nbd_extent_array_new(nb_extents);
@@ -2295,8 +2295,8 @@ static int nbd_co_send_bitmap(NBDClient *client, uint64_t handle,
  * to the client (although the caller may still need to disconnect after
  * reporting the error).
  */
-static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
-                                  Error **errp)
+static int coroutine_fn nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
+                                               Error **errp)
 {
     NBDClient *client = req->client;
     int valid_flags;
@@ -2444,7 +2444,7 @@ static coroutine_fn int nbd_do_cmd_read(NBDClient *client, NBDRequest *request,
                                        data, request->len, errp);
     }
 
-    ret = blk_pread(exp->common.blk, request->from, request->len, data, 0);
+    ret = blk_co_pread(exp->common.blk, request->from, request->len, data, 0);
     if (ret < 0) {
         return nbd_send_generic_reply(client, request->handle, ret,
                                       "reading from file failed", errp);
@@ -2511,8 +2511,8 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
         if (request->flags & NBD_CMD_FLAG_FUA) {
             flags |= BDRV_REQ_FUA;
         }
-        ret = blk_pwrite(exp->common.blk, request->from, request->len, data,
-                         flags);
+        ret = blk_co_pwrite(exp->common.blk, request->from, request->len, data,
+                            flags);
         return nbd_send_generic_reply(client, request->handle, ret,
                                       "writing to file failed", errp);
 
@@ -2527,8 +2527,8 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
         if (request->flags & NBD_CMD_FLAG_FAST_ZERO) {
             flags |= BDRV_REQ_NO_FALLBACK;
         }
-        ret = blk_pwrite_zeroes(exp->common.blk, request->from, request->len,
-                                flags);
+        ret = blk_co_pwrite_zeroes(exp->common.blk, request->from, request->len,
+                                   flags);
         return nbd_send_generic_reply(client, request->handle, ret,
                                       "writing to file failed", errp);
 
-- 
2.40.0


