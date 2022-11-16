Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524F162B5A0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 09:53:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovE8j-0002jN-3r; Wed, 16 Nov 2022 03:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovE8Z-0002Zn-B4
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 03:51:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovE8V-0003pm-H3
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 03:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668588666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5/RjdUrrSizYq0xEUqvVDmTRuvXC6c6saEwuVt2lpM=;
 b=AOZNDXfWbwXlkq6sFJA+96mdvv+FsrvB7h+V9giu6GRyyev54xKSx7uJcnuo/wt49jUkxy
 sr3r0tHx1Hu+xKC6WMg+aON3IBogGBDfluPtB1RneFN6js9TCxkXmrreW8JGYAGvjHZpI8
 56woXS/ZI2FP5jNmExqjWN1W//TiNOU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-VbJXA2xXPAyDuS5oWae8lA-1; Wed, 16 Nov 2022 03:51:03 -0500
X-MC-Unique: VbJXA2xXPAyDuS5oWae8lA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FCDD803481;
 Wed, 16 Nov 2022 08:51:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64CB92028E8F;
 Wed, 16 Nov 2022 08:51:02 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v3 7/8] block: bdrv_create is never called in coroutine context
Date: Wed, 16 Nov 2022 03:50:49 -0500
Message-Id: <20221116085050.2295179-8-eesposit@redhat.com>
In-Reply-To: <20221116085050.2295179-1-eesposit@redhat.com>
References: <20221116085050.2295179-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

Delete the if case and make sure it won't be called again
in coroutines.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/block.c b/block.c
index dcac28756c..7a4ce7948c 100644
--- a/block.c
+++ b/block.c
@@ -563,30 +563,25 @@ static void coroutine_fn bdrv_create_co_entry(void *opaque)
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


