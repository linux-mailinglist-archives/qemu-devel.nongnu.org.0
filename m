Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C54617E40
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 14:44:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqaUd-0001Ys-IV; Thu, 03 Nov 2022 09:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqaUH-0001Ow-59
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:42:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqaU9-0002AW-0c
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667482932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MxSYuQsbp/lTdxsuWIZ2njnzhmLoVdg96ID1GpwwD9I=;
 b=cfSmxPr4SIGI82405mNX08uH/oMUJGuY0ipyoSI+ftwC9luyRFpeLOrSviRAvsYLMJ6gzt
 4qLuH+SUrtqyiZ1MWfWC97aB+7duPiZn0Lg7SQNutga4Dp0EerkqhW935+3vfjrUyouprr
 jNu3yuN15mNo+j83q688Ni2oyCEzlHQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-Eb3nd6bmP4GjC0HkYHekBQ-1; Thu, 03 Nov 2022 09:42:09 -0400
X-MC-Unique: Eb3nd6bmP4GjC0HkYHekBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1651C3C0F24B;
 Thu,  3 Nov 2022 13:42:09 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF88B40C6EC3;
 Thu,  3 Nov 2022 13:42:08 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 1/9] block: call bdrv_co_drain_begin in a coroutine
Date: Thu,  3 Nov 2022 09:41:58 -0400
Message-Id: <20221103134206.4041928-2-eesposit@redhat.com>
In-Reply-To: <20221103134206.4041928-1-eesposit@redhat.com>
References: <20221103134206.4041928-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It seems that bdrv_open_driver() forgot to create a coroutine
where to call bs->drv->bdrv_co_drain_begin(), a callback
marked as coroutine_fn.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index 5311b21f8e..7211f62001 100644
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
@@ -1690,10 +1712,10 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
     assert(bdrv_min_mem_align(bs) != 0);
     assert(is_power_of_2(bs->bl.request_alignment));
 
-    for (i = 0; i < bs->quiesce_counter; i++) {
-        if (drv->bdrv_co_drain_begin) {
-            drv->bdrv_co_drain_begin(bs);
-        }
+    if (drv->bdrv_co_drain_begin) {
+        co = qemu_coroutine_create(bdrv_co_drain_begin, &dco);
+        qemu_coroutine_enter(co);
+        AIO_WAIT_WHILE(qemu_get_aio_context(), dco.ret == NOT_DONE);
     }
 
     return 0;
-- 
2.31.1


