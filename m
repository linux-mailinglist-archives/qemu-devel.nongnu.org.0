Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14F24D8C4C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:23:47 +0100 (CET)
Received: from localhost ([::1]:54758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqIF-00088T-0U
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:23:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nTqEw-0002Bo-P9
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:20:24 -0400
Received: from [2a00:1450:4864:20::12a] (port=38709
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nTqEo-0007Rn-Mx
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:20:16 -0400
Received: by mail-lf1-x12a.google.com with SMTP id w27so29049454lfa.5
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 12:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vARqejL8LnbOLfCnG++vZFyfxvSG5M6FwTrsjDnZZOM=;
 b=gFi9dZocOR3nuG5XeD+pe6pTTOYzdafFkIFOx+dmYRiXOE9PKBNLKs2HXJaB+nrM9G
 j5D9jl5h7AqYcnaMnkuocmNt38DwdQ1CrC+DkN6lMPxUlbiAJ8d/tr3Myv76KfytsYj7
 hR8XLkXyQUEntKHfEVWOTIhUHCR29n7OztLqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vARqejL8LnbOLfCnG++vZFyfxvSG5M6FwTrsjDnZZOM=;
 b=s5/ddzCT6ukxdTLkbbYQYrLZXlXoeX8HdbIetye4apdXwwQ7icE4yVkKNbfyJkr6tU
 QvdtTKpOyPh1p3bIylVOFeL9C93oW4OdcKEaRNHTmNKsPe6KmbD/ed06lq/J7jk03fdX
 FgUlJbUx5MK4NC110UvEFdZBhdrZpACYVHwfoh5Z14NajMQawTyi0Gv2xG/fvb6LLSax
 V98rN/BE/klGphIB4WjHIQhgrFJjkcB5eWOP0pIVv1xCEnTTGmcmi7HDAT4XWzuGt6ii
 koeqiBfcGZMGlaH6o7L0edTGudlufDZ/lTXoRkW538noLED9Tko7Qic7SHZu+Kj83c3U
 8XsQ==
X-Gm-Message-State: AOAM530cr71WFh5z8S0dKf0iB9/+6Di0nkTkWeT4X5Y4it++HrpnwRca
 VWYAP3uYuC6xjWSXit9W2qmK4bTQYv3hcnbm
X-Google-Smtp-Source: ABdhPJxrtqeOp2scLtabAM7hBTOkcLOA03TORk/IQgJTgb+OruDY5y/vuqpDhyxp0cwesDCD3Y449A==
X-Received: by 2002:ac2:4d3c:0:b0:448:1ee1:fd with SMTP id
 h28-20020ac24d3c000000b004481ee100fdmr14237616lfk.433.1647285611897; 
 Mon, 14 Mar 2022 12:20:11 -0700 (PDT)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a196e0f000000b0044827945789sm3414454lfc.155.2022.03.14.12.20.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Mar 2022 12:20:11 -0700 (PDT)
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
Subject: [PATCH v16 1/7] net/vmnet: add vmnet dependency and customizable
 option
Date: Mon, 14 Mar 2022 22:15:39 +0300
Message-Id: <20220314191545.81861-2-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220314191545.81861-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220314191545.81861-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lf1-x12a.google.com
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

vmnet features to be used are available since macOS 11.0,
corresponding probe is created into meson.build.

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


