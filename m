Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A772D3EF2DD
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 21:47:15 +0200 (CEST)
Received: from localhost ([::1]:53900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG53F-0000Fl-9J
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 15:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mG51n-0007rr-P0
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 15:45:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mG51i-0003sc-Qr
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 15:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629229533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Idvq1yZNsGehUMsw6Flcd8JODiiRMmPXaIQWEQFb/Ec=;
 b=D3f4Ie43M8jm4cPtH/PGpby5raM64J62iKdtIHjgA8AhVcHK4DQpzcVhM60wPuSPblST8K
 srV+K/Tcx9JvO809teXX+zPvuww6P8HGBU2vrAWZiyGlqpiP6DY71rQxH05xVGDr61EHJx
 cMQgPA/paE4dcobuH2WaHRZaRFwmxsE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-davaFexsNcKjKSjqyaNwcQ-1; Tue, 17 Aug 2021 15:45:32 -0400
X-MC-Unique: davaFexsNcKjKSjqyaNwcQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EB4292503;
 Tue, 17 Aug 2021 19:45:31 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.10.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4D375C1C5;
 Tue, 17 Aug 2021 19:45:19 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 3C01C220637; Tue, 17 Aug 2021 15:45:19 -0400 (EDT)
Date: Tue, 17 Aug 2021 15:45:19 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 09/10] virtiofsd: Optionally fill lo_inode.fhandle
Message-ID: <YRwRz8aZGq6QLpx/@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-10-mreitz@redhat.com>
 <YRF2xjwSKOiqB/Al@redhat.com>
 <df64553c-c03d-076a-bcef-bec8554977a4@redhat.com>
 <YRKZ415xrDtcYaQR@redhat.com>
 <4a74bbbd-92f6-a7d1-0c8d-fa8b121b9643@redhat.com>
 <YRKh/fbBntF+GfS8@redhat.com>
 <6e943ee0-dcb3-6812-3a0b-eb2b72b503ad@redhat.com>
 <YRrALRGy2cROwsP9@redhat.com>
 <89b416e7-c0ca-7831-da13-683e8a74b7ae@redhat.com>
MIME-Version: 1.0
In-Reply-To: <89b416e7-c0ca-7831-da13-683e8a74b7ae@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Ioannis Angelakopoulos <jaggel@bu.edu>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 17, 2021 at 10:27:16AM +0200, Hanna Reitz wrote:
> On 16.08.21 21:44, Vivek Goyal wrote:
> > On Wed, Aug 11, 2021 at 08:41:18AM +0200, Hanna Reitz wrote:
> > 
> > [..]
> > > > > But given the inotify complications, there’s really a good reason we should
> > > > > use mountinfo.
> > > > > 
> > > > > > > It’s a bit tricky because our sandboxing prevents easy access to mountinfo,
> > > > > > > but if that’s the only way...
> > > > > > yes. We already have lo->proc_self_fd. Maybe we need to keep
> > > > > > /proc/self/mountinfo open in lo->proc_self_mountinfo. I am assuming
> > > > > > that any mount table changes will still be visible despite the fact
> > > > > > I have fd open (and don't have to open new fd to notice new mount/unmount
> > > > > > changes).
> > > > > Well, yes, that was my idea.  Unfortunately, I wasn’t quite successful yet;
> > > > > when I tried keeping the fd open, reading from it would just return 0
> > > > > bytes.  Perhaps that’s because we bind-mount /proc/self/fd to /proc so that
> > > > > nothing else in /proc is visible. Perhaps we need to bind-mount
> > > > > /proc/self/mountinfo into /proc/self/fd before that...
> > > > Or perhaps open /proc/self/mountinfo and save fd in lo->proc_mountinfo
> > > > before /proc/self/fd is bind mounted on /proc?
> > > Yes, I tried that, and then reading would just return 0 bytes.
> > Hi Hanna,
> > 
> > I tried this simple patch and I can read /proc/self/mountinfo before
> > bind mounting /proc/self/fd and after bind mounting /proc/self/fd. Am
> > I missing something.
> 
> Yes, but I tried reading it in the main loop (where we’d actually need it). 
> It looks like the umount2(".", MNT_DETACH) in setup_mounts() breaks it.

