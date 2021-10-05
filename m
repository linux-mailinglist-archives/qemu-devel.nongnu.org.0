Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC020422EB3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:06:39 +0200 (CEST)
Received: from localhost ([::1]:46686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXntm-0006Hd-MG
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mXn3l-000292-W9
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:12:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mXn3j-0005k5-0f
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633450367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hfkC2D3pQuOTUehyUkMkP6aK5eeP+pRXtmzT1OGRHVk=;
 b=TZs6gcn/9wrJa4Fi4w/3pwkC+kB1HkSr/u1S/48IrUCJNaaxE4wiySZdwW/xo+9lu3omaT
 oSJoEuN7/C7Ln+uxNe0mCEZG7km8pyYwTQuHViMnihNeezjotFKgiq89wLuAggYI+1ubpk
 /raTR7np5cGS1x4m870RjcPggL8LqJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-MGoc1cfBOUKTJyITvAUQng-1; Tue, 05 Oct 2021 12:12:46 -0400
X-MC-Unique: MGoc1cfBOUKTJyITvAUQng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63E4D84A5E3;
 Tue,  5 Oct 2021 16:12:45 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.39.194.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F20E25D9DE;
 Tue,  5 Oct 2021 16:12:43 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] block/aio_task: assert `max_busy_tasks` is greater than 0
Date: Tue,  5 Oct 2021 18:11:57 +0200
Message-Id: <20211005161157.282396-3-sgarzare@redhat.com>
In-Reply-To: <20211005161157.282396-1-sgarzare@redhat.com>
References: <20211005161157.282396-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All code in block/aio_task.c expects `max_busy_tasks` to always
be greater than 0.

Assert this condition during the AioTaskPool creation where
`max_busy_tasks` is set.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 block/aio_task.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/aio_task.c b/block/aio_task.c
index 88989fa248..9bd17ea2c1 100644
--- a/block/aio_task.c
+++ b/block/aio_task.c
@@ -98,6 +98,8 @@ AioTaskPool *coroutine_fn aio_task_pool_new(int max_busy_tasks)
 {
     AioTaskPool *pool = g_new0(AioTaskPool, 1);
 
+    assert(max_busy_tasks > 0);
+
     pool->main_co = qemu_coroutine_self();
     pool->max_busy_tasks = max_busy_tasks;
 
-- 
2.31.1


