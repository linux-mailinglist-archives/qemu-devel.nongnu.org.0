Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D543B86FD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:23:02 +0200 (CEST)
Received: from localhost ([::1]:34438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyczN-0005IT-Vz
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycg5-00033u-0u
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfi-00077G-71
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=606/egHMQGfZltz+YwAPSGw6QT56p57Q3k1YWew8UHM=;
 b=bPD6F84sDz6xEX6KeCI2/EPxe27/8DrRoD3IKjT1j4p6kGMt7HWx+Z0skyjLjoLX5e7Q1O
 6VWm4SSgrnPBqJicXbwdsoTwCc7TKu4Fkr5LdhHqILD/wGH1K6+ilCVBUL5IdF/uvrOtCx
 4Ycg9M1YvfuRQSD3VbR36i/0Utf/1eU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-UUDeeU91MXqEodBgRcqu1w-1; Wed, 30 Jun 2021 12:02:33 -0400
X-MC-Unique: UUDeeU91MXqEodBgRcqu1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5708A804140;
 Wed, 30 Jun 2021 16:02:31 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63F8F179E6;
 Wed, 30 Jun 2021 16:02:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 16/24] block/commit: use QEMU_AUTO_VFREE
Date: Wed, 30 Jun 2021 18:01:58 +0200
Message-Id: <20210630160206.276439-17-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210628121133.193984-3-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/commit.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/block/commit.c b/block/commit.c
index b7f0c7c061..42792b4556 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -119,24 +119,24 @@ static int coroutine_fn commit_run(Job *job, Error **errp)
     uint64_t delay_ns = 0;
     int ret = 0;
     int64_t n = 0; /* bytes */
-    void *buf = NULL;
+    QEMU_AUTO_VFREE void *buf = NULL;
     int64_t len, base_len;
 
-    ret = len = blk_getlength(s->top);
+    len = blk_getlength(s->top);
     if (len < 0) {
-        goto out;
+        return len;
     }
     job_progress_set_remaining(&s->common.job, len);
 
-    ret = base_len = blk_getlength(s->base);
+    base_len = blk_getlength(s->base);
     if (base_len < 0) {
-        goto out;
+        return base_len;
     }
 
     if (base_len < len) {
         ret = blk_truncate(s->base, len, false, PREALLOC_MODE_OFF, 0, NULL);
         if (ret) {
-            goto out;
+            return ret;
         }
     }
 
@@ -174,7 +174,7 @@ static int coroutine_fn commit_run(Job *job, Error **errp)
                 block_job_error_action(&s->common, s->on_error,
                                        error_in_source, -ret);
             if (action == BLOCK_ERROR_ACTION_REPORT) {
-                goto out;
+                return ret;
             } else {
                 n = 0;
                 continue;
@@ -190,12 +190,7 @@ static int coroutine_fn commit_run(Job *job, Error **errp)
         }
     }
 
-    ret = 0;
-
-out:
-    qemu_vfree(buf);
-
-    return ret;
+    return 0;
 }
 
 static const BlockJobDriver commit_job_driver = {
@@ -435,7 +430,7 @@ int bdrv_commit(BlockDriverState *bs)
     int ro;
     int64_t n;
     int ret = 0;
-    uint8_t *buf = NULL;
+    QEMU_AUTO_VFREE uint8_t *buf = NULL;
     Error *local_err = NULL;
 
     if (!drv)
@@ -556,8 +551,6 @@ int bdrv_commit(BlockDriverState *bs)
 
     ret = 0;
 ro_cleanup:
-    qemu_vfree(buf);
-
     blk_unref(backing);
     if (bdrv_cow_bs(bs) != backing_file_bs) {
         bdrv_set_backing_hd(bs, backing_file_bs, &error_abort);
-- 
2.31.1


