Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C75A4A8AFB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:54:59 +0100 (CET)
Received: from localhost ([::1]:39972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgJt-0000UQ-68
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:54:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzn-0004tZ-PP
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:11 -0500
Received: from [2a00:1450:4864:20::636] (port=35641
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzl-0008GA-C8
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:11 -0500
Received: by mail-ej1-x636.google.com with SMTP id s5so11020429ejx.2
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c3oQVkmWFS51TQN3XmmqoG98wYpPg7JIKmoeCOoM6tk=;
 b=Qjv4BAl48blIDiQEpywHhG2apMoyYRiONAB42eYzjoCjmLFglgJoiS9l0DVXVcgHXL
 lGwS66le96O9FW/SgmpLHojNw79VA04CUY9OQRQ76fwAPqGYtr8zpDOpTq5O1hiv/ZHq
 Tlp1stn/VuLN4QbIR1Vugj3R0j4KNHIQoB0lBwtnOMM4sa+VSPSScen0oyGQGvo1Mgyh
 XfGNdgJ5/yEDpTXozOp8FmN5/j6iGVVM4zyXfWIM7haqy4qvzhRFPHU9RL2pdPGNyxq8
 wtowEjVKCR53Nt1Xs0dZfsTH4ucpnVj39piDzlOnolbSt3BCzty/61A4LuziBqBXSNNR
 iAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=c3oQVkmWFS51TQN3XmmqoG98wYpPg7JIKmoeCOoM6tk=;
 b=5A7+HvgqM17QPrbcN+Y8Mb8l09bBuIRH6vUtieceX2vvc8Vy2h8SkA3sQ/0Zso4l/o
 8GxVZFg9yD7fLB+aANjS/qOI1UN3paT5a1NPorkBg4zI7JJBe77oQJUoqjkhxLGIWnvW
 3dj8gge27fO3dioH54+TEdjWQUnnHAX4BS5Eh23VAcAfPWvn9TumUFlEtMMcYSZiH0hw
 IX/auaeO4YEgvJrkAhUBYBpAPVoDlw8dUx05aOjpTVlKhfTfToJreTVpNciz/pIwBXCN
 tTD+dSfA0uA9WlhHcAxmiKTBp6X5uSvFg79DfA4Z/W56C7qVxpdCCvUpP9cD3J5Uxa/y
 jtTg==
X-Gm-Message-State: AOAM532kIS5jImmiDjadmtSWmcmvWqdQIsoPgH9F8sivsNbrZNQGysHP
 sXknIRU/+fdZ9PubCS1ZnFTLMG/XPKI=
X-Google-Smtp-Source: ABdhPJw2T1kd3ZJtQYeoCpz5v4vVLDz6nx3vvsmPxMY6Qz0GMONasU0DsdDaqiAqg7hA71JAemKqVg==
X-Received: by 2002:a17:907:3f1a:: with SMTP id
 hq26mr30622955ejc.562.1643909647826; 
 Thu, 03 Feb 2022 09:34:07 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/27] configure,
 meson: move image format options to meson_options.txt
Date: Thu,  3 Feb 2022 18:33:41 +0100
Message-Id: <20220203173359.292068-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/meson.build             | 47 +++++++++++++++-------
 configure                     | 73 -----------------------------------
 meson.build                   | 16 ++++----
 meson_options.txt             | 16 ++++++++
 scripts/meson-buildoptions.sh | 24 ++++++++++++
 5 files changed, 80 insertions(+), 96 deletions(-)

diff --git a/block/meson.build b/block/meson.build
index 90dc9983e5..4afde2ebf8 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -45,20 +45,37 @@ block_ss.add(files(
 
 softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('blkreplay.c'))
 
-block_ss.add(when: 'CONFIG_QCOW1', if_true: files('qcow.c'))
-block_ss.add(when: 'CONFIG_VDI', if_true: files('vdi.c'))
-block_ss.add(when: 'CONFIG_CLOOP', if_true: files('cloop.c'))
-block_ss.add(when: 'CONFIG_BOCHS', if_true: files('bochs.c'))
-block_ss.add(when: 'CONFIG_VVFAT', if_true: files('vvfat.c'))
-block_ss.add(when: 'CONFIG_DMG', if_true: files('dmg.c'))
-block_ss.add(when: 'CONFIG_QED', if_true: files(
-  'qed-check.c',
-  'qed-cluster.c',
-  'qed-l2-cache.c',
-  'qed-table.c',
-  'qed.c',
-))
-block_ss.add(when: 'CONFIG_PARALLELS', if_true: files('parallels.c', 'parallels-ext.c'))
+if get_option('qcow1').allowed()
+  block_ss.add(files('qcow.c'))
+endif
+if get_option('vdi').allowed()
+  block_ss.add(files('vdi.c'))
+endif
+if get_option('cloop').allowed()
+  block_ss.add(files('cloop.c'))
+endif
+if get_option('bochs').allowed()
+  block_ss.add(files('bochs.c'))
+endif
+if get_option('vvfat').allowed()
+  block_ss.add(files('vvfat.c'))
+endif
+if get_option('dmg').allowed()
+  block_ss.add(files('dmg.c'))
+endif
+if get_option('qed').allowed()
+  block_ss.add(files(
+    'qed-check.c',
+    'qed-cluster.c',
+    'qed-l2-cache.c',
+    'qed-table.c',
+    'qed.c',
+  ))
+endif
+if get_option('parallels').allowed()
+  block_ss.add(files('parallels.c', 'parallels-ext.c'))
+endif
+
 block_ss.add(when: 'CONFIG_WIN32', if_true: files('file-win32.c', 'win32-aio.c'))
 block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), coref, iokit])
 block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
