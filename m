Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2445535A374
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:33:31 +0200 (CEST)
Received: from localhost ([::1]:48360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUu4X-0004co-Tk
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtnt-0007mI-Th
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtnq-0003Nf-NN
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617984969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAw/IADhNh/BttxkT1Kn1aKYF2k8HdTDwkIzAeO6v2k=;
 b=LiZ+5bfJpOJ27TGl+jqCob2JlNpccudNdoUWFHG+1jkP7zfADkty4tK/htzl9k4Adje/T2
 eTcNMgb7XTifiRzcVPkEKhiWtRSHowhYdAeTrLRNDMX/cP+lvQjbqHdwSGmItZeLVxtMdj
 M4otkLKVJc/QfLYzlKrAsOijR5ifzos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-uFtxCuYyOzeXmhF4P2hggg-1; Fri, 09 Apr 2021 12:16:07 -0400
X-MC-Unique: uFtxCuYyOzeXmhF4P2hggg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA59987A826;
 Fri,  9 Apr 2021 16:16:06 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-63.ams2.redhat.com [10.36.115.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8CD65D6A1;
 Fri,  9 Apr 2021 16:16:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/10] mirror: Move open_backing_file to exit_common
Date: Fri,  9 Apr 2021 18:15:45 +0200
Message-Id: <20210409161548.341297-8-kwolf@redhat.com>
In-Reply-To: <20210409161548.341297-1-kwolf@redhat.com>
References: <20210409161548.341297-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

This is a graph change and therefore should be done in job-finalize
(which is what invokes mirror_exit_common()).

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210409120422.144040-2-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.30.2


