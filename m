Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C9F3EDE05
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 21:46:33 +0200 (CEST)
Received: from localhost ([::1]:54934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFiZ6-0007C5-Ur
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 15:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mFiXf-0005lD-Oy
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 15:45:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mFiXd-0007fm-Ge
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 15:45:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629143100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lc+4xQbSqfggNSNsHcCR7frpiGyqyIxvaOOhE45l96Q=;
 b=gA5ATOP1kNvHuxDDklO9QzKik5I/slIhbMVdGBWvVJT7AI+sAdpp3KtnmI+IykQ9NiMdLi
 Y+NdX2FP8AsctgP9Ip6GHuleR6RTUsC0TQOfcBH1vuRCEqPP/D7O0BuBgpCXFwO6sI4v6G
 sqzj0DM1eEghOcgxqsVscCDq3LTWadg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-Gb7R0VzVO-CrQ-cXVOOxPQ-1; Mon, 16 Aug 2021 15:44:58 -0400
X-MC-Unique: Gb7R0VzVO-CrQ-cXVOOxPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4022801AEB;
 Mon, 16 Aug 2021 19:44:57 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.17.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C4E819C44;
 Mon, 16 Aug 2021 19:44:46 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 8C1E12237F5; Mon, 16 Aug 2021 15:44:45 -0400 (EDT)
Date: Mon, 16 Aug 2021 15:44:45 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 09/10] virtiofsd: Optionally fill lo_inode.fhandle
Message-ID: <YRrALRGy2cROwsP9@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-10-mreitz@redhat.com>
 <YRF2xjwSKOiqB/Al@redhat.com>
 <df64553c-c03d-076a-bcef-bec8554977a4@redhat.com>
 <YRKZ415xrDtcYaQR@redhat.com>
 <4a74bbbd-92f6-a7d1-0c8d-fa8b121b9643@redhat.com>
 <YRKh/fbBntF+GfS8@redhat.com>
 <6e943ee0-dcb3-6812-3a0b-eb2b72b503ad@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6e943ee0-dcb3-6812-3a0b-eb2b72b503ad@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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

On Wed, Aug 11, 2021 at 08:41:18AM +0200, Hanna Reitz wrote:

[..]
> > > But given the inotify complications, there’s really a good reason we should
> > > use mountinfo.
> > > 
> > > > > It’s a bit tricky because our sandboxing prevents easy access to mountinfo,
> > > > > but if that’s the only way...
> > > > yes. We already have lo->proc_self_fd. Maybe we need to keep
> > > > /proc/self/mountinfo open in lo->proc_self_mountinfo. I am assuming
> > > > that any mount table changes will still be visible despite the fact
> > > > I have fd open (and don't have to open new fd to notice new mount/unmount
> > > > changes).
> > > Well, yes, that was my idea.  Unfortunately, I wasn’t quite successful yet;
> > > when I tried keeping the fd open, reading from it would just return 0
> > > bytes.  Perhaps that’s because we bind-mount /proc/self/fd to /proc so that
> > > nothing else in /proc is visible. Perhaps we need to bind-mount
> > > /proc/self/mountinfo into /proc/self/fd before that...
> > Or perhaps open /proc/self/mountinfo and save fd in lo->proc_mountinfo
> > before /proc/self/fd is bind mounted on /proc?
> 
> Yes, I tried that, and then reading would just return 0 bytes.

Hi Hanna,

I tried this simple patch and I can read /proc/self/mountinfo before
bind mounting /proc/self/fd and after bind mounting /proc/self/fd. Am
I missing something.

Vivek

---
 tools/virtiofsd/passthrough_ll.c |   32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

Index: rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c
===================================================================
--- rhvgoyal-qemu.orig/tools/virtiofsd/passthrough_ll.c	2021-08-16 15:29:27.712223551 -0400
+++ rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c	2021-08-16 15:41:29.500032032 -0400
@@ -172,6 +172,7 @@ struct lo_data {
 
     /* An O_PATH file descriptor to /proc/self/fd/ */
     int proc_self_fd;
+    int proc_mountinfo;
     int user_killpriv_v2, killpriv_v2;
     /* If set, virtiofsd is responsible for setting umask during creation */
     bool change_umask;
@@ -3409,6 +3410,9 @@ static void setup_wait_parent_capabiliti
 static void setup_namespaces(struct lo_data *lo, struct fuse_session *se)
 {
     pid_t child;
+    int fd;
+    char buf[128];
+    ssize_t count;
 
     /*
      * Create a new pid namespace for *child* processes.  We'll have to
@@ -3472,6 +3476,24 @@ static void setup_namespaces(struct lo_d
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
+    count = read(lo->proc_mountinfo, buf, 127);
+    if (count == -1) {
+        fuse_log(FUSE_LOG_ERR, "read(/proc/self/mountinfo): %m\n");
+        exit(1);
+    }
+
+    fuse_log(FUSE_LOG_INFO, "read(%d) bytes\n", count);
+    buf[count] = '\0';
+    fuse_log(FUSE_LOG_INFO, "%s\n", buf);
+
     /*
      * We only need /proc/self/fd. Prevent ".." from accessing parent
      * directories of /proc/self/fd by bind-mounting it over /proc. Since / was
@@ -3489,6 +3511,16 @@ static void setup_namespaces(struct lo_d
         fuse_log(FUSE_LOG_ERR, "open(/proc, O_PATH): %m\n");
         exit(1);
     }
+
+    count = read(lo->proc_mountinfo, buf, 127);
+    if (count == -1) {
+        fuse_log(FUSE_LOG_ERR, "read(/proc/self/mountinfo): %m\n");
+        exit(1);
+    }
+
+    fuse_log(FUSE_LOG_INFO, "read(%d) bytes\n", count);
+    buf[count] = '\0';
+    fuse_log(FUSE_LOG_INFO, "%s\n", buf);
 }
 
 /*