@@ -89,7 +106,7 @@ foreach m : [
 endforeach
 
 # those are not exactly regular block modules, so treat them apart
-if 'CONFIG_DMG' in config_host
+if get_option('dmg').allowed()
   foreach m : [
     [liblzfse, 'dmg-lzfse', liblzfse, 'dmg-lzfse.c'],
     [libbzip2, 'dmg-bz2', [glib, libbzip2], 'dmg-bz2.c']
diff --git a/configure b/configure
index 5bb23dadc1..acee571fbc 100755
--- a/configure
+++ b/configure
@@ -331,14 +331,6 @@ debug_stack_usage="no"
 tls_priority="NORMAL"
 live_block_migration=${default_feature:-yes}
 replication=${default_feature:-yes}
-bochs=${default_feature:-yes}
-cloop=${default_feature:-yes}
-dmg=${default_feature:-yes}
-qcow1=${default_feature:-yes}
-vdi=${default_feature:-yes}
-vvfat=${default_feature:-yes}
-qed=${default_feature:-yes}
-parallels=${default_feature:-yes}
 debug_mutex="no"
 plugins="$default_feature"
 rng_none="no"
@@ -1044,38 +1036,6 @@ for opt do
   ;;
   --enable-replication) replication="yes"
   ;;
-  --disable-bochs) bochs="no"
-  ;;
-  --enable-bochs) bochs="yes"
-  ;;
-  --disable-cloop) cloop="no"
-  ;;
-  --enable-cloop) cloop="yes"
-  ;;
-  --disable-dmg) dmg="no"
-  ;;
-  --enable-dmg) dmg="yes"
-  ;;
-  --disable-qcow1) qcow1="no"
-  ;;
-  --enable-qcow1) qcow1="yes"
-  ;;
-  --disable-vdi) vdi="no"
-  ;;
-  --enable-vdi) vdi="yes"
-  ;;
-  --disable-vvfat) vvfat="no"
-  ;;
-  --enable-vvfat) vvfat="yes"
-  ;;
-  --disable-qed) qed="no"
-  ;;
-  --enable-qed) qed="yes"
-  ;;
-  --disable-parallels) parallels="no"
-  ;;
-  --enable-parallels) parallels="yes"
-  ;;
   --disable-vhost-user) vhost_user="no"
   ;;
   --enable-vhost-user) vhost_user="yes"
