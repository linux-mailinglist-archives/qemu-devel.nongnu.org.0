Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7A02F37E8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:06:09 +0100 (CET)
Received: from localhost ([::1]:50824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzO3U-0005xV-DI
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNGB-0003lB-Of
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:12 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG9-0004wd-E2
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:11 -0500
Received: by mail-ej1-x62b.google.com with SMTP id e18so3129982ejt.12
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZaTIQlxze6jxuscVM9IFMWchHxN6YoRJgbnAqKImvc=;
 b=mSyeEFWc0KZhIDDK5j71ebjTKl1MPiun6suydOHLLrBfYpcxCgTBbeFm5AV+7AcYQS
 z3yLQi93SRGNaa3rg8mmp+kRSc0wsDiQ6S/5/hrZRXRCB/1yrkAiYlx/iu5iHKTNbdgk
 IR6mBk4/fonIg8AJlsMlDQUUuTJRJzPY7YT8WoyMyEdjfXinblPzxRpd/cnICxYowCgP
 L1JxjC93x8eSsrhFa/SML/2qpM9Hi4bQLB3vfqHEzeWjviVhhFdLJ9bR0wC83npK5Pcr
 eHSDuKj0VRlv54lJabMdsvjutVasl2QmAuLNdwEaACEHCV9r1sovlHoxdG0HkWksTYl7
 APwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eZaTIQlxze6jxuscVM9IFMWchHxN6YoRJgbnAqKImvc=;
 b=cyw/hlmAbdfgWezN530XowujFIzB+RiNZ+wLBJz/Xysmx5iSfhZDmMbrMQQVV+Z3WO
 4gqorUUU3eF7MYnl5ijDIivoHLAxxYXRhtXn80511EfWdcSha4mdTyizpPpmAyrnzG+/
 uUxoq4VPKKVi4tybB/IVTFZUZH5d2eY93qFxIQpgCFHeyktg2XtoS7sjk6P8rWzpE1jm
 IbT+B67WaBNB137yi3d9Ej1ylw/j4dNTDSG3JU5ceoZ4pOG6H/PMu4ntnUEMIdFJdKEX
 M1BOLpiY2I0DwkEhNknGH3O03sg7QxbZ59IrL//J69yckLVryiwQHXSphF40NTTZemtt
 f5lQ==
X-Gm-Message-State: AOAM532CH5EJ8JPUagXlSW/7aTHv6Jb1UMszRD7MbJA1pI66K42VMaRv
 qsSqdwo7S3L/khm5nqlnFTp97jFwIz1wBA==
X-Google-Smtp-Source: ABdhPJz0y+8SgsutItxZUEIqaJblTSOpCzq2IGvnQ1nb28KoOrbOsS2CgE/Yj60+JrmhsGaaw+LXXQ==
X-Received: by 2002:a17:906:6a92:: with SMTP id
 p18mr3755050ejr.308.1610471708145; 
 Tue, 12 Jan 2021 09:15:08 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.15.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:15:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/20] configure: move Cocoa incompatibility checks to Meson
Date: Tue, 12 Jan 2021 18:14:48 +0100
Message-Id: <20210112171450.791427-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
index d70448f495..17aa595343 100755
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
index 73d3cc5385..1f12c43765 100644
--- a/meson.build
+++ b/meson.build
@@ -169,7 +169,6 @@ version_res = []
 coref = []
 iokit = []
 emulator_link_args = []
-cocoa = not_found
 hvf = not_found
 if targetos == 'windows'
   socket = cc.find_library('ws2_32')
@@ -182,7 +181,6 @@ if targetos == 'windows'
 elif targetos == 'darwin'
   coref = dependency('appleframeworks', modules: 'CoreFoundation')
   iokit = dependency('appleframeworks', modules: 'IOKit')
-  cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
 elif targetos == 'sunos'
   socket = [cc.find_library('socket'),
             cc.find_library('nsl'),
@@ -256,9 +254,6 @@ if not have_xen_pci_passthrough and get_option('xen_pci_passthrough').enabled()
     error('Xen PCI passthrough requested but Xen not enabled')
   endif
 endif
-if not cocoa.found() and get_option('cocoa').enabled()
-  error('Cocoa not available on this platform')
-endif
 
 ################
 # Dependencies #
@@ -362,6 +357,14 @@ if not get_option('attr').disabled()
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
@@ -647,7 +650,7 @@ if not get_option('brlapi').auto() or have_system
 endif
 
 sdl = not_found
-if have_system
+if not get_option('sdl').auto() or (have_system and not cocoa.found())
   sdl = dependency('sdl2', required: get_option('sdl'), static: enable_static)
   sdl_image = not_found
 endif
@@ -779,7 +782,7 @@ endif
 
 gtk = not_found
 gtkx11 = not_found
-if not get_option('gtk').auto() or have_system
+if not get_option('gtk').auto() or (have_system and not cocoa.found())
   gtk = dependency('gtk+-3.0', version: '>=3.22.0',
                    method: 'pkg-config',
                    required: get_option('gtk'),
-- 
2.29.2



