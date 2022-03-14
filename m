Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223914D85E8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:29:58 +0100 (CET)
Received: from localhost ([::1]:49536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTklp-0004jq-7k
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:29:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbR-0001LQ-DK
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbO-0006Yf-0d
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647263949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i17O6Yt9gX3tScA5hKxhiS+f8J0MuL300cgOyoffDHs=;
 b=P19w9tMvMnY68bRXknwWwm8AxXLZ0AM73HuQHLydTBiKoduUDfSdSkIPEfP+RwZgXPkU45
 h9xOYbWSwNUCeX2OS1zRfYnDO5ogrW52v7VpQflgsEEfIo47oEzgbZ7VGLCfaoKW9qYhP8
 EJfEkpHz6QBY526Mjh0v43sarcdBibI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-iKmIyr_yPfmksFlYFXLHnA-1; Mon, 14 Mar 2022 09:19:06 -0400
X-MC-Unique: iKmIyr_yPfmksFlYFXLHnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0415F3C02B64;
 Mon, 14 Mar 2022 13:19:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B712F1686D;
 Mon, 14 Mar 2022 13:19:05 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 06/10] test-bdrv-drain.c: adapt test to support additional
 subtree drains
Date: Mon, 14 Mar 2022 09:18:50 -0400
Message-Id: <20220314131854.2202651-7-eesposit@redhat.com>
In-Reply-To: <20220314131854.2202651-1-eesposit@redhat.com>
References: <20220314131854.2202651-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There will be a problem in this test when we will add
subtree drains in bdrv_replace_child_noperm:

test_detach_indirect is only interested in observing the first
call to .drained_begin. In the original test, there was only a single
subtree drain; however, with additional drains introduced in
bdrv_replace_child_noperm(), the test callback would be called too early
and/or multiple times.
Override the callback only when we actually want to use it, and put back
the original after it's been invoked.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/unit/test-bdrv-drain.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 36be84ae55..f750ddfc4e 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1320,15 +1320,18 @@ static void detach_by_parent_aio_cb(void *opaque, int ret)
     }
 }
 
+static BdrvChildClass detach_by_driver_cb_class;
+
 static void detach_by_driver_cb_drained_begin(BdrvChild *child)
 {
+    /* restore .drained_begin cb, we don't need it anymore. */
+    detach_by_driver_cb_class.drained_begin = child_of_bds.drained_begin;
+
     aio_bh_schedule_oneshot(qemu_get_current_aio_context(),
                             detach_indirect_bh, &detach_by_parent_data);
     child_of_bds.drained_begin(child);
 }
 
-static BdrvChildClass detach_by_driver_cb_class;
-
 /*
  * Initial graph:
  *
@@ -1360,8 +1363,6 @@ static void test_detach_indirect(bool by_parent_cb)
 
     if (!by_parent_cb) {
         detach_by_driver_cb_class = child_of_bds;
-        detach_by_driver_cb_class.drained_begin =
-            detach_by_driver_cb_drained_begin;
     }
 
     /* Create all involved nodes */
@@ -1419,6 +1420,12 @@ static void test_detach_indirect(bool by_parent_cb)
     acb = blk_aio_preadv(blk, 0, &qiov, 0, detach_by_parent_aio_cb, NULL);
     g_assert(acb != NULL);
 
+    if (!by_parent_cb) {
+        /* set .drained_begin cb to run only in the following drain. */
+        detach_by_driver_cb_class.drained_begin =
+            detach_by_driver_cb_drained_begin;
+    }
+
     /* Drain and check the expected result */
     bdrv_subtree_drained_begin(parent_b);
 
-- 
2.31.1


