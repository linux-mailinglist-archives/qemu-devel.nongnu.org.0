Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782D22D7D68
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:55:43 +0100 (CET)
Received: from localhost ([::1]:39862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmdq-0000lL-E4
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:55:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlvX-0004kK-74
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluo-0002MK-53
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NDh2ZCpLFeJcXJnq+h/IPAjdL93M8YBHVz8/G+2chms=;
 b=G0tUZMs37QpsJGnmEx9aUDjNwVwgbeJBlrndYEEXUVRt2nGbm95w9FmYrts/yoiP8avsBd
 ROT7NCWZz/KwnvlrCVCitkR2WQZzvlkTK0lk8i67j17E8m2d091cUUP8YU2Jg5GVeiEP92
 qXHteU60l363klOwzpPTK70QfaVyxdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-byBHYT6NPryhaGFrnJYRHA-1; Fri, 11 Dec 2020 12:09:03 -0500
X-MC-Unique: byBHYT6NPryhaGFrnJYRHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 719B859;
 Fri, 11 Dec 2020 17:09:01 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70ACA5D6A8;
 Fri, 11 Dec 2020 17:09:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 32/34] block: Simplify qmp_block_resize() error paths
Date: Fri, 11 Dec 2020 18:08:10 +0100
Message-Id: <20201211170812.228643-33-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The only thing that happens after the 'out:' label is blk_unref(blk).
However, blk = NULL in all of the error cases, so instead of jumping to
'out:', we can just return directly.

Cc: qemu-stable@nongnu.org
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201203172311.68232-2-kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 blockdev.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 6c7be7c522..660c735c81 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2454,7 +2454,7 @@ void coroutine_fn qmp_block_resize(bool has_device, const char *device,
                                    int64_t size, Error **errp)
 {
     Error *local_err = NULL;
-    BlockBackend *blk = NULL;
+    BlockBackend *blk;
     BlockDriverState *bs;
     AioContext *old_ctx;
 
@@ -2468,17 +2468,17 @@ void coroutine_fn qmp_block_resize(bool has_device, const char *device,
 
     if (size < 0) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "size", "a >0 size");
-        goto out;
+        return;
     }
 
     if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_RESIZE, NULL)) {
         error_setg(errp, QERR_DEVICE_IN_USE, device);
-        goto out;
+        return;
     }
 
     blk = blk_new_with_bs(bs, BLK_PERM_RESIZE, BLK_PERM_ALL, errp);
     if (!blk) {
-        goto out;
+        return;
     }
 
     bdrv_drained_begin(bs);
@@ -2487,7 +2487,6 @@ void coroutine_fn qmp_block_resize(bool has_device, const char *device,
     bdrv_co_leave(bs, old_ctx);
     bdrv_drained_end(bs);
 
-out:
     bdrv_co_lock(bs);
     blk_unref(blk);
     bdrv_co_unlock(bs);
-- 
2.29.2


