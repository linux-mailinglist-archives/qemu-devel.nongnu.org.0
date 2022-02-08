Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8081F4ADE68
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:34:54 +0100 (CET)
Received: from localhost ([::1]:56356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTS7-0003U8-Bw
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:34:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHSYP-0000Ib-3x
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:37:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHSYD-0002e0-Kl
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644334624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w2tBAWxKc13b0G4VpXQRinZ9kc2SVuxYbfgKU6+nyAw=;
 b=hqDyYwGvm2uxRPt2DqaTfqo5r1XT2SOQwPsKmkmVL7AqUR0ZZxETVr8ZeuTujvDi/85GPp
 0kh/6vuyjErLmiKBMI1C9aGtfleEcDC00AlM0l1qsadJCCzVAYQuZCJoQAf0pZoRH19XIE
 h+21OmfhA49JZwDssDHO5WwNOFGSvvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-jqQxXrQlM_e1mGVkMU0Jew-1; Tue, 08 Feb 2022 10:37:00 -0500
X-MC-Unique: jqQxXrQlM_e1mGVkMU0Jew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB5371898291;
 Tue,  8 Feb 2022 15:36:59 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E81157D475;
 Tue,  8 Feb 2022 15:36:58 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/6] block/io.c: fix bdrv_child_cb_drained_begin invocations
 from a coroutine
Date: Tue,  8 Feb 2022 10:36:50 -0500
Message-Id: <20220208153655.1251658-2-eesposit@redhat.com>
In-Reply-To: <20220208153655.1251658-1-eesposit@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 block.c                  | 2 +-
 block/io.c               | 7 ++++++-
 include/block/block-io.h | 8 +++++---
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index e42a99d2af..4551eba2aa 100644
--- a/block.c
+++ b/block.c
@@ -1203,7 +1203,7 @@ static char *bdrv_child_get_parent_desc(BdrvChild *c)
 static void bdrv_child_cb_drained_begin(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
-    bdrv_do_drained_begin_quiesce(bs, NULL, false);
+    bdrv_drained_begin_no_poll(bs);
 }
 
 static bool bdrv_child_cb_drained_poll(BdrvChild *child)
diff --git a/block/io.c b/block/io.c
index 683a32c955..d3ee3e1a7c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -425,7 +425,7 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
     }
 }
 
-void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
+static void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
                                    BdrvChild *parent, bool ignore_bds_parents)
 {
     assert(!qemu_in_coroutine());
@@ -487,6 +487,11 @@ void bdrv_subtree_drained_begin(BlockDriverState *bs)
     bdrv_do_drained_begin(bs, true, NULL, false, true);
 }
 
+void bdrv_drained_begin_no_poll(BlockDriverState *bs)
+{
+    bdrv_do_drained_begin(bs, false, NULL, false, false);
+}
+
 /**
  * This function does not poll, nor must any of its recursively called
  * functions.  The *drained_end_counter pointee will be incremented
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 7c04bc3049..48d3442970 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -308,13 +308,15 @@ bool bdrv_drain_poll(BlockDriverState *bs, bool recursive,
 void bdrv_drained_begin(BlockDriverState *bs);
 
 /**
- * bdrv_do_drained_begin_quiesce:
+ * bdrv_drained_begin_no_poll:
  *
  * Quiesces a BDS like bdrv_drained_begin(), but does not wait for already
  * running requests to complete.
+ * Same as bdrv_drained_begin(), but do not poll for the subgraph to
+ * actually become unquiesced. Therefore, no graph changes will occur
+ * with this function.
  */
-void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
-                                   BdrvChild *parent, bool ignore_bds_parents);
+void bdrv_drained_begin_no_poll(BlockDriverState *bs);
 
 /**
  * Like bdrv_drained_begin, but recursively begins a quiesced section for
-- 
2.31.1


