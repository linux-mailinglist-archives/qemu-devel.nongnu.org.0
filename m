Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B013B3BBB0C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:17:24 +0200 (CEST)
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LfH-0001It-OS
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LSo-00038S-8l
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:04:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LSm-0001ej-51
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625479467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6+T6x3SfzYsOAuAetn4fRdhMXzkQThUs182/Ka6sGcY=;
 b=WcBPTZDxH3r0pPO8Acd6XkDJrAGrPPVHGcsBsSQI9iVCef+HrWMXf8YEERmDO+FXMhatPa
 iRaVeNAQMsXEzmzi6mpRltQxVMyU1r3xoEKMBuP6HqNt/Xl/PIviXGnZ0kPx4WpvCp1Vwj
 PAUlwMjbvAEw+0pKoIh6WA8GSjWpspo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-AuXHieubO2uVXq5kVziHMg-1; Mon, 05 Jul 2021 06:04:26 -0400
X-MC-Unique: AuXHieubO2uVXq5kVziHMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B36F801B0F;
 Mon,  5 Jul 2021 10:04:25 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-11.ams2.redhat.com
 [10.36.114.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E424E60C0F;
 Mon,  5 Jul 2021 10:04:22 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 15/19] virtiofsd: Switch creds,
 drop FSETID for system.posix_acl_access xattr
Date: Mon,  5 Jul 2021 11:02:31 +0100
Message-Id: <20210705100235.157093-16-dgilbert@redhat.com>
In-Reply-To: <20210705100235.157093-1-dgilbert@redhat.com>
References: <20210705100235.157093-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

When posix access acls are set on a file, it can lead to adjusting file
permissions (mode) as well. If caller does not have CAP_FSETID and it
also does not have membership of owner group, this will lead to clearing
SGID bit in mode.

Current fuse code is written in such a way that it expects file server
to take care of chaning file mode (permission), if there is a need.
Right now, host kernel does not clear SGID bit because virtiofsd is
running as root and has CAP_FSETID. For host kernel to clear SGID,
virtiofsd need to switch to gid of caller in guest and also drop
CAP_FSETID (if caller did not have it to begin with).

If SGID needs to be cleared, client will set the flag
FUSE_SETXATTR_ACL_KILL_SGID in setxattr request. In that case server
should kill sgid.

Currently just switch to uid/gid of the caller and drop CAP_FSETID
and that should do it.

This should fix the xfstest generic/375 test case.

We don't have to switch uid for this to work. That could be one optimization
that pass a parameter to lo_change_cred() to only switch gid and not uid.

Also this will not work whenever (if ever) we support idmapped mounts. In
that case it is possible that uid/gid in request are 0/0 but still we
need to clear SGID. So we will have to pick a non-root sgid and switch
to that instead. That's an TODO item for future when idmapped mount
support is introduced.

This patch only adds the capability to switch creds and drop FSETID
when acl xattr is set. This does not take affect yet. It can take
affect when next patch adds the capability to enable posix_acl.

Reported-by: Luis Henriques <lhenriques@suse.de>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20210622150852.1507204-7-vgoyal@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 75 ++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 65b2c6fd74..6e30fd9113 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -175,6 +175,7 @@ struct lo_data {
     int user_killpriv_v2, killpriv_v2;
     /* If set, virtiofsd is responsible for setting umask during creation */
     bool change_umask;
+    int posix_acl;
 };
 
 static const struct fuse_opt lo_opts[] = {
@@ -1185,6 +1186,51 @@ static void lo_restore_cred(struct lo_cred *old, bool restore_umask)
         umask(old->umask);
 }
 
+/*
+ * A helper to change cred and drop capability. Returns 0 on success and
+ * errno on error
+ */
+static int lo_drop_cap_change_cred(fuse_req_t req, struct lo_cred *old,
+                                   bool change_umask, const char *cap_name,
+                                   bool *cap_dropped)
+{
+    int ret;
+    bool __cap_dropped;
+
+    assert(cap_name);
+
+    ret = drop_effective_cap(cap_name, &__cap_dropped);
+    if (ret) {
+        return ret;
+    }
+
+    ret = lo_change_cred(req, old, change_umask);
+    if (ret) {
+        if (__cap_dropped) {
+            if (gain_effective_cap(cap_name)) {
+                fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_%s\n", cap_name);
+            }
+        }
+    }
+
+    if (cap_dropped) {
+        *cap_dropped = __cap_dropped;
+    }
+    return ret;
+}
+
+static void lo_restore_cred_gain_cap(struct lo_cred *old, bool restore_umask,
+                                     const char *cap_name)
+{
+    assert(cap_name);
+
+    lo_restore_cred(old, restore_umask);
+
+    if (gain_effective_cap(cap_name)) {
+        fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_%s\n", cap_name);
+    }
+}
+
 static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
                              const char *name, mode_t mode, dev_t rdev,
                              const char *link)
@@ -2976,6 +3022,9 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
     ssize_t ret;
     int saverr;
     int fd = -1;
+    bool switched_creds = false;
+    bool cap_fsetid_dropped = false;
+    struct lo_cred old = {};
 
     mapped_name = NULL;
     name = in_name;
@@ -3006,6 +3055,26 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
              ", name=%s value=%s size=%zd)\n", ino, name, value, size);
 
     sprintf(procname, "%i", inode->fd);
+    /*
+     * If we are setting posix access acl and if SGID needs to be
+     * cleared, then switch to caller's gid and drop CAP_FSETID
+     * and that should make sure host kernel clears SGID.
+     *
+     * This probably will not work when we support idmapped mounts.
+     * In that case we will need to find a non-root gid and switch
+     * to it. (Instead of gid in request). Fix it when we support
+     * idmapped mounts.
+     */
+    if (lo->posix_acl && !strcmp(name, "system.posix_acl_access")
+        && (extra_flags & FUSE_SETXATTR_ACL_KILL_SGID)) {
+        ret = lo_drop_cap_change_cred(req, &old, false, "FSETID",
+                                      &cap_fsetid_dropped);
+        if (ret) {
+            saverr = ret;
+            goto out;
+        }
+        switched_creds = true;
+    }
     if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
         fd = openat(lo->proc_self_fd, procname, O_RDONLY);
         if (fd < 0) {
@@ -3021,6 +3090,12 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
         saverr = ret == -1 ? errno : 0;
         FCHDIR_NOFAIL(lo->root.fd);
     }
+    if (switched_creds) {
+        if (cap_fsetid_dropped)
+            lo_restore_cred_gain_cap(&old, false, "FSETID");
+        else
+            lo_restore_cred(&old, false);
+    }
 
 out:
     if (fd >= 0) {
-- 
2.31.1


