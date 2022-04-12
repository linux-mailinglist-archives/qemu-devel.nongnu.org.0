Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461BE4FE90C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 21:46:10 +0200 (CEST)
Received: from localhost ([::1]:57280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neMSn-0000w0-3u
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 15:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMP2-0006Oy-BU
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:20 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMP0-0008Ht-Qa
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:16 -0400
Received: by mail-wr1-x435.google.com with SMTP id e21so12714799wrc.8
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 12:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mCKHIh/4hOBkUX2T4VPTq3r8LrT7ApWy2bKw3521i30=;
 b=PLYUBSBNMfWEdskNs8qmPQFvrROMg/2MuIzEXGeY4X4za6ax7oBCb0soiwFkUq7d1F
 RKwlAVPg2AHJeYcwyN8nxYLqpk4cPUzRjWxHx6JTp4/InBYQJJGD5Vb43XF/0X/1sFWA
 aNhuA+G4K3Kx2dedsfl8oEFdeb2rn2u6o920eSFFy2tVhL0CWwMgwXlh7zB2bGvGziTA
 Me/G2ADdu33o+5+Hy8WKWE2TzHbI+l1jSoFLyqfrMSB0QFPeYhOh9Yl5Br4DfXSlHFBo
 +BtEToFRsdZtKg/8l6lTaLlYSjQbWp7SjcOZqWoMPU9vEVO8boqBTdG3PLGmL/QWdvNe
 bXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mCKHIh/4hOBkUX2T4VPTq3r8LrT7ApWy2bKw3521i30=;
 b=SuhCLZza9yqaO0eUH0i14IqyLNWKm4Itc+SLXpP+4FSoEUub2iyHCXDH6qk6EaZ6Tg
 EtIlAZ3og+W4g1XYCFhZo8ZP/R3z45Bs6AwQQuaCubT36nH3m3SV5PdQ0aWH4eRT4/mf
 YGBLNiyV+77iPO2QPgnFSgW/1pIyXs6gbmrS6vEJPmXuZOUsNzKNQSaKRtpsGeya5OXv
 gtdhIFzOeMi6uqIV2IW+Qku/uD2gisPfmSgntwjbnhL/n5yYl1dH8vLba/ATcjbczuxE
 BJDCEfG06bkqPuaHMQM0QuNFu60MJBiYDke3MPUXAlt6yxC0na2ECHBICNBsda5GUJ+H
 lV1A==
X-Gm-Message-State: AOAM5317oDJ5s/BluipyA3SBdNUG/tJtvGlbbGSL6FbFWynZJvX9Zjw9
 kTZT0Q1ie5D3kJV44g7Sjeh6rVH168izRw==
X-Google-Smtp-Source: ABdhPJydqxAnEs7Nx3P2KZ6CbgW+v0v4jKLP64pPvdmiy9ULGGEEZbFBnBK0dwy9HhIHgYUmnjkmRg==
X-Received: by 2002:a05:6000:137a:b0:207:9a8f:59b7 with SMTP id
 q26-20020a056000137a00b002079a8f59b7mr17305269wrz.431.1649792533314; 
 Tue, 12 Apr 2022 12:42:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600002a300b00207902922cesm14150978wry.15.2022.04.12.12.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 12:42:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 3/8] nbd: remove peppering of nbd_client_connected
Date: Tue, 12 Apr 2022 21:41:59 +0200
Message-Id: <20220412194204.350889-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412194204.350889-1-pbonzini@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: eblake@redhat.com
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
reply is ongoing; then it will be woken by nbd_channel_error() called
by the ongoing reply.  Or it can try itself to read a reply header and
fail, thus calling nbd_channel_error() itself.

* nbd_co_send_request() will write the body of the request and fail

* nbd_reply_chunk_iter_receive() will call nbd_co_receive_one_chunk()
and then nbd_co_do_receive_one_chunk(), which will handle the failure as
above; or it will just detect a previous call to nbd_iter_channel_error()
via iter->ret < 0.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 81b319318e..02db52a230 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -410,10 +410,6 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
             return 0;
         }
 
-        if (!nbd_client_connected(s)) {
-            return -EIO;
-        }
-
         if (s->reply.handle != 0) {
             /*
              * Some other request is being handled now. It should already be
@@ -515,7 +511,7 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
     if (qiov) {
         qio_channel_set_cork(s->ioc, true);
         rc = nbd_send_request(s->ioc, request);
-        if (nbd_client_connected(s) && rc >= 0) {
+        if (rc >= 0) {
             if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
                                        NULL) < 0) {
                 rc = -EIO;
@@ -832,8 +828,8 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
     }
     *request_ret = 0;
 
-    nbd_receive_replies(s, handle);
-    if (!nbd_client_connected(s)) {
+    ret = nbd_receive_replies(s, handle);
+    if (ret < 0) {
         error_setg(errp, "Connection closed");
         return -EIO;
     }
@@ -985,11 +981,6 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
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
@@ -1010,7 +1001,7 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     }
 
     /* Do not execute the body of NBD_FOREACH_REPLY_CHUNK for simple reply. */
-    if (nbd_reply_is_simple(reply) || !nbd_client_connected(s)) {
+    if (nbd_reply_is_simple(reply) || iter->ret < 0) {
         goto break_loop;
     }
 
-- 
2.35.1



