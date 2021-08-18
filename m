Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6133F04E5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 15:34:26 +0200 (CEST)
Received: from localhost ([::1]:43594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGLi5-0005K7-Gr
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 09:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mGLgs-0003SL-Cy
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 09:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mGLgo-0001Ik-RB
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 09:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629293584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DQTrdjfWo/Pz6nqsj1n2yLLR7rtX2Nms1Bj1NOXFT4w=;
 b=XF6obMXMLKaJvH03CA9h3Q84+/Sklh+qMElhhlI9i4zNLYkp5dLzcF4+IYfyrl5rRf/2f2
 vxWRzjGRh0KG7lAwhUlf711A12XlIxkFz9eSpri2QydmISZugyCP6JBPDSWyhp+HSMKq0P
 yLAbtO2YPQoIaIW0eevge/DOZYFvuQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-Rt5Vocb6MBKBH_yEogdvlQ-1; Wed, 18 Aug 2021 09:33:01 -0400
X-MC-Unique: Rt5Vocb6MBKBH_yEogdvlQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16DA98799E0;
 Wed, 18 Aug 2021 13:33:00 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.33.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86597100EBAD;
 Wed, 18 Aug 2021 13:32:53 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id E6208223863; Wed, 18 Aug 2021 09:32:52 -0400 (EDT)
Date: Wed, 18 Aug 2021 09:32:52 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 09/10] virtiofsd: Optionally fill lo_inode.fhandle
Message-ID: <YR0MBJs748Fvzvoz@redhat.com>
References: <YRF2xjwSKOiqB/Al@redhat.com>
 <df64553c-c03d-076a-bcef-bec8554977a4@redhat.com>
 <YRKZ415xrDtcYaQR@redhat.com>
 <4a74bbbd-92f6-a7d1-0c8d-fa8b121b9643@redhat.com>
 <YRKh/fbBntF+GfS8@redhat.com>
 <6e943ee0-dcb3-6812-3a0b-eb2b72b503ad@redhat.com>
 <YRrALRGy2cROwsP9@redhat.com>
 <89b416e7-c0ca-7831-da13-683e8a74b7ae@redhat.com>
 <YRwRz8aZGq6QLpx/@redhat.com> <YRxQ9rClxWux/UHs@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YRxQ9rClxWux/UHs@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, Aug 17, 2021 at 08:14:46PM -0400, Vivek Goyal wrote:
> On Tue, Aug 17, 2021 at 03:45:19PM -0400, Vivek Goyal wrote:
> > On Tue, Aug 17, 2021 at 10:27:16AM +0200, Hanna Reitz wrote:
> > > On 16.08.21 21:44, Vivek Goyal wrote:
> > > > On Wed, Aug 11, 2021 at 08:41:18AM +0200, Hanna Reitz wrote:
> > > > 
> > > > [..]
> > > > > > > But given the inotify complications, there’s really a good reason we should
> > > > > > > use mountinfo.
> > > > > > > 
> > > > > > > > > It’s a bit tricky because our sandboxing prevents easy access to mountinfo,
> > > > > > > > > but if that’s the only way...
> > > > > > > > yes. We already have lo->proc_self_fd. Maybe we need to keep
> > > > > > > > /proc/self/mountinfo open in lo->proc_self_mountinfo. I am assuming
> > > > > > > > that any mount table changes will still be visible despite the fact
> > > > > > > > I have fd open (and don't have to open new fd to notice new mount/unmount
> > > > > > > > changes).
> > > > > > > Well, yes, that was my idea.  Unfortunately, I wasn’t quite successful yet;
> > > > > > > when I tried keeping the fd open, reading from it would just return 0
> > > > > > > bytes.  Perhaps that’s because we bind-mount /proc/self/fd to /proc so that
> > > > > > > nothing else in /proc is visible. Perhaps we need to bind-mount
> > > > > > > /proc/self/mountinfo into /proc/self/fd before that...
> > > > > > Or perhaps open /proc/self/mountinfo and save fd in lo->proc_mountinfo
> > > > > > before /proc/self/fd is bind mounted on /proc?
> > > > > Yes, I tried that, and then reading would just return 0 bytes.
> > > > Hi Hanna,
> > > > 
> > > > I tried this simple patch and I can read /proc/self/mountinfo before
> > > > bind mounting /proc/self/fd and after bind mounting /proc/self/fd. Am
> > > > I missing something.
> > > 
> > > Yes, but I tried reading it in the main loop (where we’d actually need it). 
> > > It looks like the umount2(".", MNT_DETACH) in setup_mounts() breaks it.
> > 
> > Good point. I modified my code and notice too that after umoutn2() it
> > always reads 0 bytes. I can understand that all the other mount points
> > could go away but new rootfs mount point of virtiofsd should still be
> > visible, IIUC. I don't understand why.
> > 
> > Anyway, I tried re-opening /proc/self/mountinfo file after umount2(".",
> > MNT_DETACH), and that seems to work and it shows root mount point. I 
> > created a bind mount and it shows that too.
> > 
> > So looks like quick fix can be that we re-open /proc/self/mountinfo. But
> > that means we can't bind /proc/self/fd on /proc/. We could bind mount
> > /proc/self on /proc. Not sure is it safe enough.
> 
> Or may be I can do this.
> 
> - Open O_PATH fd for /proc/self
>   proc_self = open("/proc/self");
> - Bind mount /proc/self/fd on /proc
> - pivot_root() and umount() stuff
> - Openat(proc_self, "mountinfo")
> - close(proc_self)
> 
> If this works, then we don't have the security issue and we managed
> to open mountinfo after pivot_root() and umount(). Will give it a
> try and see if it works tomorrow.

