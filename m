Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C0290469
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 13:54:09 +0200 (CEST)
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTOJE-0007Mf-K2
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 07:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTODf-0000MY-5f
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTODc-0002o5-F3
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602848899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/MUWPiZILYXMWPPKyOR/YuGLV5vrO/Lu8LXNNJ2o0A0=;
 b=B9IMSRTFBqm/EkHRe5aFyEYwXLXz86+r+tDlbycgQHKJr8NnvpU7huusvrvB48pHHSfSnz
 eyI1bjUGFkYfnnHiOSkVRsVWrbk6bLfuKmdyBDTYHUXC87siJWkOb2CBPeEoky7LDALpUP
 Wh2StUZ1lFktPCF6KiAjc2pqDG2j4so=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-f0_84ZAWPSKICcfbhpLCig-1; Fri, 16 Oct 2020 07:48:18 -0400
X-MC-Unique: f0_84ZAWPSKICcfbhpLCig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EA251084C82
 for <qemu-devel@nongnu.org>; Fri, 16 Oct 2020 11:48:17 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2EAF76640;
 Fri, 16 Oct 2020 11:48:16 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/22] configure: move QEMU_INCLUDES to meson
Date: Fri, 16 Oct 2020 07:47:58 -0400
Message-Id: <20201016114814.1564523-7-pbonzini@redhat.com>
In-Reply-To: <20201016114814.1564523-1-pbonzini@redhat.com>
References: <20201016114814.1564523-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 20:29:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Confusingly, QEMU_INCLUDES is not used by configure tests.  Moving
it to meson.build ensures that Windows paths are specified instead of
the msys paths like /c/Users/...

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 20 --------------------
 meson.build | 30 ++++++++++++++++++++++++++++--
 2 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/configure b/configure
index f839c2a557..8aa03876d4 100755
--- a/configure
+++ b/configure
@@ -537,8 +537,6 @@ QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv $QEMU_CFLAGS"
 QEMU_CFLAGS="-Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
 QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
-QEMU_INCLUDES="-iquote . -iquote ${source_path} -iquote ${source_path}/accel/tcg -iquote ${source_path}/include"
-QEMU_INCLUDES="$QEMU_INCLUDES -iquote ${source_path}/disas/libvixl"
 
 # Flags that are needed during configure but later taken care of by Meson
 CONFIGURE_CFLAGS="-std=gnu99 -Wall"
@@ -796,7 +794,6 @@ Linux)
   audio_possible_drivers="oss alsa sdl pa"
   linux="yes"
   linux_user="yes"
-  QEMU_INCLUDES="-isystem ${source_path}/linux-headers -Ilinux-headers $QEMU_INCLUDES"
 ;;
 esac
 
@@ -6776,22 +6773,6 @@ if test "$secret_keyring" = "yes" ; then
   echo "CONFIG_SECRET_KEYRING=y" >> $config_host_mak
 fi
 
-if test "$tcg_interpreter" = "yes"; then
-  QEMU_INCLUDES="-iquote ${source_path}/tcg/tci $QEMU_INCLUDES"
-elif test "$ARCH" = "sparc64" ; then
-  QEMU_INCLUDES="-iquote ${source_path}/tcg/sparc $QEMU_INCLUDES"
-elif test "$ARCH" = "s390x" ; then
-  QEMU_INCLUDES="-iquote ${source_path}/tcg/s390 $QEMU_INCLUDES"
-elif test "$ARCH" = "x86_64" || test "$ARCH" = "x32" ; then
-  QEMU_INCLUDES="-iquote ${source_path}/tcg/i386 $QEMU_INCLUDES"
-elif test "$ARCH" = "ppc64" ; then
-  QEMU_INCLUDES="-iquote ${source_path}/tcg/ppc $QEMU_INCLUDES"
-elif test "$ARCH" = "riscv32" || test "$ARCH" = "riscv64" ; then
-  QEMU_INCLUDES="-I${source_path}/tcg/riscv $QEMU_INCLUDES"
-else
-  QEMU_INCLUDES="-iquote ${source_path}/tcg/${ARCH} $QEMU_INCLUDES"
-fi
-
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
 echo "PYTHON=$python" >> $config_host_mak
@@ -6818,7 +6799,6 @@ echo "WINDRES=$windres" >> $config_host_mak
 echo "CFLAGS_NOPIE=$CFLAGS_NOPIE" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
-echo "QEMU_INCLUDES=$QEMU_INCLUDES" >> $config_host_mak
 echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 1a4a482492..88f757eac9 100644
--- a/meson.build
+++ b/meson.build
@@ -93,9 +93,35 @@ add_project_arguments(config_host['QEMU_CXXFLAGS'].split(),
                       native: false, language: 'cpp')
 add_project_link_arguments(config_host['QEMU_LDFLAGS'].split(),
                            native: false, language: ['c', 'cpp', 'objc'])
-add_project_arguments(config_host['QEMU_INCLUDES'].split(),
-                      language: ['c', 'cpp', 'objc'])
 
+if targetos == 'linux'
+  add_project_arguments('-isystem', meson.current_source_dir() / 'linux-headers',
+                        '-isystem', 'linux-headers',
+                        language: ['c', 'cpp'])
+endif
+
+if 'CONFIG_TCG_INTERPRETER' in config_host
+  tcg_arch = 'tci'
+elif config_host['ARCH'] == 'sparc64'
+  tcg_arch = 'sparc'
+elif config_host['ARCH'] == 's390x'
+  tcg_arch = 's390'
+elif config_host['ARCH'] in ['x86_64', 'x32']
+  tcg_arch = 'i386'
+elif config_host['ARCH'] == 'ppc64'
+  tcg_arch = 'ppc'
+elif config_host['ARCH'] in ['riscv32', 'riscv64']
+  tcg_arch = 'riscv'
+else
+  tcg_arch = config_host['ARCH']
+endif
+add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / tcg_arch,
+                      '-iquote', '.',
+                      '-iquote', meson.current_source_dir(),
+                      '-iquote', meson.current_source_dir() / 'accel/tcg',
+                      '-iquote', meson.current_source_dir() / 'include',
+                      '-iquote', meson.current_source_dir() / 'disas/libvixl',
+                      language: ['c', 'cpp', 'objc'])
 
 link_language = meson.get_external_property('link_language', 'cpp')
 if link_language == 'cpp'
-- 
2.26.2



