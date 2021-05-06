Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A13375AE8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 20:59:23 +0200 (CEST)
Received: from localhost ([::1]:58712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejDW-0006xJ-G4
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 14:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBH-0005Gy-Kr
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBC-0005VO-QW
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620327417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KyXvn23GJpjWPiH/gTS/OhOYul/0WPEsLt6H0sEFwtM=;
 b=Dh5vY05p2FN9aneiE3q5pqvzMFUlThWfgbsjH/cW0VvFfZN23MT89h+PbrOZ/8gMwxteP/
 lUCbsp4v7bdfKI4V4EvVL4UgvUhuPkVpyk92dQqKZf6C0cpHfw1xV1lhVdDEm7dxtgxYC/
 z1jranhdX0jUOoz4r6nrd6b/CSev9yQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-LHPd2fb5Nqiogbvq9YafSg-1; Thu, 06 May 2021 14:56:55 -0400
X-MC-Unique: LHPd2fb5Nqiogbvq9YafSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7987E107ACCA;
 Thu,  6 May 2021 18:56:54 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-37.ams2.redhat.com
 [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEAB119726;
 Thu,  6 May 2021 18:56:52 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, jose.carlos.venegas.munoz@intel.com,
 ma.mandourr@gmail.com
Subject: [PULL 01/12] virtiofsd: Fix side-effect in assert()
Date: Thu,  6 May 2021 19:56:30 +0100
Message-Id: <20210506185641.284821-2-dgilbert@redhat.com>
In-Reply-To: <20210506185641.284821-1-dgilbert@redhat.com>
References: <20210506185641.284821-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: virtio-fs@redhat.com, vgoyal@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

It is bad practice to put an expression with a side-effect in
assert() because the side-effect won't happen if the code is
compiled with -DNDEBUG.

Use an intermediate variable. Consolidate this in an macro to
have proper line numbers when the assertion is hit.

virtiofsd: ../../tools/virtiofsd/passthrough_ll.c:2797: lo_getxattr:
 Assertion `fchdir_res == 0' failed.
Aborted

  2796          /* fchdir should not fail here */
=>2797          FCHDIR_NOFAIL(lo->proc_self_fd);
  2798          ret = getxattr(procname, name, value, size);
  2799          FCHDIR_NOFAIL(lo->root.fd);

Fixes: bdfd66788349 ("virtiofsd: Fix xattr operations")
Cc: misono.tomohiro@jp.fujitsu.com
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210409100627.451573-1-groug@kaod.org>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 1553d2ef45..6592f96f68 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2723,6 +2723,11 @@ static int xattr_map_server(const struct lo_data *lo, const char *server_name,
     return -ENODATA;
 }
 
+#define FCHDIR_NOFAIL(fd) do {                         \
+        int fchdir_res = fchdir(fd);                   \
+        assert(fchdir_res == 0);                       \
+    } while (0)
+
 static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
                         size_t size)
 {
@@ -2789,9 +2794,9 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
         ret = fgetxattr(fd, name, value, size);
     } else {
         /* fchdir should not fail here */
-        assert(fchdir(lo->proc_self_fd) == 0);
+        FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = getxattr(procname, name, value, size);
-        assert(fchdir(lo->root.fd) == 0);
+        FCHDIR_NOFAIL(lo->root.fd);
     }
 
     if (ret == -1) {
@@ -2864,9 +2869,9 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
         ret = flistxattr(fd, value, size);
     } else {
         /* fchdir should not fail here */
-        assert(fchdir(lo->proc_self_fd) == 0);
+        FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = listxattr(procname, value, size);
-        assert(fchdir(lo->root.fd) == 0);
+        FCHDIR_NOFAIL(lo->root.fd);
     }
 
     if (ret == -1) {
@@ -3000,9 +3005,9 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
         ret = fsetxattr(fd, name, value, size, flags);
     } else {
         /* fchdir should not fail here */
-        assert(fchdir(lo->proc_self_fd) == 0);
+        FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = setxattr(procname, name, value, size, flags);
-        assert(fchdir(lo->root.fd) == 0);
+        FCHDIR_NOFAIL(lo->root.fd);
     }
 
     saverr = ret == -1 ? errno : 0;
@@ -3066,9 +3071,9 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
         ret = fremovexattr(fd, name);
     } else {
         /* fchdir should not fail here */
-        assert(fchdir(lo->proc_self_fd) == 0);
+        FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = removexattr(procname, name);
-        assert(fchdir(lo->root.fd) == 0);
+        FCHDIR_NOFAIL(lo->root.fd);
     }
 
     saverr = ret == -1 ? errno : 0;
-- 
2.31.1


