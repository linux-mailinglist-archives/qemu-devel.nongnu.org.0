Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A3E4D8638
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:50:10 +0100 (CET)
Received: from localhost ([::1]:60460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTl5N-000679-L0
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:50:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbP-0001Jj-3o
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbL-0006XZ-Hz
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647263946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ML8EyUfiYt5tFNjQrNSkx8Cc5L6+V2QPZKONCh3xuWI=;
 b=Rmfcuw8o4p1LkUlBErAbvmzhqa66SlQ377FEu43UWMPSNp/JH/FStBdncaOWPUBERpE4Ks
 ISAONn4keCZLyDfTQVeg1Nf1iRDaDIzDsHn7iqnlSIc4Nb4pb+/2dWKZaahHhtidvKNP2G
 ygm3wr3l2aO2mBOUVLjia5dPEA8D92o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-vX2TlG__MQy3C2rH0tvpIw-1; Mon, 14 Mar 2022 09:19:05 -0400
X-MC-Unique: vX2TlG__MQy3C2rH0tvpIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C18480158E;
 Mon, 14 Mar 2022 13:19:05 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB8741686D;
 Mon, 14 Mar 2022 13:19:04 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 03/10] block/io.c: fix bdrv_child_cb_drained_begin
 invocations from a coroutine
Date: Mon, 14 Mar 2022 09:18:47 -0400
Message-Id: <20220314131854.2202651-4-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Using bdrv_do_drained_begin_quiesce() in bdrv_child_cb_drained_begin()
is not a good idea: the callback might be called when running
a drain in a coroutine, and bdrv_drained_begin_poll() does not
handle that case, resulting in assertion failure.

Instead, bdrv_do_drained_begin with no recursion and poll
will accomplish the same thing (invoking bdrv_do_drained_begin_quiesce)
but will firstly check if we are already in a coroutine, and exit
from that via bdrv_co_yield_to_drain().

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                  |  2 +-
 block/io.c               |  8 +++++++-
 include/block/block-io.h | 20 +++++++++++---------
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/block.c b/block.c
index 718e4cae8b..372f16f4a0 100644
--- a/block.c
+++ b/block.c
@@ -1211,7 +1211,7 @@ static char *bdrv_child_get_parent_desc(BdrvChild *c)
 static void bdrv_child_cb_drained_begin(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
-    bdrv_do_drained_begin_quiesce(bs, NULL, false);
+    bdrv_drained_begin_no_poll(bs);
 }
 
 static bool bdrv_child_cb_drained_poll(BdrvChild *child)
diff --git a/block/io.c b/block/io.c
index e446782ae0..e77861c464 100644
--- a/block/io.c
+++ b/block/io.c
@@ -523,7 +523,7 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
     }
 }
 
-void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
+static void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
                                    BdrvChild *parent, bool ignore_bds_parents)
 {
     IO_OR_GS_CODE();
@@ -587,6 +587,12 @@ void bdrv_subtree_drained_begin(BlockDriverState *bs)
     bdrv_do_drained_begin(bs, true, NULL, false, true);
 }
 
+void bdrv_drained_begin_no_poll(BlockDriverState *bs)
+{
+    IO_CODE();
+    bdrv_do_drained_begin(bs, false, NULL, false, false);
+}
+
 /**
  * This function does not poll, nor must any of its recursively called
  * functions.  The *drained_end_counter pointee will be incremented
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 5e3f346806..9135b648bf 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -226,6 +226,17 @@ int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
                                     int64_t bytes, BdrvRequestFlags read_flags,
                                     BdrvRequestFlags write_flags);
 
+/**
+ * bdrv_drained_begin_no_poll:
+ *
+ * Quiesces a BDS like bdrv_drained_begin(), but does not wait for already
+ * running requests to complete.
+ * Same as bdrv_drained_begin(), but do not poll for the subgraph to
+ * actually become unquiesced. Therefore, no graph changes will occur
+ * with this function.
+ */
+void bdrv_drained_begin_no_poll(BlockDriverState *bs);
+
 /**
  * bdrv_drained_end_no_poll:
  *
@@ -332,15 +343,6 @@ bool bdrv_drain_poll(BlockDriverState *bs, bool recursive,
  */
 void bdrv_drained_begin(BlockDriverState *bs);
 
-/**
- * bdrv_do_drained_begin_quiesce:
- *
- * Quiesces a BDS like bdrv_drained_begin(), but does not wait for already
- * running requests to complete.
- */
-void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
-                                   BdrvChild *parent, bool ignore_bds_parents);
-
 /**
  * Like bdrv_drained_begin, but recursively begins a quiesced section for
  * exclusive access to all child nodes as well.
-- 
2.31.1


