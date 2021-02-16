Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4449A31D067
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 19:49:11 +0100 (CET)
Received: from localhost ([::1]:57886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5PK-00039w-Au
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 13:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC5EW-0004Nm-TG
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:38:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC5EU-0000Hf-3v
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613500677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ly6cDLLcovd5j+qUNv0TPyzTE/C95+IKsT5ZzEfVeCw=;
 b=WPJZVBAj0oorGsluzmkZ4XhVXUOo2QPkh+SP6QgRGuz4ZMyModGl/MZ0PEX3UhFHq39gY+
 x/ECrBESfVVH7BEGhkJLhiI0/cdvRa2uysGB7HVS26w09xitweGrgGywaerQ+L3gTrmohE
 fG6bLG3T+ScUw+ZBXk7l6LElsMiQOTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-Kl0pVALBN9CTnRKxjPNqLg-1; Tue, 16 Feb 2021 13:37:53 -0500
X-MC-Unique: Kl0pVALBN9CTnRKxjPNqLg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D287F6EE20;
 Tue, 16 Feb 2021 18:37:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-109.ams2.redhat.com
 [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A57F55C1B4;
 Tue, 16 Feb 2021 18:37:48 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, wainersm@redhat.com, groug@kaod.org,
 philmd@redhat.com, vgoyal@redhat.com
Subject: [PULL 4/6] virtiofsd: Save error code early at the failure callsite
Date: Tue, 16 Feb 2021 18:37:32 +0000
Message-Id: <20210216183734.57810-5-dgilbert@redhat.com>
In-Reply-To: <20210216183734.57810-1-dgilbert@redhat.com>
References: <20210216183734.57810-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

Change error code handling slightly in lo_setattr(). Right now we seem
to jump to out_err and assume that "errno" is valid and use that to
send reply.

But if caller has to do some other operations before jumping to out_err,
then it does the dance of first saving errno to saverr and the restore
errno before jumping to out_err. This makes it more confusing.

I am about to make more changes where caller will have to do some
work after error before jumping to out_err. I found it easier to
change the convention a bit. That is caller saves error in "saverr"
before jumping to out_err. And out_err uses "saverr" to send error
back and does not rely on "errno" having actual error.

v3: Resolved conflicts in lo_setattr() due to lo_inode_open() changes.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210208224024.43555-2-vgoyal@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 5f3afe8557..216c0bc026 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -698,6 +698,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
             res = fchmodat(lo->proc_self_fd, procname, attr->st_mode, 0);
         }
         if (res == -1) {
+            saverr = errno;
             goto out_err;
         }
     }
@@ -707,6 +708,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
 
         res = fchownat(ifd, "", uid, gid, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
         if (res == -1) {
+            saverr = errno;
             goto out_err;
         }
     }
@@ -718,16 +720,15 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
         } else {
             truncfd = lo_inode_open(lo, inode, O_RDWR);
             if (truncfd < 0) {
-                errno = -truncfd;
+                saverr = -truncfd;
                 goto out_err;
             }
         }
 
         res = ftruncate(truncfd, attr->st_size);
+        saverr = res == -1 ? errno : 0;
         if (!fi) {
-            saverr = errno;
             close(truncfd);
-            errno = saverr;
         }
         if (res == -1) {
             goto out_err;
@@ -760,6 +761,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
             res = utimensat(lo->proc_self_fd, procname, tv, 0);
         }
         if (res == -1) {
+            saverr = errno;
             goto out_err;
         }
     }
@@ -768,7 +770,6 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
     return lo_getattr(req, ino, fi);
 
 out_err:
-    saverr = errno;
     lo_inode_put(lo, &inode);
     fuse_reply_err(req, saverr);
 }
-- 
2.29.2


