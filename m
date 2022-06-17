Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8709554F241
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 09:54:49 +0200 (CEST)
Received: from localhost ([::1]:51052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o26oa-0008A9-Kp
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 03:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26l9-00056f-2Y
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:15 -0400
Received: from mga06b.intel.com ([134.134.136.31]:28798 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26l5-000779-NF
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655452271; x=1686988271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JVcVA2OckO5nc/tQNrzCeTGJe2wl+Hute7/BhRzsybY=;
 b=mPdmMETtoG361485L27LApaZAu/pnlgdlqam7zGV1uDEXTt1UHO3xu6G
 f86LIImLT/tkUJyc64QJM7dtFz4hT6/9Vt5GMkuhmLqFN2zIcBvsh8Shz
 Zd39P0XlSZymW2kt4OM9+gNltJhClakzJRjB7OVxj1GTek3jQiqnZx6z8
 e8rO7bcTESLoJgBa5oPzxcUpXa27gmoXpRqY+V+Ro89tRH71yoF1Y2WFE
 KxkFOdjE9fM9BQ6BR6o6DzEtwIBmGxDK+aKkIhAGSLouSucYvdAVhGA5v
 sSnZL01jta+eKBdvMKi2NJbzO4kGR7euVmPIgIZgPfCQ+vmGMTRGCo/NC Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341102114"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341102114"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:10 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641936646"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:07 -0700
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
Subject: [RFC PATCH 02/12] meson: Add ubpf build config and misc
Date: Fri, 17 Jun 2022 15:36:20 +0800
Message-Id: <20220617073630.535914-3-chen.zhang@intel.com>
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

Make meson to build iovisor/ubpf code in Qemu.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 meson.build                         | 47 +++++++++++++++++++++++++++++
 meson_options.txt                   |  3 ++
 scripts/coverity-scan/COMPONENTS.md |  3 ++
 scripts/meson-buildoptions.sh       |  5 +++
 4 files changed, 58 insertions(+)

diff --git a/meson.build b/meson.build
index 21cd949082..f370c1aba7 100644
--- a/meson.build
+++ b/meson.build
@@ -2717,9 +2717,53 @@ if not fdt.found() and fdt_required.length() > 0
   error('fdt not available but required by targets ' + ', '.join(fdt_required))
 endif
 
+ubpf = not_found
+ubpf_opt = 'disabled'
+if have_system
+  ubpf_opt = get_option('ubpf')
+  if ubpf_opt in ['enabled', 'auto', 'system']
+    have_internal = fs.exists(meson.current_source_dir() / 'ubpf/vm/Makefile')
+    ubpf = dependency('ubpf', kwargs: static_kwargs,
+                      method: 'pkg-config',
+                      required: ubpf_opt == 'system' or
+                      ubpf_opt == 'enabled' and not have_internal)
+    if ubpf.found()
+      ubpf_opt = 'system'
+    elif have_internal
+      ubpf_opt = 'internal'
+    else
+      ubpf_opt = 'disabled'
+    endif
+  endif
+  if ubpf_opt == 'internal'
+    ubpf_data = configuration_data()
+
+    ubpf_files = files(
+      'ubpf/vm/ubpf_jit_x86_64.c',
+      'ubpf/vm/ubpf_vm.c',
+      'ubpf/vm/ubpf_loader.c',
+    )
+
+    ubpf_cargs = [
+      '-Wno-error', '-w',
+      '-include', 'ubpf-defs.h'
+    ]
+
+    configure_file(output: 'ubpf-defs.h', configuration: ubpf_data)
+    ubpf_inc = include_directories('ubpf/vm', 'ubpf/vm/inc')
+    libubpf = static_library('ubpf',
+                             sources: ubpf_files,
+                             c_args: ubpf_cargs,
+                             include_directories: ubpf_inc)
+    ubpf = declare_dependency(link_with: libubpf,
+                              include_directories: ubpf_inc)
+  endif
+endif
+
 config_host_data.set('CONFIG_CAPSTONE', capstone.found())
 config_host_data.set('CONFIG_FDT', fdt.found())
 config_host_data.set('CONFIG_SLIRP', slirp.found())
+config_host_data.set('CONFIG_UBPF', ubpf.found())
 
 #####################
 # Generated sources #
@@ -3046,6 +3090,8 @@ subdir('softmmu')
 common_ss.add(capstone)
 specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
 
+common_ss.add(ubpf)
+
 # Work around a gcc bug/misfeature wherein constant propagation looks
 # through an alias:
 #   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99696
@@ -3911,6 +3957,7 @@ summary_info += {'libudev':           libudev}
 # Dummy dependency, keep .found()
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
 summary_info += {'selinux':           selinux}
+summary_info += {'ubpf support':      ubpf_opt == 'internal' ? ubpf_opt : ubpf}
 summary(summary_info, bool_yn: true, section: 'Dependencies')
 
 if not supported_cpus.contains(cpu)
diff --git a/meson_options.txt b/meson_options.txt
index 2de94af037..1eb9164857 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -262,6 +262,9 @@ option('slirp', type: 'combo', value: 'auto',
 option('fdt', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
        description: 'Whether and how to find the libfdt library')
+option('ubpf', type: 'combo', value: 'auto',
+       choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
+       description: 'Whether and how to find the ubpf library')
 
 option('selinux', type: 'feature', value: 'auto',
        description: 'SELinux support in qemu-nbd')
diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index 183f26a32c..dd28116674 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -72,6 +72,9 @@ char
 capstone
   ~ (/qemu)?(/capstone/.*)
 
+ubpf
+  ~ (/qemu)?(/ubpf/vm/.*)
+
 crypto
   ~ (/qemu)?((/include)?/crypto/.*|/hw/.*/crypto.*)
 
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 00ea4d8cd1..044dde1cff 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -37,6 +37,8 @@ meson_options_help() {
   printf "%s\n" '                           getrandom()'
   printf "%s\n" '  --enable-slirp[=CHOICE]  Whether and how to find the slirp library'
   printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
+  printf "%s\n" '  --enable-ubpf[=CHOICE]   Whether and how to find the ubpf library'
+  printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-strip           Strip targets on install'
   printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interpreter (slow)'
   printf "%s\n" '  --enable-trace-backends=CHOICES'
@@ -379,6 +381,9 @@ _meson_option_parse() {
     --enable-slirp=*) quote_sh "-Dslirp=$2" ;;
     --enable-slirp-smbd) printf "%s" -Dslirp_smbd=enabled ;;
     --disable-slirp-smbd) printf "%s" -Dslirp_smbd=disabled ;;
+    --enable-ubpf) printf "%s" -Dubpf=enabled ;;
+    --disable-ubpf) printf "%s" -Dubpf=disabled ;;
+    --enable-ubpf=*) quote_sh "-Dubpf=$2" ;;
     --enable-smartcard) printf "%s" -Dsmartcard=enabled ;;
     --disable-smartcard) printf "%s" -Dsmartcard=disabled ;;
     --enable-snappy) printf "%s" -Dsnappy=enabled ;;
-- 
2.25.1


