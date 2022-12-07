Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFE8645ADB
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:25:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uLA-0007p2-F0; Wed, 07 Dec 2022 08:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKw-0007jy-UT
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKv-0006Ug-FO
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mABl878l939qQvOJ6Q1qPnaoITRKNB16R6x24krU9us=;
 b=FXfbYOkbF4ZhV+2AQPsgYreHA9WQzso9CxnjZH539X4VOGwTl06roFbOoFehHTTQB+WAn3
 XRpU5JMjhl69Wczxnr5Hlb3eKxMzBvi7l4XJgoNWbeJB5cE7RoIk3jEpdcRrSIsF1XY0op
 ApukWC7VI8CiqodnPSyBoXLRuxdeWys=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-DwoZssbCMvCoBNWwkLMGkQ-1; Wed, 07 Dec 2022 08:19:43 -0500
X-MC-Unique: DwoZssbCMvCoBNWwkLMGkQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0448381494E;
 Wed,  7 Dec 2022 13:19:42 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 976811121314;
 Wed,  7 Dec 2022 13:19:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 15/18] Mark assert_bdrv_graph_readable/writable()
 GRAPH_RD/WRLOCK
Date: Wed,  7 Dec 2022 14:18:35 +0100
Message-Id: <20221207131838.239125-16-kwolf@redhat.com>
In-Reply-To: <20221207131838.239125-1-kwolf@redhat.com>
References: <20221207131838.239125-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-common.h | 4 ++--
 include/block/graph-lock.h       | 4 ++--
 block.c                          | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index a6bc6b7fe9..b1f0d88307 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -898,8 +898,8 @@ struct BdrvChildClass {
     void (*activate)(BdrvChild *child, Error **errp);
     int (*inactivate)(BdrvChild *child);
 
-    void (*attach)(BdrvChild *child);
-    void (*detach)(BdrvChild *child);
+    void GRAPH_WRLOCK_PTR (*attach)(BdrvChild *child);
+    void GRAPH_WRLOCK_PTR (*detach)(BdrvChild *child);
 
     /*
      * Notifies the parent that the filename of its child has changed (e.g.
diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index 50b7e7b1b6..0c66386167 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -176,14 +176,14 @@ bdrv_graph_rdunlock_main_loop(void);
  * or there is at least a reader helding the rdlock.
  * In this way an incoming writer is aware of the read and waits.
  */
-void assert_bdrv_graph_readable(void);
+void GRAPH_RDLOCK assert_bdrv_graph_readable(void);
 
 /*
  * assert_bdrv_graph_writable:
  * Make sure that the writer is the main loop and has set @has_writer,
  * so that incoming readers will pause.
  */
-void assert_bdrv_graph_writable(void);
+void GRAPH_WRLOCK assert_bdrv_graph_writable(void);
 
 /*
  * Calling this function tells TSA that we know that the lock is effectively
diff --git a/block.c b/block.c
index ff53b41af3..1a82fd101a 100644
--- a/block.c
+++ b/block.c
@@ -1402,7 +1402,7 @@ static void bdrv_inherited_options(BdrvChildRole role, bool parent_is_format,
     *child_flags = flags;
 }
 
-static void bdrv_child_cb_attach(BdrvChild *child)
+static void GRAPH_WRLOCK bdrv_child_cb_attach(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
 
@@ -1444,7 +1444,7 @@ static void bdrv_child_cb_attach(BdrvChild *child)
     }
 }
 
-static void bdrv_child_cb_detach(BdrvChild *child)
+static void GRAPH_WRLOCK bdrv_child_cb_detach(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
 
-- 
2.38.1


