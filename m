Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298392486E1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 16:14:20 +0200 (CEST)
Received: from localhost ([::1]:44538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k82NX-0000OB-38
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 10:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82K2-00034s-Lw
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:10:44 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53669
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82Jy-0007Iq-T7
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tjOVdeZdU8flg52xFPrCav0JQnR66QHJMCvoKZaLbqI=;
 b=Iu8tFv57qjxzoXoeeiMvjxKWVEX1XSXrrYwfY0dowaNCx2Oz+w33zEi57+F/couFyxqvb9
 rSSYDZToAXlg2oPWsiO8HfaxHsSticF25NyqHnld+6e5kr64o6tn5wH90m45R3H8og1+b+
 zzL0qK8s79sJ+eFcbaTOWFnB+Njeg3c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-lNocP9vfMX2dlMrXgWkyaQ-1; Tue, 18 Aug 2020 10:10:36 -0400
X-MC-Unique: lNocP9vfMX2dlMrXgWkyaQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7450FD6381
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:10:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 383445C64D;
 Tue, 18 Aug 2020 14:10:32 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 008/150] tests/vm: do not pollute configure with --efi-aarch64
Date: Tue, 18 Aug 2020 10:08:03 -0400
Message-Id: <20200818141025.21608-9-pbonzini@redhat.com>
In-Reply-To: <20200818141025.21608-1-pbonzini@redhat.com>
References: <20200818141025.21608-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 02:16:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just make EFI_AARCH64 a variable in the makefile that defaults to the efi
firmware included with QEMU.  It can be redefined on the "make" command
line.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                 | 19 -------------------
 tests/vm/Makefile.include |  2 ++
 2 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/configure b/configure
index 2acc4d1465..1c17a0f27f 100755
--- a/configure
+++ b/configure
@@ -418,7 +418,6 @@ prefix="/usr/local"
 mandir="\${prefix}/share/man"
 datadir="\${prefix}/share"
 firmwarepath="\${prefix}/share/qemu-firmware"
-efi_aarch64=""
 qemu_docdir="\${prefix}/share/doc/qemu"
 bindir="\${prefix}/bin"
 libdir="\${prefix}/lib"
@@ -1109,8 +1108,6 @@ for opt do
   ;;
   --firmwarepath=*) firmwarepath="$optarg"
   ;;
-  --efi-aarch64=*) efi_aarch64="$optarg"
-  ;;
   --host=*|--build=*|\
   --disable-dependency-tracking|\
   --sbindir=*|--sharedstatedir=*|\
@@ -3650,20 +3647,6 @@ EOF
   fi
 fi
 
-############################################
-# efi-aarch64 probe
-# Check for efi files needed by aarch64 VMs.
-# By default we will use the efi included with QEMU.
-# Allow user to override the path for efi also.
-if ! test -f "$efi_aarch64"; then
-  if test -f $source_path/pc-bios/edk2-aarch64-code.fd.bz2; then
-    # valid after build
-    efi_aarch64=$PWD/pc-bios/edk2-aarch64-code.fd
-  else
-    efi_aarch64=""
-  fi
-fi
-
 ##########################################
 # libcap-ng library probe
 if test "$cap_ng" != "no" ; then
@@ -6861,7 +6844,6 @@ if test "$docs" != "no"; then
     echo "sphinx-build      $sphinx_build"
 fi
 echo "genisoimage       $genisoimage"
-echo "efi_aarch64       $efi_aarch64"
 echo "python_yaml       $python_yaml"
 echo "slirp support     $slirp $(echo_version $slirp $slirp_version)"
 if test "$slirp" != "no" ; then
@@ -7963,7 +7945,6 @@ echo "PYTHON=$python" >> $config_host_mak
 echo "SPHINX_BUILD=$sphinx_build" >> $config_host_mak
 echo "SPHINX_WERROR=$sphinx_werror" >> $config_host_mak
 echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
-echo "EFI_AARCH64=$efi_aarch64" >> $config_host_mak
 echo "PYTHON_YAML=$python_yaml" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
 if $iasl -h > /dev/null 2>&1; then
diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index f21948c46a..a599d1994d 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -2,6 +2,8 @@
 
 .PHONY: vm-build-all vm-clean-all
 
+EFI_AARCH64 = $(wildcard $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)
+
 IMAGES := freebsd netbsd openbsd centos fedora
 ifneq ($(GENISOIMAGE),)
 IMAGES += ubuntu.i386 centos
-- 
2.26.2



