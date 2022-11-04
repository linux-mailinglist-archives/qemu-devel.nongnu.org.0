Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202B66193F2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 10:58:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtSL-0005ir-Kx; Fri, 04 Nov 2022 05:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqtRm-0005ZD-71
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqtRj-0000HR-Gx
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667555826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3421AU3i61P6bt+m3hZQkZTiF6WrCYIKBa9iKiN7Mis=;
 b=MDTw0AO0NY7hJS84mOfb8ue2pOyt/EH7PPfuYgyG8Ceunc9SH5wH6EUkhAr51fT236Vwli
 REdjuZ3s0LBkapjwrDY6Jvf15mD/x4RR6qJDss9J2y/feW+SLZbp/PfxFc59ciD5too7Hd
 5W+lhg9tzvlyrygiCvCe/9lccyPIVeU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-skt7YxxHN22kSlWCOeDFwQ-1; Fri, 04 Nov 2022 05:57:03 -0400
X-MC-Unique: skt7YxxHN22kSlWCOeDFwQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6910085A5B6;
 Fri,  4 Nov 2022 09:57:03 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B4E040C83EC;
 Fri,  4 Nov 2022 09:57:03 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v2 3/9] nbd/server.c: add missing coroutine_fn annotations
Date: Fri,  4 Nov 2022 05:56:54 -0400
Message-Id: <20221104095700.4117433-4-eesposit@redhat.com>
In-Reply-To: <20221104095700.4117433-1-eesposit@redhat.com>
References: <20221104095700.4117433-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These functions end up calling bdrv_*() implemented as generated_co_wrapper
functions.
In addition, they also happen to be always called in coroutine context,
meaning all callers are coroutine_fn.
This means that the g_c_w function will enter the qemu_in_coroutine()
case and eventually suspend (or in other words call qemu_coroutine_yield()).
Therefore we need to mark such functions coroutine_fn too.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 nbd/server.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index ada16089f3..e2eec0cf46 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2141,8 +2141,9 @@ static int nbd_extent_array_add(NBDExtentArray *ea,
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
@@ -2168,8 +2169,9 @@ static int blockstatus_to_extents(BlockDriverState *bs, uint64_t offset,
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


