Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9279957FD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 09:14:27 +0200 (CEST)
Received: from localhost ([::1]:33884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzyLa-00041N-Pw
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 03:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42556)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1hzy8J-0005XQ-Fh
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:00:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hzy8E-00036k-H3
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:00:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42240)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hzy8E-00035v-99
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:00:38 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 79809195DB89
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 07:00:37 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-20.ams2.redhat.com
 [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FDEF11C9BA;
 Tue, 20 Aug 2019 07:00:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 08:59:28 +0200
Message-Id: <1566284395-30287-10-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1566284395-30287-1-git-send-email-pbonzini@redhat.com>
References: <1566284395-30287-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Tue, 20 Aug 2019 07:00:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 09/36] 9p: simplify source file selection
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

Express the complex conditions in Kconfig rather than Makefiles, since Kc=
onfig
is better suited at expressing dependencies and detecting contradictions.

Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Kconfig.host        | 1 +
 fsdev/Makefile.objs | 2 +-
 hw/9pfs/Kconfig     | 5 +++++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Kconfig.host b/Kconfig.host
index aec9536..bb6e116 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -28,6 +28,7 @@ config VHOST_USER
=20
 config XEN
     bool
+    select FSDEV_9P if VIRTFS
=20
 config VIRTFS
     bool
diff --git a/fsdev/Makefile.objs b/fsdev/Makefile.objs
index 24bbb3e..42cd70c 100644
--- a/fsdev/Makefile.objs
+++ b/fsdev/Makefile.objs
@@ -1,6 +1,6 @@
 # Lots of the fsdev/9pcode is pulled in by vl.c via qemu_fsdev_add.
 # only pull in the actual 9p backend if we also enabled virtio or xen.
-ifeq ($(call land,$(CONFIG_VIRTFS),$(call lor,$(CONFIG_VIRTIO_9P),$(CONF=
IG_XEN))),y)
+ifeq ($(CONFIG_FSDEV_9P),y)
 common-obj-y =3D qemu-fsdev.o 9p-marshal.o 9p-iov-marshal.o
 else
 common-obj-y =3D qemu-fsdev-dummy.o
diff --git a/hw/9pfs/Kconfig b/hw/9pfs/Kconfig
index 8c5032c..3ae5749 100644
--- a/hw/9pfs/Kconfig
+++ b/hw/9pfs/Kconfig
@@ -1,4 +1,9 @@
+config FSDEV_9P
+    bool
+    depends on VIRTFS
+
 config VIRTIO_9P
     bool
     default y
     depends on VIRTFS && VIRTIO
+    select FSDEV_9P
--=20
1.8.3.1



