Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8CA375B6D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:08:52 +0200 (CEST)
Received: from localhost ([::1]:48538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejMh-0006FX-QL
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBj-0005bg-9T
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBe-0005iZ-1S
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620327445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HpXtmp1ldLpbexZZQ6+fA3pd/+IH174hLro6g4Sr2Jo=;
 b=DYynSo7qDmVMJqVgKBCI0K9spsBEsb4dmnCHdHjJIbFa3+WGyC3xlEKyKsehHC31mQyoJG
 7lPdAxM8NbGInqzFh8IpowApGCerBXhfRXbObS5ztN3d8nmbPkZP3/O+2q23POkl7IC43G
 ZxmDIV8HMRScxP9eyhxI6717JAcT9zE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-K7P1K6uRPK2fKp7NhPoP3w-1; Thu, 06 May 2021 14:57:23 -0400
X-MC-Unique: K7P1K6uRPK2fKp7NhPoP3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16246107ACE3;
 Thu,  6 May 2021 18:57:21 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-37.ams2.redhat.com
 [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83BDE19C46;
 Thu,  6 May 2021 18:57:19 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, jose.carlos.venegas.munoz@intel.com,
 ma.mandourr@gmail.com
Subject: [PULL 11/12] virtiofsd/passthrough_ll.c: Changed local allocations to
 GLib functions
Date: Thu,  6 May 2021 19:56:40 +0100
Message-Id: <20210506185641.284821-12-dgilbert@redhat.com>
In-Reply-To: <20210506185641.284821-1-dgilbert@redhat.com>
References: <20210506185641.284821-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Changed the allocations of some local variables to GLib's allocation
functions, such as g_try_malloc0(), and annotated those variables
as g_autofree. Subsequently, I was able to remove the calls to free().

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210420154643.58439-7-ma.mandourr@gmail.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 406b5bd10e..49c21fd855 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1653,7 +1653,7 @@ static void lo_do_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
     struct lo_data *lo = lo_data(req);
     struct lo_dirp *d = NULL;
     struct lo_inode *dinode;
-    char *buf = NULL;
+    g_autofree char *buf = NULL;
     char *p;
     size_t rem = size;
     int err = EBADF;
@@ -1669,7 +1669,7 @@ static void lo_do_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
     }
 
     err = ENOMEM;
-    buf = calloc(1, size);
+    buf = g_try_malloc0(size);
     if (!buf) {
         goto error;
     }
@@ -1755,7 +1755,6 @@ error:
     } else {
         fuse_reply_buf(req, buf, size - rem);
     }
-    free(buf);
 }
 
 static void lo_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
@@ -2732,7 +2731,7 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
                         size_t size)
 {
     struct lo_data *lo = lo_data(req);
-    char *value = NULL;
+    g_autofree char *value = NULL;
     char procname[64];
     const char *name;
     char *mapped_name;
@@ -2773,7 +2772,7 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
              ino, name, size);
 
     if (size) {
-        value = malloc(size);
+        value = g_try_malloc(size);
         if (!value) {
             goto out_err;
         }
@@ -2812,8 +2811,6 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
         fuse_reply_xattr(req, ret);
     }
 out_free:
-    free(value);
-
     if (fd >= 0) {
         close(fd);
     }
@@ -2832,7 +2829,7 @@ out:
 static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
 {
     struct lo_data *lo = lo_data(req);
-    char *value = NULL;
+    g_autofree char *value = NULL;
     char procname[64];
     struct lo_inode *inode;
     ssize_t ret;
@@ -2854,7 +2851,7 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
              size);
 
     if (size) {
-        value = malloc(size);
+        value = g_try_malloc(size);
         if (!value) {
             goto out_err;
         }
@@ -2939,8 +2936,6 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
         fuse_reply_xattr(req, ret);
     }
 out_free:
-    free(value);
-
     if (fd >= 0) {
         close(fd);
     }
-- 
2.31.1


