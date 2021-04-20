Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBA43655DC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:07:56 +0200 (CEST)
Received: from localhost ([::1]:51614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnIR-0005PY-NU
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYnFK-0003NC-EV
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:04:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYnFG-0001pp-9w
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:04:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618913073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOJnJ5TpOrfAW2cq46HgyNfR3TIE3721we51rCQ94GU=;
 b=JNUcRQSCq1eyKWhVXy3laoHzJwyS2Tiq+hXCzcEkRmRlKLMLwSDgXhl9sYXEUiW0tI4Fth
 g7P+ntx15Pu8bKr3pzNgrCy/DAq8W+PdW4KBBb6U6WcsyDuLtPSHyLcUkwPmjTC3U6Prok
 Jv7rJ9bR6LBeoRk3uaCU+uGEmrJ9xuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-VsMpdrmRPd2hsav69Ai-vQ-1; Tue, 20 Apr 2021 06:04:31 -0400
X-MC-Unique: VsMpdrmRPd2hsav69Ai-vQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E061A1922963;
 Tue, 20 Apr 2021 10:04:30 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-20.ams2.redhat.com
 [10.36.114.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FD1E5C1C4;
 Tue, 20 Apr 2021 10:04:26 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 3/3] block-copy: add CoMutex lock for BlockCopyCallState
 list
Date: Tue, 20 Apr 2021 12:04:16 +0200
Message-Id: <20210420100416.30713-4-eesposit@redhat.com>
In-Reply-To: <20210420100416.30713-1-eesposit@redhat.com>
References: <20210420100416.30713-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the same tasks_lock, since the calls list is just used
for debug purposes.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-copy.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index e785ac57e0..555f5fb747 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -310,10 +310,9 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
     }
 
-    QLIST_INIT(&s->tasks);
     qemu_co_mutex_init(&s->tasks_lock);
+    QLIST_INIT(&s->tasks);
     QLIST_INIT(&s->calls);
-
     return s;
 }
 
@@ -712,7 +711,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
 {
     int ret;
 
+    qemu_co_mutex_lock(&call_state->s->tasks_lock);
     QLIST_INSERT_HEAD(&call_state->s->calls, call_state, list);
+    qemu_co_mutex_unlock(&call_state->s->tasks_lock);
 
     do {
         ret = block_copy_dirty_clusters(call_state);
@@ -739,7 +740,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
         call_state->cb(call_state->cb_opaque);
     }
 
+    qemu_co_mutex_lock(&call_state->s->tasks_lock);
     QLIST_REMOVE(call_state, list);
+    qemu_co_mutex_unlock(&call_state->s->tasks_lock);
 
     return ret;
 }
-- 
2.30.2


