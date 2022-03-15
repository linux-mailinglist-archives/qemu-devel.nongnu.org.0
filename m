Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433924DA405
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 21:31:00 +0100 (CET)
Received: from localhost ([::1]:47570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUDop-0000f7-AL
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 16:30:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDmO-0006PR-M8
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:28:28 -0400
Received: from [2a00:1450:4864:20::329] (port=35731
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDmL-00065f-Nw
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:28:27 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so2117910wmj.0
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 13:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+rzBrFYutKd2a438vQHGSPNl6k6Hk06gpOsLPeIfyaQ=;
 b=WM/t8BNSWY2+xI4NT+kq777qcCR8TgP2nmLz1e2qGNOR3hwu4bu4kKCFR63+DxvJF+
 WqFq9XlARaq9m2AWFo3ZQPjtTlGYYKBbaEbgBbd63pTv/oanEz0Hm7BpmYuV3+tXxLnQ
 3nYwsfomxgtA6U0zL8HJVnKs/Smi1h856AKDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+rzBrFYutKd2a438vQHGSPNl6k6Hk06gpOsLPeIfyaQ=;
 b=iU/5EdMAFZ9RuKgZbTGIhlz5iXSiEAHmfxwOJMlngvP30HQ9cbPejMuqNScW4BZJJo
 aX78ctXxZaVJpe4+G/48JNh1r4yx6NphOeLhnEfunwhyXp8Js//T1qpS6rAOx56EiKEV
 9mMQFW+lZDJYZySHOj4jd3W3wVG/vNOKw6IrS2V5md163w3dA6oa+mDWlvtv8UQJuP7i
 D6pNwaBFgaoLsSiXFabNObm0mGI1rvXqY8q/77XLVUBW7hXkeOmI0JkasShYWlQ3WGCa
 xZBIkizdBsshtlMkBJXeBAVCaxTM9CzOVZWvokahOZrQ8QO3E7PwLcbABBLlHuhab+Ek
 bBxg==
X-Gm-Message-State: AOAM533rJ8/lKj0lnJ/aTg5067ldyx05xkiW2QrXkbdsu38V0n4a7gZJ
 aQdghU+6nJkEbVJmS8tQoaSwA75GfS3+Q/fy
X-Google-Smtp-Source: ABdhPJwEU9e5bFm5UZri6pHiF2YOCR89FBu4KG57TcWvo5TJDPJgi5+Q6bF/uCvOpTI9KT+BKAFSLA==
X-Received: by 2002:a1c:4c0e:0:b0:38c:1b33:ccec with SMTP id
 z14-20020a1c4c0e000000b0038c1b33ccecmr2508496wmf.12.1647376104048; 
 Tue, 15 Mar 2022 13:28:24 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-3-121-162-165.eu-central-1.compute.amazonaws.com. [3.121.162.165])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a056000178a00b0020393321552sm13378166wrg.85.2022.03.15.13.28.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Mar 2022 13:28:23 -0700 (PDT)
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
X-Google-Original-From: Vladislav Yaroshchuk
 <Vladislav.Yaroshchuk@jetbrains.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, r.bolshakov@yadro.com, eblake@redhat.com,
 phillip.ennen@gmail.com, phillip@axleos.com, akihiko.odaki@gmail.com,
 armbru@redhat.com, hsp.cat7@gmail.com, hello@adns.io, roman@roolebo.dev,
 peter.maydell@linaro.org, dirty@apple.com, f4bug@amsat.org,
 agraf@csgraf.de, kraxel@redhat.com, alex.bennee@linaro.org,
 qemu_oss@crudebyte.com,
 Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
Subject: [PATCH v19 1/7] net/vmnet: add vmnet dependency and customizable
 option
Date: Tue, 15 Mar 2022 23:26:58 +0300
Message-Id: <20220315202704.18263-2-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220315202704.18263-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220315202704.18263-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vmnet.framework dependency is added with 'vmnet' option
to enable or disable it. Default value is 'auto'.

used vmnet features are available since macOS 11.0,
but new backend can be built and work properly with
subset of them on 10.15 too.

Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
---
 meson.build                   | 16 +++++++++++++++-
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 2d6601467f..806f3869f9 100644
--- a/meson.build
+++ b/meson.build
@@ -522,6 +522,18 @@ if cocoa.found() and get_option('gtk').enabled()
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
@@ -1550,6 +1562,7 @@ config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_TPM', have_tpm)
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
+config_host_data.set('CONFIG_VMNET', vmnet.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -3588,7 +3601,8 @@ summary(summary_info, bool_yn: true, section: 'Crypto')
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
index 52b11cead4..d2c0b6b412 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -175,6 +175,8 @@ option('netmap', type : 'feature', value : 'auto',
        description: 'netmap network backend support')
 option('vde', type : 'feature', value : 'auto',
        description: 'vde network backend support')
+option('vmnet', type : 'feature', value : 'auto',
+       description: 'vmnet.framework network backend support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
 option('vnc', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 9ee684ef03..30946f3798 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -116,6 +116,7 @@ meson_options_help() {
   printf "%s\n" '  usb-redir       libusbredir support'
   printf "%s\n" '  vde             vde network backend support'
   printf "%s\n" '  vdi             vdi image format support'
+  printf "%s\n" '  vmnet           vmnet.framework network backend support'
   printf "%s\n" '  vhost-user-blk-server'
   printf "%s\n" '                  build vhost-user-blk server'
   printf "%s\n" '  virglrenderer   virgl rendering support'
-- 
2.34.1.vfs.0.0


