Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5191C2549A8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 17:40:30 +0200 (CEST)
Received: from localhost ([::1]:52556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBK0r-0002ST-D8
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 11:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kBJxz-000747-1T
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 11:37:32 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56191
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kBJxx-000861-7J
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 11:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598542647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r91M8MQeCokQJV/nOclZ42P4cIc/WBl7/dpvzziqhmI=;
 b=Ii5Il3pfa8BQ6ZGg9cwoEHc9kh/JJ0LZ99nrHs8ioKPAEFnyvKKV9In4D8kxSnPNrbG8Dx
 sBQueq8ANpSyeFjcJSB543labcU764p0j89DmkHOHMPkDFYqVaQyHl0WtkFuJRw7eXSLB2
 uFzlFyb7LE8hwBqug6MU5b0VlP+fhV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-bY1zom5MOTCLGBKXlLztfA-1; Thu, 27 Aug 2020 11:37:25 -0400
X-MC-Unique: bY1zom5MOTCLGBKXlLztfA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE3C41DDFF
 for <qemu-devel@nongnu.org>; Thu, 27 Aug 2020 15:37:24 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-163.ams2.redhat.com
 [10.36.114.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CC885D9E8;
 Thu, 27 Aug 2020 15:37:18 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com
Subject: [PATCH v2 4/6] tools/virtiofsd: xattr name mappings: Map client xattr
 names
Date: Thu, 27 Aug 2020 16:36:55 +0100
Message-Id: <20200827153657.111098-5-dgilbert@redhat.com>
In-Reply-To: <20200827153657.111098-1-dgilbert@redhat.com>
References: <20200827153657.111098-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 00:53:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Map xattr names originating at the client; from get/set/remove xattr.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 102 ++++++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 00e96a10cd..9b9c8f3ab1 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2146,20 +2146,81 @@ static XattrMapEntry *parse_xattrmap(const char *map)
     return res;
 }
 
-static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
+/*
+ * For use with getxattr/setxattr/removexattr, where the client
+ * gives us a name and we may need to choose a different one.
+ * Allocates a buffer for the result placing it in *out_name.
+ *   If there's no change then *out_name is not set.
+ * Returns 0 on success
+ * Can return -EPERM to indicate we block a given attribute
+ *   (in which case out_name is not allocated)
+ * Can return -ENOMEM to indicate out_name couldn't be allocated.
+ */
+static int xattr_map_client(const char *client_name, char **out_name)
+{
+    const XattrMapEntry *cur_entry;
+
+    for (cur_entry = xattr_map_list; ; cur_entry++) {
+        if ((cur_entry->flags & XATTR_MAP_FLAG_CLIENT) &&
+            (!strncmp(cur_entry->key,
+                      client_name,
+                      strlen(cur_entry->key)))) {
+            if (cur_entry->flags & XATTR_MAP_FLAG_END_BAD) {
+                return -EPERM;
+            }
+            if (cur_entry->flags & XATTR_MAP_FLAG_END_OK) {
+                /* Unmodified name */
+                return 0;
+            }
+            if (cur_entry->flags & XATTR_MAP_FLAG_PREFIX) {
+                *out_name = g_try_malloc(strlen(client_name) +
+                                         strlen(cur_entry->prepend) + 1);
+                if (!*out_name) {
+                    return -ENOMEM;
+                }
+                sprintf(*out_name, "%s%s", cur_entry->prepend, client_name);
+                return 0;
+            }
+        }
+    }
+
+    /* Shouldn't get here - rules should have an END_* */
+    abort();
+}
+
+static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
                         size_t size)
 {
     struct lo_data *lo = lo_data(req);
     char *value = NULL;
     char procname[64];
+    const char *name;
+    char *mapped_name;
     struct lo_inode *inode;
     ssize_t ret;
     int saverr;
     int fd = -1;
 
+    mapped_name = NULL;
+    name = in_name;
+    if (lo->xattrmap) {
+        ret = xattr_map_client(in_name, &mapped_name);
+        if (ret < 0) {
+            if (ret == -EPERM) {
+                ret = -ENODATA;
+            }
+            fuse_reply_err(req, -ret);
+            return;
+        }
+        if (mapped_name) {
+            name = mapped_name;
+        }
+    }
+
     inode = lo_inode(req, ino);
     if (!inode) {
         fuse_reply_err(req, EBADF);
+        g_free(mapped_name);
         return;
     }
 
@@ -2224,6 +2285,7 @@ out_err:
     saverr = errno;
 out:
     fuse_reply_err(req, saverr);
+    g_free(mapped_name);
     goto out_free;
 }
 
@@ -2301,19 +2363,35 @@ out:
     goto out_free;
 }
 
-static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
+static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
                         const char *value, size_t size, int flags)
 {
     char procname[64];
+    const char *name;
+    char *mapped_name;
     struct lo_data *lo = lo_data(req);
     struct lo_inode *inode;
     ssize_t ret;
     int saverr;
     int fd = -1;
 
+    mapped_name = NULL;
+    name = in_name;
+    if (lo->xattrmap) {
+        ret = xattr_map_client(in_name, &mapped_name);
+        if (ret < 0) {
+            fuse_reply_err(req, -ret);
+            return;
+        }
+        if (mapped_name) {
+            name = mapped_name;
+        }
+    }
+
     inode = lo_inode(req, ino);
     if (!inode) {
         fuse_reply_err(req, EBADF);
+        g_free(mapped_name);
         return;
     }
 
@@ -2348,21 +2426,38 @@ out:
     }
 
     lo_inode_put(lo, &inode);
+    g_free(mapped_name);
     fuse_reply_err(req, saverr);
 }
 
-static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *name)
+static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
 {
     char procname[64];
+    const char *name;
+    char *mapped_name;
     struct lo_data *lo = lo_data(req);
     struct lo_inode *inode;
     ssize_t ret;
     int saverr;
     int fd = -1;
 
+    mapped_name = NULL;
+    name = in_name;
+    if (lo->xattrmap) {
+        ret = xattr_map_client(in_name, &mapped_name);
+        if (ret < 0) {
+            fuse_reply_err(req, -ret);
+            return;
+        }
+        if (mapped_name) {
+            name = mapped_name;
+        }
+    }
+
     inode = lo_inode(req, ino);
     if (!inode) {
         fuse_reply_err(req, EBADF);
+        g_free(mapped_name);
         return;
     }
 
@@ -2397,6 +2492,7 @@ out:
     }
 
     lo_inode_put(lo, &inode);
+    g_free(mapped_name);
     fuse_reply_err(req, saverr);
 }
 
-- 
2.26.2


