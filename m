Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400AB28321C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 10:35:04 +0200 (CEST)
Received: from localhost ([::1]:50398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPLxX-0002Dv-8V
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 04:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kPLmr-00085E-Fp
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 04:24:01 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:50532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kPLmp-0007Jz-1s
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 04:24:01 -0400
Received: by mail-wm1-x343.google.com with SMTP id 13so7636469wmf.0
 for <qemu-devel@nongnu.org>; Mon, 05 Oct 2020 01:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TY2brkwcBdIH91nPnw+zTPTVXWuUUIgSzEitafhmCuQ=;
 b=ZzWDAsdahWjanEdA0YeGqSmzXsMizS9vI/t5MIlPC3WDuoOijIMPqA7YRWG0o7usa/
 +/Ax8QOLducHy/9fZnH9GuU+bAEEFXQD37/iSyFL+xbqcrIQ9DLCukyG5DR00RwLd/5V
 9KfodvFvz74cayAnblQR8ohrxAjgXOSW3vPr1hVRRKhLDl40BcbrNabSRZ3oQ/VIbFE6
 WgXF13eZgqGsBLqU2RGiSzC1Zl9djmcybKX9A72wXjYfscCx5AVuInbOxK+w36X3pS1K
 oiQ3wWguY3WBqys0xiaSDP45nvVZmI2cyP8oplvnQbQ6b98/NNAGdW8IIe5kSSN0NWz7
 Fcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TY2brkwcBdIH91nPnw+zTPTVXWuUUIgSzEitafhmCuQ=;
 b=LIlIzM0lLTAJgFt/YFL9WqnrrOlEIxUpuQ9+boJFsXZeb2r+hdb4AolM/nr1RKpqnk
 63x+dSgyPbdtz+ze9xFW9ubcilgvLfilA1Kyv/vSxnGVcK1JjgTBzzRF3HTyDUV9Y5Ft
 pp/WI3Je9hdgvv7W8rsI9hpfw0Z7zJiPwtp5XTCWLuL7CBDHeQbPI5Iihqx59i9rFkMH
 0/ikn4rI14lNVO+g09p+XYnPZ+bWogQdFThCaPt2LS1JRsFxHqjALaoUAKrgbMaQpggH
 4gvg/lTdcotj0QEVzxI7YOlRW5RIi8kxhARWQjMpmFuoBLqz32S/ZlsQ/kuasBYjHewk
 S3dw==
X-Gm-Message-State: AOAM532CQaXzo0IvCxaGrMSW4Amsvwf2XOJA9zfpCSsMIYuz0+yyBx5r
 JYX0zHr/J2KtLKDuw/zOQlaoFwDOE4c=
X-Google-Smtp-Source: ABdhPJww6ft9/ueFuG6Ti/u9IQT55Djg0UTp+YsMTR8KgJN4Mh6giyG9lruzrREt/xQU0Lwds6Jh1w==
X-Received: by 2002:a1c:7ed5:: with SMTP id
 z204mr15758471wmc.177.1601886237446; 
 Mon, 05 Oct 2020 01:23:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:2e86:3d8b:8b70:920c])
 by smtp.gmail.com with ESMTPSA id z15sm11931434wrv.94.2020.10.05.01.23.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 01:23:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/19] configure: move OpenBSD W^X test to meson
Date: Mon,  5 Oct 2020 10:23:41 +0200
Message-Id: <20201005082349.354095-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201005082349.354095-1-pbonzini@redhat.com>
References: <20201005082349.354095-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TCG option is now passed through to Meson.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 15 ---------------
 meson.build |  8 +++++++-
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/configure b/configure
index a32c43a905..b31bf24d60 100755
--- a/configure
+++ b/configure
@@ -1594,10 +1594,6 @@ if [ "$ARCH" = "unknown" ]; then
   linux_user="no"
 fi
 
-if [ "$bsd_user" = "no" -a "$linux_user" = "no" -a "$softmmu" = "no" ] ; then
-  tcg="disabled"
-fi
-
 default_target_list=""
 deprecated_targets_list=ppc64abi32-linux-user,tilegx-linux-user,lm32-softmmu,unicore32-softmmu
 deprecated_features=""
@@ -6041,17 +6037,6 @@ if test "$mingw32" = "yes" ; then
     done
 fi
 
-# Disable OpenBSD W^X if available
-if test "$tcg" = "enabled" && test "$targetos" = "OpenBSD"; then
-    cat > $TMPC <<EOF
-    int main(void) { return 0; }
-EOF
-    wx_ldflags="-Wl,-z,wxneeded"
-    if compile_prog "" "$wx_ldflags"; then
-        QEMU_LDFLAGS="$QEMU_LDFLAGS $wx_ldflags"
-    fi
-fi
-
 qemu_confdir="$sysconfdir/$qemu_suffix"
 qemu_moddir="$libdir/$qemu_suffix"
 qemu_datadir="$datadir/$qemu_suffix"
diff --git a/meson.build b/meson.build
index 743a6504a7..60ecd03fbd 100644
--- a/meson.build
+++ b/meson.build
@@ -124,6 +124,7 @@ socket = []
 version_res = []
 coref = []
 iokit = []
+emulator_link_args = []
 cocoa = not_found
 hvf = not_found
 if targetos == 'windows'
@@ -146,6 +147,11 @@ elif targetos == 'haiku'
   socket = [cc.find_library('posix_error_mapper'),
             cc.find_library('network'),
             cc.find_library('bsd')]
+elif targetos == 'openbsd'
+  if not get_option('tcg').disabled() and target_dirs.length() > 0
+    # Disable OpenBSD W^X if available
+    emulator_link_args = cc.get_supported_link_arguments('-Wl,-z,wxneeded')
+  endif
 endif
 
 accelerators = []
@@ -1247,7 +1253,7 @@ foreach target : target_dirs
   c_args = ['-DNEED_CPU_H',
             '-DCONFIG_TARGET="@0@-config-target.h"'.format(target),
             '-DCONFIG_DEVICES="@0@-config-devices.h"'.format(target)]
-  link_args = []
+  link_args = emulator_link_args
 
   config_target += config_host
   target_inc = [include_directories('target' / config_target['TARGET_BASE_ARCH'])]
-- 
2.26.2



