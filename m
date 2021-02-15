Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C468931BBFB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:14:47 +0100 (CET)
Received: from localhost ([::1]:41340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfaI-000383-R5
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfNf-0005lC-Ig
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:01:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfNR-0000pd-CO
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:01:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613401288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3GCvsC8yveEyfHJFXKD8eW8I0U03JjgHVmJiZV9zH8=;
 b=cxw4ib1e5qZXvWBkUehm9ut2D06n3QYYQJYgLg0vuuneH+eVb8M6pSjUVwsoh6wn1lz4jh
 N3j3IwK1i1phRBVcEmoXOE0pWdYYw6BlfQoGDq4XXsjYPvCzi3O+xNf5bCCNBoM1KR99xz
 v4MdFAsxAW8KBC9IJWkAHvhep0vOo6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-2YkgHUXuORS8flTVm4CVpQ-1; Mon, 15 Feb 2021 10:01:23 -0500
X-MC-Unique: 2YkgHUXuORS8flTVm4CVpQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 224F484F20C;
 Mon, 15 Feb 2021 15:01:14 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2856E69338;
 Mon, 15 Feb 2021 15:01:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/11] block: add bdrv_co_delete_file_noerr
Date: Mon, 15 Feb 2021 16:00:57 +0100
Message-Id: <20210215150100.436555-9-kwolf@redhat.com>
In-Reply-To: <20210215150100.436555-1-kwolf@redhat.com>
References: <20210215150100.436555-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

This function wraps bdrv_co_delete_file for the common case of removing a file,
which was just created by format driver, on an error condition.

It hides the -ENOTSUPP error, and reports all other errors otherwise.

Use it in luks driver

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Message-Id: <20201217170904.946013-3-mlevitsk@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |  1 +
 block.c               | 22 ++++++++++++++++++++++
 block/crypto.c        | 15 ++-------------
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index a9b7f03f11..b3f6e509d4 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -441,6 +441,7 @@ int bdrv_freeze_backing_chain(BlockDriverState *bs, BlockDriverState *base,
                               Error **errp);
 void bdrv_unfreeze_backing_chain(BlockDriverState *bs, BlockDriverState *base);
 int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp);
+void coroutine_fn bdrv_co_delete_file_noerr(BlockDriverState *bs);
 
 
 typedef struct BdrvCheckResult {
diff --git a/block.c b/block.c
index c682c3e3b9..a1f3cecd75 100644
--- a/block.c
+++ b/block.c
@@ -706,6 +706,28 @@ int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp)
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
-- 
2.29.2


