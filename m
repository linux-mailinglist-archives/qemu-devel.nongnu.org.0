Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514DC47A0E0
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:19:53 +0100 (CET)
Received: from localhost ([::1]:40630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myx2W-0000R2-Do
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:19:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx03-000647-VX
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:19 -0500
Received: from [2a00:1450:4864:20::52c] (port=44974
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx01-0005wi-I7
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:19 -0500
Received: by mail-ed1-x52c.google.com with SMTP id z7so27711736edc.11
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zEwHid1Zv0oXAk8+2KsA2jpvfbATiHDd8P3ZPEfNrVo=;
 b=bwxajoZBHFP2yk2838ahQJIdOZjohYIhwS8qlLFJSzi6Q0IpCKhzaCwVEAc9x8arS4
 k0NnmW1RLj4S12j8d1W8x2a72Jj74W3wYrrVzHEgTLi842kcidlAyqCbb2DmO11pWwVB
 2KnHURb0MUFDty2ZtnFazdfT2V6wvwJic2buC+oaecLhPYI8s8YVfY878pI/9beiuCkq
 KsmKxfneXBLOrRLAtiV9C2xbN0VW+PeBzUMb+PdD/ROWbN2In9U9Y9jwk2ZnTNUiPUWV
 J/o/Pzx6D4HpyPnhVQR8+pF6sfgvEgFYD71oeaR2uAcXTqP+xZXcYOYKZB5ETI1x4iCc
 E4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zEwHid1Zv0oXAk8+2KsA2jpvfbATiHDd8P3ZPEfNrVo=;
 b=rJT8b198vPrUnYzBuBGlTtc0Oay+O51I57SEJKgIxgIOVe8HVQTcJQF39ilL4FR0Ti
 zElJ0odBastNIvk03m0bT3sgFetvzsTC/vu8MWqlLUCrKVMhmwkZ5ok+mdqXjPfshMqn
 zV8hTbAUvCXGN8qMyEf1fcHTphv8wAkMPByT0WG7r3dQyvDixV2PUhnQRjbGFMA0aRll
 yiV18Qf5dGPKA1UHoUPcrpmnZvCDjy0RSbuErT7NS6AMOhmvZ9GsG223bHLwVuPDzcNY
 87wx1v7AnS/BsGCfXoNQpi/nnU6Is3xZkJiAA4DG0JsPMfhrtRp6Rv5+WnXElLFRo6NA
 b8+A==
X-Gm-Message-State: AOAM533Wz7ryd/xNVSdptrVAXH2ufRKwr40+LXCGpH2ALpDvuwQlEURd
 PD+IttT1J0h04CwTjBnwek9PdefN/HM=
X-Google-Smtp-Source: ABdhPJxuThFJrCk7dK5K7aDR+m4c9+rzbOcdlxygjL20x5idCIWHLnLOFwZBDkJ2KiA1AsskP1aC1w==
X-Received: by 2002:a17:907:7fa2:: with SMTP id
 qk34mr9722010ejc.691.1639923436146; 
 Sun, 19 Dec 2021 06:17:16 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id hq9sm4570665ejc.119.2021.12.19.06.17.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:17:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/16] configure: move target detection before CPU detection
Date: Sun, 19 Dec 2021 15:16:57 +0100
Message-Id: <20211219141711.248066-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes more sense, since target detection can affect CPU detection
on Solaris.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 115 ++++++++++++++++++++++++++----------------------------
 1 file changed, 55 insertions(+), 60 deletions(-)

diff --git a/configure b/configure
index e72e34b684..f0a82dd8f5 100755
--- a/configure
+++ b/configure
@@ -527,16 +527,67 @@ else
   targetos=bogus
 fi
 
-# Some host OSes need non-standard checks for which CPU to use.
-# Note that these checks are broken for cross-compilation: if you're
-# cross-compiling to one of these OSes then you'll need to specify
-# the correct CPU with the --cpu option.
+# OS specific
+
 case $targetos in
+windows)
+  mingw32="yes"
+  plugins="no"
+  pie="no"
+;;
+gnu/kfreebsd)
+  bsd="yes"
+;;
+freebsd)
+  bsd="yes"
+  bsd_user="yes"
+  make="${MAKE-gmake}"
+  # needed for kinfo_getvmmap(3) in libutil.h
+;;
+dragonfly)
+  bsd="yes"
+  make="${MAKE-gmake}"
+;;
+netbsd)
+  bsd="yes"
+  make="${MAKE-gmake}"
+;;
+openbsd)
+  bsd="yes"
+  make="${MAKE-gmake}"
+;;
+darwin)
+  bsd="yes"
+  darwin="yes"
+  # Disable attempts to use ObjectiveC features in os/object.h since they
+  # won't work when we're compiling with gcc as a C compiler.
+  QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
+;;
 sunos)
