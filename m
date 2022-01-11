Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330D248B108
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 16:39:19 +0100 (CET)
Received: from localhost ([::1]:57084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7JF0-0003bc-1D
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 10:39:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7JCL-0000cV-BC
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:36:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7JCH-0000iB-IN
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641915387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSWv9JVuS8m91TEuYQoQm6tm2E7qO0d9cvbUGRdmc5s=;
 b=ZX1xHTaaBv1WO+Cwj4vuHt/iForf76B5niODbpa9NIcDlVGxM2DTHvX4XQdEEdJNCngfoS
 ThO1cxgfBxjUpkFyrchqtHWHCPgr/cZ07OJBwEQBaiEBDUUoRicGt5CD364Xhe2gK1Bdtz
 KRv1VUiL0SzslhfyibVaC4qe/4sSHH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-Q-HO1594OCyqc-UVT_Ut2g-1; Tue, 11 Jan 2022 10:36:24 -0500
X-MC-Unique: Q-HO1594OCyqc-UVT_Ut2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A54EB1966322;
 Tue, 11 Jan 2022 15:36:23 +0000 (UTC)
Received: from localhost (unknown [10.39.192.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C2F94EC84;
 Tue, 11 Jan 2022 15:36:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] block-backend: prevent dangling BDS pointers across
 aio_poll()
Date: Tue, 11 Jan 2022 15:36:12 +0000
Message-Id: <20220111153613.25453-2-stefanha@redhat.com>
In-Reply-To: <20220111153613.25453-1-stefanha@redhat.com>
References: <20220111153613.25453-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The BlockBackend root child can change when aio_poll() is invoked. This
happens when a temporary filter node is removed upon blockjob
completion, for example.

Functions in block/block-backend.c must be aware of this when using a
blk_bs() pointer across aio_poll() because the BlockDriverState refcnt
may reach 0, resulting in a stale pointer.

One example is scsi_device_purge_requests(), which calls blk_drain() to
wait for in-flight requests to cancel. If the backup blockjob is active,
then the BlockBackend root child is a temporary filter BDS owned by the
blockjob. The blockjob can complete during bdrv_drained_begin() and the
last reference to the BDS is released when the temporary filter node is
removed. This results in a use-after-free when blk_drain() calls
bdrv_drained_end(bs) on the dangling pointer.

Explicitly hold a reference to bs across block APIs that invoke
aio_poll().

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2021778
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2036178
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
v3:
- Add comment in blk_remove_bs() and reduce scope of bs local variable [Kevin]
v2:
- Audit block/block-backend.c and fix additional cases
---
 block/block-backend.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 12ef80ea17..23e727199b 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -822,16 +822,22 @@ BlockBackend *blk_by_public(BlockBackendPublic *public)
 void blk_remove_bs(BlockBackend *blk)
 {
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
-    BlockDriverState *bs;
     BdrvChild *root;
 
     notifier_list_notify(&blk->remove_bs_notifiers, blk);
     if (tgm->throttle_state) {
-        bs = blk_bs(blk);
+        BlockDriverState *bs = blk_bs(blk);
+
+        /*
+         * Take a ref in case blk_bs() changes across bdrv_drained_begin(), for
+         * example, if a temporary filter node is removed by a blockjob.
+         */
+        bdrv_ref(bs);
         bdrv_drained_begin(bs);
         throttle_group_detach_aio_context(tgm);
         throttle_group_attach_aio_context(tgm, qemu_get_aio_context());
         bdrv_drained_end(bs);
+        bdrv_unref(bs);
     }
 
     blk_update_root_state(blk);
@@ -1705,6 +1711,7 @@ void blk_drain(BlockBackend *blk)
     BlockDriverState *bs = blk_bs(blk);
 
     if (bs) {
+        bdrv_ref(bs);
         bdrv_drained_begin(bs);
     }
 
@@ -1714,6 +1721,7 @@ void blk_drain(BlockBackend *blk)
 
     if (bs) {
         bdrv_drained_end(bs);
+        bdrv_unref(bs);
     }
 }
 
@@ -2044,10 +2052,13 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
     int ret;
 
     if (bs) {
+        bdrv_ref(bs);
+
         if (update_root_node) {
             ret = bdrv_child_try_set_aio_context(bs, new_context, blk->root,
                                                  errp);
             if (ret < 0) {
+                bdrv_unref(bs);
                 return ret;
             }
         }
@@ -2057,6 +2068,8 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
             throttle_group_attach_aio_context(tgm, new_context);
             bdrv_drained_end(bs);
         }
+
+        bdrv_unref(bs);
     }
 
     blk->ctx = new_context;
@@ -2326,11 +2339,13 @@ void blk_io_limits_disable(BlockBackend *blk)
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
     assert(tgm->throttle_state);
     if (bs) {
+        bdrv_ref(bs);
         bdrv_drained_begin(bs);
     }
     throttle_group_unregister_tgm(tgm);
     if (bs) {
         bdrv_drained_end(bs);
+        bdrv_unref(bs);
     }
 }
 
-- 
2.33.1


