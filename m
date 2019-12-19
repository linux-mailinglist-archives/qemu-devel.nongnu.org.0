Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A2112622F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 13:32:18 +0100 (CET)
Received: from localhost ([::1]:40140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihuyX-00085w-2b
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 07:32:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33642)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ihurT-0008JY-6C
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:25:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ihurR-0000gR-SG
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:24:58 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23372
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ihurR-0000dQ-L1
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:24:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576758297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kp9bVNFjrivXHia4Yh8td83EMWOHenrJjacQknfP6M0=;
 b=B5k/h+3CRIxSxj078qUbOjD9d4+VMvd3Mh9Pl6VH8VZPmTcbpHJZCD0sKY6NG9rEHrkXLQ
 FksFvalZfo8adp3MZ4RMcyZFvOhC+dZDttRzrqjQvzz5HVb3TvDjh7bya8Gheqpap/rx5U
 aaNiEF+LyX32Vgzg9jqVNbccg+xlaRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-gWNlDfbmOq-l13EueBbpzw-1; Thu, 19 Dec 2019 07:24:54 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C7AA184BECC
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 12:24:53 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-55.ams2.redhat.com
 [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2625D60C18;
 Thu, 19 Dec 2019 12:24:47 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 109/132] meson: bsd-user
Date: Thu, 19 Dec 2019 13:23:29 +0100
Message-Id: <1576758232-12439-18-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
References: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: gWNlDfbmOq-l13EueBbpzw-1
X-Mimecast-Spam-Score: 0
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 Makefile.target        |  3 ---
 bsd-user/Makefile.objs |  2 --
 bsd-user/meson.build   | 10 ++++++++++
 meson.build            |  4 ++++
 4 files changed, 14 insertions(+), 5 deletions(-)
 delete mode 100644 bsd-user/Makefile.objs
 create mode 100644 bsd-user/meson.build

diff --git a/Makefile.target b/Makefile.target
index a8e6a28..0eca5f8 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -138,9 +138,6 @@ ifdef CONFIG_BSD_USER
 QEMU_CFLAGS+=3D-I$(SRC_PATH)/bsd-user -I$(SRC_PATH)/bsd-user/$(TARGET_ABI_=
DIR) \
 =09=09=09 -I$(SRC_PATH)/bsd-user/$(HOST_VARIANT_DIR)
=20
-obj-y +=3D bsd-user/
-obj-y +=3D gdbstub.o
-
 endif #CONFIG_BSD_USER
=20
 #########################################################
diff --git a/bsd-user/Makefile.objs b/bsd-user/Makefile.objs
deleted file mode 100644
index 5e77f57..0000000
--- a/bsd-user/Makefile.objs
+++ /dev/null
@@ -1,2 +0,0 @@
-obj-y =3D main.o bsdload.o elfload.o mmap.o signal.o strace.o syscall.o \
-=09        uaccess.o
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
new file mode 100644
index 0000000..0369549
--- /dev/null
+++ b/bsd-user/meson.build
@@ -0,0 +1,10 @@
+bsd_user_ss.add(files(
+  'bsdload.c',
+  'elfload.c',
+  'main.c',
+  'mmap.c',
+  'signal.c',
+  'strace.c',
+  'syscall.c',
+  'uaccess.c',
+))
diff --git a/meson.build b/meson.build
index 64cbab1..31c9591 100644
--- a/meson.build
+++ b/meson.build
@@ -646,8 +646,12 @@ subdir('hw')
 subdir('libdecnumber')
 subdir('target')
 subdir('accel')
+subdir('bsd-user')
 subdir('linux-user')
=20
+bsd_user_ss.add(files('gdbstub.c'))
+specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
+
 linux_user_ss.add(files('gdbstub.c', 'thunk.c'))
 specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
=20
--=20
1.8.3.1



