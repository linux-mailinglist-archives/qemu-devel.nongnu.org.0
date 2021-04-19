Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0CB363E18
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:00:21 +0200 (CEST)
Received: from localhost ([::1]:43602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYPlU-0006Wi-LN
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhe-0001OK-1G
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:56:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhb-0001BU-67
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618822578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYLRRbpbjp9mKUuAMkZXKJr//pFxyKHZyB+Y7882t5M=;
 b=Yoh8MZH1Gp0Y+2W6SRfo1KuRcoDY/PygpxFpJUs3pBRI9sqKpFeZ09ss49yqTqZdppZSLZ
 o1u+8vckGXYvl+d37W1N9dH2ZN8IL/z5uhRP4ldVIcN0hshh1KuXVKInFVjZ7WXtWyAhC/
 AoLk3iUWj/nHSDa0RupkPsVIltFs1MA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-dv6RVMSUOg26xJi_rCY8HA-1; Mon, 19 Apr 2021 04:56:14 -0400
X-MC-Unique: dv6RVMSUOg26xJi_rCY8HA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B04A1020C21;
 Mon, 19 Apr 2021 08:56:13 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-195.ams2.redhat.com
 [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F055D5D741;
 Mon, 19 Apr 2021 08:56:06 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 6/8] block: do not acquire AioContext in
 check_to_replace_node
Date: Mon, 19 Apr 2021 10:55:39 +0200
Message-Id: <20210419085541.22310-7-eesposit@redhat.com>
In-Reply-To: <20210419085541.22310-1-eesposit@redhat.com>
References: <20210419085541.22310-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the (only) caller do it.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c               | 22 +++++-----------------
 blockdev.c            |  7 ++++++-
 include/block/block.h |  1 +
 3 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/block.c b/block.c
index f40fb63c75..fd12f88062 100644
--- a/block.c
+++ b/block.c
@@ -6776,24 +6776,15 @@ bool bdrv_recurse_can_replace(BlockDriverState *bs,
  *
  * The result (whether the node can be replaced or not) is only valid
  * for as long as no graph or permission changes occur.
+ *
+ * Called with AioContext lock held.
  */
 BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
+                                        BlockDriverState *to_replace_bs,
                                         const char *node_name, Error **errp)
 {
-    BlockDriverState *to_replace_bs = bdrv_find_node(node_name);
-    AioContext *aio_context;
-
-    if (!to_replace_bs) {
-        error_setg(errp, "Failed to find node with node-name='%s'", node_name);
-        return NULL;
-    }
-
-    aio_context = bdrv_get_aio_context(to_replace_bs);
-    aio_context_acquire(aio_context);
-
     if (bdrv_op_is_blocked(to_replace_bs, BLOCK_OP_TYPE_REPLACE, errp)) {
-        to_replace_bs = NULL;
-        goto out;
+        return NULL;
     }
 
     /* We don't want arbitrary node of the BDS chain to be replaced only the top
@@ -6806,12 +6797,9 @@ BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
                    "because it cannot be guaranteed that doing so would not "
                    "lead to an abrupt change of visible data",
                    node_name, parent_bs->node_name);
-        to_replace_bs = NULL;
-        goto out;
+        return NULL;
     }
 
-out:
-    aio_context_release(aio_context);
     return to_replace_bs;
 }
 
diff --git a/blockdev.c b/blockdev.c
index a57590aae4..e901107344 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3056,13 +3056,18 @@ static void blockdev_mirror_common(const char *job_id, BlockDriverState *bs,
             return;
         }
 
-        to_replace_bs = check_to_replace_node(bs, replaces, errp);
+        to_replace_bs = bdrv_find_node(replaces);
         if (!to_replace_bs) {
+            error_setg(errp, "Failed to find node with node-name='%s'",
+                       replaces);
             return;
         }
 
         replace_aio_context = bdrv_get_aio_context(to_replace_bs);
         aio_context_acquire(replace_aio_context);
+        if (!check_to_replace_node(bs, to_replace_bs, replaces, errp)) {
+            return;
+        }
         replace_size = bdrv_getlength(to_replace_bs);
         aio_context_release(replace_aio_context);
 
diff --git a/include/block/block.h b/include/block/block.h
index b3f6e509d4..f57c34a19a 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -474,6 +474,7 @@ int bdrv_amend_options(BlockDriverState *bs_new, QemuOpts *opts,
 
 /* check if a named node can be replaced when doing drive-mirror */
 BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
+                                        BlockDriverState *to_replace_bs,
                                         const char *node_name, Error **errp);
 
 /* async block I/O */
-- 
2.30.2


