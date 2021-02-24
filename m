Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD95F323E05
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:26:23 +0100 (CET)
Received: from localhost ([::1]:43146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEuBK-0003Hy-S1
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEtzD-0002m6-S1
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:13:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEtz5-00059c-75
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:13:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614172422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AxBoh4lolgLfXpFW+Uw/kgKyoRvdfkcVOv8fk3PBqO8=;
 b=SjUrt9ySJOvaU0zIWM9WdiP/OGo98iNRfyiU1brAst6UMMXggjELn0WDG6wKyrRGRFIog/
 Mh6oLJy1lQwMH0IAdvspvXf4Sa7RWorMRAkDexxkGwVKfY8uW3T3CXgVW9q0qckZklrK3j
 0J25DrGioA68m5lUz28QcvEy3jEn+10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-mb8b5Go_NM2pXsbyC09Z1A-1; Wed, 24 Feb 2021 08:13:39 -0500
X-MC-Unique: mb8b5Go_NM2pXsbyC09Z1A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3519107ACE4;
 Wed, 24 Feb 2021 13:13:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-119.ams2.redhat.com
 [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AC591001281;
 Wed, 24 Feb 2021 13:13:16 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/14] softmmu: remove '-usbdevice' command line option
Date: Wed, 24 Feb 2021 13:11:32 +0000
Message-Id: <20210224131142.1952027-5-berrange@redhat.com>
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

This was replaced by the '-device usb-DEV' option.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/deprecated.rst       |  9 -------
 docs/system/removed-features.rst |  9 +++++++
 softmmu/vl.c                     | 42 --------------------------------
 3 files changed, 9 insertions(+), 51 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 611adf60f7..c577cc97c4 100644
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
index dc63581fe5..74d022babf 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -50,6 +50,15 @@ by the ``tls-authz`` and ``sasl-authz`` options.
 The ``pretty=on|off`` switch has no effect for HMP monitors and
 its use is rejected.
 
+``-usbdevice`` (removed in 6.0)
+'''''''''''''''''''''''''''''''
+
+The ``-usbdevice DEV`` argument was now a synonym for setting
+the ``-device usb-DEV`` argument instead. The removed syntax
+would automatically enable USB support on the machine type.
+When using the new syntax, USB support must be explicitly
+enabled via the ``-machine usb=on`` argument.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index b219ce1f35..c31061cc09 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -743,34 +743,6 @@ static void configure_msg(QemuOpts *opts)
 }
 
 
-/***********************************************************/
-/* USB devices */
-
-static int usb_device_add(const char *devname)
-{
-    USBDevice *dev = NULL;
-
-    if (!machine_usb(current_machine)) {
-        return -1;
-    }
-
-    dev = usbdevice_create(devname);
-    if (!dev)
-        return -1;
-
-    return 0;
-}
-
-static int usb_parse(const char *cmdline)
-{
-    int r;
-    r = usb_device_add(cmdline);
-    if (r < 0) {
-        error_report("could not add USB device '%s'", cmdline);
-    }
-    return r;
-}
-
 /***********************************************************/
 /* machine registration */
 
@@ -1267,7 +1239,6 @@ static void monitor_parse(const char *optarg, const char *mode, bool pretty)
 
 struct device_config {
     enum {
-        DEV_USB,       /* -usbdevice     */
         DEV_SERIAL,    /* -serial        */
         DEV_PARALLEL,  /* -parallel      */
         DEV_DEBUGCON,  /* -debugcon */
@@ -2484,12 +2455,6 @@ static void qemu_create_cli_devices(void)
     qemu_opts_foreach(qemu_find_opts("fw_cfg"),
                       parse_fw_cfg, fw_cfg_find(), &error_fatal);
 
-    /* init USB devices */
-    if (machine_usb(current_machine)) {
-        if (foreach_device_config(DEV_USB, usb_parse) < 0)
-            exit(1);
-    }
-
     /* init generic devices */
     rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
     qemu_opts_foreach(qemu_find_opts("device"),
@@ -3182,13 +3147,6 @@ void qemu_init(int argc, char **argv, char **envp)
                 olist = qemu_find_opts("machine");
                 qemu_opts_parse_noisily(olist, "usb=on", false);
                 break;
-            case QEMU_OPTION_usbdevice:
-                error_report("'-usbdevice' is deprecated, please use "
-                             "'-device usb-...' instead");
-                olist = qemu_find_opts("machine");
-                qemu_opts_parse_noisily(olist, "usb=on", false);
-                add_device_config(DEV_USB, optarg);
-                break;
             case QEMU_OPTION_device:
                 if (!qemu_opts_parse_noisily(qemu_find_opts("device"),
                                              optarg, true)) {
-- 
2.29.2


