Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6306F3B9334
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 16:23:50 +0200 (CEST)
Received: from localhost ([::1]:39746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyxbZ-00011p-8w
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 10:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxUx-0005qR-Lb
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:16:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxUv-0006GW-4d
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625149016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bsA2HH6yfLKkqV4WkmgRRh9p9oulko4q1HRmnuira8c=;
 b=LuYoHHS3gGVuFcf5EmSIgilIk9ZcaqT1rWGn7QCObK4rlrh2HHNytKuPz8Iu8+IfCJsp+y
 zIoRAARgLYclLOBi8m/LVeXEpwZIiilOrTYJFQfAeYOw5wS5IilpdHQCjCp1gntbG7rof1
 pWsYFyGk53nkMkO3AT6+vlRPLW9xjTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-y91MN88ROJmLOV6NCjmy0w-1; Thu, 01 Jul 2021 10:16:54 -0400
X-MC-Unique: y91MN88ROJmLOV6NCjmy0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FFD6800D55;
 Thu,  1 Jul 2021 14:16:53 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-230.ams2.redhat.com
 [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 215FE60862;
 Thu,  1 Jul 2021 14:16:50 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 10/20] virtiofsd: Don't allow file creation with FUSE_OPEN
Date: Thu,  1 Jul 2021 15:15:35 +0100
Message-Id: <20210701141545.193571-11-dgilbert@redhat.com>
In-Reply-To: <20210701141545.193571-1-dgilbert@redhat.com>
References: <20210701141545.193571-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: leobras@redhat.com, stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

A well behaved FUSE client uses FUSE_CREATE to create files. It isn't
supposed to pass O_CREAT along a FUSE_OPEN request, as documented in
the "fuse_lowlevel.h" header :

    /**
     * Open a file
     *
     * Open flags are available in fi->flags. The following rules
     * apply.
     *
     *  - Creation (O_CREAT, O_EXCL, O_NOCTTY) flags will be
     *    filtered out / handled by the kernel.

But if the client happens to do it anyway, the server ends up passing
this flag to open() without the mandatory mode_t 4th argument. Since
open() is a variadic function, glibc will happily pass whatever it
finds on the stack to the syscall. If this file is compiled with
-D_FORTIFY_SOURCE=2, glibc will even detect that and abort:

*** invalid openat64 call: O_CREAT or O_TMPFILE without mode ***: terminated

Specifying O_CREAT with FUSE_OPEN is a protocol violation. Check this
in do_open(), print out a message and return an error to the client,
EINVAL like we already do when fuse_mbuf_iter_advance() fails.

The FUSE filesystem doesn't currently support O_TMPFILE, but the very
same would happen if O_TMPFILE was passed in a FUSE_OPEN request. Check
that as well.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210624101809.48032-1-groug@kaod.org>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 7fe2cef1eb..3d725bcba2 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1084,6 +1084,12 @@ static void do_open(fuse_req_t req, fuse_ino_t nodeid,
         return;
     }
 
+    /* File creation is handled by do_create() or do_mknod() */
+    if (arg->flags & (O_CREAT | O_TMPFILE)) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
     memset(&fi, 0, sizeof(fi));
     fi.flags = arg->flags;
     fi.kill_priv = arg->open_flags & FUSE_OPEN_KILL_SUIDGID;
-- 
2.31.1


