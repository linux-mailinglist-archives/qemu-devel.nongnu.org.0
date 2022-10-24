Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2560160A1A7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 13:32:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omvN4-0000ro-Ts; Mon, 24 Oct 2022 07:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0e4c4ff02aecaa3cea3e583d07509378b7783307@lizzy.crudebyte.com>)
 id 1omvMt-0000o0-PN
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:11:46 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0e4c4ff02aecaa3cea3e583d07509378b7783307@lizzy.crudebyte.com>)
 id 1omvMf-0007Fm-1v
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=CeHtuR5SWe3A/AmP2z5ZDNoepvaxVnrEVDW+XfndFNI=; b=NHHuV
 MxjLbC5bQ3DQOKkhY2Fe5JkZHLrQA3K113n2hhA3MChrvEqztG7GQfEEVxOxPc4UoKkq+osqBTdyc
 7zPCixXziR4magqZibb4KhEuYUI2je9bIfthheo0hNMWEndX0unvCNG+HuxPD5KTCpzUf6XNZ8sXR
 jeKukLziVvCe9G6FPgZeYT6bToz1O3oorQbkAn6GjoXd96XcJf3v3hiQXEngp0jTc9vzz8r91bYhM
 Xb4H6ZSZIaRoWdpQ1Ug1X4iPjUKd3RjPkNDcG6SdN/JKFA/m18frg0WkdE3pg7RLpmO6cCwNs13sb
 z4xARZrBUXorAU4Yr+/o1vYyD+XvA==;
Message-Id: <0e4c4ff02aecaa3cea3e583d07509378b7783307.1666608862.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1666608862.git.qemu_oss@crudebyte.com>
References: <cover.1666608862.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 24 Oct 2022 12:54:23 +0200
Subject: [PULL 14/23] tests/9p: simplify callers of tlopen()
To: qemu-devel@nongnu.org,
    Stefan Hajnoczi <stefanha@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=0e4c4ff02aecaa3cea3e583d07509378b7783307@lizzy.crudebyte.com;
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

Now as tlopen() is using a declarative approach, simplify the
code of callers of this function.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <f74b6153e079fc7a340e5cb575ee32e0fe1e0ae6.1664917004.git.qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 43 +++++++++---------------------------
 1 file changed, 10 insertions(+), 33 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 0455c3a094..60a030b877 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -105,7 +105,6 @@ static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
     v9fs_qid qid;
     uint32_t count, nentries;
     struct V9fsDirent *entries = NULL;
-    P9Req *req;
 
     tattach({ .client = v9p });
     twalk({
@@ -114,11 +113,9 @@ static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
     });
     g_assert_cmpint(nqid, ==, 1);
 
-    req = tlopen({
-        .client = v9p, .fid = 1, .flags = O_DIRECTORY, .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rlopen(req, &qid, NULL);
+    tlopen({
+        .client = v9p, .fid = 1, .flags = O_DIRECTORY, .rlopen.qid = &qid
+    });
 
     /*
      * submit count = msize - 11, because 11 is the header size of Rreaddir
@@ -163,7 +160,6 @@ static void do_readdir_split(QVirtio9P *v9p, uint32_t count)
     v9fs_qid qid;
     uint32_t nentries, npartialentries;
     struct V9fsDirent *entries, *tail, *partialentries;
-    P9Req *req;
     int fid;
     uint64_t offset;
 
@@ -181,11 +177,9 @@ static void do_readdir_split(QVirtio9P *v9p, uint32_t count)
     });
     g_assert_cmpint(nqid, ==, 1);
 
-    req = tlopen({
-        .client = v9p, .fid = fid, .flags = O_DIRECTORY, .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rlopen(req, &qid, NULL);
+    tlopen({
+        .client = v9p, .fid = fid, .flags = O_DIRECTORY, .rlopen.qid = &qid
+    });
 
     /*
      * send as many Treaddir requests as required to get all directory
@@ -363,18 +357,13 @@ static void fs_lopen(void *obj, void *data, QGuestAllocator *t_alloc)
     QVirtio9P *v9p = obj;
     v9fs_set_allocator(t_alloc);
     char *wnames[] = { g_strdup(QTEST_V9FS_SYNTH_LOPEN_FILE) };
-    P9Req *req;
 
     tattach({ .client = v9p });
     twalk({
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
     });
 
-    req = tlopen({
-        .client = v9p, .fid = 1, .flags = O_WRONLY, .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rlopen(req, NULL, NULL);
+    tlopen({ .client = v9p, .fid = 1, .flags = O_WRONLY });
 
     g_free(wnames[0]);
 }
@@ -394,11 +383,7 @@ static void fs_write(void *obj, void *data, QGuestAllocator *t_alloc)
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
     });
 
-    req = tlopen({
-        .client = v9p, .fid = 1, .flags = O_WRONLY, .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rlopen(req, NULL, NULL);
+    tlopen({ .client = v9p, .fid = 1, .flags = O_WRONLY });
 
     req = v9fs_twrite(v9p, 1, 0, write_count, buf, 0);
     v9fs_req_wait_for_reply(req, NULL);
@@ -422,11 +407,7 @@ static void fs_flush_success(void *obj, void *data, QGuestAllocator *t_alloc)
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
     });
 
-    req = tlopen({
-        .client = v9p, .fid = 1, .flags = O_WRONLY, .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rlopen(req, NULL, NULL);
+    tlopen({ .client = v9p, .fid = 1, .flags = O_WRONLY });
 
     /* This will cause the 9p server to try to write data to the backend,
      * until the write request gets cancelled.
@@ -461,11 +442,7 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
     });
 
-    req = tlopen({
-        .client = v9p, .fid = 1, .flags = O_WRONLY, .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rlopen(req, NULL, NULL);
+    tlopen({ .client = v9p, .fid = 1, .flags = O_WRONLY });
 
     /* This will cause the write request to complete right away, before it
      * could be actually cancelled.
-- 
2.30.2


