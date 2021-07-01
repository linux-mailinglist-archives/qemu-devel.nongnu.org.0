Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6693B9354
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 16:27:17 +0200 (CEST)
Received: from localhost ([::1]:50562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyxeu-0008If-KW
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 10:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxVF-0006Zw-S8
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:17:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxVD-0006Sk-B9
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625149034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EHIZaWrzTWVadqEEpcR1o8cVL1MoQyDMpjctO98rEi8=;
 b=Ys66y9y16Zrf+evdAJlgrbiT35KbTbCB8LswidvYtpP77zqIgbDGsi3Jjfd+I5h0G62Y3q
 jajPeaKOzLHy+n7XuVg5s3rGg/3CFsf/9Zx696qZ+Pi4p7qf+uurCtuK4HlgQWwQrTt8ZO
 4Am1LZpmJUh/K6NENnnVFlozd1x+ddo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-av0ZmUqMMHecU3GAXKs_XA-1; Thu, 01 Jul 2021 10:17:11 -0400
X-MC-Unique: av0ZmUqMMHecU3GAXKs_XA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FAF2804142;
 Thu,  1 Jul 2021 14:17:09 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-230.ams2.redhat.com
 [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8983860843;
 Thu,  1 Jul 2021 14:16:56 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 12/20] virtiofsd: Fix xattr operations overwriting errno
Date: Thu,  1 Jul 2021 15:15:37 +0100
Message-Id: <20210701141545.193571-13-dgilbert@redhat.com>
In-Reply-To: <20210701141545.193571-1-dgilbert@redhat.com>
References: <20210701141545.193571-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: leobras@redhat.com, stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

getxattr/setxattr/removexattr/listxattr operations handle regualar
and non-regular files differently. For the case of non-regular files
we do fchdir(/proc/self/fd) and the xattr operation and then revert
back to original working directory. After this we are saving errno
and that's buggy because fchdir() will overwrite the errno.

FCHDIR_NOFAIL(lo->proc_self_fd);
ret = getxattr(procname, name, value, size);
FCHDIR_NOFAIL(lo->root.fd);

if (ret == -1)
    saverr = errno

In above example, if getxattr() failed, we will still return 0 to caller
as errno must have been written by FCHDIR_NOFAIL(lo->root.fd) call.
Fix all such instances and capture "errno" early and save in "saverr"
variable.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20210622150852.1507204-3-vgoyal@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 9858e961d9..ccbda98c5a 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2791,15 +2791,17 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
             goto out_err;
         }
         ret = fgetxattr(fd, name, value, size);
+        saverr = ret == -1 ? errno : 0;
     } else {
         /* fchdir should not fail here */
         FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = getxattr(procname, name, value, size);
+        saverr = ret == -1 ? errno : 0;
         FCHDIR_NOFAIL(lo->root.fd);
     }
 
     if (ret == -1) {
-        goto out_err;
+        goto out;
     }
     if (size) {
         saverr = 0;
@@ -2864,15 +2866,17 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
             goto out_err;
         }
         ret = flistxattr(fd, value, size);
+        saverr = ret == -1 ? errno : 0;
     } else {
         /* fchdir should not fail here */
         FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = listxattr(procname, value, size);
+        saverr = ret == -1 ? errno : 0;
         FCHDIR_NOFAIL(lo->root.fd);
     }
 
     if (ret == -1) {
-        goto out_err;
+        goto out;
     }
     if (size) {
         saverr = 0;
@@ -2998,15 +3002,15 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
             goto out;
         }
         ret = fsetxattr(fd, name, value, size, flags);
+        saverr = ret == -1 ? errno : 0;
     } else {
         /* fchdir should not fail here */
         FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = setxattr(procname, name, value, size, flags);
+        saverr = ret == -1 ? errno : 0;
         FCHDIR_NOFAIL(lo->root.fd);
     }
 
-    saverr = ret == -1 ? errno : 0;
-
 out:
     if (fd >= 0) {
         close(fd);
@@ -3064,15 +3068,15 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
             goto out;
         }
         ret = fremovexattr(fd, name);
+        saverr = ret == -1 ? errno : 0;
     } else {
         /* fchdir should not fail here */
         FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = removexattr(procname, name);
+        saverr = ret == -1 ? errno : 0;
         FCHDIR_NOFAIL(lo->root.fd);
     }
 
-    saverr = ret == -1 ? errno : 0;
-
 out:
     if (fd >= 0) {
         close(fd);
-- 
2.31.1


