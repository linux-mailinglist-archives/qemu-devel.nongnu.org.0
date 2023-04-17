Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE8D6E4A4B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:47:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poPCP-0006Hh-Dr; Mon, 17 Apr 2023 09:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <you.chen@intel.com>)
 id 1poKPX-0001Bz-Ru
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 04:40:31 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <you.chen@intel.com>)
 id 1poKPV-0003jJ-6F
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 04:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681720829; x=1713256829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dMNAyUtvCP4aVKY23naukDfU+KXRXMSByO/BAwzB2eY=;
 b=GsqDK10nLfLm+D8w+of6AgQGHVUijIr3mOxhpB+O7e/4l2WgU6J6wD7c
 mr0Ff1OVnjxtcFqq/iVU5mfKPd6EbHN3YByjbtDOL9z75jZ44p1m+QwrI
 PIhxKltOzAJwj+YMYc1/KxcIUs9/DUS4MgS/MVg0lqt13QVamKW2UScI3
 3Ue7LBJ9S6slV3lywfZB1+tnjNKgRqRI84F79M7utTOwDq1MWhSMKQPlz
 1Emu//Dgmug55E61u9eoELOwyK7J1TO6x3QwCk2zH3vWOjnI8DtMpeAk5
 45rK9Qr6dSezEL8qsqM8GDsMnHgNHOu1s1SIn3vhDdKVnPv5Ygy4VsY1K A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="344838012"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="344838012"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 01:40:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="684086674"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="684086674"
Received: from unknown (HELO inspur05.sh.intel.com) ([10.112.227.25])
 by orsmga007.jf.intel.com with ESMTP; 17 Apr 2023 01:40:22 -0700
From: "you.chen" <you.chen@intel.com>
To: qemu-devel@nongnu.org
Cc: "you.chen" <you.chen@intel.com>, "dennis . wu" <dennis.wu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/2] migration: add build option to support qemu build with
 qatzip
Date: Mon, 17 Apr 2023 16:39:34 +0800
Message-Id: <20230417083935.415782-2-you.chen@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230417083935.415782-1-you.chen@intel.com>
References: <20230417083935.415782-1-you.chen@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=you.chen@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 17 Apr 2023 09:47:05 -0400
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

In this patch, we added qatzip build option in the meson_options.txt and meson-buildoptons.sh to support qemu build with qatzip.
If you installed qatzip and would like to use it for live migration, you could use "--enable-qatzip" during configure, it will check qatzip availablility from the pkg-config list (Please make sure you correctly set PKG_CONFIG_PATH to include qatzip.pc).
If you simply use "configure" or use "configure --disable-qatzip", qatzip will not be enabled.

Co-developed-by: dennis.wu <dennis.wu@intel.com>

Signed-off-by: you.chen <you.chen@intel.com>
---
 meson.build                   | 11 ++++++++++-
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 29f8644d6d..aa7445e29e 100644
--- a/meson.build
+++ b/meson.build
@@ -553,6 +553,13 @@ if have_system or have_tools
 endif
 zlib = dependency('zlib', required: true, kwargs: static_kwargs)
 
+qatzip = not_found
+if not get_option('qatzip').auto()
+  qatzip = dependency('qatzip', required: get_option('qatzip'),
+                         method: 'pkg-config',
+                         static: enable_static)
+endif
+
 libaio = not_found
 if not get_option('linux_aio').auto() or have_block
   libaio = cc.find_library('aio', has_headers: ['libaio.h'],
@@ -1863,6 +1870,7 @@ config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
 config_host_data.set('CONFIG_LIBNFS', libnfs.found())
 config_host_data.set('CONFIG_LIBSSH', libssh.found())
 config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
+config_host_data.set('CONFIG_QATZIP', qatzip.found())
 config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
 config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
 config_host_data.set('CONFIG_NUMA', numa.found())
@@ -3339,7 +3347,7 @@ libmigration = static_library('migration', sources: migration_files + genh,
                               name_suffix: 'fa',
                               build_by_default: false)
 migration = declare_dependency(link_with: libmigration,
-                               dependencies: [zlib, qom, io])
+                               dependencies: [qatzip, zlib, qom, io])
 softmmu_ss.add(migration)
 
 block_ss = block_ss.apply(config_host, strict: false)
@@ -3986,6 +3994,7 @@ summary_info += {'vde support':       vde}
 summary_info += {'netmap support':    have_netmap}
 summary_info += {'l2tpv3 support':    have_l2tpv3}
 summary_info += {'Linux AIO support': libaio}
+summary_info += {'qatzip compress support': qatzip}
 summary_info += {'Linux io_uring support': linux_io_uring}
 summary_info += {'ATTR/XATTR support': libattr}
 summary_info += {'RDMA support':      rdma}
diff --git a/meson_options.txt b/meson_options.txt
index fc9447d267..ef6d639876 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -191,6 +191,8 @@ option('smartcard', type : 'feature', value : 'auto',
        description: 'CA smartcard emulation support')
 option('snappy', type : 'feature', value : 'auto',
        description: 'snappy compression support')
+option('qatzip', type : 'feature', value : 'auto',
+       description: 'qatzip compress support')
 option('spice', type : 'feature', value : 'auto',
        description: 'Spice server support')
 option('spice_protocol', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 009fab1515..84d110197d 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -152,6 +152,7 @@ meson_options_help() {
   printf "%s\n" '  slirp-smbd      use smbd (at path --smbd=*) in slirp networking'
   printf "%s\n" '  smartcard       CA smartcard emulation support'
   printf "%s\n" '  snappy          snappy compression support'
+  printf "%s\n" '  qatzip          qatzip compression support'
   printf "%s\n" '  sndio           sndio sound support'
   printf "%s\n" '  sparse          sparse checker'
   printf "%s\n" '  spice           Spice server support'
@@ -332,6 +333,8 @@ _meson_option_parse() {
     --disable-libvduse) printf "%s" -Dlibvduse=disabled ;;
     --enable-linux-aio) printf "%s" -Dlinux_aio=enabled ;;
     --disable-linux-aio) printf "%s" -Dlinux_aio=disabled ;;
+    --enable-qatzip) printf "%s" -Dqatzip=enabled ;;
+    --disable-qatzip) printf "%s" -Dqatzip=disabled ;;
     --enable-linux-io-uring) printf "%s" -Dlinux_io_uring=enabled ;;
     --disable-linux-io-uring) printf "%s" -Dlinux_io_uring=disabled ;;
     --enable-live-block-migration) printf "%s" -Dlive_block_migration=enabled ;;
-- 
2.27.0


