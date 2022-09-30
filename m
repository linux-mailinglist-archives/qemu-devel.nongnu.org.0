Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654135F108B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:12:13 +0200 (CEST)
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJYa-0004yT-5p
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFr-0006g3-81
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFp-0006g8-Lq
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CpiEaC6fQLkwLnh9nDraGTX4x6FvrG4leRszaPih6k=;
 b=YY09AxPIhV73H8qCSLH/gvBdU5mDGDa754+j6L3psTPSi9AUpDsZRarF3CDnHAb8yPTFL7
 qPa72dFlBjHtRNOL14qKcgGle5LNRlSyD6CwkVpsypTMGM7o7ik7ykQl2jZJpvfHLvtHOD
 YSVr5GNV+SrUOftyOGrgJhby0K+7jWw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-2EfTpU70P8CzYkDWULsb0A-1; Fri, 30 Sep 2022 12:52:47 -0400
X-MC-Unique: 2EfTpU70P8CzYkDWULsb0A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5903882823;
 Fri, 30 Sep 2022 16:52:46 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1100817582;
 Fri, 30 Sep 2022 16:52:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 13/18] block: use the request length for iov alignment
Date: Fri, 30 Sep 2022 18:52:17 +0200
Message-Id: <20220930165222.249716-14-kwolf@redhat.com>
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keith Busch <kbusch@kernel.org>

An iov length needs to be aligned to the logical block size, which may
be larger than the memory alignment.

Tested-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Keith Busch <kbusch@kernel.org>
Message-Id: <20220929200523.3218710-3-kbusch@meta.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/file-posix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 989dfc4586..66fdb07820 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2068,13 +2068,14 @@ static bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov)
 {
     int i;
     size_t alignment = bdrv_min_mem_align(bs);
+    size_t len = bs->bl.request_alignment;
     IO_CODE();
 
     for (i = 0; i < qiov->niov; i++) {
         if ((uintptr_t) qiov->iov[i].iov_base % alignment) {
             return false;
         }
-        if (qiov->iov[i].iov_len % alignment) {
+        if (qiov->iov[i].iov_len % len) {
             return false;
         }
     }
-- 
2.37.3


