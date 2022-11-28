Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A90863AB18
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 15:35:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozf30-0004dP-Sf; Mon, 28 Nov 2022 09:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ozf2y-0004af-6x
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:23:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ozf2w-0006tH-92
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:23:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669645425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L85fEB2CROL9NvdkGxTxsvNGcILzbLbOlSgixJtlRHg=;
 b=f7lRYAoC/oCycfQAVWdH/mUpaNEG3jBgiLmHDG798H1G8cv6+H1hwog3IDNh2od4vwScw/
 ORuHnwrlWbG3KHoZVzUyzXWZUUaySDb1HIzscuNguLt638iULhMulRfiCYl80WEZhCiuUx
 v7Xav35VV6SOTh+ZrLknTYevhyliGo8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-dfNJQw4QNE-3JMYfVRMf1Q-1; Mon, 28 Nov 2022 09:23:42 -0500
X-MC-Unique: dfNJQw4QNE-3JMYfVRMf1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC6FF858F13;
 Mon, 28 Nov 2022 14:23:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F1AF1401C22;
 Mon, 28 Nov 2022 14:23:41 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v7 03/14] nbd/server.c: add coroutine_fn annotations
Date: Mon, 28 Nov 2022 09:23:26 -0500
Message-Id: <20221128142337.657646-4-eesposit@redhat.com>
In-Reply-To: <20221128142337.657646-1-eesposit@redhat.com>
References: <20221128142337.657646-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

These functions end up calling bdrv_*() implemented as generated_co_wrapper
functions.
In addition, they also happen to be always called in coroutine context,
meaning all callers are coroutine_fn.
This means that the g_c_w function will enter the qemu_in_coroutine()
case and eventually suspend (or in other words call qemu_coroutine_yield()).
Therefore we can mark such functions coroutine_fn too.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 nbd/server.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index ada16089f3..4af5c793a7 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2141,14 +2141,15 @@ static int nbd_extent_array_add(NBDExtentArray *ea,
     return 0;
 }
 
-static int blockstatus_to_extents(BlockDriverState *bs, uint64_t offset,
-                                  uint64_t bytes, NBDExtentArray *ea)
+static int coroutine_fn blockstatus_to_extents(BlockDriverState *bs,
+                                               uint64_t offset, uint64_t bytes,
+                                               NBDExtentArray *ea)
 {
     while (bytes) {
         uint32_t flags;
         int64_t num;
-        int ret = bdrv_block_status_above(bs, NULL, offset, bytes, &num,
-                                          NULL, NULL);
+        int ret = bdrv_co_block_status_above(bs, NULL, offset, bytes, &num,
+                                             NULL, NULL);
 
         if (ret < 0) {
             return ret;
@@ -2168,13 +2169,14 @@ static int blockstatus_to_extents(BlockDriverState *bs, uint64_t offset,
     return 0;
 }
 
-static int blockalloc_to_extents(BlockDriverState *bs, uint64_t offset,
-                                 uint64_t bytes, NBDExtentArray *ea)
+static int coroutine_fn blockalloc_to_extents(BlockDriverState *bs,
+                                              uint64_t offset, uint64_t bytes,
+                                              NBDExtentArray *ea)
 {
     while (bytes) {
         int64_t num;
-        int ret = bdrv_is_allocated_above(bs, NULL, false, offset, bytes,
-                                          &num);
+        int ret = bdrv_co_is_allocated_above(bs, NULL, false, offset, bytes,
+                                             &num);
 
         if (ret < 0) {
             return ret;
@@ -2220,11 +2222,12 @@ static int nbd_co_send_extents(NBDClient *client, uint64_t handle,
 }
 
 /* Get block status from the exported device and send it to the client */
-static int nbd_co_send_block_status(NBDClient *client, uint64_t handle,
-                                    BlockDriverState *bs, uint64_t offset,
-                                    uint32_t length, bool dont_fragment,
-                                    bool last, uint32_t context_id,
-                                    Error **errp)
+static int
+coroutine_fn nbd_co_send_block_status(NBDClient *client, uint64_t handle,
+                                      BlockDriverState *bs, uint64_t offset,
+                                      uint32_t length, bool dont_fragment,
+                                      bool last, uint32_t context_id,
+                                      Error **errp)
 {
     int ret;
     unsigned int nb_extents = dont_fragment ? 1 : NBD_MAX_BLOCK_STATUS_EXTENTS;
-- 
2.31.1


