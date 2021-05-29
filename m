Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5802F394DCA
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 20:58:58 +0200 (CEST)
Received: from localhost ([::1]:57558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ln4Aj-0007gn-E3
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 14:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ln47j-0003WK-8D
 for qemu-devel@nongnu.org; Sat, 29 May 2021 14:55:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ln47h-0005dz-AU
 for qemu-devel@nongnu.org; Sat, 29 May 2021 14:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622314548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CZcM5vbj6VjzAVNV5sUsj5b8+5r+4sY34YcWYeKnGoI=;
 b=eeydtBX6jDAx0xgRtWp1/TLBIDJCZT4lHg0yTo/QRcE7Lq0RM/I10HSUxNrM6sVcqDXoFU
 Fs54wjVpDhWC4B0txetud4xV1E6xTKyLoNIme4oXppiW4nTCLXxz5CUahrEvUhFk2lGbOa
 e6fidST6BdxzXxhh4QQ1VByQuWu0Zr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-2qFXNQo_OU-rPGPO00oSIw-1; Sat, 29 May 2021 14:55:45 -0400
X-MC-Unique: 2qFXNQo_OU-rPGPO00oSIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 083AB107ACCA;
 Sat, 29 May 2021 18:55:45 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF43E687CD;
 Sat, 29 May 2021 18:55:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 2/2] build-sys: make libslirp a meson subproject
Date: Sat, 29 May 2021 22:55:22 +0400
Message-Id: <20210529185522.78816-3-marcandre.lureau@redhat.com>
In-Reply-To: <20210529185522.78816-1-marcandre.lureau@redhat.com>
References: <20210529185522.78816-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
Cc: samuel.thibault@ens-lyon.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Remove the manual build.

Moving projects to subprojects/ is required when using meson
subproject():
https://mesonbuild.com/Subprojects.html#why-must-all-subprojects-be-inside-a-single-directory

Tested-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure                     |  2 +-
 meson.build                   | 63 +++--------------------------------
 .gitmodules                   |  4 +--
 slirp => subprojects/libslirp |  0
 4 files changed, 7 insertions(+), 62 deletions(-)
 rename slirp => subprojects/libslirp (100%)

diff --git a/configure b/configure
index 90c0807347..b59ec8bd39 100755
--- a/configure
+++ b/configure
@@ -5279,7 +5279,7 @@ fi
 case "$slirp" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    git_submodules="${git_submodules} slirp"
+    git_submodules="${git_submodules} subprojects/libslirp"
     ;;
 esac
 
diff --git a/meson.build b/meson.build
index 20d7035e44..3bf0686985 100644
--- a/meson.build
+++ b/meson.build
@@ -1513,7 +1513,7 @@ slirp_opt = 'disabled'
 if have_system
   slirp_opt = get_option('slirp')
   if slirp_opt in ['enabled', 'auto', 'system']
-    have_internal = fs.exists(meson.current_source_dir() / 'slirp/meson.build')
+    have_internal = fs.exists(meson.current_source_dir() / 'subprojects/libslirp/meson.build')
     slirp = dependency('slirp', kwargs: static_kwargs,
                        method: 'pkg-config',
                        required: slirp_opt == 'system' or
@@ -1527,64 +1527,9 @@ if have_system
     endif
   endif
   if slirp_opt == 'internal'
-    slirp_deps = []
-    if targetos == 'windows'
-      slirp_deps = cc.find_library('iphlpapi')
-    endif
-    slirp_conf = configuration_data()
-    slirp_conf.set('SLIRP_MAJOR_VERSION', meson.project_version().split('.')[0])
-    slirp_conf.set('SLIRP_MINOR_VERSION', meson.project_version().split('.')[1])
-    slirp_conf.set('SLIRP_MICRO_VERSION', meson.project_version().split('.')[2])
-    slirp_conf.set_quoted('SLIRP_VERSION_STRING', meson.project_version())
-    slirp_cargs = ['-DG_LOG_DOMAIN="Slirp"']
-    slirp_files = [
-      'slirp/src/arp_table.c',
-      'slirp/src/bootp.c',
-      'slirp/src/cksum.c',
-      'slirp/src/dhcpv6.c',
-      'slirp/src/dnssearch.c',
-      'slirp/src/if.c',
-      'slirp/src/ip6_icmp.c',
-      'slirp/src/ip6_input.c',
-      'slirp/src/ip6_output.c',
-      'slirp/src/ip_icmp.c',
-      'slirp/src/ip_input.c',
-      'slirp/src/ip_output.c',
-      'slirp/src/mbuf.c',
-      'slirp/src/misc.c',
-      'slirp/src/ncsi.c',
-      'slirp/src/ndp_table.c',
-      'slirp/src/sbuf.c',
-      'slirp/src/slirp.c',
-      'slirp/src/socket.c',
-      'slirp/src/state.c',
-      'slirp/src/stream.c',
-      'slirp/src/tcp_input.c',
-      'slirp/src/tcp_output.c',
-      'slirp/src/tcp_subr.c',
-      'slirp/src/tcp_timer.c',
-      'slirp/src/tftp.c',
-      'slirp/src/udp.c',
-      'slirp/src/udp6.c',
-      'slirp/src/util.c',
-      'slirp/src/version.c',
-      'slirp/src/vmstate.c',
-    ]
-
-    configure_file(
-      input : 'slirp/src/libslirp-version.h.in',
-      output : 'libslirp-version.h',
-      configuration: slirp_conf)
-
-    slirp_inc = include_directories('slirp', 'slirp/src')
-    libslirp = static_library('slirp',
-                              build_by_default: false,
-                              sources: slirp_files,
-                              c_args: slirp_cargs,
-                              include_directories: slirp_inc)
-    slirp = declare_dependency(link_with: libslirp,
-                               dependencies: slirp_deps,
-                               include_directories: slirp_inc)
+    libslirp = subproject('libslirp',
+                          default_options: ['default_library=static'])
+    slirp = libslirp.get_variable('libslirp_dep')
   endif
 endif
 
diff --git a/.gitmodules b/.gitmodules
index 08b1b48a09..447bb3a4df 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -49,8 +49,8 @@
 [submodule "roms/edk2"]
 	path = roms/edk2
 	url = https://gitlab.com/qemu-project/edk2.git
-[submodule "slirp"]
-	path = slirp
+[submodule "subprojects/libslirp"]
+	path = subprojects/libslirp
 	url = https://gitlab.com/qemu-project/libslirp.git
 [submodule "roms/opensbi"]
 	path = roms/opensbi
diff --git a/slirp b/subprojects/libslirp
similarity index 100%
rename from slirp
rename to subprojects/libslirp
-- 
2.29.0


