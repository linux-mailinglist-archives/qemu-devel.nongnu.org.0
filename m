Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D60D44E3B3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 10:17:52 +0100 (CET)
Received: from localhost ([::1]:35476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlSgw-0005BN-LJ
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 04:17:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mlSe0-0001xW-Vv
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:14:49 -0500
Received: from [2a00:1450:4864:20::231] (port=40479
 helo=mail-lj1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mlSdz-0000pT-2A
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:14:48 -0500
Received: by mail-lj1-x231.google.com with SMTP id u22so10518356lju.7
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 01:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cc8p07X3/E/2bL9Y63qcgGX2vC1m/sTNn/AoaaI3kXE=;
 b=ZvAdddscbl+68r+EHU4E51X8pvDvhR7F2zYRDA5qhJGPet8X9RcAEwFUhGQKWNcypA
 RzJ/e2h/QFId6iyVHUMuJhwBFUxvjYR0udAx0fYfTd2fHHd8Z5qRQiIp+5IlM85IK2PN
 jAT/A8PcXVGm0LsbD+xsObdOOSodkzG0Dr6h/B8my+Fc+qd855mvydE21Eu27UX2gaQX
 WuKxqEYLypZpV04b21dPOInwpRIZcQlAZcFvzrmfV42xCsDwNpRNFIXiutwQLqdwJn3R
 PyAC/qgYCurWSzV1gpbsbYvjHtc2sVN8L5afnxxkcArRjcfeC7YnInEj0TaaevZ6MrvC
 YXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cc8p07X3/E/2bL9Y63qcgGX2vC1m/sTNn/AoaaI3kXE=;
 b=iMqfLv0yjbbIxJrdtFwlHitRLHtnerco1cIJNJUUwGo4PBaNPpulc5BdhmX/kfmO/U
 k47RnpJo8zObDty/JHc1AosmLCZvc1GqKw3SwwmijGYtZmF/OwqWn1LoNk0E65PKolM0
 t2huxHYlqwAJiYo2tIYp3P3TF+Mup/WP+AuSlxFfROo0iimeJi3m4AB9L8/stwcEGh5c
 MjwB6EhHgZGyotKpC2B7V+6Fc6qW6MQZgouOcjsaBOaS5Mep3Bpyjwfdq6VQOFI7QPs6
 A+EDc32pR2KIYNGAxQo6WbTzOhbml7BpSNUuUIsMuAvUDq+FJ0SMATVLJrDt0/KtZdFw
 AZcA==
X-Gm-Message-State: AOAM533aeJMbsn6t0nEF2ZNjPrOglKm6tvSB1nIsGKFKEmQEq2fFqn/L
 bP8QsYa875ehYEyGeaeS482ZFivugftOrA==
X-Google-Smtp-Source: ABdhPJwlub6z8nOu50pwhRWwejuU6Q4sdnFrnxp079y2Uh5QyZ4ca5ikUzlGHlq+qZYgnuv5gFL7xg==
X-Received: by 2002:a2e:85c1:: with SMTP id h1mr13857225ljj.398.1636708485061; 
 Fri, 12 Nov 2021 01:14:45 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2d:d7c7:95ac:c963:ac2e:68f])
 by smtp.gmail.com with ESMTPSA id j11sm570134ljc.9.2021.11.12.01.14.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Nov 2021 01:14:44 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/6] net/vmnet: add vmnet dependency and customizable option
Date: Fri, 12 Nov 2021 12:14:09 +0300
Message-Id: <20211112091414.34223-2-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
References: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::231
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x231.google.com
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
index 2ece4fe088..202e04af31 100644
--- a/meson.build
+++ b/meson.build
@@ -477,6 +477,8 @@ if cocoa.found() and get_option('gtk').enabled()
   error('Cocoa and GTK+ cannot be enabled at the same time')
 endif
 
+vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
+
 seccomp = not_found
 if not get_option('seccomp').auto() or have_system or have_tools
   seccomp = dependency('libseccomp', version: '>=2.3.0',
@@ -1455,6 +1457,7 @@ config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
+config_host_data.set('CONFIG_VMNET', vmnet.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -3383,6 +3386,7 @@ endif
 summary_info += {'JACK support':      jack}
 summary_info += {'brlapi support':    brlapi}
 summary_info += {'vde support':       vde}
+summary_info += {'vmnet.framework support': vmnet}
 summary_info += {'netmap support':    have_netmap}
 summary_info += {'l2tpv3 support':    have_l2tpv3}
 summary_info += {'Linux AIO support': libaio}
diff --git a/meson_options.txt b/meson_options.txt
index 411952bc91..bdcd9674ea 100644
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
index 45e1f2e20d..f75375c795 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -81,6 +81,7 @@ meson_options_help() {
   printf "%s\n" '  u2f             U2F emulation support'
   printf "%s\n" '  usb-redir       libusbredir support'
   printf "%s\n" '  vde             vde network backend support'
+  printf "%s\n" '  vmnet           vmnet.framework network backend support'
   printf "%s\n" '  vhost-user-blk-server'
   printf "%s\n" '                  build vhost-user-blk server'
   printf "%s\n" '  virglrenderer   virgl rendering support'
@@ -239,6 +240,8 @@ _meson_option_parse() {
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


