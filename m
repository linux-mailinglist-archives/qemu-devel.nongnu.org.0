Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A76617E3A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 14:44:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqaUf-0001ZQ-7L; Thu, 03 Nov 2022 09:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqaUK-0001Qv-OI
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:42:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqaUE-0002BY-JV
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:42:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667482937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIkjCCV8qh5D0MYVN+kHOVhGXdf742Cag3/Z4cdiMXk=;
 b=iL3opGZ/CLKOzGSF+N5RbIJLO5RYj8DtvTv172g02FJzcOMcRUyP16jkoJs3/bIzXg7qfd
 QKX0vzs/Dx06IKU6RHm18/9fYjVT8J6buKXqBCFYLnQ1308ui/DuiKcYcvWr62MuZL2jkq
 ml+xCUQrfLkNBo0xLFidsWAsGhfCioI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-L5y1yErENJWinm9ERKqoXg-1; Thu, 03 Nov 2022 09:42:10 -0400
X-MC-Unique: L5y1yErENJWinm9ERKqoXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DFE287B2AA;
 Thu,  3 Nov 2022 13:42:09 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6292540C6DC7;
 Thu,  3 Nov 2022 13:42:09 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 3/9] nbd/server.c: add missing coroutine_fn annotations
Date: Thu,  3 Nov 2022 09:42:00 -0400
Message-Id: <20221103134206.4041928-4-eesposit@redhat.com>
In-Reply-To: <20221103134206.4041928-1-eesposit@redhat.com>
References: <20221103134206.4041928-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

There are probably more missing, but right now it is necessary that
we extend coroutine_fn to block{allock/status}_to_extents, because
they use bdrv_* functions calling the generated_co_wrapper API, which
checks for the qemu_in_coroutine() case.

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


