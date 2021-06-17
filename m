Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8909E3ABB41
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 20:17:03 +0200 (CEST)
Received: from localhost ([::1]:34258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwZa-0004m2-J8
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 14:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1ltwVO-0006SL-Pq
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:12:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1ltwVK-0001sd-LF
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:12:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623953557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IjN7S5ENaUBKxQgN3gDeBYZ5O69QJTHRIzmYOfJiVig=;
 b=XQhStO0u6Uxqq2cjWQHAIFghSvKtO3k7ABQnD8hlbXcnQx4+9XumhrNAeraPyZH2DrKZCx
 71iJJxq5ooCuKt0D7hQ22fv9KTdAgbYG/pzQzKyC3Je4nNZorxILL/a+szC+Kmo2aSiHGv
 J4umGssg5SZVLtwO+C77RtOg9ohkdKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-px2iUPaUNwmfqFgXDcdVXw-1; Thu, 17 Jun 2021 14:12:36 -0400
X-MC-Unique: px2iUPaUNwmfqFgXDcdVXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F33FA18D6A36;
 Thu, 17 Jun 2021 18:12:34 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-162.rdu2.redhat.com [10.10.116.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72A1860C05;
 Thu, 17 Jun 2021 18:12:31 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 07516225FD0; Thu, 17 Jun 2021 14:12:31 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/8] virtiofsd: Add support for extended setxattr
Date: Thu, 17 Jun 2021 14:12:09 -0400
Message-Id: <20210617181213.1177835-5-vgoyal@redhat.com>
In-Reply-To: <20210617181213.1177835-1-vgoyal@redhat.com>
References: <20210617181213.1177835-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: virtio-fs@redhat.com, lhenriques@suse.de, dgilbert@redhat.com,
 vgoyal@redhat.com, miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the bits to enable support for setxattr_ext if fuse offers it. Do not
enable it by default yet. Let passthrough_ll opt-in. Enabling it by deafult
kind of automatically means that you are taking responsibility of clearing
SGID if ACL is set.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_common.h    |  5 +++++
 tools/virtiofsd/fuse_lowlevel.c  | 11 ++++++++++-
 tools/virtiofsd/fuse_lowlevel.h  |  3 ++-
 tools/virtiofsd/passthrough_ll.c |  3 ++-
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index 0c2665b977..8abac80098 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -377,6 +377,11 @@ struct fuse_file_info {
  */
 #define FUSE_CAP_SETXATTR_EXT (1 << 29)
 
+/**
+ * Indicates that file server supports extended struct fuse_setxattr_in
+ */
+#define FUSE_CAP_SETXATTR_EXT (1 << 29)
+
 /**
  * Ioctl flags
  *
diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 156f1494f5..0eec3b70ec 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1439,7 +1439,9 @@ static void do_setxattr(fuse_req_t req, fuse_ino_t nodeid,
     }
 
     if (req->se->op.setxattr) {
-        req->se->op.setxattr(req, nodeid, name, value, arg->size, arg->flags);
+        uint32_t setxattr_flags = setxattr_ext ? arg->setxattr_flags : 0;
+        req->se->op.setxattr(req, nodeid, name, value, arg->size, arg->flags,
+                             setxattr_flags);
     } else {
         fuse_reply_err(req, ENOSYS);
     }
@@ -1986,6 +1988,9 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     if (arg->flags & FUSE_HANDLE_KILLPRIV_V2) {
         se->conn.capable |= FUSE_CAP_HANDLE_KILLPRIV_V2;
     }
+    if (arg->flags & FUSE_SETXATTR_EXT) {
+        se->conn.capable |= FUSE_CAP_SETXATTR_EXT;
+    }
 #ifdef HAVE_SPLICE
 #ifdef HAVE_VMSPLICE
     se->conn.capable |= FUSE_CAP_SPLICE_WRITE | FUSE_CAP_SPLICE_MOVE;
@@ -2121,6 +2126,10 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
         outarg.flags |= FUSE_HANDLE_KILLPRIV_V2;
     }
 
+    if (se->conn.want & FUSE_CAP_SETXATTR_EXT) {
+        outarg.flags |= FUSE_SETXATTR_EXT;
+    }
+
     fuse_log(FUSE_LOG_DEBUG, "   INIT: %u.%u\n", outarg.major, outarg.minor);
     fuse_log(FUSE_LOG_DEBUG, "   flags=0x%08x\n", outarg.flags);
     fuse_log(FUSE_LOG_DEBUG, "   max_readahead=0x%08x\n", outarg.max_readahead);
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
index 3bf786b034..4b4e8c9724 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -798,7 +798,8 @@ struct fuse_lowlevel_ops {
      *   fuse_reply_err
      */
     void (*setxattr)(fuse_req_t req, fuse_ino_t ino, const char *name,
-                     const char *value, size_t size, int flags);
+                     const char *value, size_t size, int flags,
+                     uint32_t setxattr_flags);
 
     /**
      * Get an extended attribute
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index ec91b3c133..9f5cd98fb5 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2955,7 +2955,8 @@ out:
 }
 
 static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
-                        const char *value, size_t size, int flags)
+                        const char *value, size_t size, int flags,
+                        uint32_t extra_flags)
 {
     char procname[64];
     const char *name;
-- 
2.25.4


