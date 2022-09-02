Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324BE5AB6B2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 18:37:27 +0200 (CEST)
Received: from localhost ([::1]:42482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU9fZ-0005mx-Pp
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 12:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9be-0000im-5x
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:33:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9ba-0003pQ-On
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662136395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Kra4RbJQYL9uEhAuq1YwOI2N/sTxeYAyPuvIoAuVmi4=;
 b=htg1D/Ac8eEg6eUXR6rfLCo3/qWZnD5zal7VjUtATqM+6Cj81C3uCgwoHGJ+56/RTpPikL
 Dx7HSDcv6G43gs0tFSW0kGw8LIz8qLZk6ZzzbNIrMICyQ08coYY2miEi2bd8a/f9uQjKrS
 gKYG/oULjDFIX3Lr7NLPn6il32HBu74=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-kRxQYJMMMSOsGqxO7TuylQ-1; Fri, 02 Sep 2022 12:33:14 -0400
X-MC-Unique: kRxQYJMMMSOsGqxO7TuylQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2B6029AA388
 for <qemu-devel@nongnu.org>; Fri,  2 Sep 2022 16:33:13 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63591492C3B;
 Fri,  2 Sep 2022 16:33:13 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>
Subject: [PATCH] configure: Only add configuration for targets that are enabled
Date: Fri,  2 Sep 2022 18:33:12 +0200
Message-Id: <20220902163312.994-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Current code configure devices even for targets that we are not
compiling, just in case that we have configured the target
architecture.

Example that showed on my build is that I am compiling only for
x86_64-softmmu, but it insists in building roms/SLOF, that I am not
using at all.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 configure | 120 +++++++++++++++++++++++++++++-------------------------
 1 file changed, 64 insertions(+), 56 deletions(-)

diff --git a/configure b/configure
index 72ab03f11a..a2741df05d 100755
--- a/configure
+++ b/configure
@@ -2326,62 +2326,70 @@ for f in $LINKS ; do
     fi
 done
 
-# Mac OS X ships with a broken assembler
-roms=
-probe_target_compiler i386-softmmu
-if test -n "$target_cc" &&
-        test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
-        test "$targetos" != "haiku" && test "$softmmu" = yes ; then
-    # Different host OS linkers have different ideas about the name of the ELF
-    # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
-    # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
-    for emu in elf_i386 elf_i386_fbsd elf_i386_obsd i386pe; do
-        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*${emu}[[:space:]]*$"; then
-            ld_i386_emulation="$emu"
-            break
-        fi
-    done
-    if test -n "$ld_i386_emulation"; then
-        roms="pc-bios/optionrom"
-        config_mak=pc-bios/optionrom/config.mak
-        echo "# Automatically generated by configure - do not modify" > $config_mak
-        echo "TOPSRC_DIR=$source_path" >> $config_mak
-        echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_mak
-        write_target_makefile >> $config_mak
-    fi
-fi
-
-probe_target_compiler ppc-softmmu
-if test -n "$target_cc" && test "$softmmu" = yes; then
-    roms="$roms pc-bios/vof"
-    config_mak=pc-bios/vof/config.mak
-    echo "# Automatically generated by configure - do not modify" > $config_mak
-    echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
-    write_target_makefile >> $config_mak
-fi
-
-# Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
-# (which is the lowest architecture level that Clang supports)
-probe_target_compiler s390x-softmmu
-if test -n "$target_cc" && test "$softmmu" = yes; then
-  write_c_skeleton
-  do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
-  has_z900=$?
-  if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
-    if [ $has_z900 != 0 ]; then
-      echo "WARNING: Your compiler does not support the z900!"
-      echo "         The s390-ccw bios will only work with guest CPUs >= z10."
-    fi
-    roms="$roms pc-bios/s390-ccw"
-    config_mak=pc-bios/s390-ccw/config-host.mak
-    echo "# Automatically generated by configure - do not modify" > $config_mak
-    echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
-    write_target_makefile >> $config_mak
-    # SLOF is required for building the s390-ccw firmware on s390x,
-    # since it is using the libnet code from SLOF for network booting.
-    git_submodules="${git_submodules} roms/SLOF"
-  fi
-fi
+for target in $target_list; do
+    case $target in
+	i386-softmmu)
+	    # Mac OS X ships with a broken assembler
+	    roms=
+	    probe_target_compiler i386-softmmu
+	    if test -n "$target_cc" &&
+		    test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
+			test "$targetos" != "haiku" && test "$softmmu" = yes ; then
+		# Different host OS linkers have different ideas about the name of the ELF
+		# emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
+		# variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
+		for emu in elf_i386 elf_i386_fbsd elf_i386_obsd i386pe; do
+		    if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*${emu}[[:space:]]*$"; then
+			ld_i386_emulation="$emu"
+			break
+		    fi
+		done
+		if test -n "$ld_i386_emulation"; then
+		    roms="pc-bios/optionrom"
+		    config_mak=pc-bios/optionrom/config.mak
+		    echo "# Automatically generated by configure - do not modify" > $config_mak
+		    echo "TOPSRC_DIR=$source_path" >> $config_mak
+		    echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_mak
+		    write_target_makefile >> $config_mak
+		fi
+	    fi
+	    ;;
+	ppc-softmmu)
+	    probe_target_compiler ppc-softmmu
+	    if test -n "$target_cc" && test "$softmmu" = yes; then
+		roms="$roms pc-bios/vof"
+		config_mak=pc-bios/vof/config.mak
+		echo "# Automatically generated by configure - do not modify" > $config_mak
+		echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
+		write_target_makefile >> $config_mak
+	    fi
+	    ;;
+	s390-softmmu)
+	    # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
+	    # (which is the lowest architecture level that Clang supports)
+	    probe_target_compiler s390x-softmmu
+	    if test -n "$target_cc" && test "$softmmu" = yes; then
+		write_c_skeleton
+		do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
+		has_z900=$?
+		if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
+		    if [ $has_z900 != 0 ]; then
+			echo "WARNING: Your compiler does not support the z900!"
+			echo "         The s390-ccw bios will only work with guest CPUs >= z10."
+		    fi
+		    roms="$roms pc-bios/s390-ccw"
+		    config_mak=pc-bios/s390-ccw/config-host.mak
+		    echo "# Automatically generated by configure - do not modify" > $config_mak
+		    echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
+		    write_target_makefile >> $config_mak
+		    # SLOF is required for building the s390-ccw firmware on s390x,
+		    # since it is using the libnet code from SLOF for network booting.
+		    git_submodules="${git_submodules} roms/SLOF"
+		fi
+	    fi
+	    ;;
+    esac
+done
 
 #######################################
 # generate config-host.mak
-- 
2.37.2


