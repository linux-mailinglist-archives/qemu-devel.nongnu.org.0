Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEF13A4DC9
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 10:53:48 +0200 (CEST)
Received: from localhost ([::1]:56800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrzOl-0007s8-DI
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 04:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@mini.fritz.box>)
 id 1lrzMD-0005hF-T9
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 04:51:09 -0400
Received: from p57b42637.dip0.t-ipconnect.de ([87.180.38.55]:55337
 helo=mini.fritz.box) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefan@mini.fritz.box>) id 1lrzMB-0007zo-2V
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 04:51:09 -0400
Received: by mini.fritz.box (Postfix, from userid 502)
 id 4C6A71223130; Sat, 12 Jun 2021 10:04:21 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson.build: Support ncurses on MacOS
Date: Sat, 12 Jun 2021 10:03:58 +0200
Message-Id: <20210612080358.61176-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=87.180.38.55; envelope-from=stefan@mini.fritz.box;
 helo=mini.fritz.box
X-Spam_score_int: 21
X-Spam_score: 2.1
X-Spam_bar: ++
X-Spam_report: (2.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, KHOP_HELO_FCRDNS=0.398,
 NO_DNS_FOR_FROM=0.001, RCVD_IN_PBL=3.335, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MacOS provides header files for curses 5.7 with support
for wide characters, but requires _XOPEN_SOURCE_EXTENDED=1
to activate that.

By default those old header files are used even if there
is a newer Homebrew installation of ncurses 6.2 available.

Change also the old macro definition of NCURSES_WIDECHAR
and set it to 1 like it is done in newer versions of
curses.h when _XOPEN_SOURCE_EXTENDED=1 is defined.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index d2a9ce91f5..3ca8faa264 100644
--- a/meson.build
+++ b/meson.build
@@ -606,7 +606,11 @@ if have_system and not get_option('curses').disabled()
     endif
   endforeach
   msg = get_option('curses').enabled() ? 'curses library not found' : ''
-  curses_compile_args = ['-DNCURSES_WIDECHAR']
+  if host_machine.system() == 'darwin'
+    curses_compile_args = [ '-D_XOPEN_SOURCE_EXTENDED=1']
+  else
+    curses_compile_args = ['-DNCURSES_WIDECHAR=1']
+  endif
   if curses.found()
     if cc.links(curses_test, args: curses_compile_args, dependencies: [curses])
       curses = declare_dependency(compile_args: curses_compile_args, dependencies: [curses])
-- 
2.30.1 (Apple Git-130)


