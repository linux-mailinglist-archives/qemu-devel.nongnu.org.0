Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615FE25EA8A
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Sep 2020 22:43:41 +0200 (CEST)
Received: from localhost ([::1]:58018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEf2C-0003t4-GH
	for lists+qemu-devel@lfdr.de; Sat, 05 Sep 2020 16:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kEf1S-0003JW-OT; Sat, 05 Sep 2020 16:42:54 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:38597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kEf1Q-0003Rj-RM; Sat, 05 Sep 2020 16:42:54 -0400
Received: by mail-pg1-x544.google.com with SMTP id l191so6102141pgd.5;
 Sat, 05 Sep 2020 13:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DJ11iwEEM/d9RNzP4qWLnzmAXm8pKezjX8Rc7qNKN5I=;
 b=W89R8fZLWDohv1+KU+s858lSg0GCRDtXXju+GF5CXyRmhRG05TVWGFjzl/Vza3jhwg
 kphhdmV1LX030doq+PDG2OXN0rv101Zbg4+CT2d2zWBI+OpwoWB7bMLzTk/0YNd7hKgR
 HcawQDMqLe5WzAkwrHr7q+FVbmdwLhfqOvO894q5soP2E6E6gwmHRZoXrrFs+TwBzLOW
 mnDk933xxe4cv0t10GeuN6zBrchxZC7RYSlvxKCqj2e46SOvBemiXLDX5KgAHeLwtt9s
 qKVyN+74SKeWRVKho+c9T98xCYYwxlmpp7KeGXTVurqY+RTE+Z+P4ICvHxo7bB1hz0Iw
 EEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DJ11iwEEM/d9RNzP4qWLnzmAXm8pKezjX8Rc7qNKN5I=;
 b=n9csodXXkmKxNDdwvuo0Li+wgyULiu42yeAwozTXiA0F0sLvo1rWeBuxF5N+zMAV2d
 hKJkT+xHo+DoAIFb2kkTvjrfHv+MpIhzMXNnKfWr8reOlcoWrKU3Hs5Jmv2PhRMmjJSC
 6oV0zv89y28CwF7lwK5abY25mAh95qcsNq6a2B/HrKGIOSL16RLO31UqSO/mFqQY3gcy
 Jo/PA+TywJEy/KqSC1i/wuzRv9e780lu7HDx9V6jIVL06Ts40qDt7TUbNKZcN9bERDLt
 wmsJArJKdlSZaCDEyM+KayW0EnjIX9biXL79qfAhrvbZCqs1wtsrlApIVuqQIXWPoRkz
 Doag==
X-Gm-Message-State: AOAM5300YO2Wdox7nnYMUe7e1Cs1GkWeA/zxFa/Zxg7AXNanLzTYP80+
 541D8ybHwpOGnlG0Q6d/AeNDTUpXEvQn9I5x
X-Google-Smtp-Source: ABdhPJwg86BH3AxWLK7x/lVczV5tB2VntKVypy97HC+vNT9qK2AMSZeABE0RQstBe7/9uNEAM6odZQ==
X-Received: by 2002:a62:e40a:: with SMTP id r10mr14479887pfh.52.1599338570327; 
 Sat, 05 Sep 2020 13:42:50 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id v21sm8227422pjn.4.2020.09.05.13.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 13:42:49 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Fixes ncursesw detection under msys2/mingw and
 enable curses
Date: Sun,  6 Sep 2020 04:42:36 +0800
Message-Id: <20200905204236.1508-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x544.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mingw pkg-config are showing following absolute path and contains : as the separator,
so we must handling : properly.

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

MINGW doesn't have langinfo.h, only exist in glic and musl

gcc test.c -DNCURSES_WIDECHAR -I/mingw64/include/ncursesw -pipe -lncursesw -lgnurx -ltre -lintl -liconv
test.c:4:10: fatal error: langinfo.h: No such file or directory
    4 | #include <langinfo.h>
      |          ^~~~~~~~~~~~
compilation terminated.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 configure   | 9 +++------
 ui/curses.c | 9 ++++-----
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index f8cbd2898c..2dc25bda69 100755
--- a/configure
+++ b/configure
@@ -3620,8 +3620,8 @@ if test "$iconv" = "no" ; then
 fi
 if test "$curses" != "no" ; then
   if test "$mingw32" = "yes" ; then
-    curses_inc_list="$($pkg_config --cflags ncurses 2>/dev/null):"
-    curses_lib_list="$($pkg_config --libs ncurses 2>/dev/null):-lpdcurses"
+    curses_inc_list="$($pkg_config --cflags ncursesw 2>/dev/null):-I/${MSYSTEM,,}/include/ncursesw:"
+    curses_lib_list="$($pkg_config --libs ncursesw 2>/dev/null):-lncursesw"
   else
     curses_inc_list="$($pkg_config --cflags ncursesw 2>/dev/null):-I/usr/include/ncursesw:"
     curses_lib_list="$($pkg_config --libs ncursesw 2>/dev/null):-lncursesw:-lcursesw"
@@ -3631,17 +3631,14 @@ if test "$curses" != "no" ; then
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
   IFS=:
diff --git a/ui/curses.c b/ui/curses.c
index a59b23a9cf..74b30d323c 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -30,7 +30,6 @@
 #endif
 #include <locale.h>
 #include <wchar.h>
-#include <langinfo.h>
 #include <iconv.h>
 
 #include "qapi/error.h"
@@ -566,14 +565,14 @@ static void font_setup(void)
       0x25bc
     };
 
-    ucs2_to_nativecharset = iconv_open(nl_langinfo(CODESET), "UCS-2");
+    ucs2_to_nativecharset = iconv_open(g_get_codeset(), "UCS-2");
     if (ucs2_to_nativecharset == (iconv_t) -1) {
         fprintf(stderr, "Could not convert font glyphs from UCS-2: '%s'\n",
                         strerror(errno));
         exit(1);
     }
 
-    nativecharset_to_ucs2 = iconv_open("UCS-2", nl_langinfo(CODESET));
+    nativecharset_to_ucs2 = iconv_open("UCS-2", g_get_codeset());
     if (nativecharset_to_ucs2 == (iconv_t) -1) {
         iconv_close(ucs2_to_nativecharset);
         fprintf(stderr, "Could not convert font glyphs to UCS-2: '%s'\n",
@@ -581,7 +580,7 @@ static void font_setup(void)
         exit(1);
     }
 
-    font_conv = iconv_open(nl_langinfo(CODESET), font_charset);
+    font_conv = iconv_open(g_get_codeset(), font_charset);
     if (font_conv == (iconv_t) -1) {
         iconv_close(ucs2_to_nativecharset);
         iconv_close(nativecharset_to_ucs2);
@@ -602,7 +601,7 @@ static void font_setup(void)
     /* DEL */
     convert_ucs(0x7F, 0x2302, ucs2_to_nativecharset);
 
-    if (strcmp(nl_langinfo(CODESET), "UTF-8")) {
+    if (strcmp(g_get_codeset(), "UTF-8")) {
         /* Non-Unicode capable, use termcap equivalents for those available */
         for (i = 0; i <= 0xFF; i++) {
             wchar_t wch[CCHARW_MAX];
-- 
2.28.0.windows.1


