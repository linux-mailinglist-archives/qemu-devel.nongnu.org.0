Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65B8323E6F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:40:59 +0100 (CET)
Received: from localhost ([::1]:55584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEuPS-0003Xk-PV
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEu34-0005lI-4P
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:17:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEu2y-0006s4-AQ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:17:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614172663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oypxNtzraYDLXzirYnap4GAZprBPwtAniiaXz4f/554=;
 b=YXdApwFMnMcf4R/JI3+0GL8c5L3bMn5bD7mv1ZVMt66Q/xQ8oXm0+bWA5u36hrJNAaY0JP
 L2HfpPfMrgN32yKLhQi81z9Co/O3RVcWvYxvYNpQSiszOdCmYKRaqqqCoVp9TRFWxS4mnc
 DIG1r1d8gu+OLbyJXoMORL08GDQkKy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-w2wdyUCbOL6MoyhqwSeqaQ-1; Wed, 24 Feb 2021 08:17:40 -0500
X-MC-Unique: w2wdyUCbOL6MoyhqwSeqaQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58C6B1020C27;
 Wed, 24 Feb 2021 13:17:38 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-119.ams2.redhat.com
 [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86D7A10016F6;
 Wed, 24 Feb 2021 13:17:14 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/14] block: remove support for using "file" driver with
 block/char devices
Date: Wed, 24 Feb 2021 13:11:42 +0000
Message-Id: <20210224131142.1952027-15-berrange@redhat.com>
In-Reply-To: <20210224131142.1952027-1-berrange@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'host_device' and 'host_cdrom' drivers must be used instead.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/file-posix.c               | 17 ++++++-----------
 docs/system/deprecated.rst       |  7 -------
 docs/system/removed-features.rst |  7 +++++++
 tests/qemu-iotests/226.out       | 10 +++++-----
 4 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 05079b40ca..20e14f8e96 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -719,15 +719,9 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
     }
 
     if (!device) {
-        if (S_ISBLK(st.st_mode)) {
-            warn_report("Opening a block device as a file using the '%s' "
-                        "driver is deprecated", bs->drv->format_name);
-        } else if (S_ISCHR(st.st_mode)) {
-            warn_report("Opening a character device as a file using the '%s' "
-                        "driver is deprecated", bs->drv->format_name);
-        } else if (!S_ISREG(st.st_mode)) {
-            error_setg(errp, "A regular file was expected by the '%s' driver, "
-                       "but something else was given", bs->drv->format_name);
+        if (!S_ISREG(st.st_mode)) {
+            error_setg(errp, "'%s' driver requires '%s' to be a regular file",
+                       bs->drv->format_name, bs->filename);
             ret = -EINVAL;
             goto fail;
         } else {
@@ -736,8 +730,9 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
         }
     } else {
         if (!(S_ISCHR(st.st_mode) || S_ISBLK(st.st_mode))) {
-            error_setg(errp, "'%s' driver expects either "
-                       "a character or block device", bs->drv->format_name);
+            error_setg(errp, "'%s' driver requires '%s' to be either "
+                       "a character or block device",
+                       bs->drv->format_name, bs->filename);
             ret = -EINVAL;
             goto fail;
         }
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index dc76584e02..3a86deb450 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -21,13 +21,6 @@ deprecated.
 System emulator command line arguments
 --------------------------------------
 
-``-drive file=json:{...{'driver':'file'}}`` (since 3.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The 'file' driver for drives is no longer appropriate for character or host
-devices and will only accept regular files (S_IFREG). The correct driver
-for these file types is 'host_cdrom' or 'host_device' as appropriate.
-
 ``QEMU_AUDIO_`` environment variables and ``-audio-help`` (since 4.0)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 990bf7e015..1c9e384cb0 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -59,6 +59,13 @@ would automatically enable USB support on the machine type.
 When using the new syntax, USB support must be explicitly
 enabled via the ``-machine usb=on`` argument.
 
+``-drive file=json:{...{'driver':'file'}}`` (removed 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The 'file' driver for drives is no longer appropriate for character or host
+devices and will only accept regular files (S_IFREG). The correct driver
+for these file types is 'host_cdrom' or 'host_device' as appropriate.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/tests/qemu-iotests/226.out b/tests/qemu-iotests/226.out
index 42be973ff2..55504d29c4 100644
--- a/tests/qemu-iotests/226.out
+++ b/tests/qemu-iotests/226.out
@@ -3,23 +3,23 @@ QA output created by 226
 === Testing with driver:file ===
 
 == Testing RO ==
-qemu-io: can't open: A regular file was expected by the 'file' driver, but something else was given
-qemu-io: warning: Opening a character device as a file using the 'file' driver is deprecated
+qemu-io: can't open: 'file' driver requires 'TEST_DIR/t.IMGFMT' to be a regular file
+qemu-io: can't open: 'file' driver requires '/dev/null' to be a regular file
 == Testing RW ==
 qemu-io: can't open: Could not open 'TEST_DIR/t.IMGFMT': Is a directory
-qemu-io: warning: Opening a character device as a file using the 'file' driver is deprecated
+qemu-io: can't open: 'file' driver requires '/dev/null' to be a regular file
 
 === Testing with driver:host_device ===
 
 == Testing RO ==
-qemu-io: can't open: 'host_device' driver expects either a character or block device
+qemu-io: can't open: 'host_device' driver requires 'TEST_DIR/t.IMGFMT' to be either a character or block device
 == Testing RW ==
 qemu-io: can't open: Could not open 'TEST_DIR/t.IMGFMT': Is a directory
 
 === Testing with driver:host_cdrom ===
 
 == Testing RO ==
-qemu-io: can't open: 'host_cdrom' driver expects either a character or block device
+qemu-io: can't open: 'host_cdrom' driver requires 'TEST_DIR/t.IMGFMT' to be either a character or block device
 == Testing RW ==
 qemu-io: can't open: Could not open 'TEST_DIR/t.IMGFMT': Is a directory
 
-- 
2.29.2


