Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121AE47A0DF
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:19:53 +0100 (CET)
Received: from localhost ([::1]:40508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myx2W-0000Me-5D
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:19:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx02-00063w-UJ
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:18 -0500
Received: from [2a00:1450:4864:20::534] (port=42674
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx01-0005wb-3S
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:18 -0500
Received: by mail-ed1-x534.google.com with SMTP id j21so23398479edt.9
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EqOLSg8zg8I8UXoyrrO7ni1K5iZyGc8eZFN159xRpqY=;
 b=cuOxYg4/wWP/1CYN3KB1EADAqmbifPXlirCkuWocq46C3PPUzBUECsHY0v0+PzusqE
 V2lIU8k8bYh7uT+iIWgSppIweurRExqMpV/LlxpeYxumC4H9rcqZ2GeijjngmWUDDnyE
 L3sRS/O+TaqbHGG1GoAONUTIoEQZE5XAjXwKD985fTdOGBuMzG14WBsBLW4x74oZHGBg
 x5pkflKvI9ocmna0qU1z8yBIAmRDAdd8J5BnULEtwKrpKCfqbvyCiU6pckEVZvXpEfCT
 Vmj6l2F/qXwkk7mlp2UIIElmgjhjFLhMhV3JjYUx7MddLSrZSy654BdXsx+9sENtxho6
 /eHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EqOLSg8zg8I8UXoyrrO7ni1K5iZyGc8eZFN159xRpqY=;
 b=taUXFh+e6Toy3R3xv6iN9ZGan+OJA/IcNusjPIIDWQQaiBsY7Hc0BxcIdjfoDfK4bj
 vucv/Lm1HhvOX1vZzLZx+lRBsv27W7cvjLuz0kNb0E9JqqgkmHqjbdCSeZOW63G4ha98
 xlXXJsMDnuqVwc3qaRv7bJsU79sUl+qn9T5R2wOXLST4HiUY1njjL85SBnGEKRNUVHyy
 svLJm5nki4joge6V/j78wClcfayaBdgAcMBWrMwykjUAL4BHagirOaLckf0lOqVrL2Vs
 z4217UPbHJti90d5npxbDwUVzUzGl9uRVITFMou2czvnaUXFfLd1RDwuvj5sQGTVHPpu
 z62g==
X-Gm-Message-State: AOAM5335GbQNLJdlfWwCbp/tTYAr/UxW62n3soW7mVPYwB9WWbqaHWlD
 ZwvYCKOMGPqDYgAqzthp3xh4SZJFWEw=
X-Google-Smtp-Source: ABdhPJxcqswJKs9QfPePmBhG1XhLd7enqCh/ytFSkQRwHomsrzMAFEMtICQ9YlG2Zlqeq2bZcDP3BQ==
X-Received: by 2002:a17:907:7b9b:: with SMTP id
 ne27mr9571869ejc.79.1639923434649; 
 Sun, 19 Dec 2021 06:17:14 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id hq9sm4570665ejc.119.2021.12.19.06.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:17:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/16] configure: make $targetos lowercase,
 use windows instead of MINGW32
Date: Sun, 19 Dec 2021 15:16:56 +0100
Message-Id: <20211219141711.248066-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

targetos is already mostly the same as Meson host_machine.system(),
just in CamelCase.  Adjust Windows, which is different, and switch to
lowercase to match Meson.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 58 ++++++++++++++++++++++++-------------------------------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/configure b/configure
index 28e1cf6291..e72e34b684 100755
--- a/configure
+++ b/configure
@@ -501,30 +501,30 @@ EOF
 }
 
 if check_define __linux__ ; then
-  targetos="Linux"
+  targetos=linux
 elif check_define _WIN32 ; then
-  targetos='MINGW32'
+  targetos=windows
 elif check_define __OpenBSD__ ; then
-  targetos='OpenBSD'
+  targetos=openbsd
 elif check_define __sun__ ; then
-  targetos='SunOS'
+  targetos=sunos
 elif check_define __HAIKU__ ; then
-  targetos='Haiku'
+  targetos=haiku
 elif check_define __FreeBSD__ ; then
