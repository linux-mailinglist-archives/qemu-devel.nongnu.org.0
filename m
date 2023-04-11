Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536D06DDEC7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:03:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFWX-0003TL-RV; Tue, 11 Apr 2023 11:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFWC-0003AJ-VX
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFW5-00029S-Tc
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681225338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWJbnA+ulqtlMRpiXLg6mp3emKHsxNhK2Kr0XKblVXg=;
 b=fbbqtmFm8EepM8s96/VKlAnJHwuZJqkwpnBAfQgJqAjoEk8OEstLF9YBne+iy4N5gyhKB/
 olcliev2vX7nrKHsF3sX1FT0xUDtYgNr/cD2E+h+yqtvYDrGh1xYT/iJQvKpbDBh9qV9IR
 lcT2xLtlbU7vP4fdsxMAfMUvPEbMFBs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-0yJRHk9QN9iU-Iqgx_W-QQ-1; Tue, 11 Apr 2023 11:02:14 -0400
X-MC-Unique: 0yJRHk9QN9iU-Iqgx_W-QQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7385F1C189AB;
 Tue, 11 Apr 2023 15:02:12 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9144940BC797;
 Tue, 11 Apr 2023 15:02:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 09/10] block-backend: ignore inserted state in blk_co_nb_sectors
Date: Tue, 11 Apr 2023 17:01:46 +0200
Message-Id: <20230411150147.318637-10-kwolf@redhat.com>
In-Reply-To: <20230411150147.318637-1-kwolf@redhat.com>
References: <20230411150147.318637-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

From: Paolo Bonzini <pbonzini@redhat.com>

All callers of blk_co_nb_sectors (and blk_nb_sectors) are able to
handle a non-inserted CD-ROM as a zero-length file, they do not need
to raise an error.

Not using blk_co_is_available() aligns the function with
blk_co_get_geometry(), which becomes a simple wrapper for
blk_co_nb_sectors().  It will also make it possible to skip the creation
of a coroutine in the (common) case where bs->bl.has_variable_length
is false.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20230407153303.391121-8-pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-backend.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 36e3a67dff..cf58d4d1b7 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1615,9 +1615,7 @@ int64_t coroutine_fn blk_co_getlength(BlockBackend *blk)
     return bdrv_co_getlength(blk_bs(blk));
 }
 
-/* return 0 as number of sectors if no device present or error */
-void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
-                                      uint64_t *nb_sectors_ptr)
+int64_t coroutine_fn blk_co_nb_sectors(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
 
@@ -1625,23 +1623,18 @@ void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
     GRAPH_RDLOCK_GUARD();
 
     if (!bs) {
-        *nb_sectors_ptr = 0;
+        return -ENOMEDIUM;
     } else {
-        int64_t nb_sectors = bdrv_co_nb_sectors(bs);
-        *nb_sectors_ptr = nb_sectors < 0 ? 0 : nb_sectors;
+        return bdrv_co_nb_sectors(bs);
     }
 }
 
-int64_t coroutine_fn blk_co_nb_sectors(BlockBackend *blk)
+/* return 0 as number of sectors if no device present or error */
+void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
+                                      uint64_t *nb_sectors_ptr)
 {
-    IO_CODE();
-    GRAPH_RDLOCK_GUARD();
-
-    if (!blk_co_is_available(blk)) {
-        return -ENOMEDIUM;
-    }
-
-    return bdrv_co_nb_sectors(blk_bs(blk));
+    int64_t ret = blk_co_nb_sectors(blk);
+    *nb_sectors_ptr = ret < 0 ? 0 : ret;
 }
 
 BlockAIOCB *blk_aio_preadv(BlockBackend *blk, int64_t offset,
-- 
2.39.2