@@ -1389,14 +1349,6 @@ cat << EOF
   opengl          opengl support
   qom-cast-debug  cast debugging support
   tools           build qemu-io, qemu-nbd and qemu-img tools
-  bochs           bochs image format support
-  cloop           cloop image format support
-  dmg             dmg image format support
-  qcow1           qcow v1 image format support
-  vdi             vdi image format support
-  vvfat           vvfat image format support
-  qed             qed image format support
-  parallels       parallels image format support
   debug-mutex     mutex debugging support
   rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
   gio             libgio support
@@ -3285,31 +3237,6 @@ if test "$debug_mutex" = "yes" ; then
   echo "CONFIG_DEBUG_MUTEX=y" >> $config_host_mak
 fi
 
-if test "$bochs" = "yes" ; then
-  echo "CONFIG_BOCHS=y" >> $config_host_mak
-fi
-if test "$cloop" = "yes" ; then
-  echo "CONFIG_CLOOP=y" >> $config_host_mak
-fi
-if test "$dmg" = "yes" ; then
-  echo "CONFIG_DMG=y" >> $config_host_mak
-fi
-if test "$qcow1" = "yes" ; then
-  echo "CONFIG_QCOW1=y" >> $config_host_mak
-fi
-if test "$vdi" = "yes" ; then
-  echo "CONFIG_VDI=y" >> $config_host_mak
-fi
-if test "$vvfat" = "yes" ; then
-  echo "CONFIG_VVFAT=y" >> $config_host_mak
-fi
-if test "$qed" = "yes" ; then
-  echo "CONFIG_QED=y" >> $config_host_mak
-fi
-if test "$parallels" = "yes" ; then
-  echo "CONFIG_PARALLELS=y" >> $config_host_mak
-fi
-
 if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 9584587462..ba1c468620 100644
--- a/meson.build
+++ b/meson.build
@@ -3467,14 +3467,14 @@ if have_block
   summary_info += {'build virtiofs daemon': have_virtiofsd}
   summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
   summary_info += {'replication support': config_host.has_key('CONFIG_REPLICATION')}
-  summary_info += {'bochs support':     config_host.has_key('CONFIG_BOCHS')}
-  summary_info += {'cloop support':     config_host.has_key('CONFIG_CLOOP')}
-  summary_info += {'dmg support':       config_host.has_key('CONFIG_DMG')}
-  summary_info += {'qcow v1 support':   config_host.has_key('CONFIG_QCOW1')}
-  summary_info += {'vdi support':       config_host.has_key('CONFIG_VDI')}
-  summary_info += {'vvfat support':     config_host.has_key('CONFIG_VVFAT')}
-  summary_info += {'qed support':       config_host.has_key('CONFIG_QED')}
-  summary_info += {'parallels support': config_host.has_key('CONFIG_PARALLELS')}
+  summary_info += {'bochs support':     get_option('bochs').allowed()}
+  summary_info += {'cloop support':     get_option('cloop').allowed()}
+  summary_info += {'dmg support':       get_option('dmg').allowed()}
+  summary_info += {'qcow v1 support':   get_option('qcow1').allowed()}
+  summary_info += {'vdi support':       get_option('vdi').allowed()}
+  summary_info += {'vvfat support':     get_option('vvfat').allowed()}
+  summary_info += {'qed support':       get_option('qed').allowed()}
+  summary_info += {'parallels support': get_option('parallels').allowed()}
   summary_info += {'FUSE exports':      fuse}
 endif
 summary(summary_info, bool_yn: true, section: 'Block layer support')