+  solaris="yes"
+  make="${MAKE-gmake}"
+  smbd="${SMBD-/usr/sfw/sbin/smbd}"
+# needed for CMSG_ macros in sys/socket.h
+  QEMU_CFLAGS="-D_XOPEN_SOURCE=600 $QEMU_CFLAGS"
+# needed for TIOCWIN* defines in termios.h
+  QEMU_CFLAGS="-D__EXTENSIONS__ $QEMU_CFLAGS"
   # $(uname -m) returns i86pc even on an x86_64 box, so default based on isainfo
+  # Note that this check is broken for cross-compilation: if you're
+  # cross-compiling to one of these OSes then you'll need to specify
+  # the correct CPU with the --cpu option.
   if test -z "$cpu" && test "$(isainfo -k)" = "amd64"; then
     cpu="x86_64"
   fi
+;;
+haiku)
+  pie="no"
+  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC $QEMU_CFLAGS"
+;;
+linux)
+  linux="yes"
+  linux_user="yes"
+  vhost_user=${default_feature:-yes}
+;;
 esac
 
 if test ! -z "$cpu" ; then
@@ -620,62 +671,6 @@ if test -z "$ARCH"; then
   ARCH="$cpu"
 fi
 
-# OS specific
-
-case $targetos in
-windows)
-  mingw32="yes"
-  plugins="no"
-  pie="no"
-;;
-gnu/kfreebsd)
-  bsd="yes"
-;;
-freebsd)
-  bsd="yes"
-  bsd_user="yes"
-  make="${MAKE-gmake}"
-  # needed for kinfo_getvmmap(3) in libutil.h
-;;
-dragonfly)
-  bsd="yes"
-  make="${MAKE-gmake}"
-;;
-netbsd)
-  bsd="yes"
-  make="${MAKE-gmake}"
-;;
-openbsd)
-  bsd="yes"
-  make="${MAKE-gmake}"
-;;
-darwin)
-  bsd="yes"
-  darwin="yes"
-  # Disable attempts to use ObjectiveC features in os/object.h since they
-  # won't work when we're compiling with gcc as a C compiler.
-  QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
-;;
-sunos)
-  solaris="yes"
-  make="${MAKE-gmake}"
-  smbd="${SMBD-/usr/sfw/sbin/smbd}"
-# needed for CMSG_ macros in sys/socket.h
-  QEMU_CFLAGS="-D_XOPEN_SOURCE=600 $QEMU_CFLAGS"
-# needed for TIOCWIN* defines in termios.h
-  QEMU_CFLAGS="-D__EXTENSIONS__ $QEMU_CFLAGS"
-;;
-haiku)
-  pie="no"
-  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC $QEMU_CFLAGS"
-;;
-linux)
-  linux="yes"
-  linux_user="yes"
-  vhost_user=${default_feature:-yes}
-;;
-esac
-
 : ${make=${MAKE-make}}
 
 # We prefer python 3.x. A bare 'python' is traditionally
-- 
2.33.1



