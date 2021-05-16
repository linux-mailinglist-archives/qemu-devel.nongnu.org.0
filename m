Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBBB382042
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 20:10:07 +0200 (CEST)
Received: from localhost ([::1]:33016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liLDJ-0005fs-JU
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 14:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0eec3beb82ef137e20cf6f5ac07b0049cd314463@lizzy.crudebyte.com>)
 id 1liLBV-0004ym-KY
 for qemu-devel@nongnu.org; Sun, 16 May 2021 14:08:13 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:39219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0eec3beb82ef137e20cf6f5ac07b0049cd314463@lizzy.crudebyte.com>)
 id 1liLBS-0002Bd-JJ
 for qemu-devel@nongnu.org; Sun, 16 May 2021 14:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=G79lVmtym+xutLubi7aAXG7xmx7rth7ox5YVCmYh3Cg=; b=k//JY
 EW1ercYu3dxYDWMnyVW8KFBq86QtxEIC4W31lAUTQLAe4A54Ndz9iFXxqKS+3bjSE+hTtL8esS0pg
 ESTUzNkUxJjPsziwQRzKGn+ybviaks2VsNSNdnuU3tyB3llSAmtz4TkTcPdeB2/dKMLRlCZKW+YLd
 FmztyZfXmnNOqNd8iGuJhg/XVryGgNNviPfB/AbP1TiO6x8MmbPfWnG4ksHTlCtO6E1ZVHZmvaPM5
 y1slYbWxkyRWM03d82AKjjrT0favt82Ry0udbQTxPpBwa7GUpX1jxUrYAM52IL4z9SRjzmWKdssHu
 DdEmZN/Z+Cb4pMdekPjjPcDgf/Wng==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 16 May 2021 17:55:34 +0200
Subject: [PATCH] 9pfs: simplify v9fs_walk()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Message-Id: <E1liKiz-0006BC-Ja@lizzy.crudebyte.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=0eec3beb82ef137e20cf6f5ac07b0049cd314463@lizzy.crudebyte.com;
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

There is only one comparison between nwnames and P9_MAXWELEM required.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 0fa776af09..89aa07db78 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1739,7 +1739,11 @@ static void coroutine_fn v9fs_walk(void *opaque)
 
     trace_v9fs_walk(pdu->tag, pdu->id, fid, newfid, nwnames);
 
-    if (nwnames && nwnames <= P9_MAXWELEM) {
+    if (nwnames > P9_MAXWELEM) {
+        err = -EINVAL;
+        goto out_nofid;
+    }
+    if (nwnames) {
         wnames = g_new0(V9fsString, nwnames);
         qids   = g_new0(V9fsQID, nwnames);
         for (i = 0; i < nwnames; i++) {
@@ -1753,9 +1757,6 @@ static void coroutine_fn v9fs_walk(void *opaque)
             }
             offset += err;
         }
-    } else if (nwnames > P9_MAXWELEM) {
-        err = -EINVAL;
-        goto out_nofid;
     }
     fidp = get_fid(pdu, fid);
     if (fidp == NULL) {
-- 
2.20.1


