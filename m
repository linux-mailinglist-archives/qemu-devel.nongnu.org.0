Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2919460A17D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 13:25:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omvMo-0000jO-CV; Mon, 24 Oct 2022 07:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a9a53769318503c4d8884e642e00603ea6885cb1@lizzy.crudebyte.com>)
 id 1omvMW-0000aa-2m
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:11:23 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a9a53769318503c4d8884e642e00603ea6885cb1@lizzy.crudebyte.com>)
 id 1omvMQ-00074M-E0
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=2wzS8k/qPl/+/ZL57BA2KxhB7eOcnLEEIO3NGg9aUtY=; b=ozyXF
 XUBlzISm87W+ALuaGL7JWntRQSqNYvUPu4UK0AiFi8EAjgwiizSxvLsL9iPLoHuYaEEijJw4ShaE9
 HM15BBHKtuwv5FlHAsCsfzdL9P/f4gVAMBeJZbbWnFJ6lzIbNjCMosnEk2zFwjUSaZ+wOA/G1ieI1
 uNPq3/YFjz+kEtTaP1kC2f+KHBc8gltZwWL1PzhalQ5A8Hk3sbkba01Wtk6wonbSnt/QYwEJsHrWU
 k92E+1tN/WSQdokSd+Arwb8kJ8V5obG6HP+9yXfQq1i8IKet1elZbrkOCwTl/9WQOVP0AQJp9fNvc
 ZMuCFamOpR2zizmmuhZyLg9ofVwlQ==;
Message-Id: <a9a53769318503c4d8884e642e00603ea6885cb1.1666608862.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1666608862.git.qemu_oss@crudebyte.com>
References: <cover.1666608862.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 24 Oct 2022 12:54:23 +0200
Subject: [PULL 12/23] tests/9p: simplify callers of treaddir()
To: qemu-devel@nongnu.org,
    Stefan Hajnoczi <stefanha@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=a9a53769318503c4d8884e642e00603ea6885cb1@lizzy.crudebyte.com;
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

Now as treaddir() is using a declarative approach, simplify the
code of callers of this function.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <7cec6f2c7011a481806c34908893b7282702a7a6.1664917004.git.qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index e5c174c218..99e24fce0b 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -120,12 +120,12 @@ static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
     /*
      * submit count = msize - 11, because 11 is the header size of Rreaddir
      */
-    req = treaddir({
+    treaddir({
         .client = v9p, .fid = 1, .offset = 0, .count = P9_MAX_SIZE - 11,
-        .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rreaddir(req, &count, &nentries, &entries);
+        .rreaddir = {
+            .count = &count, .nentries = &nentries, .entries = &entries
+        }
+    });
 
     /*
      * Assuming msize (P9_MAX_SIZE) is large enough so we can retrieve all
@@ -190,12 +190,13 @@ static void do_readdir_split(QVirtio9P *v9p, uint32_t count)
         npartialentries = 0;
         partialentries = NULL;
 
-        req = treaddir({
+        treaddir({
             .client = v9p, .fid = fid, .offset = offset, .count = count,
-            .requestOnly = true
-        }).req;
-        v9fs_req_wait_for_reply(req, NULL);
-        v9fs_rreaddir(req, &count, &npartialentries, &partialentries);
+            .rreaddir = {
+                .count = &count, .nentries = &npartialentries,
+                .entries = &partialentries
+            }
+        });
         if (npartialentries > 0 && partialentries) {
             if (!entries) {
                 entries = partialentries;
-- 
2.30.2


