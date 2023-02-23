Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F746A0FDB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:55:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhN-0006nx-JK; Thu, 23 Feb 2023 13:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhI-0006lt-20
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhG-00031E-9J
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRfUwW7W+NRR0iIjypfr/5pPgmRwfhMP49v359YeetA=;
 b=BoXEfNtnjVt1Ht+cebEC2HfXF2tT2V5bAl+3/LhX2Vaqd3irTRWmXZ2TnI720uAFOxqiQU
 4Cx6M6wOcX3U4U0jhI3BTWjozTNPlKZHksMOw3qnjZw1VG1SLkbESHDXSJUqZ0MQekuplK
 xH32DCgqF4RQuDPqAeMYSrz08OOt7Og=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-sXBmeTwXMUy99Qxn21GSmA-1; Thu, 23 Feb 2023 13:51:57 -0500
X-MC-Unique: sXBmeTwXMUy99Qxn21GSmA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3570738173CC;
 Thu, 23 Feb 2023 18:51:57 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82E151121314;
 Thu, 23 Feb 2023 18:51:56 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 06/29] block/qed: add missing graph rdlock in
 qed_need_check_timer_entry
Date: Thu, 23 Feb 2023 19:51:23 +0100
Message-Id: <20230223185146.306454-7-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

This function is called in two different places:
- timer callback, which does not take the graph rdlock.
- bdrv_qed_drain_begin(), which is .bdrv_drain_begin()
  callback documented as function that does not take the lock.

Since it calls recursive functions that traverse the
graph, we need to protect them with the graph rdlock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-7-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qed.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/qed.c b/block/qed.c
index 175a46c67b..7690d0215d 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -282,11 +282,12 @@ static void coroutine_fn qed_unplug_allocating_write_reqs(BDRVQEDState *s)
     qemu_co_mutex_unlock(&s->table_lock);
 }
 
-static void coroutine_fn qed_need_check_timer(BDRVQEDState *s)
+static void coroutine_fn GRAPH_RDLOCK qed_need_check_timer(BDRVQEDState *s)
 {
     int ret;
 
     trace_qed_need_check_timer_cb(s);
+    assert_bdrv_graph_readable();
 
     if (!qed_plug_allocating_write_reqs(s)) {
         return;
@@ -312,6 +313,7 @@ static void coroutine_fn qed_need_check_timer(BDRVQEDState *s)
 static void coroutine_fn qed_need_check_timer_entry(void *opaque)
 {
     BDRVQEDState *s = opaque;
+    GRAPH_RDLOCK_GUARD();
 
     qed_need_check_timer(opaque);
     bdrv_dec_in_flight(s->bs);
-- 
2.39.2


