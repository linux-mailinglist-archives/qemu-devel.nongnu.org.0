Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51792870AC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 06:29:49 +0200 (CEST)
Received: from localhost ([::1]:56308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvwXE-0001lt-Ib
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 00:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55913)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rebecca@bsdio.com>) id 1hvwWj-0001M0-DV
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 00:29:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rebecca@bsdio.com>) id 1hvwWi-0004Zt-Dg
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 00:29:17 -0400
Received: from muon.bsdio.com ([65.103.231.193]:4151)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <rebecca@bsdio.com>)
 id 1hvwWi-0004ZD-8P; Fri, 09 Aug 2019 00:29:16 -0400
Received: from muon.bsdio.com (localhost [127.0.0.1])
 by muon.bsdio.com (Postfix) with ESMTP id 5062081CC9;
 Thu,  8 Aug 2019 22:29:15 -0600 (MDT)
Received: from muon.bsdio.com ([127.0.0.1])
 by muon.bsdio.com (muon.bsdio.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zWOmAVpNbpPU; Thu,  8 Aug 2019 22:29:14 -0600 (MDT)
Received: from photon.int.bluestop.org (unknown [10.0.10.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by muon.bsdio.com (Postfix) with ESMTPSA;
 Thu,  8 Aug 2019 22:29:14 -0600 (MDT)
From: Rebecca Cran <rebecca@bsdio.com>
To: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
Date: Thu,  8 Aug 2019 22:29:09 -0600
Message-Id: <20190809042909.74988-1-rebecca@bsdio.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 65.103.231.193
Subject: [Qemu-devel] [PATCH v2] Update the avx2 configure test to be
 compatible with clang
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
Cc: Rebecca Cran <rebecca@bsdio.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

clang doesn't support the GCC pragma to enable AVX2, but instead
requires the command line option -mavx2. Since GCC also supports that,
remove the pragma lines and add the -mavx2 option when building the
test. If AVX2 is supported, update QEMU_CFLAGS to include -mavx2 .

Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
---
 configure | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 714e7fb6a1..227fce6561 100755
--- a/configure
+++ b/configure
@@ -5392,8 +5392,6 @@ fi
=20
 if test "$cpuid_h" =3D "yes" && test "$avx2_opt" !=3D "no"; then
   cat > $TMPC << EOF
-#pragma GCC push_options
-#pragma GCC target("avx2")
 #include <cpuid.h>
 #include <immintrin.h>
 static int bar(void *a) {
@@ -5402,7 +5400,8 @@ static int bar(void *a) {
 }
 int main(int argc, char *argv[]) { return bar(argv[0]); }
 EOF
-  if compile_object "" ; then
+  if compile_object "-mavx2" ; then
+    QEMU_CFLAGS=3D"-mavx2 $QEMU_CFLAGS"
     avx2_opt=3D"yes"
   else
     avx2_opt=3D"no"
--=20
2.22.0


