Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2666EA6ED
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:29:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn4A-00034m-GL; Fri, 21 Apr 2023 05:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppn48-00034K-8f; Fri, 21 Apr 2023 05:28:28 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppn45-00025S-O1; Fri, 21 Apr 2023 05:28:28 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id CD0715E639;
 Fri, 21 Apr 2023 12:28:15 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id xRbs6S1Oh4Y0-A8cz5hI8; Fri, 21 Apr 2023 12:28:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682069294; bh=17YNwFm8Karbyne35n/ZbXTYptxjJvHR1qlAa2FYlk0=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=g2My+8AWSi0jbl3qH3JkNs7yCx6MgoZZ9q9fSx2F7wXvfNfeHgUWeEuA9lS2nvG6T
 GVHeOAp51sHhUSGTdTluF7dGsRJDiosqxKRyJNxw/qXNZ99JEFdoxqeAh7IFTY4qTo
 DJS96VQmZ/ITrlWczMMx/jDCJxZ3NZ8K2XWov4BQ=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@yandex-team.ru
Subject: [PATCH v2] block: add configure options for excluding vmdk,
 vhdx and vpc
Date: Fri, 21 Apr 2023 12:27:58 +0300
Message-Id: <20230421092758.814122-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Let's add --enable / --disable configure options for these formats,
so that those who don't need them may not build them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---

v2: just a resend instead of ping, bonus: fix mistake in commit message.

 block/meson.build             | 18 +++++++++++++-----
 meson.build                   |  3 +++
 meson_options.txt             |  6 ++++++
 scripts/meson-buildoptions.sh |  9 +++++++++
 4 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/block/meson.build b/block/meson.build
index 382bec0e7d..13337bd070 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -38,11 +38,6 @@ block_ss.add(files(
   'snapshot-access.c',
   'throttle-groups.c',
   'throttle.c',
-  'vhdx-endian.c',
-  'vhdx-log.c',
-  'vhdx.c',
-  'vmdk.c',
-  'vpc.c',
   'write-threshold.c',
 ), zstd, zlib, gnutls)
 
@@ -55,6 +50,19 @@ endif
 if get_option('vdi').allowed()
   block_ss.add(files('vdi.c'))
 endif
+if get_option('vhdx').allowed()
+  block_ss.add(files(
+    'vhdx-endian.c',
+    'vhdx-log.c',
+    'vhdx.c'
+  ))
+endif
+if get_option('vmdk').allowed()
+  block_ss.add(files('vmdk.c'))
+endif
+if get_option('vpc').allowed()
+  block_ss.add(files('vpc.c'))
+endif
 if get_option('cloop').allowed()
   block_ss.add(files('cloop.c'))
 endif
diff --git a/meson.build b/meson.build
index c44d05a13f..a87f2385f6 100644
--- a/meson.build
+++ b/meson.build
@@ -3921,6 +3921,9 @@ if have_block
   summary_info += {'dmg support':       get_option('dmg').allowed()}
   summary_info += {'qcow v1 support':   get_option('qcow1').allowed()}
   summary_info += {'vdi support':       get_option('vdi').allowed()}
+  summary_info += {'vhdx support':      get_option('vhdx').allowed()}
+  summary_info += {'vmdk support':      get_option('vmdk').allowed()}
+  summary_info += {'vpc support':       get_option('vpc').allowed()}
   summary_info += {'vvfat support':     get_option('vvfat').allowed()}
   summary_info += {'qed support':       get_option('qed').allowed()}
   summary_info += {'parallels support': get_option('parallels').allowed()}
diff --git a/meson_options.txt b/meson_options.txt
index fc9447d267..369989f06b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -299,6 +299,12 @@ option('qcow1', type: 'feature', value: 'auto',
        description: 'qcow1 image format support')
 option('vdi', type: 'feature', value: 'auto',
        description: 'vdi image format support')
