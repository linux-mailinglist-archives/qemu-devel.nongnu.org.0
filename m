Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6FB298EAC
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 14:58:20 +0100 (CET)
Received: from localhost ([::1]:50674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX30t-0003ix-7C
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 09:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX2ug-0005hQ-G4
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:51:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX2uS-0001kt-Qx
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603720298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q2/1xW3dbH1Lhr/F+FHDrEtNrsWDFmpxnRil/jGCbtM=;
 b=QasAFqa7gJGxvdQYLIzdRGZiGaTfuFUAClscA40ZgLFQQYOvU8PLoXL9R/8DyrRwvW0SGr
 HiUe/lGm5GYOmD+chca2fx8IinGd8giQ3kt2FnsiSHq2C/gUiNiUs8I6GCa5/UzQyylxQ0
 tpi2FC58wabEiv3WPF0WQ9l5eG+Y588=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-kEk091TXOWCzPx1TR1rwIg-1; Mon, 26 Oct 2020 09:51:33 -0400
X-MC-Unique: kEk091TXOWCzPx1TR1rwIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CBE7188C12F
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 13:51:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 623016EF7B
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 13:51:32 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/17] meson: rewrite curses/iconv test
Date: Mon, 26 Oct 2020 09:51:16 -0400
Message-Id: <20201026135131.3006712-3-pbonzini@redhat.com>
In-Reply-To: <20201026135131.3006712-1-pbonzini@redhat.com>
References: <20201026135131.3006712-1-pbonzini@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Redo the curses test to do the same tests that the configure
check used to do.  OpenBSD triggers the warning because
it does not support NCURSES_WIDECHAR and thus the cc.links
test fails.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 127 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 73 insertions(+), 54 deletions(-)

diff --git a/meson.build b/meson.build
index 7627a0ae46..0edde14ad7 100644
--- a/meson.build
+++ b/meson.build
@@ -465,70 +465,89 @@ endif
 iconv = not_found
 curses = not_found
 if have_system and not get_option('curses').disabled()
-  if not get_option('iconv').disabled()
-    libiconv = cc.find_library('iconv',
-                               required: false,
-                               static: enable_static)
-    if cc.links('''
-      #include <iconv.h>
-      int main(void) {
-        iconv_t conv = iconv_open("WCHAR_T", "UCS-2");
-        return conv != (iconv_t) -1;
-      }''', dependencies: [libiconv])
-      iconv = declare_dependency(dependencies: [libiconv])
+  curses_test = '''
+    #include <locale.h>
+    #include <curses.h>
+    #include <wchar.h>
+    int main(void) {
+      wchar_t wch = L'w';
+      setlocale(LC_ALL, "");
+      resize_term(0, 0);
+      addwstr(L"wide chars\n");
+      addnwstr(&wch, 1);
+      add_wch(WACS_DEGREE);
+      return 0;
+    }'''
+
+  curses = dependency((targetos == 'windows' ? 'ncurses' : 'ncursesw'),
+                      required: false,
+                      method: 'pkg-config',
+                      static: enable_static)
+  msg = get_option('curses').enabled() ? 'curses library not found' : ''
+  if curses.found()
+    if cc.links(curses_test, dependencies: [curses])
+      curses = declare_dependency(compile_args: '-DNCURSES_WIDECHAR', dependencies: [curses])
+    else
+      msg = 'curses package not usable'
+      curses = not_found
     endif
   endif
-  if get_option('iconv').enabled() and not iconv.found()
-    error('Cannot detect iconv API')
-  endif
-  if iconv.found()
-    curses_libname_list = ['ncursesw', 'ncurses', 'cursesw', 'pdcurses']
-    curses_test = '''
-      #include <locale.h>
-      #include <curses.h>
-      #include <wchar.h>
-      int main(void) {
-        wchar_t wch = L'w';
-        setlocale(LC_ALL, "");
-        resize_term(0, 0);
-        addwstr(L"wide chars\n");
-        addnwstr(&wch, 1);
-        add_wch(WACS_DEGREE);
-        return 0;
-      }'''
-    foreach curses_libname : curses_libname_list
-      libcurses = dependency(curses_libname,
-                             required: false,
-                             method: 'pkg-config',
-                             static: enable_static)
-
-      if not libcurses.found()
-        dirs = ['/usr/include/ncursesw']
-        if targetos == 'windows'
-          dirs = []
-        endif
+  if not curses.found()
+    curses_compile_args = ['-DNCURSES_WIDECHAR']
+    has_curses_h = cc.has_header('curses.h', args: curses_compile_args)
+    if targetos != 'windows' and not has_curses_h
+      message('Trying with /usr/include/ncursesw')
+      curses_compile_args += ['-I/usr/include/ncursesw']
+      has_curses_h = cc.has_header('curses.h', args: curses_compile_args)
+    endif
+    if has_curses_h
+      curses_libname_list = (targetos == 'windows' ? ['pdcurses'] : ['ncursesw', 'cursesw'])
+      foreach curses_libname : curses_libname_list
         libcurses = cc.find_library(curses_libname,
                                     required: false,
-                                    dirs: dirs,
                                     static: enable_static)
-      endif
-      if libcurses.found()
-        if cc.links(curses_test, dependencies: [libcurses])
-          curses = declare_dependency(compile_args: '-DNCURSES_WIDECHAR', dependencies: [libcurses])
-          break
+        if libcurses.found()
+          if cc.links(curses_test, args: curses_compile_args, dependencies: libcurses)
+            curses = declare_dependency(compile_args: curses_compile_args,
+                                        dependencies: [libcurses])
+            break
+          else
+            msg = 'curses library not usable'
+          endif
         endif
+      endforeach
+    endif
+  endif
+  if not get_option('iconv').disabled()
+    foreach link_args : [ ['-liconv'], [] ]
+      # Programs will be linked with glib and this will bring in libiconv on FreeBSD.
+      # We need to use libiconv if available because mixing libiconv's headers with
+      # the system libc does not work.
+      # However, without adding glib to the dependencies -L/usr/local/lib will not be
+      # included in the command line and libiconv will not be found.
+      if cc.links('''
+        #include <iconv.h>
+        int main(void) {
+          iconv_t conv = iconv_open("WCHAR_T", "UCS-2");
+          return conv != (iconv_t) -1;
+        }''', args: config_host['GLIB_CFLAGS'].split() + config_host['GLIB_LIBS'].split() + link_args)
+        iconv = declare_dependency(link_args: link_args, dependencies: glib)
+        break
       endif
     endforeach
   endif
-  if not curses.found()
-    if iconv.found()
-      if get_option('curses').enabled()
-        error('Cannot find curses')
-      endif
-    elif get_option('curses').enabled()
-      error('iconv required for curses UI but not available')
+  if curses.found() and not iconv.found()
+    if get_option('iconv').enabled()
+      error('iconv not available')
+    endif
+    msg = 'iconv required for curses UI but not available'
+    curses = not_found
+  endif
+  if not curses.found() and msg != ''
+    if get_option('curses').enabled()
+      error(msg)
     else
-      warning('iconv required for curses UI but not available, disabling')
+      warning(msg + ', disabling')
     endif
   endif
 endif
-- 
2.26.2



