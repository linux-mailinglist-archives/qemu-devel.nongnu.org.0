Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15A06E15F0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:35:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3cV-0003uh-LF; Thu, 13 Apr 2023 16:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3cP-0003qi-Sx; Thu, 13 Apr 2023 16:32:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3cG-0003l3-Kg; Thu, 13 Apr 2023 16:32:33 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 3F67B4013D;
 Thu, 13 Apr 2023 23:31:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id BDC78225;
 Thu, 13 Apr 2023 23:31:55 +0300 (MSK)
Received: (nullmailer pid 2344359 invoked by uid 1000);
 Thu, 13 Apr 2023 20:31:54 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 14/21] qemu/osdep: Switch position of "extern" and "G_NORETURN"
Date: Thu, 13 Apr 2023 23:31:26 +0300
Message-Id: <20230413203143.2344250-14-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230413203051.2344192-1-mjt@tls.msk.ru>
References: <20230413203051.2344192-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Fixes the Windows build under msys2 using GCC 12 which fails with the follo=
wing
error:

  [184/579] Compiling C++ object qga/vss-win32/qga-vss.dll.p/install.cpp.obj
  FAILED: qga/vss-win32/qga-vss.dll.p/install.cpp.obj
  "c++" "-m64" "-mcx16" "-Iqga/vss-win32/qga-vss.dll.p" "-Iqga/vss-win32" "=
-I../src/qga/vss-win32" "-I." "-Iqapi" "-Itrace" "-Iui" "-Iui/shader" "-IC:=
/msys64/mingw64/include/glib-2.0" "-IC:/msys64/mingw64/lib/glib-2.0/include=
" "-fdiagnostics-color=3Dauto" "-Wall" "-Winvalid-pch" "-Wnon-virtual-dtor"=
 "-Werror" "-std=3Dgnu++11" "-g" "-iquote" "." "-iquote" "C:/msys64/home/sh=
entey/Projects/qemu/src" "-iquote" "C:/msys64/home/shentey/Projects/qemu/sr=
c/include" "-iquote" "C:/msys64/home/shentey/Projects/qemu/src/tcg/i386" "-=
D__STDC_LIMIT_MACROS" "-D__STDC_CONSTANT_MACROS" "-D__STDC_FORMAT_MACROS" "=
-fno-pie" "-no-pie" "-D_GNU_SOURCE" "-D_FILE_OFFSET_BITS=3D64" "-D_LARGEFIL=
E_SOURCE" "-fno-strict-aliasing" "-fno-common" "-fwrapv" "-Wundef" "-Wwrite=
-strings" "-Wtype-limits" "-Wformat-security" "-Wformat-y2k" "-Winit-self" =
"-Wignored-qualifiers" "-Wempty-body" "-Wendif-labels" "-Wexpansion-to-defi=
ned" "-Wimplicit-fallthrough=3D2" "-Wmissing-format-attribute" "-Wno-missin=
g-include-dirs" "-Wno-shift-negative-value" "-Wno-psabi" "-fstack-protector=
-strong" "-Wno-unknown-pragmas" "-Wno-delete-non-virtual-dtor" "-Wno-non-vi=
rtual-dtor" -MD -MQ qga/vss-win32/qga-vss.dll.p/install.cpp.obj -MF "qga/vs=
s-win32/qga-vss.dll.p/install.cpp.obj.d" -o qga/vss-win32/qga-vss.dll.p/ins=
tall.cpp.obj "-c" ../src/qga/vss-win32/install.cpp
  In file included from C:/msys64/mingw64/lib/glib-2.0/include/glibconfig.h=
:9,
              from C:/msys64/mingw64/include/glib-2.0/glib/gtypes.h:34,
              from C:/msys64/mingw64/include/glib-2.0/glib/galloca.h:34,
              from C:/msys64/mingw64/include/glib-2.0/glib.h:32,
              from C:/msys64/home/shentey/Projects/qemu/src/include/glib-co=
mpat.h:32,
              from C:/msys64/home/shentey/Projects/qemu/src/include/qemu/os=
dep.h:144,
              from ../src/qga/vss-win32/install.cpp:13:
  C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1075:21: error: standar=
d attributes in middle of decl-specifiers
  1075 | # define G_NORETURN [[noreturn]]
        |                     ^
  C:/msys64/home/shentey/Projects/qemu/src/include/qemu/osdep.h:240:8: note=
: in expansion of macro 'G_NORETURN'
  240 | extern G_NORETURN
        |        ^~~~~~~~~~
  C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1075:21: note: standard=
 attributes must precede the decl-specifiers to apply to the declaration, o=
r follow them to apply to the type
  1075 | # define G_NORETURN [[noreturn]]
        |                     ^
  C:/msys64/home/shentey/Projects/qemu/src/include/qemu/osdep.h:240:8: note=
: in expansion of macro 'G_NORETURN'
  240 | extern G_NORETURN
        |        ^~~~~~~~~~
  C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1075:21: error: attribu=
te ignored [-Werror=3Dattributes]
  1075 | # define G_NORETURN [[noreturn]]
        |                     ^
  C:/msys64/home/shentey/Projects/qemu/src/include/qemu/osdep.h:240:8: note=
: in expansion of macro 'G_NORETURN'
  240 | extern G_NORETURN
        |        ^~~~~~~~~~
  C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1075:21: note: an attri=
bute that appertains to a type-specifier is ignored
  1075 | # define G_NORETURN [[noreturn]]
        |                     ^
  C:/msys64/home/shentey/Projects/qemu/src/include/qemu/osdep.h:240:8: note=
: in expansion of macro 'G_NORETURN'
  240 | extern G_NORETURN
        |        ^~~~~~~~~~
  cc1plus.exe: all warnings being treated as errors

Apparently it also fixes the compilation with Clang 15 (see
https://gitlab.com/qemu-project/qemu/-/issues/1541 ).

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1541
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20230318185931.181659-1-shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
(cherry picked from commit 5cb993ff131fca2abef3ce074a20258fd6fce557)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/osdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b9c4307779..3d6cb431ad 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -177,7 +177,7 @@ extern "C" {
  * supports QEMU_ERROR, this will be reported at compile time; otherwise
  * this will be reported at link time due to the missing symbol.
  */
-extern G_NORETURN
+G_NORETURN extern
 void QEMU_ERROR("code path is reachable")
     qemu_build_not_reached_always(void);
 #if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
--=20
2.30.2