Hi Hanna,

This seems to work for me. I think key is to open mountinfo after
pivot_root() and then it works. If it is opened before pivot_root()
then it does not work. Not sure why.

Thanks
Vivek


---
 tools/virtiofsd/passthrough_ll.c |   61 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 2 deletions(-)

Index: rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c
===================================================================
--- rhvgoyal-qemu.orig/tools/virtiofsd/passthrough_ll.c	2021-08-16 15:29:27.712223551 -0400
+++ rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c	2021-08-18 09:29:34.653891067 -0400
@@ -172,6 +172,8 @@ struct lo_data {
 
     /* An O_PATH file descriptor to /proc/self/fd/ */
     int proc_self_fd;
+    int proc_mountinfo;
+    int proc_self;
     int user_killpriv_v2, killpriv_v2;
     /* If set, virtiofsd is responsible for setting umask during creation */
     bool change_umask;
@@ -3403,6 +3405,47 @@ static void setup_wait_parent_capabiliti
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
+static void open_mountinfo(struct lo_data *lo)
+{
+    int fd;
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
@@ -3472,6 +3515,12 @@ static void setup_namespaces(struct lo_d
         exit(1);
     }
 
+    lo->proc_self = open("/proc/self", O_PATH);
+    if (lo->proc_self == -1) {
+        fuse_log(FUSE_LOG_ERR, "open(/proc/self, O_PATH): %m\n");
+        exit(1);
+    }
+
     /*
      * We only need /proc/self/fd. Prevent ".." from accessing parent
      * directories of /proc/self/fd by bind-mounting it over /proc. Since / was
@@ -3524,7 +3573,7 @@ static void cleanup_capng(void)
  * Make the source directory our root so symlinks cannot escape and no other
  * files are accessible.  Assumes unshare(CLONE_NEWNS) was already called.
  */
-static void setup_mounts(const char *source)
+static void setup_mounts(const char *source, struct lo_data *lo)
 {
     int oldroot;
     int newroot;
@@ -3557,6 +3606,8 @@ static void setup_mounts(const char *sou
         exit(1);
     }
 
+    open_mountinfo(lo);
+
     if (fchdir(oldroot) < 0) {
         fuse_log(FUSE_LOG_ERR, "fchdir(oldroot): %m\n");
         exit(1);
@@ -3567,11 +3618,17 @@ static void setup_mounts(const char *sou
         exit(1);
     }
 
+    fuse_log(FUSE_LOG_INFO, "mountinfo before umount2(., MNT_DETACH)\n");
+    read_mountinfo(lo);
+
     if (umount2(".", MNT_DETACH) < 0) {
         fuse_log(FUSE_LOG_ERR, "umount2(., MNT_DETACH): %m\n");
         exit(1);
     }
 
+    fuse_log(FUSE_LOG_INFO, "mountinfo after umount2(., MNT_DETACH):\n");
+    read_mountinfo(lo);
+
     if (fchdir(newroot) < 0) {
         fuse_log(FUSE_LOG_ERR, "fchdir(newroot): %m\n");
         exit(1);
@@ -3720,7 +3777,7 @@ static void setup_sandbox(struct lo_data
 {
     if (lo->sandbox == SANDBOX_NAMESPACE) {
         setup_namespaces(lo, se);
-        setup_mounts(lo->source);
+        setup_mounts(lo->source, lo);
     } else {
         setup_chroot(lo);
     }


