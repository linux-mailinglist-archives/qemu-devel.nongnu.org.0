Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9346E449831
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:29:18 +0100 (CET)
Received: from localhost ([::1]:57662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6aD-0003rA-OS
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:29:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mk6Xi-0001ht-TS
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:26:43 -0500
Received: from [2a00:1450:4864:20::12b] (port=44626
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mk6Xf-0007qV-Nc
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:26:41 -0500
Received: by mail-lf1-x12b.google.com with SMTP id y26so37002398lfa.11
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 07:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9pxQrBkFML1iatJQ6pePLVvFdEoxrY3tJKz3j9DyIDc=;
 b=Gz151AikSbAM+2ppmV1sda63zIClWYgMSt9Izi6aHQ+XsIphS8KERzm2xFsiK6mZIb
 +Ule3lizGY/3WAFBn8N70Iw++y9vrCBFHvuo7qfmv8OjgI49yK4KLQh1CAQbQFQ/C4E3
 iz+ZwwmvHJsz8Otc7Ox/x3dHZI9nsmh0OU5TMdxue0saa0G37S59dUUCDqQD4+61K1or
 B9JU4AESZ7W8EavuFJNe4zeUqPtC+xO37SHxvMMTCl/n0cKfv2K1/LWKH1T978JhnI8F
 3L1lJVI/uUDdR58VVD8BAs/cUv2YfGWiL7hlD3tQJRsFSRC94VUX5crlQAtJY7gDAvPr
 75jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9pxQrBkFML1iatJQ6pePLVvFdEoxrY3tJKz3j9DyIDc=;
 b=un3tsV0P3Q/zv9fVGeRHvmSVLyK/GGIw2rjwA0yedyvDwTa3buCnxDBSQYdsdUaDmX
 tkcjUvSTzRDb2onxfUBfgLCQGc/qgw2VuNOljHSyGQOQk9UZxCC7EyfZHYU3C2hqk9on
 Uw6DH8dgZ+gws0lY36LKTEPGG9VemGTxVRzMYXdxKJ6jy7QPNfv9OM9LEgdqWu9qF3Sh
 xQCG4qI8HTT9AShaJcLKJUfemAWJWVoBTySW9fVv733XUfvod7TUkS0m3kLlyy9ZFTLt
 64zfMyUWxtkQSQGllFgYhrOx7uhrIDF7c7l1/iaAxWpph9qBpg2SsVhlaL7f5fgQ7xH5
 jMpw==
X-Gm-Message-State: AOAM533b+nkFCKJfsY/3LqY6rUvnhWPWDPdJFzS3TV+pfkVZOGPBkb+w
 VZcPKXnyN7WYMqwSZ9hZgbpfCV3GmNI/DA==
X-Google-Smtp-Source: ABdhPJzKX9Aq9Uihn35WTOQz+DGC9s5GJhdi3Eqr6OsqxQY/Tpqt0SJrhm56SG9Ept0yQ87RWfnA1Q==
X-Received: by 2002:a2e:7a02:: with SMTP id v2mr428164ljc.227.1636384733558;
 Mon, 08 Nov 2021 07:18:53 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id z13sm1312776lfd.139.2021.11.08.07.18.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Nov 2021 07:18:52 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/6] net/vmnet: add vmnet dependency and customizable option
Date: Mon,  8 Nov 2021 18:16:59 +0300
Message-Id: <20211108151704.65611-2-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211108151704.65611-1-yaroshchuk2000@gmail.com>
References: <20211108151704.65611-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 meson.build                   | 4 ++++
 meson_options.txt             | 2 ++
 scripts/meson-buildoptions.sh | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/meson.build b/meson.build
index 47df10afc2..5e163946d3 100644
--- a/meson.build
+++ b/meson.build
@@ -473,6 +473,8 @@ if cocoa.found() and get_option('gtk').enabled()
   error('Cocoa and GTK+ cannot be enabled at the same time')
 endif
 
+vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
+
 seccomp = not_found
 if not get_option('seccomp').auto() or have_system or have_tools
   seccomp = dependency('libseccomp', version: '>=2.3.0',
@@ -1451,6 +1453,7 @@ config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
+config_host_data.set('CONFIG_VMNET', vmnet.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -3379,6 +3382,7 @@ endif
 summary_info += {'JACK support':      jack}
 summary_info += {'brlapi support':    brlapi}
 summary_info += {'vde support':       vde}
+summary_info += {'vmnet.framework support': vmnet}
 summary_info += {'netmap support':    have_netmap}
 summary_info += {'l2tpv3 support':    have_l2tpv3}
 summary_info += {'Linux AIO support': libaio}
diff --git a/meson_options.txt b/meson_options.txt
index e740dce2a5..77a6bb1955 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -147,6 +147,8 @@ option('netmap', type : 'feature', value : 'auto',
        description: 'netmap network backend support')
 option('vde', type : 'feature', value : 'auto',
        description: 'vde network backend support')
+option('vmnet', type : 'feature', value : 'auto',
+       description: 'vmnet.framework network backend support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
 option('vnc', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 55b8a78560..ba3a705724 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -82,6 +82,7 @@ meson_options_help() {
   printf "%s\n" '  u2f             U2F emulation support'
   printf "%s\n" '  usb-redir       libusbredir support'
   printf "%s\n" '  vde             vde network backend support'
+  printf "%s\n" '  vmnet           vmnet.framework network backend support'
   printf "%s\n" '  vhost-user-blk-server'
   printf "%s\n" '                  build vhost-user-blk server'
   printf "%s\n" '  virglrenderer   virgl rendering support'
@@ -240,6 +241,8 @@ _meson_option_parse() {
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


