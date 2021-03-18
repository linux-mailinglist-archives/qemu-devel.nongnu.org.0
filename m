Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8888234023B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:39:10 +0100 (CET)
Received: from localhost ([::1]:39130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMp7V-0000it-Jw
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMp0L-0007j7-It
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMp0D-0003aO-LI
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616059897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OuwoOMezitus7BBNFbdAJmKNupzsz77z9WUDoTQTwOk=;
 b=YuOxMaxHg3v+DKcdDFzne7DUbMc3Co20oKbuwCpI/dTICA09yi9Vhw045pLOCZRm2bkbqh
 OWyN+nFlK/yGlBEl5pd7vaaZCUf4UwHmld8fQXZSzvUUNJOEmojA+8W5c391eE4gCmK0Nm
 eSPKwQQjq3tzSA0W6Wje9iXCRsOTHmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-_UcZZe7ZO_6VPnO5dL_g9A-1; Thu, 18 Mar 2021 05:31:35 -0400
X-MC-Unique: _UcZZe7ZO_6VPnO5dL_g9A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B74D710866A6;
 Thu, 18 Mar 2021 09:31:33 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-61.ams2.redhat.com
 [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB6CC62951;
 Thu, 18 Mar 2021 09:31:11 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/13] block: remove support for using "file" driver with
 block/char devices
Date: Thu, 18 Mar 2021 09:25:12 +0000
Message-Id: <20210318092512.250725-14-berrange@redhat.com>
In-Reply-To: <20210318092512.250725-1-berrange@redhat.com>
References: <20210318092512.250725-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Reviewed-by: Eric Blake <eblake@redhat.com>
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
index c7e80fa731..d5e80d66eb 100644
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
index d164d3f290..bff16b7b05 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -57,6 +57,13 @@ by the ``tls-authz`` and ``sasl-authz`` options.
 The ``pretty=on|off`` switch has no effect for HMP monitors and
 its use is rejected.
 
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
2.30.2


