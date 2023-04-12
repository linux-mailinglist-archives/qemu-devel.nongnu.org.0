Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8676DF33A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:28:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYcB-0007Ef-RP; Wed, 12 Apr 2023 07:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pmYcA-0007E0-Cd
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:26:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pmYc8-0007Dj-EA
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681298771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OwhGnobvrjVdkWA/CXaD5gsw2LNNIGg6yxAbcsbFs+4=;
 b=G4QOYxRqbDEchBcs/L9PAv3zdb6c8KgKTX2olckz/h5uGebfuiNm1A31bEn9q6Gflmbpc2
 Y8XEMyeULVqEFoDmLFMJAfMVbI3+vDxl6KXBIG5qqkd+NcdTJ7MVTYEuF/o/MOmyFR5sou
 bF0rQ8wcRNqDU7vppIL31ibagi49YlM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-moBGngUvMwqUqXnUeWa0TA-1; Wed, 12 Apr 2023 07:26:10 -0400
X-MC-Unique: moBGngUvMwqUqXnUeWa0TA-1
Received: by mail-wr1-f69.google.com with SMTP id
 q9-20020adfab09000000b002f513905032so96409wrc.2
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681298768; x=1683890768;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OwhGnobvrjVdkWA/CXaD5gsw2LNNIGg6yxAbcsbFs+4=;
 b=qDk2sP+ULHn/1ZaaXyCA5ElEhv+uVJROioOkJEzzbhj2Oobms9+acR2lnSUtGKG6Uh
 t4julK8NtaefXealepZz9eIuFQUkxYzeIIyreiLB4rDTiaia7twgpFfs1cvVQ/EkrQuR
 9daCpXaoLcB4kPjlBI+/yXEqq6ZN2Do60jxKEHu999gCBOdP5Hw/DHBDfs7oWHikbUt6
 /GqK/oZZ5TQIvNqSq2Ei+0M/iUEDQ7c44vqt4WWxz/NEclCnlewz3pIqSkNOUwRKzjk3
 i2bh63FYt74D/dn7WJ4sbeb0DmH/O9nqKsUlPFoW0KU1j0vRCYbUc6/gBLHmiuEXTCXt
 izxA==
X-Gm-Message-State: AAQBX9dHZuX5MPhYwTRvrjkd77ApQaJfrlYda8rCmzBPhKe60rDPd8Ty
 5x070icKnZXKSPvQCcz659vNhrze44LG/yIg8lB4UtZJwixAhb6JC07kAoSOXf48cnL/CHEDLbj
 39sVOQaAEyxG2FOaTkJFr2cKIUhl6c3UR3AVreIVnqa+nZ4vKgqn55+greFSMIF+D9EKaNSO93s
 Y=
X-Received: by 2002:adf:de05:0:b0:2ce:a7df:c115 with SMTP id
 b5-20020adfde05000000b002cea7dfc115mr1855054wrm.41.1681298768541; 
 Wed, 12 Apr 2023 04:26:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z3Var4a58ZlLyQ0YMa+vwa1MDT92UMKufdBer8otafBqLJqtMW05yCJr6R2dcv9MvSh6VjpA==
X-Received: by 2002:adf:de05:0:b0:2ce:a7df:c115 with SMTP id
 b5-20020adfde05000000b002cea7dfc115mr1855036wrm.41.1681298768201; 
 Wed, 12 Apr 2023 04:26:08 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d4845000000b002e5f6f8fc4fsm16924010wrs.100.2023.04.12.04.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:26:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org
Subject: [PATCH 8.0 regression] block/nfs: do not poll within a coroutine
Date: Wed, 12 Apr 2023 13:26:06 +0200
Message-Id: <20230412112606.80983-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
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

Since the former nfs_get_allocated_file_size is now a coroutine
function, it must suspend rather than poll.  Switch BDRV_POLL_WHILE()
to a qemu_coroutine_yield() loop and schedule nfs_co_generic_bh_cb()
in place of the call to bdrv_wakeup().

Fixes: 82618d7bc341 ("block: Convert bdrv_get_allocated_file_size() to co_wrapper", 2023-02-01)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nfs.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/block/nfs.c b/block/nfs.c
index 351dc6ec8d14..417defc0cfef 100644
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
+	nfs_set_events(client);
+    }
+    while (!task.complete) {
+        qemu_coroutine_yield();
+    }
 
     return (task.ret < 0 ? task.ret : st.st_blocks * 512);
 }
-- 
2.39.2


