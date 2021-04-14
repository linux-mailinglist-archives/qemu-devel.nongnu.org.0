Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8813835F8BA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:14:51 +0200 (CEST)
Received: from localhost ([::1]:46040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWiAE-0003AH-Ja
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoM-0008L0-8B
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoH-0000QC-6d
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618415528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLfLGpFZ25PJmrB9aBrS+7Vv4QeU27B+es/osFulx0o=;
 b=MlRHLE48kW5Oc/bkJBPNbroCzru7C18cfvktfom0St89bPhb48iyXXT6DSLIVj0wotvTxd
 snFmIOwV7DBBQ20SGvK1UogHesbFnGwiTIFwH40ZbrvuFT47Hy8BJZLi9g9zTUfWv64G2C
 CdKUEYGVhK9l+1KPKv/s1pJjmW2HAg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-zNDGLiqOOwK4vmznNA36zw-1; Wed, 14 Apr 2021 11:52:06 -0400
X-MC-Unique: zNDGLiqOOwK4vmznNA36zw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73F7484B9C7
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 15:52:05 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-158.ams2.redhat.com
 [10.36.115.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60BCF190F0;
 Wed, 14 Apr 2021 15:52:04 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 virtio-fs@redhat.com
Subject: [PATCH v2 15/25] DAX: virtiofsd: route se down to destroy method
Date: Wed, 14 Apr 2021 16:51:27 +0100
Message-Id: <20210414155137.46522-16-dgilbert@redhat.com>
In-Reply-To: <20210414155137.46522-1-dgilbert@redhat.com>
References: <20210414155137.46522-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

We're going to need to pass the session down to destroy so that it can
pass it back to do the remove mapping.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c  | 6 +++---
 tools/virtiofsd/fuse_lowlevel.h  | 2 +-
 tools/virtiofsd/passthrough_ll.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 81c4c2b373..e82edce72a 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2222,7 +2222,7 @@ static void do_destroy(fuse_req_t req, fuse_ino_t nodeid,
     se->got_destroy = 1;
     se->got_init = 0;
     if (se->op.destroy) {
-        se->op.destroy(se->userdata);
+        se->op.destroy(se->userdata, se);
     }
 
     send_reply_ok(req, NULL, 0);
@@ -2449,7 +2449,7 @@ void fuse_session_process_buf_int(struct fuse_session *se,
             se->got_destroy = 1;
             se->got_init = 0;
             if (se->op.destroy) {
-                se->op.destroy(se->userdata);
+                se->op.destroy(se->userdata, se);
             }
         } else {
             goto reply_err;
@@ -2538,7 +2538,7 @@ void fuse_session_destroy(struct fuse_session *se)
 {
     if (se->got_init && !se->got_destroy) {
         if (se->op.destroy) {
-            se->op.destroy(se->userdata);
+            se->op.destroy(se->userdata, se);
         }
     }
     pthread_rwlock_destroy(&se->init_rwlock);
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
index 0bf206264d..27b07bfc22 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -209,7 +209,7 @@ struct fuse_lowlevel_ops {
      *
      * @param userdata the user data passed to fuse_session_new()
      */
-    void (*destroy)(void *userdata);
+    void (*destroy)(void *userdata, struct fuse_session *se);
 
     /**
      * Look up a directory entry by name and get its attributes.
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index a9f0505414..910c4831fb 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3124,7 +3124,7 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
     }
 }
 
-static void lo_destroy(void *userdata)
+static void lo_destroy(void *userdata, struct fuse_session *se)
 {
     struct lo_data *lo = (struct lo_data *)userdata;
 
-- 
2.31.1


