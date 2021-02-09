Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397B53156AD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:26:26 +0100 (CET)
Received: from localhost ([::1]:60260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YeX-0004qY-7l
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YKO-0003Vp-0r
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:05:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YKL-0002Gi-Lx
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:05:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+SJEeMxpjc2p11R+aC1gV3DJGZOs4v0Hd4xIFSvH90=;
 b=KzDswFKbr4/fB8X90dupDBGFLgatsDcHbo84b9jVV/3NbrOsl2KAYm9YXY3/nl0fR9igef
 LaGsNb9B7HQPQBBHSZbJSy0ovPmi1Jlh9MUBiXKNaDthrqrd39z/s9uDaTeN5AWKlsYRxg
 7ACxERbS/62Nqt3cBPdWnC2zlxPxJ40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-0mZGH2YzNQSJueyissahXg-1; Tue, 09 Feb 2021 14:05:30 -0500
X-MC-Unique: 0mZGH2YzNQSJueyissahXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72D59107ACC7
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:05:29 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96D0E60C04;
 Tue,  9 Feb 2021 19:05:16 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 14/24] DAX: virtiofsd: route se down to destroy method
Date: Tue,  9 Feb 2021 19:02:14 +0000
Message-Id: <20210209190224.62827-15-dgilbert@redhat.com>
In-Reply-To: <20210209190224.62827-1-dgilbert@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
---
 tools/virtiofsd/fuse_lowlevel.c  | 6 +++---
 tools/virtiofsd/fuse_lowlevel.h  | 2 +-
 tools/virtiofsd/passthrough_ll.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index f74583e095..99ba000c2e 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2212,7 +2212,7 @@ static void do_destroy(fuse_req_t req, fuse_ino_t nodeid,
     se->got_destroy = 1;
     se->got_init = 0;
     if (se->op.destroy) {
-        se->op.destroy(se->userdata);
+        se->op.destroy(se->userdata, se);
     }
 
     send_reply_ok(req, NULL, 0);
@@ -2439,7 +2439,7 @@ void fuse_session_process_buf_int(struct fuse_session *se,
             se->got_destroy = 1;
             se->got_init = 0;
             if (se->op.destroy) {
-                se->op.destroy(se->userdata);
+                se->op.destroy(se->userdata, se);
             }
         } else {
             goto reply_err;
@@ -2527,7 +2527,7 @@ void fuse_session_destroy(struct fuse_session *se)
 {
     if (se->got_init && !se->got_destroy) {
         if (se->op.destroy) {
-            se->op.destroy(se->userdata);
+            se->op.destroy(se->userdata, se);
         }
     }
     pthread_rwlock_destroy(&se->init_rwlock);
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
index 014564ff07..53439f5432 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -208,7 +208,7 @@ struct fuse_lowlevel_ops {
      *
      * @param userdata the user data passed to fuse_session_new()
      */
-    void (*destroy)(void *userdata);
+    void (*destroy)(void *userdata, struct fuse_session *se);
 
     /**
      * Look up a directory entry by name and get its attributes.
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 971ff2b2ea..badac23fef 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2943,7 +2943,7 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
     }
 }
 
-static void lo_destroy(void *userdata)
+static void lo_destroy(void *userdata, struct fuse_session *se)
 {
     struct lo_data *lo = (struct lo_data *)userdata;
 
-- 
2.29.2


