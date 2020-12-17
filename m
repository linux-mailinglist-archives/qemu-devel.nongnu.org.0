Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BB32DD5CF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 18:13:44 +0100 (CET)
Received: from localhost ([::1]:44554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpwqU-0007SW-AB
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 12:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpwmM-00056c-26
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpwmI-0005X3-8D
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608224960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D0HlEvjqxh7cvROOp870mU65UUlLcmZ84xVHTs4xjGo=;
 b=X1DKb5Vpb5N1CgYhiC4qi7wb0xeuBrEWBAXpdPyOzenKqpO7mzvzQvw4uaziThFG7NN51c
 40MqNYYMEnThpew3kk9eTSHHxVYI2c5TeyG2z7uUpbRSZrm3TztrCYntXpv7NkQ6FqOq9t
 wdjtHWMCdPo/JQpXgcQyBWhXt1O6WYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-M24k-M3fP5uOAgxAW2dwMg-1; Thu, 17 Dec 2020 12:09:16 -0500
X-MC-Unique: M24k-M3fP5uOAgxAW2dwMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1456801AC2;
 Thu, 17 Dec 2020 17:09:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C173F60BE5;
 Thu, 17 Dec 2020 17:09:10 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/3] block: add bdrv_co_delete_file_noerr
Date: Thu, 17 Dec 2020 19:09:03 +0200
Message-Id: <20201217170904.946013-3-mlevitsk@redhat.com>
In-Reply-To: <20201217170904.946013-1-mlevitsk@redhat.com>
References: <20201217170904.946013-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function wraps bdrv_co_delete_file for the common case of removing a file,
which was just created by format driver, on an error condition.

It hides the -ENOTSUPP error, and reports all other errors otherwise.

Use it in luks driver

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block.c               | 22 ++++++++++++++++++++++
 block/crypto.c        | 15 ++-------------
 include/block/block.h |  1 +
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/block.c b/block.c
index f1cedac362..b9edea3b97 100644
--- a/block.c
+++ b/block.c
@@ -704,6 +704,28 @@ int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp)
     return ret;
 }
 
+void coroutine_fn bdrv_co_delete_file_noerr(BlockDriverState *bs)
+{
+    Error *local_err = NULL;
+    int ret;
+
+    if (!bs) {
+        return;
+    }
+
+    ret = bdrv_co_delete_file(bs, &local_err);
+    /*
+     * ENOTSUP will happen if the block driver doesn't support
+     * the 'bdrv_co_delete_file' interface. This is a predictable
+     * scenario and shouldn't be reported back to the user.
+     */
+    if (ret == -ENOTSUP) {
+        error_free(local_err);
+    } else if (ret < 0) {
+        error_report_err(local_err);
+    }
+}
+
 /**
  * Try to get @bs's logical and physical block size.
  * On success, store them in @bsz struct and return 0.
diff --git a/block/crypto.c b/block/crypto.c
index b3a5275132..1d30fde38e 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -725,19 +725,8 @@ fail:
      * If an error occurred, delete 'filename'. Even if the file existed
      * beforehand, it has been truncated and corrupted in the process.
      */
-    if (ret && bs) {
-        Error *local_delete_err = NULL;
-        int r_del = bdrv_co_delete_file(bs, &local_delete_err);
-        /*
-         * ENOTSUP will happen if the block driver doesn't support
-         * the 'bdrv_co_delete_file' interface. This is a predictable
-         * scenario and shouldn't be reported back to the user.
-         */
-        if ((r_del < 0) && (r_del != -ENOTSUP)) {
-            error_report_err(local_delete_err);
-        } else {
-            error_free(local_delete_err);
-        }
+    if (ret) {
+        bdrv_co_delete_file_noerr(bs);
     }
 
     bdrv_unref(bs);
diff --git a/include/block/block.h b/include/block/block.h
index c9d7c58765..af03022723 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -428,6 +428,7 @@ int bdrv_freeze_backing_chain(BlockDriverState *bs, BlockDriverState *base,
                               Error **errp);
 void bdrv_unfreeze_backing_chain(BlockDriverState *bs, BlockDriverState *base);
 int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp);
+void coroutine_fn bdrv_co_delete_file_noerr(BlockDriverState *bs);
 
 
 typedef struct BdrvCheckResult {
-- 
2.26.2


