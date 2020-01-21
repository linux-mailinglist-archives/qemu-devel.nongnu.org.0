Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0FE14355F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 02:49:44 +0100 (CET)
Received: from localhost ([::1]:46976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itifn-0003Yk-HG
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 20:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44678)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <4dc3706db1f033d922e54af8c74a81211de8b79f@lizzy.crudebyte.com>)
 id 1itiZU-0007F8-Bd
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 20:43:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <4dc3706db1f033d922e54af8c74a81211de8b79f@lizzy.crudebyte.com>)
 id 1itiZT-0005rf-4E
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 20:43:12 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:38641)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <4dc3706db1f033d922e54af8c74a81211de8b79f@lizzy.crudebyte.com>)
 id 1itiZS-0005XM-U7
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 20:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=vu0dqCqcG6K1n4xl5xtb16c1t1l699AZi/3FL1spxqs=; b=JhNhC
 lZ37XCKX0ZOPCP5GVEhAWQxZTuEncRD2OjbtzmtKuV3X0zttKrqsGGom4CEF2/Fig9XrPZatS0kgH
 /OnG7zhYMnf7e2uDfGppWitk1rtAiOq6iqO4JUmaqdtju7Mv7Z+pOAbwYp8mOi5lHVnfJQiFwTNCP
 ng1iYxN8gzRi1B/+TxnfN+2s7KFZ4EjYke5+uzbaKNolTTOAmtkJRDfffkEicZ3JUBjQFG46UJSZk
 6ECIVDJtj3jAaYQuKMOFq37l0SOT4kl7+z3Sl3bN30U+uSGWJCJjacfoeLnZY61t9GFSIP/t6Q89l
 OXqNdyhDhOVtYQop36kS5Y+omZx1g==;
Message-Id: <4dc3706db1f033d922e54af8c74a81211de8b79f.1579567020.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1579567019.git.qemu_oss@crudebyte.com>
References: <cover.1579567019.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 21 Jan 2020 01:17:35 +0100
Subject: [PATCH v4 07/11] tests/virtio-9p: failing splitted readdir test
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.194.90.13
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

This patch is not intended to be merged. It resembles
an issue (with debug messages) where the splitted
readdir test fails because server is interrupted with
transport error "Failed to decode VirtFS request type 40",
which BTW fails both with the unoptimized and with the
optimized 9p readdir code.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 8b0d94546e..e47b286340 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -647,13 +647,14 @@ static void fs_readdir_split(void *obj, void *data, QGuestAllocator *t_alloc)
     int fid;
     uint64_t offset;
     /* the Treaddir 'count' parameter values to be tested */
-    const uint32_t vcount[] = { 512, 256 };
+    const uint32_t vcount[] = { 512, 256, 128 };
     const int nvcount = sizeof(vcount) / sizeof(uint32_t);
 
     fs_attach(v9p, NULL, t_alloc);
 
     /* iterate over all 'count' parameter values to be tested with Treaddir */
     for (subtest = 0; subtest < nvcount; ++subtest) {
+        printf("\nsubtest[%d] with count=%d\n", subtest, vcount[subtest]);
         fid = subtest + 1;
         offset = 0;
         entries = NULL;
@@ -674,12 +675,16 @@ static void fs_readdir_split(void *obj, void *data, QGuestAllocator *t_alloc)
          * entries
          */
         while (true) {
+            printf("\toffset=%ld\n", offset);
             npartialentries = 0;
             partialentries = NULL;
 
+            printf("Treaddir fid=%d offset=%ld count=%d\n",
+                   fid, offset, vcount[subtest]);
             req = v9fs_treaddir(v9p, fid, offset, vcount[subtest], 0);
             v9fs_req_wait_for_reply(req, NULL);
             v9fs_rreaddir(req, &count, &npartialentries, &partialentries);
+            printf("\t\tnpartial=%d nentries=%d\n", npartialentries, nentries);
             if (npartialentries > 0 && partialentries) {
                 if (!entries) {
                     entries = partialentries;
@@ -716,6 +721,8 @@ static void fs_readdir_split(void *obj, void *data, QGuestAllocator *t_alloc)
         }
 
         v9fs_free_dirents(entries);
+
+        printf("PASSED subtest[%d]\n", subtest);
     }
 
     g_free(wnames[0]);
-- 
2.20.1


