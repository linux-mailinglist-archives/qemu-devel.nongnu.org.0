Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F047F1D1132
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:22:22 +0200 (CEST)
Received: from localhost ([::1]:45412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYpSv-0002Q7-Vf
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpEM-000369-4F
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:07:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27142
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpEH-0003qm-Qb
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589368033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zXbtFkmb9r4SYZ+INvfFVGZt+ZhHFW3htkkNt/yy9EE=;
 b=cX4hOKXcmDcntD1ZF5OUk3ZjwXWLTXrpRlTLvMA3/Uvwek7eliqnEBdxjwN1AJ8NHAdek/
 fozMawrRu7OVbiNl7HMWEHcPCNIx7JOXo9HitEQzOlucpcPnf86k42LdMKzDs3RJrqDiOs
 n6pHSS9RdmFL+xID9yqGx1+oD2ePhug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-o_ZJNmYXM_atdOzWWbETfg-1; Wed, 13 May 2020 07:07:07 -0400
X-MC-Unique: o_ZJNmYXM_atdOzWWbETfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 321486EAFB;
 Wed, 13 May 2020 11:07:06 +0000 (UTC)
Received: from localhost (unknown [10.40.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF0885C1D2;
 Wed, 13 May 2020 11:07:05 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 30/34] block: Make bdrv_filter_default_perms() static
Date: Wed, 13 May 2020 13:05:40 +0200
Message-Id: <20200513110544.176672-31-mreitz@redhat.com>
In-Reply-To: <20200513110544.176672-1-mreitz@redhat.com>
References: <20200513110544.176672-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 01:56:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h | 10 ----------
 block.c                   | 17 +++++++++++------
 2 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 0781d43af5..6fc5f0d333 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1262,16 +1262,6 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
  */
 int bdrv_child_refresh_perms(BlockDriverState *bs, BdrvChild *c, Error **errp);
 
-/* Default implementation for BlockDriver.bdrv_child_perm() that can be used by
- * block filters: Forward CONSISTENT_READ, WRITE, WRITE_UNCHANGED and RESIZE to
- * all children */
-void bdrv_filter_default_perms(BlockDriverState *bs, BdrvChild *c,
-                               const BdrvChildClass *child_class,
-                               BdrvChildRole child_role,
-                               BlockReopenQueue *reopen_queue,
-                               uint64_t perm, uint64_t shared,
-                               uint64_t *nperm, uint64_t *nshared);
-
 /* Default implementation for BlockDriver.bdrv_child_perm() that can be used by
  * (non-raw) image formats: Like above for bs->backing, but for bs->file it
  * requires WRITE | RESIZE for read-write images, always requires
diff --git a/block.c b/block.c
index fb94adcca4..54bc1c3b2d 100644
--- a/block.c
+++ b/block.c
@@ -2382,12 +2382,17 @@ int bdrv_child_refresh_perms(BlockDriverState *bs, BdrvChild *c, Error **errp)
     return bdrv_child_try_set_perm(c, perms, shared, errp);
 }
 
-void bdrv_filter_default_perms(BlockDriverState *bs, BdrvChild *c,
-                               const BdrvChildClass *child_class,
-                               BdrvChildRole role,
-                               BlockReopenQueue *reopen_queue,
-                               uint64_t perm, uint64_t shared,
-                               uint64_t *nperm, uint64_t *nshared)
+/*
+ * Default implementation for .bdrv_child_perm() for block filters:
+ * Forward CONSISTENT_READ, WRITE, WRITE_UNCHANGED, and RESIZE to the
+ * filtered child.
+ */
+static void bdrv_filter_default_perms(BlockDriverState *bs, BdrvChild *c,
+                                      const BdrvChildClass *child_class,
+                                      BdrvChildRole role,
+                                      BlockReopenQueue *reopen_queue,
+                                      uint64_t perm, uint64_t shared,
+                                      uint64_t *nperm, uint64_t *nshared)
 {
     *nperm = perm & DEFAULT_PERM_PASSTHROUGH;
     *nshared = (shared & DEFAULT_PERM_PASSTHROUGH) | DEFAULT_PERM_UNCHANGED;
-- 
2.26.2


