Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9B81876FD
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 01:42:59 +0100 (CET)
Received: from localhost ([::1]:50834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE0Ju-0005uA-6G
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 20:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41337)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1jE0ID-0003wc-UU
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 20:41:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1jE0IC-0004mU-TR
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 20:41:13 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:52914)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1jE0IC-0004l3-Py
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 20:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584405672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLa6eitOwlPcvI4d6A5bsj3e19wXpoPcdEFbZBp//fg=;
 b=M1GAFeM7hGyNiY+znjFBngRITNF0weeGZe61uJmn2ui1U2T51F3ZyXbXyACxIV/xORvpY+
 xi/uwmdWCWoR8HCtcJtsREuXps6KGNibLEzLNV1ZmMs9mIMo/lR8wBOd2SkOfM7sJ6IipJ
 nPidecc9y/KAf9XkDFkmZbVcYuJ2sQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-2JQSjWFLNiuMigPGz8R5Lw-1; Mon, 16 Mar 2020 20:41:10 -0400
X-MC-Unique: 2JQSjWFLNiuMigPGz8R5Lw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A31631804549;
 Tue, 17 Mar 2020 00:41:09 +0000 (UTC)
Received: from probe.redhat.com (ovpn-112-191.rdu2.redhat.com [10.10.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BEC993531;
 Tue, 17 Mar 2020 00:41:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 02/11] iotests: don't use 'format' for drive_add
Date: Mon, 16 Mar 2020 20:40:56 -0400
Message-Id: <20200317004105.27059-3-jsnow@redhat.com>
In-Reply-To: <20200317004105.27059-1-jsnow@redhat.com>
References: <20200317004105.27059-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, ehabkost@redhat.com, qemu-block@nongnu.org,
 philmd@redhat.com, armbru@redhat.com, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It shadows (with a different type) the built-in format.
Use something else.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/055        | 3 ++-
 tests/qemu-iotests/iotests.py | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/055 b/tests/qemu-iotests/055
index 82b9f5f47d..4175fff5e4 100755
--- a/tests/qemu-iotests/055
+++ b/tests/qemu-iotests/055
@@ -469,7 +469,8 @@ class TestDriveCompression(iotests.QMPTestCase):
         qemu_img('create', '-f', fmt, blockdev_target_img,
                  str(TestDriveCompression.image_len), *args)
         if attach_target:
-            self.vm.add_drive(blockdev_target_img, format=3Dfmt, interface=
=3D"none")
+            self.vm.add_drive(blockdev_target_img,
+                              img_format=3Dfmt, interface=3D"none")
=20
         self.vm.launch()
=20
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index c6d9ae130d..a6b2889932 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -482,21 +482,21 @@ def add_drive_raw(self, opts):
         self._args.append(opts)
         return self
=20
-    def add_drive(self, path, opts=3D'', interface=3D'virtio', format=3Dim=
gfmt):
+    def add_drive(self, path, opts=3D'', interface=3D'virtio', img_format=
=3Dimgfmt):
         '''Add a virtio-blk drive to the VM'''
         options =3D ['if=3D%s' % interface,
                    'id=3Ddrive%d' % self._num_drives]
=20
         if path is not None:
             options.append('file=3D%s' % path)
-            options.append('format=3D%s' % format)
+            options.append('format=3D%s' % img_format)
             options.append('cache=3D%s' % cachemode)
             options.append('aio=3D%s' % aiomode)
=20
         if opts:
             options.append(opts)
=20
-        if format =3D=3D 'luks' and 'key-secret' not in opts:
+        if img_format =3D=3D 'luks' and 'key-secret' not in opts:
             # default luks support
             if luks_default_secret_object not in self._args:
                 self.add_object(luks_default_secret_object)
--=20
2.21.1


