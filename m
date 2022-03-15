Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342F24DA606
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 00:09:47 +0100 (CET)
Received: from localhost ([::1]:60700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUGIT-0006AH-W6
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 19:09:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUGGk-0003Vd-IA
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 19:07:58 -0400
Received: from [2a00:1450:4864:20::432] (port=40538
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUGGi-00058N-NI
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 19:07:58 -0400
Received: by mail-wr1-x432.google.com with SMTP id d7so605559wrb.7
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 16:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+rzBrFYutKd2a438vQHGSPNl6k6Hk06gpOsLPeIfyaQ=;
 b=Dt0bVKqJIuDquVhZP9IJt62i5NFrHy+yTykWYgDQCb5PlOz16wcb8lUEI7T8WpRc7s
 KmCMliEv2KDBMIsZlJK4SwSYymAL36QQcJSeaBgYhej5Htfe2sWdN2Lk4NTVICGaXBFo
 GuindzKSUEk701VyA10CKrIV/TDtymABIOJVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+rzBrFYutKd2a438vQHGSPNl6k6Hk06gpOsLPeIfyaQ=;
 b=LLmmDmsXt/KU1L9vh5rvLm+Ccp787bMtiYtZLthHljSm9/sH/j4UCivVTXuWGtZKwJ
 iFuFsRrFmqBuWdyqAkJKfTJIFrEQSoy7C/G9EfCtOgP0j2Fy/o5ij8m2q+WFuu+QhTzG
 tUmz/KcowUVeWssjpQf/Rp0F/lV97pkZQbuA686vh/JyzHzmH0USET7Eao+laM7YjC1F
 HSRuhWzXNpNSUejYFprqPMpm3VkWuxeKLpvkF+WkM7Ya5F0CSvV7R/ThVmgJW+7oQkij
 W2jDyRJU3T6lzI3u16hNRJcCQlUZd2efH2rEM3MoYaDPKVlETfKEFk6BlmVfI+Dae0/z
 mm2Q==
X-Gm-Message-State: AOAM532cEkUWl3iSlNu2ZYsyA4eM7t1NqR4uJMeIR+3ml2ef33FyC8K3
 fj/I8T7kEriwJrVMV2HidmC6OJGdeJiGaloZ
X-Google-Smtp-Source: ABdhPJyGe17RnuNqHteiftrDHVYfooDy1hY+sDaFo30FdvQoMUJAUfnPQ58caGd34aUzGyA+C37hXg==
X-Received: by 2002:a5d:5105:0:b0:1f1:d115:c9f with SMTP id
 s5-20020a5d5105000000b001f1d1150c9fmr22907741wrt.77.1647385675062; 
 Tue, 15 Mar 2022 16:07:55 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-3-121-162-165.eu-central-1.compute.amazonaws.com. [3.121.162.165])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a5d584f000000b00203ded4f92esm221195wrf.18.2022.03.15.16.07.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Mar 2022 16:07:54 -0700 (PDT)
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
Subject: [PATCH v20 1/7] net/vmnet: add vmnet dependency and customizable
 option
Date: Wed, 16 Mar 2022 02:07:35 +0300
Message-Id: <20220315230741.21578-2-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220315230741.21578-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220315230741.21578-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-wr1-x432.google.com
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


