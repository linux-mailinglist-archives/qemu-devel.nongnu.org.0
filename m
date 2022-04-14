Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226E5501ABA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 20:02:57 +0200 (CEST)
Received: from localhost ([::1]:44222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf3o0-0001Ag-7D
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 14:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jS-0004nw-Qt
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:15 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jQ-0005t7-Sw
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:14 -0400
Received: by mail-wm1-x32d.google.com with SMTP id p189so3623541wmp.3
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 10:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gpLSk4k7X7Vp+T/vkrmkU3CU0GY2UodPZOw3JDLE7ec=;
 b=TTvSXbIn4t1hACT0vTjbHk4ffhsEoHjp7NdeDZg184zVcGHUkCpUofbaxrUU6VYYCR
 ilqhCG1I0XVPb+z2LbKECxxdAh8dnOkCp+SIUFxOUK0b4MPLCFbcm1Ys0u2W3ZbTKBjL
 G9O0mzqTR8vrJrgZWN0YvnMwlSEvGX1aeAs7gpZWgm0GBC36dYBhYfnl+trBGRSNUEG9
 Ekzm3DGl59onNm8xq4pqp5dHNIMi2k82qrfZmj/C52qj5BJ1ykcqAIUnOsjZxJWTqQYx
 Oho3cNuWYyjc6rzOrG+2NxeGdHbLbH5uzwIy8qTm7i0V9IFgVqi42tUpVQT+eQMAgV2w
 8S0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gpLSk4k7X7Vp+T/vkrmkU3CU0GY2UodPZOw3JDLE7ec=;
 b=cFtyLq0DcS0bsxJOI6K8PF+p87IS0q8GAivq8rhL/aURy+DGmSJEYZTAZu++lzBceW
 WKVTdMqdS9XUb8Jv1ZvSViR6Q9Lskee0pXsPffoRiB0NZ+Jynl7rmmIU4Ex71nbDrwT6
 uVSbWqq/bbmwiyVf9co/47xcdw74j4J6WVS6gMEBQwWwPJo3XCfe4bqov+WrL9bZpl7t
 1Aw8AuISz44Rnkp9GKzRptJyLhEMUP4hIMmEpWHlJis5Me0Ttg9k2NIejBj1enBRx65G
 tCSpHh4mJlK2uHZgl5HQqlpYLP7Dp26y7Xbn0qlpPrBzjdHr3E1vuijsTrWnqVNBZ2WT
 7hEQ==
X-Gm-Message-State: AOAM532iHAKBPHL9DRcL9vcb7Hfs3Q4S+uwmPORgQCbSnZWkPOZ9fi+e
 MfILRGpDRuWC4K+LEjWFPmq2ZdiWQdd9rA==
X-Google-Smtp-Source: ABdhPJxodH6Rdi6SWaJLmaPLMa2PncOGtUaNh/wjP83nlJv53JesDs3wag1qjLFjFSPjy3PWu4rJaA==
X-Received: by 2002:a7b:c5d5:0:b0:37b:fda9:a5e2 with SMTP id
 n21-20020a7bc5d5000000b0037bfda9a5e2mr4266242wmk.62.1649959091633; 
 Thu, 14 Apr 2022 10:58:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm2451254wri.4.2022.04.14.10.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 10:58:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-7.1 3/9] nbd: remove peppering of nbd_client_connected
Date: Thu, 14 Apr 2022 19:57:50 +0200
Message-Id: <20220414175756.671165-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414175756.671165-1-pbonzini@redhat.com>
References: <20220414175756.671165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
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

It is unnecessary to check nbd_client_connected() because every time
s->state is moved out of NBD_CLIENT_CONNECTED the socket is shut down
and all coroutines are resumed.

The only case where it was actually needed is when the NBD
server disconnects and there is no reconnect-delay.  In that
case, nbd_receive_replies() does not set s->reply.handle and
nbd_co_do_receive_one_chunk() cannot continue.  For that one case,
check the return value of nbd_receive_replies().

As to the others:

* nbd_receive_replies() can put the current coroutine to sleep if another
reply is ongoing; then it will be woken by nbd_channel_error(), called
by the ongoing reply.  Or it can try itself to read a reply header and
fail, thus calling nbd_channel_error() itself.

* nbd_co_send_request() will write the body of the request and fail

* nbd_reply_chunk_iter_receive() will call nbd_co_receive_one_chunk()
and then nbd_co_do_receive_one_chunk(), which will handle the failure as
above; or it will just detect a previous call to nbd_iter_channel_error()
via iter->ret < 0.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 3cc4ea4430..a30603ce87 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -409,10 +409,6 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
             return 0;
         }
 
-        if (!nbd_client_connected(s)) {
-            return -EIO;
-        }
-
         if (s->reply.handle != 0) {
             /*
              * Some other request is being handled now. It should already be
@@ -512,7 +508,7 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
     if (qiov) {
         qio_channel_set_cork(s->ioc, true);
         rc = nbd_send_request(s->ioc, request);
-        if (nbd_client_connected(s) && rc >= 0) {
+        if (rc >= 0) {
             if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
                                        NULL) < 0) {
                 rc = -EIO;
@@ -829,8 +825,8 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
     }
     *request_ret = 0;
 
-    nbd_receive_replies(s, handle);
-    if (!nbd_client_connected(s)) {
+    ret = nbd_receive_replies(s, handle);
+    if (ret < 0) {
         error_setg(errp, "Connection closed");
         return -EIO;
     }
@@ -982,11 +978,6 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     NBDReply local_reply;
     NBDStructuredReplyChunk *chunk;
     Error *local_err = NULL;
-    if (!nbd_client_connected(s)) {
-        error_setg(&local_err, "Connection closed");
-        nbd_iter_channel_error(iter, -EIO, &local_err);
-        goto break_loop;
-    }
 
     if (iter->done) {
         /* Previous iteration was last. */
@@ -1007,7 +998,7 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     }
 
     /* Do not execute the body of NBD_FOREACH_REPLY_CHUNK for simple reply. */
-    if (nbd_reply_is_simple(reply) || !nbd_client_connected(s)) {
+    if (nbd_reply_is_simple(reply) || iter->ret < 0) {
         goto break_loop;
     }
 
-- 
2.35.1



