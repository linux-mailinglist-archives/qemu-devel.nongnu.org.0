Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63CC26A53B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 14:32:26 +0200 (CEST)
Received: from localhost ([::1]:33802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIA8H-0004cO-Hv
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 08:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kI9qP-0000ak-Bd; Tue, 15 Sep 2020 08:13:58 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:52112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kI9qL-00089k-Ga; Tue, 15 Sep 2020 08:13:56 -0400
Received: by mail-pj1-x1043.google.com with SMTP id a9so1680480pjg.1;
 Tue, 15 Sep 2020 05:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7fnZxHJTw3qRgRORiSXEFhRbwParpG4yt1WADaHZ43Y=;
 b=Qk+YOmHE3tfPOAjPdwg5eTeSHt5mAzdry6/GkWmwhid6/i/9Xlh39nIdj6RnI+QQZv
 3Djvyj0PYubZmVv293ZvYCohUX+UxyChDIxb9+mfmR6G2FTaZF5Kvt1y5eWBbfEz/qUd
 ym86n3W63rWlu81PmClxdyOHyZ5vE1ggbhyY6b29DbG4SPruhMOS2WPP0C2nNb01Dg5M
 r+ihDpXPguMWMLXPXdBZzQCBdJOP6n7oRFa6A7c8vp20rEgLmeSBNqiCwNjHLokVgl4v
 tgFQ5cGIBC0JXPttvcfkklXaJ2/72MCq2EetZbFxGtfs8fQCpdo1Jt3zkqSC/ax1osdI
 R1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7fnZxHJTw3qRgRORiSXEFhRbwParpG4yt1WADaHZ43Y=;
 b=i7TKa+mLihLIxrF2oFfXMWyx1YNH8IHOv/D8Tkpk74jCvyUtWXSlJ5LM2NVXhgKnsO
 o9CVe7cDPCbI8ZDGuiXopWiEXyPrL3AiqhTYiDbWoEMsSenSjc3tmm2hBAiGvlZJzn1r
 xF0OXgpibi+XYZ4s8C64JyXQ/4UmGJ/INO+GCsJoTBgnY5E3LC5v0WhmFgmDXNABeva+
 bfUaguyGZVSiURvJVZvKGI1m3oe7oavPeOiKwjscPYJRhv5rEyzpfLW2XrP29oEoxZ3g
 pbwUS4LbDZvXfbx4uo9y2pseby4A3mqDxSTITKwF+8L5imdC47u+g9aQyzaesVf+4gcu
 z7Lg==
X-Gm-Message-State: AOAM532KRW5ZBK9spcvmRmPONermCaGdx/IHHc1H5ViptZUQaI3hkcD4
 M6dAjphtJ+rI8o9LEeZoE9Ed++Zrk5oJz4SUCCs=
X-Google-Smtp-Source: ABdhPJyl4klwCFGrZGeA2OMJwRj8JoB7N1FAbf2S8i/OGmxPaJPhPiQIgE2ygnBCAtDCGWjelIWwkQ==
X-Received: by 2002:a17:90b:b0b:: with SMTP id
 bf11mr3879872pjb.227.1600172031043; 
 Tue, 15 Sep 2020 05:13:51 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 k28sm13683061pfh.196.2020.09.15.05.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:13:50 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 03/26] configure: Fixes ncursesw detection under
 msys2/mingw and enable curses
Date: Tue, 15 Sep 2020 20:12:55 +0800
Message-Id: <20200915121318.247-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200915121318.247-1-luoyonggang@gmail.com>
References: <20200915121318.247-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
 Peter Lieven <pl@kamp.de>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mingw pkg-config are showing following absolute path and contains : as the separator,
so we must not use : as path separator. and we know the command line parameter are not likely
contains newline, we could use newline as path command line parameter separator

-D_XOPEN_SOURCE=600 -D_POSIX_C_SOURCE=199506L -IC:/CI-Tools/msys64/mingw64/include/ncursesw:-I/usr/include/ncursesw:
-DNCURSES_WIDECHAR -D_XOPEN_SOURCE=600 -D_POSIX_C_SOURCE=199506L -IC -pipe -lncursesw -lgnurx -ltre -lintl -liconv
-DNCURSES_WIDECHAR -D_XOPEN_SOURCE=600 -D_POSIX_C_SOURCE=199506L -IC -lncursesw
-DNCURSES_WIDECHAR -D_XOPEN_SOURCE=600 -D_POSIX_C_SOURCE=199506L -IC -lcursesw
-DNCURSES_WIDECHAR /CI-Tools/msys64/mingw64/include/ncursesw -pipe -lncursesw -lgnurx -ltre -lintl -liconv
-DNCURSES_WIDECHAR /CI-Tools/msys64/mingw64/include/ncursesw -lncursesw
-DNCURSES_WIDECHAR /CI-Tools/msys64/mingw64/include/ncursesw -lcursesw
-DNCURSES_WIDECHAR -I/usr/include/ncursesw -pipe -lncursesw -lgnurx -ltre -lintl -liconv
-DNCURSES_WIDECHAR -I/usr/include/ncursesw -lncursesw
-DNCURSES_WIDECHAR -I/usr/include/ncursesw -lcursesw

Refer to https://unix.stackexchange.com/a/103011/218958

If your file names are guaranteed not to contain newlines, you can use newlines as the separator. W
hen you expand the variable, first turn off globbing with set -f and set the list of field splitting characters
IFS to contain only a newline.

