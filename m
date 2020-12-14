Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327502D9A98
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:11:01 +0100 (CET)
Received: from localhost ([::1]:40758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopV5-0004zc-NY
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1kopTx-0003yZ-Ds
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:09:49 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:40898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1kopTv-0003VL-I9
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:09:49 -0500
Received: from 2.general.paelzer.uk.vpn ([10.172.196.173]
 helo=Keschdeichel.fritz.box) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.ehrhardt@canonical.com>)
 id 1kopTs-0006WB-D8; Mon, 14 Dec 2020 15:09:44 +0000
From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] build: -no-pie is no functional linker flag
Date: Mon, 14 Dec 2020 16:09:38 +0100
Message-Id: <20201214150938.1297512-1-christian.ehrhardt@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=christian.ehrhardt@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recent binutils changes dropping unsupported options [1] caused a build
issue in regard to the optionroms.

  ld -m elf_i386 -T /<<PKGBUILDDIR>>/pc-bios/optionrom//flat.lds -no-pie \
    -s -o multiboot.img multiboot.o
  ld.bfd: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)

This isn't really a regression in ld.bfd, filing the bug upstream
revealed that this never worked as a ld flag [2] - in fact it seems we
were by accident setting --nmagic).

Since it never had the wanted effect this usage of LDFLAGS_NOPIE, should be
droppable without any effect. This also is the only use-case of LDFLAGS_NOPIE
in .mak, therefore we can also remove it from being added there.

[1]: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=983d925d
[2]: https://sourceware.org/bugzilla/show_bug.cgi?id=27050#c5

Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
---
 configure                  | 3 ---
 pc-bios/optionrom/Makefile | 1 -
 2 files changed, 4 deletions(-)

diff --git a/configure b/configure
index 3f823ed163..61c17c2dde 100755
--- a/configure
+++ b/configure
@@ -2133,7 +2133,6 @@ EOF
 # Check we support --no-pie first; we will need this for building ROMs.
 if compile_prog "-Werror -fno-pie" "-no-pie"; then
   CFLAGS_NOPIE="-fno-pie"
-  LDFLAGS_NOPIE="-no-pie"
 fi
 
 if test "$static" = "yes"; then
@@ -2149,7 +2148,6 @@ if test "$static" = "yes"; then
   fi
 elif test "$pie" = "no"; then
   CONFIGURE_CFLAGS="$CFLAGS_NOPIE $CONFIGURE_CFLAGS"
-  CONFIGURE_LDFLAGS="$LDFLAGS_NOPIE $CONFIGURE_LDFLAGS"
 elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
   CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
   CONFIGURE_LDFLAGS="-pie $CONFIGURE_LDFLAGS"
@@ -6768,7 +6766,6 @@ echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
 echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
-echo "LDFLAGS_NOPIE=$LDFLAGS_NOPIE" >> $config_host_mak
 echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 echo "HOST_DSOSUF=$HOST_DSOSUF" >> $config_host_mak
diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 084fc10f05..30771f8d17 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -41,7 +41,6 @@ override CFLAGS += $(call cc-option, $(Wa)-32)
 
 LD_I386_EMULATION ?= elf_i386
 override LDFLAGS = -m $(LD_I386_EMULATION) -T $(SRC_DIR)/flat.lds
-override LDFLAGS += $(LDFLAGS_NOPIE)
 
 all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
 
-- 
2.29.2


