Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949276A0FCF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:54:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhV-0006s8-Q5; Thu, 23 Feb 2023 13:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhQ-0006rK-Df
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhO-0003AQ-SM
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oa+DThSt3b/h3Y/YTVqy3GFKLTnRjraQAw4VOgHLIS0=;
 b=J2+SPV6j6QB8TsQMBkMvZ/RAXHanqU6NQOlu1TPfjOxkUDIiCuLOGxiZsVfMl7XLfYcJF7
 0vFz6pj0GKfc7k6P4oiO1VK0uFS3dzAxjhI5CpL3nAjpxyuviwkKoKUQzixpY/oasNO8AW
 u0b06sYv6oXMsIRJV2KIlwUfsfk9bUk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-IKyJto0VOCKxwJPYJdF_xw-1; Thu, 23 Feb 2023 13:52:04 -0500
X-MC-Unique: IKyJto0VOCKxwJPYJdF_xw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7EC8280048D;
 Thu, 23 Feb 2023 18:52:03 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1113D1121314;
 Thu, 23 Feb 2023 18:52:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 13/29] block: Mark bdrv_co_do_pwrite_zeroes() GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:30 +0100
Message-Id: <20230223185146.306454-14-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

All callers are already GRAPH_RDLOCK, so just add the annotation and
remove assume_graph_lock().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-14-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/block/io.c b/block/io.c
index 2593823f62..628b350002 100644
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
2.39.2


