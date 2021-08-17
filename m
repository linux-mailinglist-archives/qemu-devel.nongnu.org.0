Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AC53EEE1F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 16:07:49 +0200 (CEST)
Received: from localhost ([::1]:38264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFzkl-00038n-BZ
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 10:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b51670d2a39399535a035f6bc77c3cbeed85edae@lizzy.crudebyte.com>)
 id 1mFzj0-0000sf-OK
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:05:54 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:57549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b51670d2a39399535a035f6bc77c3cbeed85edae@lizzy.crudebyte.com>)
 id 1mFziz-0006fP-EM
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=6dyL740HRzi5q7b7aP9+G2NOBKE2CUMD9VrR61TTY1E=; b=Kglrg
 R1QeSDwHgKTtuVNqb6V8EoZw3GWlggO17bxYsUDhKsf84qh7116K7FYg2XCgkSYhra/lqueK3l7qu
 kzxfwgaMHKXHCuBdN0mc7sg2YLdVPmmofrENmqSMq0IUr+Lz33lC5YEQDHx1PobqFfuN8018ghfb2
 SbyfqXz/P2o7sAAHmXmhNHcsPIiPvagzSg/9RrjJ8FnbDR1RYIAFC9RE4gl4sE9obs+Lcb+J/8/dA
 lzf+eJOuewTjQQr4FvJv+p4yIen5Td+WXo0Dcf3A7cs/QM/s6dB37VVjMeqjQ/uoTTYn0eQAJIjJa
 J1LIxQ3IXhudH7xZYkhkzjeBM7sqA==;
Message-Id: <b51670d2a39399535a035f6bc77c3cbeed85edae.1629208359.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1629208359.git.qemu_oss@crudebyte.com>
References: <cover.1629208359.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 17 Aug 2021 15:46:50 +0200
Subject: [PATCH 2/2] hw/9pfs: use g_autofree in v9fs_walk() where possible
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=b51670d2a39399535a035f6bc77c3cbeed85edae@lizzy.crudebyte.com;
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

Suggested-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 4d642ab12a..c857b31321 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1703,11 +1703,12 @@ static bool same_stat_id(const struct stat *a, const struct stat *b)
 static void coroutine_fn v9fs_walk(void *opaque)
 {
     int name_idx;
-    V9fsQID *qids = NULL;
+    g_autofree V9fsQID *qids = NULL;
     int i, err = 0;
     V9fsPath dpath, path, *pathes = NULL;
     uint16_t nwnames;
-    struct stat stbuf, fidst, *stbufs = NULL;
+    struct stat stbuf, fidst;
+    g_autofree struct stat *stbufs = NULL;
     size_t offset = 7;
     int32_t fid, newfid;
     V9fsString *wnames = NULL;
@@ -1872,8 +1873,6 @@ out_nofid:
             v9fs_path_free(&pathes[name_idx]);
         }
         g_free(wnames);
-        g_free(qids);
-        g_free(stbufs);
         g_free(pathes);
     }
 }
-- 
2.20.1


