Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23861D1102
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:17:55 +0200 (CEST)
Received: from localhost ([::1]:56394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYpOc-0003SM-Nl
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpDx-0002ba-EA
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:06:53 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56996
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpDv-0003W6-LQ
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589368010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dMQaVbjJX5uhHdiLqp9dJtd4RxOpfJa8+fJcAuWWp54=;
 b=e1aQpsqeGjc1x564Y7LMf9DPIw/VANOWFYgxYDHUfn4Pz+t0pXiePb5wkrDgVEDtSanHUn
 cJP6KnSLWxe+n9hZopxpiQb7oFtyCoM/yqm3TWMGDkTPgcTSK2pYMtkFLXIEiBBSfZMqfB
 Eipk1xo2a3z32pPIelvdFBG4whUMYQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-pOmQiHPvNmSQIOs8iTlerQ-1; Wed, 13 May 2020 07:06:46 -0400
X-MC-Unique: pOmQiHPvNmSQIOs8iTlerQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FA50106B243;
 Wed, 13 May 2020 11:06:45 +0000 (UTC)
Received: from localhost (unknown [10.40.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 175E45D9E8;
 Wed, 13 May 2020 11:06:44 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 22/34] block: Drop child_format
Date: Wed, 13 May 2020 13:05:32 +0200
Message-Id: <20200513110544.176672-23-mreitz@redhat.com>
In-Reply-To: <20200513110544.176672-1-mreitz@redhat.com>
References: <20200513110544.176672-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 04:17:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
 include/block/block_int.h |  1 -
 block.c                   | 29 -----------------------------
 2 files changed, 30 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 3a9dda9be7..4b09fa1124 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -742,7 +742,6 @@ struct BdrvChildClass {
 
 extern const BdrvChildClass child_of_bds;
 extern const BdrvChildClass child_file;
-extern const BdrvChildClass child_format;
 extern const BdrvChildClass child_backing;
 
 struct BdrvChild {
diff --git a/block.c b/block.c
index 088727fdbe..85b4f947ba 100644
--- a/block.c
+++ b/block.c
@@ -1172,35 +1172,6 @@ const BdrvChildClass child_file = {
     .set_aio_ctx     = bdrv_child_cb_set_aio_ctx,
 };
 
-/*
- * Returns the options and flags that bs->file should get if the use of formats
- * (and not only protocols) is permitted for it, based on the given options and
- * flags for the parent BDS
- */
-static void bdrv_inherited_fmt_options(BdrvChildRole role,
-                                       bool parent_is_format,
-                                       int *child_flags, QDict *child_options,
-                                       int parent_flags, QDict *parent_options)
-{
-    bdrv_inherited_options(BDRV_CHILD_DATA, false,
-                           child_flags, child_options,
-                           parent_flags, parent_options);
-}
-
-const BdrvChildClass child_format = {
-    .parent_is_bds   = true,
-    .get_parent_desc = bdrv_child_get_parent_desc,
-    .inherit_options = bdrv_inherited_fmt_options,
-    .drained_begin   = bdrv_child_cb_drained_begin,
-    .drained_poll    = bdrv_child_cb_drained_poll,
-    .drained_end     = bdrv_child_cb_drained_end,
-    .attach          = bdrv_child_cb_attach,
-    .detach          = bdrv_child_cb_detach,
-    .inactivate      = bdrv_child_cb_inactivate,
-    .can_set_aio_ctx = bdrv_child_cb_can_set_aio_ctx,
-    .set_aio_ctx     = bdrv_child_cb_set_aio_ctx,
-};
-
 static void bdrv_backing_attach(BdrvChild *c)
 {
     BlockDriverState *parent = c->opaque;
-- 
2.26.2


