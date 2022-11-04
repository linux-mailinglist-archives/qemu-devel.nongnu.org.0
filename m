Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813746193F1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 10:58:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtST-0005mv-At; Fri, 04 Nov 2022 05:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqtRo-0005Zp-JZ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqtRk-0000I7-OY
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667555828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVanQIJXADpynmWb1aVbQiE9efvoCwQArGSOVvfiQXM=;
 b=iM64Gh/R+eIuw1+BTb5pjfETw1zYshy7WJurny//BHelzgqeXY2x6uugRNoHQGCZGtzsLn
 eeRRyWElAF1SX7/2yWpROnrejHmzPaDSCvGIax8kTQ30p5DeAiSpXJmU4d7IdDKp0d0f4X
 s76ksVoe4j5UBt15UiGHDT6xACkEI7g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-CuB98wylPziXCHQIUxMjqw-1; Fri, 04 Nov 2022 05:57:05 -0400
X-MC-Unique: CuB98wylPziXCHQIUxMjqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5841886066;
 Fri,  4 Nov 2022 09:57:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 949B240C8459;
 Fri,  4 Nov 2022 09:57:04 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 8/9] block: bdrv_create is never called in non-coroutine
 context
Date: Fri,  4 Nov 2022 05:56:59 -0400
Message-Id: <20221104095700.4117433-9-eesposit@redhat.com>
In-Reply-To: <20221104095700.4117433-1-eesposit@redhat.com>
References: <20221104095700.4117433-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Delete the if case and make sure it won't be called again
in coroutines.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/block.c b/block.c
index c6a80d775c..d03a541e4f 100644
--- a/block.c
+++ b/block.c
@@ -557,30 +557,25 @@ static void coroutine_fn bdrv_create_co_entry(void *opaque)
 int bdrv_create(BlockDriver *drv, const char* filename,
                 QemuOpts *opts, Error **errp)
 {
+    Coroutine *co;
+    CreateCo cco = {
+        .drv = drv,
+        .filename = g_strdup(filename),
+        .opts = opts,
+        .ret = NOT_DONE,
+        .err = NULL,
+    };
     GLOBAL_STATE_CODE();
+    assert(!qemu_in_coroutine());
 
-    if (qemu_in_coroutine()) {
-        /* Fast-path if already in coroutine context */
-        return bdrv_co_create(drv, filename, opts, errp);
-    } else {
-        Coroutine *co;
-        CreateCo cco = {
-            .drv = drv,
-            .filename = g_strdup(filename),
-            .opts = opts,
-            .ret = NOT_DONE,
-            .err = NULL,
-        };
-
-        co = qemu_coroutine_create(bdrv_create_co_entry, &cco);
-        qemu_coroutine_enter(co);
-        while (cco.ret == NOT_DONE) {
-            aio_poll(qemu_get_aio_context(), true);
-        }
-        error_propagate(errp, cco.err);
-        g_free(cco.filename);
-        return cco.ret;
+    co = qemu_coroutine_create(bdrv_create_co_entry, &cco);
+    qemu_coroutine_enter(co);
+    while (cco.ret == NOT_DONE) {
+        aio_poll(qemu_get_aio_context(), true);
     }
+    error_propagate(errp, cco.err);
+    g_free(cco.filename);
+    return cco.ret;
 }
 
 /**
-- 
2.31.1


