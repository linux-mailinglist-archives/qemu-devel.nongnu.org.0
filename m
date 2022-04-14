Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A18501AC9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 20:07:23 +0200 (CEST)
Received: from localhost ([::1]:57066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf3sI-0001Qb-UU
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 14:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jb-0004wn-0y
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:23 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jZ-0005vE-4w
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:22 -0400
Received: by mail-wr1-x434.google.com with SMTP id w4so7937811wrg.12
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 10:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7VWZa+u+p1aPNoE4gcn0kQQDiic91hEbzJAbjLmhctI=;
 b=EAJ84Wfl2LUOlvzFlzrq//9etArbex02Qech/gXNMsHNRwwsgZ0t6xWehnE8lXsK+7
 RSv7XexicBJFbZxHVjLmjnMJroFFtfG0drul8XlbVtM1BtKMBnBplIn/ZwTLHtUVqM5B
 9SdKIMOgR7SPAB0JAJGdkLVGeAHhmWgpaxuvs+ks15B9pdRikkSnEMfMUopy07AWeRBD
 69XopA38DXQQm6pjnPHHkwsDRV3jJFV/xZwnpSosdS+Mlrs0oIz8rgm/qOcf5Ruu5UFK
 q35eJFQYCvhRS3Pa1mW9Mxd8PKWxXcxkzy0/h3XN267AtBpOBk+lkYWEqxlvDLf6Vokr
 1QdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7VWZa+u+p1aPNoE4gcn0kQQDiic91hEbzJAbjLmhctI=;
 b=0R8m9pXKFwcQlrHdJBYW1hVfmjSsbi48QzWWnOey4I6F4JwmeMpyoubkrogJWZdErH
 0ejxaO3F2O3lUMRbYu/UultldPiUayirUsD9gxdyyT+U4MLRDFEn5rKnxfrh8jwaBmiR
 OJQVNyeNy+mGUmFH0KBDxej7AVeC9H5in9O3dWqJB61iGql/yxxbWFpNxhBCce3lPtSG
 sUUl9oC49ayKNJYldbWRvltjJKwZQSHQsoVhcrpvj/ybtrw4qmFpRZmC+jHoDe4GXWcX
 D2sbYwvEiEYbwQ3DWqFOkxftv8+3XxKCtq2Y6yBzzFMZuafafej2ivuT7jlSJL1vXvUq
 0Rzw==
X-Gm-Message-State: AOAM532EDBSusrDBO3zvyEwkZo/j3uo2JG3VPsP6B5A/u60sgMTkNZ7D
 iJMEzppmFZldExSuwkS3dk93HR5eJa0fSQ==
X-Google-Smtp-Source: ABdhPJxcTIZrJQZ7SnA6tzq5FmZHCw3qwDHzt39SHfsPK7w69wgU7YNLoRb4Ajw7j/N2HqV8DQ73Dw==
X-Received: by 2002:a5d:514c:0:b0:207:bb13:7b23 with SMTP id
 u12-20020a5d514c000000b00207bb137b23mr2895679wrt.119.1649959098065; 
 Thu, 14 Apr 2022 10:58:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm2451254wri.4.2022.04.14.10.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 10:58:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-7.1 8/9] nbd: take receive_mutex when reading
 requests[].receiving
Date: Thu, 14 Apr 2022 19:57:55 +0200
Message-Id: <20220414175756.671165-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414175756.671165-1-pbonzini@redhat.com>
References: <20220414175756.671165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
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

requests[].receiving is set by nbd_receive_replies() under the receive_mutex;
Read it under the same mutex as well.  Waking up receivers on errors happens
after each reply finishes processing, in nbd_co_receive_one_chunk().
If there is no currently-active reply, there are two cases:

* either there is no active request at all, in which case no
element of request[] can have .receiving = true

* or nbd_receive_replies() must be running and owns receive_mutex;
in that case it will get back to nbd_co_receive_one_chunk() because
the socket has been shutdown, and all waiting coroutines will wake up
in turn.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index b5aac2548c..31c684772e 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -131,6 +131,7 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
     s->x_dirty_bitmap = NULL;
 }
 
+/* Called with s->receive_mutex taken.  */
 static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)
 {
     if (req->receiving) {
@@ -142,12 +143,13 @@ static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)
     return false;
 }
 
-static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
+static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s)
 {
     int i;
 
+    QEMU_LOCK_GUARD(&s->receive_mutex);
     for (i = 0; i < MAX_NBD_REQUESTS; i++) {
-        if (nbd_recv_coroutine_wake_one(&s->requests[i]) && !all) {
+        if (nbd_recv_coroutine_wake_one(&s->requests[i])) {
             return;
         }
     }
@@ -168,8 +170,6 @@ static void coroutine_fn nbd_channel_error_locked(BDRVNBDState *s, int ret)
     } else {
         s->state = NBD_CLIENT_QUIT;
     }
-
-    nbd_recv_coroutines_wake(s, true);
 }
 
 static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
@@ -432,11 +432,10 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
 
             qemu_coroutine_yield();
             /*
-             * We may be woken for 3 reasons:
+             * We may be woken for 2 reasons:
              * 1. From this function, executing in parallel coroutine, when our
              *    handle is received.
-             * 2. From nbd_channel_error(), when connection is lost.
-             * 3. From nbd_co_receive_one_chunk(), when previous request is
+             * 2. From nbd_co_receive_one_chunk(), when previous request is
              *    finished and s->reply.handle set to 0.
              * Anyway, it's OK to lock the mutex and go to the next iteration.
              */
@@ -928,7 +927,7 @@ static coroutine_fn int nbd_co_receive_one_chunk(
     }
     s->reply.handle = 0;
 
-    nbd_recv_coroutines_wake(s, false);
+    nbd_recv_coroutines_wake(s);
 
     return ret;
 }
-- 
2.35.1



