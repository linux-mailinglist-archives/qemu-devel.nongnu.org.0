Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBC03A5E4F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:21:24 +0200 (CEST)
Received: from localhost ([::1]:58916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lshqV-0001um-MB
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshmc-0002TZ-HQ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:17:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshma-0004di-SH
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623658640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22VGQAkVYpqq45T3UgWkUg7TZcPRUjggijqQxX73KPM=;
 b=GmldDJJZQJLa+m5r0kqvzq8GKazoG3E7wip7FZ0Tu5jRR9x3bii7twWypjdQuXjTUzt8eS
 0k/70nMrxU6VtG2i8TJChQDMW44VfOhaECNgILrWjzrlyGuZ1y68M5l1uQEMR3/IVuMNaz
 HKhLeVnn1BDo1C+wL28ScfR06mXdRXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-I3bsRS-rP6-RqV138a01_Q-1; Mon, 14 Jun 2021 04:17:19 -0400
X-MC-Unique: I3bsRS-rP6-RqV138a01_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62064106B80C;
 Mon, 14 Jun 2021 08:08:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-49.ams2.redhat.com
 [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3820760871;
 Mon, 14 Jun 2021 08:08:54 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 2/5] block-copy: let ratelimit handle a speed of 0
Date: Mon, 14 Jun 2021 10:08:41 +0200
Message-Id: <20210614080844.21817-3-eesposit@redhat.com>
In-Reply-To: <20210614080844.21817-1-eesposit@redhat.com>
References: <20210614080844.21817-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-copy.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 5808cfe657..943e30b7e6 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -114,7 +114,6 @@ typedef struct BlockCopyState {
 
     SharedResource *mem;
 
-    uint64_t speed;
     RateLimit rate_limit;
 } BlockCopyState;
 
@@ -647,21 +646,19 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
             task->copy_range = false;
         }
 
-        if (s->speed) {
-            if (!call_state->ignore_ratelimit) {
-                uint64_t ns = ratelimit_calculate_delay(&s->rate_limit, 0);
-                if (ns > 0) {
-                    block_copy_task_end(task, -EAGAIN);
-                    g_free(task);
-                    qemu_co_sleep_ns_wakeable(&call_state->sleep,
-                                              QEMU_CLOCK_REALTIME, ns);
-                    continue;
-                }
+        if (!call_state->ignore_ratelimit) {
+            uint64_t ns = ratelimit_calculate_delay(&s->rate_limit, 0);
+            if (ns > 0) {
+                block_copy_task_end(task, -EAGAIN);
+                g_free(task);
+                qemu_co_sleep_ns_wakeable(&call_state->sleep,
+                                            QEMU_CLOCK_REALTIME, ns);
+                continue;
             }
-
-            ratelimit_calculate_delay(&s->rate_limit, task->bytes);
         }
 
+        ratelimit_calculate_delay(&s->rate_limit, task->bytes);
+
         trace_block_copy_process(s, task->offset);
 
         co_get_from_shres(s->mem, task->bytes);
@@ -853,10 +850,7 @@ void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip)
 
 void block_copy_set_speed(BlockCopyState *s, uint64_t speed)
 {
-    s->speed = speed;
-    if (speed > 0) {
-        ratelimit_set_speed(&s->rate_limit, speed, BLOCK_COPY_SLICE_TIME);
-    }
+    ratelimit_set_speed(&s->rate_limit, speed, BLOCK_COPY_SLICE_TIME);
 
     /*
      * Note: it's good to kick all call states from here, but it should be done
-- 
2.31.1


