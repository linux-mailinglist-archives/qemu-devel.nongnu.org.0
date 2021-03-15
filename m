Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C045533C77F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:14:23 +0100 (CET)
Received: from localhost ([::1]:40800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtba-0001p5-Pi
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLtZz-0000My-4W
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLtZx-0006Mm-1P
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:12:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615839159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXZcFtcbNb2uHgZ4+CdBvcQWS1ZHglMMLKXQGqeD7yM=;
 b=HYyBmU4z72B9mWJh272eIpAD8ZyCH1UjDeqYtFrZ2QDOs8YUFzXKM5zNqB0LyQ4So+6+WL
 KUCX27X00ngxaz+F7c2yT4RZqvQPH5snpGg0lb9yC0WVXo2EInR92rWHmBJAWo5TUQuddm
 2eWveoLOOsCwEpTOZEgXgxuXCLRtTNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-lsb3QnXjN_medS3H7U5l5A-1; Mon, 15 Mar 2021 16:12:36 -0400
X-MC-Unique: lsb3QnXjN_medS3H7U5l5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7694F107ACCA;
 Mon, 15 Mar 2021 20:12:35 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-235.ams2.redhat.com
 [10.36.114.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0A5E62680;
 Mon, 15 Mar 2021 20:12:30 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, vgoyal@redhat.com,
 wanghao232@huawei.com, ma.mandourr@gmail.com
Subject: [PULL 3/9] virtiofsd: Don't allow empty filenames
Date: Mon, 15 Mar 2021 20:12:09 +0000
Message-Id: <20210315201215.222539-4-dgilbert@redhat.com>
In-Reply-To: <20210315201215.222539-1-dgilbert@redhat.com>
References: <20210315201215.222539-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: stefanha@redhat.com, peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

POSIX.1-2017 clearly stipulates that empty filenames aren't
allowed ([1] and [2]). Since virtiofsd is supposed to mirror
the host file system hierarchy and the host can be assumed to
be linux, we don't really expect clients to pass requests with
an empty path in it. If they do so anyway, this would eventually
cause an error when trying to create/lookup the actual inode
on the underlying POSIX filesystem. But this could still confuse
some code that wouldn't be ready to cope with this.

Filter out empty names coming from the client at the top level,
so that the rest doesn't have to care about it. This is done
everywhere we already call is_safe_path_component(), but
in a separate helper since the usual error for empty path
names is ENOENT instead of EINVAL.

[1] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap03.html#tag_03_170
[2] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap04.html#tag_04_13

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210312141003.819108-4-groug@kaod.org>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 851c25ef20..b07101d8eb 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -239,6 +239,11 @@ static int is_safe_path_component(const char *path)
     return !is_dot_or_dotdot(path);
 }
 
+static bool is_empty(const char *name)
+{
+    return name[0] == '\0';
+}
+
 static struct lo_data *lo_data(fuse_req_t req)
 {
     return (struct lo_data *)fuse_req_userdata(req);
@@ -1085,6 +1090,11 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
     fuse_log(FUSE_LOG_DEBUG, "lo_lookup(parent=%" PRIu64 ", name=%s)\n", parent,
              name);
 
+    if (is_empty(name)) {
+        fuse_reply_err(req, ENOENT);
+        return;
+    }
+
     /*
      * Don't use is_safe_path_component(), allow "." and ".." for NFS export
      * support.
@@ -1176,6 +1186,11 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
     struct fuse_entry_param e;
     struct lo_cred old = {};
 
+    if (is_empty(name)) {
+        fuse_reply_err(req, ENOENT);
+        return;
+    }
+
     if (!is_safe_path_component(name)) {
         fuse_reply_err(req, EINVAL);
         return;
@@ -1248,6 +1263,11 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
     char procname[64];
     int saverr;
 
+    if (is_empty(name)) {
+        fuse_reply_err(req, ENOENT);
+        return;
+    }
+
     if (!is_safe_path_component(name)) {
         fuse_reply_err(req, EINVAL);
         return;
@@ -1326,6 +1346,11 @@ static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
     struct lo_inode *inode;
     struct lo_data *lo = lo_data(req);
 
+    if (is_empty(name)) {
+        fuse_reply_err(req, ENOENT);
+        return;
+    }
+
     if (!is_safe_path_component(name)) {
         fuse_reply_err(req, EINVAL);
         return;
@@ -1355,6 +1380,11 @@ static void lo_rename(fuse_req_t req, fuse_ino_t parent, const char *name,
     struct lo_inode *newinode = NULL;
     struct lo_data *lo = lo_data(req);
 
+    if (is_empty(name) || is_empty(newname)) {
+        fuse_reply_err(req, ENOENT);
+        return;
+    }
+
     if (!is_safe_path_component(name) || !is_safe_path_component(newname)) {
         fuse_reply_err(req, EINVAL);
         return;
@@ -1408,6 +1438,11 @@ static void lo_unlink(fuse_req_t req, fuse_ino_t parent, const char *name)
     struct lo_inode *inode;
     struct lo_data *lo = lo_data(req);
 
+    if (is_empty(name)) {
+        fuse_reply_err(req, ENOENT);
+        return;
+    }
+
     if (!is_safe_path_component(name)) {
         fuse_reply_err(req, EINVAL);
         return;
-- 
2.30.2


