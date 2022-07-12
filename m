Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1518857227D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:23:38 +0200 (CEST)
Received: from localhost ([::1]:47688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKXp-0003YN-5N
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKI0-0003iA-Cp
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHt-0006ho-DG
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4vIpq8s5Z48fz8VQFxCBcoxV1sGJyf48PAW5bJ+wHc=;
 b=K+vk8rEDnWqdC/WenxHjWomwn9UlcnmBjSX0LL/zqk1FE+gQ9xdyrPa2goPVSheRR0Dtts
 8Zrs3euVdmcYdEusJ8lEQV1z/1Oyh1+TjeIlUTAWUj4OLaNTV7ew1cYBhuEZeU1AoT9fqK
 2uFXhgsDUZcnr2gs4SQwktFwhWWMzbM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-04-lAL5XP9y6MqkJJPkUVA-1; Tue, 12 Jul 2022 14:07:04 -0400
X-MC-Unique: 04-lAL5XP9y6MqkJJPkUVA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A03E101A59D;
 Tue, 12 Jul 2022 18:07:04 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21BB840CFD0A;
 Tue, 12 Jul 2022 18:07:04 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 26/35] block: Implement blk_flush() using generated_co_wrapper
Date: Tue, 12 Jul 2022 20:06:08 +0200
Message-Id: <20220712180617.1362407-27-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220705161527.1054072-15-afaria@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/coroutines.h                |  2 --
 include/sysemu/block-backend-io.h |  2 +-
 block/block-backend.c             | 11 -----------
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 2693ecabfb..7e94b9fa83 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -110,6 +110,4 @@ nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 int generated_co_wrapper
 blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
-int generated_co_wrapper blk_do_flush(BlockBackend *blk);
-
 #endif /* BLOCK_COROUTINES_H */
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 5a12a1f74f..6954c3bb8c 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -164,8 +164,8 @@ int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
 int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
                                  int64_t bytes);
 
+int generated_co_wrapper blk_flush(BlockBackend *blk);
 int coroutine_fn blk_co_flush(BlockBackend *blk);
-int blk_flush(BlockBackend *blk);
 
 int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
diff --git a/block/block-backend.c b/block/block-backend.c
index 71585c0c0a..783a77cf6d 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1752,17 +1752,6 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
     return ret;
 }
 
-int blk_flush(BlockBackend *blk)
-{
-    int ret;
-
-    blk_inc_in_flight(blk);
-    ret = blk_do_flush(blk);
-    blk_dec_in_flight(blk);
-
-    return ret;
-}
-
 void blk_drain(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
-- 
2.35.3


