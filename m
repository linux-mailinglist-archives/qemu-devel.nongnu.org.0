Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AD5139B02
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 21:55:05 +0100 (CET)
Received: from localhost ([::1]:55720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir6jo-0001pU-8n
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 15:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51143)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ir6Tp-0005ZF-N5
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:38:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ir6To-00077T-JQ
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:38:33 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:47681 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ir6To-00074F-Ac
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:38:32 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id AF1761A20B0;
 Mon, 13 Jan 2020 21:38:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 94F391A1DF2;
 Mon, 13 Jan 2020 21:38:28 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/20] configure: Detect kcov support and introduce
 CONFIG_KCOV
Date: Mon, 13 Jan 2020 21:34:41 +0100
Message-Id: <1578947683-21011-19-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578947683-21011-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1578947683-21011-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: laurent@vivier.eu, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

kcov is kernel code coverage tracing tool. It requires kernel 4.4+
compiled with certain kernel options. Its interface consists of
three ioctls.

This patch checks if kcov support is present on build machine, and
stores the result in variable CONFIG_KCOV, meant to be used in
linux-user code related to the support for above mentioned ioctls.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 configure | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/configure b/configure
index 940bf9e..dbdba8f 100755
--- a/configure
+++ b/configure
@@ -4752,6 +4752,24 @@ if compile_prog "" "" ; then
   syncfs=yes
 fi
 
+# check for kcov support (kernel must be 4.4+, compiled with certain options)
+kcov=no
+cat > $TMPC << EOF
+#include <sys/kcov.h>
+
+int main(void)
+{
+    ioctl(-1, KCOV_ENABLE, NULL);
+    ioctl(-1, KCOV_DISABLE, NULL);
+    ioctl(-1, KCOV_INIT_TRACE, NULL);
+
+    return 0;
+}
+EOF
+if compile_prog "" "" ; then
+  kcov=yes
+fi
+
 # Check we have a new enough version of sphinx-build
 has_sphinx_build() {
     # This is a bit awkward but works: create a trivial document and
@@ -6874,6 +6892,9 @@ fi
 if test "$syncfs" = "yes" ; then
   echo "CONFIG_SYNCFS=y" >> $config_host_mak
 fi
+if test "$kcov" = "yes" ; then
+  echo "CONFIG_KCOV=y" >> $config_host_mak
+fi
 if test "$inotify" = "yes" ; then
   echo "CONFIG_INOTIFY=y" >> $config_host_mak
 fi
-- 
2.7.4


