Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E616193F3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 10:58:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtSJ-0005he-5J; Fri, 04 Nov 2022 05:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqtRm-0005Z7-46
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqtRj-0000HG-Fy
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667555826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5bMhgdHu4HdLGeviML6eZ/24px45Ugg7tk4ksNMuSk=;
 b=UXa4HWBP3mVFb9sQ/xquJOVlpRKhIOypdalPVoOh8373Nrih294IA7udrQkN1w9ir09Yz1
 1THZlHWXMHaILS4me18AcAs8kwMV6DhIH5vHszWVYyk4zCsBwjuQiwe8Zgmxxtb1RskXdQ
 NwnSF3llw0xbK5txm9ymMO8evNUXMxg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-EkXFDnCXOzGrXWIC45L-Hg-1; Fri, 04 Nov 2022 05:57:03 -0400
X-MC-Unique: EkXFDnCXOzGrXWIC45L-Hg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1A8485A5A6;
 Fri,  4 Nov 2022 09:57:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90A0340C83EC;
 Fri,  4 Nov 2022 09:57:02 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 1/9] block: call bdrv_co_drain_begin in a coroutine
Date: Fri,  4 Nov 2022 05:56:52 -0400
Message-Id: <20221104095700.4117433-2-eesposit@redhat.com>
In-Reply-To: <20221104095700.4117433-1-eesposit@redhat.com>
References: <20221104095700.4117433-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

It seems that bdrv_open_driver() forgot to create a coroutine
where to call bs->drv->bdrv_co_drain_begin(), a callback
marked as coroutine_fn.

Because there is no active I/O at this point, the coroutine
should end right after entering, so the caller does not need
to poll until it is finished.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index 5311b21f8e..d2b2800039 100644
--- a/block.c
+++ b/block.c
@@ -1637,12 +1637,34 @@ out:
     g_free(gen_node_name);
 }
 
+typedef struct DrainCo {
+    BlockDriverState *bs;
+    int ret;
+} DrainCo;
+
+static void coroutine_fn bdrv_co_drain_begin(void *opaque)
+{
+    int i;
+    DrainCo *co = opaque;
+    BlockDriverState *bs = co->bs;
+
+    for (i = 0; i < bs->quiesce_counter; i++) {
+        bs->drv->bdrv_co_drain_begin(bs);
+    }
+    co->ret = 0;
+}
+
 static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
                             const char *node_name, QDict *options,
                             int open_flags, Error **errp)
 {
     Error *local_err = NULL;
-    int i, ret;
+    int ret;
+    Coroutine *co;
+    DrainCo dco = {
+        .bs = bs,
+        .ret = NOT_DONE,
+    };
     GLOBAL_STATE_CODE();
 
     bdrv_assign_node_name(bs, node_name, &local_err);
@@ -1690,10 +1712,14 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
     assert(bdrv_min_mem_align(bs) != 0);
     assert(is_power_of_2(bs->bl.request_alignment));
 
-    for (i = 0; i < bs->quiesce_counter; i++) {
-        if (drv->bdrv_co_drain_begin) {
-            drv->bdrv_co_drain_begin(bs);
-        }
+    if (drv->bdrv_co_drain_begin) {
+        co = qemu_coroutine_create(bdrv_co_drain_begin, &dco);
+        qemu_coroutine_enter(co);
+        /*
+         * There should be no reason for drv->bdrv_co_drain_begin to wait at
+         * this point, because the device does not have any active I/O.
+         */
+        assert(dco.ret != NOT_DONE);
     }
 
     return 0;
-- 
2.31.1


