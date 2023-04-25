Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247186EE6DF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:35:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMX5-0007sk-7i; Tue, 25 Apr 2023 13:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWq-000707-Oc
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWn-0004L9-Ub
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Jj6PNQ7GAIvwDNnVx28H1P4Vt4Z5SSGKXTz+Chfefk=;
 b=SHjc4GDwxxcdmYqRVAKDtzq4RnIGWaDov/lJhBkxXU5mS+1yXHlowmRA1FFFj92REQ2Xuj
 bWqnH6GYFznCEwzvjJgT1Ck8aFTEjqrjlbmG7RLiTdYj/w+xyvh5Dln9fUQfLFLAnvLw/K
 J6D1pptjJaIaw2Tz1DAwPHQjkW5L1gM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-8FF7iMzVPpGjnB2uYD0p9w-1; Tue, 25 Apr 2023 13:32:29 -0400
X-MC-Unique: 8FF7iMzVPpGjnB2uYD0p9w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A449185A794;
 Tue, 25 Apr 2023 17:32:29 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92B7B492B0F;
 Tue, 25 Apr 2023 17:32:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 18/20] block: Mark bdrv_query_block_graph_info() and callers
 GRAPH_RDLOCK
Date: Tue, 25 Apr 2023 19:31:56 +0200
Message-Id: <20230425173158.574203-19-kwolf@redhat.com>
In-Reply-To: <20230425173158.574203-1-kwolf@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_query_block_graph_info() need to hold a reader lock for the graph
because it accesses the children list of a node.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/qapi.h | 7 ++++---
 qemu-img.c           | 2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/block/qapi.h b/include/block/qapi.h
index 8773b9b191..18d48ddb70 100644
--- a/include/block/qapi.h
+++ b/include/block/qapi.h
@@ -25,6 +25,7 @@
 #ifndef BLOCK_QAPI_H
 #define BLOCK_QAPI_H
 
+#include "block/graph-lock.h"
 #include "block/snapshot.h"
 #include "qapi/qapi-types-block-core.h"
 
@@ -43,9 +44,9 @@ void bdrv_query_image_info(BlockDriverState *bs,
                            bool flat,
                            bool skip_implicit_filters,
                            Error **errp);
-void bdrv_query_block_graph_info(BlockDriverState *bs,
-                                 BlockGraphInfo **p_info,
-                                 Error **errp);
+void GRAPH_RDLOCK
+bdrv_query_block_graph_info(BlockDriverState *bs, BlockGraphInfo **p_info,
+                            Error **errp);
 
 void bdrv_snapshot_dump(QEMUSnapshotInfo *sn);
 void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
diff --git a/qemu-img.c b/qemu-img.c
index 9aeac69fa6..9f9f0a7629 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2938,6 +2938,8 @@ static BlockGraphInfoList *collect_image_info_list(bool image_opts,
         }
         bs = blk_bs(blk);
 
+        GRAPH_RDLOCK_GUARD_MAINLOOP();
+
         /*
          * Note that the returned BlockGraphInfo object will not have
          * information about this image's backing node, because we have opened
-- 
2.40.0


