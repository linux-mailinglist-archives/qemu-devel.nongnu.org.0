Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CBE48C59C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:07:46 +0100 (CET)
Received: from localhost ([::1]:54236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eHw-00036T-K0
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:07:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7cdy-0006Z6-01
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:22:22 -0500
Received: from [2a00:1450:4864:20::12a] (port=37728
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7cdw-0003hE-4A
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:22:21 -0500
Received: by mail-lf1-x12a.google.com with SMTP id m1so7498269lfq.4
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 04:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hygyTQG20T7lGw7x3mWCQVwIbOAsgrqKdlh6KmF/erA=;
 b=YCxbokDKZBILGbGYytdFoIAckK4qttnqNK0Wcd31eYd4UkiU1SBqCTxz9njhl27m5F
 rVrAOt57XEvHmphZgwGMVNNzsgHmP+KLLEBhBEO5Sof9W8s6ZKbElsLtVNmY8ZM44eG+
 CxJge/ozn4CKBM7HFymQBVdkBgWdSpWrdR1yRFpHnl4vz+Cuh6vIBe5+TJzOPL6Az+OY
 p72x3ZaPKzug2NaknSJYuFUvDuT3vV8wWz0kiGyjMRo5Pn1jkvBR7Wm6oJB0mD3ZdENB
 S44Ou4alToBgRyO17uVhs/Ey/AQ2PngZnmwMEXC11luR4/Ma1OqApnEGSzXjchXhjV82
 a88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hygyTQG20T7lGw7x3mWCQVwIbOAsgrqKdlh6KmF/erA=;
 b=sy6hUbq/XZnUVSMK0+zHCeEyEV8J0+sfUfXo0x6YkH2cTENW/IOr6V6Lm3ncuUSOs1
 /IwtOa15JGP0VqrGSKB/qbPNNf2ZoO9Sci8/Sj3ycymtHVUjydlHMY6AqM05NjxoT/U7
 kWcBdJL+ipT3L93wHu08cN2o600D3D1yoqebZQmqoH++4789+Gaw4AyMIJyYGR6SfhB3
 TdC9s3+kFm4TMxhYJtz0/cYFGQRzBfOB863Ubo3KOce3JCcREUlMSV+iLaYSYlz1PG9a
 v/umUcISChKSDkfde2Bc9so/XtU5MJ6+m+hDlRvZlG9he5TAcg4BloO5jDbz3JgVX5BD
 /Hfw==
X-Gm-Message-State: AOAM532lrQOxy7/a/cSesRjtjygT2b1uxbYfT+OR4Q07MtOGmHQxREqP
 OLhVZhmrpNUKsw2oHEl/pOSdEW7A8C79BBEj
X-Google-Smtp-Source: ABdhPJxCAFRl4mtdqfQ9t3Y8X1ItRRPd0qch6QJoyYiDGLAaSkirMVciMOwzRFDaqNI1eKJNl+0cgw==
X-Received: by 2002:ac2:532f:: with SMTP id f15mr6836413lfh.644.1641990138354; 
 Wed, 12 Jan 2022 04:22:18 -0800 (PST)
Received: from localhost.localdomain ([77.234.205.2])
 by smtp.gmail.com with ESMTPSA id u7sm1623035lfs.218.2022.01.12.04.22.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jan 2022 04:22:17 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 1/7] net/vmnet: add vmnet dependency and customizable
 option
Date: Wed, 12 Jan 2022 15:21:44 +0300
Message-Id: <20220112122150.37049-2-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220112122150.37049-1-yaroshchuk2000@gmail.com>
References: <20220112122150.37049-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, r.bolshakov@yadro.com,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vmnet.framework dependency is added with 'vmnet' option
to enable or disable it. Default value is 'auto'.

vmnet features to be used are available since macOS 11.0,
corresponding probe is created into meson.build.

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 meson.build                   | 23 ++++++++++++++++++++++-
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index c1b1db1e28..b912c9cb91 100644
--- a/meson.build
+++ b/meson.build
@@ -496,6 +496,24 @@ if cocoa.found() and get_option('gtk').enabled()
   error('Cocoa and GTK+ cannot be enabled at the same time')
 endif
 
+vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
+vmnet_11_0_api = false
+if vmnet.found() and not cc.has_header_symbol('vmnet/vmnet.h',
+                                              'VMNET_BRIDGED_MODE',
+                                              dependencies: vmnet)
+  vmnet = not_found
+  if get_option('vmnet').enabled()
+    error('vmnet.framework API is outdated')
+  else
+    warning('vmnet.framework API is outdated, disabling')
+  endif
+endif
+if vmnet.found() and cc.has_header_symbol('vmnet/vmnet.h',
+                                          'VMNET_SHARING_SERVICE_BUSY',
+                                          dependencies: vmnet)
+  vmnet_11_0_api = true
+endif
+
 seccomp = not_found
 if not get_option('seccomp').auto() or have_system or have_tools
   seccomp = dependency('libseccomp', version: '>=2.3.0',
@@ -1492,6 +1510,8 @@ config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
+config_host_data.set('CONFIG_VMNET', vmnet.found())
+config_host_data.set('CONFIG_VMNET_11_0_API', vmnet_11_0_api)
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -3406,7 +3426,8 @@ summary(summary_info, bool_yn: true, section: 'Crypto')
 # Libraries
 summary_info = {}
 if targetos == 'darwin'
-  summary_info += {'Cocoa support':   cocoa}
+  summary_info += {'Cocoa support':           cocoa}
+  summary_info += {'vmnet.framework support': vmnet}
 endif
 summary_info += {'SDL support':       sdl}
 summary_info += {'SDL image support': sdl_image}
diff --git a/meson_options.txt b/meson_options.txt
index 921967eddb..701e1381f9 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -151,6 +151,8 @@ option('netmap', type : 'feature', value : 'auto',
        description: 'netmap network backend support')
 option('vde', type : 'feature', value : 'auto',
        description: 'vde network backend support')
+option('vmnet', type : 'feature', value : 'auto',
+       description: 'vmnet.framework network backend support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
 option('vnc', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 50bd7bed4d..cdcece4b05 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -84,6 +84,7 @@ meson_options_help() {
   printf "%s\n" '  u2f             U2F emulation support'
   printf "%s\n" '  usb-redir       libusbredir support'
   printf "%s\n" '  vde             vde network backend support'
+  printf "%s\n" '  vmnet           vmnet.framework network backend support'
   printf "%s\n" '  vhost-user-blk-server'
   printf "%s\n" '                  build vhost-user-blk server'
   printf "%s\n" '  virglrenderer   virgl rendering support'
@@ -248,6 +249,8 @@ _meson_option_parse() {
     --disable-usb-redir) printf "%s" -Dusb_redir=disabled ;;
     --enable-vde) printf "%s" -Dvde=enabled ;;
     --disable-vde) printf "%s" -Dvde=disabled ;;
+    --enable-vmnet) printf "%s" -Dvmnet=enabled ;;
+    --disable-vmnet) printf "%s" -Dvmnet=disabled ;;
     --enable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=enabled ;;
     --disable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=disabled ;;
     --enable-virglrenderer) printf "%s" -Dvirglrenderer=enabled ;;
-- 
2.23.0


