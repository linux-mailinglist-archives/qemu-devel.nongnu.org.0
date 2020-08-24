Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAF224FCFF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 13:53:21 +0200 (CEST)
Received: from localhost ([::1]:50016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAB2O-00025i-Hk
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 07:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=45nv=cc=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1kAAyV-0002a8-Nk
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 07:49:19 -0400
Received: from gate-2.cri.epita.net ([163.5.55.20]:54826
 helo=mail-2.srv.cri.epita.fr)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=45nv=cc=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1kAAyS-0003d3-VL
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 07:49:19 -0400
Received: from MattGorko-Laptop.home
 (lfbn-idf1-1-1395-83.w90-79.abo.wanadoo.fr [90.79.87.83])
 (Authenticated sender: cesar.belley)
 by mail-2.srv.cri.epita.fr (Postfix) with ESMTPSA id CB551412D2;
 Mon, 24 Aug 2020 13:49:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lse.epita.fr; s=cri;
 t=1598269755; bh=YJtgc+Umbt+HNWGt7tySLOgQt78fbDR8UyHC6rJlKIk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oTDC3NIVh6lhcVRM8AI0SaPnG2rVSlbJIdpYRmzefuWTmVRBHh2LDEBh5UeN6vw+6
 gQhMJc527zljiGCHnEqcxlGFXGFIkFdMDR2uB5FYjYTdsfN85gHO7xqf5qD9swOT7m
 nMJK31cMq5g7+I641C7grEVM58WQC0DTOkI7VlUc=
From: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/13] configure: Add USB U2F key device
Date: Mon, 24 Aug 2020 13:48:22 +0200
Message-Id: <20200824114827.81623-9-cesar.belley@lse.epita.fr>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824114827.81623-1-cesar.belley@lse.epita.fr>
References: <20200824114827.81623-1-cesar.belley@lse.epita.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=163.5.55.20;
 envelope-from=srs0=45nv=cc=lse.epita.fr=cesar.belley@cri.epita.fr;
 helo=mail-2.srv.cri.epita.fr
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 07:49:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: César Belley <cesar.belley@lse.epita.fr>
---
 configure | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/configure b/configure
index 67832e3bab..75d38e5411 100755
--- a/configure
+++ b/configure
@@ -495,6 +495,7 @@ trace_file="trace"
 spice=""
 rbd=""
 smartcard=""
+u2f=""
 libusb=""
 usb_redir=""
 opengl=""
@@ -1411,6 +1412,10 @@ for opt do
   ;;
   --enable-smartcard) smartcard="yes"
   ;;
+  --disable-u2f) u2f="no"
+  ;;
+  --enable-u2f) u2f="yes"
+  ;;
   --disable-libusb) libusb="no"
   ;;
   --enable-libusb) libusb="yes"
@@ -1940,6 +1945,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   libiscsi        iscsi support
   libnfs          nfs support
   smartcard       smartcard support (libcacard)
+  u2f             U2F support (u2f-emu)
   libusb          libusb (for usb passthrough)
   live-block-migration   Block migration in the main migration stream
   usb-redir       usb network redirection support
@@ -5119,6 +5125,20 @@ if test "$smartcard" != "no"; then
     fi
 fi
 
+# check for u2f support
+if test "$u2f" != "no"; then
+    if $pkg_config --atleast-version=0.0.0 u2f-emu; then
+        u2f_emu_cflags=$($pkg_config --cflags u2f-emu)
+        u2f_emu_libs=$($pkg_config --libs u2f-emu)
+        u2f="yes"
+    else
+        if test "$u2f" = "yes"; then
+            feature_not_found "u2f" "Install u2f-emu"
+        fi
+        u2f="no"
+    fi
+fi
+
 # check for libusb
 if test "$libusb" != "no" ; then
     if $pkg_config --atleast-version=1.0.13 libusb-1.0; then
@@ -7166,6 +7186,12 @@ if test "$smartcard" = "yes" ; then
   echo "SMARTCARD_LIBS=$libcacard_libs" >> $config_host_mak
 fi
 
+if test "$u2f" = "yes" ; then
+  echo "CONFIG_U2F=y" >> $config_host_mak
+  echo "U2F_CFLAGS=$u2f_emu_cflags" >> $config_host_mak
+  echo "U2F_LIBS=$u2f_emu_libs" >> $config_host_mak
+fi
+
 if test "$libusb" = "yes" ; then
   echo "CONFIG_USB_LIBUSB=y" >> $config_host_mak
   echo "LIBUSB_CFLAGS=$libusb_cflags" >> $config_host_mak
-- 
2.28.0


