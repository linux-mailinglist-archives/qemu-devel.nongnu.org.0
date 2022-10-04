Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610C55F4B06
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:37:37 +0200 (CEST)
Received: from localhost ([::1]:54908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpbc-0000Rc-Fl
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f74b6153e079fc7a340e5cb575ee32e0fe1e0ae6@lizzy.crudebyte.com>)
 id 1ofpLu-0006SZ-9M
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:21:22 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:39817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f74b6153e079fc7a340e5cb575ee32e0fe1e0ae6@lizzy.crudebyte.com>)
 id 1ofpLr-0002ZY-ND
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=js3NqUShX2HmMP302fS7mpsznxWt2G6ATCcJIiVI388=; b=YYpNE
 dua/mKkXQC5Wcla2XUM/HbPLJ9/ZdwjrCpCHqfTJT3DUipyGxBLxGhS+nKtG9AEwh/4F63YwU9Rb9
 d2dgP/R0nEjuwizgdkB9I428T8g7l2Pdefsnsr53D3SsX7U0OHiAOrrEOddHnMPwkAUnHJ2fcgoM/
 0+6jv2N4ClE4lJdswmpaKR3rO4pCQsldwffyjJaSMFAAHVG5u4ShUDzN/SfIhkkCVySyR1hDetdNW
 7R8dJvv/ABo2P/L+mN79tiUwbn2F/pVUs5DrtVEIdcPw8Jpe3qjr8ex5cfznmPNg2+QfCsALUAVQA
 A9Ahma5gAYeLR7ZgTjTpkvfO3FaLg==;
Message-Id: <f74b6153e079fc7a340e5cb575ee32e0fe1e0ae6.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:53:55 +0200
Subject: [PATCH 11/20] tests/9p: simplify callers of tlopen()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=f74b6153e079fc7a340e5cb575ee32e0fe1e0ae6@lizzy.crudebyte.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now as tlopen() is using a declarative approach, simplify the
code of callers of this function.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
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


