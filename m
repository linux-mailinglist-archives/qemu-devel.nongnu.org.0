Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDF76DFB65
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 18:31:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmdLp-00045p-0S; Wed, 12 Apr 2023 12:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pmdLl-00044f-1w
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 12:29:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pmdLi-0005aR-JX
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 12:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681316973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIw5v2T3TIrN1LDh60U+SGcph03Y7WwbddPVbaYtGZQ=;
 b=hnbhb2L0rloMvT+i7zfpa38hNdGtO83rnNzdgV3EPSVZJ9kfWZ0R/s5e5szkfAfTzlknJk
 p5TqdmiGWEtkGnieCeAO6TD1oGx02ehE09X9T2ikzMNmrDy0pZBsX5ulSYnJxorQgUI+De
 utiDw11tnQSgK+Gj7pdd5bCKnljxRLM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-F02qa7VfPwuU_mpEy-_JMQ-1; Wed, 12 Apr 2023 12:29:32 -0400
X-MC-Unique: F02qa7VfPwuU_mpEy-_JMQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o1-20020a05600c4fc100b003edecc610abso7201601wmq.7
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 09:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681316971; x=1683908971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RIw5v2T3TIrN1LDh60U+SGcph03Y7WwbddPVbaYtGZQ=;
 b=Qai8LOZ+/VBixHgEsHzrnrzQHdMUv84kDmwmnOwFgwErJQG02tJ/ZIcdWGdXtdQKf+
 FkWxocQvVfCxowbr+XDQqiwvOjkhDl19ztVBZv6uTmLJjmLDYnbjqsTUWSI040Lvg0ko
 Xb07SDuWycKAIZMt1mRofiUM2PTK969FPVBXha+ik3cxXCz9+d0JghSoKDVuWtKZN4KZ
 fm3jPCIF0cpKe1hDmPXb16fiVnQPeWfaZ4AOUlNH36PqAjxGN1qvXXhbzHZ/tifN8k5g
 fE+Zvlg32HiEa5U+ot/UgCI3LRE8NOVpUKyctOm8z+71Iz60B189Qp/8PqAacxwZVjiD
 htjw==
X-Gm-Message-State: AAQBX9coTcmKrY37yQQPxsh4Xxl48Bif7Ro6ReA7po27sCT3bK1ek16/
 p5KQhlarEFo1aSWMjlv1oCJ95HvEKS17d2Mdf19G1OcZyBPlxvvMWUvBwIbk6fOb6TecdlcyQ87
 gNluyHJh5MoLqwtYwKvPDG45UTrPhVck3eOL+UE8ZSRfJlRtRKHs7pAwKRjdBmZC6iH45dJFSEm
 8=
X-Received: by 2002:a5d:6b02:0:b0:2c7:1d0d:7184 with SMTP id
 v2-20020a5d6b02000000b002c71d0d7184mr12093501wrw.11.1681316970789; 
 Wed, 12 Apr 2023 09:29:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350ag98AicbUqNfhYBTNM/gWkYWK0LZRq+sYkW2trwVJLiodz7oGvg9TbAXbpppAKo8JdcN92Mg==
X-Received: by 2002:a5d:6b02:0:b0:2c7:1d0d:7184 with SMTP id
 v2-20020a5d6b02000000b002c71d0d7184mr12093491wrw.11.1681316970456; 
 Wed, 12 Apr 2023 09:29:30 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003f049a42689sm2842606wmq.25.2023.04.12.09.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 09:29:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>
Subject: [PULL for-8.0 1/1] block/nfs: do not poll within a coroutine
Date: Wed, 12 Apr 2023 18:29:27 +0200
Message-Id: <20230412162927.112101-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412162927.112101-1-pbonzini@redhat.com>
References: <20230412162927.112101-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Since the former nfs_get_allocated_file_size is now a coroutine
function, it must suspend rather than poll.  Switch BDRV_POLL_WHILE()
to a qemu_coroutine_yield() loop and schedule nfs_co_generic_bh_cb()
in place of the call to bdrv_wakeup().

Fixes: 82618d7bc341 ("block: Convert bdrv_get_allocated_file_size() to co_wrapper", 2023-02-01)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230412112606.80983-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nfs.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/block/nfs.c b/block/nfs.c
index 351dc6ec8d14..006045d71a6f 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -726,10 +726,8 @@ nfs_get_allocated_file_size_cb(int ret, struct nfs_context *nfs, void *data,
     if (task->ret < 0) {
         error_report("NFS Error: %s", nfs_get_error(nfs));
     }
-
-    /* Set task->complete before reading bs->wakeup.  */
-    qatomic_mb_set(&task->complete, 1);
-    bdrv_wakeup(task->bs);
+    replay_bh_schedule_oneshot_event(task->client->aio_context,
+                                     nfs_co_generic_bh_cb, task);
 }
 
 static int64_t coroutine_fn nfs_co_get_allocated_file_size(BlockDriverState *bs)
@@ -743,15 +741,19 @@ static int64_t coroutine_fn nfs_co_get_allocated_file_size(BlockDriverState *bs)
         return client->st_blocks * 512;
     }
 
-    task.bs = bs;
+    nfs_co_init_task(bs, &task);
     task.st = &st;
-    if (nfs_fstat_async(client->context, client->fh, nfs_get_allocated_file_size_cb,
-                        &task) != 0) {
-        return -ENOMEM;
-    }
+    WITH_QEMU_LOCK_GUARD(&client->mutex) {
+        if (nfs_fstat_async(client->context, client->fh, nfs_get_allocated_file_size_cb,
+                            &task) != 0) {
+            return -ENOMEM;
+        }
 
-    nfs_set_events(client);
-    BDRV_POLL_WHILE(bs, !task.complete);
+        nfs_set_events(client);
+    }
+    while (!task.complete) {
+        qemu_coroutine_yield();
+    }
 
     return (task.ret < 0 ? task.ret : st.st_blocks * 512);
 }
-- 
2.39.2


