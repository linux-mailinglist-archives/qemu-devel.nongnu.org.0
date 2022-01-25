Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7128A49BBBE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 20:06:19 +0100 (CET)
Received: from localhost ([::1]:58172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCR8z-0008Vc-RC
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 14:06:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nCQvH-0004uZ-To
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 13:52:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nCQvD-00041X-A3
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 13:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643136722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=7IyB/EV4EZEEUeL8gE4h4xR50WCLTPTNLWP3pK+2yIk=;
 b=i65b5uG+z4S4gWNG50OrXVY6SMpFjOZbH7IVEsMc+2txIv0aI+8niGkXNoHb2TNaQz8DPl
 R3c2MVpwnjW1KxabrRScAqCrug+K2AO9DOSlPY0/p+OlbQ5uIRQa7vBWHcYY89G1JrpQzF
 OMk4JVTjim7ZslHwvkABTfVzUf2TTZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-crx38ppZO0-v8gfHXV_itw-1; Tue, 25 Jan 2022 13:52:01 -0500
X-MC-Unique: crx38ppZO0-v8gfHXV_itw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6378A1006AA0;
 Tue, 25 Jan 2022 18:52:00 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6BD710A4B2C;
 Tue, 25 Jan 2022 18:51:14 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 2AD8A223DA6; Tue, 25 Jan 2022 13:51:14 -0500 (EST)
Date: Tue, 25 Jan 2022 13:51:14 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org, virtio-fs-list <virtio-fs@redhat.com>
Subject: [PATCH] virtiofsd: Drop membership of all supplementary groups
 (CVE-2022-0358)
Message-ID: <YfBGoriS38eBQrAb@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Miklos Szeredi <mszeredi@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 JIETAO XIAO <shawtao1125@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 P J P <pj.pandit@yahoo.co.in>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the start, drop membership of all supplementary groups. This is
not required.

If we have membership of "root" supplementary group and when we switch
uid/gid using setresuid/setsgid, we still retain membership of existing
supplemntary groups. And that can allow some operations which are not
normally allowed.

For example, if root in guest creates a dir as follows.

$ mkdir -m 03777 test_dir

This sets SGID on dir as well as allows unprivileged users to write into
this dir. 

And now as unprivileged user open file as follows.

$ su test
$ fd = open("test_dir/priviledge_id", O_RDWR|O_CREAT|O_EXCL, 02755);

This will create SGID set executable in test_dir/.

And that's a problem because now an unpriviliged user can execute it,
get egid=0 and get access to resources owned by "root" group. This is
privilege escalation.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2044863
Fixes: CVE-2022-0358
Reported-by: JIETAO XIAO <shawtao1125@gmail.com>
Suggested-by: Miklos Szeredi <mszeredi@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

Index: rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c
===================================================================
--- rhvgoyal-qemu.orig/tools/virtiofsd/passthrough_ll.c	2022-01-25 13:38:59.349534531 -0500
+++ rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c	2022-01-25 13:39:10.140177868 -0500
@@ -54,6 +54,7 @@
 #include <sys/wait.h>
 #include <sys/xattr.h>
 #include <syslog.h>
+#include <grp.h>
 
 #include "qemu/cutils.h"
 #include "passthrough_helpers.h"
@@ -1161,6 +1162,29 @@ static void lo_lookup(fuse_req_t req, fu
 #define OURSYS_setresuid SYS_setresuid
 #endif
 
+static void drop_supplementary_groups(void)
+{
+    int ret;
+
+    ret = getgroups(0, NULL);
+    if (ret == -1) {
+        fuse_log(FUSE_LOG_ERR, "getgroups() failed with error=%d:%s\n",
+                 errno, strerror(errno));
+        exit(1);
+    }
+
+    if (!ret)
+        return;
+
+    /* Drop all supplementary groups. We should not need it */
+    ret = setgroups(0, NULL);
+    if (ret == -1) {
+        fuse_log(FUSE_LOG_ERR, "setgroups() failed with error=%d:%s\n",
+                 errno, strerror(errno));
+        exit(1);
+    }
+}
+
 /*
  * Change to uid/gid of caller so that file is created with
  * ownership of caller.
@@ -3926,6 +3950,8 @@ int main(int argc, char *argv[])
 
     qemu_init_exec_dir(argv[0]);
 
+    drop_supplementary_groups();
+
     pthread_mutex_init(&lo.mutex, NULL);
     lo.inodes = g_hash_table_new(lo_key_hash, lo_key_equal);
     lo.root.fd = -1;


