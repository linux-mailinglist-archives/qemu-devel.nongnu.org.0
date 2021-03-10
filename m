Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB333455D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:46:40 +0100 (CET)
Received: from localhost ([::1]:34670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2ut-0001lW-KG
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK2iU-0007vg-5e
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:33:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK2iS-0006zb-7W
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:33:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615397627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESwvUl8BPHoSVP5Q/+iTnqilXi27SdTEHWwvSZi2vzQ=;
 b=YJmU5PRW0nBhwZp7vXDR04jYQSjXIm2IDYh4KT4nFKEL34TTWr/YeTrK937XRqQ0BO1fiG
 GxHDV1Eveg8k9TfWo5Fgy1JamxCxy/XG+ccMIe+SC7cQQ3WVVomc0/6Tv9/V8xBTpGtQWu
 5IGVajHOUh3ERmViKbWlDcGD7XJVxkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-8BjV5uE5Pc-GOcDirYs29w-1; Wed, 10 Mar 2021 12:33:42 -0500
X-MC-Unique: 8BjV5uE5Pc-GOcDirYs29w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 689B5801817;
 Wed, 10 Mar 2021 17:33:41 +0000 (UTC)
Received: from thuth.com (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15E0C60C13;
 Wed, 10 Mar 2021 17:33:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 3/4] usb: Un-deprecate -usbdevice (except for -usbdevice audio
 which gets removed)
Date: Wed, 10 Mar 2021 18:33:22 +0100
Message-Id: <20210310173323.1422754-4-thuth@redhat.com>
In-Reply-To: <20210310173323.1422754-1-thuth@redhat.com>
References: <20210310173323.1422754-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When trying to remove the -usbdevice option, there were complaints that
"-usbdevice braille" is still a very useful shortcut for some people.
Thus we never remove this option. Since it's not such a big burden to
keep it around, and it's also convenient in the sense that you don't
have to worry to enable a host controller explicitly with this option,
we should remove it from he deprecation list again.

However, there is one exception: "-usbdevice audio" should go away, since
audio devices without "audiodev=..." parameter are also on the deprecation
list and you cannot use "-usbdevice audio" with "audiodev".

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/deprecated.rst       | 9 ---------
 docs/system/removed-features.rst | 8 ++++++++
 hw/usb/dev-audio.c               | 1 -
 softmmu/vl.c                     | 2 --
 4 files changed, 8 insertions(+), 12 deletions(-)

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
index c8481cafbd..ea28904e5f 100644
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
+host controller or ``-usb`` if necessary).
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


