Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D56943B077
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:47:58 +0200 (CEST)
Received: from localhost ([::1]:36312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJzo-00012K-Av
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfJiL-0003Hu-76
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfJiJ-0004ih-9X
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635244190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wb973N1jXsbs8jZ8BWgm+2lUXQuwFwwEn8RBnfJC+nU=;
 b=PNj76JfNuApQJ7nj4Kl0ikaEjTbEni9bYz30svsNlRP4mRYqPyUHgXcLaf19/FLGHB+G6G
 K6LEFtMbYzBDBcoSBdFQJkvdm7MLObM50xHVW/HHt/9bAUNRfLRZOsp3t3NSyVgkCtrmcK
 Y3s5CrQ9Pzn6Vj0IsFKmXA2i5eTohmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-QDP6wDUSOq2zP33pN-v5xA-1; Tue, 26 Oct 2021 06:29:49 -0400
X-MC-Unique: QDP6wDUSOq2zP33pN-v5xA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60F37A40FF
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 10:29:43 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE51C100E125;
 Tue, 26 Oct 2021 10:29:42 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] virtiofsd: Add a helper to stop all queues
Date: Tue, 26 Oct 2021 11:29:32 +0100
Message-Id: <20211026102933.103139-5-dgilbert@redhat.com>
In-Reply-To: <20211026102933.103139-1-dgilbert@redhat.com>
References: <20211026102933.103139-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

Use a helper to stop all the queues. Later in the patch series I am
planning to use this helper at one more place later in the patch series.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20210930153037.1194279-6-vgoyal@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index fcf12db9cd..baead08b28 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -740,6 +740,18 @@ static void fv_queue_cleanup_thread(struct fv_VuDev *vud, int qidx)
     vud->qi[qidx] = NULL;
 }
 
+static void stop_all_queues(struct fv_VuDev *vud)
+{
+    for (int i = 0; i < vud->nqueues; i++) {
+        if (!vud->qi[i]) {
+            continue;
+        }
+
+        fuse_log(FUSE_LOG_INFO, "%s: Stopping queue %d thread\n", __func__, i);
+        fv_queue_cleanup_thread(vud, i);
+    }
+}
+
 /* Callback from libvhost-user on start or stop of a queue */
 static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
 {
@@ -870,15 +882,7 @@ int virtio_loop(struct fuse_session *se)
      * Make sure all fv_queue_thread()s quit on exit, as we're about to
      * free virtio dev and fuse session, no one should access them anymore.
      */
-    for (int i = 0; i < se->virtio_dev->nqueues; i++) {
-        if (!se->virtio_dev->qi[i]) {
-            continue;
-        }
-
-        fuse_log(FUSE_LOG_INFO, "%s: Stopping queue %d thread\n", __func__, i);
-        fv_queue_cleanup_thread(se->virtio_dev, i);
-    }
-
+    stop_all_queues(se->virtio_dev);
     fuse_log(FUSE_LOG_INFO, "%s: Exit\n", __func__);
 
     return 0;
-- 
2.31.1


