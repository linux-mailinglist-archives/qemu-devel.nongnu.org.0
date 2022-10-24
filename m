Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4413C60A1DA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 13:34:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omvMj-0000ef-DH; Mon, 24 Oct 2022 07:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <3f3e9232207fc4f0e5cb5cf63f11ed9449efeefa@lizzy.crudebyte.com>)
 id 1omvLu-0000O3-UQ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:10:42 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <3f3e9232207fc4f0e5cb5cf63f11ed9449efeefa@lizzy.crudebyte.com>)
 id 1omvLg-0006np-1X
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=j1qMYwjqZSsvOmRZN4Bn0S5B3o5/LmFGW4XKgo5pJBI=; b=DF7Ls
 HoJ0CRoDFRLEqh4Y5dtrKUiOJ48GgQ7PUGAnhp/8img65DNcb6pFlHlkK5+wQHvpxkvybqbu+h9kB
 w0aE4XlyJq6tPpS3FNq8C6Nl6YM70HhBJN2iMp4r9z18bCLvmGv7EAV52GLpUziOYX0miGk7DOqpU
 2cuFBCZv229bf8IeRWijQFbD1XoT6AUoKWNza/4B/KJyhK0PgYd019U+pJqDDsc89FdfQ+MXAXhNU
 CDHFG/NJRvLCOBGzugg82Jy4AwIJugxzxB7TdAc52+SB1vHN3CBRiFCLcSucCLliRDwKUsdWgrjRD
 y7Otum9nhrELqqd8YLsLIx5sz1kMQ==;
Message-Id: <3f3e9232207fc4f0e5cb5cf63f11ed9449efeefa.1666608862.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1666608862.git.qemu_oss@crudebyte.com>
References: <cover.1666608862.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 24 Oct 2022 12:54:23 +0200
Subject: [PULL 05/23] tests/9p: simplify callers of twalk()
To: qemu-devel@nongnu.org,
    Stefan Hajnoczi <stefanha@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=3f3e9232207fc4f0e5cb5cf63f11ed9449efeefa@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Now as twalk() is using a declarative approach, simplify the
code of callers of this function.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <8b9d3c656ad43b6c953d6bdacd8d9f4c8e599b2a.1664917004.git.qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 92 +++++++++++++-----------------------
 1 file changed, 32 insertions(+), 60 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index cf5d6146ad..3c326451b1 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -90,19 +90,17 @@ static void fs_walk(void *obj, void *data, QGuestAllocator *t_alloc)
     uint16_t nwqid;
     g_autofree v9fs_qid *wqid = NULL;
     int i;
-    P9Req *req;
 
     for (i = 0; i < P9_MAXWELEM; i++) {
         wnames[i] = g_strdup_printf(QTEST_V9FS_SYNTH_WALK_FILE, i);
     }
 
     do_attach(v9p);
