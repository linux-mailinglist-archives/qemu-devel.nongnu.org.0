Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8882E3FDEB9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:34:18 +0200 (CEST)
Received: from localhost ([::1]:57642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSFl-0003Sv-J5
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRz8-0004NA-O3
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRz6-0003Yy-Tj
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0QRPJ2sCMvYzVCegQ2/2TxlcXzRemOgzbmSlUjg472s=;
 b=S8SWQwgGq0amO06OmUGQkh/8TsVQiJbdApCWShYAatgbEXJ2XVLRNI6rAUn+GIjp0jMcjc
 ZwuEu7PbgWnJyOF75W0GDuj2MByLpuaEEKVvBFbx4tejwLryy0ky9Qsv899QSIh1hFK4Xy
 ER16isJq6Pvr0XVcdNU6mhPKbtIapZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-dyhVIbpPNB-236uqqm14gQ-1; Wed, 01 Sep 2021 11:17:00 -0400
X-MC-Unique: dyhVIbpPNB-236uqqm14gQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB38287D541;
 Wed,  1 Sep 2021 15:16:59 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 712305C1BB;
 Wed,  1 Sep 2021 15:16:59 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 18/56] raw-format: drop WRITE and RESIZE child perms when
 possible
Date: Wed,  1 Sep 2021 17:15:41 +0200
Message-Id: <20210901151619.689075-19-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The following command-line fails due to a permissions conflict:

  $ qemu-storage-daemon \
      --blockdev driver=nvme,node-name=nvme0,device=0000:08:00.0,namespace=1 \
      --blockdev driver=raw,node-name=l1-1,file=nvme0,offset=0,size=1073741824 \
      --blockdev driver=raw,node-name=l1-2,file=nvme0,offset=1073741824,size=1073741824 \
      --nbd-server addr.type=unix,addr.path=/tmp/nbd.sock,max-connections=2 \
      --export type=nbd,id=nbd-l1-1,node-name=l1-1,name=l1-1,writable=on \
      --export type=nbd,id=nbd-l1-2,node-name=l1-2,name=l1-2,writable=on

  qemu-storage-daemon: --export type=nbd,id=nbd-l1-1,node-name=l1-1,name=l1-1,writable=on: Permission conflict on node 'nvme0': permissions 'resize' are both required by node 'l1-1' (uses node 'nvme0' as 'file' child) and unshared by node 'l1-2' (uses node 'nvme0' as 'file' child).

The problem is that block/raw-format.c relies on bdrv_default_perms() to
set permissions on the nvme node. The default permissions add RESIZE in
anticipation of a format driver like qcow2 that needs to grow the image
file. This fails because RESIZE is unshared, so we cannot get the RESIZE
permission.

Max Reitz pointed out that block/crypto.c already handles this case by
implementing a custom ->bdrv_child_perm() function that adjusts the
result of bdrv_default_perms().

This patch takes the same approach in block/raw-format.c so that RESIZE
is only required if it's actually necessary (e.g. the parent is qcow2).

Cc: Max Reitz <mreitz@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210726122839.822900-1-stefanha@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/raw-format.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/block/raw-format.c b/block/raw-format.c
index 7717578ed6..c26f493688 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -580,6 +580,25 @@ static void raw_cancel_in_flight(BlockDriverState *bs)
     bdrv_cancel_in_flight(bs->file->bs);
 }
 
+static void raw_child_perm(BlockDriverState *bs, BdrvChild *c,
+                           BdrvChildRole role,
+                           BlockReopenQueue *reopen_queue,
+                           uint64_t parent_perm, uint64_t parent_shared,
+                           uint64_t *nperm, uint64_t *nshared)
+{
+    bdrv_default_perms(bs, c, role, reopen_queue, parent_perm,
+                       parent_shared, nperm, nshared);
+
+    /*
+     * bdrv_default_perms() may add WRITE and/or RESIZE (see comment in
+     * bdrv_default_perms_for_storage() for an explanation) but we only need
+     * them if they are in parent_perm. Drop WRITE and RESIZE whenever possible
+     * to avoid permission conflicts.
+     */
+    *nperm &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
+    *nperm |= parent_perm & (BLK_PERM_WRITE | BLK_PERM_RESIZE);
+}
+
 BlockDriver bdrv_raw = {
     .format_name          = "raw",
     .instance_size        = sizeof(BDRVRawState),
@@ -588,7 +607,7 @@ BlockDriver bdrv_raw = {
     .bdrv_reopen_commit   = &raw_reopen_commit,
     .bdrv_reopen_abort    = &raw_reopen_abort,
     .bdrv_open            = &raw_open,
-    .bdrv_child_perm      = bdrv_default_perms,
+    .bdrv_child_perm      = raw_child_perm,
     .bdrv_co_create_opts  = &raw_co_create_opts,
     .bdrv_co_preadv       = &raw_co_preadv,
     .bdrv_co_pwritev      = &raw_co_pwritev,
-- 
2.31.1