diff --git a/meson_options.txt b/meson_options.txt
index 1b44b4e666..aef951eba1 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -222,3 +222,19 @@ option('fdt', type: 'combo', value: 'auto',
 
 option('selinux', type: 'feature', value: 'auto',
        description: 'SELinux support in qemu-nbd')
+option('bochs', type: 'feature', value: 'auto',
+       description: 'bochs image format support')
+option('cloop', type: 'feature', value: 'auto',
+       description: 'cloop image format support')
+option('dmg', type: 'feature', value: 'auto',
+       description: 'dmg image format support')
+option('qcow1', type: 'feature', value: 'auto',
+       description: 'qcow1 image format support')
+option('vdi', type: 'feature', value: 'auto',
+       description: 'vdi image format support')
+option('vvfat', type: 'feature', value: 'auto',
+       description: 'vvfat image format support')
+option('qed', type: 'feature', value: 'auto',
+       description: 'qed image format support')
+option('parallels', type: 'feature', value: 'auto',
+       description: 'parallels image format support')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index e040fa1501..e72c5f582e 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -28,16 +28,19 @@ meson_options_help() {
   printf "%s\n" '  auth-pam        PAM access control'
   printf "%s\n" '  avx2            AVX2 optimizations'
   printf "%s\n" '  avx512f         AVX512F optimizations'
+  printf "%s\n" '  bochs           bochs image format support'
   printf "%s\n" '  bpf             eBPF support'
   printf "%s\n" '  brlapi          brlapi character device driver'
   printf "%s\n" '  bzip2           bzip2 support for DMG images'
   printf "%s\n" '  cap-ng          cap_ng support'
+  printf "%s\n" '  cloop           cloop image format support'
   printf "%s\n" '  cocoa           Cocoa user interface (macOS only)'
   printf "%s\n" '  coreaudio       CoreAudio sound support'
   printf "%s\n" '  crypto-afalg    Linux AF_ALG crypto backend driver'
   printf "%s\n" '  curl            CURL block device driver'
   printf "%s\n" '  curses          curses UI'
   printf "%s\n" '  dbus-display    -display dbus support'
+  printf "%s\n" '  dmg             dmg image format support'
   printf "%s\n" '  docs            Documentations build support'
   printf "%s\n" '  dsound          DirectSound sound support'
   printf "%s\n" '  fuse            FUSE block device export'
@@ -76,6 +79,9 @@ meson_options_help() {
   printf "%s\n" '  nvmm            NVMM acceleration support'
   printf "%s\n" '  oss             OSS sound support'
   printf "%s\n" '  pa              PulseAudio sound support'
+  printf "%s\n" '  parallels       parallels image format support'
+  printf "%s\n" '  qcow1           qcow1 image format support'
+  printf "%s\n" '  qed             qed image format support'
   printf "%s\n" '  rbd             Ceph block device driver'
   printf "%s\n" '  sdl             SDL user interface'
   printf "%s\n" '  sdl-image       SDL Image support for icons'
@@ -91,6 +97,7 @@ meson_options_help() {
   printf "%s\n" '  u2f             U2F emulation support'
   printf "%s\n" '  usb-redir       libusbredir support'
   printf "%s\n" '  vde             vde network backend support'
+  printf "%s\n" '  vdi             vdi image format support'
   printf "%s\n" '  vhost-user-blk-server'
   printf "%s\n" '                  build vhost-user-blk server'
   printf "%s\n" '  virglrenderer   virgl rendering support'
@@ -101,6 +108,7 @@ meson_options_help() {
   printf "%s\n" '  vnc-png         PNG compression for VNC server'
   printf "%s\n" '  vnc-sasl        SASL authentication for VNC server'
   printf "%s\n" '  vte             vte support for the gtk UI'
+  printf "%s\n" '  vvfat           vvfat image format support'
   printf "%s\n" '  whpx            WHPX acceleration support'
   printf "%s\n" '  xen             Xen backend support'
   printf "%s\n" '  xen-pci-passthrough'
@@ -120,6 +128,8 @@ _meson_option_parse() {
     --disable-avx2) printf "%s" -Davx2=disabled ;;
     --enable-avx512f) printf "%s" -Davx512f=enabled ;;
     --disable-avx512f) printf "%s" -Davx512f=disabled ;;
+    --enable-bochs) printf "%s" -Dbochs=enabled ;;
+    --disable-bochs) printf "%s" -Dbochs=disabled ;;
     --enable-bpf) printf "%s" -Dbpf=enabled ;;
     --disable-bpf) printf "%s" -Dbpf=disabled ;;
     --enable-brlapi) printf "%s" -Dbrlapi=enabled ;;