Good point. I modified my code and notice too that after umoutn2() it
always reads 0 bytes. I can understand that all the other mount points
could go away but new rootfs mount point of virtiofsd should still be
visible, IIUC. I don't understand why.

Anyway, I tried re-opening /proc/self/mountinfo file after umount2(".",
MNT_DETACH), and that seems to work and it shows root mount point. I 
created a bind mount and it shows that too.

So looks like quick fix can be that we re-open /proc/self/mountinfo. But
that means we can't bind /proc/self/fd on /proc/. We could bind mount
/proc/self on /proc. Not sure is it safe enough.

Here is the debug patch I tried.


---
 tools/virtiofsd/passthrough_ll.c |  101 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 96 insertions(+), 5 deletions(-)

Index: rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c
===================================================================
--- rhvgoyal-qemu.orig/tools/virtiofsd/passthrough_ll.c	2021-08-16 15:29:27.712223551 -0400
+++ rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c	2021-08-17 15:40:20.456811218 -0400
@@ -172,6 +172,8 @@ struct lo_data {
 
     /* An O_PATH file descriptor to /proc/self/fd/ */
     int proc_self_fd;
+    int proc_mountinfo;
+    int proc_self;
     int user_killpriv_v2, killpriv_v2;
     /* If set, virtiofsd is responsible for setting umask during creation */
     bool change_umask;
@@ -3403,12 +3405,56 @@ static void setup_wait_parent_capabiliti
     capng_apply(CAPNG_SELECT_BOTH);
 }
 
