Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01F2146913
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 14:29:52 +0100 (CET)
Received: from localhost ([::1]:57042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iucYR-0005AK-BE
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 08:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40377)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iub8t-00026S-L8
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iub8s-00053S-FH
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23880
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iub8s-00052u-AT
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KqDg9C7PF4ZP+PGW/TCsORhZSISTuzgb3iowwgktUSs=;
 b=YBWsk20Tzk+Hxy2gN4YBKwqOg5fP8win4nl2meM0fyReNiTFzSfY7r/kbAuMGksRsSvnsi
 JY6cCnzo138JYs1S7IvlNdlo6QXFSCPvljb2YoRQdEb82UDilgfxR1LUAhVElbzj698HXC
 uHKNCqlloU0ONLPliqADKHgqJ82VkLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-p7YqjeWKPGKoqUIokZdycw-1; Thu, 23 Jan 2020 06:59:19 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3E421088398
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:59:18 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 162E01CB;
 Thu, 23 Jan 2020 11:59:17 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 027/111] virtiofsd: Add Makefile wiring for virtiofsd contrib
Date: Thu, 23 Jan 2020 11:57:17 +0000
Message-Id: <20200123115841.138849-28-dgilbert@redhat.com>
In-Reply-To: <20200123115841.138849-1-dgilbert@redhat.com>
References: <20200123115841.138849-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: p7YqjeWKPGKoqUIokZdycw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Wire up the building of the virtiofsd in tools.

virtiofsd relies on Linux-specific system calls and seccomp.  Anyone
wishing to port it to other host operating systems should do so
carefully and without reducing security.

Only allow building on Linux hosts.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 Makefile                      | 10 ++++++++++
 Makefile.objs                 |  1 +
 tools/virtiofsd/Makefile.objs |  9 +++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 tools/virtiofsd/Makefile.objs

diff --git a/Makefile b/Makefile
index 6562b0dc97..ef1e2155a7 100644
--- a/Makefile
+++ b/Makefile
@@ -327,6 +327,10 @@ HELPERS-y +=3D vhost-user-gpu$(EXESUF)
 vhost-user-json-y +=3D contrib/vhost-user-gpu/50-qemu-gpu.json
 endif
=20
+ifdef CONFIG_LINUX
+HELPERS-y +=3D virtiofsd$(EXESUF)
+endif
+
 # Sphinx does not allow building manuals into the same directory as
 # the source files, so if we're doing an in-tree QEMU build we must
 # build the manuals into a subdirectory (and then install them from
@@ -429,6 +433,7 @@ dummy :=3D $(call unnest-vars,, \
                 elf2dmp-obj-y \
                 ivshmem-client-obj-y \
                 ivshmem-server-obj-y \
+                virtiofsd-obj-y \
                 rdmacm-mux-obj-y \
                 libvhost-user-obj-y \
                 vhost-user-scsi-obj-y \
@@ -668,6 +673,11 @@ rdmacm-mux$(EXESUF): LIBS +=3D "-libumad"
 rdmacm-mux$(EXESUF): $(rdmacm-mux-obj-y) $(COMMON_LDADDS)
 =09$(call LINK, $^)
=20
+ifdef CONFIG_LINUX # relies on Linux-specific syscalls
+virtiofsd$(EXESUF): $(virtiofsd-obj-y) libvhost-user.a $(COMMON_LDADDS)
+=09$(call LINK, $^)
+endif
+
 vhost-user-gpu$(EXESUF): $(vhost-user-gpu-obj-y) $(libvhost-user-obj-y) li=
bqemuutil.a libqemustub.a
 =09$(call LINK, $^)
=20
diff --git a/Makefile.objs b/Makefile.objs
index 7c1e50f9d6..ff396b9209 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -123,6 +123,7 @@ vhost-user-blk-obj-y =3D contrib/vhost-user-blk/
 rdmacm-mux-obj-y =3D contrib/rdmacm-mux/
 vhost-user-input-obj-y =3D contrib/vhost-user-input/
 vhost-user-gpu-obj-y =3D contrib/vhost-user-gpu/
+virtiofsd-obj-y =3D tools/virtiofsd/
=20
 ######################################################################
 trace-events-subdirs =3D
diff --git a/tools/virtiofsd/Makefile.objs b/tools/virtiofsd/Makefile.objs
new file mode 100644
index 0000000000..45a807500d
--- /dev/null
+++ b/tools/virtiofsd/Makefile.objs
@@ -0,0 +1,9 @@
+virtiofsd-obj-y =3D buffer.o \
+                  fuse_opt.o \
+                  fuse_log.o \
+                  fuse_lowlevel.o \
+                  fuse_signals.o \
+                  fuse_virtio.o \
+                  helper.o \
+                  passthrough_ll.o
+
--=20
2.24.1


