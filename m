Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C1339BEEA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:36:16 +0200 (CEST)
Received: from localhost ([::1]:43826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDjz-0001mH-QF
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ca0abae4a899d81c6e87f683732d6c1f56915232@lizzy.crudebyte.com>)
 id 1lpCsy-0000yN-3K
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:41:28 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:49103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ca0abae4a899d81c6e87f683732d6c1f56915232@lizzy.crudebyte.com>)
 id 1lpCsu-0005Wc-RH
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=T+lQuspu33wgxRAA04EmrtYl0EHAhUewwRdhgr8o94A=; b=TiEyo
 ldI+cASiF21aApsCo0AFQCrJZhq6+U/Q9KUPwtX/bpRcUi4/KGy3iSQ/Go4Ks+EgMjTIOXwtekuVW
 i2E+7c5xDCFWRx830SVCfqufKgGSApkYcKuBksW3e6cl4kXdpOGoxwyug9Z0kDsrdYeMPOcqSdyJ4
 95k1KLsi5fd6Ln4H2QsIqm1EN+Gl14RbEniElmIEV5aEilzYWwRTcE7LdO346mm89XyQNU55y/fpF
 +EwwnbTymSszQD4WNeuGeTXKvA2vdYC6ZkMY7QGgE7Bm5HUEk6EHa51cQxeLK/ssl+0bW8GqR+nsz
 ixOLEuji0NrmEdubtGHr5YxwXxNVw==;
Message-Id: <ca0abae4a899d81c6e87f683732d6c1f56915232.1622821729.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1622821729.git.qemu_oss@crudebyte.com>
References: <cover.1622821729.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 4 Jun 2021 16:46:45 +0200
Subject: [PATCH v2 1/7] 9pfs: fix not_same_qid()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=ca0abae4a899d81c6e87f683732d6c1f56915232@lizzy.crudebyte.com;
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

There is only one user of not_same_qid() which is v9fs_walk() and the
latter is using it for comparing a client supplied path with the 9p
export root path, for the sole purpose to prevent a Twalk request
from escaping from the exported 9p tree via "..".

However for that specific purpose the implementation of not_same_qid()
is wrong; if mtime of the 9p export root path changed between Tattach
and Twalk then not_same_qid() returns true when actually comparing
against the export root path.

To fix for the actual semantic being used, only compare QID path
members, but do not compare version or type members.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 89aa07db78..e10a02f71d 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1707,10 +1707,7 @@ static bool name_is_illegal(const char *name)
 
 static bool not_same_qid(const V9fsQID *qid1, const V9fsQID *qid2)
 {
-    return
-        qid1->type != qid2->type ||
-        qid1->version != qid2->version ||
-        qid1->path != qid2->path;
+    return qid1->path != qid2->path;
 }
 
 static void coroutine_fn v9fs_walk(void *opaque)
-- 
2.20.1


