Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D142DF4D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:40:20 +0200 (CEST)
Received: from localhost ([::1]:41544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3mF-0001ME-Kx
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c9-0003aE-Av
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:53 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c7-0000cs-Fd
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:52 -0400
Received: by mail-ed1-x52a.google.com with SMTP id z20so26712074edc.13
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eKjiEwE8hfNYasZYSdQWkiVZ51rVQWPwlrU39zH9G7E=;
 b=TTuiaMVCUdDO1SuwDsx3eDjCqXlc2713Va1MuBoiIwJLcOzDktLUtJhpCBPG6bg7Gb
 Q5ukOS5bBlTxWsA2phIHgtu0hQTnaM59RI/SoXpuMvScv7Td2QMtA3f4CEv0gOQ+fAW3
 8QCNUROzwBNSNKE0uFSQzj1g+DlU6KVo7m7zlKJMDKsqH67TJZd7f81WEAlWj7oIeH9a
 tMqY3BVKhdcm5gBfwVPylPRF3tkAGupA6LxhNMdUWSHebwU90QCLWJ4BqiwsrSnXgVQZ
 DOMXTbY6pWRg6tXQH2vKBP/pqUUdiFMNlzB7XpEvt19vPLGRmYEFq/7uIUwNQW2ibGNn
 agQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eKjiEwE8hfNYasZYSdQWkiVZ51rVQWPwlrU39zH9G7E=;
 b=sDyJl48WkXi8nQRNm1uoVWHfoVemxnLHr1LT41dtQjFIkEHdYeFAuokPgf8XFpEbGc
 i8jIAUtwtfdlTS19juPR/IoQIwu2lmGCAkSK5RwijzL/2y/73dfNPnursnYgdUTY+79p
 p9zBmNobe3E1bL9A1AYkwMRTUg1ttVJSzeJy2vIdW0+3yiwVUdW8U9s/KQAOhnwto2cJ
 D0l9b+MSlCEa2YFb9jUKG2Eeev8fs07L61veZ7ffDffHkFl/ZOYjrK2Jo5FCMnP4DLZA
 hd1QNxxL9jQUrm1gn8u/lfJNvKYYFodHFjN06y6arcZcdUqfE/psNrFGvdIvJvFxqtUF
 6mgg==
X-Gm-Message-State: AOAM531OHLcURIKJg0nGCOAFIQTH5p2KW73lAQo+1D45w8pkgRs/FuUT
 3i72AM5dM/nIMKsW0WhWGvoojr5+AwQ=
X-Google-Smtp-Source: ABdhPJy5Tlvwv9gyfaf7w8uAv4jK06t2DEEBVok9IugHx2WxWirdgWeja6BXZP/NG6+DmCxjbq7toA==
X-Received: by 2002:a05:6402:1914:: with SMTP id
 e20mr9922347edz.304.1634228990112; 
 Thu, 14 Oct 2021 09:29:50 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:29:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/26] configure, meson: move CONFIG_HOST_DSOSUF to Meson
Date: Thu, 14 Oct 2021 18:29:22 +0200
Message-Id: <20211014162938.430211-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is just a constant string, there is no need to pass it in config-host.mak.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007130829.632254-5-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   |  6 ------
 meson.build | 10 +++++-----
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index ba508b70b9..a5411c834d 100755
--- a/configure
+++ b/configure
@@ -351,7 +351,6 @@ bigendian="no"
 mingw32="no"
 gcov="no"
 EXESUF=""
-HOST_DSOSUF=".so"
 modules="no"
 module_upgrades="no"
 prefix="/usr/local"
@@ -594,9 +593,6 @@ fi
 # cross-compiling to one of these OSes then you'll need to specify
 # the correct CPU with the --cpu option.
 case $targetos in
-Darwin)
-  HOST_DSOSUF=".dylib"
-  ;;
 SunOS)
   # $(uname -m) returns i86pc even on an x86_64 box, so default based on isainfo
   if test -z "$cpu" && test "$(isainfo -k)" = "amd64"; then
@@ -785,7 +781,6 @@ fi
 
 if test "$mingw32" = "yes" ; then
   EXESUF=".exe"
-  HOST_DSOSUF=".dll"
   # MinGW needs -mthreads for TLS and macro _MT.
   CONFIGURE_CFLAGS="-mthreads $CONFIGURE_CFLAGS"
   write_c_skeleton;
@@ -4638,7 +4633,6 @@ echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
-echo "HOST_DSOSUF=$HOST_DSOSUF" >> $config_host_mak
 echo "LIBS_QGA=$libs_qga" >> $config_host_mak
 if test "$gcov" = "yes" ; then
   echo "CONFIG_GCOV=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 6a5e7254ed..94b092ce4f 100644
--- a/meson.build
+++ b/meson.build
@@ -250,6 +250,7 @@ iokit = []
 emulator_link_args = []
 nvmm =not_found
 hvf = not_found
+host_dsosuf = '.so'
 if targetos == 'windows'
   socket = cc.find_library('ws2_32')
   winmm = cc.find_library('winmm')
@@ -258,9 +259,11 @@ if targetos == 'windows'
   version_res = win.compile_resources('version.rc',
                                       depend_files: files('pc-bios/qemu-nsis.ico'),
                                       include_directories: include_directories('.'))
+  host_dsosuf = '.dll'
 elif targetos == 'darwin'
   coref = dependency('appleframeworks', modules: 'CoreFoundation')
   iokit = dependency('appleframeworks', modules: 'IOKit', required: false)
+  host_dsosuf = '.dylib'
 elif targetos == 'sunos'
   socket = [cc.find_library('socket'),
             cc.find_library('nsl'),
@@ -1458,6 +1461,7 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
 config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
 
+config_host_data.set_quoted('CONFIG_HOST_DSOSUF', host_dsosuf)
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
 
 # has_header
@@ -1603,10 +1607,9 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
         return printf("%zu", SIZE_MAX);
     }''', args: ['-Werror']))
 
-
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
-strings = ['HOST_DSOSUF', 'CONFIG_IASL']
+strings = ['CONFIG_IASL']
 foreach k, v: config_host
   if ignored.contains(k)
     # do nothing
@@ -1618,9 +1621,6 @@ foreach k, v: config_host
   elif k == 'ARCH'
     config_host_data.set('HOST_' + v.to_upper(), 1)
   elif strings.contains(k)
-    if not k.startswith('CONFIG_')
-      k = 'CONFIG_' + k.to_upper()
-    endif
     config_host_data.set_quoted(k, v)
   elif k.startswith('CONFIG_') or k.startswith('HAVE_') or k.startswith('HOST_')
     config_host_data.set(k, v == 'y' ? 1 : v)
-- 
2.31.1