@@ -135,6 +145,8 @@ _meson_option_parse() {
     --disable-cfi) printf "%s" -Dcfi=false ;;
     --enable-cfi-debug) printf "%s" -Dcfi_debug=true ;;
     --disable-cfi-debug) printf "%s" -Dcfi_debug=false ;;
+    --enable-cloop) printf "%s" -Dcloop=enabled ;;
+    --disable-cloop) printf "%s" -Dcloop=disabled ;;
     --enable-cocoa) printf "%s" -Dcocoa=enabled ;;
     --disable-cocoa) printf "%s" -Dcocoa=disabled ;;
     --enable-coreaudio) printf "%s" -Dcoreaudio=enabled ;;
@@ -147,6 +159,8 @@ _meson_option_parse() {
     --disable-curses) printf "%s" -Dcurses=disabled ;;
     --enable-dbus-display) printf "%s" -Ddbus_display=enabled ;;
     --disable-dbus-display) printf "%s" -Ddbus_display=disabled ;;
+    --enable-dmg) printf "%s" -Ddmg=enabled ;;
+    --disable-dmg) printf "%s" -Ddmg=disabled ;;
     --enable-docs) printf "%s" -Ddocs=enabled ;;
     --disable-docs) printf "%s" -Ddocs=disabled ;;
     --enable-dsound) printf "%s" -Ddsound=enabled ;;
@@ -231,6 +245,12 @@ _meson_option_parse() {
     --disable-oss) printf "%s" -Doss=disabled ;;
     --enable-pa) printf "%s" -Dpa=enabled ;;
     --disable-pa) printf "%s" -Dpa=disabled ;;
+    --enable-parallels) printf "%s" -Dparallels=enabled ;;
+    --disable-parallels) printf "%s" -Dparallels=disabled ;;
+    --enable-qcow1) printf "%s" -Dqcow1=enabled ;;
+    --disable-qcow1) printf "%s" -Dqcow1=disabled ;;
+    --enable-qed) printf "%s" -Dqed=enabled ;;
+    --disable-qed) printf "%s" -Dqed=disabled ;;
     --enable-rbd) printf "%s" -Drbd=enabled ;;
     --disable-rbd) printf "%s" -Drbd=disabled ;;
     --enable-sdl) printf "%s" -Dsdl=enabled ;;
@@ -269,6 +289,8 @@ _meson_option_parse() {
     --disable-usb-redir) printf "%s" -Dusb_redir=disabled ;;
     --enable-vde) printf "%s" -Dvde=enabled ;;
     --disable-vde) printf "%s" -Dvde=disabled ;;
+    --enable-vdi) printf "%s" -Dvdi=enabled ;;
+    --disable-vdi) printf "%s" -Dvdi=disabled ;;
     --enable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=enabled ;;
     --disable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=disabled ;;
     --enable-virglrenderer) printf "%s" -Dvirglrenderer=enabled ;;
@@ -287,6 +309,8 @@ _meson_option_parse() {
     --disable-vnc-sasl) printf "%s" -Dvnc_sasl=disabled ;;
     --enable-vte) printf "%s" -Dvte=enabled ;;
     --disable-vte) printf "%s" -Dvte=disabled ;;
+    --enable-vvfat) printf "%s" -Dvvfat=enabled ;;
+    --disable-vvfat) printf "%s" -Dvvfat=disabled ;;
     --enable-whpx) printf "%s" -Dwhpx=enabled ;;
     --disable-whpx) printf "%s" -Dwhpx=disabled ;;
     --enable-xen) printf "%s" -Dxen=enabled ;;
-- 
2.34.1



