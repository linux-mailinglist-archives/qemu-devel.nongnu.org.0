Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55DF3ABB36
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 20:14:52 +0200 (CEST)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwXT-0000Rh-Oi
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 14:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1ltwVN-0006Rz-KW
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:12:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1ltwVK-0001sP-Fb
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623953557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DTyNx9KOxoFz+giaagtGKef/aQBREHMod4NEDZYo4m4=;
 b=KCYhno/SY38EGONdjpLb7okEyIPXJC2IOTLRfFj8F/es3AWQf25Fy+eZPtCKZn/2k1qWwh
 QZtKl8q20iD6cfucUQjgY9VvCIrdI3l5ST2yu5NHQjMdseb1G+0eoQDD13AVM3t/uf0p5P
 FTpxMdrSfZF9nwPm2FGT1SgchMq80RM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-UyeD4TCCOXaKmHaAtFEhFg-1; Thu, 17 Jun 2021 14:12:35 -0400
X-MC-Unique: UyeD4TCCOXaKmHaAtFEhFg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCD05100C66C;
 Thu, 17 Jun 2021 18:12:34 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-162.rdu2.redhat.com [10.10.116.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72CDD5C1D1;
 Thu, 17 Jun 2021 18:12:31 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 0088F225FCF; Thu, 17 Jun 2021 14:12:30 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/8] virtiofsd: Fix xattr operations overwriting errno
Date: Thu, 17 Jun 2021 14:12:08 -0400
Message-Id: <20210617181213.1177835-4-vgoyal@redhat.com>
In-Reply-To: <20210617181213.1177835-1-vgoyal@redhat.com>
References: <20210617181213.1177835-1-vgoyal@redhat.com>
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
---
 tools/virtiofsd/passthrough_ll.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 49c21fd855..ec91b3c133 100644
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
2.25.4


