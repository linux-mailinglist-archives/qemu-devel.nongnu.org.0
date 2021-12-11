Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A1C471365
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 11:46:42 +0100 (CET)
Received: from localhost ([::1]:39198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvztp-0002oG-Je
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 05:46:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mvzrg-0000rC-TK
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 05:44:28 -0500
Received: from [2a00:1450:4864:20::22c] (port=38639
 helo=mail-lj1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mvzre-00083O-S5
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 05:44:28 -0500
Received: by mail-lj1-x22c.google.com with SMTP id p8so17116568ljo.5
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 02:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jzagFbFv8aWqFMmnjN+mFUbWJgK6HuzCVGpplDCxWYQ=;
 b=I4zbGiWo3X1agE5EBzXtzHKfLayzqfvlfxjKPSiveqJ7NyQuITXPTYKGhZWJ3hHfL1
 Mgy+s4FBW7fb9uGRBqGNsW8he+fM0cSGdu09N+6VLoU719I3IQufYfw/F0Y0rKcCVkZr
 yY81BX75WnCHPQFJTT/JY4F7a6LgyFi+6PY4ZGSrpzSnz1hSAk2Z/hRq8/g9k+7+qvzH
 5n7qnn0fXh1wj12jSZFvYh1ZoFNXOw1bgjUomvvb8PcmD5ivSBZYiMyrtkTHk9Z31EtD
 AD9DieiXnbpm2FRmDzgEf2LOdfGMhAhhQNO/2Tc8a+7EWHhc6U5odHEN7XCkJgBeIItQ
 R5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jzagFbFv8aWqFMmnjN+mFUbWJgK6HuzCVGpplDCxWYQ=;
 b=6Qt+V3VKTy8+DjB7N05lEYfUwyiWMZJav+jSF11m3wt6JIjzhRHkr+VemC4FRqdhbL
 BRWUCdM4580YMMLqvct2m2ObuEnp2vXpwunTXqSZjTa9cm5IlNiOdyjhZyhcBEfGEeD8
 IJlxSBDmazr2ZaFHHfa3T/alU6zhjH62TjlKhH8fKWGISbHpygDiVQpwsBHNPaWz80xk
 vMNTs20+ATg6TGT0dTFDnhAUVbK8sPZ/OUN7VdAZQUEa4ZcjIlNfbYGpNWuXyOgR9C7z
 upD1uOWwX7RgFREiLWl+H1RMxVnzLoUsuQJFAcexslnVf/qQ9dym3+oUUHoA0rsjvd2a
 IYiQ==
X-Gm-Message-State: AOAM5327BW+rN0h2TgrQCjv1rnWvoFqYCqVwrSIBk/LCVWX6OG0fBmum
 cUK5pPRRQ3loYK+EprI13nVh/XxbslY=
X-Google-Smtp-Source: ABdhPJzNwGCw4jnZDVWRaegeEmddpFSAoG/AwQvUiCZbPNgaRf50a5kHu2b/R60yuwv51+fYbRnW/Q==
X-Received: by 2002:a2e:7310:: with SMTP id o16mr18416584ljc.394.1639219464834; 
 Sat, 11 Dec 2021 02:44:24 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:abdc:fce0:e51a:d86:d956])
 by smtp.gmail.com with ESMTPSA id h22sm581971lfc.137.2021.12.11.02.44.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Dec 2021 02:44:24 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 1/7] net/vmnet: add vmnet dependency and customizable option
Date: Sat, 11 Dec 2021 13:44:07 +0300
Message-Id: <20211211104413.50524-2-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211211104413.50524-1-yaroshchuk2000@gmail.com>
References: <20211211104413.50524-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x22c.google.com
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

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 meson.build                   | 4 ++++
 meson_options.txt             | 2 ++
 scripts/meson-buildoptions.sh | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/meson.build b/meson.build
index 96de1a6ef9..ce8acf6ada 100644
--- a/meson.build
+++ b/meson.build
@@ -481,6 +481,8 @@ if cocoa.found() and get_option('gtk').enabled()
   error('Cocoa and GTK+ cannot be enabled at the same time')
 endif
 
+vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
+
 seccomp = not_found
 if not get_option('seccomp').auto() or have_system or have_tools
   seccomp = dependency('libseccomp', version: '>=2.3.0',
@@ -1461,6 +1463,7 @@ config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
+config_host_data.set('CONFIG_VMNET', vmnet.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -3397,6 +3400,7 @@ endif
 summary_info += {'JACK support':      jack}
 summary_info += {'brlapi support':    brlapi}
 summary_info += {'vde support':       vde}
+summary_info += {'vmnet.framework support': vmnet}
 summary_info += {'netmap support':    have_netmap}
 summary_info += {'l2tpv3 support':    have_l2tpv3}
 summary_info += {'Linux AIO support': libaio}
diff --git a/meson_options.txt b/meson_options.txt
index e392323732..0538d48a85 100644
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
index 7a17ff4218..13da30f018 100644
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
@@ -242,6 +243,8 @@ _meson_option_parse() {
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


