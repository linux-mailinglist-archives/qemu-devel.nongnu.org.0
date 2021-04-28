Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D09136D658
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:18:02 +0200 (CEST)
Received: from localhost ([::1]:41694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbiCf-00066K-Ci
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxE-0006Yk-1q
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxB-00058b-Up
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q2Vk+vYjoPUwEjczXbHBqWhW1P4vBfgG67zG5r6NXp4=;
 b=aYbLVJRzFrJDCZLS8u8IkHCK/7+qz+wXySJmg53da4XXkWgqDBUJMQj6a3noU3Dt57nUH8
 HwIZfsOIzxXPrW9mikM5Tx6loOu7PbZiGKe1t3K3fDiXWXzJvDgsF64xDFPcyv1WW14nea
 Rp7XDYEcShbibxnoVjYtXx25PPdhyX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-sZThtB4xOIqXkxoRxzIUtA-1; Wed, 28 Apr 2021 07:01:59 -0400
X-MC-Unique: sZThtB4xOIqXkxoRxzIUtA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04B83501EA;
 Wed, 28 Apr 2021 11:01:58 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6E37101F501;
 Wed, 28 Apr 2021 11:01:56 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: [PATCH v3 16/26] DAX: virtiofsd: route se down to destroy method
Date: Wed, 28 Apr 2021 12:00:50 +0100
Message-Id: <20210428110100.27757-17-dgilbert@redhat.com>
In-Reply-To: <20210428110100.27757-1-dgilbert@redhat.com>
References: <20210428110100.27757-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: virtio-fs@redhat.com
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
index 4921f1bbb7..6930574aaf 100644
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
index 1a86378172..ed5b6c9e2d 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3125,7 +3125,7 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
     }
 }
 
-static void lo_destroy(void *userdata)
+static void lo_destroy(void *userdata, struct fuse_session *se)
 {
     struct lo_data *lo = (struct lo_data *)userdata;
 
-- 
2.31.1


