Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EFA44CDBC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 00:20:22 +0100 (CET)
Received: from localhost ([::1]:38724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkwtB-0006bw-Jp
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 18:20:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mkwqs-0003uD-Jm
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 18:17:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mkwqq-0001Hc-L1
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 18:17:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636586276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wz5glyn4JXh1q2hzXIT3U5R8Vgtu1LHTv2K7EID3yRI=;
 b=Ku+LC3IdAIh1SZgAyj7wSf/SY5Mt2LW8xXDdjQzwf2KgPeGvii1c0xDsbz+xGf5YTB/E/e
 dNWvfa5VaEDqeOszxEt0VFjxkur8M4K703vGY50+jw7HeBOQkUYaFONyTG+MvmPX356MaO
 Gy+dDGxmB8W79gPaVCwsOKQP3gCa5hI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-UUiIaJEuMqiNr2xcj3aG9g-1; Wed, 10 Nov 2021 18:17:53 -0500
X-MC-Unique: UUiIaJEuMqiNr2xcj3aG9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18C9EE744;
 Wed, 10 Nov 2021 23:17:52 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.10.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B55D25FC25;
 Wed, 10 Nov 2021 23:17:36 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 43FD0224A82; Wed, 10 Nov 2021 18:17:36 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v3 1/6] fuse: Header file changes for FUSE_SECURITY_CTX
Date: Wed, 10 Nov 2021 18:17:23 -0500
Message-Id: <20211110231728.50385-2-vgoyal@redhat.com>
In-Reply-To: <20211110231728.50385-1-vgoyal@redhat.com>
References: <20211110231728.50385-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: chirantan@chromium.org, casey@schaufler-ca.com, omosnace@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are just header file changes which should show up in qemu if
corresponding kernel changes get merged.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 include/standard-headers/linux/fuse.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/standard-headers/linux/fuse.h b/include/standard-headers/linux/fuse.h
index cce105bfba..f412ff7f50 100644
--- a/include/standard-headers/linux/fuse.h
+++ b/include/standard-headers/linux/fuse.h
@@ -181,6 +181,10 @@
  *  - add FUSE_OPEN_KILL_SUIDGID
  *  - extend fuse_setxattr_in, add FUSE_SETXATTR_EXT
  *  - add FUSE_SETXATTR_ACL_KILL_SGID
+ *
+ *  7.35
+ *  - add FUSE_SECURITY_CTX flag for fuse_init_out
+ *  - add security context to create, mkdir, symlink, and mknod requests
  */
 
 #ifndef _LINUX_FUSE_H
@@ -212,7 +216,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 33
+#define FUSE_KERNEL_MINOR_VERSION 35
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -329,6 +333,8 @@ struct fuse_file_lock {
  *			write/truncate sgid is killed only if file has group
  *			execute permission. (Same as Linux VFS behavior).
  * FUSE_SETXATTR_EXT:	Server supports extended struct fuse_setxattr_in
+ * FUSE_SECURITY_CTX:  add security context to create, mkdir, symlink, and
+ *                     mknod
  */
 #define FUSE_ASYNC_READ		(1 << 0)
 #define FUSE_POSIX_LOCKS	(1 << 1)
@@ -360,6 +366,7 @@ struct fuse_file_lock {
 #define FUSE_SUBMOUNTS		(1 << 27)
 #define FUSE_HANDLE_KILLPRIV_V2	(1 << 28)
 #define FUSE_SETXATTR_EXT	(1 << 29)
+#define FUSE_SECURITY_CTX	(1 << 30)
 
 /**
  * CUSE INIT request/reply flags
@@ -967,4 +974,14 @@ struct fuse_removemapping_one {
 #define FUSE_REMOVEMAPPING_MAX_ENTRY   \
 		(PAGE_SIZE / sizeof(struct fuse_removemapping_one))
 
+struct fuse_secctx {
+	uint32_t        size;
+	uint32_t        padding;
+};
+
+struct fuse_secctx_header {
+	uint32_t        size;
+	uint32_t        nr_secctx;
+};
+
 #endif /* _LINUX_FUSE_H */
-- 
2.31.1


