Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A0A64CBA4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 14:53:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S5h-0005VU-Jz; Wed, 14 Dec 2022 08:46:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S5D-0004wC-Nx
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:46:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S5C-0003mA-0e
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:46:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wpiRNFivgqeOQmywLX30jAOM73jurDH7q8KStX+fUDo=;
 b=Di2NfBFWIYRa+rSh5t4snFHrplCarcqjwRvB1pKizNyqNoD8o1ofFwMSTiouvV8HnqPRZP
 aA0u/fQpre3SO4jJ+6CD9AMyus9tCNfzXmYqnIff08gS7NewGz0Ww1ljHy8ZKBZ7SfleXv
 y3Cu6ckhECK+rcYnB7IxvTlKYy2HtD8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-A04_MdtpMNm29V_JdF3LgQ-1; Wed, 14 Dec 2022 08:45:56 -0500
X-MC-Unique: A04_MdtpMNm29V_JdF3LgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D4A51C0513D;
 Wed, 14 Dec 2022 13:45:56 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C67C14171BE;
 Wed, 14 Dec 2022 13:45:55 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 48/51] Mark assert_bdrv_graph_readable/writable()
 GRAPH_RD/WRLOCK
Date: Wed, 14 Dec 2022 14:44:50 +0100
Message-Id: <20221214134453.31665-49-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20221207131838.239125-16-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
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