msys2/mingw lacks the POSIX-required langinfo.h.

gcc test.c -DNCURSES_WIDECHAR -I/mingw64/include/ncursesw -pipe -lncursesw -lgnurx -ltre -lintl -liconv
test.c:4:10: fatal error: langinfo.h: No such file or directory
    4 | #include <langinfo.h>
      |          ^~~~~~~~~~~~
compilation terminated.

So we using g_get_codeset instead of nl_langinfo(CODESET)

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
---
 configure   | 25 +++++++++++++++----------
 ui/curses.c | 10 +++++-----
 2 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/configure b/configure
index f59080703e..dc4b7a2e55 100755
--- a/configure
+++ b/configure
@@ -3654,35 +3654,40 @@ if test "$iconv" = "no" ; then
 fi
 if test "$curses" != "no" ; then
   if test "$mingw32" = "yes" ; then
-    curses_inc_list="$($pkg_config --cflags ncurses 2>/dev/null):"
-    curses_lib_list="$($pkg_config --libs ncurses 2>/dev/null):-lpdcurses"
+    curses_inc_list="$($pkg_config --cflags ncurses 2>/dev/null)
+      $($pkg_config --cflags ncursesw 2>/dev/null)"
+    curses_lib_list="$($pkg_config --libs ncurses 2>/dev/null)
+      $($pkg_config --libs ncursesw 2>/dev/null)
+      -lpdcurses"
   else
-    curses_inc_list="$($pkg_config --cflags ncursesw 2>/dev/null):-I/usr/include/ncursesw:"
-    curses_lib_list="$($pkg_config --libs ncursesw 2>/dev/null):-lncursesw:-lcursesw"
+    curses_inc_list="$($pkg_config --cflags ncursesw 2>/dev/null)
+      -I/usr/include/ncursesw:"
+    curses_lib_list="$($pkg_config --libs ncursesw 2>/dev/null)
+      -lncursesw
+      -lcursesw"
   fi
   curses_found=no
   cat > $TMPC << EOF
 #include <locale.h>
 #include <curses.h>
 #include <wchar.h>
-#include <langinfo.h>
 int main(void) {
-  const char *codeset;
   wchar_t wch = L'w';
   setlocale(LC_ALL, "");
   resize_term(0, 0);
   addwstr(L"wide chars\n");
   addnwstr(&wch, 1);
   add_wch(WACS_DEGREE);
-  codeset = nl_langinfo(CODESET);
-  return codeset != 0;
+  return 0;
 }
 EOF
-  IFS=:
+  IFS='
+'                           # turn off variable value expansion except for splitting at newlines
   for curses_inc in $curses_inc_list; do
     # Make sure we get the wide character prototypes
     curses_inc="-DNCURSES_WIDECHAR $curses_inc"
-    IFS=:
+    IFS='
+'                           # turn off variable value expansion except for splitting at newlines
     for curses_lib in $curses_lib_list; do
       unset IFS
       if compile_prog "$curses_inc" "$curses_lib" ; then
diff --git a/ui/curses.c b/ui/curses.c
index a59b23a9cf..12bc682cf9 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -30,7 +30,6 @@
 #endif
 #include <locale.h>
 #include <wchar.h>
-#include <langinfo.h>
 #include <iconv.h>
 
 #include "qapi/error.h"
@@ -526,6 +525,7 @@ static void font_setup(void)
     iconv_t nativecharset_to_ucs2;
     iconv_t font_conv;
     int i;
+    g_autofree gchar *local_codeset = g_get_codeset();
 
     /*
      * Control characters are normally non-printable, but VGA does have
@@ -566,14 +566,14 @@ static void font_setup(void)
       0x25bc
     };
 
-    ucs2_to_nativecharset = iconv_open(nl_langinfo(CODESET), "UCS-2");
+    ucs2_to_nativecharset = iconv_open(local_codeset, "UCS-2");
     if (ucs2_to_nativecharset == (iconv_t) -1) {
         fprintf(stderr, "Could not convert font glyphs from UCS-2: '%s'\n",
                         strerror(errno));
         exit(1);
     }
 
-    nativecharset_to_ucs2 = iconv_open("UCS-2", nl_langinfo(CODESET));
+    nativecharset_to_ucs2 = iconv_open("UCS-2", local_codeset);
     if (nativecharset_to_ucs2 == (iconv_t) -1) {
         iconv_close(ucs2_to_nativecharset);
         fprintf(stderr, "Could not convert font glyphs to UCS-2: '%s'\n",
@@ -581,7 +581,7 @@ static void font_setup(void)
         exit(1);
     }
 
-    font_conv = iconv_open(nl_langinfo(CODESET), font_charset);
+    font_conv = iconv_open(local_codeset, font_charset);
     if (font_conv == (iconv_t) -1) {
         iconv_close(ucs2_to_nativecharset);
         iconv_close(nativecharset_to_ucs2);
@@ -602,7 +602,7 @@ static void font_setup(void)
     /* DEL */
     convert_ucs(0x7F, 0x2302, ucs2_to_nativecharset);
 
-    if (strcmp(nl_langinfo(CODESET), "UTF-8")) {
+    if (strcmp(local_codeset, "UTF-8")) {
         /* Non-Unicode capable, use termcap equivalents for those available */
         for (i = 0; i <= 0xFF; i++) {
             wchar_t wch[CCHARW_MAX];
-- 
2.28.0.windows.1


