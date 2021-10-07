Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934834253E2
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:18:01 +0200 (CEST)
Received: from localhost ([::1]:49068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTHc-00030Q-5Q
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8b-0005TT-Qf
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:42 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:47075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8Z-0007nU-5N
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:41 -0400
Received: by mail-ed1-x533.google.com with SMTP id z20so22788655edc.13
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PtPCM/1v4Q1iI3WF6cDEVwQ9iur4Hc5E6IdRJ9YJx90=;
 b=mQWIOojAPIQiKBglen5dLMV7/hTH5cJDXS1MqcFlf4GiDx4nGM9UTW6z1kBynpIlcD
 xiLbTpmHLIxY2sWCyscRNPLfkAX8aDFdneQrV4mUn5hF4F6CRA9SGvdYefubJ420Mswr
 DggngSoCWK26PDvNknuRBE9qG5KIfHwWbCk96mN82BGQiNLY3RZ2QuHQCdIO0a1chrRq
 xpIPT254ntMMF+GSlHZDl1hyIpb9hINRKMnjkRFHT/gTxy79C9VB+FvFT1Xkrez3QyFe
 UQ7tx6RFf6cctbK+9KBhJVwzDdFGu8i1k8AN7VEXst6rshsfIdgyraa0QlN2N2UobzXH
 kIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PtPCM/1v4Q1iI3WF6cDEVwQ9iur4Hc5E6IdRJ9YJx90=;
 b=FnWXIozw3QToHJKcyb84bWbGX1Y5uRtlUxeSscShLNC3Rtcj+y4ahPbMdkr4UJWoyW
 bT9ID7QPp7UFF0kCtWaur08mrw+baDrjzTu6A+f8GCEcOjZc8YoY9+wF8SVljHmqo990
 lyD75S5hBXyfhYsR2gCja6ItRBGpBjBkFK2WpTHEsDiametVrP+mfGICs/zuuM5g6RIT
 mAVxd9M5zUlafhS6y6iE3O8o1o8yLC+psHB+3kjApSNg3T0+jfIzX/a5x2uzgX8H40UY
 NXYUOPQuOEX3UAsNFjsN56lwS84aMGvXdKOB+Hnf38U9HBtC7haACmBpygtTFzifsjt4
 c4bw==
X-Gm-Message-State: AOAM531BRIOTwskR8FSyhNnkXsdfTQOIWL4DLMYjCmc/7IqBSZxFWXhD
 u7SNDTMPy+63vYMAdXsD4rL3Sko25rE=
X-Google-Smtp-Source: ABdhPJy5YZA7722pvSF/MxgaGs3bs9NxoxEdjO/fPOAk9NnWk6/jhdQm3i94v5Y6RDJfHy2gOC5h9w==
X-Received: by 2002:a50:d84c:: with SMTP id v12mr5943539edj.203.1633612113718; 
 Thu, 07 Oct 2021 06:08:33 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/24] configure, meson: move CONFIG_HOST_DSOSUF to Meson
Date: Thu,  7 Oct 2021 15:08:15 +0200
Message-Id: <20211007130829.632254-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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

This is just a constant string, there is no need to pass it in config-host.mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   |  6 ------
 meson.build | 10 +++++-----
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 4bfc5e350d..f91b8e1f0d 100755
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
@@ -4636,7 +4631,6 @@ echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
-echo "HOST_DSOSUF=$HOST_DSOSUF" >> $config_host_mak
 echo "LIBS_QGA=$libs_qga" >> $config_host_mak
 if test "$gcov" = "yes" ; then
   echo "CONFIG_GCOV=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 98fa4b68d9..6842402a60 100644
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
@@ -1460,6 +1463,7 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
 config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
 
+config_host_data.set_quoted('CONFIG_HOST_DSOSUF', host_dsosuf)
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
 
 # has_header
@@ -1606,10 +1610,9 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
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
@@ -1621,9 +1624,6 @@ foreach k, v: config_host
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



