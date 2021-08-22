Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0523F3F82
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 15:33:10 +0200 (CEST)
Received: from localhost ([::1]:34610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHnb3-0006KQ-UN
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 09:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <18150291edc827161bf631e1d4618ebcdf259da2@lizzy.crudebyte.com>)
 id 1mHnZ0-0003WS-Tf
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 09:31:03 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:55553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <18150291edc827161bf631e1d4618ebcdf259da2@lizzy.crudebyte.com>)
 id 1mHnYz-0001QH-9C
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 09:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=5jKfd6sVikDt3oYLoGttLhQ8l3eB72EFDlpIpChG4sE=; b=M0JOl
 DqEfR+5iOwujrGq/4tKmqWmWGzWhhv47ZU+hr3geEuv54IxYNa47VLOaS+m+QJi6hOw0HthBNS5Cb
 mx6ia+cD8V5ugHxhqPF5Hu3XkcPFuDL20D6tXdu75Lr6I/blwiJtyqDFZOnidgbt3OIupKiGjxmG4
 L1Qn4vj0yPl+Bo5xwYy4/XBHOtHEKl3tQE7bXRuWYPc8bj0x3OQFMaVmADLlJIpzmL5Cbk0zJvEFz
 WovJI6JQHIhJXrdDeb5VOIfjmXOx/DCH2WkXREFFbcZgTQ4JlnBjU5jvpvbwJHYiLV785uvDWZo3W
 gD81/DPufgVVxinSXxHuSaf0ae9zA==;
Message-Id: <18150291edc827161bf631e1d4618ebcdf259da2.1629638507.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1629638507.git.qemu_oss@crudebyte.com>
References: <cover.1629638507.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 22 Aug 2021 15:17:22 +0200
Subject: [PATCH v2 5/5] 9pfs: use QArray in v9fs_walk()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=18150291edc827161bf631e1d4618ebcdf259da2@lizzy.crudebyte.com;
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
index b59572fa79..91062ee4d6 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1707,13 +1707,14 @@ static void coroutine_fn v9fs_walk(void *opaque)
     int name_idx;
     g_autofree V9fsQID *qids = NULL;
     int i, err = 0;
-    V9fsPath dpath, path, *pathes = NULL;
+    V9fsPath dpath, path;
+    QArrayRef(V9fsPath) pathes = NULL;
     uint16_t nwnames;
     struct stat stbuf, fidst;
     g_autofree struct stat *stbufs = NULL;
     size_t offset = 7;
     int32_t fid, newfid;
-    V9fsString *wnames = NULL;
+    QArrayRef(V9fsString) wnames = NULL;
     V9fsFidState *fidp;
     V9fsFidState *newfidp = NULL;
     V9fsPDU *pdu = opaque;
@@ -1734,10 +1735,10 @@ static void coroutine_fn v9fs_walk(void *opaque)
         goto out_nofid;
     }
     if (nwnames) {
-        wnames = g_new0(V9fsString, nwnames);
+        QARRAY_CREATE(V9fsString, wnames, nwnames);
         qids   = g_new0(V9fsQID, nwnames);
         stbufs = g_new0(struct stat, nwnames);
-        pathes = g_new0(V9fsPath, nwnames);
+        QARRAY_CREATE(V9fsPath, pathes, nwnames);
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


