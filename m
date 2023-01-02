Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759F965AFB9
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 11:43:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCIGf-00055s-0K; Mon, 02 Jan 2023 05:42:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pCIGa-00055V-EV
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:42:05 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pCIGX-00012S-Vn
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:42:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2QhzAAq0PS4o8cQlq+bINYH/3002C53c+D0yH4ozXOY=; b=XvhoAFppE11uJNxt7P+1weZJMc
 wTVIPMp6imrSVzBTtElZEBS4Vjb87qtuo1x6YjRo+9EP2/EDAzG/qmqxK261U5mctB11h9s9hXAbq
 cYXFnQh2pwKFI18As/UL8kvTKTRr8J8wcmrtBJGn8HrDWdH2RJg5O/+u56lLqoi2S1Z4=;
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Anton Johansson <anjo@rev.ng>, philmd@linaro.org, peter.maydell@linaro.org,
 bcain@quicinc.com, quic_mathbern@quicinc.com, stefanha@redhat.com,
 Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH] Update scripts/meson-buildoptions.sh
Date: Mon,  2 Jan 2023 11:41:13 +0100
Message-Id: <20230102104113.3438895-1-ale@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Note: `Makefile` relies on modification dates in the source tree to
detect changes to `meson_options.txt`. However, git does not track
those. Therefore, the following was necessary to regenerate
`meson-buildoptions.sh`:

    touch meson_options.txt
    cd "$BUILD_DIR"
    make update-buildoptions

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
---
 scripts/meson-buildoptions.sh | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index aa6e30ea911..0f71e92dcba 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -10,6 +10,9 @@ meson_options_help() {
   printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
   printf "%s\n" '  --datadir=VALUE          Data file directory [share]'
   printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
+  printf "%s\n" '  --disable-hexagon-idef-parser'
+  printf "%s\n" '                           use idef-parser to automatically generate TCG'
+  printf "%s\n" '                           code for the Hexagon frontend'
   printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
   printf "%s\n" '  --docdir=VALUE           Base directory for documentation installation'
   printf "%s\n" '                           (can be empty) [share/doc]'
@@ -40,7 +43,8 @@ meson_options_help() {
   printf "%s\n" '  --enable-trace-backends=CHOICES'
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
-  printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [share/qemu-firmware]'
+  printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [share/qemu-'
+  printf "%s\n" '                           firmware]'
   printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
   printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
   printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
@@ -93,7 +97,7 @@ meson_options_help() {
   printf "%s\n" '  glusterfs       Glusterfs block device driver'
   printf "%s\n" '  gnutls          GNUTLS cryptography support'
   printf "%s\n" '  gtk             GTK+ user interface'
-  printf "%s\n" '  gtk-clipboard   clipboard support for GTK (EXPERIMENTAL, MAY HANG)'
+  printf "%s\n" '  gtk-clipboard   clipboard support for the gtk UI (EXPERIMENTAL, MAY HANG)'
   printf "%s\n" '  guest-agent     Build QEMU Guest Agent'
   printf "%s\n" '  guest-agent-msi Build MSI package for the QEMU Guest Agent'
   printf "%s\n" '  hax             HAX acceleration support'
@@ -156,6 +160,8 @@ meson_options_help() {
   printf "%s\n" '  usb-redir       libusbredir support'
   printf "%s\n" '  vde             vde network backend support'
   printf "%s\n" '  vdi             vdi image format support'
+  printf "%s\n" '  vduse-blk-export'
+  printf "%s\n" '                  VDUSE block export support'
   printf "%s\n" '  vfio-user-server'
   printf "%s\n" '                  vfio-user server support'
   printf "%s\n" '  vhost-crypto    vhost-user crypto backend support'
@@ -164,8 +170,6 @@ meson_options_help() {
   printf "%s\n" '  vhost-user      vhost-user backend support'
   printf "%s\n" '  vhost-user-blk-server'
   printf "%s\n" '                  build vhost-user-blk server'
-  printf "%s\n" '  vduse-blk-export'
-  printf "%s\n" '                  VDUSE block export support'
   printf "%s\n" '  vhost-vdpa      vhost-vdpa kernel backend support'
   printf "%s\n" '  virglrenderer   virgl rendering support'
   printf "%s\n" '  virtfs          virtio-9p support'
@@ -283,6 +287,8 @@ _meson_option_parse() {
     --disable-guest-agent-msi) printf "%s" -Dguest_agent_msi=disabled ;;
     --enable-hax) printf "%s" -Dhax=enabled ;;
     --disable-hax) printf "%s" -Dhax=disabled ;;
+    --enable-hexagon-idef-parser) printf "%s" -Dhexagon_idef_parser=true ;;
+    --disable-hexagon-idef-parser) printf "%s" -Dhexagon_idef_parser=false ;;
     --enable-hvf) printf "%s" -Dhvf=enabled ;;
     --disable-hvf) printf "%s" -Dhvf=disabled ;;
     --iasl=*) quote_sh "-Diasl=$2" ;;
@@ -429,6 +435,8 @@ _meson_option_parse() {
     --disable-vde) printf "%s" -Dvde=disabled ;;
     --enable-vdi) printf "%s" -Dvdi=enabled ;;
     --disable-vdi) printf "%s" -Dvdi=disabled ;;
+    --enable-vduse-blk-export) printf "%s" -Dvduse_blk_export=enabled ;;
+    --disable-vduse-blk-export) printf "%s" -Dvduse_blk_export=disabled ;;
     --enable-vfio-user-server) printf "%s" -Dvfio_user_server=enabled ;;
     --disable-vfio-user-server) printf "%s" -Dvfio_user_server=disabled ;;
     --enable-vhost-crypto) printf "%s" -Dvhost_crypto=enabled ;;
@@ -441,8 +449,6 @@ _meson_option_parse() {
     --disable-vhost-user) printf "%s" -Dvhost_user=disabled ;;
     --enable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=enabled ;;
     --disable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=disabled ;;
-    --enable-vduse-blk-export) printf "%s" -Dvduse_blk_export=enabled ;;
-    --disable-vduse-blk-export) printf "%s" -Dvduse_blk_export=disabled ;;
     --enable-vhost-vdpa) printf "%s" -Dvhost_vdpa=enabled ;;
     --disable-vhost-vdpa) printf "%s" -Dvhost_vdpa=disabled ;;
     --enable-virglrenderer) printf "%s" -Dvirglrenderer=enabled ;;
-- 
2.38.1


