Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD9E64DC09
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:13:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nsz-0001uK-9S; Thu, 15 Dec 2022 08:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p5nsl-0001pg-Ai
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:02:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p5nsj-0000cV-NY
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671109357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NCBiBilvwihuZFbAp+QZl/3rtyifHoMU91SqLdW0Qvs=;
 b=KAon6XfJFuaXdoftbbWpgakZt8N6l6NeZpQmwzE5fo9fIPDMnjUWp3yHsNGXj+xYSW+K+E
 injuDb95NGr8jZCIuQSh/n4cNMhTxTCuXbUxE5NDlRQrVLmXfWOe14a0SPpPjThxU0UTQp
 Fu7iFuYpQtu4pwpLT7m3EmgfYiUJtqo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-wUVmTAaXOB-aGvrZ2E-NPA-1; Thu, 15 Dec 2022 08:02:36 -0500
X-MC-Unique: wUVmTAaXOB-aGvrZ2E-NPA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v14-20020adf8b4e000000b0024174021277so622130wra.13
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 05:02:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NCBiBilvwihuZFbAp+QZl/3rtyifHoMU91SqLdW0Qvs=;
 b=hnTw6EFMwLOSw4BZDbiMvRUGHKc19zmYI+E3Xt/cz6HmfsfRoL3JBvZSNLszHy1L2h
 hak4HipywNBizPQ3Dadip6GakzpfWKuwrG9uoJsfdBF2ukAWpoTA+t2qQDevTl8uj+7P
 KKMLyy12IczSjeEY7azH6dJEWqimwYVISFcvrhh4aBDeTK6AR9p1jtfNPeMg7mEaNROA
 NlljMGNqkepdCUBZEEGQvS4XAGMFsU7VMvavb7a+iH6a5V0vDJ6RlTixojjqOgae2fEl
 +QGg20YVkOdJ7h/DhxQTPvyZ96XmhPOnV02lyFHYupO9uwBiMUI2Td17KSTFfJb5RoWP
 c4iQ==
X-Gm-Message-State: ANoB5plq0CrpC/tbp1ZEvV3gMhwBjYgqQcdg1MZ1kM4MKXOsCDR8vMSg
 CgtDmlRYgTZyxBjMW+5GVIQDNWxMmiDaas3r5mKfJmU14ihYDYUqcBFVkwfEes6Serq5U9icn7f
 ndRBPyrH6QZx1xbiYpBLxLBvcbKuPnHat1W3fDLsbiLN32xsru7mPQkm6sX+ojBOmu+c=
X-Received: by 2002:a05:600c:3514:b0:3cf:a83c:184a with SMTP id
 h20-20020a05600c351400b003cfa83c184amr21774231wmq.24.1671109354259; 
 Thu, 15 Dec 2022 05:02:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5cfRcI79IyyhGcCbVJ0ByikUlAe22mOuh94jUCNXx5blX6exfPJ/7mRDg30cGy+0uoKwvIlA==
X-Received: by 2002:a05:600c:3514:b0:3cf:a83c:184a with SMTP id
 h20-20020a05600c351400b003cfa83c184amr21774197wmq.24.1671109353923; 
 Thu, 15 Dec 2022 05:02:33 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a1c5450000000b003d07de1698asm6100404wmi.46.2022.12.15.05.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 05:02:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	kwolf@redhat.com
Subject: [PATCH] blkdebug: ignore invalid rules in non-coroutine context
Date: Thu, 15 Dec 2022 14:02:25 +0100
Message-Id: <20221215130225.476477-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

blkdebug events can be called from either non-coroutine or coroutine
contexts.  However, suspend actions only make sense from within
a coroutine.  Currently, using those action would lead to an abort() in
qemu_coroutine_yield() ("Co-routine is yielding to no one").  Catch them
and print an error instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c                          |  2 +-
 block/blkdebug.c                 | 10 ++++++++--
 include/block/block-io.h         |  2 +-
 include/block/block_int-common.h |  3 ++-
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index 3f2bd128570e..49c66475c73e 100644
--- a/block.c
+++ b/block.c
@@ -6334,7 +6334,7 @@ BlockStatsSpecific *bdrv_get_specific_stats(BlockDriverState *bs)
     return drv->bdrv_get_specific_stats(bs);
 }
 
-void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event)
+void coroutine_mixed_fn bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 {
     IO_CODE();
     if (!bs || !bs->drv || !bs->drv->bdrv_debug_event) {
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 4265ca125e25..ce297961b7db 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -31,6 +31,7 @@
 #include "block/qdict.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/error-report.h"
 #include "qapi/qapi-visit-block-core.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
@@ -837,7 +838,7 @@ static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
     }
 }
 
-static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
+static void coroutine_mixed_fn blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 {
     BDRVBlkdebugState *s = bs->opaque;
     struct BlkdebugRule *rule, *next;
@@ -855,7 +856,12 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
     }
 
     while (actions_count[ACTION_SUSPEND] > 0) {
-        qemu_coroutine_yield();
+        if (qemu_in_coroutine()) {
+            qemu_coroutine_yield();
+        } else {
+            error_report("Non-coroutine event %s cannot suspend\n",
+                         BlkdebugEvent_lookup.array[event]);
+        }
         actions_count[ACTION_SUSPEND]--;
     }
 }
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 1fa717a545a0..0e7032a23936 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -175,7 +175,7 @@ void *qemu_try_blockalign0(BlockDriverState *bs, size_t size);
 void bdrv_enable_copy_on_read(BlockDriverState *bs);
 void bdrv_disable_copy_on_read(BlockDriverState *bs);
 
-void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event);
+void coroutine_mixed_fn bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event);
 
 #define BLKDBG_EVENT(child, evt) \
     do { \
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index c34c525fa6ba..1d4fd5094a5b 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -726,7 +726,8 @@ struct BlockDriver {
     int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_check)(
         BlockDriverState *bs, BdrvCheckResult *result, BdrvCheckMode fix);
 
-    void (*bdrv_debug_event)(BlockDriverState *bs, BlkdebugEvent event);
+    void coroutine_mixed_fn (*bdrv_debug_event)(BlockDriverState *bs,
+                                                BlkdebugEvent event);
 
     /* io queue for linux-aio */
     void (*bdrv_io_plug)(BlockDriverState *bs);
-- 
2.38.1


