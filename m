Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B556EAB8C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:27:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqm4-0003KS-4C; Fri, 21 Apr 2023 09:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqm2-0003IM-5Y
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:26:02 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqm0-0003To-Dt
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682083560; x=1713619560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VisIyIL59SJMs9taIQIxRXpTBeVwJwWgW9UPXLEeJ2Q=;
 b=Ku8ErnulHsDMsBwr386lIlM7lvWW27kXrMWlYGQsElSZGQMte1Qbiwku
 mfgfaEYCdbi9/TO7XnRYcrnwNLYJtlOJ2mzR2hmgZHdh24IUg4X8p+AgR
 xjOCUdeAL9MIaSB2ym/ol0HSRIj2w6LhE+LOKr6YRMBmjzg7XScw/GqKj
 L6/UbbL9plgMZoZQRaGZVOUXx9tT7zMXYFHS02HCNbGrCNd7gQBu0kduI
 a++Gwp6YlPnwFJ+7LrhVG3ZFBGYccLtcy7Y+3cMYCG0aLUhhAltqsKl7p
 nzDXQ20AkTcNF+aWAWxko4r8fiJL5XLHt7eM1WKyVSh5yNbXhZC/3nwrZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432268535"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="432268535"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 06:25:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756906217"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="756906217"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2023 06:25:57 -0700
From: Fei Wu <fei2.wu@intel.com>
To: alex.bennee@linaro.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v11 14/14] configure: remove the final bits of --profiler
 support
Date: Fri, 21 Apr 2023 21:24:21 +0800
Message-Id: <20230421132421.1617479-15-fei2.wu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230421132421.1617479-1-fei2.wu@intel.com>
References: <20230421132421.1617479-1-fei2.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=fei2.wu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alex Bennée <alex.bennee@linaro.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build                   | 2 --
 meson_options.txt             | 2 --
 scripts/meson-buildoptions.sh | 3 ---
 3 files changed, 7 deletions(-)

diff --git a/meson.build b/meson.build
index 29f8644d6d..27627199d7 100644
--- a/meson.build
+++ b/meson.build
@@ -1872,7 +1872,6 @@ if numa.found()
                                        dependencies: numa))
 endif
 config_host_data.set('CONFIG_OPENGL', opengl.found())
-config_host_data.set('CONFIG_PROFILER', get_option('profiler'))
 config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_RDMA', rdma.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
@@ -3823,7 +3822,6 @@ if 'objc' in all_languages
   summary_info += {'QEMU_OBJCFLAGS':    ' '.join(qemu_objcflags)}
 endif
 summary_info += {'QEMU_LDFLAGS':      ' '.join(qemu_ldflags)}
-summary_info += {'profiler':          get_option('profiler')}
 summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
 summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
diff --git a/meson_options.txt b/meson_options.txt
index fc9447d267..163233fda6 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -320,8 +320,6 @@ option('qom_cast_debug', type: 'boolean', value: false,
 option('gprof', type: 'boolean', value: false,
        description: 'QEMU profiling with gprof',
        deprecated: true)
-option('profiler', type: 'boolean', value: false,
-       description: 'profiler support')
 option('slirp_smbd', type : 'feature', value : 'auto',
        description: 'use smbd (at path --smbd=*) in slirp networking')
 
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 009fab1515..8a6d61ed90 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -34,7 +34,6 @@ meson_options_help() {
   printf "%s\n" '                           jemalloc/system/tcmalloc)'
   printf "%s\n" '  --enable-module-upgrades try to load modules from alternate paths for'
   printf "%s\n" '                           upgrades'
-  printf "%s\n" '  --enable-profiler        profiler support'
   printf "%s\n" '  --enable-qom-cast-debug  cast debugging support'
   printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using /dev/(u)random and'
   printf "%s\n" '                           getrandom()'
@@ -373,8 +372,6 @@ _meson_option_parse() {
     --with-pkgversion=*) quote_sh "-Dpkgversion=$2" ;;
     --enable-png) printf "%s" -Dpng=enabled ;;
     --disable-png) printf "%s" -Dpng=disabled ;;
-    --enable-profiler) printf "%s" -Dprofiler=true ;;
-    --disable-profiler) printf "%s" -Dprofiler=false ;;
     --enable-pvrdma) printf "%s" -Dpvrdma=enabled ;;
     --disable-pvrdma) printf "%s" -Dpvrdma=disabled ;;
     --enable-qcow1) printf "%s" -Dqcow1=enabled ;;
-- 
2.25.1


