Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306D76DDED5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:05:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFWK-0003Dr-Jv; Tue, 11 Apr 2023 11:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFW9-00036Y-Oa
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFW5-00028i-OG
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681225335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cs9Pl2396sK9DmUvcjIllLgIDuf/c5985/N39o/I+tc=;
 b=V8h2pto2+dkT00vwF75otALpPAHqqFStr3MlADPz02qk6LQsC0nOq/o5T6eAIwM5CpWxmB
 t2XDn9CImcSWHbMc1ECD2W+hEYEDW6cVCooea/K2PHL93NZzzFICDR6UsMERykZI/ci+IB
 ybzIKa6scqZMAN2w5jYba46OmhWjogY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-otYK3GCKMnij21fDwHfc_A-1; Tue, 11 Apr 2023 11:02:12 -0400
X-MC-Unique: otYK3GCKMnij21fDwHfc_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E717385054C;
 Tue, 11 Apr 2023 15:02:10 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B91DA40BC797;
 Tue, 11 Apr 2023 15:02:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 07/10] migration/block: replace uses of blk_nb_sectors that do
 not check result
Date: Tue, 11 Apr 2023 17:01:44 +0200
Message-Id: <20230411150147.318637-8-kwolf@redhat.com>
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

From: Paolo Bonzini <pbonzini@redhat.com>

Uses of blk_nb_sectors must check whether the result is negative.
Otherwise, underflow can happen.  Fortunately, alloc_aio_bitmap()
and bmds_aio_inflight() both have an alternative way to retrieve the
number of sectors in the file.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20230407153303.391121-6-pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 migration/block.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/migration/block.c b/migration/block.c
index 426a25bb19..b2497bbd32 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -195,7 +195,7 @@ static int bmds_aio_inflight(BlkMigDevState *bmds, int64_t sector)
 {
     int64_t chunk = sector / (int64_t)BDRV_SECTORS_PER_DIRTY_CHUNK;
 
-    if (sector < blk_nb_sectors(bmds->blk)) {
+    if (sector < bmds->total_sectors) {
         return !!(bmds->aio_bitmap[chunk / (sizeof(unsigned long) * 8)] &
             (1UL << (chunk % (sizeof(unsigned long) * 8))));
     } else {
@@ -229,10 +229,9 @@ static void bmds_set_aio_inflight(BlkMigDevState *bmds, int64_t sector_num,
 
 static void alloc_aio_bitmap(BlkMigDevState *bmds)
 {
-    BlockBackend *bb = bmds->blk;
     int64_t bitmap_size;
 
-    bitmap_size = blk_nb_sectors(bb) + BDRV_SECTORS_PER_DIRTY_CHUNK * 8 - 1;
+    bitmap_size = bmds->total_sectors + BDRV_SECTORS_PER_DIRTY_CHUNK * 8 - 1;
     bitmap_size /= BDRV_SECTORS_PER_DIRTY_CHUNK * 8;
 
     bmds->aio_bitmap = g_malloc0(bitmap_size);
-- 
2.39.2


