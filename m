Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5585A36F9AA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:58:42 +0200 (CEST)
Received: from localhost ([::1]:43476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRn7-0006IW-CC
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQm3-0005Pv-T8
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQm0-00032I-1w
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619780007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ocEDI99K5SWqjXtfuyA4pCCcwuLmwFFvNKeP4rJugLk=;
 b=SpjlgD2skYeGpP70aX92vf+kaXGXtTMxsUFhtoKdL6dPA33n5PwtZPqUJz6TO94fRq6/A7
 1YlcNEQ/T1vhDu2ytZi9rVMyNGZVBDgT92JRcPkeVgM1PxPxg3jBXJUUMbC9mGokdPeJlS
 LDZPAa+ZhS1EHkm+5lFx1VSWxXNt/YU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-h-3g7R6bPcCVvEF2dlnQDQ-1; Fri, 30 Apr 2021 06:53:22 -0400
X-MC-Unique: h-3g7R6bPcCVvEF2dlnQDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5B486D599;
 Fri, 30 Apr 2021 10:53:15 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5CD95F707;
 Fri, 30 Apr 2021 10:53:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 29/39] block: bdrv_reopen_multiple(): move bdrv_flush to
 separate pre-prepare
Date: Fri, 30 Apr 2021 12:51:37 +0200
Message-Id: <20210430105147.125840-30-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

During reopen we may add backing bs from other aio context, which may
lead to changing original context of top bs.

We are going to move graph modification to prepare stage. So, it will
be possible that bdrv_flush() in bdrv_reopen_prepare called on bs in
non-original aio context, which we didn't aquire which leads to crash.

To avoid this problem move bdrv_flush() to be a separate reopen stage
before bdrv_reopen_prepare().

This doesn't seem correct to acquire only one aio context and not all
contexts participating in reopen. But it's not obvious how to do it
correctly, keeping in mind:

 1. rules of bdrv_set_aio_context_ignore() that requires new_context
    lock not being held

 2. possible deadlocks because of holding all (or several?) AioContext
    locks

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-30-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index bdfe59d94d..357ec1be2c 100644
--- a/block.c
+++ b/block.c
@@ -4274,6 +4274,14 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 
     assert(bs_queue != NULL);
 
+    QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
+        ret = bdrv_flush(bs_entry->state.bs);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "Error flushing drive");
+            goto cleanup;
+        }
+    }
+
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         assert(bs_entry->state.bs->quiesce_counter > 0);
         if (bdrv_reopen_prepare(&bs_entry->state, bs_queue, errp)) {
@@ -4669,12 +4677,6 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
     bdrv_reopen_perm(queue, reopen_state->bs,
                      &reopen_state->perm, &reopen_state->shared_perm);
 
-    ret = bdrv_flush(reopen_state->bs);
-    if (ret) {
-        error_setg_errno(errp, -ret, "Error flushing drive");
-        goto error;
-    }
-
     if (drv->bdrv_reopen_prepare) {
         /*
          * If a driver-specific option is missing, it means that we
-- 
2.30.2


