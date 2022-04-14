Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B996501AAD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 20:01:41 +0200 (CEST)
Received: from localhost ([::1]:41226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf3ml-0007Sq-0w
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 14:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jR-0004mA-6t
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:13 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:44751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jP-0005sm-BC
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:12 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 m33-20020a05600c3b2100b0038ec0218103so3713645wms.3
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 10:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=31aWf6yWgE2LMOZIgY9XyxQ2VucF93P8DLahNEWZkgE=;
 b=nJcGmqImpVof1zz39QdESoT25TRUiaJX9UclzLXOXWM11zofV77ihprJNq5eciIh+p
 Fvy5jfo3H9BGpjoGF+w5lEkcgTixcqgYPpv2d34NIPMoqihCG4OO3oX6clC1rkFVD0k2
 2gg3Rztn2j3cVv+A1/wYh+oaEg0OnXmvglKJYSWyXn2KBUGF+z5RFFQGcym8HfgwUdBm
 pFKvcYp8wYqFOYjtUtjlJMAE4yQW1lrC+rh4Hewp3JMs7/BmenTrfmMOgx4Jw3I6nsav
 xPaiXBaur/povG6mxODa3Fg4yAPL8Ao8ZhASa8xH7wzcr2Uwq3dF8UhOEomOzjWfwAFS
 TADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=31aWf6yWgE2LMOZIgY9XyxQ2VucF93P8DLahNEWZkgE=;
 b=BB0j/fTyMAKSwhAjEcbXT27PPWnTKsUOLUzDf/5VvK7kQwBOmtuPUOhF2ixkYui5jO
 D2PxwQEWpwsORWPPbQRMFMqsBID2DvO7H0ZgXuWlQb3IZWjaKYLpbsT119aSPSpXp1sK
 mucmbg6g+3qPk5/O+E4XhTgr6ptea14J6AtrSNpiq9tPmoZraGrSnc8GQGTwzmnJxsxI
 Zo2LcIKrpQySvwRd05r7eSHXc7xC5y9XaeSDu17pLrrgohdqHHQxXpjo1cdWyWc9JEtr
 Bu1sXYWGjVhBS/qCfWPd8zT9wKiTNFo6F4XB5kAidzfC6fYINOJ4cw0sjwHEZo+MgC8I
 dNxA==
X-Gm-Message-State: AOAM5334cyZvSEVakxBQJxVRGA2qcHilRi/5rJB3wKxlK1lWB0F7Mz+v
 UUoDpjJP9jZqMdfe0eKBcV+CsOD9mn0+BA==
X-Google-Smtp-Source: ABdhPJydklM2cEuOH81dxeS/mluaZ69NLv2hefecCyrp0lxvqvrWYunJli22hmRaTUWpagUp688/6g==
X-Received: by 2002:a7b:c341:0:b0:37b:c619:c9f4 with SMTP id
 l1-20020a7bc341000000b0037bc619c9f4mr4699424wmj.38.1649959090004; 
 Thu, 14 Apr 2022 10:58:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm2451254wri.4.2022.04.14.10.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 10:58:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-7.1 2/9] nbd: mark more coroutine_fns
Date: Thu, 14 Apr 2022 19:57:49 +0200
Message-Id: <20220414175756.671165-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414175756.671165-1-pbonzini@redhat.com>
References: <20220414175756.671165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: v.sementsov-og@mail.ru, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several coroutine functions in block/nbd.c are not marked as such.  This
patch adds a few more markers; it is not exhaustive, but it focuses
especially on:

- places that wake other coroutines, because aio_co_wake() has very
different semantics inside a coroutine (queuing after yield vs. entering
immediately);

- functions with _co_ in their names, to avoid confusion

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c | 64 ++++++++++++++++++++++++++---------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index d29bee1122..3cc4ea4430 100644
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
@@ -1914,7 +1914,7 @@ fail:
     return ret;
 }
 
-static int nbd_co_flush(BlockDriverState *bs)
+static int coroutine_fn nbd_co_flush(BlockDriverState *bs)
 {
     return nbd_client_co_flush(bs);
 }
-- 
2.35.1