-    req = twalk({
+    twalk({
         .client = v9p, .fid = 0, .newfid = 1,
-        .nwname = P9_MAXWELEM, .wnames = wnames, .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rwalk(req, &nwqid, &wqid);
+        .nwname = P9_MAXWELEM, .wnames = wnames,
+        .rwalk = { .nwqid = &nwqid, .wqid = &wqid }
+    });
 
     g_assert_cmpint(nwqid, ==, P9_MAXWELEM);
 
@@ -134,12 +132,10 @@ static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
     P9Req *req;
 
     do_attach(v9p);
-    req = twalk({
+    twalk({
         .client = v9p, .fid = 0, .newfid = 1,
-        .nwname = 1, .wnames = wnames, .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rwalk(req, &nqid, NULL);
+        .nwname = 1, .wnames = wnames, .rwalk.nwqid = &nqid
+    });
     g_assert_cmpint(nqid, ==, 1);
 
     req = v9fs_tlopen(v9p, 1, O_DIRECTORY, 0);
@@ -198,12 +194,10 @@ static void do_readdir_split(QVirtio9P *v9p, uint32_t count)
     nentries = 0;
     tail = NULL;
 
-    req = twalk({
+    twalk({
         .client = v9p, .fid = 0, .newfid = fid,
-        .nwname = 1, .wnames = wnames, .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rwalk(req, &nqid, NULL);
+        .nwname = 1, .wnames = wnames, .rwalk.nwqid = &nqid
+    });
     g_assert_cmpint(nqid, ==, 1);
 
     req = v9fs_tlopen(v9p, fid, O_DIRECTORY, 0);
@@ -266,18 +260,12 @@ static void fs_walk_no_slash(void *obj, void *data, QGuestAllocator *t_alloc)
     QVirtio9P *v9p = obj;
     v9fs_set_allocator(t_alloc);
     char *wnames[] = { g_strdup(" /") };
-    P9Req *req;
-    uint32_t err;
 
     do_attach(v9p);
-    req = twalk({
+    twalk({
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames,
-        .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rlerror(req, &err);
-
-    g_assert_cmpint(err, ==, ENOENT);
+        .expectErr = ENOENT
+    });
 
     g_free(wnames[0]);
 }
@@ -312,7 +300,7 @@ static void fs_walk_2nd_nonexistent(void *obj, void *data,
     do_attach_rqid(v9p, &root_qid);
     fid = twalk({
         .client = v9p, .path = path,
-        .rwalk.nwqid = &nwqid, .rwalk.wqid = &wqid
+        .rwalk = { .nwqid = &nwqid, .wqid = &wqid }
     }).newfid;
     /*
      * The 9p2000 protocol spec says: "nwqid is therefore either nwname or the
@@ -345,12 +333,10 @@ static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rattach(req, &root_qid);
 
-    req = twalk({
+    twalk({
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 0, .wnames = NULL,
-        .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rwalk(req, NULL, &wqid);
+        .rwalk.wqid = &wqid
+    });
 
     /* special case: no QID is returned if nwname=0 was sent */
     g_assert(wqid == NULL);
@@ -376,12 +362,10 @@ static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rattach(req, &root_qid);
 
-    req = twalk({
+    twalk({
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames,
-        .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rwalk(req, NULL, &wqid); /* We now we'll get one qid */
+        .rwalk.wqid = &wqid /* We now we'll get one qid */
+    });
 
     g_assert_cmpmem(&root_qid, 13, wqid[0], 13);
 
@@ -396,12 +380,9 @@ static void fs_lopen(void *obj, void *data, QGuestAllocator *t_alloc)
     P9Req *req;
 
     do_attach(v9p);
-    req = twalk({
-        .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames,
-        .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rwalk(req, NULL, NULL);
+    twalk({
+        .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
+    });
 
     req = v9fs_tlopen(v9p, 1, O_WRONLY, 0);
     v9fs_req_wait_for_reply(req, NULL);
@@ -421,12 +402,9 @@ static void fs_write(void *obj, void *data, QGuestAllocator *t_alloc)
     P9Req *req;
 
     do_attach(v9p);
-    req = twalk({
-        .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames,
-        .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rwalk(req, NULL, NULL);
+    twalk({
+        .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
+    });
 
     req = v9fs_tlopen(v9p, 1, O_WRONLY, 0);
     v9fs_req_wait_for_reply(req, NULL);
@@ -450,12 +428,9 @@ static void fs_flush_success(void *obj, void *data, QGuestAllocator *t_alloc)
     uint8_t should_block;
 
     do_attach(v9p);
-    req = twalk({
-        .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames,
-        .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rwalk(req, NULL, NULL);
+    twalk({
+        .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
+    });
 
     req = v9fs_tlopen(v9p, 1, O_WRONLY, 0);
     v9fs_req_wait_for_reply(req, NULL);
@@ -490,12 +465,9 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
     uint8_t should_block;
 
     do_attach(v9p);
-    req = twalk({
-        .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames,
-        .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rwalk(req, NULL, NULL);
+    twalk({
+        .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
+    });
 
     req = v9fs_tlopen(v9p, 1, O_WRONLY, 0);
     v9fs_req_wait_for_reply(req, NULL);
-- 
2.30.2


