Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D943B86D3
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:09:57 +0200 (CEST)
Received: from localhost ([::1]:55948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycmi-0006em-AV
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycg8-00035s-Jl
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:03:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfj-00078f-Ih
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:03:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dFLfy8QTG/Oo/Bksf8jc34H2gBsyB0yMczmjA5TkneA=;
 b=TF+KiAYrYiSdzP1VhCTHPWk9qp9CAGQqr4n5fcMw8j7hs1dE5KQPKMJyNfNvz3HTbIK5WQ
 rFuODuTzOLYJJ23MxLEJSiUOgahelp9GuB6wOpkFLpUSJkyW3vBoQfX+fBJ2P0m0sonw6T
 DG7vjg4DfItIDSJRuu1ZujKtguG81Nc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-8IFs9LX4NWClZ98D6xNgdQ-1; Wed, 30 Jun 2021 12:02:18 -0400
X-MC-Unique: 8IFs9LX4NWClZ98D6xNgdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB12C804140;
 Wed, 30 Jun 2021 16:02:17 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B714A5B826;
 Wed, 30 Jun 2021 16:02:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/24] block: comment graph-modifying function not updating
 permissions
Date: Wed, 30 Jun 2021 18:01:47 +0200
Message-Id: <20210630160206.276439-6-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210610112618.127378-3-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/block.c b/block.c
index e49ff8c078..9518f0e087 100644
--- a/block.c
+++ b/block.c
@@ -2770,6 +2770,8 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
  * @child is saved to a new entry of @tran, so that *@child could be reverted to
  * NULL on abort(). So referenced variable must live at least until transaction
  * end.
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static int bdrv_attach_child_common(BlockDriverState *child_bs,
                                     const char *child_name,
@@ -2848,6 +2850,8 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
 /*
  * Variable referenced by @child must live at least until transaction end.
  * (see bdrv_attach_child_common() doc for details)
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
                                     BlockDriverState *child_bs,
@@ -3115,6 +3119,8 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
 /*
  * Sets the bs->backing link of a BDS. A new reference is created; callers
  * which don't need their own reference any more must call bdrv_unref().
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static int bdrv_set_backing_noperm(BlockDriverState *bs,
                                    BlockDriverState *backing_hd,
@@ -4792,6 +4798,8 @@ static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
  * A function to remove backing-chain child of @bs if exists: cow child for
  * format nodes (always .backing) and filter child for filters (may be .file or
  * .backing)
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran)
-- 
2.31.1


