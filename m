Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2398C610058
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:35:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7jF-0000Ai-JL; Thu, 27 Oct 2022 14:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7ge-0001xt-5D
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gc-0002ca-4f
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obEkDsZAUNGHBlLvSer8l27MIk1LUa+skIq7aFKhEE4=;
 b=HXD/3/f8tqcEIz+/cRwulac3kBcRTMdtkY1gawy/g8Bro7RiNIDVD+DhhH45OQ1gO5fzyd
 4VJveqtHBY8qUsHX343Ue1+NcGw4YQPBbLUgi5mGwN4yRWC2SimkTdMlEN8mhvXgEwzg4d
 F8CFdADI95f9HEYVxeXQvreKfebEQgM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-obP3sZoXMfufUAFs3vJ0Mw-1; Thu, 27 Oct 2022 14:32:59 -0400
X-MC-Unique: obP3sZoXMfufUAFs3vJ0Mw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57EF4185A794;
 Thu, 27 Oct 2022 18:32:58 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 931351121320;
 Thu, 27 Oct 2022 18:32:57 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 48/58] block: switch to *_co_* functions
Date: Thu, 27 Oct 2022 20:31:36 +0200
Message-Id: <20221027183146.463129-49-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221013123711.620631-16-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c    | 2 +-
 block/io.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index 5da15d0f4e..5311b21f8e 100644
--- a/block.c
+++ b/block.c
@@ -643,7 +643,7 @@ create_file_fallback_zero_first_sector(BlockBackend *blk,
 
     bytes_to_clear = MIN(current_size, BDRV_SECTOR_SIZE);
     if (bytes_to_clear) {
-        ret = blk_pwrite_zeroes(blk, 0, bytes_to_clear, BDRV_REQ_MAY_UNMAP);
+        ret = blk_co_pwrite_zeroes(blk, 0, bytes_to_clear, BDRV_REQ_MAY_UNMAP);
         if (ret < 0) {
             error_setg_errno(errp, -ret,
                              "Failed to clear the new image's first sector");
diff --git a/block/io.c b/block/io.c
index 236b12da2a..5518a9d1e6 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2729,8 +2729,8 @@ int coroutine_fn bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset,
         return 1;
     }
 
-    ret = bdrv_common_block_status_above(bs, NULL, false, false, offset,
-                                         bytes, &pnum, NULL, NULL, NULL);
+    ret = bdrv_co_common_block_status_above(bs, NULL, false, false, offset,
+                                            bytes, &pnum, NULL, NULL, NULL);
 
     if (ret < 0) {
         return ret;
-- 
2.37.3


