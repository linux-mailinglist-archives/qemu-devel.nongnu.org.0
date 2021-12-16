Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4F4476C4A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:57:17 +0100 (CET)
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmZf-0000Vb-Vo
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:57:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUO-0000Zf-PT
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUM-00049Q-HR
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639644706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MbZGrWDN/p1LbliR2t3XnuEn9XWqFhWjhYi4mSJsbLU=;
 b=JANobeeNSmSn0YtdcZiD2CU8btskNDW75TvG+wu9yKpoWYA5MJhMZGEILmHn83cOEz/ttv
 iFv7yM/KDpalMkad3TECoW4Oyn4jqljoA2Md7fjp643aHWiDGHqWpTt5zqsEsb1G79kq4z
 xTIdUhvlMw2h3n2A/fRnuMMfLDB3+1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-tU7HJXzoNiC3bWljjmNq4A-1; Thu, 16 Dec 2021 03:51:44 -0500
X-MC-Unique: tU7HJXzoNiC3bWljjmNq4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9564E5F9EB
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:43 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13C8B2C1AB
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/10] configure: move target detection before CPU detection
Date: Thu, 16 Dec 2021 09:51:32 +0100
Message-Id: <20211216085139.99682-4-pbonzini@redhat.com>
In-Reply-To: <20211216085139.99682-1-pbonzini@redhat.com>
References: <20211216085139.99682-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 63438c1900..157691d99e 100755
--- a/configure
+++ b/configure
@@ -528,16 +528,67 @@ else
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
@@ -621,62 +672,6 @@ if test -z "$ARCH"; then
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



