Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D260830AA6A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:05:58 +0100 (CET)
Received: from localhost ([::1]:60392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6am5-0007kg-UB
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l6agw-0002yZ-41
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:00:39 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l6agn-0002fw-6O
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:00:31 -0500
Received: by mail-wm1-x32b.google.com with SMTP id i9so13469949wmq.1
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 07:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mdT0+fKTMXuenspMXyJDwjQyNT4t8VurzgFoCd0t82M=;
 b=X93opkl/+gIJI2123kKgbN7GLPeajmNMIOV1/qm/rpZuphlKVplqvkUCTxnaamXTN9
 rNSTitrhyMVbuFLxD8h/zo9rFadGqtcWbfr+EHgXKVVuwB3+8wkZBjA2DoJzAKYOe+0s
 zCx8185NNPjrgneOCnaNc/jOjKdBfRwQnrdPD5J2Osp3kLbG6McnF2YmCMqiCxtKi/4P
 WmoVvS/Y3UGYAFpBpeY9u8lDtpCt3JeI268VKUULNILVAZM/b+fknmoPySXSoSsk0yup
 fR/a2xZDnwEr6y60oPiDTTl4AhvWb3oTtQNH149KbyYCoaKF1n/wrlHYNKzuObsd7mu4
 3cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mdT0+fKTMXuenspMXyJDwjQyNT4t8VurzgFoCd0t82M=;
 b=ShYQWGgCzo4vUEwwi6WxATCfI3C3MYSIDBOCXhocD0yPEy+EpE0xr56uCEslU30azX
 WlWeiTLY7bjUsrrh0idtlfgOOFmXvxXeBqsNXIOweg5CTRbgCEbHZhQ6557x5flcQX5N
 +RHSnQbNWGHjyIoAICgO9+cdHBd5KxsID06PrYGkuz3HBXRMIdNjADUxURWXj5j+j0b6
 uSXz+tWEo2CtjNy5Sek7e6mesT0bmMcRwfTnrEKPSK1FD/HBMbHN8feV0kB3gk4wHr+Y
 j6tiU3Xr4nCvzpCmTosip2TAR1m6Vwx0wdv7STeMf1Z1Mqan9y3h+HJzm02sSM5KXfif
 4U6w==
X-Gm-Message-State: AOAM531a4hXxWKbyocGaKp122dGb8VwDJz7NCtt/YomDcJ6LOKPtp4P1
 YDDBUYxS3FONofFP9U/1mlov5IkYO/+BpQ==
X-Google-Smtp-Source: ABdhPJz3Wyr8LD0NiyVzLkWKv29c7uDPEUHW6op0BUt+dXIEd/uKvxZAojYnvfxopYKdAnkZwacjSQ==
X-Received: by 2002:a1c:7f94:: with SMTP id
 a142mr15173920wmd.145.1612191624663; 
 Mon, 01 Feb 2021 07:00:24 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 q6sm25879813wrw.43.2021.02.01.07.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 07:00:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/38] build-sys: make libslirp a meson subproject
Date: Mon,  1 Feb 2021 16:00:19 +0100
Message-Id: <20210201150021.53398-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201150021.53398-1-pbonzini@redhat.com>
References: <20210201150021.53398-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Remove the manual build.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210125073427.3970606-3-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitmodules                   |  4 +--
 configure                     |  2 +-
 meson.build                   | 63 +++--------------------------------
 slirp => subprojects/libslirp |  0
 4 files changed, 7 insertions(+), 62 deletions(-)
 rename slirp => subprojects/libslirp (100%)

diff --git a/.gitmodules b/.gitmodules
index 2bdeeacef8..0fb15efacd 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -49,8 +49,8 @@
 [submodule "roms/edk2"]
 	path = roms/edk2
 	url = https://git.qemu.org/git/edk2.git
-[submodule "slirp"]
-	path = slirp
+[submodule "subprojects/libslirp"]
+	path = subprojects/libslirp
 	url = https://git.qemu.org/git/libslirp.git
 [submodule "roms/opensbi"]
 	path = roms/opensbi
diff --git a/configure b/configure
index 21369efc63..337283571a 100755
--- a/configure
+++ b/configure
@@ -5212,7 +5212,7 @@ case "$slirp" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
     if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
-      git_submodules="${git_submodules} slirp"
+      git_submodules="${git_submodules} subprojects/libslirp"
     fi
     ;;
 esac
diff --git a/meson.build b/meson.build
index b6c9db613b..4e694e78a0 100644
--- a/meson.build
+++ b/meson.build
@@ -1489,7 +1489,7 @@ slirp_opt = 'disabled'
 if have_system
   slirp_opt = get_option('slirp')
   if slirp_opt in ['enabled', 'auto', 'system']
-    have_internal = fs.exists(meson.current_source_dir() / 'slirp/meson.build')
+    have_internal = fs.exists(meson.current_source_dir() / 'subprojects/libslirp/meson.build')
     slirp = dependency('slirp', kwargs: static_kwargs,
                        method: 'pkg-config',
                        required: slirp_opt == 'system' or
@@ -1503,64 +1503,9 @@ if have_system
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
 
diff --git a/slirp b/subprojects/libslirp
similarity index 100%
rename from slirp
rename to subprojects/libslirp
-- 
2.29.2



