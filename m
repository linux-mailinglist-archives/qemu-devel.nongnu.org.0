Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0861D115F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:31:12 +0200 (CEST)
Received: from localhost ([::1]:50160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYpbT-0000y1-9N
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpF6-0004Zv-2N
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:08:04 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35894
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpF5-0004K8-6n
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589368082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFt9UEQp1qP8LWDTXnr3PSnBaMqn26ekwwLPQFuga/8=;
 b=f2lyWkpAOqwEs5cn6qmnbflpQGOIHx17cdD3ISZMGd8y7nIKgHNLeapSd63l5RHgUI9tpZ
 ZgjP/QTm+WPiazbEGq58cD9nKQXdKM7PDXcADDWPaCOmVLrTlKqjud7CISFI0aiO/QSGJF
 j2Sz5UE2e6VYQjxfXL8OdFV+wqnNxZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-WgjUd7nGPHKiK6P464Kt8Q-1; Wed, 13 May 2020 07:07:14 -0400
X-MC-Unique: WgjUd7nGPHKiK6P464Kt8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C026D801504;
 Wed, 13 May 2020 11:07:13 +0000 (UTC)
Received: from localhost (unknown [10.40.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56A0378B20;
 Wed, 13 May 2020 11:07:13 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 33/34] block: Pass BdrvChildRole in remaining cases
Date: Wed, 13 May 2020 13:05:43 +0200
Message-Id: <20200513110544.176672-34-mreitz@redhat.com>
In-Reply-To: <20200513110544.176672-1-mreitz@redhat.com>
References: <20200513110544.176672-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
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

These calls have no real use for the child role yet, but it will not
harm to give one.

Notably, the bdrv_root_attach_child() call in blockjob.c is left
unmodified because there is not much the generic BlockJob object wants
from its children.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/block-backend.c | 11 +++++++----
 block/vvfat.c         |  4 +++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index f2e81af27d..6936b25c83 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -424,8 +424,9 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
         return NULL;
     }
 
-    blk->root = bdrv_root_attach_child(bs, "root", &child_root, 0, blk->ctx,
-                                       perm, BLK_PERM_ALL, blk, errp);
+    blk->root = bdrv_root_attach_child(bs, "root", &child_root,
+                                       BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                       blk->ctx, perm, BLK_PERM_ALL, blk, errp);
     if (!blk->root) {
         blk_unref(blk);
         return NULL;
@@ -835,8 +836,10 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
 {
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
     bdrv_ref(bs);
-    blk->root = bdrv_root_attach_child(bs, "root", &child_root, 0, blk->ctx,
-                                       blk->perm, blk->shared_perm, blk, errp);
+    blk->root = bdrv_root_attach_child(bs, "root", &child_root,
+                                       BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                       blk->ctx, blk->perm, blk->shared_perm,
+                                       blk, errp);
     if (blk->root == NULL) {
         return -EPERM;
     }
diff --git a/block/vvfat.c b/block/vvfat.c
index e8848a0497..089abe1e29 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3184,7 +3184,9 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
     options = qdict_new();
     qdict_put_str(options, "write-target.driver", "qcow");
     s->qcow = bdrv_open_child(s->qcow_filename, options, "write-target", bs,
-                              &child_vvfat_qcow, 0, false, errp);
+                              &child_vvfat_qcow,
+                              BDRV_CHILD_DATA | BDRV_CHILD_METADATA,
+                              false, errp);
     qobject_unref(options);
     if (!s->qcow) {
         ret = -EINVAL;
-- 
2.26.2