-  targetos='FreeBSD'
+  targetos=freebsd
 elif check_define __FreeBSD_kernel__ && check_define __GLIBC__; then
-  targetos='GNU/kFreeBSD'
+  targetos=gnu/kfreebsd
 elif check_define __DragonFly__ ; then
-  targetos='DragonFly'
+  targetos=dragonfly
 elif check_define __NetBSD__; then
-  targetos='NetBSD'
+  targetos=netbsd
 elif check_define __APPLE__; then
-  targetos='Darwin'
+  targetos=darwin
 else
   # This is a fatal error, but don't report it yet, because we
   # might be going to just print the --help text, or it might
   # be the result of a missing compiler.
-  targetos='bogus'
+  targetos=bogus
 fi
 
 # Some host OSes need non-standard checks for which CPU to use.
@@ -532,7 +532,7 @@ fi
 # cross-compiling to one of these OSes then you'll need to specify
 # the correct CPU with the --cpu option.
 case $targetos in
-SunOS)
+sunos)
   # $(uname -m) returns i86pc even on an x86_64 box, so default based on isainfo
   if test -z "$cpu" && test "$(isainfo -k)" = "amd64"; then
     cpu="x86_64"
@@ -623,40 +623,40 @@ fi
 # OS specific
 
 case $targetos in
-MINGW32*)
+windows)
   mingw32="yes"
   plugins="no"
   pie="no"
 ;;
-GNU/kFreeBSD)
+gnu/kfreebsd)
   bsd="yes"
 ;;
-FreeBSD)
+freebsd)
   bsd="yes"
   bsd_user="yes"
   make="${MAKE-gmake}"
   # needed for kinfo_getvmmap(3) in libutil.h
 ;;
-DragonFly)
+dragonfly)
   bsd="yes"
   make="${MAKE-gmake}"
 ;;
-NetBSD)
+netbsd)
   bsd="yes"
   make="${MAKE-gmake}"
 ;;
-OpenBSD)
+openbsd)
   bsd="yes"
   make="${MAKE-gmake}"
 ;;
-Darwin)
+darwin)
   bsd="yes"
   darwin="yes"
   # Disable attempts to use ObjectiveC features in os/object.h since they
   # won't work when we're compiling with gcc as a C compiler.
   QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
 ;;
-SunOS)
+sunos)
   solaris="yes"
   make="${MAKE-gmake}"
   smbd="${SMBD-/usr/sfw/sbin/smbd}"
@@ -665,11 +665,11 @@ SunOS)
 # needed for TIOCWIN* defines in termios.h
   QEMU_CFLAGS="-D__EXTENSIONS__ $QEMU_CFLAGS"
 ;;
-Haiku)
+haiku)
   pie="no"
   QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC $QEMU_CFLAGS"
 ;;
-Linux)
+linux)
   linux="yes"
   linux_user="yes"
   vhost_user=${default_feature:-yes}
@@ -3334,8 +3334,8 @@ QEMU_GA_MSI_MINGW_DLL_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
 # Mac OS X ships with a broken assembler
 roms=
 if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
-        test "$targetos" != "Darwin" && test "$targetos" != "SunOS" && \
-        test "$targetos" != "Haiku" && test "$softmmu" = yes ; then
+        test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
+        test "$targetos" != "haiku" && test "$softmmu" = yes ; then
     # Different host OS linkers have different ideas about the name of the ELF
     # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
     # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
@@ -3903,15 +3903,7 @@ if test "$skip_meson" = no; then
   if test "$cross_compile" = "yes"; then
     cross_arg="--cross-file config-meson.cross"
     echo "[host_machine]" >> $cross
-    if test "$mingw32" = "yes" ; then
-        echo "system = 'windows'" >> $cross
-    fi
-    if test "$linux" = "yes" ; then
-        echo "system = 'linux'" >> $cross
-    fi
-    if test "$darwin" = "yes" ; then
-        echo "system = 'darwin'" >> $cross
-    fi
+    echo "system = '$targetos'" >> $cross
     case "$ARCH" in
         i386)
             echo "cpu_family = 'x86'" >> $cross
-- 
2.33.1



