Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C03C126220
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 13:27:05 +0100 (CET)
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihutU-0001B5-1I
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 07:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ihuqZ-00072Y-7W
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:24:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ihuqX-0004nT-5b
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:24:03 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44760
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ihuqX-0004ke-05
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576758240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WVXbid35KLws+AfB3oSlHwXeeDXkukkWUfCDFEoAIkU=;
 b=Onwl0wlBwoKfL/1MbYncrvi/EL6qwVtVkDRtniheUjFCrYLLZaxu8aaND79G6iE2OiThmd
 TmELREmd/4TZZEWkkJpTFB7OZxzxIwZpoXaeCyNLuk3G/VqjpqwlMbhKDYbo1c6EKVYyTJ
 saC14fR6hbbV8xeaDvQCU2UEJLMCpqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-pwOb-QWfM0yDRc2nGZlcJw-1; Thu, 19 Dec 2019 07:23:59 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E279800D41
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 12:23:58 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-55.ams2.redhat.com
 [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A95F160C81;
 Thu, 19 Dec 2019 12:23:54 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 092/132] meson: convert hw/hyperv
Date: Thu, 19 Dec 2019 13:23:12 +0100
Message-Id: <1576758232-12439-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
References: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: pwOb-QWfM0yDRc2nGZlcJw-1
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
 hw/Makefile.objs        | 1 -
 hw/hyperv/Makefile.objs | 2 --
 hw/hyperv/meson.build   | 2 ++
 hw/meson.build          | 1 +
 4 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 hw/hyperv/Makefile.objs
 create mode 100644 hw/hyperv/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 0213b1b..2ca159e 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -10,7 +10,6 @@ devices-dirs-y +=3D cpu/
 devices-dirs-y +=3D display/
 devices-dirs-y +=3D dma/
 devices-dirs-y +=3D gpio/
-devices-dirs-$(CONFIG_HYPERV) +=3D hyperv/
 endif
=20
 common-obj-y +=3D $(devices-dirs-y)
diff --git a/hw/hyperv/Makefile.objs b/hw/hyperv/Makefile.objs
deleted file mode 100644
index edaca2f..0000000
--- a/hw/hyperv/Makefile.objs
+++ /dev/null
@@ -1,2 +0,0 @@
-obj-y +=3D hyperv.o
-obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
diff --git a/hw/hyperv/meson.build b/hw/hyperv/meson.build
new file mode 100644
index 0000000..98663ec
--- /dev/null
+++ b/hw/hyperv/meson.build
@@ -0,0 +1,2 @@
+specific_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'))
+specific_ss.add(when: 'CONFIG_HYPERV_TESTDEV', if_true: files('hyperv_test=
dev.c'))
diff --git a/hw/meson.build b/hw/meson.build
index e59ed44..bfd4d59 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,4 +1,5 @@
 subdir('core')
+subdir('hyperv')
 subdir('i2c')
 subdir('ide')
 subdir('input')
--=20
1.8.3.1



