Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA0946A1A1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 17:44:36 +0100 (CET)
Received: from localhost ([::1]:34310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muH6R-0007Nt-LA
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 11:44:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muH4a-0004gr-Jh
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 11:42:40 -0500
Received: from [2a00:1450:4864:20::230] (port=39794
 helo=mail-lj1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muH4Y-00074e-9q
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 11:42:40 -0500
Received: by mail-lj1-x230.google.com with SMTP id m12so22093805ljj.6
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 08:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jzagFbFv8aWqFMmnjN+mFUbWJgK6HuzCVGpplDCxWYQ=;
 b=otcnre+QNC6k7azBPvAsU5kH52rWteAAnApPNh/L8fr1pJghf0Gzt2TO7+NSUaoRGq
 J07MmIchZwBgHNv41qr2f4rgaWB1KZVMuBROerZY0fzh7XOArnNIXRTAQ2uXnN8G8LG8
 Auw++qOcTv96G3jnp2I8iInIjXCHRxsKOFdEtZkAfPuyTQlO3E08dBm7BPCNsq0zveQg
 TD3Cjy8M1XdbHPB2YTHwXO9UJhHJuJq5/fMJtJYwp46bfPVOUnzfeVP+DPJoDpfTNZzQ
 o5iF9VLxfqmU6n/PVOF3KVnWMdgIg+YNuSos/9v0RRXaY6nobzdzg076xHmzJzTjImk7
 xVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jzagFbFv8aWqFMmnjN+mFUbWJgK6HuzCVGpplDCxWYQ=;
 b=N5/U2P4XlmAHxO/yDGEaxutvUQXSb7iNZgqvuwVzLTiVtiKsOc7wSFuMmDzpKtggWj
 UXkzeb9qixt1oTRvuk2tTm49y3toB/QI75ImFYWL0GzYDRWvL/eg9u4XOJ1WRPmL+PaK
 bGctlJGG1lK5jcgBmKpDmxqbnlgjYgPqn3NgfvFRODrSnq5rCk2IjI3Jda8UN07Mv4wl
 pXXXnIy2Xs+0nRp3ZBfIxy6LMm3tvmrgljMYnIPmvYlvVJ3Pus+adRgfIBEzjCxB9VTw
 W+lXD60//oIlfqUfPmKIMwrMyOvB4tpbPJHGZ9Whdafa5B5q0VAlBAMgMvXuIu2g9V19
 H99g==
X-Gm-Message-State: AOAM532/vgRXKM1SEdbcS0XJp4N/TnxxLbWUpziJYXkw0/2PbVj0CSa/
 T1Z26VR+5onGYcT4oV8AacxpnbZTczZMQ0mD
X-Google-Smtp-Source: ABdhPJwXKlX7fBU6NdpDDr64F2eR1Di1H9i5qpukZfzPXBbbM3Lbc/QR1H4Irzjp6TQ1pa+o2p7pxQ==
X-Received: by 2002:a2e:a594:: with SMTP id m20mr35498223ljp.332.1638808955821; 
 Mon, 06 Dec 2021 08:42:35 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id e11sm1401809lfq.65.2021.12.06.08.42.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Dec 2021 08:42:35 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/6] net/vmnet: add vmnet dependency and customizable option
Date: Mon,  6 Dec 2021 19:42:17 +0300
Message-Id: <20211206164222.11027-2-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211206164222.11027-1-yaroshchuk2000@gmail.com>
References: <20211206164222.11027-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::230
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x230.google.com
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


