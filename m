Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D38F41DE6E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 18:08:53 +0200 (CEST)
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyc8-0004zf-7T
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 12:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy1Z-00051l-De
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy1W-0002TQ-JF
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633015860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jz7/5rO1+w0ACgMJO7jQO0M9S+IExx5M+xRBrOnfa5Q=;
 b=g4nkcyczBOcxUcjgnLRjmxFaw+z9hpG7CoerhGwTZMQDlXB86Fe4a7nkfIaXdk1XKtbZ+n
 KLE6kPAaxS9p+a4t+ylUTJ89/iT8rKbFQ8qhluokoXIB0jXhym7VOdPFLqvId5zh8ztYLV
 G8A2/xeSpTx9PWDDZKIHI3P4+CUy4U4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-W_R9ST7XNTq6F0IG91Zb6g-1; Thu, 30 Sep 2021 11:30:57 -0400
X-MC-Unique: W_R9ST7XNTq6F0IG91Zb6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37A2084A5E1;
 Thu, 30 Sep 2021 15:30:56 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0C9A1009962;
 Thu, 30 Sep 2021 15:30:48 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id DBF9E228284; Thu, 30 Sep 2021 11:30:47 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com,
	stefanha@redhat.com
Subject: [PATCH 05/13] virtiofsd: Add a helper to stop all queues
Date: Thu, 30 Sep 2021 11:30:29 -0400
Message-Id: <20210930153037.1194279-6-vgoyal@redhat.com>
In-Reply-To: <20210930153037.1194279-1-vgoyal@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
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
Cc: jaggel@bu.edu, iangelak@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a helper to stop all the queues. Later in the patch series I am
planning to use this helper at one more place later in the patch series.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
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


