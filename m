Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EBD60C7AB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:13:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFm6-0002wV-3z; Tue, 25 Oct 2022 04:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1onFdR-0007Nl-DB
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1onFdI-0007UJ-Qo
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666687797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ic29PN4mtqSatrezzdlNeX9E38F4X3tjYIFQ/mofawo=;
 b=f8eH9IuJbYRPRuY1eGnYurx74Eu+i0XpuQPOw5Y+nxvBUI3ZwQESn+pDUJPyFCD6vu5Ww3
 sNj/k5WDGASCgRFzS4ElRQ8FaKM1FMClDmhCsTswga5cYIMBO7kCkMEWofMLOQuT3hbr2T
 ItmO0AmQkYOHHNbdqnDWYYNl5caayfo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-Jnei6e7GM-6_P06Le_9dZw-1; Tue, 25 Oct 2022 04:49:56 -0400
X-MC-Unique: Jnei6e7GM-6_P06Le_9dZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B877811E75;
 Tue, 25 Oct 2022 08:49:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB1BA35429;
 Tue, 25 Oct 2022 08:49:55 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v3 05/10] block: implement .change_aio_ctx in child_of_bds
Date: Tue, 25 Oct 2022 04:49:47 -0400
Message-Id: <20221025084952.2139888-6-eesposit@redhat.com>
In-Reply-To: <20221025084952.2139888-1-eesposit@redhat.com>
References: <20221025084952.2139888-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

bdrv_child_cb_change_aio_ctx() is identical to
bdrv_child_cb_can_set_aio_ctx(), as we only need
to recursively go on the parent bs.

Note: bdrv_child_try_change_aio_context() is not called by
anyone at this point.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/block.c b/block.c
index 56c57d07fa..647297ca81 100644
--- a/block.c
+++ b/block.c
@@ -1242,6 +1242,14 @@ static int bdrv_child_cb_inactivate(BdrvChild *child)
     return 0;
 }
 
+static bool bdrv_child_cb_change_aio_ctx(BdrvChild *child, AioContext *ctx,
+                                         GHashTable *visited, Transaction *tran,
+                                         Error **errp)
+{
+    BlockDriverState *bs = child->opaque;
+    return bdrv_change_aio_context(bs, ctx, visited, tran, errp);
+}
+
 static bool bdrv_child_cb_can_set_aio_ctx(BdrvChild *child, AioContext *ctx,
                                           GSList **ignore, Error **errp)
 {
@@ -1534,6 +1542,7 @@ const BdrvChildClass child_of_bds = {
     .inactivate      = bdrv_child_cb_inactivate,
     .can_set_aio_ctx = bdrv_child_cb_can_set_aio_ctx,
     .set_aio_ctx     = bdrv_child_cb_set_aio_ctx,
+    .change_aio_ctx  = bdrv_child_cb_change_aio_ctx,
     .update_filename = bdrv_child_cb_update_filename,
     .get_parent_aio_context = child_of_bds_get_parent_aio_context,
 };
-- 
2.31.1


