Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8581A919E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 05:41:30 +0200 (CEST)
Received: from localhost ([::1]:42356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOYvZ-0003HH-Hd
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 23:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48666)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jingqi.liu@intel.com>) id 1jOYuW-0002A1-6p
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 23:40:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jingqi.liu@intel.com>) id 1jOYuU-0000l3-Ur
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 23:40:24 -0400
Received: from mga01.intel.com ([192.55.52.88]:4319)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jingqi.liu@intel.com>)
 id 1jOYuU-0000iK-LK
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 23:40:22 -0400
IronPort-SDR: Vso2MVOuXhj6IrylKLZ5Z2G2aUgZB3/GkWDmqTq/n+5pIHFf3a3yepjvw9ZVmhjZd1P/hmO3AM
 5CUnBG/lJ9zA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 20:40:19 -0700
IronPort-SDR: EdPkNu5xjSXD4FZCpo1TdrgpS97aHxyJXq2yKdksV0tKeUMzPMhQXH+8wMznzuvl+kAzMlg3Ze
 ytZXUrgV1FRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,385,1580803200"; d="scan'208";a="256729973"
Received: from dazhang1-mobile.sh.intel.com ([10.239.48.70])
 by orsmga006.jf.intel.com with ESMTP; 14 Apr 2020 20:40:17 -0700
From: Jingqi Liu <jingqi.liu@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v2 3/3] configure: add libdaxctl support
Date: Wed, 15 Apr 2020 11:35:38 +0800
Message-Id: <20200415033538.43329-4-jingqi.liu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415033538.43329-1-jingqi.liu@intel.com>
References: <20200415033538.43329-1-jingqi.liu@intel.com>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 192.55.52.88
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
Cc: Jingqi Liu <jingqi.liu@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a pair of configure options --{enable,disable}-libdaxctl to control
whether QEMU is compiled with libdaxctl [1]. Libdaxctl is a utility
library for managing the device dax subsystem.

QEMU uses mmap(2) to maps vNVDIMM backends and aligns the mapping
address to the page size (getpagesize(2)) by default. However, some
types of backends may require an alignment different than the page
size. The 'align' option is provided to memory-backend-file to allow
users to specify the proper alignment.

For device dax (e.g., /dev/dax0.0), the 'align' option needs to match
the alignment requirement of the device dax, which can be fetched
through the libdaxctl APIs.

[1] Libdaxctl is a part of ndctl project.
The project's repository is: https://github.com/pmem/ndctl

For more information about libdaxctl APIs, you can refer to the
comments in source code of: pmem/ndctl/daxctl/lib/libdaxctl.c.

Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
---
 configure | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/configure b/configure
index e225a1e3ff..df1752cf08 100755
--- a/configure
+++ b/configure
@@ -509,6 +509,7 @@ libpmem=""
 default_devices="yes"
 plugins="no"
 fuzzing="no"
+libdaxctl=""
 
 supported_cpu="no"
 supported_os="no"
@@ -1601,6 +1602,10 @@ for opt do
   ;;
   --gdb=*) gdb_bin="$optarg"
   ;;
+  --enable-libdaxctl) libdaxctl=yes
+  ;;
+  --disable-libdaxctl) libdaxctl=no
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1894,6 +1899,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   debug-mutex     mutex debugging support
   libpmem         libpmem support
   xkbcommon       xkbcommon support
+  libdaxctl       libdaxctl support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -6190,6 +6196,25 @@ if test "$libpmem" != "no"; then
 	fi
 fi
 
+##########################################
+# check for libdaxctl
+
+if test "$libdaxctl" != "no"; then
+	if $pkg_config --exists "libdaxctl"; then
+		libdaxctl="yes"
+		libdaxctl_libs=$($pkg_config --libs libdaxctl)
+		libdaxctl_cflags=$($pkg_config --cflags libdaxctl)
+		libs_softmmu="$libs_softmmu $libdaxctl_libs"
+		QEMU_CFLAGS="$QEMU_CFLAGS $libdaxctl_cflags"
+	else
+		if test "$libdaxctl" = "yes" ; then
+			feature_not_found "libdaxctl" "Install libdaxctl"
+		fi
+		libdaxctl="no"
+	fi
+fi
+
+
 ##########################################
 # check for slirp
 
@@ -6767,6 +6792,7 @@ echo "parallels support $parallels"
 echo "sheepdog support  $sheepdog"
 echo "capstone          $capstone"
 echo "libpmem support   $libpmem"
+echo "libdaxctl support $libdaxctl"
 echo "libudev           $libudev"
 echo "default devices   $default_devices"
 echo "plugin support    $plugins"
@@ -7590,6 +7616,10 @@ if test "$libpmem" = "yes" ; then
   echo "CONFIG_LIBPMEM=y" >> $config_host_mak
 fi
 
+if test "$libdaxctl" = "yes" ; then
+  echo "CONFIG_LIBDAXCTL=y" >> $config_host_mak
+fi
+
 if test "$bochs" = "yes" ; then
   echo "CONFIG_BOCHS=y" >> $config_host_mak
 fi
-- 
2.17.1


