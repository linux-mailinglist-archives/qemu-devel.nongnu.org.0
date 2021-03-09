Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309C4332E96
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:57:41 +0100 (CET)
Received: from localhost ([::1]:42288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhY3-0003pT-S1
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJfZL-0008Pz-7V
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:50:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJfZH-0007Ea-JW
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:50:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615308645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UyLaexyIcmEmM/9dj1uEQm63OOZX/jLoR1cOpl3KgJ0=;
 b=RaAlthK75hJ1h4gWuMIGVXA+iJGw//Owy3kb8D8xeDK2FLXkv8Ca34ixdUB0TAtZryinYb
 rDK4N5TnZtpujDWTIpqXWKr6HHePTok1hig9D0QcbGMAi+554NrCKIqo6detGeSN/jSWOW
 7uFmR6XsChAAzGrQxG8eaJ0UgzS14B0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-Quka7XhQOJq1Jg2KIH6V7A-1; Tue, 09 Mar 2021 11:50:43 -0500
X-MC-Unique: Quka7XhQOJq1Jg2KIH6V7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87FB2101962D;
 Tue,  9 Mar 2021 16:50:42 +0000 (UTC)
Received: from thuth.com (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EC5A60854;
 Tue,  9 Mar 2021 16:50:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2] usb: Un-deprecate -usbdevice (except for -usbdevice audio
 which gets removed)
Date: Tue,  9 Mar 2021 17:50:35 +0100
Message-Id: <20210309165035.967853-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When trying to remove the -usbdevice option, there were complaints that
"-usbdevice braille" is still a very useful shortcut for some people.
Thus we never remove this option. Since it's not such a big burden to
keep it around, and it's also convenient in the sense that you don't
have to worry to enable a host controller explicitly with this option,
we should remove it from he deprecation list again, and rather properly
document the possible device for this option instead.

However, there is one exception: "-usbdevice audio" should go away, since
audio devices without "audiodev=..." parameter are also on the deprecation
list and you cannot use "-usbdevice audio" with "audiodev".

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Add an entry to removed-features.rst

 docs/system/deprecated.rst       |  9 --------
 docs/system/removed-features.rst |  8 +++++++
 hw/usb/dev-audio.c               |  1 -
 qemu-options.hx                  | 38 +++++++++++++++++++++++++++-----
 softmmu/vl.c                     |  2 --
 5 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index cfabe69846..816eb4084f 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -21,15 +21,6 @@ deprecated.
 System emulator command line arguments
 --------------------------------------
 
-``-usbdevice`` (since 2.10.0)
-'''''''''''''''''''''''''''''
-
-The ``-usbdevice DEV`` argument is now a synonym for setting
-the ``-device usb-DEV`` argument instead. The deprecated syntax
-would automatically enable USB support on the machine type.
-If using the new syntax, USB support must be explicitly
-enabled via the ``-machine usb=on`` argument.
-
 ``-drive file=json:{...{'driver':'file'}}`` (since 3.0)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index c8481cafbd..f8db76d0b5 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -38,6 +38,14 @@ or ``-display default,show-cursor=on`` instead.
 QEMU 5.0 introduced an alternative syntax to specify the size of the translation
 block cache, ``-accel tcg,tb-size=``.
 
+``-usbdevice audio`` (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''
+
+This option lacked the possibility to specify an audio backend device.
+Use ``-device usb-audio`` now instead (and specify a corresponding USB
+host controller if necessary).
+
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index e1486f81e0..f5cb246792 100644
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -1024,7 +1024,6 @@ static const TypeInfo usb_audio_info = {
 static void usb_audio_register_types(void)
 {
     type_register_static(&usb_audio_info);
-    usb_legacy_register(TYPE_USB_AUDIO, "audio", NULL);
 }
 
 type_init(usb_audio_register_types)
diff --git a/qemu-options.hx b/qemu-options.hx
index 90801286c6..cef8c2da57 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1705,7 +1705,7 @@ ERST
 
 DEFHEADING()
 
-DEFHEADING(USB options:)
+DEFHEADING(USB convenience options:)
 
 DEF("usb", 0, QEMU_OPTION_usb,
     "-usb            enable on-board USB host controller (if not enabled by default)\n",
@@ -1723,9 +1723,31 @@ DEF("usbdevice", HAS_ARG, QEMU_OPTION_usbdevice,
     QEMU_ARCH_ALL)
 SRST
 ``-usbdevice devname``
-    Add the USB device devname. Note that this option is deprecated,
-    please use ``-device usb-...`` instead. See the chapter about
+    Add the USB device devname, and enable an on-board USB controller
+    if possible and necessary (just like it can be done via
+    ``-machine usb=on``). Note that this option is mainly intended for
+    the user's convenience only. More fine-grained control can be
+    achieved by selecting a USB host controller (if necessary) and the
+    desired USB device via the ``-device`` option instead. For example,
+    instead of using ``-usbdevice mouse`` it is possible to use
+    ``-device qemu-xhci -device usb-mouse`` to connect the USB mouse
+    to a USB 3.0 controller instead (at least on machines that support
+    PCI and do not have an USB controller enabled by default yet).
+    For more details, see the chapter about
     :ref:`Connecting USB devices` in the System Emulation Users Guide.
+    Possible devices for devname are:
+
+    ``braille``
+        Braille device. This will use BrlAPI to display the braille
+        output on a real or fake device (i.e. it also creates a
+        corresponding ``braille`` chardev automatically beside the
+        ``usb-braille`` USB device).
+
+    ``ccid``
+        Smartcard reader device
+
+    ``keyboard``
+        Standard USB keyboard. Will override the PS/2 keyboard (if present).
 
     ``mouse``
         Virtual Mouse. This will override the PS/2 mouse emulation when
@@ -1737,9 +1759,13 @@ SRST
         position without having to grab the mouse. Also overrides the
         PS/2 mouse emulation when activated.
 
-    ``braille``
-        Braille device. This will use BrlAPI to display the braille
-        output on a real or fake device.
+    ``u2f-key``
+        U2F (Universal Second Factor) key.
+
+    ``wacom-tablet``
+        Wacom PenPartner USB tablet.
+
+
 ERST
 
 DEFHEADING()
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ff488ea3e7..76ebe7bb7a 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3180,8 +3180,6 @@ void qemu_init(int argc, char **argv, char **envp)
                 qemu_opts_parse_noisily(olist, "usb=on", false);
                 break;
             case QEMU_OPTION_usbdevice:
-                error_report("'-usbdevice' is deprecated, please use "
-                             "'-device usb-...' instead");
                 olist = qemu_find_opts("machine");
                 qemu_opts_parse_noisily(olist, "usb=on", false);
                 add_device_config(DEV_USB, optarg);
-- 
2.27.0


