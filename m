Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E068287C4B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 21:16:53 +0200 (CEST)
Received: from localhost ([::1]:53408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQbPI-000075-Kq
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 15:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kQbJk-00022a-JD
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:11:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kQbJi-00059y-Mb
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602184265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xiPfig7jG9VC0GE1wxVAHcnqkY098QwCgL+T1oBSk+E=;
 b=Vx6k2tRRMMB5uvMIUr9eUOKSGaalSkBwicBdSwPL9Pom6tVrMdEA/UM/PR0VcVyN63rX9Q
 FeCjEzPp57/xsEBjMmp0un8/WL6Di/cx40lGy/kbV9XIZgSpFzRery61hLjKUIizdI1ihO
 w329dny6uY9WDaqQBzC6GEFy+yy4xlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-Jp9XRHudMkCXvjjWDvrCEA-1; Thu, 08 Oct 2020 15:11:03 -0400
X-MC-Unique: Jp9XRHudMkCXvjjWDvrCEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9484818CBC42;
 Thu,  8 Oct 2020 19:11:02 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-212.ams2.redhat.com
 [10.36.114.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 450635C1BD;
 Thu,  8 Oct 2020 19:11:01 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, zhengchuan@huawei.com,
 stefanha@redhat.com, peterx@redhat.com
Subject: [PULL 04/10] virtiofsd: avoid /proc/self/fd tempdir
Date: Thu,  8 Oct 2020 20:10:40 +0100
Message-Id: <20201008191046.272549-5-dgilbert@redhat.com>
In-Reply-To: <20201008191046.272549-1-dgilbert@redhat.com>
References: <20201008191046.272549-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 01:56:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

In order to prevent /proc/self/fd escapes a temporary directory is
created where /proc/self/fd is bind-mounted. This doesn't work on
read-only file systems.

Avoid the temporary directory by bind-mounting /proc/self/fd over /proc.
This does not affect other processes since we remounted / with MS_REC |
MS_SLAVE. /proc must exist and virtiofsd does not use it so it's safe to
do this.

Path traversal can be tested with the following function:

  static void test_proc_fd_escape(struct lo_data *lo)
  {
      int fd;
      int level = 0;
      ino_t last_ino = 0;

      fd = lo->proc_self_fd;
      for (;;) {
          struct stat st;

          if (fstat(fd, &st) != 0) {
              perror("fstat");
              return;
          }
          if (last_ino && st.st_ino == last_ino) {
              fprintf(stderr, "inode number unchanged, stopping\n");
              return;
          }
          last_ino = st.st_ino;

          fprintf(stderr, "Level %d dev %lu ino %lu\n", level,
                  (unsigned long)st.st_dev,
                  (unsigned long)last_ino);
          fd = openat(fd, "..", O_PATH | O_DIRECTORY | O_NOFOLLOW);
          level++;
      }
  }

Before and after this patch only Level 0 is displayed. Without
/proc/self/fd bind-mount protection it is possible to traverse parent
directories.

Fixes: 397ae982f4df4 ("virtiofsd: jail lo->proc_self_fd")
Cc: Miklos Szeredi <mszeredi@redhat.com>
Cc: Jens Freimann <jfreimann@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201006095826.59813-1-stefanha@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Tested-by: Jens Freimann <jfreimann@redhat.com>
Reviewed-by: Jens Freimann <jfreimann@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 34 +++++++++++---------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 477e6ee0b5..ff53df4451 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2393,8 +2393,6 @@ static void setup_wait_parent_capabilities(void)
 static void setup_namespaces(struct lo_data *lo, struct fuse_session *se)
 {
     pid_t child;
-    char template[] = "virtiofsd-XXXXXX";
-    char *tmpdir;
 
     /*
      * Create a new pid namespace for *child* processes.  We'll have to
@@ -2458,33 +2456,23 @@ static void setup_namespaces(struct lo_data *lo, struct fuse_session *se)
         exit(1);
     }
 
-    tmpdir = mkdtemp(template);
-    if (!tmpdir) {
-        fuse_log(FUSE_LOG_ERR, "tmpdir(%s): %m\n", template);
-        exit(1);
-    }
-
-    if (mount("/proc/self/fd", tmpdir, NULL, MS_BIND, NULL) < 0) {
-        fuse_log(FUSE_LOG_ERR, "mount(/proc/self/fd, %s, MS_BIND): %m\n",
-                 tmpdir);
+    /*
+     * We only need /proc/self/fd. Prevent ".." from accessing parent
+     * directories of /proc/self/fd by bind-mounting it over /proc. Since / was
+     * previously remounted with MS_REC | MS_SLAVE this mount change only
+     * affects our process.
+     */
+    if (mount("/proc/self/fd", "/proc", NULL, MS_BIND, NULL) < 0) {
+        fuse_log(FUSE_LOG_ERR, "mount(/proc/self/fd, MS_BIND): %m\n");
         exit(1);
     }
 
-    /* Now we can get our /proc/self/fd directory file descriptor */
-    lo->proc_self_fd = open(tmpdir, O_PATH);
+    /* Get the /proc (actually /proc/self/fd, see above) file descriptor */
+    lo->proc_self_fd = open("/proc", O_PATH);
     if (lo->proc_self_fd == -1) {
-        fuse_log(FUSE_LOG_ERR, "open(%s, O_PATH): %m\n", tmpdir);
+        fuse_log(FUSE_LOG_ERR, "open(/proc, O_PATH): %m\n");
         exit(1);
     }
-
-    if (umount2(tmpdir, MNT_DETACH) < 0) {
-        fuse_log(FUSE_LOG_ERR, "umount2(%s, MNT_DETACH): %m\n", tmpdir);
-        exit(1);
-    }
-
-    if (rmdir(tmpdir) < 0) {
-        fuse_log(FUSE_LOG_ERR, "rmdir(%s): %m\n", tmpdir);
-    }
 }
 
 /*
-- 
2.28.0


