Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988EF359E52
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 14:08:33 +0200 (CEST)
Received: from localhost ([::1]:35664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUpw8-0001Mp-Kv
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 08:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUpsO-000811-F7
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 08:04:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUpsF-0008CF-Mj
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 08:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617969869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FkZP2zq258xND6bWKPiyXr/bfL8VH+g2g0DWI6QgFA4=;
 b=fWmHzQhatw6vxrt3JPypHbZMkJytXFPe49V4KpWxOUNCvkU/9IeNjp26Z4/3AyvNgMs3gD
 RjQzbRO2jcjDgPwXc94KX41SSuvTWONvNOt1d0TwnYe979VtWWFvF8ZMLXiAqv7kCrmm4E
 zfwhBuA8mHbIqHV3kcHsAvHL3LLYmtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-tJd3-XtOPLeQwOR22hC_3Q-1; Fri, 09 Apr 2021 08:04:27 -0400
X-MC-Unique: tJd3-XtOPLeQwOR22hC_3Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF7C08030B5;
 Fri,  9 Apr 2021 12:04:26 +0000 (UTC)
Received: from localhost (ovpn-114-67.ams2.redhat.com [10.36.114.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A13719C71;
 Fri,  9 Apr 2021 12:04:26 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/4] mirror: Move open_backing_file to exit_common
Date: Fri,  9 Apr 2021 14:04:18 +0200
Message-Id: <20210409120422.144040-2-mreitz@redhat.com>
In-Reply-To: <20210409120422.144040-1-mreitz@redhat.com>
References: <20210409120422.144040-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a graph change and therefore should be done in job-finalize
(which is what invokes mirror_exit_common()).

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/mirror.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index d7e54c0ff7..f1f936bf1a 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -689,6 +689,14 @@ static int mirror_exit_common(Job *job)
                 ret = -EPERM;
             }
         }
+    } else if (!abort && s->backing_mode == MIRROR_OPEN_BACKING_CHAIN) {
+        assert(!bdrv_backing_chain_next(target_bs));
+        ret = bdrv_open_backing_file(bdrv_skip_filters(target_bs), NULL,
+                                     "backing", &local_err);
+        if (ret < 0) {
+            error_report_err(local_err);
+            local_err = NULL;
+        }
     }
 
     if (s->to_replace) {
@@ -1107,9 +1115,6 @@ immediate_exit:
 static void mirror_complete(Job *job, Error **errp)
 {
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
-    BlockDriverState *target;
-
-    target = blk_bs(s->target);
 
     if (!s->synced) {
         error_setg(errp, "The active block job '%s' cannot be completed",
@@ -1117,17 +1122,6 @@ static void mirror_complete(Job *job, Error **errp)
         return;
     }
 
-    if (s->backing_mode == MIRROR_OPEN_BACKING_CHAIN) {
-        int ret;
-
-        assert(!bdrv_backing_chain_next(target));
-        ret = bdrv_open_backing_file(bdrv_skip_filters(target), NULL,
-                                     "backing", errp);
-        if (ret < 0) {
-            return;
-        }
-    }
-
     /* block all operations on to_replace bs */
     if (s->replaces) {
         AioContext *replace_aio_context;
-- 
2.29.2


