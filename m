Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2503B33C583
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:25:43 +0100 (CET)
Received: from localhost ([::1]:44642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLruQ-0002ef-2c
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYO-00028O-Ll
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:02:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYL-0000Wo-UW
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/uHLEGvCG1f0K3tZ2b//O9keiLqt2WcVC28SzoejUKk=;
 b=d2bcEUtYXy4BUZ+Y0yWZx3I1keJiVj4mkfdP7/CDeUSLNu3kAbU2FzlVDFW6jCgUQNJ1dl
 ql3m088R5V6D3/FyVKkC5A+FddOvF/m4dspz7+lKtYAT/qRnkvArGS4tAHswCXKGt/KVCT
 17FgVesQdImozEp+G2Ds9PrfZxNMjfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-xN-N3z21Mwq45HnwxzaRCg-1; Mon, 15 Mar 2021 14:02:50 -0400
X-MC-Unique: xN-N3z21Mwq45HnwxzaRCg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75B3E1015C90;
 Mon, 15 Mar 2021 18:02:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A29521B49F;
 Mon, 15 Mar 2021 18:02:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 390F8180063C; Mon, 15 Mar 2021 19:02:41 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/13] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
Date: Mon, 15 Mar 2021 19:02:31 +0100
Message-Id: <20210315180240.1597240-5-kraxel@redhat.com>
In-Reply-To: <20210315180240.1597240-1-kraxel@redhat.com>
References: <20210315180240.1597240-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Thomas Huth <thuth@redhat.com>, libvir-list@redhat.com,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

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
Message-Id: <20210310173323.1422754-4-thuth@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-audio.c               | 1 -
 softmmu/vl.c                     | 2 --
 docs/system/deprecated.rst       | 9 ---------
 docs/system/removed-features.rst | 8 ++++++++
 4 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index e1486f81e06b..f5cb2467929a 100644
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
index b7673b96134d..a750dae6b1ef 100644
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
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 5e3a31c12361..62a64a8c41e1 100644
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
index 83148dcfda6a..82e7fcc51715 100644
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
 
-- 
2.29.2


