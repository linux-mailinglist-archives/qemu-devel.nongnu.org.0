Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAB8143DAB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:08:37 +0100 (CET)
Received: from localhost ([::1]:53558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ittGm-00077W-Fy
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51939)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itseY-0000Wq-GT
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:29:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itseT-0003Qq-TR
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:29:06 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25349
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itseT-0003QR-NS
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7li2MZz/6GD/atRC2r5V09Pr3cVclJRnNhxTF3shws=;
 b=etnFFe259Xm0k4kKvnevqak/sotAaGOZaqu1ryE6B4SLpp1w45GLzF7BslOwnM9LghGDP3
 AJh6+HNUgIrWy52pM5RofWnNM+cH9sXeGhCJJedxMN/hircjpU6K8pT8DnwRRQj8vYmuqu
 5iEbSrP/XVXKn6PoeqNSYiawqIWWFSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-eSKWYJ77P0aVIzcV4c3HJA-1; Tue, 21 Jan 2020 07:28:59 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A43CD107ACC7;
 Tue, 21 Jan 2020 12:28:58 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B24660BE0;
 Tue, 21 Jan 2020 12:28:56 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 055/109] virtiofsd: set maximum RLIMIT_NOFILE limit
Date: Tue, 21 Jan 2020 12:23:39 +0000
Message-Id: <20200121122433.50803-56-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: eSKWYJ77P0aVIzcV4c3HJA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

virtiofsd can exceed the default open file descriptor limit easily on
most systems.  Take advantage of the fact that it runs as root to raise
the limit.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 3f7ec85938..7257a4a512 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -52,6 +52,7 @@
 #include <sys/file.h>
 #include <sys/mount.h>
 #include <sys/prctl.h>
+#include <sys/resource.h>
 #include <sys/syscall.h>
 #include <sys/types.h>
 #include <sys/wait.h>
@@ -2267,6 +2268,35 @@ static void setup_sandbox(struct lo_data *lo, struct=
 fuse_session *se)
     setup_seccomp();
 }
=20
+/* Raise the maximum number of open file descriptors */
+static void setup_nofile_rlimit(void)
+{
+    const rlim_t max_fds =3D 1000000;
+    struct rlimit rlim;
+
+    if (getrlimit(RLIMIT_NOFILE, &rlim) < 0) {
+        fuse_log(FUSE_LOG_ERR, "getrlimit(RLIMIT_NOFILE): %m\n");
+        exit(1);
+    }
+
+    if (rlim.rlim_cur >=3D max_fds) {
+        return; /* nothing to do */
+    }
+
+    rlim.rlim_cur =3D max_fds;
+    rlim.rlim_max =3D max_fds;
+
+    if (setrlimit(RLIMIT_NOFILE, &rlim) < 0) {
+        /* Ignore SELinux denials */
+        if (errno =3D=3D EPERM) {
+            return;
+        }
+
+        fuse_log(FUSE_LOG_ERR, "setrlimit(RLIMIT_NOFILE): %m\n");
+        exit(1);
+    }
+}
+
 int main(int argc, char *argv[])
 {
     struct fuse_args args =3D FUSE_ARGS_INIT(argc, argv);
@@ -2388,6 +2418,8 @@ int main(int argc, char *argv[])
=20
     fuse_daemonize(opts.foreground);
=20
+    setup_nofile_rlimit();
+
     /* Must be before sandbox since it wants /proc */
     setup_capng();
=20
--=20
2.24.1


