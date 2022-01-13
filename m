Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A2948DA7C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:09:44 +0100 (CET)
Received: from localhost ([::1]:48806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n81jT-0003gL-2d
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n81be-0002Im-8s
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:01:39 -0500
Received: from [2a00:1450:4864:20::535] (port=34577
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n81ba-0003dT-RL
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:01:37 -0500
Received: by mail-ed1-x535.google.com with SMTP id u25so24153643edf.1
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 07:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6RclDevLSd6+w1woMZtxoloXjHn4OEESSZuOsEg2ug0=;
 b=poHgZWbQpP1NrlVr84T0RxDqo6RpEHtI/2tMoSemDEcSw4IPFZ695Gut006q4bghA+
 FlBjm0PVN4ElVLeL3f8YvCtEbjf3gM5n6KFJlqSgBiiaSOmE+JNj1l35D9R+cIbopODn
 V2agX+ZGQBIhJ//mndawnMmyfZk9rxIBhnnEkN5obETHfckH6QV4lSkxwkwAvB7nKwpW
 ETMRHtp53vO/J7mJNz3l6g9rMt0qEZ0FzTsn9b4Ia7UsMGcFv8OhMdnFQed/g/88C8oD
 nutcRRPYyRt5p2TuKc2RC8ZxJoaSRdw0Xqd00zH751IfpsS8I9Vg1n2v0okVcOeOnBAb
 IncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6RclDevLSd6+w1woMZtxoloXjHn4OEESSZuOsEg2ug0=;
 b=FHJDWBEAPxvyXgbf1sBvRO+DIu7SlzA8aRDekaJelvUo8grdQUy8eMzyrmJEqYQHhq
 WzkRPgqqIaV2OjN33fCHKpO7IxlvXAaumG7vDneIbaEX5AWhq+U9ubruPIaJscQF3osJ
 zDOkx7HNkFSEFh67uQqQvT3QzDkHOYdXA199drdnT71e877KWuXUe/e5216d2BJY87kO
 6VRVGPe10afe80jxgVBXjed8MBZp20/LrPnwHQpEOPmBDMocFr69clpV2xtj7NuZIChY
 kIcedYdlRP6kcr2Pn+7sDVpx9i+Et7bruvVOzPce8HESyN40ErYzWN6OST4Zp9c0qmye
 2esQ==
X-Gm-Message-State: AOAM532v4GZEvYs48BbiH+YSA2Uh2Jh1WnLgZ5jaoXZBLIFQ3CeoAl4P
 54DkqJUx3cXSz/3g81ZKI/mT1j7Gn/vdhkbx
X-Google-Smtp-Source: ABdhPJwS9J6sK1Lx7/v82vrupA8rAbB+xIGVtJkUveeApHDmazb5jFZR4UMYrYgaDGJ4Ytq1pBkfaw==
X-Received: by 2002:a05:6512:3f13:: with SMTP id
 y19mr3707343lfa.353.1642086082880; 
 Thu, 13 Jan 2022 07:01:22 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id w25sm314278lfl.155.2022.01.13.07.01.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 07:01:22 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 1/7] net/vmnet: add vmnet dependency and customizable
 option
Date: Thu, 13 Jan 2022 18:01:07 +0300
Message-Id: <20220113150113.58437-2-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220113150113.58437-1-yaroshchuk2000@gmail.com>
References: <20220113150113.58437-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-ed1-x535.google.com
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
 meson.build                   | 16 +++++++++++++++-
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index c1b1db1e28..285fb7bc41 100644
--- a/meson.build
+++ b/meson.build
@@ -496,6 +496,18 @@ if cocoa.found() and get_option('gtk').enabled()
   error('Cocoa and GTK+ cannot be enabled at the same time')
 endif
 
+vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
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
+
 seccomp = not_found
 if not get_option('seccomp').auto() or have_system or have_tools
   seccomp = dependency('libseccomp', version: '>=2.3.0',
@@ -1492,6 +1504,7 @@ config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
+config_host_data.set('CONFIG_VMNET', vmnet.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -3406,7 +3419,8 @@ summary(summary_info, bool_yn: true, section: 'Crypto')
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


