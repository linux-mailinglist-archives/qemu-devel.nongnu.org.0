Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D1D54F240
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 09:54:42 +0200 (CEST)
Received: from localhost ([::1]:50626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o26oS-0007ta-Vv
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 03:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26l8-00056e-TJ
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:15 -0400
Received: from mga06b.intel.com ([134.134.136.31]:28791 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26l5-00074u-Md
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655452271; x=1686988271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PVPHvP/TAkXQitDanIQ6TmgG/MRsZgnG2oQCkqbIFzg=;
 b=OisuWcHtp9QEgkzJdR6VP3NleHZ7h5/UxtzuSLPuI/55/zHtYkNJm0iO
 sfpICEehLHo8MwAYk53c3Okpi/zCbjSqnXyhJenwtHxuH+tnwx11aoFba
 uSVaeiM1nCjve0wwSTa/H5Xwt1B66dvemeBSuN/+/3gh83fAgaq+QfWcI
 jKHQYdk2Af5G9419NXu3AMxA2mqY6hKNaaiWGJxNHrZ+99sdIDTxfLuMD
 K90mQ3zYAfBlhlji3gJ+OM/0CkMhf5LUnUxM+pcNcpgj1ZJitSjzfleZc
 JphdWve+fSTsn4Ftq/uOuspQ+IuTvzJdvDjW0RDavl4tM41Gvdr/eHabJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341102100"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341102100"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:06 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641936626"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:04 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Zhang Chen <chen.zhang@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>
Subject: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a submodule
 for QEMU
Date: Fri, 17 Jun 2022 15:36:19 +0800
Message-Id: <20220617073630.535914-2-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617073630.535914-1-chen.zhang@intel.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Make iovisor/ubpf project be a git submodule for QEMU.
It will auto clone ubpf project when configure QEMU.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 .gitmodules |  3 +++
 configure   | 20 ++++++++++++++++++++
 ubpf        |  1 +
 3 files changed, 24 insertions(+)
 create mode 160000 ubpf

diff --git a/.gitmodules b/.gitmodules
index b8bff47df8..30fb082f39 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -64,3 +64,6 @@
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
 	url = https://gitlab.com/libvirt/libvirt-ci.git
+[submodule "ubpf"]
+	path = ubpf
+	url = https://github.com/iovisor/ubpf.git
diff --git a/configure b/configure
index e69537c756..7dde1429dc 100755
--- a/configure
+++ b/configure
@@ -326,6 +326,7 @@ else
   slirp="auto"
 fi
 fdt="auto"
+ubpf="auto"
 
 # 2. Automatically enable/disable other options
 tcg="enabled"
@@ -820,6 +821,14 @@ for opt do
   ;;
   --enable-slirp=*) slirp="$optarg"
   ;;
+  --disable-ubpf) ubpf="disabled"
+  ;;
+  --enable-ubpf) ubpf="enabled"
+  ;;
+  --enable-ubpf=git) ubpf="internal"
+  ;;
+  --enable-ubpf=*) ubpf="$optarg"
+  ;;
   --disable-tcg) tcg="disabled"
                  plugins="no"
   ;;
@@ -2176,6 +2185,16 @@ if test "$have_ubsan" = "yes"; then
   QEMU_LDFLAGS="-fsanitize=undefined $QEMU_LDFLAGS"
 fi
 
+##########################################
+# check for ubpf
+
+case "$ubpf" in
+  auto | enabled | internal)
+    # Simpler to always update submodule, even if not needed.
+    git_submodules="${git_submodules} ubpf"
+    ;;
+esac
+
 ##########################################
 
 # Exclude --warn-common with TSan to suppress warnings from the TSan libraries.
@@ -2664,6 +2683,7 @@ if test "$skip_meson" = no; then
   # QEMU options
   test "$cfi" != false && meson_option_add "-Dcfi=$cfi"
   test "$fdt" != auto && meson_option_add "-Dfdt=$fdt"
+  test "$ubpf" != auto && meson_option_add "-Dubpf=$ubpf"
   test -n "${LIB_FUZZING_ENGINE+xxx}" && meson_option_add "-Dfuzzing_engine=$LIB_FUZZING_ENGINE"
   test "$qemu_suffix" != qemu && meson_option_add "-Dqemu_suffix=$qemu_suffix"
   test "$slirp" != auto && meson_option_add "-Dslirp=$slirp"
diff --git a/ubpf b/ubpf
new file mode 160000
index 0000000000..0dd334daf4
--- /dev/null
+++ b/ubpf
@@ -0,0 +1 @@
+Subproject commit 0dd334daf4849137fa40d2b7676d2bf920d5c81d
-- 
2.25.1


