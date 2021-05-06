Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F564375B8E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:16:59 +0200 (CEST)
Received: from localhost ([::1]:36156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejUY-0004lI-G0
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBk-0005el-FN
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBg-0005jM-HW
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620327448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U1TqnW9qhqvRJZCjkpE7YovoNzaXyhAOm0LC7exPfBs=;
 b=KZfsu6k94s3MuJrkpvJ5pm4it53ty338sssdPa3BJ2sbJMlI247OYoSyMO6VbS39HSPHNA
 ngBe2Kz5cJoyVnMJYHh8RfbOwpd+yMPPYtUlRa3vrTpOJGETPRdAE4tE/OUdJzPpUQUKSO
 m33JE6C2tuuFENM3QDuu9wTOnMEygzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-ZE59deplMKiPQiZIIcB9-A-1; Thu, 06 May 2021 14:57:24 -0400
X-MC-Unique: ZE59deplMKiPQiZIIcB9-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC0231020C30;
 Thu,  6 May 2021 18:57:22 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-37.ams2.redhat.com
 [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64B1819C46;
 Thu,  6 May 2021 18:57:21 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, jose.carlos.venegas.munoz@intel.com,
 ma.mandourr@gmail.com
Subject: [PULL 12/12] virtiofsd/fuse_virtio.c: Changed allocations of locals
 to GLib
Date: Thu,  6 May 2021 19:56:41 +0100
Message-Id: <20210506185641.284821-13-dgilbert@redhat.com>
In-Reply-To: <20210506185641.284821-1-dgilbert@redhat.com>
References: <20210506185641.284821-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: virtio-fs@redhat.com, vgoyal@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Replaced the allocation of local variables from malloc() to
GLib allocation functions.

In one instance, dropped the usage to an assert after a malloc()
call and used g_malloc() instead.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210420154643.58439-8-ma.mandourr@gmail.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 828f0fa590..1170f375a5 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -511,8 +511,7 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
      * They're spread over multiple descriptors in a scatter/gather set
      * and we can't trust the guest to keep them still; so copy in/out.
      */
-    fbuf.mem = malloc(se->bufsize);
-    assert(fbuf.mem);
+    fbuf.mem = g_malloc(se->bufsize);
 
     fuse_mutex_init(&req->ch.lock);
     req->ch.fd = -1;
@@ -564,8 +563,8 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
         memcpy(fbuf.mem, &inh, sizeof(struct fuse_in_header));
 
         /* Allocate the bufv, with space for the rest of the iov */
-        pbufv = malloc(sizeof(struct fuse_bufvec) +
-                       sizeof(struct fuse_buf) * out_num);
+        pbufv = g_try_malloc(sizeof(struct fuse_bufvec) +
+                             sizeof(struct fuse_buf) * out_num);
         if (!pbufv) {
             fuse_log(FUSE_LOG_ERR, "%s: pbufv malloc failed\n",
                     __func__);
@@ -622,7 +621,7 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
 
 out:
     if (allocated_bufv) {
-        free(pbufv);
+        g_free(pbufv);
     }
 
     /* If the request has no reply, still recycle the virtqueue element */
@@ -641,7 +640,7 @@ out:
     }
 
     pthread_mutex_destroy(&req->ch.lock);
-    free(fbuf.mem);
+    g_free(fbuf.mem);
     free(req);
 }
 
-- 
2.31.1


