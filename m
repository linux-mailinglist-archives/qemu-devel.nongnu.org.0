Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FEC3A2E1E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:27:13 +0200 (CEST)
Received: from localhost ([::1]:60052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLeK-0003Jx-OP
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1lrLdS-0002SU-EG
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:26:18 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1lrLdM-0004nQ-6d
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:26:14 -0400
Received: by mail-pl1-x62b.google.com with SMTP id v12so1101962plo.10
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=di2Bc1dMXaIWwytWrNJ6VH6k4Sm+c/u0WhK1IYB5KBI=;
 b=g/b4dJnjmu45IB3EwVUgsTx/PEueA4JduRxDAXsPu2qYNwY9gc4AGIxGobiZJXtw9y
 oNd3ZKKNhsW5ZVFqUGShGgisUrxVL25jWSFQMHq0UFaF0IQonpaW8iNqnKcO/EqhWPFa
 2y/RJPMDU1uHUpL6hoF0pDqIqtAa6xvfkJ/WxNOVcQaTx3qoi6AeJAAOUYJncyw+hRRC
 MFWZ1auGOumdbiCAzx2/8g1TdzYeg3sLCxnX2E9iPLVWMXg7iAQ26bP0WX9/RVsYzx08
 02x0e6Ixr+/jH0KnDQGq25MwTI6IgCglyWMD/obf+Ze3ov/5yAitQCV9b9wKVMhoO7J2
 OxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=di2Bc1dMXaIWwytWrNJ6VH6k4Sm+c/u0WhK1IYB5KBI=;
 b=BwYETrFKMitcf2GfKMkg/RW2wvUgpkFCRLUYIlL8br7I6VhbQkh+SUQu/bk3YsWo6i
 RRdwIPnkIv7MqHWJRXmW9iuOJZoPastaQMVFgzYdLorYR5LanXviPqeHECeLJtev1DkZ
 6uFRrS6SyqVA4jTDEwN03zj81jQczYsFbiILN9b4ysRDSKBmjhL3tkGBbImdP9CpsE8Q
 abwXrm5h/mQgIywxi/2hPWWFTqehuvH4llfKsZKCAI5n4iEwlvRQRCiMfmTL6ncGkewM
 CZqroT7+k51TsitHofE7CMlXG27KcPaj486HDdb5pvrkpi12zkrPnEL5dvfmoU+Qs/8+
 qaWQ==
X-Gm-Message-State: AOAM533foMTaJBd8wFQ9C6uV7k3kMrjBSkjtQa4eIycWpErq7+MxCE/H
 bC9Bjq/MVzBMrgzb9IrBC6DB3g==
X-Google-Smtp-Source: ABdhPJyOWtgXq5XnNrKZ+Tz+XCle8Tpw/23H4todCSYF0Y4gakhIF99hK3LNrVoBWUZ2e2MMXzPMSQ==
X-Received: by 2002:a17:90b:1d89:: with SMTP id
 pf9mr3595364pjb.26.1623335168962; 
 Thu, 10 Jun 2021 07:26:08 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.229])
 by smtp.gmail.com with ESMTPSA id b14sm2903322pgl.52.2021.06.10.07.26.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:26:08 -0700 (PDT)
From: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, virtio-fs@redhat.com
Subject: [PATCH] virtiofsd: Avoid increasing nlookup when calling lookup_name
Date: Thu, 10 Jun 2021 22:25:49 +0800
Message-Id: <20210610142549.33220-1-zhangjiachen.jaycee@bytedance.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=zhangjiachen.jaycee@bytedance.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 9257e514d861afa7 introduced lookup_name(), which will calls
lo_find(), to increase the refcount of the inodes used in lo_rename,
lo_rmdir, and lo_unlink.

However, as lo_find() increases both refcount and nlookup, and the
three functions do not need to increase nlookup, unref_inode_lolocked()
is called later in the three function to decrease nlookup by one.

This commit adds a increase_nlookup flag to lo_find(), it is set to
false when called from lookup_name(). This way we can make the behavior
more clear, and also makes it easier to maintain nlookup crash consistency
if we are introducing crash recovery feature in the future.

Signed-off-by: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
---
 tools/virtiofsd/passthrough_ll.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 49c21fd855..3e7c2f6b9d 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -219,7 +219,7 @@ static struct {
 static __thread bool cap_loaded = 0;
 
 static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
-                                uint64_t mnt_id);
+                                uint64_t mnt_id, bool increase_nlookup);
 static int xattr_map_client(const struct lo_data *lo, const char *client_name,
                             char **out_name);
 
@@ -880,7 +880,7 @@ out_err:
 }
 
 static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
-                                uint64_t mnt_id)
+                                uint64_t mnt_id, bool increase_nlookup)
 {
     struct lo_inode *p;
     struct lo_key key = {
@@ -893,7 +893,9 @@ static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
     p = g_hash_table_lookup(lo->inodes, &key);
     if (p) {
         assert(p->nlookup > 0);
-        p->nlookup++;
+        if (increase_nlookup) {
+            p->nlookup++;
+        }
         g_atomic_int_inc(&p->refcount);
     }
     pthread_mutex_unlock(&lo->mutex);
@@ -1023,7 +1025,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
         e->attr_flags |= FUSE_ATTR_SUBMOUNT;
     }
 
-    inode = lo_find(lo, &e->attr, mnt_id);
+    inode = lo_find(lo, &e->attr, mnt_id, true);
     if (inode) {
         close(newfd);
     } else {
@@ -1316,7 +1318,7 @@ out_err:
     fuse_reply_err(req, saverr);
 }
 
-/* Increments nlookup and caller must release refcount using lo_inode_put() */
+/* Caller must release refcount using lo_inode_put() */
 static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
                                     const char *name)
 {
@@ -1336,7 +1338,7 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
         return NULL;
     }
 
-    return lo_find(lo, &attr, mnt_id);
+    return lo_find(lo, &attr, mnt_id, false);
 }
 
 static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
@@ -1364,7 +1366,6 @@ static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
     res = unlinkat(lo_fd(req, parent), name, AT_REMOVEDIR);
 
     fuse_reply_err(req, res == -1 ? errno : 0);
-    unref_inode_lolocked(lo, inode, 1);
     lo_inode_put(lo, &inode);
 }
 
@@ -1423,8 +1424,6 @@ static void lo_rename(fuse_req_t req, fuse_ino_t parent, const char *name,
 
     fuse_reply_err(req, res == -1 ? errno : 0);
 out:
-    unref_inode_lolocked(lo, oldinode, 1);
-    unref_inode_lolocked(lo, newinode, 1);
     lo_inode_put(lo, &oldinode);
     lo_inode_put(lo, &newinode);
     lo_inode_put(lo, &parent_inode);
@@ -1456,7 +1455,6 @@ static void lo_unlink(fuse_req_t req, fuse_ino_t parent, const char *name)
     res = unlinkat(lo_fd(req, parent), name, 0);
 
     fuse_reply_err(req, res == -1 ? errno : 0);
-    unref_inode_lolocked(lo, inode, 1);
     lo_inode_put(lo, &inode);
 }
 
-- 
2.20.1


