Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E57398B52
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 16:02:38 +0200 (CEST)
Received: from localhost ([::1]:38686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRS9-0004L1-L2
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 10:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCn-0002hj-La
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCj-0007YC-Op
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WmHgjGywsXlRg4oiXjxQRdcGAShYrkCY9ygqgXKwCBk=;
 b=Q8N7DW4UjRqgAVTncCsW1/8V0EcNFWqCu01zLMeUXsyPhsLIrm19QtXlDKo2FhBAKxbIG5
 uAJqnlOsSgsVPM6ueIq6KXZmYvYdow3fbK8FWRF2zMhBAHyUmWqmWkx2Gpe42bqxI0l5IL
 uE1Q5BiBy4240qU4ziSh1D8tq0M5dvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-GuwMJL6WP3WlcEu1UOIITA-1; Wed, 02 Jun 2021 09:46:34 -0400
X-MC-Unique: GuwMJL6WP3WlcEu1UOIITA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 103428189E4;
 Wed,  2 Jun 2021 13:45:57 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2024419814;
 Wed,  2 Jun 2021 13:45:55 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 18/20] block-copy: fix block_copy_task_entry() progress update
Date: Wed,  2 Jun 2021 15:45:27 +0200
Message-Id: <20210602134529.231756-19-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Don't report successful progress on failure, when call_state->ret is
set.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210528141628.44287-2-vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-copy.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index c2e5090412..f9e871b64f 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -439,9 +439,11 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
 
     ret = block_copy_do_copy(t->s, t->offset, t->bytes, t->zeroes,
                              &error_is_read);
-    if (ret < 0 && !t->call_state->ret) {
-        t->call_state->ret = ret;
-        t->call_state->error_is_read = error_is_read;
+    if (ret < 0) {
+        if (!t->call_state->ret) {
+            t->call_state->ret = ret;
+            t->call_state->error_is_read = error_is_read;
+        }
     } else {
         progress_work_done(t->s->progress, t->bytes);
     }
-- 
2.30.2


