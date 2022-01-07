Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48C748756A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 11:23:29 +0100 (CET)
Received: from localhost ([::1]:52418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5mPA-0004UR-9j
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 05:23:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n5mMj-0001nW-Ud
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:20:57 -0500
Received: from [2a00:1450:4864:20::133] (port=44703
 helo=mail-lf1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n5mMi-0001dg-Cw
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:20:57 -0500
Received: by mail-lf1-x133.google.com with SMTP id g26so13826854lfv.11
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 02:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=He6ZB56G7aqYfD+hAF5SQnz0S4SWdfJlS51gHcSpzww=;
 b=iIaW+qgi3xQNCB9hD5qtx+vbhBBkuC8BXyZ2WGdpYajzXy4sS1FHwUuokONW3yjLM4
 hDDrnlRPbdhw/YMJmVY64LAMbaM6FkvKEdWxTPrT8iS28+H+y+ibEJPjzzvFvBwSFzdg
 GSXCTPl06kEM8xJNkOrqOfRl11dH1vScna3/ceHcRLOhe/xL+LUQjtFU5I6u9+Qxz5Et
 LgQK2LFzp+sp+AxPElse9YDJj1jq6Mu0FPorYPIma0YzWiIsXqpK817kCZQfZAM5aTuG
 O9Fh/Id80ynunZCJUTcEnHGrc2XpaEz4nyXMyzUi6e91fh7mYr66KGecPRc6kZe6bY9O
 YTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=He6ZB56G7aqYfD+hAF5SQnz0S4SWdfJlS51gHcSpzww=;
 b=eDEtb4E8EMZVUCNFn0PKD3Hxrl6LdsgOr/oaB6PoQze/pzy6pl8EmFoXhTh3bvO1Cx
 TSVEbAm8KXa6VS9Cm0B36tO8uzg7CkKmXYVSJP6RiqFHRFQZsGrlKqF8ttpUC+r8jX8j
 BQmZMAjvjcpVd0Oq+PyZ83bzN9Fh6lSaW9a3ZZsqdSosUpsRM5V1WFZV3mI2+9HtOMOu
 FYTu4qnZQrjSbyvu2gW7e6XEvL7EYGqcgMBASshZDTZzMcLeHzmdiLOPTETNjw4PK8Pq
 6XHeXK7JUEHJbxHMaTOZ6I4V6aPaFMj4mIYA3kcfqHH3AfnZ0InCGiCrqT7zGm+oHhTN
 6y/w==
X-Gm-Message-State: AOAM5337DWlRbLQhl/1Ev0jgT52R+6e9ijb4OD901FB3FkvjcCvbIhRc
 5dLPDkfcOIgvWJsDthaoBkcmgOFhMyg=
X-Google-Smtp-Source: ABdhPJwHtP9MwFbt8CRzx2psO4ZuEEIGVPaUdsRnlw2sIwOpr38vj1hpfyX7zcOsQdq9xA6hDv293A==
X-Received: by 2002:a2e:b0f1:: with SMTP id h17mr30022736ljl.137.1641550854394; 
 Fri, 07 Jan 2022 02:20:54 -0800 (PST)
Received: from localhost.localdomain ([62.140.238.4])
 by smtp.gmail.com with ESMTPSA id p15sm524259lfd.69.2022.01.07.02.20.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jan 2022 02:20:54 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 1/7] net/vmnet: add vmnet dependency and customizable option
Date: Fri,  7 Jan 2022 13:20:13 +0300
Message-Id: <20220107102019.37013-2-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220107102019.37013-1-yaroshchuk2000@gmail.com>
References: <20220107102019.37013-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::133
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x133.google.com
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
index 53065e96ec..d2d396037a 100644
--- a/meson.build
+++ b/meson.build
@@ -496,6 +496,8 @@ if cocoa.found() and get_option('gtk').enabled()
   error('Cocoa and GTK+ cannot be enabled at the same time')
 endif
 
+vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
+
 seccomp = not_found
 if not get_option('seccomp').auto() or have_system or have_tools
   seccomp = dependency('libseccomp', version: '>=2.3.0',
@@ -1492,6 +1494,7 @@ config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
+config_host_data.set('CONFIG_VMNET', vmnet.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -3441,6 +3444,7 @@ endif
 summary_info += {'JACK support':      jack}
 summary_info += {'brlapi support':    brlapi}
 summary_info += {'vde support':       vde}
+summary_info += {'vmnet.framework support': vmnet}
 summary_info += {'netmap support':    have_netmap}
 summary_info += {'l2tpv3 support':    have_l2tpv3}
 summary_info += {'Linux AIO support': libaio}
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


