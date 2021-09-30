Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD5541DEB7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 18:18:06 +0200 (CEST)
Received: from localhost ([::1]:58104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyl4-0000MG-07
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 12:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy28-0005hi-AC
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy21-0002r3-ED
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633015891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wq085S62m4NMqg3+3BFaX2LXkZ67M8Cr6kIWLXEhzWU=;
 b=AhafCGXFqxJi+nKOIXaa8/wsoxTWd7CcY397aRkrxjEQbRbUaX9oxS0fE9xOQiUzXJ/oL8
 k5XSdnwae3YMvZj/X/drR7MIxKVr8w4ucCplHIKz1dmSdIM5KiVJXls6fKzSiNJIcOC21+
 5Vxyc9i2uV6qJlMTqVJRSNo1O5ZcxPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-H93OStsJOcSEjO-iM00emQ-1; Thu, 30 Sep 2021 11:31:29 -0400
X-MC-Unique: H93OStsJOcSEjO-iM00emQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E403D10168C0;
 Thu, 30 Sep 2021 15:31:28 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9582218B5E;
 Thu, 30 Sep 2021 15:30:56 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id E826B228286; Thu, 30 Sep 2021 11:30:47 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com,
	stefanha@redhat.com
Subject: [PATCH 07/13] virtiofsd: Release file locks using F_UNLCK
Date: Thu, 30 Sep 2021 11:30:31 -0400
Message-Id: <20210930153037.1194279-8-vgoyal@redhat.com>
In-Reply-To: <20210930153037.1194279-1-vgoyal@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
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
Cc: jaggel@bu.edu, iangelak@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are emulating posix locks for guest using open file description locks
in virtiofsd. When any of the fd is closed in guest, we find associated
OFD lock fd (if there is one) and close it to release all the locks.

Assumption here is that there is no other thread using lo_inode_plock
structure or plock->fd, hence it is safe to do so.

But now we are about to introduce blocking variant of locks (SETLKW),
and that means we might be waiting to a lock to be available and
using plock->fd. And that means there are still users of plock
structure.

So release locks using fcntl(SETLK, F_UNLCK) instead of closing fd
and plock will be freed later when lo_inode is being freed.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 38b2af8599..6928662e22 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1557,9 +1557,6 @@ static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64_t n)
         lo_map_remove(&lo->ino_map, inode->fuse_ino);
         g_hash_table_remove(lo->inodes, &inode->key);
         if (lo->posix_lock) {
-            if (g_hash_table_size(inode->posix_locks)) {
-                fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
-            }
             g_hash_table_destroy(inode->posix_locks);
             pthread_mutex_destroy(&inode->plock_mutex);
         }
@@ -2266,6 +2263,8 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
     (void)ino;
     struct lo_inode *inode;
     struct lo_data *lo = lo_data(req);
+    struct lo_inode_plock *plock;
+    struct flock flock;
 
     inode = lo_inode(req, ino);
     if (!inode) {
@@ -2282,8 +2281,22 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
     /* An fd is going away. Cleanup associated posix locks */
     if (lo->posix_lock) {
         pthread_mutex_lock(&inode->plock_mutex);
-        g_hash_table_remove(inode->posix_locks,
+        plock = g_hash_table_lookup(inode->posix_locks,
             GUINT_TO_POINTER(fi->lock_owner));
+
+        if (plock) {
+            /*
+             * An fd is being closed. For posix locks, this means
+             * drop all the associated locks.
+             */
+            memset(&flock, 0, sizeof(struct flock));
+            flock.l_type = F_UNLCK;
+            flock.l_whence = SEEK_SET;
+            /* Unlock whole file */
+            flock.l_start = flock.l_len = 0;
+            fcntl(plock->fd, F_OFD_SETLK, &flock);
+        }
+
         pthread_mutex_unlock(&inode->plock_mutex);
     }
     res = close(dup(lo_fi_fd(req, fi)));
-- 
2.31.1


