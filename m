Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05E66B1E8B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:46:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBtj-0000K7-Mg; Thu, 09 Mar 2023 03:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBte-0000Fk-Qw
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBtc-000084-Pd
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678351508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bm3j+ihvykJD0T4aa+ZsDucFY/2h63RFgZiBe6mcrsc=;
 b=FVzs9seamjPXiNr25XsEpNU0dlE3BO/fLqScorgRg9ptckG4PYHcdy0xpk2qJjb/eV0S8v
 uVQh2PyxZUWaogPl6xh2D5wTEP05jxAPFa419TD52fMYaoHMVmpfv7NzeQ9/s+1FSKg2aT
 IslXQNwxnJROlCpPBNO5OQdbMUVIX8g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-xv7470mRMgC8oyzl9Yc7Rg-1; Thu, 09 Mar 2023 03:45:06 -0500
X-MC-Unique: xv7470mRMgC8oyzl9Yc7Rg-1
Received: by mail-ed1-f72.google.com with SMTP id
 ec11-20020a0564020d4b00b004e2cb85c8bcso1874440edb.16
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bm3j+ihvykJD0T4aa+ZsDucFY/2h63RFgZiBe6mcrsc=;
 b=WcSGdPaES/xQ0XY7Pup9qromRa/vp0dEd8yFv4RJBd48tMu7JbyFtTSxrkKObQnB65
 pNBcmwrq6Y65KDGiqyYqQoQUSTNdTSrLp5jyrWuuGUAAWnYEC5v69qylfxszK+p98wTk
 u+ifRV0/larlzdZiyEXQo1QrABqvyfovdFI3/SCtLX7fkREexqGbpv1sFWWGt3FlQJYH
 Tj2qzHoqCwySVCJYXJwAYXj4LVL4/IV/jdOkZCDbKGhlLKlZEWgd/RXxyOlZdBvMYSu1
 CG+Kq1nIeVKz0YZfDhxXbBxgRteetxbLZiBZFbq4vN8Fmu7UB6vhdaDShN6BDM3MyMnq
 skNQ==
X-Gm-Message-State: AO0yUKVlMGl3X7YdBovfg0xbhMDVxlkwts1M9kwsfePgl+7c6gOUJDd+
 QNQ/pfGwux4flhtsqFIfSWlMQqkUzg+l+23nC64ldH4ikF9Mpqbp+a2OUuX5vw8zo0ok+5YW1p+
 eltV7qT73MwbdmwE6xva6LzXrB75EjYSuIAc+5JZxJJ5OCn4y/mLHjK2N5I/LMpUZ3m8/zM5rgj
 4=
X-Received: by 2002:aa7:c589:0:b0:4af:6e08:319 with SMTP id
 g9-20020aa7c589000000b004af6e080319mr25220114edq.15.1678351504529; 
 Thu, 09 Mar 2023 00:45:04 -0800 (PST)
X-Google-Smtp-Source: AK7set+QQFrlxCsWYfm8HWluD7izv+UjbTGA0C4Ne+jCDcYHlS9r6JBio8Kx6ZkkGJyxb3+uCks9KQ==
X-Received: by 2002:aa7:c589:0:b0:4af:6e08:319 with SMTP id
 g9-20020aa7c589000000b004af6e080319mr25220105edq.15.1678351504228; 
 Thu, 09 Mar 2023 00:45:04 -0800 (PST)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a1709066dd600b008e6bd130b14sm8606891ejt.64.2023.03.09.00.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:45:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 4/9] nbd: mark more coroutine_fns, do not use co_wrappers
Date: Thu,  9 Mar 2023 09:44:51 +0100
Message-Id: <20230309084456.304669-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309084456.304669-1-pbonzini@redhat.com>
References: <20230309084456.304669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 nbd/server.c | 48 ++++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index a4750e41880a..6f5fcade2a54 100644
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
@@ -1895,12 +1895,12 @@ static inline void set_be_simple_reply(NBDSimpleReply *reply, uint64_t error,
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
@@ -2038,8 +2038,8 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
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
@@ -2198,9 +2198,9 @@ static int coroutine_fn blockalloc_to_extents(BlockBackend *blk,
  * @ea is converted to BE by the function
  * @last controls whether NBD_REPLY_FLAG_DONE is sent.
  */
-static int nbd_co_send_extents(NBDClient *client, uint64_t handle,
-                               NBDExtentArray *ea,
-                               bool last, uint32_t context_id, Error **errp)
+static int coroutine_fn nbd_co_send_extents(NBDClient *client, uint64_t handle,
+                                            NBDExtentArray *ea,
+                               bool              last, uint32_t context_id, Error **errp)
 {
     NBDStructuredMeta chunk;
     struct iovec iov[] = {
@@ -2277,10 +2277,10 @@ static void bitmap_to_extents(BdrvDirtyBitmap *bitmap,
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
@@ -2297,8 +2297,8 @@ static int nbd_co_send_bitmap(NBDClient *client, uint64_t handle,
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
@@ -2446,7 +2446,7 @@ static coroutine_fn int nbd_do_cmd_read(NBDClient *client, NBDRequest *request,
                                        data, request->len, errp);
     }
 
-    ret = blk_pread(exp->common.blk, request->from, request->len, data, 0);
+    ret = blk_co_pread(exp->common.blk, request->from, request->len, data, 0);
     if (ret < 0) {
         return nbd_send_generic_reply(client, request->handle, ret,
                                       "reading from file failed", errp);
@@ -2513,8 +2513,8 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
         if (request->flags & NBD_CMD_FLAG_FUA) {
             flags |= BDRV_REQ_FUA;
         }
-        ret = blk_pwrite(exp->common.blk, request->from, request->len, data,
-                         flags);
+        ret = blk_co_pwrite(exp->common.blk, request->from, request->len, data,
+                            flags);
         return nbd_send_generic_reply(client, request->handle, ret,
                                       "writing to file failed", errp);
 
@@ -2529,8 +2529,8 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
         if (request->flags & NBD_CMD_FLAG_FAST_ZERO) {
             flags |= BDRV_REQ_NO_FALLBACK;
         }
-        ret = blk_pwrite_zeroes(exp->common.blk, request->from, request->len,
-                                flags);
+        ret = blk_co_pwrite_zeroes(exp->common.blk, request->from, request->len,
+                                   flags);
         return nbd_send_generic_reply(client, request->handle, ret,
                                       "writing to file failed", errp);
 i
-- 
2.39.2


