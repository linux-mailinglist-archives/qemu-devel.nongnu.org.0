Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AA135F8BD
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:17:56 +0200 (CEST)
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWiDD-00070V-L2
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoX-0008Rv-TQ
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoM-0000S4-VF
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618415534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLCe7zElonqvzVcREmEBErd5AF37DAj/AzVQhCSJwEE=;
 b=Ss+QWMj9/rQgSnssRqv5i9+nprocSX9G0sJyIZ6VkUQrun1f0vVaDAo+psHG26Ub8u/bUO
 a63Lg9B7ZkivfMGS4u+VON9AQhzmTZ2zKjnwQRKhTmip6FUBtsmUZim2J8G/FF6cwK6dV4
 S+j6dKys7VcytkBj372kWkxVbEO+x1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-0YfdOz-FOoaD4n3MJUx_8w-1; Wed, 14 Apr 2021 11:51:58 -0400
X-MC-Unique: 0YfdOz-FOoaD4n3MJUx_8w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2BB81B2C996
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 15:51:57 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-158.ams2.redhat.com
 [10.36.115.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6346610A8;
 Wed, 14 Apr 2021 15:51:56 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 virtio-fs@redhat.com
Subject: [PATCH v2 11/25] DAX: virtiofsd: Add setup/remove mappings fuse
 commands
Date: Wed, 14 Apr 2021 16:51:23 +0100
Message-Id: <20210414155137.46522-12-dgilbert@redhat.com>
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

Add commands so that the guest kernel can ask the daemon to map file
sections into a guest kernel visible cache.

Note: Catherine Ho had sent a patch to fix an issue with multiple
removemapping. It was a merge issue though.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Signed-off-by: Peng Tao <tao.peng@linux.alibaba.com>
Including-fixes: Catherine Ho <catherine.hecx@gmail.com>
Signed-off-by: Catherine Ho <catherine.hecx@gmail.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 69 +++++++++++++++++++++++++++++++++
 tools/virtiofsd/fuse_lowlevel.h | 23 ++++++++++-
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 58e32fc963..1a00307879 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1870,6 +1870,73 @@ static void do_lseek(fuse_req_t req, fuse_ino_t nodeid,
     }
 }
 
+static void do_setupmapping(fuse_req_t req, fuse_ino_t nodeid,
+                            struct fuse_mbuf_iter *iter)
+{
+    struct fuse_setupmapping_in *arg;
+    struct fuse_file_info fi;
+
+    arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
+    if (!arg) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
+    memset(&fi, 0, sizeof(fi));
+    fi.fh = arg->fh;
+
+    /*
+     *  TODO: Need to come up with a better definition of flags here; it can't
+     * be the kernel view of the flags, since that's abstracted from the client
+     * similarly, it's not the vhost-user set
+     * for now just use O_ flags
+     */
+    uint64_t genflags;
+
+    genflags = O_RDONLY;
+    if (arg->flags & FUSE_SETUPMAPPING_FLAG_WRITE) {
+        genflags = O_RDWR;
+    }
+
+    if (req->se->op.setupmapping) {
+        req->se->op.setupmapping(req, nodeid, arg->foffset, arg->len,
+                                 arg->moffset, genflags, &fi);
+    } else {
+        fuse_reply_err(req, ENOSYS);
+    }
+}
+
+static void do_removemapping(fuse_req_t req, fuse_ino_t nodeid,
+                             struct fuse_mbuf_iter *iter)
+{
+    struct fuse_removemapping_in *arg;
+    struct fuse_removemapping_one *one;
+
+    arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
+    if (!arg || !arg->count ||
+        (uint64_t)arg->count * sizeof(*one) >= SIZE_MAX) {
+        fuse_log(FUSE_LOG_ERR, "do_removemapping: invalid arg %p\n", arg);
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
+    one = fuse_mbuf_iter_advance(iter, arg->count * sizeof(*one));
+    if (!one) {
+        fuse_log(
+            FUSE_LOG_ERR,
+            "do_removemapping: invalid in, expected %d * %ld, has %ld - %ld\n",
+            arg->count, sizeof(*one), iter->size, iter->pos);
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
+    if (req->se->op.removemapping) {
+        req->se->op.removemapping(req, req->se, nodeid, arg->count, one);
+    } else {
+        fuse_reply_err(req, ENOSYS);
+    }
+}
+
 static void do_init(fuse_req_t req, fuse_ino_t nodeid,
                     struct fuse_mbuf_iter *iter)
 {
@@ -2267,6 +2334,8 @@ static struct {
     [FUSE_RENAME2] = { do_rename2, "RENAME2" },
     [FUSE_COPY_FILE_RANGE] = { do_copy_file_range, "COPY_FILE_RANGE" },
     [FUSE_LSEEK] = { do_lseek, "LSEEK" },
+    [FUSE_SETUPMAPPING] = { do_setupmapping, "SETUPMAPPING" },
+    [FUSE_REMOVEMAPPING] = { do_removemapping, "REMOVEMAPPING" },
 };
 
 #define FUSE_MAXOP (sizeof(fuse_ll_ops) / sizeof(fuse_ll_ops[0]))
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
index 3383e3a8a0..0bf206264d 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -24,6 +24,7 @@
 #endif
 
 #include "fuse_common.h"
+#include "standard-headers/linux/fuse.h"
 
 #include <sys/statvfs.h>
 #include <sys/uio.h>
@@ -1171,7 +1172,6 @@ struct fuse_lowlevel_ops {
      */
     void (*readdirplus)(fuse_req_t req, fuse_ino_t ino, size_t size, off_t off,
                         struct fuse_file_info *fi);
-
     /**
      * Copy a range of data from one file to another
      *
@@ -1227,6 +1227,27 @@ struct fuse_lowlevel_ops {
      */
     void (*lseek)(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
                   struct fuse_file_info *fi);
+
+    /*
+     * Map file sections into kernel visible cache
+     *
+     * Map a section of the file into address space visible to the kernel
+     * mounting the filesystem.
+     * TODO
+     */
+    void (*setupmapping)(fuse_req_t req, fuse_ino_t ino, uint64_t foffset,
+                         uint64_t len, uint64_t moffset, uint64_t flags,
+                         struct fuse_file_info *fi);
+
+    /*
+     * Unmap file sections in kernel visible cache
+     *
+     * Unmap sections previously mapped by setupmapping
+     * TODO
+     */
+    void (*removemapping)(fuse_req_t req, struct fuse_session *se,
+                          fuse_ino_t ino, unsigned num,
+                          struct fuse_removemapping_one *argp);
 };
 
 /**
-- 
2.31.1


