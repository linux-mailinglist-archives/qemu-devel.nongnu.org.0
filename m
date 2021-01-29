Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1823088E7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:11:45 +0100 (CET)
Received: from localhost ([::1]:34798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Scq-0003r2-EO
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnU-0004mt-Ap
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:40 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnS-00064o-FC
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:40 -0500
Received: by mail-ed1-x533.google.com with SMTP id bx12so10108496edb.8
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=arnSVt9lOmMwKmuctZoOsBkro1arS1NxpWf+at120yg=;
 b=cuUhsm/7qGqYIp7zmKoJy7ptiFWcHzv+B2LZFUsWyerfYqpYZHLPTtw8Ukf5BlRYBz
 W33xboQzG+3HYc3s8D/fW1G0fNnb2k/3fQ5CjCSPbsUFDy06Ni5MDYOaMQOem/uISfic
 rEtFPu5/Y5TnjcwyazzvRrcr61PZuk/XXtmo3ymeF3PxU/KJKZXVHPBJM79qnfwaDC+r
 OBmzYvGe7t/i21r0b0X2M9PIMkNu88LV+Im5Ug9OC50H/XOqxUMOgxqoHdGmXHnA8X8d
 xx/n44wSsV9IIkCPnq60aoopKVuP9Rft0QhFuzgJ0gAxv2QWZukTEdL0Lp9qiMWCgrW2
 LP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=arnSVt9lOmMwKmuctZoOsBkro1arS1NxpWf+at120yg=;
 b=SnUrt5sYMHfiNjXvkjHPNbUccnT2OAoKqoyr9aZEYomH9462OhdXuHkVag/HkKpB9n
 uXALN5tlcwuvrPJyrPjVAhAiyXk4zKrj8j2HL1OjjbZUR71F/yge+7BuahELo5SG52T2
 KVVs2KhRUC73f4em0lZHot9+rQ9AB6m5uA8VMw191kmwRYZLrNWZis3XMr1/bU9sof3f
 iJjNQGNPjGWcyZah5JxxpXGNhVvuiVBd6Y6euP6aa0GK0a92muCpyn2OaEDJgXSvQyjP
 THGZxyv/8rWeSBhHH6zjS5l99fnL21CawTomTTMumjvushwBQe5v0if0yeNI26wgdlIH
 olbQ==
X-Gm-Message-State: AOAM531m+h3d00kkalgQNvqkPL43tNQRtOgQKMMNyHDKzb9V8E3x9WTH
 cFayViqydqkw+NzvrciZLjM90uiyKHZE/Q==
X-Google-Smtp-Source: ABdhPJwD9UwkahE6oa+rzfyvLtox4/98OPdLPKp+xk/mHabgUzkTPEoliRliDKMPbzY/t+LGqugyFA==
X-Received: by 2002:aa7:d919:: with SMTP id a25mr4535922edr.243.1611919117199; 
 Fri, 29 Jan 2021 03:18:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/36] build-sys: make libslirp a meson subproject
Date: Fri, 29 Jan 2021 12:18:02 +0100
Message-Id: <20210129111814.566629-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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
 .gitmodules |  4 ++--
 configure   |  2 +-
 meson.build | 63 ++++-------------------------------------------------
 3 files changed, 7 insertions(+), 62 deletions(-)

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
 
-- 
2.29.2



