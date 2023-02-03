Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15AB689E18
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 16:24:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxu0-0007Ru-CK; Fri, 03 Feb 2023 10:23:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNxty-0007RL-EP
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:22:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNxtw-0005LK-O5
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675437776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kzJ8rIuji1hnzfubuOBI027OVgOScYqVBiGjwb67HZ0=;
 b=WfL/TrKWWVCS7zKZ9LVfuHkpAYgp1TflvehK38DLBBU7znrEto1j5O8dDrW9i7YHBT2Xf1
 D/6C4PH6Uu+MNW2M2vwREEs0hdzHvgAAbHTLuS4+/ZLXumyEXHMvcEDj65CoMehpqGUK0q
 /HkLFU3YllOhUcJ2xwMx6CLcpUop55A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-FhkYfJqvPMeSUsQi8bRfew-1; Fri, 03 Feb 2023 10:22:54 -0500
X-MC-Unique: FhkYfJqvPMeSUsQi8bRfew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3809318E0AC4;
 Fri,  3 Feb 2023 15:22:54 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63C32404CD80;
 Fri,  3 Feb 2023 15:22:48 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, pbonzini@redhat.com, stefanha@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 13/23] block: Mark bdrv_co_do_pwrite_zeroes() GRAPH_RDLOCK
Date: Fri,  3 Feb 2023 16:21:52 +0100
Message-Id: <20230203152202.49054-14-kwolf@redhat.com>
In-Reply-To: <20230203152202.49054-1-kwolf@redhat.com>
References: <20230203152202.49054-1-kwolf@redhat.com>
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

All callers are already GRAPH_RDLOCK, so just add the annotation and
remove assume_graph_lock().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/block/io.c b/block/io.c
index 4ea19a37e6..a56e565b12 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1672,8 +1672,9 @@ fail:
     return ret;
 }
 
-static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_co_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                         BdrvRequestFlags flags)
 {
     BlockDriver *drv = bs->drv;
     QEMUIOVector qiov;
@@ -1683,8 +1684,6 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     int head = 0;
     int tail = 0;
 
-    assume_graph_lock(); /* FIXME */
-
     int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes,
                                             INT64_MAX);
     int alignment = MAX(bs->bl.pwrite_zeroes_alignment,
-- 
2.38.1


