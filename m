Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDC92ED172
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 15:11:17 +0100 (CET)
Received: from localhost ([::1]:39602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxW0R-0002kL-TI
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 09:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqS-0003y3-Gc
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:01:01 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqK-0006wr-Ng
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:00:55 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ga15so9844537ejb.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 06:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FIDd9CoeqK0N6Tbm6H/NLOa+Nm0iRe/kCNkiUDvwvU0=;
 b=hW230Leo5qTDAyWCsKBYPGBAdM1Ah98XX8zpogxVKaycQameVX5BiimetouI5CL/Uj
 ky0NzC0NzqGLOrzX0L7hptj77u/0R8xAXBVP2/hk7h0vGe23dSL64vI7D0Ep4XmSoNHn
 F8aeP17m/nDLLAEWa34vpaEayoE4vbSIA97xkckzMlQl1V7oqd85RH1Nj1NCvQzU6bF4
 R7wFF/ffk14ES4zcmtA8wvOMjPH1p+7B96r7oQ8zUdP70LsYFH7fKOxPynyxvZXXYf2A
 OFc8jh+GENvlFGlrptsLJkj0uQ4Qu0iwxNZWcVwg5Asq8XH6t8J0y3yWKtmxzpeEwUzC
 K7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FIDd9CoeqK0N6Tbm6H/NLOa+Nm0iRe/kCNkiUDvwvU0=;
 b=DxF1WAXLhFxugDUEFaTz6I/nlXU1hFFiwwsFDGfoZS/Y2rmieXIPsJdRQV/ES13S0r
 cRLowcwSh1sw6SnlWE0/Gr+Z/mcaO+oC7RNfmNNK2Lgr4Gj7N5EUMnvtft6DhWf7Na3M
 rIapQA04LVmYBI74d9ieN6QOEWxnPAgSPy2NeOjJMUQYsoB6+my3X1kXH2iwDHAFK+gt
 s4CKdybP7NC5JblpTDg2o+xBXiRfPZB1mFEYCQACQYZi2wSpJnvkhPhIJN8Dqld8BJV1
 eE8aFQ2h6IE3siXJCtWA2GFX3+1JZSgVgojah65CZw2dhrTNhh5PF5qwdeZc2Mmew7II
 4ZWQ==
X-Gm-Message-State: AOAM532OpJUAgVYvKQS71mCLoZttJoZEQwYEw91R72K/Puh2YDnJGb8L
 HJzpkFlFaIbPVilkra7ZGi2vYs6hgZvO3Q==
X-Google-Smtp-Source: ABdhPJwYVmUul650kYF+zZNR8iko/wNpaDR0cGWUm2PrXesFnvFgCHDC24qfOf07YRImOqCR0y4VzQ==
X-Received: by 2002:a17:906:cd14:: with SMTP id
 oz20mr5876426ejb.99.1610028047343; 
 Thu, 07 Jan 2021 06:00:47 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id oq27sm2438523ejb.108.2021.01.07.06.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 06:00:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] configure: move Cocoa incompatibility checks to Meson
Date: Thu,  7 Jan 2021 15:00:37 +0100
Message-Id: <20210107140039.467969-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107140039.467969-1-pbonzini@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: alex.bennee@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The cocoa UI code currently assumes it is always the active UI
and does not interact well with other UI frontend code.  Move
the relevant checks to Meson now that all other frontends
have become Meson options.  This way, SDL/GTK+/Cocoa can be
parsed entirely by scripts/configure-parse-buildoptions.pl.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 15 ---------------
 meson.build | 17 ++++++++++-------
 2 files changed, 10 insertions(+), 22 deletions(-)

diff --git a/configure b/configure
index 652cff7ba6..d573058b16 100755
--- a/configure
+++ b/configure
@@ -772,7 +772,6 @@ Darwin)
     QEMU_CFLAGS="-arch x86_64 $QEMU_CFLAGS"
     QEMU_LDFLAGS="-arch x86_64 $QEMU_LDFLAGS"
   fi
-  cocoa="enabled"
   audio_drv_list="coreaudio try-sdl"
   audio_possible_drivers="coreaudio sdl"
   QEMU_LDFLAGS="-framework CoreFoundation -framework IOKit $QEMU_LDFLAGS"
@@ -2322,20 +2321,6 @@ if test -z "$want_tools"; then
 fi
 
 ##########################################
-# cocoa implies not SDL or GTK
-# (the cocoa UI code currently assumes it is always the active UI
-# and doesn't interact well with other UI frontend code)
-if test "$cocoa" = "enabled"; then
-    if test "$sdl" = "enabled"; then
-        error_exit "Cocoa and SDL UIs cannot both be enabled at once"
-    fi
-    if test "$gtk" = "enabled"; then
-        error_exit "Cocoa and GTK UIs cannot both be enabled at once"
-    fi
-    gtk=disabled
-    sdl=disabled
-fi
-
 # Some versions of Mac OS X incorrectly define SIZE_MAX
 cat > $TMPC << EOF
 #include <stdint.h>
diff --git a/meson.build b/meson.build
index a3a0958b4d..5a8efd2316 100644
--- a/meson.build
+++ b/meson.build
@@ -148,7 +148,6 @@ version_res = []
 coref = []
 iokit = []
 emulator_link_args = []
-cocoa = not_found
 hvf = not_found
 if targetos == 'windows'
   socket = cc.find_library('ws2_32')
@@ -161,7 +160,6 @@ if targetos == 'windows'
 elif targetos == 'darwin'
   coref = dependency('appleframeworks', modules: 'CoreFoundation')
   iokit = dependency('appleframeworks', modules: 'IOKit')
-  cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
 elif targetos == 'sunos'
   socket = [cc.find_library('socket'),
             cc.find_library('nsl'),
@@ -252,9 +250,6 @@ if not have_xen_pci_passthrough and get_option('xen_pci_passthrough').enabled()
     error('Xen PCI passthrough requested but Xen not enabled')
   endif
 endif
-if not cocoa.found() and get_option('cocoa').enabled()
-  error('Cocoa not available on this platform')
-endif
 
 ################
 # Dependencies #
@@ -358,6 +353,14 @@ if not get_option('attr').disabled()
   endif
 endif
 
+cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
+if cocoa.found() and get_option('sdl').enabled()
+  error('Cocoa and SDL cannot be enabled at the same time')
+endif
+if cocoa.found() and get_option('gtk').enabled()
+  error('Cocoa and GTK+ cannot be enabled at the same time')
+endif
+
 seccomp = not_found
 if not get_option('seccomp').auto() or have_system or have_tools
   seccomp = dependency('libseccomp', version: '>=2.3.0',
@@ -643,7 +646,7 @@ if not get_option('brlapi').auto() or have_system
 endif
 
 sdl = not_found
-if have_system
+if not get_option('sdl').auto() or (have_system and not cocoa.found())
   sdl = dependency('sdl2', required: get_option('sdl'), static: enable_static)
   sdl_image = not_found
 endif
@@ -775,7 +778,7 @@ endif
 
 gtk = not_found
 gtkx11 = not_found
-if not get_option('gtk').auto() or have_system
+if not get_option('gtk').auto() or (have_system and not cocoa.found())
   gtk = dependency('gtk+-3.0', version: '>=3.22.0',
                    method: 'pkg-config',
                    required: get_option('gtk'),
-- 
2.29.2



