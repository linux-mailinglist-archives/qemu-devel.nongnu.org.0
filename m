Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C6257288A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:24:13 +0200 (CEST)
Received: from localhost ([::1]:34086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNMb-0001qg-2J
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oBNII-0002um-Vf
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:19:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oBNHw-0002JM-Rf
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657660762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vKwPjhdkN7wHkXjdTPsWAmHmdOEoydYRqskDnLyohWw=;
 b=EB3cGdp3LvqcxS30vrCPTwAzbssxL2tkE3xXLA/TZ4oQXiCiIvS3oMSLG+9bG7ma4G6vb2
 Fz5qWrhFr5TbQ0R8Zt3YN0VKpWpcO3r7/Yl1OfFoCnZjXaY6HEXhPUjBivmLHsK5pvYeuN
 5UmDSXPhMWS4lctTDiqvIyYCSVCNOcI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-Lk2Pw80dNp2KGk9g7-HMZw-1; Tue, 12 Jul 2022 17:19:19 -0400
X-MC-Unique: Lk2Pw80dNp2KGk9g7-HMZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B5BE38041DA;
 Tue, 12 Jul 2022 21:19:19 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50A3A2166B2A;
 Tue, 12 Jul 2022 21:19:17 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [RFC PATCH 5/8] block: implement .change_aio_ctx in child_of_bds
Date: Tue, 12 Jul 2022 17:19:08 -0400
Message-Id: <20220712211911.1302836-6-eesposit@redhat.com>
In-Reply-To: <20220712211911.1302836-1-eesposit@redhat.com>
References: <20220712211911.1302836-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

bdrv_child_cb_change_aio_ctx() is identical to
bdrv_child_cb_can_set_aio_ctx(), as we only need
to recursively go on the parent bs.

Note: bdrv_child_try_change_aio_context() is not called by
anyone at this point.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/block.c b/block.c
index bda4e1bcef..a7ba590dfa 100644
--- a/block.c
+++ b/block.c
@@ -1235,6 +1235,14 @@ static int bdrv_child_cb_inactivate(BdrvChild *child)
     return 0;
 }
 
+static bool bdrv_child_cb_change_aio_ctx(BdrvChild *child, AioContext *ctx,
+                                         GSList **visited, Transaction *tran,
+                                         Error **errp)
+{
+    BlockDriverState *bs = child->opaque;
+    return bdrv_change_aio_context(bs, ctx, visited, tran, errp);
+}
+
 static bool bdrv_child_cb_can_set_aio_ctx(BdrvChild *child, AioContext *ctx,
                                           GSList **ignore, Error **errp)
 {
@@ -1491,6 +1499,7 @@ const BdrvChildClass child_of_bds = {
     .inactivate      = bdrv_child_cb_inactivate,
     .can_set_aio_ctx = bdrv_child_cb_can_set_aio_ctx,
     .set_aio_ctx     = bdrv_child_cb_set_aio_ctx,
+    .change_aio_ctx  = bdrv_child_cb_change_aio_ctx,
     .update_filename = bdrv_child_cb_update_filename,
     .get_parent_aio_context = child_of_bds_get_parent_aio_context,
 };
-- 
2.31.1


