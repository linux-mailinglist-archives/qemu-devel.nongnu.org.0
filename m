Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5FD41EFB9
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 16:39:24 +0200 (CEST)
Received: from localhost ([::1]:36184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWJh5-0000FS-LD
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 10:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <90c65d1c1ca11c1b434bb981b1fc7966f7711c8f@lizzy.crudebyte.com>)
 id 1mWJeJ-00060A-84
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 10:36:31 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:52385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <90c65d1c1ca11c1b434bb981b1fc7966f7711c8f@lizzy.crudebyte.com>)
 id 1mWJeF-0000KX-78
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 10:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=3OBiAx6C0M0rhaY42snruvUrjvS8jDJBhw5E8qTtmnk=; b=XeVIU
 Owmb+YasrtUMvIWHNmMsM6e3l+jrb/FhFbFyRwihEeT4qvdiEtLmmDC9hhfU+/3dFKOQz7PpFjBLc
 vUL4R2e25A2TIuNMsRO6x1QzcHSiTa2E4t3BYIBOppRmBrFNgLCGpsIzOV+sraEleurvj7b1mCwpJ
 7eJNjlBW0LuXZMjN1mZDaRTQhuJwnG5H7o0h+eim93nsB10DfkTID6PWhicgLCAIcHbVwIxBCZ6Sw
 bgWjT+VEEExMgbX5GyRMtESBaclyUwPND0DXK0gKuPk4BMtwbWjj0dcvNRojgsqV98LtVaz7rKyOl
 1GiwyGejBaRv4Q6i73RXwgaEUXQrw==;
Message-Id: <90c65d1c1ca11c1b434bb981b1fc7966f7711c8f.1633097129.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1633097129.git.qemu_oss@crudebyte.com>
References: <cover.1633097129.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 1 Oct 2021 16:27:59 +0200
Subject: [PATCH 5/5] 9pfs: use P9Array in v9fs_walk()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=90c65d1c1ca11c1b434bb981b1fc7966f7711c8f@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index e432c4c007..27c4b8ba78 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1707,13 +1707,14 @@ static void coroutine_fn v9fs_walk(void *opaque)
     int name_idx;
     g_autofree V9fsQID *qids = NULL;
     int i, err = 0;
-    V9fsPath dpath, path, *pathes = NULL;
+    V9fsPath dpath, path;
+    P9ARRAY_REF(V9fsPath) pathes = NULL;
     uint16_t nwnames;
     struct stat stbuf, fidst;
     g_autofree struct stat *stbufs = NULL;
     size_t offset = 7;
     int32_t fid, newfid;
-    V9fsString *wnames = NULL;
+    P9ARRAY_REF(V9fsString) wnames = NULL;
     V9fsFidState *fidp;
     V9fsFidState *newfidp = NULL;
     V9fsPDU *pdu = opaque;
@@ -1734,10 +1735,10 @@ static void coroutine_fn v9fs_walk(void *opaque)
         goto out_nofid;
     }
     if (nwnames) {
-        wnames = g_new0(V9fsString, nwnames);
+        P9ARRAY_NEW(V9fsString, wnames, nwnames);
         qids   = g_new0(V9fsQID, nwnames);
         stbufs = g_new0(struct stat, nwnames);
-        pathes = g_new0(V9fsPath, nwnames);
+        P9ARRAY_NEW(V9fsPath, pathes, nwnames);
         for (i = 0; i < nwnames; i++) {
             err = pdu_unmarshal(pdu, offset, "s", &wnames[i]);
             if (err < 0) {
@@ -1869,14 +1870,6 @@ out:
     v9fs_path_free(&path);
 out_nofid:
     pdu_complete(pdu, err);
-    if (nwnames && nwnames <= P9_MAXWELEM) {
-        for (name_idx = 0; name_idx < nwnames; name_idx++) {
-            v9fs_string_free(&wnames[name_idx]);
-            v9fs_path_free(&pathes[name_idx]);
-        }
-        g_free(wnames);
-        g_free(pathes);
-    }
 }
 
 static int32_t coroutine_fn get_iounit(V9fsPDU *pdu, V9fsPath *path)
-- 
2.20.1


