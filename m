Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C2E2A27A8
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 11:02:21 +0100 (CET)
Received: from localhost ([::1]:36084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZWfM-0008GD-Tb
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 05:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c1934f630c131ec487d21949c9b53e1e3f2b8bcb@lizzy.crudebyte.com>)
 id 1kZWUI-0002Vo-3Y
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 04:50:54 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:38597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c1934f630c131ec487d21949c9b53e1e3f2b8bcb@lizzy.crudebyte.com>)
 id 1kZWUG-0006yf-9C
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 04:50:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=aD1UXjgSwBFRvYSpDfMbtCtrntAFlYlhy4F3gNLqgXU=; b=F7Zh1
 pNTkkfwGbUNB/q1ViEVRkeIANP9hdZBbZ3PQB3p3vOrv4RgMV4g8BhOct7106lytftOzHDgksbwV+
 LDfvbtk1P12sGWvDFcuMxCHY3Atipa25AN9C3cdJKWYQjRa0Pg475ewHh4gEoD2e/0t5roVswbJot
 W/yBjRs1HfFLxf74eVUosjQ3SoI0SeOExttZ+ij8mPeEZZ2hM1jxmoM3KG37hmmaYEBulVzzDfJ4D
 EF7m8tlfnt+sfCSDYUEIVKpSiHBC3RvXKuxZrxRyKFpEYRjAzvJRke9gPl8lBQECZWpql7pQkKiVL
 Jzn/wa820/poHUBWZtP407tYQ+Osg==;
Message-Id: <c1934f630c131ec487d21949c9b53e1e3f2b8bcb.1604309512.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1604309512.git.qemu_oss@crudebyte.com>
References: <cover.1604309512.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 20 Oct 2020 18:09:41 +0200
Subject: [PULL v3 09/17] tests/9pfs: Turn fs_mkdir() into a helper
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=c1934f630c131ec487d21949c9b53e1e3f2b8bcb@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 04:48:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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

From: Greg Kurz <groug@kaod.org>

fs_mkdir() isn't a top level test function and thus shouldn't take
the "void *obj, void *data, QGuestAllocator *t_alloc" arguments.
Turn it into a helper to be used by test functions.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <160321018148.266767.15959608711038504029.stgit@bahia.lan>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 734b4bcb7a..6f8c46a645 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -972,11 +972,8 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(wnames[0]);
 }
 
-static void fs_mkdir(void *obj, void *data, QGuestAllocator *t_alloc,
-                     const char *path, const char *cname)
+static void do_mkdir(QVirtio9P *v9p, const char *path, const char *cname)
 {
-    QVirtio9P *v9p = obj;
-    alloc = t_alloc;
     char **wnames;
     char *const name = g_strdup(cname);
     P9Req *req;
@@ -1031,7 +1028,7 @@ static void fs_create_dir(void *obj, void *data, QGuestAllocator *t_alloc)
     g_assert(root_path != NULL);
 
     do_attach(v9p);
-    fs_mkdir(v9p, data, t_alloc, "/", "01");
+    do_mkdir(v9p, "/", "01");
 
     /* check if created directory really exists now ... */
     g_assert(stat(new_dir, &st) == 0);
-- 
2.20.1


