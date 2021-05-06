Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AFE375B5D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:04:25 +0200 (CEST)
Received: from localhost ([::1]:38984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejIO-0002C3-3f
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBQ-0005Sp-L8
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBP-0005cZ-2c
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620327430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n0tC4vdKa3DPrj/EAVu/hOK8frlOOdxg8VTtxE+z78M=;
 b=HteYYRp6YTmLN/K3ExsIdPDWU1FXFyWlfX5S38Vmg9ZBVNY87i6+VJvmUC/5bWZNacDRMB
 kTlLd67NznyFD6iLRATC2627J4DOIvjyYjlD+cmmHLO2hs0VuUYxjQ2iqKV5RnVq+KLbjj
 5VRqpINbQ7WdFgcjDPXyb7BjS/MNq9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-G7AE43uCObGH32VxmVR-wQ-1; Thu, 06 May 2021 14:57:06 -0400
X-MC-Unique: G7AE43uCObGH32VxmVR-wQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBDE11922960;
 Thu,  6 May 2021 18:57:04 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-37.ams2.redhat.com
 [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4175819C46;
 Thu,  6 May 2021 18:57:03 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, jose.carlos.venegas.munoz@intel.com,
 ma.mandourr@gmail.com
Subject: [PULL 06/12] virtiofsd: Changed allocations of fuse_req to GLib
 functions
Date: Thu,  6 May 2021 19:56:35 +0100
Message-Id: <20210506185641.284821-7-dgilbert@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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

Replaced the allocation and deallocation of fuse_req structs
using calloc()/free() call pairs to a GLib's g_try_new0()
and g_free().

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210420154643.58439-2-ma.mandourr@gmail.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 58e32fc963..812cef6ef6 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -106,7 +106,7 @@ static void list_add_req(struct fuse_req *req, struct fuse_req *next)
 static void destroy_req(fuse_req_t req)
 {
     pthread_mutex_destroy(&req->lock);
-    free(req);
+    g_free(req);
 }
 
 void fuse_free_req(fuse_req_t req)
@@ -130,7 +130,7 @@ static struct fuse_req *fuse_ll_alloc_req(struct fuse_session *se)
 {
     struct fuse_req *req;
 
-    req = (struct fuse_req *)calloc(1, sizeof(struct fuse_req));
+    req = g_try_new0(struct fuse_req, 1);
     if (req == NULL) {
         fuse_log(FUSE_LOG_ERR, "fuse: failed to allocate request\n");
     } else {
@@ -1684,7 +1684,7 @@ static struct fuse_req *check_interrupt(struct fuse_session *se,
         if (curr->u.i.unique == req->unique) {
             req->interrupted = 1;
             list_del_req(curr);
-            free(curr);
+            g_free(curr);
             return NULL;
         }
     }
-- 
2.31.1


