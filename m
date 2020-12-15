Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A392DB3A6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:24:28 +0100 (CET)
Received: from localhost ([::1]:49908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEzr-00083r-SC
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEY2-0003zq-54
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXg-0001a3-L2
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bemhwXleYo/H+Fzmdbp/M6MBosU6GzGa3ffHK2XxtKU=;
 b=KxiSIvMTaCmqUU6w/SWd2UDEWnbEd5xTBeCzgkmOF0+fmMLUx1m9Uw36qB4iLy3XXpwScR
 txUGlgTwmYicNF0t6inykZv6yft5F5nnBSExgFVbDnLhtjxu0vU2ZL12F+5cfqRchcjHwE
 no9rAwDC8Uxr9sdXCIETvC17r8hcu9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-W4AKqkRIPO2k5jlQnwNQiw-1; Tue, 15 Dec 2020 12:55:14 -0500
X-MC-Unique: W4AKqkRIPO2k5jlQnwNQiw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E22910054FF;
 Tue, 15 Dec 2020 17:55:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEF6260854;
 Tue, 15 Dec 2020 17:55:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 45/45] build: -no-pie is no functional linker flag
Date: Tue, 15 Dec 2020 12:54:45 -0500
Message-Id: <20201215175445.1272776-46-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-stable@nongnu.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Ehrhardt <christian.ehrhardt@canonical.com>

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
Message-Id: <20201214150938.1297512-1-christian.ehrhardt@canonical.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                  | 3 ---
 pc-bios/optionrom/Makefile | 1 -
 2 files changed, 4 deletions(-)

diff --git a/configure b/configure
index cb21108d34..c228f7c21e 100755
--- a/configure
+++ b/configure
@@ -2137,7 +2137,6 @@ EOF
 # Check we support --no-pie first; we will need this for building ROMs.
 if compile_prog "-Werror -fno-pie" "-no-pie"; then
   CFLAGS_NOPIE="-fno-pie"
-  LDFLAGS_NOPIE="-no-pie"
 fi
 
 if test "$static" = "yes"; then
@@ -2153,7 +2152,6 @@ if test "$static" = "yes"; then
   fi
 elif test "$pie" = "no"; then
   CONFIGURE_CFLAGS="$CFLAGS_NOPIE $CONFIGURE_CFLAGS"
-  CONFIGURE_LDFLAGS="$LDFLAGS_NOPIE $CONFIGURE_LDFLAGS"
 elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
   CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
   CONFIGURE_LDFLAGS="-pie $CONFIGURE_LDFLAGS"
@@ -6714,7 +6712,6 @@ echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
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
2.26.2


