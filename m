Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDF936F998
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:50:25 +0200 (CEST)
Received: from localhost ([::1]:43958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRf6-0003Qx-1x
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlu-00052z-5u
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlh-0002tf-Ur
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aDDXFCmovbN33It4Wrp/ARSS4+F2m2AMow4CTilYaUw=;
 b=WljnofRzKhS0gXKx9++Z3zubv0LWdw10PjkaleFAhY/hkxnUdWosRUNMwCjjvcZOWbyZFb
 8urOpetbNrhVpAZ59HtSa+CtlxGbQu8+Wlxq3a971hM4IefreeN/ACxD2lw6MZNmttwq0T
 zWfsyHS5IiW+rglIwvOKZSWL9ODK+68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-IxkTkOMIOO2NyJYGzLsUpA-1; Fri, 30 Apr 2021 06:53:05 -0400
X-MC-Unique: IxkTkOMIOO2NyJYGzLsUpA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 976DA100A636;
 Fri, 30 Apr 2021 10:53:04 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F83B76204;
 Fri, 30 Apr 2021 10:53:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 20/39] block: split out bdrv_replace_node_noperm()
Date: Fri, 30 Apr 2021 12:51:28 +0200
Message-Id: <20210430105147.125840-21-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Split part of bdrv_replace_node_common() to be used separately.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-21-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 50 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/block.c b/block.c
index c74e6e7cc1..9283c8d97b 100644
--- a/block.c
+++ b/block.c
@@ -4991,6 +4991,34 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
+static int bdrv_replace_node_noperm(BlockDriverState *from,
+                                    BlockDriverState *to,
+                                    bool auto_skip, Transaction *tran,
+                                    Error **errp)
+{
+    BdrvChild *c, *next;
+
+    QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
+        assert(c->bs == from);
+        if (!should_update_child(c, to)) {
+            if (auto_skip) {
+                continue;
+            }
+            error_setg(errp, "Should not change '%s' link to '%s'",
+                       c->name, from->node_name);
+            return -EINVAL;
+        }
+        if (c->frozen) {
+            error_setg(errp, "Cannot change '%s' link to '%s'",
+                       c->name, from->node_name);
+            return -EPERM;
+        }
+        bdrv_replace_child_safe(c, to, tran);
+    }
+
+    return 0;
+}
+
 /*
  * With auto_skip=true bdrv_replace_node_common skips updating from parents
  * if it creates a parent-child relation loop or if parent is block-job.
@@ -5002,7 +5030,6 @@ static int bdrv_replace_node_common(BlockDriverState *from,
                                     BlockDriverState *to,
                                     bool auto_skip, Error **errp)
 {
-    BdrvChild *c, *next;
     Transaction *tran = tran_new();
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
@@ -5022,24 +5049,9 @@ static int bdrv_replace_node_common(BlockDriverState *from,
      * permissions based on new graph. If we fail, we'll roll-back the
      * replacement.
      */
-    QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
-        assert(c->bs == from);
-        if (!should_update_child(c, to)) {
-            if (auto_skip) {
-                continue;
-            }
-            ret = -EINVAL;
-            error_setg(errp, "Should not change '%s' link to '%s'",
-                       c->name, from->node_name);
-            goto out;
-        }
-        if (c->frozen) {
-            ret = -EPERM;
-            error_setg(errp, "Cannot change '%s' link to '%s'",
-                       c->name, from->node_name);
-            goto out;
-        }
-        bdrv_replace_child_safe(c, to, tran);
+    ret = bdrv_replace_node_noperm(from, to, auto_skip, tran, errp);
+    if (ret < 0) {
+        goto out;
     }
 
     found = g_hash_table_new(NULL, NULL);
-- 
2.30.2