+static void read_mountinfo(struct lo_data *lo)
+{
+    char buf[4096];
+    ssize_t count, total_read = 0;
+    int ret;
+
+    ret = lseek(lo->proc_mountinfo, 0, SEEK_SET);
+    if (ret == -1) {
+            fuse_log(FUSE_LOG_ERR, "lseek(): %m\n");
+            exit(1);
+    }
+
+    do {
+        count = read(lo->proc_mountinfo, buf, 4095);
+        if (count == -1) {
+            fuse_log(FUSE_LOG_ERR, "read(/proc/self/mountinfo): %m\n");
+            exit(1);
+        }
+
+        //fuse_log(FUSE_LOG_INFO, "read(%d) bytes\n", count);
+        buf[count] = '\0';
+        fuse_log(FUSE_LOG_INFO, "%s", buf);
+        total_read += count;
+    } while(count);
+
+    fuse_log(FUSE_LOG_INFO, "read(%d) bytes\n", total_read);
+}
+
+static void reopen_mountinfo(struct lo_data *lo)
+{
+    int fd;
+
+    close(lo->proc_mountinfo);
+
+    fd = openat(lo->proc_self, "mountinfo", O_RDONLY);
+    if (fd == -1) {
+        fuse_log(FUSE_LOG_ERR, "open(/proc/self/mountinfo, O_RDONLY): %m\n");
+        exit(1);
+    }
+
+    lo->proc_mountinfo = fd;
+}
+
 /*
  * Move to a new mount, net, and pid namespaces to isolate this process.
  */
 static void setup_namespaces(struct lo_data *lo, struct fuse_session *se)
 {
     pid_t child;
+    int fd;
 
     /*
      * Create a new pid namespace for *child* processes.  We'll have to
@@ -3472,21 +3518,35 @@ static void setup_namespaces(struct lo_d
         exit(1);
     }
 
+    fd = open("/proc/self/mountinfo", O_RDONLY);
+    if (fd == -1) {
+        fuse_log(FUSE_LOG_ERR, "open(/proc/self/mountinfo, O_RDONLY): %m\n");
+        exit(1);
+    }
+
+    lo->proc_mountinfo = fd;
+
     /*
      * We only need /proc/self/fd. Prevent ".." from accessing parent
      * directories of /proc/self/fd by bind-mounting it over /proc. Since / was
      * previously remounted with MS_REC | MS_SLAVE this mount change only
      * affects our process.
      */
-    if (mount("/proc/self/fd", "/proc", NULL, MS_BIND, NULL) < 0) {
+    if (mount("/proc/self/", "/proc", NULL, MS_BIND, NULL) < 0) {
         fuse_log(FUSE_LOG_ERR, "mount(/proc/self/fd, MS_BIND): %m\n");
         exit(1);
     }
 
     /* Get the /proc (actually /proc/self/fd, see above) file descriptor */
-    lo->proc_self_fd = open("/proc", O_PATH);
+    lo->proc_self_fd = open("/proc/fd", O_PATH);
     if (lo->proc_self_fd == -1) {
-        fuse_log(FUSE_LOG_ERR, "open(/proc, O_PATH): %m\n");
+        fuse_log(FUSE_LOG_ERR, "open(/proc/fd, O_PATH): %m\n");
+        exit(1);
+    }
+
+    lo->proc_self = open("/proc/", O_PATH);
+    if (lo->proc_self == -1) {
+        fuse_log(FUSE_LOG_ERR, "open(/proc/self, O_PATH): %m\n");
         exit(1);
     }
 }
@@ -3524,7 +3584,7 @@ static void cleanup_capng(void)
  * Make the source directory our root so symlinks cannot escape and no other
  * files are accessible.  Assumes unshare(CLONE_NEWNS) was already called.
  */
-static void setup_mounts(const char *source)
+static void setup_mounts(const char *source, struct lo_data *lo)
 {
     int oldroot;
     int newroot;
@@ -3552,26 +3612,43 @@ static void setup_mounts(const char *sou
         exit(1);
     }
 
+    fuse_log(FUSE_LOG_INFO, "mountinfo before pivot_root()\n");
+    read_mountinfo(lo);
+
     if (syscall(__NR_pivot_root, ".", ".") < 0) {
         fuse_log(FUSE_LOG_ERR, "pivot_root(., .): %m\n");
         exit(1);
     }
 
+    fuse_log(FUSE_LOG_INFO, "mountinfo after pivot_root()\n");
+    read_mountinfo(lo);
+
     if (fchdir(oldroot) < 0) {
         fuse_log(FUSE_LOG_ERR, "fchdir(oldroot): %m\n");
         exit(1);
     }
 
+    fuse_log(FUSE_LOG_INFO, "mountinfo after fchdir()\n");
+    read_mountinfo(lo);
+
     if (mount("", ".", "", MS_SLAVE | MS_REC, NULL) < 0) {
         fuse_log(FUSE_LOG_ERR, "mount(., MS_SLAVE | MS_REC): %m\n");
         exit(1);
     }
 
+    fuse_log(FUSE_LOG_INFO, "mountinfo before umount2(., MNT_DETACH): %m\n");
+    reopen_mountinfo(lo);
+    read_mountinfo(lo);
+
     if (umount2(".", MNT_DETACH) < 0) {
         fuse_log(FUSE_LOG_ERR, "umount2(., MNT_DETACH): %m\n");
         exit(1);
     }
 
+    fuse_log(FUSE_LOG_INFO, "mountinfo after umount2(., MNT_DETACH): %m\n");
+    reopen_mountinfo(lo);
+    read_mountinfo(lo);
+
     if (fchdir(newroot) < 0) {
         fuse_log(FUSE_LOG_ERR, "fchdir(newroot): %m\n");
         exit(1);
@@ -3711,6 +3788,19 @@ static void setup_chroot(struct lo_data
     }
 }
 
+static void create_mount(struct lo_data *lo)
+{
+    const char *source="foo", *dest="bar";
+
+    if (mount(source, dest, NULL, MS_BIND | MS_REC, NULL) < 0) {
+        fuse_log(FUSE_LOG_ERR, "mount(%s, %s, MS_BIND): %m\n", source, source);
+        exit(1);
+    }
+
+    fuse_log(FUSE_LOG_INFO, "mountinfo after mounting foo\n");
+    read_mountinfo(lo);
+}
+
 /*
  * Lock down this process to prevent access to other processes or files outside
  * source directory.  This reduces the impact of arbitrary code execution bugs.
@@ -3720,7 +3810,8 @@ static void setup_sandbox(struct lo_data
 {
     if (lo->sandbox == SANDBOX_NAMESPACE) {
         setup_namespaces(lo, se);
-        setup_mounts(lo->source);
+        setup_mounts(lo->source, lo);
+        create_mount(lo);
     } else {
         setup_chroot(lo);
     }