+option('vhdx', type: 'feature', value: 'auto',
+       description: 'vhdx image format support')
+option('vmdk', type: 'feature', value: 'auto',
+       description: 'vmdk image format support')
+option('vpc', type: 'feature', value: 'auto',
+       description: 'vpc image format support')
 option('vvfat', type: 'feature', value: 'auto',
        description: 'vvfat image format support')
 option('qed', type: 'feature', value: 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 009fab1515..5fb4316935 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -167,6 +167,7 @@ meson_options_help() {
   printf "%s\n" '                  VDUSE block export support'
   printf "%s\n" '  vfio-user-server'
   printf "%s\n" '                  vfio-user server support'
+  printf "%s\n" '  vhdx            vhdx image format support'
   printf "%s\n" '  vhost-crypto    vhost-user crypto backend support'
   printf "%s\n" '  vhost-kernel    vhost kernel backend support'
   printf "%s\n" '  vhost-net       vhost-net kernel acceleration support'
@@ -176,10 +177,12 @@ meson_options_help() {
   printf "%s\n" '  vhost-vdpa      vhost-vdpa kernel backend support'
   printf "%s\n" '  virglrenderer   virgl rendering support'
   printf "%s\n" '  virtfs          virtio-9p support'
+  printf "%s\n" '  vmdk            vmdk image format support'
   printf "%s\n" '  vmnet           vmnet.framework network backend support'
   printf "%s\n" '  vnc             VNC server'
   printf "%s\n" '  vnc-jpeg        JPEG lossy compression for VNC server'
   printf "%s\n" '  vnc-sasl        SASL authentication for VNC server'
+  printf "%s\n" '  vpc             vpc image format support'
   printf "%s\n" '  vte             vte support for the gtk UI'
   printf "%s\n" '  vvfat           vvfat image format support'
   printf "%s\n" '  whpx            WHPX acceleration support'
@@ -445,6 +448,8 @@ _meson_option_parse() {
     --disable-vduse-blk-export) printf "%s" -Dvduse_blk_export=disabled ;;
     --enable-vfio-user-server) printf "%s" -Dvfio_user_server=enabled ;;
     --disable-vfio-user-server) printf "%s" -Dvfio_user_server=disabled ;;
+    --enable-vhdx) printf "%s" -Dvhdx=enabled ;;
+    --disable-vhdx) printf "%s" -Dvhdx=disabled ;;
     --enable-vhost-crypto) printf "%s" -Dvhost_crypto=enabled ;;
     --disable-vhost-crypto) printf "%s" -Dvhost_crypto=disabled ;;
     --enable-vhost-kernel) printf "%s" -Dvhost_kernel=enabled ;;
@@ -461,6 +466,8 @@ _meson_option_parse() {
     --disable-virglrenderer) printf "%s" -Dvirglrenderer=disabled ;;
     --enable-virtfs) printf "%s" -Dvirtfs=enabled ;;
     --disable-virtfs) printf "%s" -Dvirtfs=disabled ;;
+    --enable-vmdk) printf "%s" -Dvmdk=enabled ;;
+    --disable-vmdk) printf "%s" -Dvmdk=disabled ;;
     --enable-vmnet) printf "%s" -Dvmnet=enabled ;;
     --disable-vmnet) printf "%s" -Dvmnet=disabled ;;
     --enable-vnc) printf "%s" -Dvnc=enabled ;;
@@ -469,6 +476,8 @@ _meson_option_parse() {
     --disable-vnc-jpeg) printf "%s" -Dvnc_jpeg=disabled ;;
     --enable-vnc-sasl) printf "%s" -Dvnc_sasl=enabled ;;
     --disable-vnc-sasl) printf "%s" -Dvnc_sasl=disabled ;;
+    --enable-vpc) printf "%s" -Dvpc=enabled ;;
+    --disable-vpc) printf "%s" -Dvpc=disabled ;;
     --enable-vte) printf "%s" -Dvte=enabled ;;
     --disable-vte) printf "%s" -Dvte=disabled ;;
     --enable-vvfat) printf "%s" -Dvvfat=enabled ;;
-- 
2.34.1


