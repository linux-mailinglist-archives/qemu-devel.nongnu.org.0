Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F96B30FC44
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:12:00 +0100 (CET)
Received: from localhost ([::1]:37604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7k2p-0005Et-8Z
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7jTm-0002br-G3
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:35:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7jTZ-0004Vi-Bx
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612463729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iyZSoVD/PK1v2AgTUerEGLiNIWbX3CD0IF78yPdqESg=;
 b=ZOiHEuCx93PBswgWc928ct0D1vS7e+FlVoo9aM0tB+nbpvnHRw/ubZGNLPRy1Po9SZxdf8
 76iv/Gk61bEzyHGgP3j4Q1I6y02nVwhZJNfih48k7cmbS4UcNeaj2Vrf3Cdej1sqqXqoIK
 K3WOBI8w92hJ/JMDEo/FYJh/gCQYcQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-FNaItIcrPuKQF9WWIv7x4Q-1; Thu, 04 Feb 2021 13:35:25 -0500
X-MC-Unique: FNaItIcrPuKQF9WWIv7x4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A58A68799E0;
 Thu,  4 Feb 2021 18:35:24 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-21.ams2.redhat.com
 [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D49E5B4B5;
 Thu,  4 Feb 2021 18:35:15 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, virtio-fs@redhat.com, stefanha@redhat.com,
 groug@kaod.org, qemu-stable@nongnu.org
Subject: [PULL 2/5] virtiofsd: optionally return inode pointer from
 lo_do_lookup()
Date: Thu,  4 Feb 2021 18:34:36 +0000
Message-Id: <20210204183439.546918-3-dgilbert@redhat.com>
In-Reply-To: <20210204183439.546918-1-dgilbert@redhat.com>
References: <20210204183439.546918-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Stefan Hajnoczi <stefanha@redhat.com>

lo_do_lookup() finds an existing inode or allocates a new one. It
increments nlookup so that the inode stays alive until the client
releases it.

Existing callers don't need the struct lo_inode so the function doesn't
return it. Extend the function to optionally return the inode. The next
commit will need it.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210204150208.367837-3-stefanha@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index f14fa5124d..aa35fc6ba5 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -831,11 +831,13 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
 }
 
 /*
- * Increments nlookup and caller must release refcount using
- * lo_inode_put(&parent).
+ * Increments nlookup on the inode on success. unref_inode_lolocked() must be
+ * called eventually to decrement nlookup again. If inodep is non-NULL, the
+ * inode pointer is stored and the caller must call lo_inode_put().
  */
 static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
-                        struct fuse_entry_param *e)
+                        struct fuse_entry_param *e,
+                        struct lo_inode **inodep)
 {
     int newfd;
     int res;
@@ -845,6 +847,10 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
     struct lo_inode *inode = NULL;
     struct lo_inode *dir = lo_inode(req, parent);
 
+    if (inodep) {
+        *inodep = NULL;
+    }
+
     /*
      * name_to_handle_at() and open_by_handle_at() can reach here with fuse
      * mount point in guest, but we don't have its inode info in the
@@ -913,7 +919,14 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
         pthread_mutex_unlock(&lo->mutex);
     }
     e->ino = inode->fuse_ino;
-    lo_inode_put(lo, &inode);
+
+    /* Transfer ownership of inode pointer to caller or drop it */
+    if (inodep) {
+        *inodep = inode;
+    } else {
+        lo_inode_put(lo, &inode);
+    }
+
     lo_inode_put(lo, &dir);
 
     fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli\n", (unsigned long long)parent,
@@ -948,7 +961,7 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
         return;
     }
 
-    err = lo_do_lookup(req, parent, name, &e);
+    err = lo_do_lookup(req, parent, name, &e, NULL);
     if (err) {
         fuse_reply_err(req, err);
     } else {
@@ -1056,7 +1069,7 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
         goto out;
     }
 
-    saverr = lo_do_lookup(req, parent, name, &e);
+    saverr = lo_do_lookup(req, parent, name, &e, NULL);
     if (saverr) {
         goto out;
     }
@@ -1534,7 +1547,7 @@ static void lo_do_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
 
         if (plus) {
             if (!is_dot_or_dotdot(name)) {
-                err = lo_do_lookup(req, ino, name, &e);
+                err = lo_do_lookup(req, ino, name, &e, NULL);
                 if (err) {
                     goto error;
                 }
@@ -1732,7 +1745,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
         }
 
         fi->fh = fh;
-        err = lo_do_lookup(req, parent, name, &e);
+        err = lo_do_lookup(req, parent, name, &e, NULL);
     }
     if (lo->cache == CACHE_NONE) {
         fi->direct_io = 1;
-- 
2.29.2


