Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B124CC131
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:28:38 +0100 (CET)
Received: from localhost ([::1]:55424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnNd-0002CR-3r
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:28:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnED-0007AA-97
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:18:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnEB-0005jx-Mb
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646320730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qbFXtrZa72VeGi+IGhC23ijA6kQ9YrSvcHgxeHZIMfY=;
 b=VqKvvbChw/+DVvfziJFPmvJad90nUDVqyWpPBLTNgHriCisOSKUJ6OVkxlH6Xn6oD4LzIN
 U5AqgKoj5hLYQwZJucS7TL8RGYQ+HCpyeDcrdOR70xFpSHDkQFInFmnSQoYmII+v4wnQY+
 KdVVxFEfdvPezhnYtmf13KdShxNSiTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-0msmrke_NuqoWzk-TH1S1w-1; Thu, 03 Mar 2022 10:18:48 -0500
X-MC-Unique: 0msmrke_NuqoWzk-TH1S1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A08B11854E2A;
 Thu,  3 Mar 2022 15:18:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FE017BCD7;
 Thu,  3 Mar 2022 15:18:45 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 14/31] block: introduce assert_bdrv_graph_writable
Date: Thu,  3 Mar 2022 10:15:59 -0500
Message-Id: <20220303151616.325444-15-eesposit@redhat.com>
In-Reply-To: <20220303151616.325444-1-eesposit@redhat.com>
References: <20220303151616.325444-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to be sure that the functions that write the child and
parent list of a bs are under BQL and drain.

BQL prevents from concurrent writings from the GS API, while
drains protect from I/O.

TODO: drains are missing in some functions using this assert.
Therefore a proper assertion will fail. Because adding drains
requires additional discussions, they will be added in future
series.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                                |  4 ++++
 include/block/block_int-global-state.h | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/block.c b/block.c
index cf656e5b26..48daca835a 100644
--- a/block.c
+++ b/block.c
@@ -1420,6 +1420,7 @@ static void bdrv_child_cb_attach(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
 
+    assert_bdrv_graph_writable(bs);
     QLIST_INSERT_HEAD(&bs->children, child, next);
 
     if (child->role & BDRV_CHILD_COW) {
@@ -1439,6 +1440,7 @@ static void bdrv_child_cb_detach(BdrvChild *child)
 
     bdrv_unapply_subtree_drain(child, bs);
 
+    assert_bdrv_graph_writable(bs);
     QLIST_REMOVE(child, next);
 }
 
@@ -2829,6 +2831,7 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
         if (child->klass->detach) {
             child->klass->detach(child);
         }
+        assert_bdrv_graph_writable(old_bs);
         QLIST_REMOVE(child, next_parent);
     }
 
@@ -2838,6 +2841,7 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
     }
 
     if (new_bs) {
+        assert_bdrv_graph_writable(new_bs);
         QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
 
         /*
diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
index 5078d6a6ea..0f21b0570b 100644
--- a/include/block/block_int-global-state.h
+++ b/include/block/block_int-global-state.h
@@ -309,4 +309,21 @@ void bdrv_remove_aio_context_notifier(BlockDriverState *bs,
  */
 void bdrv_drain_all_end_quiesce(BlockDriverState *bs);
 
+/**
+ * Make sure that the function is running under both drain and BQL.
+ * The latter protects from concurrent writings
+ * from the GS API, while the former prevents concurrent reads
+ * from I/O.
+ */
+static inline void assert_bdrv_graph_writable(BlockDriverState *bs)
+{
+    /*
+     * TODO: this function is incomplete. Because the users of this
+     * assert lack the necessary drains, check only for BQL.
+     * Once the necessary drains are added,
+     * assert also for qatomic_read(&bs->quiesce_counter) > 0
+     */
+    assert(qemu_in_main_thread());
+}
+
 #endif /* BLOCK_INT_GLOBAL_STATE */
-- 
2.31.1


